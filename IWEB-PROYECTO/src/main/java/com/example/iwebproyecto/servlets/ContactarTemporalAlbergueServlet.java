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
            case "create":
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueFormAdop.jsp").forward(request,response);
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
        int idDistrito = Integer.parseInt(request.getParameter("idDistrito"));
        String direccion = request.getParameter("direccionHallazgo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexoMascota");
        String descripcion = request.getParameter("breveDescripcion");
        int idFoto = 30;/*request.getParameter("rutaFoto");*/
        boolean seEncuentraTemporal= Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");
        int albergueID = 6;/*Integer.parseInt(request.getParameter("idAlbergue"));*/
        boolean eliminado = false;
        MascotasAdopcion mascota = new MascotasAdopcion();
        mascota.setNombreMascota(nombreMascota);
        mascota.setEspecie(especie);
        mascota.setRaza(raza);
        Distrito distrito = new Distrito();
        distrito.setDistritoID(idDistrito);
        mascota.setDistrito(distrito);
        mascota.setDireccionHallazgo(direccion);
        mascota.setEdadAprox(edad);
        mascota.setSexo(sexo);
        mascota.setDescripcionGeneral(descripcion);
        Foto foto = new Foto();
        foto.setFotoID(idFoto);
        mascota.setFoto(foto);
        mascota.setSeEncuentraTemporal(seEncuentraTemporal);
        mascota.setCondicionesAdopcion(condicionesAdopcion);
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(albergueID);
        mascota.setAlbergue(albergue);
        mascota.setEliminado(eliminado);
        switch (action) {
            case "create":
                albergueDaoRevenge.crearMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
                break;
            case "edit":
                mascota.setIdAdopcion(Integer.parseInt(request.getParameter("id")));
                albergueDaoRevenge.editarMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
                break;
        }
    }
}