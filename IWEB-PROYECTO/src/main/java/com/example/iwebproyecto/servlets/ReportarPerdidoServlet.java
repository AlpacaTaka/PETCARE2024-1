package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet(name = "ReportarPerdidoServlet", value = "/ReportarPerdido")
public class ReportarPerdidoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");


        String action = request.getParameter("action") == null ? "verForm" : request.getParameter("action");

        int idUsuario = 7; //cambiar en sesion

        switch (action) {
            case "verForm":
                request.getRequestDispatcher("/user/reportarMascotaPerdida.jsp").forward(request, response);
                break;
            case "listar":
                request.getRequestDispatcher("/user/misReportesMascPerdidas.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String action = request.getParameter("action");
        int idUsuario = 7;

        switch (action) {
            case "guardar":
                request.setCharacterEncoding("UTF-8");
                PublicacionMascotaPerdida mascotaPerdida = new PublicacionMascotaPerdida();

                Usuario usuario = new Usuario();
                usuario.setUsuarioID(idUsuario);
                mascotaPerdida.setUsuario(usuario);
                mascotaPerdida.setDescripcion(request.getParameter("Descripcion"));
                mascotaPerdida.setNombreMascota(request.getParameter("nombre-mascota"));
                mascotaPerdida.setDistintivo(request.getParameter("distintivo"));
                mascotaPerdida.setEdadMascota(Integer.parseInt(request.getParameter("edad-mascota")));
                mascotaPerdida.setTamanio(request.getParameter("tamanio"));
                mascotaPerdida.setEspecie(request.getParameter("Especie"));
                if ("otro".equals(request.getParameter("Raza"))){
                    mascotaPerdida.setRaza(request.getParameter("otra-raza"));
                }else{
                    mascotaPerdida.setRaza(request.getParameter("Raza"));
                }
                mascotaPerdida.setDescripcionAdicional(request.getParameter("descripcion-adicional"));
                mascotaPerdida.setLugarPerdida(request.getParameter("Direccion-perdida"));
                mascotaPerdida.setFechaPerdida(LocalDate.parse(request.getParameter("fechaPerdida")));
                mascotaPerdida.setHoraPerdida(LocalTime.parse(request.getParameter("hora-perdida")));
                mascotaPerdida.setNombreContacto(request.getParameter("nombre-contacto"));
                mascotaPerdida.setTelefonoContacto(request.getParameter("telefono-contacto"));


                Foto foto  =new Foto();




                break;
        }
    }
}

