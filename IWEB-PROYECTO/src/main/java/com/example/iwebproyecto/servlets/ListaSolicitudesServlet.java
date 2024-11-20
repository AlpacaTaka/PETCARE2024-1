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

@WebServlet(name = "ListaSolicitudesServlet", value = "/ListaSolicitudes")
public class ListaSolicitudesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        response.setContentType("text/html");
        SolicitudesHogarTemporalDao daoCoo = new SolicitudesHogarTemporalDao();
        ArrayList<SolicitudTemporal> lista= daoCoo.listarSolicitudesHogarTemporal();
        HttpSession session = request.getSession();
        session.setAttribute("listaSolicitudesTemporal", lista);

        view = request.getRequestDispatcher("coordinador/listaSolicitudesDeHogarTemporal1.jsp");
        view.forward(request, response);
    }
}
