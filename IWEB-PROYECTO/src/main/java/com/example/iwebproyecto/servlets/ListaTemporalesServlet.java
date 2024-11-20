package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ListaTemporalesServlet", value = "/ListaTemporales")
public class ListaTemporalesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        response.setContentType("text/html");
        SolicitudesHogarTemporalDao daoCoo = new SolicitudesHogarTemporalDao();
        ArrayList<SolicitudTemporal> lista= daoCoo.listarHogarTemporal();
        HttpSession session = request.getSession();
        session.setAttribute("listaTemporal", lista);

        view = request.getRequestDispatcher("coordinador/listaHogaresTemporales.jsp");
        view.forward(request, response);
    }

}