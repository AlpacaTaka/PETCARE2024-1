<%@ page import="com.example.iwebproyecto.beans.MascotasAdopcion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.iwebproyecto.beans.EventoBenefico" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="com.example.iwebproyecto.beans.DonacionSuministros" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />
<%
    ArrayList<MascotasAdopcion> listaAdopcion = (ArrayList) request.getAttribute("listaAdopcion");
    ArrayList<PublicacionMascotaPerdida> listaPerdidos = (ArrayList) request.getAttribute("mascotasPerdidas");
    ArrayList<DonacionSuministros> listaDonaciones = (ArrayList) request.getAttribute("donaciones");
    DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd MMM.").withLocale(new Locale("es", "ES"));
    DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("hh:mm a").withLocale(new Locale("es", "ES"));
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/inicio.css">
    <title>Inicio</title>
    <style>


    </style>
</head>
<body>
<div class="contenedor-p">

    <header class="cabecera">
        <div class="izquierda" onclick="toggleMenu()">
            <div class="menu-c">
                <div>Menu</div>
                <div class="burguer"><i class="fi-rr-menu-burger"></i></div>
            </div>
            <div class="welcome-text">Hola, <%= UsuarioSession.getNombre() %></div>
        </div>
        <div class="logo"><a href="/user/inicio.html"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="${pageContext.request.contextPath}/MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/TodosLosEventos" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/PostulacionTemporal" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/SolicitudesDeSuministros" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/TodosLosAlbergues" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/Inicio" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>

                <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="${pageContext.request.contextPath}/MiPerfilUsuario">Mi Perfil</a>
            <a href="${pageContext.request.contextPath}/MisEventosUsuario">Mis Eventos</a>
            <a href="${pageContext.request.contextPath}/MisDonacionesUsuario" id="Sep">Mis Donaciones</a>
            <hr>
            <a href="${pageContext.request.contextPath}/TodosLosEventos">Eventos</a>
            <a href="${pageContext.request.contextPath}/PostulacionTemporal">Hogar Temporal</a>
            <a href="${pageContext.request.contextPath}/SolicitudesDeSuministros">Donaciones de Suministros</a>
            <a href="${pageContext.request.contextPath}/TodosLosAlbergues">Donaciones Monetarias</a>
            <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal de Adopciones</a>
            <a href="${pageContext.request.contextPath}/Inicio">Portal de Mascotas Perdidas</a>
            <a href="${pageContext.request.contextPath}/Inicio">Portal Avistamiento Perdidos</a>
            <a href="${pageContext.request.contextPath}/Inicio">Reportar Mascota Perdida</a>
            <a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" id="Sep">Reportar Maltrato</a>
            <hr>
            <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>

        </div>


        <div class="container-fluid" id="contenido-principal" >


            <div class="row d-flex justify-content-center " id="contenido-nofooter">

                <!--Escribir aca contenido de la web-->


                <!--Lo demas no tocar para que se mantenga todo funcional-->

                <!-- Contenido izquierda puede cambiar de acuerdo a lo que se quiere en la pagina-->
                <div class="col-md-9 " id="contenidoIzquierda" style="max-width: 1200px;">

                    <div class="container" id="Eventos">
                        <h1>Eventos Benéficos</h1>

                        <!-- Carrusel de Eventos-->
                        <div id="carouselEvento" class="carousel carousel-dark slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <%
                                    ArrayList<EventoBenefico> eventos = (ArrayList<EventoBenefico>) request.getAttribute("eventos");
                                    for (int i = 0; i < eventos.size(); i++) {

                                        EventoBenefico evento = eventos.get(i);
                                        LocalDate fechaEvento = evento.getFechaEvento();  // Obtener la fecha del evento
                                        LocalTime horaEvento = evento.getHoraInicio();    // Obtener la hora del evento

                                        // Formatear la fecha y la hora
                                        String fechaFormateada = fechaEvento.format(formatoFecha);
                                        String horaFormateada = horaEvento.format(formatoHora);
                                %>
                                <div class="carousel-item <%= (i == 0 ? "active" : "") %>">
                                    <div class="d-flex justify-content-center">
                                        <div class="card" style="width: 100%;">
                                            <div class="row g-0">
                                                <div class="col-md-8">
                                                    <img src="${pageContext.request.contextPath}/<%=evento.getFoto().getRutaFoto()%>"
                                                         class="card-img-eve" alt="<%= evento.getNombre() %>"
                                                         onerror="this.onerror=null; this.src='https://placehold.co/700x400?text=Imagen+No+Disponible';">
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center">
                                                    <div class="card-body">
                                                        <h4 class="card-title"><%= evento.getNombre() %></h4>
                                                        <div class="badge text-bg-primary text-wrap" style="width: 8rem;">
                                                            <%= fechaFormateada + " " + horaFormateada %>
                                                        </div>
                                                        <p class="card-text"><%= evento.getDescripcionEvento() %></p>
                                                        <a href="TodosLosEventos?action=visualizar&id=<%= evento.getEventoAlbergueID() %>" class="btn btn-personal" style="margin-bottom: 10px">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>


                            <!-- Indicadores -->
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                        </div>
                        <!-- Botonera de Ver mas Eventos-->
                        <div class="boton-contenedor">
                            <a href="${pageContext.request.contextPath}/TodosLosEventos" class="btn btn-personal2">Ver más Eventos</a>
                        </div>

                    </div>


                    <!-- Botonera de Adopta y Temporal-->
                    <div class="container" id="BOTONES" style="margin-top: 50px;">

                        <div class="container text-center" id="contenedor-btn-dos">
                            <div class="row" style="gap: 5px;">
                                <div class="col ">
                                    <div class="d-grid " style="align-content: center;">
                                        <a href="${pageContext.request.contextPath}/PortalDeAdopcion">
                                            <button class="btn btn-personal btn-lg" type="button" style="width: 100%;">
                                                <i class="fi-rr-cat-dog" style="font-size: 20px;"></i><div>Adopta una Mascota</div></button>
                                        </a>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="d-grid ">
                                        <a href="${pageContext.request.contextPath}/Inicio"><button class="btn btn-personal btn-lg" type="button" style="width: 100%;">
                                            <i class="fi-rr-home-heart" style="font-size: 20px;"></i><div>Inscribete como hogar temporal</div>
                                        </button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="container" id="Donaciones">

                        <h1> Solicitudes de Donaciones</h1>

                        <!--Carrusel  de Donaciones para Computadoras-->

                        <!-- Carrusel visible solo en desktop (lg en adelante) -->
                        <div class="container d-none d-lg-block">


                            <div id="carouselDonaciones-desk" class="carousel carousel-dark slide" data-bs-ride="carousel" data-bs-interval="3000">
                                <div class="carousel-inner">

                                    <%
                                        int contador = 0; // Contador para controlar los slides
                                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        DateTimeFormatter timeFormat = DateTimeFormatter.ofPattern("HH:mm:ss");

                                        for (DonacionSuministros donacion : listaDonaciones) {
                                            String activeClass = (contador == 0) ? "active" : "";

                                            Date fechaInicio = null;
                                            Date fechaFin = null;
                                            LocalTime horaInicio = null;
                                            LocalTime horaFin = null;

                                            boolean datosValidos = true;

                                            try {
                                                // Convertir las fechas de String a Date
                                                fechaInicio = dateFormat.parse(donacion.getFechaInicioRecepcion());
                                                fechaFin = dateFormat.parse(donacion.getFechaFinRecepcion());

                                                // Convertir las horas de String a LocalTime
                                                horaInicio = LocalTime.parse(donacion.getHoraInicioRecepcion(), timeFormat);
                                                horaFin = LocalTime.parse(donacion.getHoraFinRecepcion(), timeFormat);
                                            } catch (Exception e) {
                                                datosValidos = false; // Si ocurre una excepción, los datos no son válidos
                                            }

                                            // Obtener la fecha y hora actual
                                            Date fechaActual = new Date(); // Fecha actual
                                            LocalTime horaActual = LocalTime.now(); // Hora actual

                                            String estadoDonacion = "Pasado"; // Por defecto es "Pasado"

                                            if (datosValidos) {
                                                // Revisar si la fecha actual está antes de la fecha de inicio o dentro del rango de fechas
                                                if (fechaActual.before(fechaInicio) ||
                                                        (!fechaActual.before(fechaInicio) && !fechaActual.after(fechaFin))) {

                                                    // Si estamos en la fecha de inicio, revisar la hora de inicio
                                                    if (fechaActual.equals(fechaInicio)) {
                                                        if (!horaActual.isBefore(horaInicio)) {
                                                            estadoDonacion = "Activo";
                                                        }
                                                    }
                                                    // Si estamos en la fecha de fin, revisar la hora de fin
                                                    else if (fechaActual.equals(fechaFin)) {
                                                        if (!horaActual.isAfter(horaFin)) {
                                                            estadoDonacion = "Activo";
                                                        }
                                                    }
                                                    // Fechas intermedias o fechas futuras
                                                    else {
                                                        estadoDonacion = "Activo";
                                                    }
                                                }
                                            }
                                    %>
                                    <% if (contador % 3 == 0) { %>
                                    <!-- Empieza un nuevo slide cada 3 tarjetas -->
                                    <div class="carousel-item <%= activeClass %>">
                                        <div class="row">
                                            <% } %>

                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="${pageContext.request.contextPath}/<%=donacion.getFoto().getRutaFoto()%>" class="card-img-top card-img-adop" alt="..."
                                                         onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                                    <div class="card-body">
                                                        <div class="badge text-bg-<%= estadoDonacion.equals("Activo") ? "success" : "secondary" %> text-wrap" style="width: 7rem;">
                                                            <%= estadoDonacion %>
                                                        </div>
                                                        <h5 class="card-title"><%= donacion.getTituloAvisoDonacion() %></h5>
                                                        <a href="<%=request.getContextPath()%>/SolicitudesDeSuministros?action=vista&id=<%= donacion.getDonacionSuministrosID() %>" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <% if ((contador + 1) % 3 == 0 || contador == listaDonaciones.size() - 1) { %>
                                            <!-- Cierra la fila y el slide después de 3 tarjetas o si es el último elemento -->
                                        </div> <!-- Cierra la fila -->
                                    </div> <!-- Cierra el slide -->
                                    <% } %>

                                    <%
                                            contador++; // Aumenta el índice después de cada tarjeta
                                        }
                                    %>
                                </div>

                                <!-- Controles del carrusel -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselDonaciones-desk" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Anterior</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselDonaciones-desk" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Siguiente</span>
                                </button>
                            </div>





                        </div>


                        <!--Carrusel para dispositivos moviles-->
                        <!-- Carrusel para pantallas medianas y pequeñas (1 card por slide) -->
                        <div class="container d-lg-none">
                            <div id="carouselDonaciones-mobile" class="carousel carousel-dark slide" data-bs-ride="carousel" data-bs-interval="3000">
                                <div class="carousel-inner">
                                    <%
                                        contador = 0; // Reiniciamos el contador
                                        for (DonacionSuministros donacion : listaDonaciones) {
                                            String activeClass = (contador == 0) ? "active" : "";

                                            Date fechaInicio = null;
                                            Date fechaFin = null;
                                            LocalTime horaInicio = null;
                                            LocalTime horaFin = null;

                                            boolean datosValidos = true;

                                            try {
                                                // Convertir las fechas de String a Date
                                                fechaInicio = dateFormat.parse(donacion.getFechaInicioRecepcion());
                                                fechaFin = dateFormat.parse(donacion.getFechaFinRecepcion());

                                                // Convertir las horas de String a LocalTime
                                                horaInicio = LocalTime.parse(donacion.getHoraInicioRecepcion(), timeFormat);
                                                horaFin = LocalTime.parse(donacion.getHoraFinRecepcion(), timeFormat);
                                            } catch (Exception e) {
                                                datosValidos = false;
                                            }

                                            Date fechaActual = new Date();
                                            LocalTime horaActual = LocalTime.now();

                                            String estadoDonacion = "Pasado";
                                            if (datosValidos) {
                                                if (fechaActual.before(fechaInicio) ||
                                                        (!fechaActual.before(fechaInicio) && !fechaActual.after(fechaFin))) {
                                                    if (fechaActual.equals(fechaInicio)) {
                                                        if (!horaActual.isBefore(horaInicio)) {
                                                            estadoDonacion = "Activo";
                                                        }
                                                    } else if (fechaActual.equals(fechaFin)) {
                                                        if (!horaActual.isAfter(horaFin)) {
                                                            estadoDonacion = "Activo";
                                                        }
                                                    } else {
                                                        estadoDonacion = "Activo";
                                                    }
                                                }
                                            }
                                    %>
                                    <!-- Cada slide tiene solo una tarjeta -->
                                    <div class="carousel-item <%= activeClass %>">
                                        <div class="card card-don">
                                            <img src="${pageContext.request.contextPath}/<%=donacion.getFoto().getRutaFoto()%>"
                                                 class="card-img-top card-img-don-movil" alt="..."
                                                 onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                            <div class="card-body">
                                                <div class="badge text-bg-<%= estadoDonacion.equals("Activo") ? "success" : "secondary" %> text-wrap" style="width: 7rem;">
                                                    <%= estadoDonacion %>
                                                </div>
                                                <h5 class="card-title"><%= donacion.getTituloAvisoDonacion() %></h5>
                                                <a href="<%=request.getContextPath()%>/SolicitudesDeSuministros?action=vista&id=<%= donacion.getDonacionSuministrosID() %>"
                                                   class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                            contador++; // Incrementamos el contador
                                        }
                                    %>
                                </div>

                                <!-- Controles del carrusel -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselDonaciones-mobile" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Anterior</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselDonaciones-mobile" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Siguiente</span>
                                </button>
                            </div>
                        </div>



                        <!-- Botonera de Ver mas Solicitudes de Donacion-->
                        <div class="boton-contenedor">
                            <a href="${pageContext.request.contextPath}/SolicitudesDeSuministros" class="btn btn-personal2">Ver más Solicitudes</a>
                        </div>


                    </div>
                    <div class="container">
                        <h1>Adopta</h1>
                        <!-- Carrusel para Escritorio (4 cards por slide) -->
                        <div id="Adop-dsk" class="carousel carousel-dark slide d-none d-lg-block" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <%
                                    int i = 0; // Contador para controlar los slides
                                    for (MascotasAdopcion mascota : listaAdopcion) {
                                        String activeClass = (i == 0) ? "active" : ""; // Solo el primer elemento será activo
                                %>
                                <% if (i % 4 == 0) { %>
                                <!-- Empieza un nuevo slide cada 4 tarjetas -->
                                <div class="carousel-item <%= activeClass %>">
                                    <div class="row">
                                        <% } %>

                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <!-- Aquí puedes acceder a las propiedades de la mascota -->
                                                <img src="${pageContext.request.contextPath}/<%=mascota.getFoto().getRutaFoto()%>" class="card-img-top card-img-adop" alt="..."
                                                     onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%= mascota.getNombreMascota() %></h5>
                                                    <a href="PortalDeAdopcion?action=vista&id=<%=mascota.getIdAdopcion()%>" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>

                                        <% if ((i+1) % 4 == 0 || i == listaAdopcion.size() - 1) { %>
                                        <!-- Cierra la fila y el slide después de 4 tarjetas o si es el último elemento -->
                                    </div> <!-- Cierra la fila -->
                                </div> <!-- Cierra el slide -->
                                <% } %>

                                <%
                                        i++; // Aumenta el índice después de cada tarjeta
                                    }
                                %>
                            </div>


                            <button class="carousel-control-prev" type="button" data-bs-target="#Adop-dsk" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#Adop-dsk" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                        <!-- Carrusel para Tablet (2 cards por slide) -->
                        <div id="Adop-tablet" class="carousel carousel-dark slide d-none d-md-block d-lg-none" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <%
                                    i = 0;
                                    for (MascotasAdopcion mascota : listaAdopcion) {
                                        String activeClass = (i == 0) ? "active" : "";
                                %>
                                <% if (i % 2 == 0) { %>
                                <!-- Empieza un nuevo slide cada 2 tarjetas -->
                                <div class="carousel-item <%= activeClass %>">
                                    <div class="row">
                                        <% } %>

                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="${pageContext.request.contextPath}/<%=mascota.getFoto().getRutaFoto()%>"
                                                     class="card-img-top card-img-adop" alt="..."
                                                     onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%= mascota.getNombreMascota() %></h5>
                                                    <a href="PortalDeAdopcion?action=vista&id=<%=mascota.getIdAdopcion()%>" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>

                                        <% if ((i + 1) % 2 == 0 || i == listaAdopcion.size() - 1) { %>
                                    </div> <!-- Cierra la fila -->
                                </div> <!-- Cierra el slide -->
                                <% } %>
                                <%
                                        i++;
                                    }
                                %>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#Adop-tablet" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#Adop-tablet" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                        <!-- Carrusel para Móvil (1 card por slide) -->
                        <div id="Adop-telf" class="carousel carousel-dark slide d-block d-md-none" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <%
                                    i = 0;
                                    for (MascotasAdopcion mascota : listaAdopcion) {
                                        String activeClass = (i == 0) ? "active" : "";
                                %>
                                <div class="carousel-item <%= activeClass %>">
                                    <div class="card card-don">
                                        <img src="${pageContext.request.contextPath}/<%=mascota.getFoto().getRutaFoto()%>"
                                             class="card-img-top card-img-don-movil" alt="..."
                                             onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                        <div class="card-body">
                                            <h5 class="card-title"><%= mascota.getNombreMascota() %></h5>
                                            <a href="PortalDeAdopcion?action=vista&id=<%=mascota.getIdAdopcion()%>" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                    }
                                %>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#Adop-telf" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#Adop-telf" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                        <div class="boton-contenedor">
                            <a href="${pageContext.request.contextPath}/PortalDeAdopcion" class="btn btn-personal2">Ver Portal de Adopciones</a>
                        </div>



                    </div>
                </div>

                <!-- Contenido derecha no puede cambiar-->
                <div class="col-md-3 d-flex flex-column" id="contenidoDerecha" style="max-width: 600px;">
                    <div class="container" id="MascotasPerdidas" >
                        <h1> Mascotas perdidas</h1>
                        <div class="grid-container" id="grilla-perdidos">
                            <!-- Card 1 -->

                            <%
                                LocalDate hoy = LocalDate.now();
                                for (PublicacionMascotaPerdida perdido : listaPerdidos) {
                                    LocalDate fechaPerdida = perdido.getFechaPerdida();
                                    long diasPerdidos = java.time.temporal.ChronoUnit.DAYS.between(fechaPerdida, hoy);
                            %>
                            <div class="card .perdido">
                                <img src="${pageContext.request.contextPath}/<%=perdido.getFoto().getRutaFoto()%>" class="card-img-top card-img-don" alt="Canela"
                                     onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                <div class="card-body">
                                    <h5 class="card-title text-center"><%= perdido.getNombreMascota() %></h5>
                                    <p class="card-text"><strong>Lugar de extravío: </strong><%= perdido.getLugarPerdida() %></p>
                                    <p class="card-text"><strong>Días perdido: </strong><%= diasPerdidos %></p>
                                </div>
                            </div>
                            <%
                                }
                            %>



                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}//Inicio" class="btn btn-personal m-2" id="btn-crd-cr">Ver más</a>



                </div>

            </div>


            <!-- Footer (no tocar si ya esta listo)-->
            <footer class="pt-4">
                <div class="container">
                    <!-- Copyright  y Soporte-->
                    <div class="text-end">
                        <p> Soporte: soporte@teletubbies.com</p>
                    </div>
                </div>
            </footer>
        </div>

    </div>
</div>

<script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



</body>
</html>