package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.daos.AlbergueDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AlbergueServlet", urlPatterns = {"/miPerfilAlbergue"})
public class AlbergueServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el albergueID del parámetro de la solicitud, usar predeterminado de 1 si no se proporciona
        String idParam = request.getParameter("albergueID");
        int albergueID = 6;

        if (idParam != null && !idParam.isEmpty()) {
            try {
                albergueID = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("/error.jsp?message=Invalid%20Albergue%20ID");
                return;
            }
        }

        // Busca el albergue en la base de datos
        AlbergueDao albergueDao = new AlbergueDao();
        Albergue albergue = albergueDao.obtenerAlberguePorID(albergueID);

        if (albergue != null) {
            // Establece el atributo del albergue para la página JSP
            request.setAttribute("albergue", albergue);

            // Despacha la solicitud a la JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("albergue/miPerfil.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("/error.jsp?message=Albergue%20not%20found");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén y establece los nuevos valores a partir del formulario
        int albergueID = Integer.parseInt(request.getParameter("albergueID"));
        int cantidadAnimales = Integer.parseInt(request.getParameter("cantidad_animales"));
        int espaciosDisponibles = Integer.parseInt(request.getParameter("espacios_disponibles"));
        String puntoAcopio = request.getParameter("punto_acopio");

        AlbergueDao albergueDao = new AlbergueDao();
        Albergue albergue = albergueDao.obtenerAlberguePorID(albergueID);

        if (albergue != null) {
            albergue.setCantidadAnimales(cantidadAnimales);
            albergue.setEspaciosDisponibles(espaciosDisponibles);
            albergue.setPuntoAcopioDonaciones(puntoAcopio);

            albergueDao.actualizarAlbergue(albergue);

            // Redirige después de la actualización
            response.sendRedirect("miPerfil");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}