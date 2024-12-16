package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.daos.AdminCuentasDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="ServletValidarAlbergue", value = "/ValidarAlb")
public class ServletValidarAlbergue extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AdminCuentasDao dao = new AdminCuentasDao();
        int idAdmin= (Integer) request.getSession().getAttribute("idAdmin");
        switch (action) {
            case "lista":
                ArrayList<Albergue> listaAlb = dao.solisAlbergue();
                request.setAttribute("listaAlb", listaAlb);
                RequestDispatcher rd = request.getRequestDispatcher("Administrador/solicitudCuentaAlbergues.jsp");
                rd.forward(request, response);

            case "aceptar":
                int idd = Integer.parseInt(request.getParameter("id"));
                dao.aceptarAlbergue(idd);
                response.sendRedirect(request.getContextPath() + "/ValidarAlb");
                break;

            case "rechazar":
                int idd2 = Integer.parseInt(request.getParameter("id"));
                dao.rechazarAlbergue(idd2);
                response.sendRedirect(request.getContextPath() + "/ValidarAlb");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
