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

@WebServlet(name = "VerSolicitudTemporalServlet", value = "/VerSolicitudTemporal")

public class VerSolicitudTemporalServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String quitar = (String) request.getSession().getAttribute("quitar");



        int id = Integer.parseInt(request.getParameter("id"));
        if (quitar != null) {
            System.out.println(id);
            SolicitudesHogarTemporalDao dao = new SolicitudesHogarTemporalDao();
            SolicitudTemporal sol1 = dao.listarHogarTemporalPorID(id);

            HttpSession session = request.getSession();
            session.setAttribute("VerComentario", sol1);
        }
        System.out.println(id);
        RequestDispatcher view;
        SolicitudesHogarTemporalDao dao = new SolicitudesHogarTemporalDao();
        SolicitudTemporal sol = dao.listarSolicitudesHogarTemporalPorID(id);

        HttpSession session = request.getSession();
        session.setAttribute("VerSolicitudTemporal", sol);

        view = request.getRequestDispatcher("coordinador/solicitudDeHogarTemporal.jsp");
        view.forward(request, response);


    }
}
