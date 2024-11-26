package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Administrador;
import com.example.iwebproyecto.beans.Distrito;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.LugarEvento;
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
        int idAdmin = 4;
        switch (action) {
            case "create":
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/creacionLugarHabilitado.jsp").forward(request, response);
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
        int aforoMaximo = Integer.parseInt(request.getParameter("aforoMaximo"));
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
                response.sendRedirect(request.getContextPath()+"/LugarHabilitado?action=create");
                break;
        }
    }

}
