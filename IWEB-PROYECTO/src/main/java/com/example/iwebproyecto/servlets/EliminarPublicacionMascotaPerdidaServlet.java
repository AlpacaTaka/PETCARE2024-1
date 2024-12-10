package com.example.iwebproyecto.servlets;
import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.sql.SQLException;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@WebServlet(name = "EliminarPublicacionMascotaPerdidaServlet", value = "/EliminarPublicacionMascotaPerdida")
public class EliminarPublicacionMascotaPerdidaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("publicacionMascotaPerdidaID");
        int id = Integer.parseInt(idParam);

        PublicacionMascotaPerdidaDao dao = new PublicacionMascotaPerdidaDao();
        dao.eliminarPublicacion(id);

        response.setContentType("text/html");
        response.sendRedirect("ListaMascotaPerdida?action=ListaPublicaciones");

    }
}
