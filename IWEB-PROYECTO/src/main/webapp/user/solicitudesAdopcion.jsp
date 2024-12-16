<%@ page import="com.example.iwebproyecto.beans.MascotasAdopcion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />
<%
    ArrayList<MascotasAdopcion> listaAdopcion = (ArrayList) request.getAttribute("listaAdopcion");
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/eventos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/inicio.css">
    <title>Solicitudes de adopcion</title>
    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .card-body{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-img-top{
            height: 250px;
            background: cover;
            object-fit: cover;
        }
        .card-text{
            text-align: center;
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
            <div class="logo"><a href="/user/inicio.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
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
                    <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog" style="color: #000;"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/Inicio" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on" ></i></a></li>

                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>                </ul>

            </div>

            

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


            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="row" id="contenido-nofooter">
                    
                    <div class="col-md-9" id="contenidoIzquierda">
                        <div class="container" id="Eventos">
                            <h1>Solicitudes de Adopción</h1>
                            <hr>
                            
                            <div class="row">
                                <%
                                    int i = 1;
                                    for (MascotasAdopcion mascota : listaAdopcion) {
                                %>

                                <!-- Card 1 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/<%=mascota.getFoto().getRutaFoto()%>" class="card-img-top" alt="Card 1"
                                             onerror="this.onerror=null; this.src='https://placehold.co/400x400?text=Imagen+No+Disponible';">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <h4 class="card-title text-center"><%=mascota.getNombreMascota()%></h4>
                                                <p class="card-text" style="margin-bottom: 10px;">Albergue "<%=mascota.getAlbergue().getNombreAlbergue()%>"</p>

                                            </div>

                                            <a href="PortalDeAdopcion?action=vista&id=<%=mascota.getIdAdopcion()%>" class="btn btn-personal">Ver Mascota</a>
                                        </div>
                                    </div>
                                </div>

                                <%
                                        i++;
                                    }
                                %>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3 d-flex flex-column" id="contenidoDerecha">
                        <div class="container" id="MascotasPerdidas">
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
                        <a href="/user/mascotasPerdidas.html" class="btn btn-personal m-2"  id="btn-crd-cr">Ver más</a>

                        

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