<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/common/css/baseDesign.css">
    <link rel="stylesheet" href="css/eventos.css">
    <link rel="stylesheet" href="css/inicio.css">
    <title>Portal de mascotas perdidas</title>
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
                <div class="welcome-text">Hola, Juan</div>
            </div>
            <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
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

                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>                </ul>

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
                    
                    <div class="col-md-12" id="contenidoMascotas">
                        <div class="container" id="mascotasPerdidas">
                            <h1>Portal de Mascotas Perdidas</h1>
                            <!-- Contenedor de todas las cards-->
                            <div class="container">
                                <!-- Primera fila-->
                                <div class="row">
                                    <!-- Card 1-->
                                    <div class="col">
                                      <div class="card .perdido" style="margin-top: 20px;">
                                          <div class="card card-don">
                                              <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don" alt="Canela">
                                              <div class="card-body">
                                                <h5 class="card-title text-center">Canela</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Perdido
                                                </div>
                                                <p class="card-text"><strong>Lugar de extravío:</strong> Parque Condesa Pueblo Libre</p>
                                                <p class="card-text"><strong>Días perdido:</strong> 2</p>
                                                <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                              </div>
                                          </div>
                                      </div>
                                    </div>
                                     <!-- Card 2-->
                                    <div class="col">
                                      <div class="card .perdido" style="margin-top: 20px;">
                                          <div class="card card-don">
                                              <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don" alt="Thor">
                                              <div class="card-body">
                                                <h5 class="card-title text-center">Thor</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Perdido
                                                </div>
                                                <p class="card-text"><strong>Lugar de extravío:</strong> Puente Azul Santa Anita</p>
                                                <p class="card-text"><strong>Días perdido:</strong> 8</p>
                                                <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                              </div>
                                          </div>
                                      </div>
                                    </div>
                                     <!-- Card 3-->
                                     <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-don" alt="Max">
                                                <div class="card-body">
                                                    <h5 class="card-title text-center">Max</h5>
                                                    <div class="badge text-bg-primary" style="width: 7rem; margin-top: 10px;">
                                                        Encontrado
                                                    </div>
                                                    <p class="card-text"><strong>Lugar de extravío:</strong> Calle Santa Rosa San Miguel</p>
                                                    <p class="card-text"><strong>Días perdido:</strong> 24</p>
                                                  <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <!-- Card 4-->
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don" alt="Sam">
                                                <div class="card-body">
                                                    <h5 class="card-title text-center">Sam</h5>
                                                    <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                        Perdido
                                                    </div>
                                                    <p class="card-text"><strong>Lugar de extravío:</strong> Calle Flor Tristán La Molina</p>
                                                    <p class="card-text"><strong>Días perdido:</strong> 1</p>
                                                    <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                </div>   
                                <!-- Segunda fila-->   
                                <div class="row">
                                    <!-- Card 1-->
                                    <div class="col">
                                      <div class="card .perdido" style="margin-top: 20px;">
                                          <div class="card card-don">
                                              <img src="/common/img/perdidos/perdido5.jpg" class="card-img-top card-img-don" alt="Roscoe">
                                              <div class="card-body">
                                                <h5 class="card-title text-center">Roscoe</h5>
                                                <div class="badge text-bg-primary" style="width: 7rem; margin-top: 10px;">
                                                    Encontrado
                                                </div>
                                                <p class="card-text"><strong>Lugar de extravío:</strong> Puente Primavera Santiago de Surco</p>
                                                <p class="card-text"><strong>Días perdido:</strong>14</p>
                                                <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                              </div>
                                          </div>
                                      </div>
                                    </div>
                                     <!-- Card 2-->
                                    <div class="col">
                                      <div class="card .perdido" style="margin-top: 20px;">
                                          <div class="card card-don">
                                              <img src="/common/img/perdidos/perdido6.jpg" class="card-img-top card-img-don" alt="Lucas">
                                              <div class="card-body">
                                                <h5 class="card-title text-center">Lucas</h5>
                                                <div class="badge text-bg-primary" style="width: 7rem; margin-top: 10px;">
                                                    Encontrado
                                                </div>
                                                <p class="card-text"><strong>Lugar de extravío:</strong> Avenida Los Frutales Chorrillos</p>
                                                <p class="card-text"><strong>Días perdido:</strong>152</p>
                                                <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                              </div>
                                          </div>
                                      </div>
                                    </div>
                                     <!-- Card 3-->
                                     <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <img src="https://fotografias.lasexta.com/clipping/cmsimages02/2019/01/25/DB41B993-B4C4-4E95-8B01-C445B8544E8E/97.jpg?crop=4156,2338,x0,y219&width=1600&height=900&optimize=high&format=webply" class="card-img-top card-img-don" alt="Leo">
                                                <div class="card-body">
                                                    <h5 class="card-title text-center">Leo</h5>
                                                    <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                        Perdido
                                                    </div>
                                                    <p class="card-text"><strong>Lugar de extravío:</strong> Parque María Reiche Miraflores</p>
                                                    <p class="card-text"><strong>Días perdido:</strong>10</p>
                                                  <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <!-- Card 4-->
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido8.jpg" class="card-img-top card-img-don" alt="Sam">
                                                <div class="card-body">
                                                    <h5 class="card-title text-center">Hades</h5>
                                                    <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                        Perdido
                                                    </div>
                                                    <p class="card-text"><strong>Lugar de extravío:</strong> Avenida Salaverry Jesús María</p>
                                                    <p class="card-text"><strong>Días perdido:</strong> 5</p>
                                                    <a href="mascotaPerdida.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                                </div>
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

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>