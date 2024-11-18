package com.example.iwebproyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.example.iwebproyecto.beans.EventoBenefico;
import com.example.iwebproyecto.beans.MascotasAdopcion;
import com.example.iwebproyecto.beans.PublicacionMascotaPerdida;
import com.example.iwebproyecto.daos.EventoDao;
import com.example.iwebproyecto.daos.MascotasDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet(name = "InicioUsuarioServlet", value = "/Inicio")
public class InicioUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establece el tipo de contenido de la respuesta
        response.setContentType("text/html");


        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        switch (action){
            case "lista"://voy a crear un nuevo trabajo


                MascotasDao mascotasDao = new MascotasDao();
                EventoDao eventoDao = new EventoDao();

                ArrayList<EventoBenefico> listaEventos =eventoDao.listarEventosFuturosAleatorios3() ;
                ArrayList<MascotasAdopcion> listaMascotasAdopcion= mascotasDao.listarMascotasActivasAdopcion8();
                ArrayList<PublicacionMascotaPerdida> listaPerdidos = mascotasDao.listarNoEncontradasYAprobadasMasDiasPerdido5();
                System.out.println("Lista de Adopciones: " + listaMascotasAdopcion.size() + " elementos.");
                System.out.println("Lista de Perdidos: " + listaPerdidos.size()+ " elementos.");
                System.out.println("Lista de Eventos: " + listaEventos.size()+ " elementos.");
                request.setAttribute("listaMascotas", listaMascotasAdopcion);
                request.setAttribute("mascotasPerdidas", listaMascotasAdopcion);
                request.setAttribute("listaAdopcion", listaMascotasAdopcion);

                // Obtiene el RequestDispatcher para la página JSP

                RequestDispatcher rd = request.getRequestDispatcher("user/inicio.jsp");

                // Reenvía la solicitud y la respuesta al JSP
                rd.forward(request, response);
                break;
            case "e": //voy a actualizar

                break;
            case "s":


                break;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método doGet para manejar solicitudes POST de la misma manera
        doGet(request, response);
    }
}
