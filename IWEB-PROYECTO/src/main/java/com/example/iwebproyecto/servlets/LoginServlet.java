package com.example.iwebproyecto.servlets;
import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.beans.Usuario;
import com.example.iwebproyecto.daos.LoginDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import com.example.iwebproyecto.daos.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "LoginServlet", value = "/Login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        LoginDao dao = new LoginDao();
        System.out.println(dao.authenticateCoordinador(email, password));
        String rol = "";
        int id;
        if(dao.authenticateAdmin(email, password) !=0){

            rol="Administrador";
            id=dao.authenticateAdmin(email, password);
            HttpSession sessionLogin = request.getSession();
            sessionLogin.setAttribute("idAdmin", id);
            response.sendRedirect(request.getContextPath()+"/admincuentas");

        }else if(dao.authenticateAlbergue(email, password) !=0){
            rol="Albergue";/*PataFeliz*/
            id=dao.authenticateAlbergue(email, password);
            HttpSession sessionLogin = request.getSession();
            sessionLogin.setAttribute("idAlbergue", id);
            response.sendRedirect(request.getContextPath()+"/PortalAdopciones");
            //completa el httpSession de Albergue y el redireccionamiento

        }else if(dao.authenticateCoordinador(email, password) !=0) {
            rol = "Coordinador";

            id = dao.authenticateCoordinador(email, password);

            request.getSession().setAttribute("id", id);
            response.sendRedirect(request.getContextPath() + "/MiPerfilCoodinadorServlet?action=vista");

            HttpSession sessionLogin = request.getSession();
            sessionLogin.setAttribute("SesionIDCoordinador", id);

        }else if(dao.authenticateUsuario(email, password) !=0){
            rol = "Usuario";
            id = dao.authenticateUsuario(email, password);

            Usuario usuario = new Usuario();
            UsuarioDao usuarioDao = new UsuarioDao();

            try {
                usuario=usuarioDao.obtenerUsuarioPorID(id);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            HttpSession session = request.getSession();
            session.setAttribute("UsuarioSession", usuario);
            session.setMaxInactiveInterval(10 * 60);


            response.sendRedirect(request.getContextPath() + "/Inicio");

            //completa el httpSession de Usuario y el redireccionamiento

        }else if(dao.verificarCoordinadorPrimeraVez(email, password) !=0){
            id = dao.verificarCoordinadorPrimeraVez(email, password);

            request.getSession().setAttribute("id", id);
            response.sendRedirect(request.getContextPath() + "/login/cambiarContrasenia.jsp");

        }else{
            rol = "Nulo";
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Credenciales incorrectas");
            response.sendRedirect(request.getContextPath());
        }


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Cierre de sesión
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            response.sendRedirect(request.getContextPath());
        }
    }
}

