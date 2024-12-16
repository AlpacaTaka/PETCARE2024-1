package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.FotoDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostulacionTemporalServlet", value = "/PostulacionTemporal")
@MultipartConfig
public class PostulacionTemporalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ?
                "form" : request.getParameter("action");

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("UsuarioSession");

        if (usuario == null) {
            // Si no hay usuario en sesión, redirige al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            switch (action) {
                case "form":

                    RequestDispatcher dispatcher = request.getRequestDispatcher("user/postularTemporal.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "lista":
                    request.getRequestDispatcher("user/misSolicitudesTemporales.jsp").forward(request, response);
                    break;
                case "ver":
                    break;
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("UsuarioSession");

        if (usuario == null) {
            // Si no hay usuario en sesión, redirige al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            // 1. Crear la solicitud
            SolicitudTemporal solicitud = new SolicitudTemporal();
            solicitud.setUsuario(usuario);
            solicitud.setEdad(Integer.parseInt(request.getParameter("edad")));

            solicitud.setGenero(request.getParameter("genero"));

            solicitud.setCelular(request.getParameter("celular"));

            solicitud.setCantidadCuartos(Integer.parseInt(request.getParameter("cantidadCuartos")));

            solicitud.setMetrajeVivienda(Integer.parseInt(request.getParameter("metraje-casa")));

            solicitud.setNombrePersonaReferencia(request.getParameter("Nombre-referncia"));
            solicitud.setNumeroContactoPR(request.getParameter("celular-referencia"));
            solicitud.setTiempoTemporal(Integer.parseInt(request.getParameter("tiempoTemporal")));
            solicitud.setInicioTemporal(request.getParameter("fechaInicio"));
            solicitud.setFinTemporal(request.getParameter("fechaFin"));
            solicitud.setFecha(LocalDate.now().toString());

            // 2. Procesar archivos subidos
            FotoDao fotoDao = new FotoDao();
            ArrayList<Foto> fotos = new ArrayList<>();
            String uploadPath = getServletContext().getRealPath("/") + "uploads/PostulacionesTemporal";

            // Crear el directorio si no existe
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            for (Part part : request.getParts()) {
                if (part.getName().equals("fotos") && part.getSize() > 0) {
                    String originalFileName = part.getSubmittedFileName();
                    String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
                    String filePath = uploadPath + File.separator + uniqueFileName;

                    // Guardar archivo en el sistema de archivos
                    try (InputStream inputStream = part.getInputStream();
                         FileOutputStream outputStream = new FileOutputStream(filePath)) {

                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }

                        // Crear objeto Foto y guardar en base de datos
                        Foto foto = new Foto();
                        foto.setRutaFoto("/uploads/solicitudes/" + uniqueFileName);
                        fotoDao.GuadarFoto(foto); // Guarda la foto en la BD
                        fotos.add(foto);  // Añade al listado de fotos
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }

            // 3. Asociar las fotos a la solicitud
            if (fotos.size() > 0) solicitud.setFoto(fotos.get(0));
            if (fotos.size() > 1) solicitud.setFoto2(fotos.get(1));
            if (fotos.size() > 2) solicitud.setFoto3(fotos.get(2));

            // 4. Guardar la solicitud en la base de datos
            SolicitudesHogarTemporalDao solicitudDao = new SolicitudesHogarTemporalDao();
            boolean exito = solicitudDao.guardarSolicitudTemporal(solicitud);

            // 5. Redirigir según el resultado
            if (exito) {
                response.sendRedirect("user/confirmacion.jsp");
            } else {
                request.setAttribute("error", "Ocurrió un error al guardar la solicitud.");
                request.getRequestDispatcher("user/postularTemporal.jsp").forward(request, response);
            }
        }






    }
}

