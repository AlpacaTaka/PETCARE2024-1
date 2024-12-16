package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.DonacionesDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "DonSuministroServlet", value = "/SolicitudesDeSuministros")
public class DonSuministroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ?
                "lista" : request.getParameter("action");

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            DonacionesDao daoDon = new DonacionesDao();
            MascotasDao mascotasDao = new MascotasDao();

            switch (action) {
                case "lista":


                    ArrayList<DonacionSuministros> listaSolicitudes = new ArrayList();
                    ArrayList<PublicacionMascotaPerdida> listaPerdidos = mascotasDao.listarNoEncontradasYAprobadasMasDiasPerdido5();
                    listaSolicitudes = daoDon.listarDonacionesSuministros();
                    request.setAttribute("mascotasPerdidas", listaPerdidos);
                    request.setAttribute("listaSolicitudes", listaSolicitudes);
                    System.out.println(listaSolicitudes.size());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("user/solicitudesDonacionSuministros.jsp");
                    dispatcher.forward(request, response);

                    break;
                case "vista":
                    int idDonacion = Integer.valueOf(request.getParameter("id"));




                    DonacionSuministros donacionSuministros = new DonacionSuministros();
                    donacionSuministros = daoDon.obtenerSolicitudesDonacionSuministrosPorId(idDonacion);


                    request.setAttribute("donacionSuministros", donacionSuministros);
                    request.getRequestDispatcher("user/solicitudDonacionSuministros.jsp").forward(request, response);

                    break;
                case "Donacion":

                    break;
                default:

                    break;
            }
        }





    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            DonacionesDao daoDon = new DonacionesDao();
            int idUsuario = u.getUsuarioID();

            try {
                int usuarioID = idUsuario;
                int donacionSuministrosID = Integer.parseInt(request.getParameter("donacionSuministrosID"));
                System.out.println(request.getParameter("donacionSuministrosID"));
                int cantidadSuministro = Integer.parseInt(request.getParameter("cantidad"));
                System.out.println(request.getParameter("cantidad"));
                String tipoDonacion = request.getParameter("tipo-donacion");
                System.out.println(request.getParameter("tipo-donacion"));


                // Usar DateTimeFormatter para LocalDate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                System.out.println(request.getParameter("fechaEntrega"));
                LocalDate fechaDonacion = LocalDate.parse(request.getParameter("fechaEntrega"), formatter);



                Usuario usuario = new Usuario();
                usuario.setUsuarioID(usuarioID);

                DonacionSuministros donacionSuministros = new DonacionSuministros();
                donacionSuministros.setDonacionSuministrosID(donacionSuministrosID);

                UsuarioDonacionSuministro usuarioDonacion = new UsuarioDonacionSuministro();
                usuarioDonacion.setUsuario(usuario);
                usuarioDonacion.setDonacionSuministros(donacionSuministros);
                usuarioDonacion.setCantidadSuministro(cantidadSuministro);
                usuarioDonacion.setFechaDonacion(fechaDonacion);
                usuarioDonacion.setTipoDonacion(tipoDonacion);

                boolean exito = daoDon.insertarUsuarioDonacionSuministros(usuarioDonacion);

                if (exito) {
                    response.sendRedirect("SolicitudesDeSuministros");
                } else {
                    response.sendRedirect("SolicitudesDeSuministros?action=vista&id="+donacionSuministrosID+"&error=true");

                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

        }


    }
}

