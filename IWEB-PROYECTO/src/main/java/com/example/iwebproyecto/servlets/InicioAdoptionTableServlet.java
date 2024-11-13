package com.example.iwebproyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "InicioAlbergueServlet", value = "/PortalAdopciones")
public class InicioAdoptionTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();


        switch (action) {
            case "lista":
                ArrayList<MascotasAdopcion> list = albergueDaoRevenge.listarMascotasAdopcion();
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/adoptionTable.jsp");
                rd.forward(request, response);
                break;
            case "create":
                int idAlbergue= 1;
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueFormAdop.jsp").forward(request,response);
                break;
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();

        switch (action) {

            case "create":
                /*String nombreMascota=request.getParameter("nombreMascota");
                String especieMascota=request.getParameter("especie");
                String raza=request.getParameter("raza");
                String otraRaza=request.getParameter("otraRaza");
                int distritoID=Integer.parseInt(request.getParameter("distritoID"));
                int fotoID=147;

                String distritoID=request.getParameter("distritoID");
                String direccionHallazgo=request.getParameter("direccionHallazgo");
                String edadAprox=request.getParameter("edadAprox");
                String sexo=request.getParameter("sexo");
                String descripcionGeneral=request.getParameter("descripcionGeneral");
                String fotoID=request.getParameter("fotoID");
                String seEncuentraTemporal=request.getParameter("seEncuentraTemporal");

                int idAlbergue= Integer.parseInt(request.getParameter("id"));
                int idActor = actorDao.ultimoID()+1;
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                int anoNacimiento = Integer.parseInt(request.getParameter("anoNacimiento"));
                int premioOscar = Integer.parseInt(request.getParameter("premioOscar"));

                Actor actor = new Actor();
                actor.setIdActor(idActor);
                actor.setNombre(nombre);
                actor.setApellido(apellido);
                actor.setAnoNacimiento(anoNacimiento);
                actor.setPremioOscar(premioOscar);

                actorDao.crearActor(actor,idPelicula);
                response.sendRedirect(request.getContextPath()+"/ActorServlet?action=read&id="+idPelicula);
                break;*/
        }
    }
}