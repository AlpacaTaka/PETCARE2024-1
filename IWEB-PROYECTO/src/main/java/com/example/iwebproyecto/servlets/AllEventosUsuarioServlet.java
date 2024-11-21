package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.daos.EventoDao;
import com.example.iwebproyecto.daos.EventosUsuarioDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AllEventosUsuarioServlet", value = "/TodosLosEventos")
public class AllEventosUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

       EventoDao eventoDao = new EventoDao();
        MascotasDao mascotasDao = new MascotasDao();
        EventosUsuarioDao eventosUsuarioDao = new EventosUsuarioDao();

        int idUsuario = 7;

       switch (action) {
          case "listar":
             ArrayList<EventoBenefico> listaEventos = eventoDao.listarEventosPorFecha();
             ArrayList<PublicacionMascotaPerdida> listaPerdidos = mascotasDao.listarNoEncontradasYAprobadasMasDiasPerdido5();
             request.setAttribute("eventos", listaEventos);
             request.setAttribute("mascotasPerdidas", listaPerdidos);
             request.getRequestDispatcher("/user/allEventos.jsp").forward(request, response);
             break;
          case "visualizar":
              int idEvento = Integer.parseInt(request.getParameter("id"));
              EventoBenefico eventoBenefico =eventoDao.obtenerEventoPorID(idEvento);
              request.setAttribute("evento", eventoBenefico);


              boolean hayTraslape= eventosUsuarioDao.verificarSolapamiento(idUsuario,idEvento);
              boolean hayCupo= eventosUsuarioDao.verificarAforo(idEvento);
              boolean yaInscrito = eventosUsuarioDao.isAlreadyRegistered(idUsuario, idEvento);
              String tipoDonacion =eventoBenefico.getTipoDonacion();

              if(!hayCupo) {
                  request.getRequestDispatcher("/user/eventoCompleto.jsp").forward(request, response);
              }
              else if(yaInscrito) {
                  request.getRequestDispatcher("/user/eventoYaInscrito.jsp").forward(request, response);
              } else{
                  switch(tipoDonacion) {
                      case "Monetario":
                          // Si el tipo de donación es monetaria
                          // Lógica para inscribir al usuario en el evento para donación monetaria
                          request.setAttribute("evento", eventoBenefico);
                          request.getRequestDispatcher("/user/eventoMonetario.jsp").forward(request, response);
                          break;

                      case "Suministros":
                          // Si el tipo de donación es suministros
                          // Mostrar el formulario de suministros (p.ej., una ventana emergente o una nueva página)
                          request.setAttribute("evento", eventoBenefico);
                          request.getRequestDispatcher("/user/evento.jsp").forward(request, response);
                          break;
                  }

              }





              break;
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idUsuario = 8;

        int idEvento = Integer.parseInt(request.getParameter("idEvento"));

        EventosUsuarioDao eventosUsuarioDao = new EventosUsuarioDao();
        EventoDao eventoDao = new EventoDao();
        MascotasDao mascotasDao = new MascotasDao();



        boolean hayTraslape= eventosUsuarioDao.verificarSolapamiento(idUsuario,idEvento);
        boolean hayCupo= eventosUsuarioDao.verificarAforo(idEvento);
        boolean yaInscrito = eventosUsuarioDao.isAlreadyRegistered(idUsuario, idEvento);

        if(!hayCupo) {
            response.sendRedirect("TodosLosEventos?action=visualizar&id="+idEvento);
        }
        else if(yaInscrito) {
            response.sendRedirect("TodosLosEventos?action=visualizar&id="+idEvento);
        } else{

            eventosUsuarioDao.registerToEvent(idUsuario, idEvento);
            response.sendRedirect("TodosLosEventos?action=visualizar&id="+idEvento);
        }


    }
}

