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
import com.example.iwebproyecto.daos.AlbergueDao;
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
                ArrayList<MascotasAdopcion> list = albergueDaoRevenge.listarMascotasAdopcion(idAlbergue);
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
        System.out.println("ENTRADA AL SERVLET - MÉTODO POST");
        System.out.println("Action recibido: " + request.getParameter("action"));


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
        boolean seEncuentraTemporal= Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");

        //int albergueID = 6;
        int albergueID = (Integer) request.getSession().getAttribute("idAlbergue");

        boolean eliminado = false;

        switch (action) {
            case "create":
                Part filePart = request.getPart("foto");
                Foto foto = procesarImagen(filePart, request, response, fotoDao);

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
                mascota.setFoto(foto);
                mascota.setSeEncuentraTemporal(seEncuentraTemporal);
                mascota.setCondicionesAdopcion(condicionesAdopcion);
                Albergue albergue = new Albergue();
                albergue.setAlbergueID(albergueID);
                mascota.setAlbergue(albergue);
                mascota.setEliminado(eliminado);

                albergueDaoRevenge.crearMascotaAdopcion(mascota);
                response.sendRedirect(request.getContextPath() + "/PortalAdopciones?action=lista");
                break;
            case "edit":

                System.out.println("Editando mascota:");
                System.out.println("ID: " + request.getParameter("id"));
                System.out.println("Nombre: " + nombreMascota);
                System.out.println("Especie: " + especie);
                System.out.println("Raza: " + raza);
                System.out.println("Distrito: " + idDistrito);

                int idMascota = Integer.parseInt(request.getParameter("id"));
                MascotasAdopcion mascotaExistente = albergueDaoRevenge.obtenerMascotasAdopcionPorID(idMascota);

                // Actualizar solo los campos necesarios, manteniendo la foto original
                mascotaExistente.setNombreMascota(nombreMascota);
                mascotaExistente.setEspecie(especie);
                mascotaExistente.setRaza(raza);
                Distrito distritoExistente = new Distrito();
                distritoExistente.setDistritoID(idDistrito);
                mascotaExistente.setDistrito(distritoExistente);

                mascotaExistente.setDireccionHallazgo(direccion);
                mascotaExistente.setEdadAprox(edad);
                mascotaExistente.setSexo(sexo);
                mascotaExistente.setDescripcionGeneral(descripcion);
                mascotaExistente.setSeEncuentraTemporal(seEncuentraTemporal);
                mascotaExistente.setCondicionesAdopcion(condicionesAdopcion);

                albergueDaoRevenge.editarMascotaAdopcion(mascotaExistente);

                response.sendRedirect(request.getContextPath() + "/PortalAdopciones?action=lista");
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
            request.getRequestDispatcher("albergue/albergueEdAdop.jsp").forward(request, response);
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