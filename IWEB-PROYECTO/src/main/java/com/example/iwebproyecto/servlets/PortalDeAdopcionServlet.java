package com.example.iwebproyecto.servlets;
import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
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

               int idMascAdopt = Integer.parseInt(request.getParameter("id"));
               MascotasDao mascotasDao2 = new MascotasDao();

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

   }
}

