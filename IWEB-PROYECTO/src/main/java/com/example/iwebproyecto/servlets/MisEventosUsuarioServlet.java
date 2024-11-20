package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.daos.EventoDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MisEventosUsuarioServlet", value = "/MisEventosUsuario")
public class MisEventosUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "listar" : request.getParameter("action");


        int usuarioId = 7;
        EventoDao eventoDao = new EventoDao();
        ArrayList<EventoBenefico> eventosfututos=eventoDao.listarEventosFuturosPorFechaUsuarioID(usuarioId);
        System.out.println("El arreglo tiene " + eventosfututos.size() + " elementos.");
        request.setAttribute("eventosfututos", eventosfututos);
        request.getRequestDispatcher("/user/misEventos.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

