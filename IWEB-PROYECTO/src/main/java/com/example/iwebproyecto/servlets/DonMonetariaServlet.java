package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.DonacionMonetaria;
import com.example.iwebproyecto.beans.DonacionSuministros;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.DonacionesDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TodosLosAlbergues", value = "/TodosLosAlbergues")
public class DonMonetariaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ?
                "lista" : request.getParameter("action");

        switch (action) {
            case "lista":

                AlbergueDao albergueDao = new AlbergueDao();
                ArrayList<Albergue> listaAlbergues = albergueDao.listarAlberguesActivosAprobados();

                request.setAttribute("listaAlbergues", listaAlbergues);


                RequestDispatcher dispatcher = request.getRequestDispatcher("user/donacionMonetaria.jsp");
                dispatcher.forward(request, response);

                break;
            case "vista":
                int idAlbergue = Integer.parseInt(request.getParameter("id"));
                AlbergueDao albergueDao2 = new AlbergueDao();

                DonacionesDao donacionesDao = new DonacionesDao();
                ArrayList<DonacionSuministros> causas =donacionesDao.obtenerSolicitudesDonacionSuministrosPorIdActivo(idAlbergue);

                Albergue albergue= albergueDao2.obtenerAlberguePorID(idAlbergue);
                request.setAttribute("causas", causas);
                request.setAttribute("albergue", albergue);

                request.getRequestDispatcher("user/perfilAlbergue.jsp").forward(request, response);


                break;
            case "Donacion":

                break;
            default:

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Captura los parámetros enviados desde el formulario
            int usuarioId = 7; // Aquí deberías obtener el ID del usuario autenticado (ejemplo)

            Usuario usuario = new Usuario();
            usuario.setUsuarioID(usuarioId);

            int albergueId = Integer.parseInt(request.getParameter("albergueId"));
            Albergue albergue = new Albergue();
            albergue.setAlbergueID(albergueId);

            int monto = Integer.parseInt(request.getParameter("monto"));
            String causaIdStr = request.getParameter("causaId"); // Opcional: ID de donacionSuministros

            int causaId = causaIdStr != null && !causaIdStr.isEmpty() ? Integer.parseInt(causaIdStr) : 0;

            // Fecha actual de donación
            String fechaDonacion = java.time.LocalDate.now().toString();

            // Crear objeto DonacionMonetaria
            DonacionMonetaria donacion = new DonacionMonetaria();
            donacion.setUsuario(usuario);
            donacion.setAlbergue(albergue);
            donacion.setCantidadMonetaria(monto);
            donacion.setDonacionSuministrosID(causaId != 0 ? causaId : null);
            donacion.setFechaDonacionMonetaria(fechaDonacion);

            // Llamar al metodo DAO para guardar la donación
            DonacionesDao donacionesDao = new DonacionesDao();
            boolean exito = donacionesDao.guardarDonacionMonetaria(donacion);

            if (exito) {
                response.sendRedirect("TodosLosAlbergues?action=vista&id="+albergueId+"&mensaje=success");
            } else {
                response.sendRedirect("TodosLosAlbergues?action=lista&mensaje=error");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("TodosLosAlbergues?action=lista&mensaje=error");
        }






    }
}

