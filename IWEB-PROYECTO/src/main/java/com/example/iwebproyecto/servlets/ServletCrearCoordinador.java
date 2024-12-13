package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.CoordinadorZona;
import com.example.iwebproyecto.beans.Foto;
import com.example.iwebproyecto.beans.LugarEvento;
import com.example.iwebproyecto.beans.Zona;
import com.example.iwebproyecto.daos.CrearCoordinadorDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name="ServletCrearCoordinador", value = "/CrearCoordinador")
public class ServletCrearCoordinador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "create" : request.getParameter("action");
        CrearCoordinadorDao zona = new CrearCoordinadorDao();
        int idAdmin = 4;
        switch (action) {
            case "create":
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/creacionCoordinadorZona.jsp").forward(request, response);
                break;
            case "edit":
            String id = request.getParameter("id");
            CoordinadorZona zona2 = zona.buscarCoordinadorPorID(Integer.parseInt(id));
            request.setAttribute("zona",zona2);
            request.getRequestDispatcher("Administrador/editarCoordinadorZona.jsp").forward(request,response);
            case "view":
                String idv = request.getParameter("id");
                CoordinadorZona zonav = zona.buscarCoordinadorPorID(Integer.parseInt(idv));
                request.setAttribute("zona",zonav);
                request.setAttribute("idAdmin", idAdmin);
                request.getRequestDispatcher("Administrador/vistaCoordinadorZona.jsp").forward(request,response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        CrearCoordinadorDao crearCoordinadorDao = new CrearCoordinadorDao();
        String nombre = request.getParameter("NombreCoordinador");
        String apellido = request.getParameter("ApellidoCoordinador");
        String celular = request.getParameter("celuCoordinador");
        String correo = request.getParameter("correoCoordinador");
        String dni = request.getParameter("dniCoordinador");
        int zona = Integer.parseInt(request.getParameter("zonaID"));
        String fecha = request.getParameter("fechaNacimiento");
        int fotoID = 30;
        boolean flag = false;
        String estado = "activo";
        CoordinadorZona coordinadorZona = new CoordinadorZona();
        Foto foto = new Foto();
        foto.setFotoID(fotoID);
        coordinadorZona.setFoto(foto);
        coordinadorZona.setFlag(flag);
        coordinadorZona.setEstado(estado);
        coordinadorZona.setNombre(nombre);
        coordinadorZona.setApellido(apellido);
        coordinadorZona.setCelular(celular);
        coordinadorZona.setCorreoElectronico(correo);
        coordinadorZona.setDni(dni);
        Zona zona1 = new Zona();
        zona1.setZonaID(zona);
        coordinadorZona.setZona(zona1);
        coordinadorZona.setFechaNacimiento(fecha);
        switch (action){
            case "create":
                crearCoordinadorDao.CrearCoordinadorZona(coordinadorZona);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;
            case "edit":
                coordinadorZona.setCoordinadorID(Integer.parseInt(request.getParameter("id")));
                crearCoordinadorDao.editarCoordinadorZona(coordinadorZona);
                response.sendRedirect(request.getContextPath()+"/admincuentas");
                break;
        }

    }
}
