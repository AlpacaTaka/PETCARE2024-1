package com.example.iwebproyecto.servlets;

import com.example.iwebproyecto.beans.*;
import com.example.iwebproyecto.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.sql.SQLException;

@WebServlet(name = "EventoServlet", urlPatterns = {"/eventos"})
public class EventoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        EventoDao eventoDao = new EventoDao();
        LugarEventoDao lugarEventoDao = new LugarEventoDao(); // Instancia del LugarEventoDao
        AlbergueDao albergueDao = new AlbergueDao(); // Instancia del AlbergueDao
        HttpSession session = request.getSession();
        Albergue albergue = (Albergue) session.getAttribute("albergue"); // Obtener el albergue de la sesión
        int albergueID = albergue.getAlbergueID();
        int eventoId = Integer.parseInt(request.getParameter("id"));
        ArrayList<LugarEvento> lugaresDisponibles = lugarEventoDao.obtenerTodosLugaresNoEliminados();

        switch (action) {
            case "lista":

                ArrayList<EventoBenefico> listaEventos = eventoDao.listarEventosPorAlbergue(albergueID); // Obtener eventos por albergue
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("/albergue/eventTable.jsp").forward(request, response);
                break;

            case "crear":
                request.setAttribute("lugaresDisponibles", lugaresDisponibles); // Agregar lugares disponibles al request
                request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                break;

            case "visualizar":
                EventoBenefico evento = eventoDao.obtenerEventoPorID(eventoId);
                request.setAttribute("evento", evento);

                request.getRequestDispatcher("/albergue/albergueVisEvento.jsp").forward(request, response);
                break;

            case "editar":
                EventoBenefico eventoEditar = eventoDao.obtenerEventoPorID(eventoId);
                request.setAttribute("evento", eventoEditar);

                request.setAttribute("lugaresDisponibles", lugaresDisponibles);



                request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                break;

            case "eliminar":
                String eliminarEventoId = request.getParameter("id");
                if (eliminarEventoId != null) {
                    try {
                        eventoId = Integer.parseInt(eliminarEventoId);
                        boolean eliminado = eventoDao.eliminarEvento(eventoId);
                        if (eliminado) {
                            // Redirigir a una página de éxito o mostrar un mensaje de éxito
                            response.sendRedirect(request.getContextPath() + "/eventos?action=lista");
                        } else {
                            // Manejar el caso en que no se pudo eliminar el evento (por ejemplo, no se encontró)
                            String mensajeError = "No se pudo eliminar el evento.";
                            request.setAttribute("mensajeError", mensajeError);
                            // Redirigir de nuevo a la lista o mostrar un mensaje de error en la misma página
                            request.getRequestDispatcher("/albergue/eventTable.jsp").forward(request, response);

                        }
                    } catch (NumberFormatException e) {
                        // Manejar el error si el parámetro "id" no es un número válido
                        e.printStackTrace(); // O mostrar un mensaje de error al usuario
                    }
                }
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
        EventoDao eventoDao = new EventoDao();
        DistritoDao distritoDao = new DistritoDao();
        AlbergueDao albergueDao = new AlbergueDao();
        FotoDao fotoDao = new FotoDao();
        LugarEventoDao lugarEventoDao = new LugarEventoDao();
        HttpSession session = request.getSession();
        Albergue albergue = (Albergue) session.getAttribute("albergue"); // Obtener el albergue de la sesión
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");


        switch (action) {
            case "guardar":
                // Get parameters, using the correct types and handling potential nulls
                String nombre = request.getParameter("nombre");
                String tipoDonacion = request.getParameter("tipoDonacion");
                Integer detalleMonetario = (request.getParameter("detalleMonetario") != null && !request.getParameter("detalleMonetario").isEmpty()) ? Integer.parseInt(request.getParameter("detalleMonetario")) : null;
                String detalleSuministro = request.getParameter("detalleSuministro");


                try {
                    LocalDate fechaEvento = LocalDate.parse(request.getParameter("fechaEvento"), dateFormatter);
                    LocalTime horaInicio = LocalTime.parse(request.getParameter("horaInicio"), timeFormatter);
                    LocalTime horaFin = LocalTime.parse(request.getParameter("horaFin"), timeFormatter);

                    int distritoId = Integer.parseInt(request.getParameter("distrito"));
                    Distrito distrito = distritoDao.obtenerDistritoPorId(distritoId);


                    int lugarId = Integer.parseInt(request.getParameter("lugar"));
                    LugarEvento lugar = lugarEventoDao.obtenerLugarHabilitadosPorID(lugarId);


                    int fotoId = Integer.parseInt(request.getParameter("foto"));
                    Foto foto = fotoDao.obtenerFotoPorId(fotoId);

                    String razonEvento = request.getParameter("razon");
                    String descripcionEvento = request.getParameter("descripcion");
                    String invitados = request.getParameter("invitados");



                    EventoBenefico nuevoEvento = new EventoBenefico();
                    nuevoEvento.setNombre(nombre);
                    nuevoEvento.setTipoDonacion(tipoDonacion);
                    nuevoEvento.setDetalleMonetario(detalleMonetario);
                    nuevoEvento.setDetalleSuministro(detalleSuministro);
                    nuevoEvento.setDistrito(distrito);
                    nuevoEvento.setFechaEvento(fechaEvento);
                    nuevoEvento.setLugar(lugar);
                    nuevoEvento.setHoraInicio(horaInicio);
                    nuevoEvento.setHoraFin(horaFin);
                    nuevoEvento.setRazonEvento(razonEvento);
                    nuevoEvento.setDescripcionEvento(descripcionEvento);
                    nuevoEvento.setInvitados(invitados);
                    nuevoEvento.setFoto(foto);
                    nuevoEvento.setAlbergue(albergue);
                    nuevoEvento.setAprobado(false);
                    nuevoEvento.setEliminado(false);



                    eventoDao.guardarEvento(nuevoEvento);
                    response.sendRedirect(request.getContextPath() + "/eventos?action=lista"); //cambie esto

                } catch (NumberFormatException | DateTimeParseException | SQLException e) {
                    // Handle parsing errors (e.g., invalid date/time or number format)
                    e.printStackTrace(); // Replace with appropriate error handling
                }
                break;


            case "actualizar":
                // Get parameters, using the correct types and handling potential nulls
                int eventoID = Integer.parseInt(request.getParameter("eventoAlbergueID"));
                nombre = request.getParameter("nombre");
                tipoDonacion = request.getParameter("tipoDonacion");
                detalleMonetario = (request.getParameter("detalleMonetario") != null && !request.getParameter("detalleMonetario").isEmpty()) ? Integer.parseInt(request.getParameter("detalleMonetario")) : null;
                detalleSuministro = request.getParameter("detalleSuministro");


                try {
                    LocalDate fechaEvento = LocalDate.parse(request.getParameter("fechaEvento"), dateFormatter);
                    LocalTime horaInicio = LocalTime.parse(request.getParameter("horaInicio"), timeFormatter);
                    LocalTime horaFin = LocalTime.parse(request.getParameter("horaFin"), timeFormatter);

                    int distritoId = Integer.parseInt(request.getParameter("distrito"));
                    Distrito distrito = distritoDao.obtenerDistritoPorId(distritoId);


                    int lugarId = Integer.parseInt(request.getParameter("lugar"));
                    LugarEvento lugar = lugarEventoDao.obtenerLugarHabilitadosPorID(lugarId);


                    int fotoId = Integer.parseInt(request.getParameter("foto"));
                    Foto foto = fotoDao.obtenerFotoPorId(fotoId);

                    String razonEvento = request.getParameter("razon");
                    String descripcionEvento = request.getParameter("descripcion");
                    String invitados = request.getParameter("invitados");



                    EventoBenefico nuevoEvento = new EventoBenefico();
                    nuevoEvento.setEventoAlbergueID(eventoID);
                    nuevoEvento.setNombre(nombre);
                    nuevoEvento.setTipoDonacion(tipoDonacion);
                    nuevoEvento.setDetalleMonetario(detalleMonetario);
                    nuevoEvento.setDetalleSuministro(detalleSuministro);
                    nuevoEvento.setDistrito(distrito);
                    nuevoEvento.setFechaEvento(fechaEvento);
                    nuevoEvento.setLugar(lugar);
                    nuevoEvento.setHoraInicio(horaInicio);
                    nuevoEvento.setHoraFin(horaFin);
                    nuevoEvento.setRazonEvento(razonEvento);
                    nuevoEvento.setDescripcionEvento(descripcionEvento);
                    nuevoEvento.setInvitados(invitados);
                    nuevoEvento.setFoto(foto);
                    nuevoEvento.setAlbergue(albergue);
                    nuevoEvento.setAprobado(false);
                    nuevoEvento.setEliminado(false);



                    eventoDao.actualizarEvento(nuevoEvento);
                    response.sendRedirect(request.getContextPath() + "/eventos?action=lista"); //cambie esto

                } catch (NumberFormatException | DateTimeParseException | SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }
}