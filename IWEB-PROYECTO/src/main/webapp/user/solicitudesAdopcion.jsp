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
    <title>Solicitudes de adopcion</title>
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
                    <li><a href="/user/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="/user/donacionMonetaria.jsp" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.html" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="/user/reportarMascotaPerdida.jsp" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                    <li><a href="/user/reportarMaltrato.jsp" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            

            </div>
            <div id="menu" class="menu">
                <a href="/user/miPerfil.jsp">Mi Perfil</a>
                <a href="/user/misEventos.jsp">Mis Eventos</a>
                <a href="/user/misDonaciones.jsp" id="Sep">Mis Donaciones</a>
                <hr>
                <a href="/user/allEventos.jsp">Eventos</a>
                <a href="/user/postularTemporal.jsp">Hogar Temporal</a>
                <a href="/user/solicitudesDonacionSuministros.jsp">Donaciones de Suministros</a>
                <a href="/user/donacionMonetaria.jsp">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.html">Portal de Adopciones</a>
                <a href="/user/mascotasPerdidas.jsp">Portal de Mascotas Perdidas</a>
                <a href="/user/reportarMascotaPerdida.jsp">Reportar Mascota Perdida</a>
                <a href="/user/reportarMaltrato.jsp" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="row" id="contenido-nofooter">
                    
                    <div class="col-md-9" id="contenidoIzquierda">
                        <div class="container" id="Eventos">
                            <h1>Solicitudes de Adopción</h1>
                            <hr>
                            
                            <div class="container">
                                <div class="row">
                                  <div class="col">
                                    
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="card-title">Marcus</h5>
                                            <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <p class="card-text"style="margin-top: 10px;">Albergue "Little ones"</p>
                                            <a href="solicitudAdopcion.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                                  <div class="col">
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="evento4">Logan</h5>
                                            <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love"</p>
                                            <a href="solicitudAdopcion.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                  </div>

                                  <div class="col">
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="card-title">Roscoe</h5>
                                            <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don" alt="...">
                                            <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love"s</p>
                                            <a href="solicitudAdopcion.jsp" class="btn btn-personal" id="btn-crd-cr">Más información</a>
                                            </div>
                                        </div>
                                    </div>
  
                                  </div>  
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Birdie</h5>
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Leo</h5>
                                                <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Oscar</h5>
                                                <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="evento4">Norris</h5>
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don-movil" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love" </p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Kika</h5>
                                                <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Little ones"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Lucas</h5>
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don" alt="...">
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Little ones"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Más información</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 d-flex flex-column" id="contenidoDerecha">
                        <div class="container" id="MascotasPerdidas">
                            <h1> Mascotas perdidas</h1>
                            <div class="grid-container" id="grilla-perdidos">
                                <!-- Card 1 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don" alt="Canela">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Canela</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Parque Condesa</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 2</p>
                                    </div>
                                </div>
                        
                                <!-- Card 2 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don" alt="Thor">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Thor</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Puente Azul Santa Anita</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 8</p>
                                    </div>
                                </div>
                        
                                <!-- Card 3 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don" alt="Sam">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Sam</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Calle Flor Tristán La Molina</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 1</p>
                                    </div>
                                </div>
                                <!-- Card 4 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-don" alt="Sam">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Sam</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Calle Flor Tristán La Molina</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 1</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="/user/mascotasPerdidas.jsp" class="btn btn-personal m-2" id="btn-crd-cr">Ver más</a>

                        

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

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>