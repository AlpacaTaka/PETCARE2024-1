package com.example.iwebproyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "InicioUsuarioServlet", value = "/Inicio")
public class InicioUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");

        // Obtiene el RequestDispatcher para la página JSP
        RequestDispatcher rd = request.getRequestDispatcher("user/inicio.jsp");

        // Reenvía la solicitud y la respuesta al JSP
        rd.forward(request, response);

        String action = request.getParameter("action") == null ? "crear" : request.getParameter("action");

        switch (action){
            case "crear"://voy a crear un nuevo trabajo

                break;
            case "e": //voy a actualizar

                break;
            case "s":


                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método doGet para manejar solicitudes POST de la misma manera
        doGet(request, response);
    }
}
