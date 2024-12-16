package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SolicitudesAdopcionAlbergueServlet", value = "/SolicitudesDeAdopcion")
public class SolicitudesAdopcionAlbergueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        AlbergueDao albergueDao = new AlbergueDao();
        int idAlbergue= (Integer) request.getSession().getAttribute("idAlbergue");
        Albergue albergue = albergueDao.obtenerAlberguePorID(idAlbergue);
        request.setAttribute("albergue", albergue);
        switch (action) {
            case "lista":
                ArrayList<UsuarioAdopcion> list = albergueDaoRevenge.listaUsuarioAdopcion(idAlbergue);
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/solicitudesAdopcion.jsp");
                rd.forward(request, response);
                break;
            case "accept":
                int usuarioAdopcionID= Integer.parseInt(request.getParameter("id"));
                int idAdopcion= Integer.parseInt(request.getParameter("idAdopcion"));
                albergueDaoRevenge.AdopcionAprobar(usuarioAdopcionID,idAdopcion,true);
                response.sendRedirect(request.getContextPath() + "/SolicitudesDeAdopcion");
                break;
            case "decline":
                int usuarioAdopcionIDdecline= Integer.parseInt(request.getParameter("id"));
                int idAdopcionDecline= Integer.parseInt(request.getParameter("idAdopcion"));
                albergueDaoRevenge.AdopcionAprobar(usuarioAdopcionIDdecline,idAdopcionDecline,false);
                response.sendRedirect(request.getContextPath() + "/SolicitudesDeAdopcion");
                break;
            /*case "decline":
                String id = request.getParameter("id");
                UsuarioAdopcion usuarioAdopcion = albergueDaoRevenge.obtenerMascotasAdopcionPorID(id);
                if(usuarioAdopcion != null) {
                    try{
                        albergueDaoRevenge.AdopcionAprobar();
                    }
                }
                break;*/
                /*Pelicula pelicula = peliculaDao.buscarPorId(Integer.parseInt(id));

                if(pelicula != null){
                    request.setAttribute("pelicula",pelicula);
                    request.getRequestDispatcher("viewPelicula.jsp").forward(request,response);
                }else{
                    response.sendRedirect(request.getContextPath() + "/PeliculasServlet");DetallesServlet
                }
                MascotasAdopcion mascotasAdopcion = albergueDaoRevenge.obtenerMascotasAdopcionPorID(Integer.parseInt(id));
                request.setAttribute("mascota",mascotasAdopcion);
                request.getRequestDispatcher("albergue/albergueEdAdop.jsp").forward(request,response);
                break;
            case "delete":
                int idd = Integer.parseInt(request.getParameter("id"));
                MascotasAdopcion mascotasAdopcion = albergueDaoRevenge.buscarPorId(idd);
                if(pell != null){
                    try {
                        albergueDaoRevenge.borrarMascotaAdopcion(idd);
                    } catch (SQLException e) {
                        System.out.println("Log: excepcion: " + e.getMessage());
                    }
                }
                albergueDaoRevenge.borrarMascotaAdopcion(idd);
                response.sendRedirect(request.getContextPath() + "/PortalAdopciones");
                break;*/
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();

        // Ruta base para almacenamiento de imágenes
        String uploadPath = getServletContext().getRealPath("/uploads/fotosMascotasAdopcion");
        System.out.println("Ruta de carga: " + uploadPath);
        java.io.File uploadDir = new java.io.File(uploadPath);

        // Crear el directorio 'fotos' si no existe
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        int idFoto = -1; // El ID de la foto en DB (si aplica)
        String nombreArchivo = "";

        for (Part part : request.getParts()) {
            // Identificar la parte correspondiente al archivo cargado
            if (part.getName().equals("fotoMascota") && part.getSize() > 0) {
                nombreArchivo = java.nio.file.Paths.get(part.getSubmittedFileName()).getFileName().toString();
                part.write(uploadPath + java.io.File.separator + nombreArchivo);
            }
        }

        // Crea la URL para guardar la imagen en la base de datos
        String rutaFoto = "uploads/fotosMascotasAdopcion/" + nombreArchivo;


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
        boolean seEncuentraTemporal= Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");
        int albergueID = (Integer) request.getSession().getAttribute("idAlbergue");
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

        // Asigna la ruta de la imagen al objeto
        Foto foto = new Foto();
        foto.setRutaFoto(rutaFoto); // Asume que existe un setter para la ruta
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