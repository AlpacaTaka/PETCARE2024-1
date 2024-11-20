package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.daos.PublicacionMascotaPerdidaDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AceptarSolicitudMascotaPerdidaServlet", value = "/AceptarSolicitudMascotaPerdida")
public class AceptarSolicitudMascotaPerdidaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String accion = request.getParameter("accion");
        PublicacionMascotaPerdidaDao Dao = new PublicacionMascotaPerdidaDao();
        if (accion.equals("aceptar")){
            Dao.ARSolicitudnMascotaPerdidaPorID(id,1);
        }else{
            Dao.ARSolicitudnMascotaPerdidaPorID(id,0);
        }

        // Respuesta al cliente
        response.setContentType("text/html");
        response.sendRedirect("ListaMascotaPerdida");
    }

}

