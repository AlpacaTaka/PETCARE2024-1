
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="com.example.iwebproyecto.beans.EventoBenefico" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <a href="/user/misEventos.html">Mis Eventos</a>
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
                    <div class="container md-8" style="width: 85%;max-width: 900px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='inicio.jsp'">  Regresar   </button>
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
                                        <img src="${pageContext.request.contextPath}/<%= evento.getFoto().getRutaFoto() %>" class="img-fluid rounded-start" alt="Imagen del evento">
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
                                                <button type="button" class="btn btn-danger" onclick="abrirConfirmacionCancelar()">Cancelar</button>
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://www.google.com/maps?q=<%=evento.getLugar().getDireccionLugar()%>,<%=evento.getDistrito().getNombreDistrito()%>', '_blank')">Ver ubicación</button>
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
                        <!--Anuncios de donaciones-->
                        <div class="container card-container">
                            <div class="card h-100 mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="https://www.comfacauca.com/wp-content/uploads/Festival-canino.jpeg" class="img-fluid rounded-start" alt="Imagen del evento">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title">Show de Talentos Perruno!</h3>
                                            <p class="card-text"><strong>Fecha:</strong> 15/10/2024</p>
                                            <p class="card-text"><strong>Hora:</strong> 8:00 pm</p>
                                            <p class="card-text"><strong>Lugar:</strong> Parque Central - Lince</p>
                                            <div class="d-flex gap-2 justify-content-around">
                                                <button type="button" class="btn btn-danger" onclick="abrirConfirmacionCancelar()">Cancelar</button>
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://maps.app.goo.gl/6swgZC6paQKStweG9', '_blank')">Ver ubicación</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container card-container">
                            <div class="card h-100 mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="/common/img/eventos/evento7.png" class="img-fluid rounded-start" alt="Imagen del evento">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body ">
                                            <h3 class="card-title">Concurso de acrobacias de perritos</h3>
                                            <p class="card-text"><strong>Fecha:</strong> 15/10/2024</p>
                                            <p class="card-text"><strong>Hora:</strong> 8:00 pm</p>
                                            <p class="card-text"><strong>Lugar:</strong> Parque Central - Lince</p>
                                            <div class="d-flex gap-2 justify-content-around">
                                                <button type="button" class="btn btn-danger" onclick="abrirConfirmacionCancelar()">Cancelar</button>
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://maps.app.goo.gl/6swgZC6paQKStweG9', '_blank')">Ver ubicación</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="container card-container">
                            <div class="card mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="/common/img/eventos/evento6.jpg" class="img-fluid rounded-start" alt="Imagen del evento">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title">LATINPET</h3>
                                            <p class="card-text"><strong>Fecha:</strong> 15/10/2024</p>
                                            <p class="card-text"><strong>Hora:</strong> 8:00 pm</p>
                                            <p class="card-text"><strong>Lugar:</strong> Parque Central - Lince</p>
                                            <div class="d-flex gap-2 justify-content-around">
                                                <button type="button" class="btn btn-danger" onclick="abrirConfirmacionCancelar()">Cancelar</button>
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://maps.app.goo.gl/6swgZC6paQKStweG9', '_blank')">Ver ubicación</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="container card-container">
                            <div class="card mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="/common/img/eventos/evento5.jpg" class="img-fluid rounded-start" alt="Imagen del evento">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title">HALLOWEEN PET 2024</h3>
                                            <p class="card-text"><strong>Fecha:</strong> 15/10/2024</p>
                                            <p class="card-text"><strong>Hora:</strong> 8:00 pm</p>
                                            <p class="card-text"><strong>Lugar:</strong> Parque Central - Lince</p>
                                            <div class="d-flex gap-2 justify-content-around">
                                                <button type="button" class="btn btn-danger" onclick="abrirConfirmacionCancelar()">Cancelar</button>
                                                <button type="button" class="btn btn-primary" onclick="window.open('https://maps.app.goo.gl/6swgZC6paQKStweG9', '_blank')">Ver ubicación</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    <div id="popup" class="popup-overlay">
        <div class="popup-content">
        <h2>¿Está seguro de cancelar su asistencia al evento?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccion()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarConfirmacionCancelar()">Cancelar</button>
        </div>
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
    // Función para abrir el popup
    function abrirConfirmacionCancelar() {
    document.getElementById('popup').style.display = 'block';
    }

    // Función para cerrar el popup
    function cerrarConfirmacionCancelar() {
    document.getElementById('popup').style.display = 'none';
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccion() {
    cerrarConfirmacionCancelar(); // Cerrar el popup de confirmación
    showCancelarDialog(); // Mostrar el diálogo de cancelación
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
