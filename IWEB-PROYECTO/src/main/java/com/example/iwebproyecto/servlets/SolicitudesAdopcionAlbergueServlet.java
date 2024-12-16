package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.FotoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

@WebServlet(name = "SolicitudesAdopcionAlbergueServlet", value = "/SolicitudesDeAdopcion")
@MultipartConfig
public class SolicitudesAdopcionAlbergueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        AlbergueDao albergueDao = new AlbergueDao();
        int idAlbergue= (Integer) request.getSession().getAttribute("idAlbergue");
        Albergue albergue = albergueDao.obtenerAlberguePorID(idAlbergue);
        request.setAttribute("albergue", albergue);
        switch (action) {
            case "lista":
                Collection<UsuarioAdopcion> lista = albergueDaoRevenge.listaUsuarioAdopcion(idAlbergue);
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("albergue/solicitudesAdopcion.jsp").forward(request, response);
                break;
            case "accept":
                int usuarioAdopcionID= Integer.parseInt(request.getParameter("id"));
                int idAdopcion=Integer.parseInt(request.getParameter("idAdopcion"));
                albergueDaoRevenge.AdopcionAprobar(usuarioAdopcionID, idAdopcion, true);
                response.sendRedirect(request.getContextPath() + "/SolicitudesDeAdopcion");
                break;
            case "decline":
                int usuarioAdopcionIDdecline = Integer.parseInt(request.getParameter("id"));
                int idAdopcionDecline = Integer.parseInt(request.getParameter("idAdopcion"));
                albergueDaoRevenge.AdopcionAprobar(usuarioAdopcionIDdecline, idAdopcionDecline, false);
                response.sendRedirect(request.getContextPath() + "/SolicitudesDeAdopcion");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Obtener los parámetros del formulario
        String action = request.getParameter("action");
        String nombreMascota = request.getParameter("nombreMascota");
        String especie = request.getParameter("especie");
        String raza = request.getParameter("raza");
        String otraRaza = request.getParameter("otraRaza");
        raza = (raza.equalsIgnoreCase("Otro") && otraRaza != null && !otraRaza.isEmpty()) ? otraRaza : raza;

        int edad = Integer.parseInt(request.getParameter("edad"));
        String sexo = request.getParameter("sexoMascota");
        String descripcion = request.getParameter("breveDescripcion");
        boolean seEncuentraTemporal = Boolean.parseBoolean(request.getParameter("hogarTemp"));
        String condicionesAdopcion = request.getParameter("condiciones");

        int idDistrito = Integer.parseInt(request.getParameter("idDistrito"));
        String direccion = request.getParameter("direccionHallazgo");
        int idAlbergue = (Integer) request.getSession().getAttribute("idAlbergue");

        // Crear objeto MascotasAdopcion
        MascotasAdopcion mascota = new MascotasAdopcion();
        mascota.setNombreMascota(nombreMascota);
        mascota.setEspecie(especie);
        mascota.setRaza(raza.toUpperCase());
        mascota.setEdadAprox(edad);
        mascota.setSexo(sexo);
        mascota.setDescripcionGeneral(descripcion);

        Distrito distrito = new Distrito();
        distrito.setDistritoID(idDistrito);
        mascota.setDistrito(distrito);
        mascota.setDireccionHallazgo(direccion);

        Albergue albergue = new Albergue();
        albergue.setAlbergueID(idAlbergue);
        mascota.setAlbergue(albergue);

        mascota.setSeEncuentraTemporal(seEncuentraTemporal);
        mascota.setCondicionesAdopcion(condicionesAdopcion);
        mascota.setEliminado(false);

        // Procesar la foto
        FotoDao fotoDao = new FotoDao();

        // Ruta base para almacenamiento de imágenes
        String uploadPath = getServletContext().getRealPath("/") + "uploads/fotosMascotasAdopcion";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Obtener la imagen desde el formulario
        Part filePart = request.getPart("fotoMascota");
        if (filePart != null && filePart.getSize() > 0) {
            String originalFileName = filePart.getSubmittedFileName();
            String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
            String filePath = uploadPath + File.separator + uniqueFileName;

            // Guardar la imagen en el servidor
            try (InputStream inputStream = filePart.getInputStream();
                 FileOutputStream outputStream = new FileOutputStream(filePath)) {

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                System.out.println("Imagen guardada exitosamente en: " + filePath);
            }

            // Guardar la foto en la base de datos
            Foto foto = new Foto();
            foto.setRutaFoto("/uploads/fotosMascotasAdopcion/" + uniqueFileName);
            fotoDao.GuadarFoto(foto);
            mascota.setFoto(foto);
        } else {
            System.out.println("No se subió ninguna imagen.");
        }

        // Guardar la mascota en la base de datos
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();

        if ("create".equals(action)) {
            albergueDaoRevenge.crearMascotaAdopcion(mascota);
            System.out.println("Mascota creada exitosamente.");
        } else if ("edit".equals(action)) {
            mascota.setIdAdopcion(Integer.parseInt(request.getParameter("id")));
            albergueDaoRevenge.editarMascotaAdopcion(mascota);
            System.out.println("Mascota editada exitosamente.");
        }

        response.sendRedirect(request.getContextPath() + "/PortalAdopciones");
    }
}