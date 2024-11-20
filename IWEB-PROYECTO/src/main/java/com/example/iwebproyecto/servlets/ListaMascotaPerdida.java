package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.daos.PublicacionMascotaPerdidaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ListaMascotaPerdidaServlet", value = "/ListaMascotaPerdida")
public class ListaMascotaPerdida extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        RequestDispatcher view;
        response.setContentType("text/html");
        PublicacionMascotaPerdidaDao daoCoo = new PublicacionMascotaPerdidaDao();
        ArrayList<PublicacionMascotaPerdida> lista= daoCoo.listarSolicitudnMascotaPerdida();
        HttpSession session = request.getSession();
        session.setAttribute("listaMascotaPerdida", lista);

        view = request.getRequestDispatcher("coordinador/listaSolicitudesDeMascotaPerdida.jsp");
        view.forward(request, response);
    }
}
