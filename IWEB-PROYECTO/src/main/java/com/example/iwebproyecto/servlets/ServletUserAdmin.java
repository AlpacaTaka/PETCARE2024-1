package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AdminCuentasDao;
import com.example.iwebproyecto.daos.CrearCoordinadorDao;
import com.example.iwebproyecto.daos.LugarHabilitadoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet(name="ServletUserAdmin", value = "/UserAdmin")
public class ServletUserAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "create" : request.getParameter("action");
        AdminCuentasDao admin = new AdminCuentasDao();
        int idAdmin = 4;
        switch (action) {
            case "edit":
                String id = request.getParameter("id");
                Usuario usuario = admin.obtenerUsuarioPorID(Integer.parseInt(id));
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("Administrador/editarUsuario.jsp").forward(request, response);

            case "view":
                String idv = request.getParameter("id");
                Usuario usuariov = admin.obtenerUsuarioPorID(Integer.parseInt(idv));
                request.setAttribute("usuario", usuariov);
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/verUsuario.jsp").forward(request,response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        AdminCuentasDao adminCuentasDao = new AdminCuentasDao();
        Usuario usuario = new Usuario();
        String nombreUsuario = request.getParameter("nombreUser");
        String apellidoUsuario = request.getParameter("apellidoUser");
        String dniUsuario = request.getParameter("dni");
        int distritoUser = Integer.parseInt(request.getParameter("idDistrito"));
        String direccionUsuario = request.getParameter("direccionUser");
        String correoUsuario = request.getParameter("correoUser");
        boolean activo = true;
        boolean eliminado = false;
        int fotoID = 30;
        LocalDate fechaResgistro = LocalDate.of(2015, 10, 20);
        usuario.setNombre(nombreUsuario);
        usuario.setApellido(apellidoUsuario);
        usuario.setDni(dniUsuario);
        usuario.setDireccion(direccionUsuario);
        usuario.setCorreoElectronico(correoUsuario);
        usuario.setActivo(activo);
        usuario.setEliminado(eliminado);
        Foto foto = new Foto();
        foto.setFotoID(fotoID);
        usuario.setFoto(foto);
        usuario.setFechaRegistrado(fechaResgistro);
        Distrito distrito = new Distrito();
        distrito.setDistritoID(distritoUser);
        usuario.setDistrito(distrito);
        switch (action){
            case "edit":
                usuario.setUsuarioID(Integer.parseInt(request.getParameter("id")));
                adminCuentasDao.editarUsuario(usuario);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;
        }

    }
}
