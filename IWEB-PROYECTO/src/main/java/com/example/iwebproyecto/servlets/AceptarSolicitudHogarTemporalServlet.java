package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.PublicacionMascotaPerdidaDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AceptarSolicitudHogarTemporalServlet", value = "/AceptarSolicitudHogarTemporal")
public class AceptarSolicitudHogarTemporalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comunicacion = request.getParameter("comunicacion");
        int id = Integer.parseInt(request.getParameter("id"));
        String accion = request.getParameter("accion");
        SolicitudesHogarTemporalDao Dao = new SolicitudesHogarTemporalDao();

        if (accion.equals("aceptar")){
            Dao.ARTemporalPorID(id,1);
        }else{
            Dao.ARTemporalPorID(id,0);
        }
        Dao.ARComentarioTemporalPorID(id,comunicacion);

        // Procesar el valor (por ejemplo, imprimir en consola)
        System.out.println("Texto recibido: " + comunicacion);
        System.out.println(id);
        System.out.println(accion);

        // Respuesta al cliente
        response.setContentType("text/html");
        response.sendRedirect("ListaSolicitudes");
    }
}
