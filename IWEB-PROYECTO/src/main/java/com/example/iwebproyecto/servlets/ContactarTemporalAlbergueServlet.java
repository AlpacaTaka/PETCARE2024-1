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

@WebServlet(name = "ContactarTemporalAlbergueServlet", value = "/HogaresTemporalesAlbergue")
public class ContactarTemporalAlbergueServlet extends HttpServlet {

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
                ArrayList<SolicitudTemporal> list = albergueDaoRevenge.listaDeHogaresTemporales();
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/contactarTemporal.jsp");
                rd.forward(request, response);
                break;
            case "send":
                request.setAttribute("idUser", request.getParameter("id"));
                request.getRequestDispatcher("albergue/albergueFormTemporal.jsp").forward(request,response);
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
                MascotasAdopcion mascotasAdopcion = albergueDaoRevenge.obtenerMascotasAdopcionPorID(Integer.parseInt(id));
                request.setAttribute("mascota",mascotasAdopcion);
                request.getRequestDispatcher("albergue/albergueEdAdop.jsp").forward(request,response);
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
                albergueDaoRevenge.borrarMascotaAdopcion(idd);
                response.sendRedirect(request.getContextPath() + "/PortalAdopciones");
                break;
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String nombreMascota = request.getParameter("nombreMascota");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        raza=raza.toUpperCase().charAt(0)+raza.substring(1,raza.length());
        String otraRaza = request.getParameter("otraRaza");
        if (raza.equals("Otro")) {
            raza=otraRaza;
        }
        if (raza.isEmpty()){
            raza="Fermosa";
        }
        String tamanio = request.getParameter("tamanio");
        int peso = Integer.parseInt(request.getParameter("peso"));
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("flexRadioDefault");
        boolean posee = request.getParameter("posee").equals("si");
        String discapacidad = request.getParameter("discapacidad");
        discapacidad = discapacidad==null ? "No tiene" : discapacidad;
        int albergueID = 6;/*Integer.parseInt(request.getParameter("idAlbergue"));*/
        MascotasTemporal mascotasTemporal = new MascotasTemporal();
        mascotasTemporal.setNombreMascotaTemporal(nombreMascota);
        mascotasTemporal.setEspecie(especie);
        mascotasTemporal.setRaza(raza);
        mascotasTemporal.setTamanio(tamanio);
        mascotasTemporal.setPeso(peso);
        mascotasTemporal.setEdad(edad);
        mascotasTemporal.setSexo(sexo);
        mascotasTemporal.setPoseeDiscapacidad(posee);
        mascotasTemporal.setDescripcionDiscapacidad(discapacidad);
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(albergueID);
        mascotasTemporal.setAlbergue(albergue);
        Foto foto = new Foto();
        foto.setFotoID(30);
        mascotasTemporal.setFoto(foto);
        switch (action) {
            case "send":
                albergueDaoRevenge.enviarMascotaTemporal(mascotasTemporal,idUser);
                response.sendRedirect(request.getContextPath()+"/HogaresTemporalesAlbergue");
                break;
        }
    }
}