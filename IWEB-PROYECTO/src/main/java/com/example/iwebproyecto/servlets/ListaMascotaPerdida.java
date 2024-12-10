package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Comentarios;
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

        switch (action){
            case "ListaSolicitudes":
                RequestDispatcher view;
                response.setContentType("text/html");
                PublicacionMascotaPerdidaDao daoCoo = new PublicacionMascotaPerdidaDao();
                ArrayList<PublicacionMascotaPerdida> lista= daoCoo.listarSolicitudnMascotaPerdida();
                HttpSession session = request.getSession();
                session.setAttribute("listaMascotaPerdida", lista);
                session.setAttribute("quitar3", null);

                view = request.getRequestDispatcher("coordinador/listaSolicitudesDeMascotaPerdida.jsp");
                view.forward(request, response);
            case "ListaPublicaciones":
                RequestDispatcher view1;
                response.setContentType("text/html");
                PublicacionMascotaPerdidaDao daoCoo1 = new PublicacionMascotaPerdidaDao();
                ArrayList<PublicacionMascotaPerdida> lista1= daoCoo1.listarPublicacionMascotaPerdida();
                HttpSession session1 = request.getSession();
                session1.setAttribute("listaMascotaPerdida", lista1);

                view1 = request.getRequestDispatcher("coordinador/listaPublicacionesDeMascotaPerdida.jsp");
                view1.forward(request, response);
        }

    }
}
