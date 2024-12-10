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

@WebServlet(name = "FiltrosCoordinadorServlet", value = "/FiltrosCoordinador")
public class FiltrosCoordinadorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        //String action = request.getParameter("action");


        switch (action){
            case "Hogares":
                String accion = request.getParameter("estado");
                if(accion.equals("Limpiar")){
                    response.setContentType("text/html");
                    response.sendRedirect("ListaTemporales");
                }else{
                    RequestDispatcher view;
                    SolicitudesHogarTemporalDao Dao = new SolicitudesHogarTemporalDao();
                    System.out.println(accion);
                    ArrayList<SolicitudTemporal> lista;
                    if (accion.equals("Activo")){
                        lista= Dao.listarHogarTemporalFiltro("false");
                    }else{
                        lista= Dao.listarHogarTemporalFiltro("true");
                    }


                    HttpSession session = request.getSession();
                    session.setAttribute("listaTemporal", lista);

                    view = request.getRequestDispatcher("coordinador/listaHogaresTemporales.jsp");
                    view.forward(request, response);
                }
                break;
            case "SolicitudesHogares":
                RequestDispatcher view;
                response.setContentType("text/html");
                SolicitudesHogarTemporalDao daoCoo = new SolicitudesHogarTemporalDao();
                ArrayList<SolicitudTemporal> lista= daoCoo.listarSolicitudesHogarTemporalFiltro();
                HttpSession session = request.getSession();
                session.setAttribute("listaSolicitudesTemporal", lista);

                String quitar = "quitar";
                session.setAttribute("quitar", quitar);

                view = request.getRequestDispatcher("coordinador/listaSolicitudesDeHogarTemporal1.jsp");
                view.forward(request, response);
                break;
            case "MascotaPedida":
                String accion2 = request.getParameter("estado");
                if(accion2.equals("Limpiar")){
                    response.setContentType("text/html");
                    response.sendRedirect("ListaMascotaPerdida?action=ListaPublicaciones");
                }else{
                    RequestDispatcher view2;
                    PublicacionMascotaPerdidaDao Dao = new PublicacionMascotaPerdidaDao();
                    System.out.println(accion2);
                    ArrayList<PublicacionMascotaPerdida> lista2;
                    if (accion2.equals("Encontrada")){
                        lista2= Dao.listarPublicacionMascotaPerdidaFiltro("true");
                    }else{
                        lista2= Dao.listarPublicacionMascotaPerdidaFiltro("false");
                    }


                    HttpSession session2 = request.getSession();
                    session2.setAttribute("listaMascotaPerdida", lista2);

                    view2 = request.getRequestDispatcher("coordinador/listaPublicacionesDeMascotaPerdida.jsp");
                    view2.forward(request, response);

                }
                break;
            case "SolicitudesPerdidas":
                RequestDispatcher view3;
                response.setContentType("text/html");
                PublicacionMascotaPerdidaDao daoCoo3 = new PublicacionMascotaPerdidaDao();
                ArrayList<PublicacionMascotaPerdida> lista3= daoCoo3.listarSolicitudnMascotaPerdidaFiltro();
                HttpSession session3 = request.getSession();
                session3.setAttribute("listaMascotaPerdida", lista3);

                String quitar3 = "quitar3";
                session3.setAttribute("quitar3", quitar3);

                view3 = request.getRequestDispatcher("coordinador/listaSolicitudesDeMascotaPerdida.jsp");
                view3.forward(request, response);
                break;




        }




    }



}
