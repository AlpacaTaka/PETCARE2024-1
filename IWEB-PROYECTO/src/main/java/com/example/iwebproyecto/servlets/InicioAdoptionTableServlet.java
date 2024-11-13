package com.example.iwebproyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "InicioAlbergueServlet", value = "/Albergue")
public class InicioAdoptionTableServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AlbergueDaoRevenge albergueDaoRevenge = new AlbergueDaoRevenge();


        switch (action) {
            case "lista":
                ArrayList<MascotasAdopcion> list = albergueDaoRevenge.listarMascotasAdopcion();
                request.setAttribute("lista", list);
                RequestDispatcher rd = request.getRequestDispatcher("albergue/adoptionTable.jsp");
                rd.forward(request, response);
                break;
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}