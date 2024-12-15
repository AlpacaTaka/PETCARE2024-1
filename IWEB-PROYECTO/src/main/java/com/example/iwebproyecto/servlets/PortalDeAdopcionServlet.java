package com.example.iwebproyecto.servlets;
import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.beans.Services.EmailService;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(name = "PortalDeAdopcionServlet", value = "/PortalDeAdopcion")
public class PortalDeAdopcionServlet extends HttpServlet {
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // Establece el tipo de contenido de la respuesta

         response.setContentType("text/html");



         String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

         switch (action){
            case "lista"://voy a crear un nuevo trabajo


               MascotasDao mascotasDao = new MascotasDao();
               ArrayList<MascotasAdopcion> listaMascotasAdopcion= mascotasDao.listarMascotasActivasAdopcion();
               System.out.println("Lista de Adopciones: " + listaMascotasAdopcion.size() + " elementos.");
               request.setAttribute("listaAdopcion", listaMascotasAdopcion);

               // Obtiene el RequestDispatcher para la página JSP

               RequestDispatcher rd = request.getRequestDispatcher("user/solicitudesAdopcion.jsp");

               // Reenvía la solicitud y la respuesta al JSP
               rd.forward(request, response);
               break;
            case "vista":


               int idUsuario = 7;

               int idMascAdopt = Integer.parseInt(request.getParameter("id"));
               MascotasDao mascotasDao2 = new MascotasDao();

               boolean estaInscrito = mascotasDao2.verificarInscripcion(idUsuario, idMascAdopt);
               request.setAttribute("estaInscrito", estaInscrito);

               MascotasAdopcion mascota =mascotasDao2.getMascotasAdopcionPorId(idMascAdopt);
               request.setAttribute("mascota", mascota);

               request.getRequestDispatcher("user/solicitudAdopcion.jsp").forward(request, response);

               break;
            case "s":


               break;
         }


      }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      EmailService emailService = new EmailService();
      int idUsuario = 7;
      MascotasDao mascotasDao = new MascotasDao();



      try {
         int usuarioID = idUsuario;
         int idMascota = Integer.parseInt(request.getParameter("idMascota"));
         String nombreMascota = request.getParameter("nombreMascota");


         // Verificar si ya está inscrito
         if (mascotasDao.verificarInscripcion(idUsuario, idMascota)) {
            response.sendRedirect("PortalDeAdopcion?action=vista&id=" + idMascota + "&error=ya_inscrito");
            return;
         }


         UsuarioAdopcion usuarioAdopcion = new UsuarioAdopcion();
         Usuario usuario = new Usuario();
         usuario.setUsuarioID(idUsuario);
         usuarioAdopcion.setUsuario(usuario);

         MascotasAdopcion mascotaAdopcion = new MascotasAdopcion();
         mascotaAdopcion.setIdAdopcion(idMascota);
         usuarioAdopcion.setMascotasAdopcion(mascotaAdopcion);

         boolean exito = mascotasDao.insertarUsuarioAdopcion(usuarioAdopcion);

         if (exito) {

            emailService.enviarCorreoConfirmacionAdopcion("vargas.leo.dan@gmail.com", nombreMascota);
            response.sendRedirect("PortalDeAdopcion?action=vista&id=" + idMascota + "&success=true");
         } else {
            response.sendRedirect("PortalDeAdopcion?action=vista&id=" + idMascota + "&error=true");
         }

      } catch (NumberFormatException e) {
         e.printStackTrace();
      }





   }
}

