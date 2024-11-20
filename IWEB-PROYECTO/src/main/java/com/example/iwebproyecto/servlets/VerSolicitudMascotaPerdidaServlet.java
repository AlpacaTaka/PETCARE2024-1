package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.PublicacionMascotaPerdidaDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "VerSolicitudMascotaPerdidaServlet", value = "/VerSolicitudMascotaPerdida")
public class VerSolicitudMascotaPerdidaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        RequestDispatcher view;
        PublicacionMascotaPerdidaDao dao = new PublicacionMascotaPerdidaDao();
        PublicacionMascotaPerdida sol = dao.listarSolicitudnMascotaPerdidaPorID(id);

        HttpSession session = request.getSession();
        session.setAttribute("VerSolicitudMascotaPerdida", sol);

        view = request.getRequestDispatcher("coordinador/solicitudDeMascotaPerdida.jsp");
        view.forward(request, response);

    }
}
