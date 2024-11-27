package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.CoordinadorZona;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.Zona;
import com.example.iwebproyecto.daos.CrearCoordinadorDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ServletUserAdmin", value = "/EditUser")
public class ServletUserAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


    }
}
