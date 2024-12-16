package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PostulacionTemporalServlet", value = "/PostulacionTemporal")
public class PostulacionTemporalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ?
                "form" : request.getParameter("action");

        switch (action) {
            case "form":

                RequestDispatcher dispatcher = request.getRequestDispatcher("user/postularTemporal.jsp");
                dispatcher.forward(request, response);
                break;
            case "lista":
                request.getRequestDispatcher("user/misSolicitudesTemporales.jsp").forward(request, response);
                break;
            case "ver":
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

