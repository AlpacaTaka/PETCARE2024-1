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



@WebServlet(name = "EventoServlet", urlPatterns = {"/eventos"})
public class EventoServlet extends HttpServlet {

    private static final int ALBERGUE_ID = 6;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        EventoDao eventoDao = new EventoDao();
        AlbergueDao albergueDao = new AlbergueDao();
        LugarEventoDao lugarEventoDao = new LugarEventoDao(); // Instancia del LugarEventoDao
        Albergue albergue = albergueDao.obtenerAlberguePorID(6);
        ArrayList<LugarEvento> lugaresDisponibles = lugarEventoDao.obtenerTodosLugaresNoEliminados();

        switch (action) {
            case "lista":

                ArrayList<EventoBenefico> listaEventos = eventoDao.listarEventosPorAlbergue(ALBERGUE_ID); // Obtener eventos por albergue
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("/albergue/eventTable.jsp").forward(request, response);
                break;

            case "crear":
                request.setAttribute("lugaresDisponibles", lugaresDisponibles); // Agregar lugares disponibles al request
                request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                break;

            case "visualizar":
                int eventoId = Integer.parseInt(request.getParameter("eventoAlbergueID"));
                EventoBenefico evento = eventoDao.obtenerEventoPorID(eventoId);
                request.setAttribute("evento", evento);
                request.getRequestDispatcher("/albergue/albergueVisEvento.jsp").forward(request, response);
                break;

            case "editar":
                eventoId = Integer.parseInt(request.getParameter("eventoAlbergueID"));
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
                            response.sendRedirect(request.getContextPath() + "/eventos?action=lista");
                        } else {
                            String mensajeError = "No se pudo eliminar el evento.";
                            request.setAttribute("mensajeError", mensajeError);
                            request.getRequestDispatcher("/albergue/eventTable.jsp").forward(request, response);
                        }
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
                break;

            case "getLugares":
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();

                try {
                    int distritoId = Integer.parseInt(request.getParameter("distritoId"));
                    ArrayList<LugarEvento> lugares = lugarEventoDao.obtenerLugaresPorDistrito(distritoId);

                    out.println("<option value=''>Seleccione un local</option>");
                    for (LugarEvento lugar : lugares) {
                        out.println("<option value='" + lugar.getLugarID() + "' " +
                                "data-aforo='" + lugar.getAforoMax() + "' " +
                                "data-direccion='" + lugar.getDireccionLugar() + "'>" +
                                lugar.getNombreLugar() + "</option>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<option value=''>Error: Distrito inválido</option>");
                } catch (Exception e) {
                    out.println("<option value=''>Error al cargar lugares</option>");
                } finally {
                    out.close();
                }
                break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        EventoDao eventoDao = new EventoDao();
        DistritoDao distritoDao = new DistritoDao();
        FotoDao fotoDao = new FotoDao();
        LugarEventoDao lugarEventoDao = new LugarEventoDao();
        AlbergueDao albergueDao = new AlbergueDao();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Cambiado para coincidir con el formato HTML
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
        Albergue albergue = albergueDao.obtenerAlberguePorID(6);


        try {
            switch (action) {
                case "guardar":
                    // Obtener parámetros del formulario
                    String nombre = request.getParameter("nombre");

                    System.out.println("Nombre del evento: " + nombre);

                    String fechaEventoStr = request.getParameter("fechaEvento");
                    System.out.println("Fecha del evento (string): " + fechaEventoStr);


                    String tipoDonacion = request.getParameter("tipoDonacion");
                    System.out.println("Tipo de donacion: " + tipoDonacion);
                    Integer detalleMonetario = getIntegerParameter(request, "detalleMonetario");
                    System.out.println("Detalle monetario: " + detalleMonetario);
                    String detalleSuministro = request.getParameter("detalleSuministro");
                    System.out.println("Detalle suministro: " + detalleSuministro);
                    LocalDate fechaEvento = LocalDate.parse(request.getParameter("fechaEvento"), dateFormatter);
                    LocalTime horaInicio = LocalTime.parse(request.getParameter("horaInicio"), timeFormatter);
                    LocalTime horaFin = LocalTime.parse(request.getParameter("horaFin"), timeFormatter);
                    int distritoId = Integer.parseInt(request.getParameter("distrito"));
                    int lugarId = Integer.parseInt(request.getParameter("lugar"));
                    System.out.println("Id del lugar: " + lugarId);
                    String razonEvento = request.getParameter("razon");
                    String descripcionEvento = request.getParameter("descripcion");
                    String invitados = request.getParameter("invitados");

                    Part filePart = request.getPart("foto");
                    Foto foto = procesarImagen(filePart, request, response, fotoDao);
                    if (foto == null) return;

                    EventoBenefico nuevoEvento = new EventoBenefico();
                    nuevoEvento.setNombre(nombre);
                    nuevoEvento.setTipoDonacion(tipoDonacion);
                    nuevoEvento.setDetalleMonetario(detalleMonetario);
                    nuevoEvento.setDetalleSuministro(detalleSuministro);
                    nuevoEvento.setDistrito(distritoDao.obtenerDistritoPorId(distritoId));
                    nuevoEvento.setFechaEvento(fechaEvento);
                    nuevoEvento.setLugar(lugarEventoDao.obtenerLugarHabilitadosPorID(lugarId));
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
                    response.sendRedirect(request.getContextPath() + "/eventos?action=lista");
                    break;

                case "actualizar":
                    // Obtener parámetros del formulario (similar a "guardar")
                    int eventoID = Integer.parseInt(request.getParameter("eventoAlbergueID"));
                    nombre = request.getParameter("nombre");
                    tipoDonacion = request.getParameter("tipoDonacion");
                    detalleMonetario = getIntegerParameter(request, "detalleMonetario");
                    detalleSuministro = request.getParameter("detalleSuministro");
                    fechaEvento = LocalDate.parse(request.getParameter("fechaEvento"), dateFormatter);
                    horaInicio = LocalTime.parse(request.getParameter("horaInicio"), timeFormatter);
                    horaFin = LocalTime.parse(request.getParameter("horaFin"), timeFormatter);
                    distritoId = Integer.parseInt(request.getParameter("distrito"));
                    lugarId = Integer.parseInt(request.getParameter("lugar"));
                    razonEvento = request.getParameter("razon");
                    descripcionEvento = request.getParameter("descripcion");
                    invitados = request.getParameter("invitados");

                    filePart = request.getPart("foto");
                    foto = procesarImagen(filePart, request, response, fotoDao);
                    if (foto == null) return; // Error en el procesamiento, ya manejado en procesarImagen

                    // Actualizar el evento
                    EventoBenefico eventoActualizar = new EventoBenefico();
                    eventoActualizar.setEventoAlbergueID(eventoID);
                    eventoActualizar.setNombre(nombre);
                    eventoActualizar.setTipoDonacion(tipoDonacion);
                    eventoActualizar.setDetalleMonetario(detalleMonetario);
                    eventoActualizar.setDetalleSuministro(detalleSuministro);
                    eventoActualizar.setDistrito(distritoDao.obtenerDistritoPorId(distritoId));
                    eventoActualizar.setFechaEvento(fechaEvento);
                    eventoActualizar.setLugar(lugarEventoDao.obtenerLugarHabilitadosPorID(lugarId));
                    eventoActualizar.setHoraInicio(horaInicio);
                    eventoActualizar.setHoraFin(horaFin);
                    eventoActualizar.setRazonEvento(razonEvento);
                    eventoActualizar.setDescripcionEvento(descripcionEvento);
                    eventoActualizar.setInvitados(invitados);
                    eventoActualizar.setFoto(foto);
                    eventoActualizar.setAlbergue(albergue);
                    eventoActualizar.setAprobado(false);
                    eventoActualizar.setEliminado(false);

                    eventoDao.actualizarEvento(eventoActualizar);
                    response.sendRedirect(request.getContextPath() + "/eventos?action=lista");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensajeError", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
        }
    }

    private Integer getIntegerParameter(HttpServletRequest request, String parameterName) {
        String parameterValue = request.getParameter(parameterName);
        if (parameterValue != null && !parameterValue.isEmpty()) {
            try {
                return Integer.parseInt(parameterValue);
            } catch (NumberFormatException e) {
                // Manejo de error: El parámetro no es un entero válido.  Registra el error
                System.err.println("Error: Parámetro '" + parameterName + "' no es un entero válido: " + parameterValue);
                e.printStackTrace(); // Reemplaza con logging adecuado para producción
                return null; // Indica que el parámetro no es un entero
            }
        }
        return null; // Indica que el parámetro es nulo o vacío
    }

    private Foto procesarImagen(Part filePart, HttpServletRequest request, HttpServletResponse response, FotoDao fotoDao) throws IOException, ServletException, SQLException {
        if (filePart != null && filePart.getSubmittedFileName() != null && !filePart.getSubmittedFileName().isEmpty()) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            // Validar que sea una imagen PNG
            if (!fileName.toLowerCase().endsWith(".png")) {
                request.setAttribute("mensajeError", "El archivo debe ser una imagen PNG.");
                request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                return null; // Indica un error
            }

            // Define la ruta completa donde se guardará la imagen
            String relativePath = "/common/img/eventos/" + fileName;
            String basePath = getServletContext().getRealPath("");
            String filePath = basePath + relativePath;
            try (InputStream inputStream = filePart.getInputStream()) {
                Path path = Paths.get(filePath);
                Files.copy(inputStream, path, StandardCopyOption.REPLACE_EXISTING);

                // Crea un objeto Foto y guarda la información en la base de datos
                Foto foto = new Foto();
                foto.setRutaFoto(relativePath);
                int fotoId = fotoDao.guardarFoto(foto);
                if (fotoId <= 0) { // Maneja el posible fallo en guardarFoto()
                    request.setAttribute("mensajeError", "Error al guardar la foto en la base de datos.");
                    request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                    return null; // Indica un error
                }
                foto.setFotoID(fotoId); // Asigna el ID generado a la foto
                return foto;
            } catch (IOException e) {
                request.setAttribute("mensajeError", "Error al guardar la imagen: " + e.getMessage());
                request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
                return null; // Indica un error
            }
        } else {
            request.setAttribute("mensajeError", "Debe subir una imagen PNG.");
            request.getRequestDispatcher("/albergue/albergueFormEvento.jsp").forward(request, response);
            return null; // Indica que no se subió ninguna imagen
        }
    }


}