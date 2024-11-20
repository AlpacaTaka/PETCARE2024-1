package com.example.iwebproyecto.servlets;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "DesactivarHogarTemporalServlet", value = "/DesactivarHogarTemporal")
public class DesactivarHogarTemporalServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        System.out.println(id);
        SolicitudTemporal sol = new SolicitudTemporal();
        sol.setSolicitudID(id);
        SolicitudesHogarTemporalDao dao = new SolicitudesHogarTemporalDao();
        dao.desactivarHogarTemporalPorID(sol);

        response.sendRedirect("ListaTemporales");

    }
}
