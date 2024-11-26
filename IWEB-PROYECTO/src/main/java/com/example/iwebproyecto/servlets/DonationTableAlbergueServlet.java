package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DonationTableAlbergueServlet", value = "/DonacionSuministros")
public class DonationTableAlbergueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        int idAlbergue= 6;

        switch (action) {
            case "lista":
                ArrayList<DonacionSuministros> list = albergueDaoRevenge.listarDonacionSuministros();
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/donationTable.jsp");
                rd.forward(request, response);
                break;
            case "create":
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueFormDonac.jsp").forward(request,response);
                break;
            case "edit":
                String id = request.getParameter("id");
                /*Pelicula pelicula = peliculaDao.buscarPorId(Integer.parseInt(id));

                if(pelicula != null){
                    request.setAttribute("pelicula",pelicula);
                    request.getRequestDispatcher("viewPelicula.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/PeliculasServlet");DetallesServlet
                }*/
                DonacionSuministros donacionSuministros = albergueDaoRevenge.obtenerDonacionSuministrosPorID(Integer.parseInt(id));
                request.setAttribute("donacionSuministros",donacionSuministros);
                request.getRequestDispatcher("albergue/albergueEdDonac.jsp").forward(request,response);
                break;
            case "delete":
                int idd = Integer.parseInt(request.getParameter("id"));
                /*MascotasAdopcion mascotasAdopcion = albergueDaoRevenge.buscarPorId(idd);
                if(pell != null){
                    try {
                        albergueDaoRevenge.borrarMascotaAdopcion(idd);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }*/
                albergueDaoRevenge.borrarDonacionSuministros(idd);
                response.sendRedirect(request.getContextPath() + "/DonacionSuministros");
                break;
            case "view":
                String idv = request.getParameter("id");
                DonacionSuministros donacionSuministrosv = albergueDaoRevenge.obtenerDonacionSuministrosPorID(Integer.parseInt(idv));
                request.setAttribute("donacionSuministros",donacionSuministrosv);
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueVisDonac.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        int albergueID = 6;/*Integer.parseInt(request.getParameter("id"));*/
        int distritoID = Integer.parseInt(request.getParameter("distritoID"));
        String titulo = request.getParameter("titulo");
        String correo = request.getParameter("correo");
        String tipo = request.getParameter("tipo");
        String nombreSuministro = request.getParameter("nombreSuministro");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        String marca = request.getParameter("marca");
        String fechaini = request.getParameter("fechaini");
        String fechafin = request.getParameter("fechafin");
        String horaini = request.getParameter("horaini");
        String horafin = request.getParameter("horafin");
        String breve = request.getParameter("breve");
        int idFoto = 30;/*request.getParameter("rutaFoto");*/
        boolean eliminado = false;
        DonacionSuministros donacionSuministros = new DonacionSuministros();
        donacionSuministros.setTituloAvisoDonacion(titulo);
        donacionSuministros.setCorreoElectronicoDonacion(correo);
        donacionSuministros.setTipoSuministro(tipo);
        donacionSuministros.setNombreSuministro(nombreSuministro);
        donacionSuministros.setCantidadDonacionesTotales(cantidad);
        String marca1=marca.isEmpty() ? "Any" : marca;
        donacionSuministros.setMarcaSuministro(marca1);
        Distrito distrito = new Distrito();
        distrito.setDistritoID(distritoID);
        donacionSuministros.setDistrito(distrito);
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(albergueID);
        donacionSuministros.setAlbergue(albergue);
        donacionSuministros.setFechaInicioRecepcion(fechaini);
        donacionSuministros.setFechaFinRecepcion(fechafin);
        donacionSuministros.setHoraInicioRecepcion(horaini);
        donacionSuministros.setHoraFinRecepcion(horafin);
        donacionSuministros.setMensajeParaDonantes(breve);
        Foto foto = new Foto();
        foto.setFotoID(idFoto);
        donacionSuministros.setFoto(foto);
        donacionSuministros.setEliminado(eliminado);
        switch (action) {
            case "create":
                albergueDaoRevenge.crearDonacionSuministros(donacionSuministros);
                response.sendRedirect(request.getContextPath()+"/DonacionSuministros");
                break;
            case "edit":
                donacionSuministros.setDonacionSuministrosID(Integer.parseInt(request.getParameter("id")));
                albergueDaoRevenge.editarDonacionSuministros(donacionSuministros);
                response.sendRedirect(request.getContextPath()+"/DonacionSuministros");
                break;
        }
    }
}