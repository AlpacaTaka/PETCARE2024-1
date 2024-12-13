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
        int idAdmin= (Integer) request.getSession().getAttribute("idAdmin");
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
            case "deleteAlb":
                int idd = Integer.parseInt(request.getParameter("id"));
                dao.borrarAlbergue(idd);
                response.sendRedirect(request.getContextPath() + "/admincuentas");
                break;
            case "deleteUser":
                int idd2 = Integer.parseInt(request.getParameter("id"));
                dao.borrarUsuario(idd2);
                response.sendRedirect(request.getContextPath() + "/admincuentas");
                break;
            case "deleteCoord":
                int idd3 = Integer.parseInt(request.getParameter("id"));
                dao.borrarCoordinador(idd3);
                response.sendRedirect(request.getContextPath() + "/admincuentas");
                break;
            case "deleteLugar":
                int idd4 = Integer.parseInt(request.getParameter("id"));
                dao.borrarLugarHabilitado(idd4);
                response.sendRedirect(request.getContextPath() + "/admincuentas");
                break;
        }

    }
}
