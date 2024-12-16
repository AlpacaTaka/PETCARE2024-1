<%@ page import="com.example.iwebproyecto.beans.DonacionSuministros" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.iwebproyecto.beans.UsuarioDonacionSuministro" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />
<%
    Double totalDonadoObj = (Double) request.getAttribute("totalDonado");
    double totalDonado = totalDonadoObj != null ? totalDonadoObj : 0.0;
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
    <title>Mis Donaciones</title>
    <style>
        .card-body{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        }
        .img-fluid{
            height: 210px;
            background: cover;
            object-fit: cover;
            width: 100%;
        }
        .card{
            border-radius: 20px;
            overflow: hidden;
        }
        .badge{
            min-width: 35%;
        }
        

        @media (max-width: 768px) {
    
            .img-fluid{
                height: 150px; /* Asegura que la imagen ocupe toda la altura del contenedor */
                width: 100%;
                object-fit: cover; /* Ajuste perfecto sin deformar la imagen */
            }

            .card{
                text-align: center;
            }
            .badge{
                min-width: 70%;
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
                
            

                <div class="row" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%;max-width: 900px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="window.history.back()">  Regresar   </button>
                    </div>
                    <div class="container md-8" style="width: 85%;max-width: 900px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        
                        <h1 style="margin-top: 30px; font-size: 50px;" class="text-center">Mis Donaciones</h1>
                        <hr>
                        <div class="row justify-content-center p-4">
                            <div class="col-md-6 p-1" style="background-color: #4D0E0E; border-radius: 30px;">
                                <p class="text-center" style="margin-top: 20px; color: white; font-size: 18px;">Haz donado un total de</p>
                                <p class="text-center" style="font-size: 55px;color: white;"><strong>S/ <%= String.format("%.1f", totalDonado) %></strong></p>
                                <p class="text-center" style="margin-top: 20px; color: white; font-size: 18px;">a diversos albergues</p>
                            </div>
                            <div class="col-md-6 p-1" style="margin-top: 30px;">
                                <p class="text-center" style="margin-top: 20px; padding:0 20px; color: black; font-size: 18px;">Tus donaciones marcan una diferencia, anímate a seguir donando más.</p>
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <form action="<%= request.getContextPath() %>/MisDonacionesUsuario" method="get">
                                        <input type="hidden" name="action" value="consultar">
                                        <button type="submit" class="btn btn-personal d-flex align-items-center"  >
                                            <span class="fi-rr-send-money d-flex align-self-center"></span>&nbsp;Ver detalle
                                        </button>
                                    </form>
                                </div>
                            </div>
                            
                        </div>
                        <!--Anuncios de donaciones-->

                        <%
                            ArrayList<UsuarioDonacionSuministro> suministros = (ArrayList<UsuarioDonacionSuministro>) request.getAttribute("suministros");
                            for (UsuarioDonacionSuministro suministro : suministros) {

                        %>

                        <div class="container card-container">
                            <div class="card h-100 mb-3">
                                <div class="row g-0">
                                    <!-- Imagen del evento -->
                                    <div class="col-md-4">
                                        <img src="${pageContext.request.contextPath}/<%= suministro.getRutaFoto()%>" class="img-fluid rounded-start" alt="Imagen del evento"
                                             onerror="this.onerror=null; this.src='https://placehold.co/400x300?text=Imagen+No+Disponible';">
                                    </div>
                                    <!-- Detalles del evento -->
                                    <div class="col-md-8 d-flex align-self-center">
                                        <div class="card-body">
                                            <h3 class="card-title"><%= suministro.getTituloAvisoDonacion()%></h3>
                                            <p class="card-text">Solicitado por <strong> <%= suministro.getNombreAlbergue()%> </strong></p>
                                            <p class="card-text"><strong>Donación: </strong>(<%= suministro.getCantidadSuministro()%>) <%= suministro.getTipoDonacion()%></p>
                                            <p class="card-text"><strong>Fecha de Entrega programada por ti: </strong> <%= suministro.getFechaDonacion()%></p>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
    
                        </div>

                        <%
                            }

                        %>
                        
                        <div class="row justify-content-center p-1">
                            
                        </div>

                        <div class="row justify-content-center p-1">
                            

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

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>