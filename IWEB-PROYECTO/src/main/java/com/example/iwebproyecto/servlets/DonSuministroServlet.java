package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.Albergue;
import com.example.iwebproyecto.beans.DonacionSuministros;
import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.daos.AlbergueDao;
import com.example.iwebproyecto.daos.DonacionesDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DonSuministroServlet", value = "/SolicitudesDeSuministros")
public class DonSuministroServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action") == null ?
               "lista" : request.getParameter("action");
        DonacionesDao daoDon = new DonacionesDao();
        MascotasDao mascotasDao = new MascotasDao();
        switch (action) {
            case "lista":


                ArrayList<DonacionSuministros> listaSolicitudes = new ArrayList();
                ArrayList<PublicacionMascotaPerdida> listaPerdidos = mascotasDao.listarNoEncontradasYAprobadasMasDiasPerdido5();
                listaSolicitudes = daoDon.listarDonacionesSuministros();
                request.setAttribute("mascotasPerdidas", listaPerdidos);
                request.setAttribute("listaSolicitudes", listaSolicitudes);
                System.out.println(listaSolicitudes.size());
                RequestDispatcher dispatcher = request.getRequestDispatcher("user/solicitudesDonacionSuministros.jsp");
                dispatcher.forward(request, response);

                break;
            case "vista":
                int idDonacion = Integer.valueOf(request.getParameter("id"));
                DonacionSuministros donacionSuministros = new DonacionSuministros();
                donacionSuministros = daoDon.obtenerSolicitudesDonacionSuministrosPorId(idDonacion);
                System.out.println(donacionSuministros.getCorreoElectronicoDonacion());
                request.setAttribute("donacionSuministros", donacionSuministros);
                request.getRequestDispatcher("user/perfilAlbergue.jsp").forward(request, response);

                break;
            case "Donacion":

                break;
            default:

                break;
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

