package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AdminCuentasDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAdminCuentas", value = "/admincuentas")
public class ServletAdminCuentas extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AdminCuentasDao dao = new AdminCuentasDao();
        int idAlbergue = 6;
        switch (action) {
            case "lista":
                ArrayList<Albergue> listaAlb = dao.listarAlbergues();
                ArrayList<Usuario> listaUser = dao.listarUsuarios();
                ArrayList<CoordinadorZona> listaCordZone = dao.listarCoordinadores();
                ArrayList<LugarEvento> listaLugares = dao.listarLugaresHabilitados();
                request.setAttribute("listaAlb", listaAlb);
                request.setAttribute("listaUser", listaUser);
                request.setAttribute("listaCordZone", listaCordZone);
                request.setAttribute("listaLugares", listaLugares);
                RequestDispatcher rd = request.getRequestDispatcher("Administrador/administracionCuentas.jsp");
                rd.forward(request, response);
                break;
        }

    }
}
