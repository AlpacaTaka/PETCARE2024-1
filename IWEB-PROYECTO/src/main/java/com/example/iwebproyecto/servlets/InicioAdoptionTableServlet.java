package com.example.iwebproyecto.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.FotoDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;

@WebServlet(name = "InicioAlbergueServlet", value = "/PortalAdopciones")
@MultipartConfig
public class InicioAdoptionTableServlet extends HttpServlet {

    private static final int ALBERGUE_ID = 6;


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
                ArrayList<MascotasAdopcion> list = albergueDaoRevenge.listarMascotasAdopcion();
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/adoptionTable.jsp");
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

            case "view":
                String idv = request.getParameter("id");
                MascotasAdopcion mascotasAdopcionv = albergueDaoRevenge.obtenerMascotasAdopcionPorID(Integer.parseInt(idv));
                request.setAttribute("mascota",mascotasAdopcionv);
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueVisAdop.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        FotoDao fotoDao = new FotoDao();
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        System.out.println("Debug: All Parameters:");
        for (String paramName : request.getParameterMap().keySet()) {
            System.out.println(paramName + ": " + request.getParameter(paramName));
        }

        String nombreMascota = request.getParameter("nombreMascota");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        if (raza == null) {
            raza = ""; // Default to empty string if null
        }
        raza = raza.trim().toUpperCase(); // Trim whitespace first
        if (raza.isEmpty()) {
            raza = "Fermosa"; // Your default value
        } else {
            raza = raza.charAt(0) + raza.substring(1).toLowerCase();
        }

        String otraRaza = request.getParameter("otraRaza");
        if (raza.equals("OTRO")) {
            raza = otraRaza != null ? otraRaza : "Fermosa";
        }
        int idDistrito = Integer.parseInt(request.getParameter("distrito"));
        String direccion = request.getParameter("direccionHallazgo");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexoMascota");
        String descripcion = request.getParameter("breveDescripcion");
        int idFoto = 30;/*request.getParameter("rutaFoto");*/
        boolean seEncuentraTemporal= Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");
        int albergueID = 6;
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
        Part filePart = request.getPart("foto");
        Foto foto = procesarImagen(filePart, request, response, fotoDao);
        mascota.setFoto(foto);
        mascota.setSeEncuentraTemporal(seEncuentraTemporal);
        mascota.setCondicionesAdopcion(condicionesAdopcion);
        Albergue albergue = new Albergue();
        albergue.setAlbergueID(albergueID);
        mascota.setAlbergue(albergue);
        mascota.setEliminado(eliminado);

        if (filePart != null) {
            System.out.println("File Part Details:");
            System.out.println("Size: " + filePart.getSize());
            System.out.println("Content Type: " + filePart.getContentType());
            System.out.println("Submitted File Name: " + filePart.getSubmittedFileName());
        }

        switch (action) {
            case "create":
                albergueDaoRevenge.crearMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath() + "/PortalAdopciones?action=lista");
                break;
            case "edit":
                mascota.setIdAdopcion(Integer.parseInt(request.getParameter("id")));
                albergueDaoRevenge.editarMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
                break;
        }
    }

    private Foto procesarImagen(Part filePart, HttpServletRequest request, HttpServletResponse response, FotoDao fotoDao) throws ServletException, IOException {
        // Definir una ruta fija fuera de target
        String uploadPath = "C:/Users/omarr/Desktop/PETCARE2024-1/IWEB-PROYECTO/src/main/webapp/uploads/fotosMascotasAdopcion";

        // Crear directorio si no existe
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Verificar si se ha seleccionado un archivo
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("mensajeError", "Debe seleccionar una imagen.");
            request.getRequestDispatcher("/albergue/albergueFormAdop.jsp").forward(request, response);
            return null;
        }

        // Obtener la imagen desde el formulario y generar un nombre único
        String originalFileName = filePart.getSubmittedFileName();
        String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
        String filePath = uploadPath + File.separator + uniqueFileName;

        // Guardar la foto en la base de datos con la ruta generada
        Foto foto = new Foto();
        foto.setRutaFoto("/uploads/fotosMascotasAdopcion/" + uniqueFileName);
        fotoDao.GuadarFoto(foto);

        // Guardar el archivo en el sistema de archivos
        try (InputStream inputStream = filePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            System.out.println("Imagen guardada exitosamente en: " + filePath);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensajeError", "Error al guardar la imagen: " + e.getMessage());
            request.getRequestDispatcher("/albergue/albergueFormAdop.jsp").forward(request, response);
            return null;
        }

        return foto;
    }


}