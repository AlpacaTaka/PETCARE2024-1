package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.daos.EventoDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AllEventosUsuarioServlet", value = "/TodosLosEventos")
public class AllEventosUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

       EventoDao eventoDao = new EventoDao();
        MascotasDao mascotasDao = new MascotasDao();
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
              request.getRequestDispatcher("/user/evento.jsp").forward(request, response);
             break;

       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

