package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.EventoDao;
import com.example.iwebproyecto.daos.EventosUsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MisEventosUsuarioServlet", value = "/MisEventosUsuario")
public class MisEventosUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");


            int usuarioId = u.getUsuarioID();
            EventoDao eventoDao = new EventoDao();
            ArrayList<EventoBenefico> eventosfututos=eventoDao.listarEventosFuturosPorFechaUsuarioID(usuarioId);
            request.setAttribute("eventosfututos", eventosfututos);
            System.out.println("El arreglo tiene " + eventosfututos.size() + " elementos.");
            ArrayList<EventoBenefico> eventospasados=eventoDao.listarEventosPasadosPorFechaUsuarioID(usuarioId);
            request.setAttribute("eventospasados", eventospasados);
            System.out.println("El arreglo tiene " + eventospasados.size() + " elementos.");
            request.getRequestDispatcher("/user/misEventos.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else{
            EventoDao eventoDao = new EventoDao();
            EventosUsuarioDao eventosUsuarioDao = new EventosUsuarioDao();
            switch (action) {
                case "cancelar":



                    int idUsuario = u.getUsuarioID();
                    String idEventoStr = request.getParameter("idEvento");

                    System.out.println(idEventoStr);

                    int idEvento = Integer.parseInt(idEventoStr);

                    eventosUsuarioDao.borrarInscripcion(idUsuario, idEvento);
                    response.sendRedirect("MisEventosUsuario");


                    break;
            }

        }

    }
}

