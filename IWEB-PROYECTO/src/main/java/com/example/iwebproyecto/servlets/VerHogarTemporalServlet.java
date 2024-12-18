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

@WebServlet(name = "VerHogarTemporalServlet", value = "/VerHogarTemporal")
public class VerHogarTemporalServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        RequestDispatcher view;
        SolicitudesHogarTemporalDao dao = new SolicitudesHogarTemporalDao();
        SolicitudTemporal sol = dao.listarHogarTemporalPorID(id);

        HttpSession session = request.getSession();
        session.setAttribute("VerHogarTemporal", sol);

        view = request.getRequestDispatcher("coordinador/comentariosDelHogarTemporal.jsp");
        view.forward(request, response);

    }
}
