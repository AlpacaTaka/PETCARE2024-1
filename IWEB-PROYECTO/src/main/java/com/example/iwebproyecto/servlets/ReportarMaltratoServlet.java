package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.DenunciaMaltrato;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.DenunciaMaltratoDao;
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

import java.time.LocalDate;

@WebServlet(name = "ReportarMaltratoServlet", value = "/ReportarMaltrato")
@MultipartConfig
public class ReportarMaltratoServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            int idUsuario = u.getUsuarioID();


            DenunciaMaltrato denu = new DenunciaMaltrato();
            Usuario usuario = new Usuario();
            usuario.setUsuarioID(idUsuario);
            denu.setUsuario(usuario);
            denu.setTamanio(request.getParameter("tamanio"));
            denu.setEspecie(request.getParameter("Especie"));
            if ("otro".equals(request.getParameter("Raza"))){
                denu.setRaza(request.getParameter("otra-raza"));
            }else{
                denu.setRaza(request.getParameter("Raza"));
            }
            if ("Otro".equals(request.getParameter("tipo-maltrato"))){
                denu.setTipoMaltrato(request.getParameter("otro-maltrato"));
            }else{
                denu.setTipoMaltrato(request.getParameter("tipo-maltrato"));
            }
            denu.setNombreApellidoMaltratador(request.getParameter("Nombre-maltratador"));
            denu.setDireccion(request.getParameter("Direccion"));
            if ("si".equals(request.getParameter("flexRadioDefault"))) {
                denu.setRealizoDenuncia(true);
            } else if ("no".equals(request.getParameter("flexRadioDefault"))) {
                denu.setRealizoDenuncia(false);
            }


            // Establece la fecha actual directamente como LocalDate
            LocalDate fechaActual = LocalDate.now();
            denu.setFechaFormulario(fechaActual); // Asigna directamente el objeto LocalDate


            FotoDao fotoDao = new FotoDao();
            // Definir una ruta fija fuera de target
            //Si van a probarlo alguno de ustedes deben de cambiar la ruta o les lanzará error.
            String uploadPath = getServletContext().getRealPath("/") + "uploads/fotosMaltrato";

            // Crear directorio si no existe
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Obtener la imagen desde el formulario y generar un nombre único
            Part filePart = request.getPart("imagen");
            String originalFileName = filePart.getSubmittedFileName();
            String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
            String filePath = uploadPath + File.separator + uniqueFileName;

            // Guardar la foto en la base de datos con la ruta generada
            Foto foto = new Foto();
            foto.setRutaFoto("/uploads/fotosMaltrato/" + uniqueFileName);
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
            }

            // Aquí puedes asociar la foto a la denuncia y guardarlo en la base de datos
            denu.setFoto(foto);
            DenunciaMaltratoDao dDao = new DenunciaMaltratoDao();
            dDao.RegistrarDenunciaMaltrato(denu);



            response.sendRedirect("Inicio");
        }







    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            request.getRequestDispatcher("/user/reportarMaltrato.jsp").forward(request, response);
        }



    }
}
