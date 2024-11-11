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
    <title>Solicitudes de donación de suministros</title>
    <style>
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
                    <li><a href="/user/solicitudesDonacionSuministros.html" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="/user/donacionMonetaria.jsp" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
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
                <a href="/user/solicitudesDonacionSuministros.html">Donaciones de Suministros</a>
                <a href="/user/donacionMonetaria.jsp">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.jsp">Portal de Adopciones</a>
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
                            <h1>Solicitudes de Donación</h1>
                            <hr>
                            <!--Botones de búsqueda y filtrado
                            <div class="row mb-3 g-3 mt-2">
                                <div class="col-md-6 d-flex align-items-center justify-content-center">
                                    <div class="d-flex align-items-center">
                                        <label class="me-2">Mostrar</label>
                                        <select class="form-select form-select-sm me-2" style="width: auto;">
                                            <option value="5">5</option>
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                        </select>
                                        <label>elementos</label>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="input-group ">
                                        <button class="btn btn-outline-secondary btn-personal" type="button" id="button-addon1"><span class="fi-rr-search" style="font-size: 20px;"></span></button>
                                        <input type="text" class="form-control" placeholder=>
                                    </div>
                                </div>
                            </div>
                            Botones de búsqueda y filtrado-->
                            <div class="row">
                                <!-- Card 1 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion1.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Ayudanos a Ayudar</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Little ones"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 2 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion2.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos su Apoyo</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 3 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion3.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos Comida</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 4 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion4.jpg" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Donación de ropa usada</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Patitas de Amor"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- Card 5 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion5.jpg" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos vacunas</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Hueliitas Felices"</p>

                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 6 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion6.jpg" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos camas</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 7 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion7.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos camas</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 8 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion8.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Necesitamos juguetes</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card 9 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="/common/img/donaciones/donacion9.png" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                    Activo
                                                  </div>
                                                  <h5 class="card-title text-center">Ayudanos a Ayudar</h5>
                                            </div>
                                            

                                              <p class="card-text">Albergue "Purr Love"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                
                                
                        
                                

                            </div>

                            <div class="container d-none">
                                <div class="row">
                                  <div class="col">
                                    
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="card-title">Ayudanos a Ayudar</h5>
                                            <img src="/common/img/donaciones/donacion1.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                Activo
                                              </div>
                                            <p class="card-text" style="margin-top: 10px;">Albergue "Little ones"</p>
                                            <a href="solicitudDonacionSuministros.jsp" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                  </div>
                                  <div class="col">
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="evento4">Necesitamos su apoyo</h5>
                                            <img src="/common/img/donaciones/donacion4.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                Activo
                                              </div>
                                            <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love"</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    
                                  </div>

                                  <div class="col">
                                    <div class="card .perdido" style="margin-top: 20px;">
                                        <div class="card card-don">
                                            <div class="card-body">
                                            <h5 class="card-title">Necesitamos Comida</h5>
                                            <img src="/common/img/donaciones/donacion2.png" class="card-img-top card-img-don" alt="...">
                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                Activo
                                              </div>
                                            <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love"s</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
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
                                                <h5 class="card-title">Donación de ropa usada</h5>
                                                <img src="/common/img/donaciones/donacion5.jpg" class="card-img-top card-img-don" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Necesitamos vacunas</h5>
                                                <img src="/common/img/donaciones/donacion7.png" class="card-img-top card-img-don" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                  </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Necesitamos camas</h5>
                                                <img src="/common/img/donaciones/donacion6.jpg" class="card-img-top card-img-don" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Patitas de amor"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
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
                                                <h5 class="evento4">Buscamos juguetes</h5>
                                                <img src="/common/img/donaciones/donacion6.jpg" class="card-img-top card-img-don-movil" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                  </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Purr Love" </p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Donación de croquetas</h5>
                                                <img src="/common/img/donaciones/donacion9.png" class="card-img-top card-img-don" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Little ones"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card .perdido" style="margin-top: 20px;">
                                            <div class="card card-don">
                                                <div class="card-body">
                                                <h5 class="card-title">Ayudanos a Ayudar</h5>
                                                <img src="/common/img/donaciones/donacion8.png" class="card-img-top card-img-don" alt="...">
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-top: 10px;">
                                                    Activo
                                                </div>
                                                <p class="card-text" style="margin-top: 10px;">Albergue "Little ones"</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
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