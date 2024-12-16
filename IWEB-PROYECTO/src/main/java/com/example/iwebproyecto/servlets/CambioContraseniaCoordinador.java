package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.AlbergueDaoRevenge;
import com.example.iwebproyecto.daos.LoginDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "CambioContraseniaCoordinadorServlet", value = "/CambioContraseniaCoordinador")
public class CambioContraseniaCoordinador extends HttpServlet  {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idParam = Integer.parseInt(request.getParameter("id")); // ID del coordinador
        String hashedPassword = request.getParameter("passwordCambio"); // Contraseña hasheada
        System.out.println(idParam);
        System.out.println(hashedPassword);
        LoginDao loginDao = new LoginDao();
        loginDao.actualizarContraseniaCoordinador(idParam,hashedPassword);
        response.sendRedirect(request.getContextPath());




    }
}
