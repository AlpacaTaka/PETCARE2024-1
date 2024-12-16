package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.FotoDao;
import jakarta.servlet.RequestDispatcher;
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
import java.util.ArrayList;

@WebServlet(name = "DonationTableAlbergueServlet", value = "/DonacionSuministros")
@MultipartConfig // Habilitamos el manejo de archivos en el servlet
public class DonationTableAlbergueServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads/fotosDonaciones"; // Carpeta donde se almacenarán las imágenes

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        AlbergueDao albergueDao = new AlbergueDao();
        int idAlbergue = (Integer) request.getSession().getAttribute("idAlbergue");

        Albergue albergue = albergueDao.obtenerAlberguePorID(idAlbergue);
        request.setAttribute("albergue", albergue);

        switch (action) {
            case "lista":
                ArrayList<DonacionSuministros> list = albergueDaoRevenge.listarDonacionSuministros(idAlbergue);
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/donationTable.jsp");
                rd.forward(request, response);
                break;

            case "create":
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueFormDonac.jsp").forward(request, response);
                break;

            case "edit":
                String id = request.getParameter("id");
                DonacionSuministros donacionSuministros = albergueDaoRevenge.obtenerDonacionSuministrosPorID(Integer.parseInt(id));
                request.setAttribute("donacionSuministros", donacionSuministros);
                request.getRequestDispatcher("albergue/albergueEdDonac.jsp").forward(request, response);
                break;

            case "delete":
                int idd = Integer.parseInt(request.getParameter("id"));
                albergueDaoRevenge.borrarDonacionSuministros(idd);
                response.sendRedirect(request.getContextPath() + "/DonacionSuministros");
                break;

            case "view":
                String idv = request.getParameter("id");
                DonacionSuministros donacionSuministrosv = albergueDaoRevenge.obtenerDonacionSuministrosPorID(Integer.parseInt(idv));
                request.setAttribute("donacionSuministros", donacionSuministrosv);
                request.setAttribute("idAlbergue", idAlbergue);
                request.getRequestDispatcher("albergue/albergueVisDonac.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        AlbergueDao albergueDao = new AlbergueDao();
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();
        FotoDao fotoDao = new FotoDao();
        int albergueID = (Integer) request.getSession().getAttribute("idAlbergue");
        Albergue albergue = albergueDao.obtenerAlberguePorID(albergueID);
        request.setAttribute("albergue", albergue);

        try {
            // Configurar el objeto DonacionSuministros
            DonacionSuministros donacionSuministros = new DonacionSuministros();
            donacionSuministros.setTituloAvisoDonacion(request.getParameter("titulo"));
            donacionSuministros.setCorreoElectronicoDonacion(request.getParameter("correo"));
            donacionSuministros.setTipoSuministro(request.getParameter("tipo"));
            donacionSuministros.setNombreSuministro(request.getParameter("nombreSuministro"));
            donacionSuministros.setCantidadDonacionesTotales(Integer.parseInt(request.getParameter("cantidad")));
            donacionSuministros.setMarcaSuministro(request.getParameter("marca"));
            donacionSuministros.setFechaInicioRecepcion(request.getParameter("fechaini"));
            donacionSuministros.setFechaFinRecepcion(request.getParameter("fechafin"));
            donacionSuministros.setHoraInicioRecepcion(request.getParameter("horaini"));
            donacionSuministros.setHoraFinRecepcion(request.getParameter("horafin"));
            donacionSuministros.setMensajeParaDonantes(request.getParameter("breve"));
            donacionSuministros.setAlbergue(albergue);

            // Crear una instancia de Distrito
            Distrito distrito = new Distrito();
            distrito.setDistritoID(Integer.parseInt(request.getParameter("distritoID")));
            donacionSuministros.setDistrito(distrito);

            switch (action) {
                case "create":
                    // First, process the image
                    Part filePart = request.getPart("foto");
                    Foto foto = procesarImagen(filePart, request, response, fotoDao);
                    donacionSuministros.setFoto(foto);

                    albergueDaoRevenge.crearDonacionSuministros(donacionSuministros);
                    response.sendRedirect(request.getContextPath() + "/DonacionSuministros");
                    break;

                case "edit":
                    donacionSuministros.setDonacionSuministrosID(Integer.parseInt(request.getParameter("id")));
                    albergueDaoRevenge.editarDonacionSuministros(donacionSuministros);
                    response.sendRedirect(request.getContextPath() + "/DonacionSuministros");
                    break;
            }
        } catch (Exception e) {
            System.out.println("Error al procesar la solicitud: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensajeError", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("/albergue/albergueFormDonac.jsp").forward(request, response);
        }
    }

    private Foto procesarImagen(Part filePart, HttpServletRequest request, HttpServletResponse response, FotoDao fotoDao) throws ServletException, IOException {
        // Definir una ruta fija fuera de target
        String uploadPath = getServletContext().getRealPath("/") + "uploads/fotosDonaciones";

        // Crear directorio si no existe
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Verificar si se ha seleccionado un archivo
        if (filePart == null || filePart.getSize() == 0) {
            request.setAttribute("mensajeError", "Debe seleccionar una imagen.");
            request.getRequestDispatcher("/albergue/albergueFormDonac.jsp").forward(request, response);
            return null;
        }

        // Obtener la imagen desde el formulario y generar un nombre único
        String originalFileName = filePart.getSubmittedFileName();
        String uniqueFileName = System.currentTimeMillis() + "_" + originalFileName;
        String filePath = uploadPath + File.separator + uniqueFileName;

        // Guardar la foto en la base de datos con la ruta generada
        Foto foto = new Foto();
        foto.setRutaFoto("/uploads/fotosDonaciones/" + uniqueFileName);
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
            request.getRequestDispatcher("/albergue/donationTable.jsp").forward(request, response);
            return null;
        }

        return foto;
    }
}