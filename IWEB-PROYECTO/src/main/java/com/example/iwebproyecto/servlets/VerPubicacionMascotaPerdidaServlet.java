package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Comentarios;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "VerPubicacionMascotaPerdidaServlet", value = "/VerPubicacionMascotaPerdida")
public class VerPubicacionMascotaPerdidaServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        RequestDispatcher view;
        PublicacionMascotaPerdidaDao dao = new PublicacionMascotaPerdidaDao();
        PublicacionMascotaPerdida sol = dao.listarPublicacionMascotaPerdidaPorID(id);
        ArrayList<Comentarios> lista2 = dao.listarComentarios(id);

        HttpSession session = request.getSession();
        session.setAttribute("VerPubicacionMascotaPerdida", sol);
        session.setAttribute("comentariosMascotaPerdida", lista2);

        view = request.getRequestDispatcher("coordinador/publicacionDeMascotaPerdida.jsp");
        view.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String comentario = request.getParameter("comentario");
        Comentarios com = new Comentarios();
        com.setComentarios(comentario);
        System.out.println(id);
        System.out.println(comentario);
        RequestDispatcher view;
        PublicacionMascotaPerdidaDao dao = new PublicacionMascotaPerdidaDao();

        dao.guardarComentario(com,id);

        PublicacionMascotaPerdida sol = dao.listarPublicacionMascotaPerdidaPorID(id);
        ArrayList<Comentarios> lista2 = dao.listarComentarios(id);

        HttpSession session = request.getSession();
        session.setAttribute("VerPubicacionMascotaPerdida", sol);
        session.setAttribute("comentariosMascotaPerdida", lista2);

        view = request.getRequestDispatcher("coordinador/publicacionDeMascotaPerdida.jsp");
        view.forward(request, response);

    }
}