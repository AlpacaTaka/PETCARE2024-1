
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="com.example.iwebproyecto.beans.EventoBenefico" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />
<%
    ArrayList<PublicacionMascotaPerdida> listaPerdidos = (ArrayList) request.getAttribute("mascotasPerdidas");
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
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Mis Eventos</title>
    <style>
        .card-body{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        }
        .img-fluid{
            height: 270px;
            background: cover;
            object-fit: cover;
            width: 250px;
        }
        .card{
            border-radius: 20px;
            overflow: hidden;
        }
        

        @media (max-width: 768px) {
    
            .img-fluid{
                height: 250px; /* Asegura que la imagen ocupe toda la altura del contenedor */
                width: 100%;
                object-fit: cover; /* Ajuste perfecto sin deformar la imagen */
            }
        }
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
            <div class="logo"><a href="${pageContext.request.contextPath}/Inicio"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></a></div>
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
                    <li><a href="${pageContext.request.contextPath}/ReportarPerdido" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>

                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
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
                <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal de Mascotas Perdidas</a>
                <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal Avistamiento Perdidos</a>
                <a href="${pageContext.request.contextPath}/ReportarPerdido">Reportar Mascota Perdida</a>
                <a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%;max-width: 900px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" oonclick="window.history.back()">  Regresar   </button>
                    </div>
                    <div class="container md-8" style="width: 85%;max-width: 900px; background-color:#eb903b76; border-radius: 30px; padding:  20px;">
                        <h1 style="margin-top: 30px; margin-left:20px; font-size: 50px; text-align: center;" >Mis Eventos</h1>
                        <hr>
                        <br>
                        <div class="row justify-content-center ">
                            <div class="col-md-12 ">
                              <h4 style="margin-top: 30px; margin-left:20px; font-size: 30px; text-align: center;" >Por Venir</h4>

                              <br>  
                            </div>
                           <!--Boton de ver desde 
                           <div class="col-md-4 p-1" style="margin-top: 50px;">
                                <button type="button" class="btn btn-personal">Ver desde</button>
                            </div>
                            -->
                        </div>
                        <!--Anuncios de donaciones-->
                        <%
                            ArrayList<EventoBenefico> eventosfuturos = (ArrayList<EventoBenefico>) request.getAttribute("eventosfututos");
                            for (EventoBenefico evento : eventosfuturos) {

                        %>
                        <div class="container card-container">
                            <div class="card h-100 mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="${pageContext.request.contextPath}/<%= evento.getFoto().getRutaFoto() %>" class="img-fluid rounded-start" alt="Imagen del evento"
                                             onerror="this.onerror=null; this.src='https://placehold.co/500x300?text=Imagen+No+Disponible';">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title"><%= evento.getNombre() %></h3>
                                            <p class="card-text"><strong>Fecha:</strong> <%= evento.getFechaEvento() %></p>
                                            <p class="card-text"><strong>Hora:</strong> <%= evento.getHoraInicio() %></p>
                                            <p class="card-text"><strong>Lugar:</strong> <%= evento.getLugar().getNombreLugar() %> </p>
                                            <p class="card-text"><strong>Dirección:</strong> <%= evento.getLugar().getDireccionLugar() %></p>
                                            <div class="d-flex gap-2 justify-content-around">

                                                    <input type="hidden" name="action" value="cancelar">
                                                    <div class="popup-buttons">
                                                        <button type="button" onclick="abrirConfirmacionCancelar('<%= evento.getEventoAlbergueID()%>')" class="btn btn-danger">Cancelar</button>
                                                        <button type="button" class="btn btn-primary" onclick="window.open('https://www.google.com/maps?q=<%=evento.getLugar().getDireccionLugar()%>,<%=evento.getDistrito().getNombreDistrito()%>', '_blank')">Ver ubicación</button>
                                                    </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="row justify-content-center ">
                            <div class="col-md-12 ">
                                <h4 style="margin-top: 30px; margin-left:20px; font-size: 30px; text-align: center;" >Pasados</h4>
                                <hr>
                                <br>
                            </div>
                            <!--Boton de ver desde
                            <div class="col-md-4 p-1" style="margin-top: 50px;">
                                 <button type="button" class="btn btn-personal">Ver desde</button>
                             </div>
                             -->
                        </div>

                        <%
                            ArrayList<EventoBenefico> eventospasados = (ArrayList<EventoBenefico>) request.getAttribute("eventospasados");
                            for (EventoBenefico eventopasado : eventospasados) {
                        %>
                        <!--Anuncios de donaciones pasadas-->
                        <div class="container card-container">
                            <div class="card h-100 mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="${pageContext.request.contextPath}/<%= eventopasado.getFoto().getRutaFoto() %>" class="img-fluid rounded-start" alt="Imagen del evento"
                                             onerror="this.onerror=null; this.src='https://placehold.co/500x300?text=Imagen+No+Disponible';">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title"><%= eventopasado.getNombre() %></h3>
                                            <p class="card-text"><strong>Fecha:</strong> <%= eventopasado.getFechaEvento() %></p>
                                            <p class="card-text"><strong>Hora:</strong> <%= eventopasado.getHoraInicio() %></p>
                                            <p class="card-text"><strong>Lugar:</strong> <%= eventopasado.getLugar().getNombreLugar() %> </p>
                                            <p class="card-text"><strong>Dirección:</strong> <%= eventopasado.getLugar().getDireccionLugar() %></p>
                                            <div class="d-flex gap-2 justify-content-around">
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://www.google.com/maps?q=<%=eventopasado.getLugar().getDireccionLugar()%>,<%=eventopasado.getDistrito().getNombreDistrito()%>', '_blank')">Ver ubicación</button>
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


    <div id="popup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <h2>¿Está seguro de cancelar su asistencia al evento?</h2>
            <form method="POST" action="MisEventosUsuario" id="cancelar">
                <input type="hidden" name="action" value="cancelar">
                <input type="hidden" name="idEvento" id="eventoIDInput" value="">
                <div class="popup-buttons">
                    <button type="submit" class="btn btn-danger">Confirmar</button>
                    <button type="button" class="btn btn-secondary" onclick="cerrarConfirmacionCancelar()">Cancelar</button>
                </div>
            </form>
        </div>
    </div>

    <!--Pop up-->
    <dialog id="cancel-inscripcion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;"> Inscripción cancelada</h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p> Tu inscripción ha sido cancelada, a partir de ahora no se mostrará más en tú página de eventos</p>
            <button onclick="closeCancelDialog()" class="btn btn-personal"> Cerrar </button>
        </div>
    </dialog>

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

<script>
    let eventoIDSeleccionado = null;

    function abrirConfirmacionCancelar(eventoID) {
        eventoIDSeleccionado = eventoID;
        document.getElementById('eventoIDInput').value = eventoIDSeleccionado;
        document.getElementById('popup').style.display = 'block';
    }

    function cerrarConfirmacionCancelar() {
        eventoIDSeleccionado = null;
        document.getElementById('popup').style.display = 'none';
    }





</script>

<script>
    const cancelDialog = document.getElementById("cancel-inscripcion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");

    function showCancelarDialog(){
        cancelDialog.showModal();
    }

    function closeCancelDialog(){
        cancelDialog.close();
    }

    cancelDialog.addEventListener("click", (e)=> {
        if(!contenidoPopDialog.contains(e.target)){
            cancelDialog.close();
        }
    })
</script>
