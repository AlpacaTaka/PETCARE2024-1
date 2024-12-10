package com.example.iwebproyecto.servlets;
import com.example.iwebproyecto.beans.SolicitudTemporal;
import com.example.iwebproyecto.daos.LoginDao;
import com.example.iwebproyecto.daos.SolicitudesHogarTemporalDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
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

            //completa el httpSession de Admin y el redireccionamiento

        }else if(dao.authenticateAlbergue(email, password) !=0){

            //completa el httpSession de Albergue y el redireccionamiento

        }else if(dao.authenticateCoordinador(email, password) !=0) {
            rol = "Coordinador";
            id = dao.authenticateCoordinador(email, password);
            request.getSession().setAttribute("id", id);
            response.sendRedirect(request.getContextPath() + "/MiPerfilCoodinadorServlet?action=vista");

            HttpSession sessionLogin = request.getSession();
            sessionLogin.setAttribute("SesionIDCoordinador", id);

        }else if(dao.authenticateUsuario(email, password) !=0){

            //completa el httpSession de Usuario y el redireccionamiento

        }else{
            rol = "Nulo";
            request.setAttribute("errorMessage", "Credenciales incorrectas");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        }


    }
}

