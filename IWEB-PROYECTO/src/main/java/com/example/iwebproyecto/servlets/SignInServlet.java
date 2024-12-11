package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.DistritoDao;
import com.example.iwebproyecto.daos.FotoDao;
import com.example.iwebproyecto.daos.LoginDao;
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
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet(name = "SignInServlet", value = "/SignIn")
@MultipartConfig
public class SignInServlet extends HttpServlet {
    FotoDao fotoDao = new FotoDao();
    Usuario usuario = new Usuario();
    DistritoDao distritoDao = new DistritoDao();
    LoginDao signup = new LoginDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        try {
            switch (action) {
                case "signInUser":
                    //Campos form
                    String nombre = request.getParameter("nombre-login");
                    String apellido = request.getParameter("apellido-login");
                    String dni = request.getParameter("dni-login");
                    String direccion = request.getParameter("direccion-login");
                    String correoElectronico = request.getParameter("email-login");
                    Integer distrito = Integer.parseInt(request.getParameter("distrito"));
                    Part filePart = request.getPart("foto");
                    Foto foto = procesarImagen(filePart, request, response, fotoDao);
                    if (foto == null) return;

                    System.out.println("Nombres: " + nombre);
                    System.out.println("Apellidos: " + apellido);
                    System.out.println("Dni: " + dni);
                    System.out.println("Direccion: " + direccion);
                    System.out.println("Correo: " + correoElectronico);
                    System.out.println("Distrito: " + distrito);



                    usuario.setNombre(nombre);
                    usuario.setApellido(apellido);
                    usuario.setDni(dni);
                    usuario.setDireccion(direccion);
                    usuario.setDistrito(distritoDao.obtenerDistritoPorId(distrito));
                    usuario.setCorreoElectronico(correoElectronico);
                    usuario.setActivo(false);
                    usuario.setFechaRegistrado(LocalDate.ofEpochDay(2024-12-11));// problema
                    usuario.setEliminado(false);

                    signup.SignInUser(usuario);

                    response.sendRedirect(request.getContextPath() + "/login/login.jsp");
                    break;

                case "signInAlbergue":
                    //Campos form

                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensajeError", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
        }

    }

    private Foto procesarImagen(Part filePart, HttpServletRequest request, HttpServletResponse response, FotoDao
            fotoDao) throws ServletException, IOException {
        // Definir una ruta fija fuera de target
        String uploadPath = "D:/Ciclo 2 FACI-PUCP/IWEB/PETCARE2024-1/IWEB-PROYECTO/src/main/webapp/uploads/fotosSignUpUser";

        // Crear directorio si no existe
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Verificar si se ha seleccionado un archivo
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("mensajeError", "Debe seleccionar una imagen.");
            request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
            return null;
        }

        // Obtener la imagen desde el formulario y generar un nombre único
        String originalFileName = filePart.getSubmittedFileName();
        String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
        String filePath = uploadPath + File.separator + uniqueFileName;

        // Guardar la foto en la base de datos con la ruta generada
        Foto foto = new Foto();
        foto.setRutaFoto("/uploads/fotosEvento/" + uniqueFileName);
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
            request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
            return null;
        }

        return foto;
    }
}
