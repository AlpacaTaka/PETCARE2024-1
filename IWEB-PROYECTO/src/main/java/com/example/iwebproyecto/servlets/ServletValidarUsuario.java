package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.AdminCuentasDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name="ServletValidarUsuario", value = "/ValidarUser")
public class ServletValidarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        AdminCuentasDao dao = new AdminCuentasDao();
        int idAdmin= (Integer) request.getSession().getAttribute("idAdmin");
        switch (action) {
            case "lista":
                ArrayList<Usuario> listaUsuarios = dao.solisUsuarios();
                request.setAttribute("listaUser", listaUsuarios);
                RequestDispatcher rd = request.getRequestDispatcher("Administrador/validacionUsuarios.jsp");
                rd.forward(request, response);

            case "aceptar":
                int idd = Integer.parseInt(request.getParameter("id"));
                dao.aceptarUsuario(idd);
                response.sendRedirect(request.getContextPath() + "/ValidarUser");
                break;

            case "rechazar":
                int idd2 = Integer.parseInt(request.getParameter("id"));
                dao.desactivarUsuario(idd2);
                response.sendRedirect(request.getContextPath() + "/ValidarUser");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
