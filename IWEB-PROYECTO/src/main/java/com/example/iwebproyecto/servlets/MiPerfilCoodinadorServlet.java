package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.CoordinadorZona;
import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.daos.CoordinadorDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MiPerfilCoodinadorServlet", value = "/MiPerfilCoodinadorServlet")
public class MiPerfilCoodinadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta

        response.setContentType("text/html");



        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        switch (action){
            case "lista"://voy a crear un nuevo trabajo


                MascotasDao mascotasDao = new MascotasDao();
                ArrayList<MascotasAdopcion> listaMascotasAdopcion= mascotasDao.listarMascotasActivasAdopcion();
                System.out.println("Lista de Adopciones: " + listaMascotasAdopcion.size() + " elementos.");
                request.setAttribute("listaAdopcion", listaMascotasAdopcion);

                // Obtiene el RequestDispatcher para la página JSP

                RequestDispatcher rd = request.getRequestDispatcher("coordinador/miPerfil.jsp");

                // Reenvía la solicitud y la respuesta al JSP
                rd.forward(request, response);
                break;
            case "vista":
                response.setContentType("text/html");
                CoordinadorDao daoCoor = new CoordinadorDao();
                HttpSession session2 = request.getSession(false);
                CoordinadorZona coor= daoCoor.ObtenerCoordinadorZona((Integer) session2.getAttribute("SesionIDCoordinador"));

                switch (coor.getZona().getZonaID()){
                    case 1:
                        coor.getZona().setNombreZona("Zona Norte");
                        break;
                    case 2:
                        coor.getZona().setNombreZona("Zona Sur");
                        break;
                    case 3:
                        coor.getZona().setNombreZona("Zona Este");
                        break;
                    case 4:
                        coor.getZona().setNombreZona("Zona Oeste");
                        break;
                }

                HttpSession session = request.getSession();


                session.setAttribute("CoordinadorZona", coor);

                response.sendRedirect("coordinador/miPerfil.jsp");

                break;
            case "s":


                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}