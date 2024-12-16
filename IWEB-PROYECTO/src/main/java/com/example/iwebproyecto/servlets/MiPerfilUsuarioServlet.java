package com.example.iwebproyecto.servlets;



import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "miPerfilUsuario", value = "/MiPerfilUsuario")

public class MiPerfilUsuarioServlet  extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }

        else{

            int id = u.getUsuarioID();

            UsuarioDao usuarioDao = new UsuarioDao();
            Usuario usuario = null;
            try {
                usuario = usuarioDao.obtenerUsuarioPorID(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            request.setAttribute("usuario", usuario);


            // Establece el tipo de contenido de la respuesta
            response.setContentType("text/html");

            // Obtiene el RequestDispatcher para la página JSP
            RequestDispatcher rd = request.getRequestDispatcher("user/miPerfil.jsp");

            // Reenvía la solicitud y la respuesta al JSP
            rd.forward(request, response);

        }






    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método doGet para manejar solicitudes POST de la misma manera
        doGet(request, response);
    }

}
