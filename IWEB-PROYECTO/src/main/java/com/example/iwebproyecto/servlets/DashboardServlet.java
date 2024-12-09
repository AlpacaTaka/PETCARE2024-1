package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.DonacionSuministros;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.DashboardDao;
import com.example.iwebproyecto.dtos.DashboardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "DashboardServlet", value = "/Dashboard")
public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");
        DashboardDao dto = new DashboardDao();
        DashboardDTO dashboardDTO = dto.obtenerDatosDashboard();
        request.setAttribute("dashboardDTO", dashboardDTO);
        RequestDispatcher rd = request.getRequestDispatcher("Administrador/dashboard.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}