package com.example.iwebproyecto.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.DonacionesDao;
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
        Usuario u = (Usuario) request.getSession().getAttribute("UsuarioSession");
        if (u == null) {
            // Si no hay usuario en la sesión, redirigir al login
            response.sendRedirect(request.getContextPath());
            return;
        }
        else {
            switch (action){
                case "lista"://voy a crear un nuevo trabajo


                    MascotasDao mascotasDao = new MascotasDao();
                    EventoDao eventoDao = new EventoDao();
                    DonacionesDao donacionesDao = new DonacionesDao();

                    ArrayList<EventoBenefico> listaEventos =eventoDao.listarEventosFuturosAleatorios3() ;
                    ArrayList<MascotasAdopcion> listaMascotasAdopcion= mascotasDao.listarMascotasActivasAdopcion8();
                    ArrayList<PublicacionMascotaPerdida> listaPerdidos = mascotasDao.listarNoEncontradasYAprobadasMasDiasPerdido5();

                    ArrayList<DonacionSuministros> listarDonaciones = donacionesDao.listarInicioDonacioneaSuministros();


                    request.setAttribute("donaciones", listarDonaciones) ;
                    request.setAttribute("eventos", listaEventos) ;
                    request.setAttribute("mascotasPerdidas", listaPerdidos);
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



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Llama al método doGet para manejar solicitudes POST de la misma manera
        doGet(request, response);
    }
}
