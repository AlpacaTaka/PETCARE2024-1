<!--ESTA ES SOLO UNA PÁGINA CREADA PARA VER LAS FUNCIONES A IMPLEMENTARSE EN UN BOTON RESPONSIVE EN CADA CASO DADO-->


<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.iwebproyecto.beans.EventoBenefico" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="evento" class="com.example.iwebproyecto.beans.EventoBenefico" scope="request" />
<%
    DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd MMM.").withLocale(new Locale("es", "ES"));
    DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("hh:mm a").withLocale(new Locale("es", "ES"));
    LocalDate fechaEvento = evento.getFechaEvento();  // Obtener la fecha del evento
    LocalTime horaEvento = evento.getHoraInicio();    // Obtener la hora del evento

// Formatear la fecha y la hora
    String fechaFormateada = fechaEvento.format(formatoFecha);
    String horaFormateada = horaEvento.format(formatoHora);
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
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Evento CANinaton 5K</title>
</head>
<body>
    <div class="contenedor-p">
        
        <header class="cabecera">
            <div class="izquierda" onclick="toggleMenu()">
                <div class="menu-c">
                    <div>Menu</div>
                    <div class="burguer"><i class="fi-rr-menu-burger"></i></div>
                </div>
                <div class="welcome-text">Hola, Juan</div>
            </div>
            <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="/user/donacionMonetaria.jsp" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="/user/reportarMascotaPerdida.jsp" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                    <li><a href="/user/reportarMaltrato.jsp" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            <div id="menu" class="menu">
                <a href="/user/miPerfil.jsp">Mi Perfil</a>
                <a href="/user/misEventos.jsp">Mis Eventos</a>
                <a href="/user/misDonaciones.jsp" id="Sep">Mis Donaciones</a>
                <hr>
                <a href="/user/allEventos.jsp">Eventos</a>
                <a href="/user/postularAlbergue.jsp">Postular a Albergue</a>
                <a href="/user/postularTemporal.jsp">Hogar Temporal</a>
                <a href="/user/solicitudesDonacionSuministros.jsp">Donaciones de Suministros</a>
                <a href="/user/donacionMonetaria.jsp">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.jsp">Portal de Adopciones</a>
                <a href="/user/mascotasPerdidas.jsp">Portal de Mascotas Perdidas</a>
                <a href="/user/reportarMascotaPerdida.jsp">Reportar Mascota Perdida</a>
                <a href="/user/reportarMaltrato.jsp" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" class="btn btn-personal2" onclick="location.href='allEventos.jsp'"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 50px;">
                            <h2 class="card-title" style="margin-top: 10px;"><%=evento.getNombre()%></h2>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="${pageContext.request.contextPath}/<%=evento.getFoto().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="width: 100%; max-width: 100%; height: auto; border-radius: 15px;">
                            </div>
                            <div class="badge text-bg-primary text-wrap" style="margin-top: 10px; font-size: 1.5rem; padding: 10px 20px;">
                                <%= fechaFormateada + " " + horaFormateada %>
                            </div>
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getDescripcionEvento()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Artistas e Invitados Especiales:</strong></p>
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getInvitados()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Donación para la entrada al Evento:</strong></p>
                            <% if ("Monetario".equals(evento.getTipoDonacion())) { %>
                            <p class="card-text" style="text-align: left;"><strong>Valor de Entrada:</strong> S/ <%= evento.getDetalleMonetario() %></p>
                            <p class="card-text" style="text-align: left;">Recuerde que debe de cancelar su entrada al llegar al evento o a través del contacto directo con el Albergue</p>

                            <p class="card-text" style="text-align: left;"><strong>Contacto:</strong> <%= evento.getAlbergue().getNumeroContactoDonaciones() %></p>
                            <% } else if ("Suministros".equals(evento.getTipoDonacion())) { %>
                            <p><strong>Donación Solicitada:</strong> <%= evento.getDetalleSuministro() %></p>
                            <% } %>
                            <p class="card-text" style="margin-top: 10px; text-align: left;"> </p>
                            <p class="card-text" style="text-align: left;"><strong>Finalidad del Evento:</strong></p>
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getRazonEvento()%></p>
                            <hr>
                            <p class="card-text" style="margin-top: 10px;">La gestión de su donación como entrada será usada para la finalidad con la que se creo el evento. Ayudanos a seguir ayudando.</p>

                            <div class="col-md-12 p-1 d-flex justify-content-center">
                                <form action="TodosLosEventos" method="post">
                                    <input type="hidden" name="idEvento" value="<%= evento.getEventoAlbergueID()%>"/>
                                    <button type="submit" class="btn btn-personal d-flex"  style="font-size: 19px;">Inscribirse</button>
                                </form>

                            </div>
                        </div>
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

    <!--Pop up-->
    <dialog id="confirm-inscripcion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;"> Inscrito </h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p> Tu inscripción al evento ha sido exitosa, puedes visualizarla en la página de "Mis eventos"</p>
            <button type="submit" class="btn btn-personal"> Cerrar </button>
        </div>
    </dialog>

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>

<script>
    const inscripcionDialog = document.getElementById("confirm-inscripcion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");

    function showInscribirseDialog(){
        inscripcionDialog.showModal();
    }

    function closeInscripcionDialog(){
        inscripcionDialog.close();
    }

    inscripcionDialog.addEventListener("click", (e)=> {
        if(!contenidoPopDialog.contains(e.target)){
            inscripcionDialog.close();
        }
    })
</script>