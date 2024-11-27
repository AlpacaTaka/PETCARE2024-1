package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.LugarHabilitadoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ServletLugarHabilitado", value = "/LugarHabilitado")
public class ServletLugarHabilitado extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "create" : request.getParameter("action");
        LugarHabilitadoDao dao = new LugarHabilitadoDao();
        int idAdmin = 4;
        switch (action) {
            case "create":
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/creacionLugarHabilitado.jsp").forward(request, response);
                break;

            case "edit":
                String id = request.getParameter("id");
                LugarEvento lugar = dao.buscarLugarPorID(Integer.parseInt(id));
                request.setAttribute("lugar",lugar);
                request.getRequestDispatcher("Administrador/editarLugarHabilitado.jsp").forward(request,response);
            case "view":
                String idv = request.getParameter("id");
                LugarEvento lugarVista = dao.buscarLugarPorID(Integer.parseInt(idv));
                request.setAttribute("lugar",lugarVista);
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/vistaLugarHabilitado.jsp").forward(request,response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        LugarHabilitadoDao lugarHabilitadoDao = new LugarHabilitadoDao();
        String nombreLugar = request.getParameter("nombreLugar");
        String direccionLugar = request.getParameter("direccionLugar");
        int aforoMaximo = Integer.parseInt(request.getParameter("aforoLugar"));
        int administradorID = 4;
        int fotoID = 30;
        boolean eliminado = false;
        int distrito = Integer.parseInt(request.getParameter("idDistrito"));
        LugarEvento lugarEvento = new LugarEvento();
        lugarEvento.setNombreLugar(nombreLugar);
        lugarEvento.setDireccionLugar(direccionLugar);
        lugarEvento.setEliminado(eliminado);
        lugarEvento.setAforoMax(aforoMaximo);
        Administrador administrador = new Administrador();
        administrador.setAdministradorID(administradorID);
        lugarEvento.setAdministrador(administrador);
        Foto foto = new Foto();
        foto.setFotoID(fotoID);
        lugarEvento.setFoto(foto);
        Distrito dist = new Distrito();
        dist.setDistritoID(distrito);
        lugarEvento.setDistrito(dist);
        switch (action) {
            case "create":
                lugarHabilitadoDao.crearLugarHabilitado(lugarEvento);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;

            case "edit":
                lugarEvento.setLugarID(Integer.parseInt(request.getParameter("id")));
                lugarHabilitadoDao.editarLugarHabilitado(lugarEvento);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;
        }
    }

}
