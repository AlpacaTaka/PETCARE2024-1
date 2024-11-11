<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <div class="welcome-text">Hola, Juan</div>
        </div>
        <div class="logo"><a href="/user/inicio.html"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                <li><a href="TodosLosAlbergues" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                <li><a href="/user/solicitudesAdopcion.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                <li><a href="/user/reportarMascotaPerdida.jsp" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                <li><a href="/user/reportarMaltrato.jsp" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
                <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="MiPerfilUsuario">Mi Perfil</a>
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
                            <div class="carousel-inner" >

                                <!-- Primera tarjeta -->
                                <div class="carousel-item active">
                                    <div class="d-flex justify-content-center">
                                        <div class="card" style="width: 100%;">
                                            <div class="row g-0">
                                                <div class="col-md-8">
                                                    <img src="${pageContext.request.contextPath}/common/img/eventos/evento1.jpg" class="card-img-eve" alt="Imagen">
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center">
                                                    <div class="card-body">
                                                        <h4 class="card-title">CANinaton 5K</h4>
                                                        <div class="badge text-bg-primary text-wrap" style="width: 7rem;">
                                                            25 Sep. 09:00am
                                                        </div>
                                                        <p class="card-text">Animate a caminar con tu amigo de 4 patas. Tendremos grandes premios y artistas invitados.</p>
                                                        <a href="evento.jsp" class="btn btn-personal"
                                                        >
                                                            Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Segunda tarjeta -->
                                <div class="carousel-item">
                                    <div class="d-flex justify-content-center">
                                        <div class="card" style="width: 100%;">
                                            <div class="row g-0">
                                                <div class="col-md-8">
                                                    <img src="${pageContext.request.contextPath}/common/img/eventos/evento2.jpeg" class="card-img-eve" alt="Imagen">
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center">
                                                    <div class="card-body">
                                                        <h4 class="card-title">Gran campaña de Vacunacion!</h4>
                                                        <div class="badge text-bg-primary text-wrap" style="width: 7rem;">
                                                            25 Sep. 09:00am
                                                        </div>
                                                        <p class="card-text">La Municipalidad Provincial del Callao y el albergue patitas felices organizan este gran evento</p>
                                                        <a href="evento.jsp" class="btn btn-personal"
                                                        >Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Tercera tarjeta -->
                                <div class="carousel-item">
                                    <div class="d-flex justify-content-center">
                                        <div class="card" style="width: 100%;">
                                            <div class="row g-0">
                                                <div class="col-md-8">
                                                    <img src="/common/img/eventos/evento3.jpg" class="card-img-eve" alt="Imagen">
                                                </div>
                                                <div class="col-md-4 d-flex align-items-center">
                                                    <div class="card-body">
                                                        <h4 class="card-title">Concurso de Disfraces</h4>
                                                        <div class="badge text-bg-primary text-wrap" style="width: 7rem;">
                                                            25 Sep. 09:00am
                                                        </div>
                                                        <p class="card-text">Se acerca Halloween! Ven con tu peludito disfrazado y podras ganar grandes premios.</p>
                                                        <a href="evento.jsp" class="btn btn-personal" id="btn-crd-cr">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!-- Controles -->
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselEvento" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselEvento" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>

                            <!-- Indicadores -->
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                        </div>
                        <!-- Botonera de Ver mas Eventos-->
                        <div class="boton-contenedor">
                            <a href="/user/allEventos.jsp" class="btn btn-personal2">Ver más Eventos</a>
                        </div>

                    </div>


                    <!-- Botonera de Adopta y Temporal-->
                    <div class="container" id="BOTONES" style="margin-top: 50px;">

                        <div class="container text-center" id="contenedor-btn-dos">
                            <div class="row" style="gap: 5px;">
                                <div class="col ">
                                    <div class="d-grid " style="align-content: center;">
                                        <a href="mascotasPerdidas.jsp">
                                            <button class="btn btn-personal btn-lg" type="button" style="width: 100%;">
                                                <i class="fi-rr-cat-dog" style="font-size: 20px;"></i><div>Adopta una Mascota</div></button>
                                        </a>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="d-grid ">
                                        <a href="postularTemporal.jsp"><button class="btn btn-personal btn-lg" type="button" style="width: 100%;">
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
                                    <!-- Primera diapositiva -->
                                    <div class="carousel-item active">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion1.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Ven y Ayuda!</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Participa en la gimkana par ayudar a nuestros peluditos!</p>
                                                        <a href="/user/solicitudDonacionSuministros.jsp" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion2.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Necesitamos Comida</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Requerimos comida de Perro Adulto</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion3.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Se Necesitan Camas</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">El abergue patitas felices requiere de su gran ayuda para llevar calidez</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Segunda diapositiva -->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion4.jpg" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Campaña de Adopcion y Donacion</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Ven ayuda</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion5.jpg" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Buscamos donacion de ropa usada</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Descripción de la tarjeta 5.</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion6.jpg" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Necesitamos un nuevo local</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Descripción de la tarjeta 6.</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tercera diapositiva -->
                                    <div class="carousel-item">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion7.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Necesitamos dinero para vacunas</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Descripción de la tarjeta 7.</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion8.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Ayudanos a Ayudar</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Descripción de la tarjeta 8.</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card card-don">
                                                    <img src="/common/img/donaciones/donacion9.png" class="card-img-top card-img-don" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Necesitamos su Corazon noble</h5>
                                                        <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                            Activo
                                                        </div>
                                                        <p class="card-text">Descripción de la tarjeta 9.</p>
                                                        <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                    <!-- Primera diapositiva -->
                                    <div class="carousel-item active">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion1.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Necesitamos dinero para vacunas</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 7.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- Segunda diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion2.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title">Ayudanos a Ayudar</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 8.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Tercera diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion3.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Cuarta Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion4.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Quinta Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion5.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 6 Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion6.jpg" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 7 Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion7.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 8 Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion8.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 9 Diapositiva -->
                                    <div class="carousel-item">
                                        <div class="card card-don">
                                            <img src="/common/img/donaciones/donacion9.png" class="card-img-top card-img-don-movil" alt="...">
                                            <div class="card-body">
                                                <h5 class="evento4">Necesitamos su Corazon noble</h5>
                                                <div class="badge text-bg-success text-wrap" style="width: 7rem;">
                                                    Activo
                                                </div>
                                                <p class="card-text">Descripción de la tarjeta 9.</p>
                                                <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                            </div>
                                        </div>
                                    </div>

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
                            <a href="/user/solicitudesDonacionSuministros.jsp" class="btn btn-personal2">Ver más Solicitudes</a>
                        </div>


                    </div>
                    <div class="container">
                        <h1>Adopta</h1>
                        <!-- Carrusel para Escritorio (4 cards por slide) -->
                        <div id="Adop-dsk" class="carousel carousel-dark slide d-none d-lg-block" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">REX</h5>
                                                    <p class="card-text">Descripción de la card 1.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">JUAN</h5>
                                                    <p class="card-text">Descripción de la card 2.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">LOGAN</h5>
                                                    <p class="card-text">Descripción de la card 3.</p>
                                                    <a href="/user/solicitudAdopcion.jsp" class="btn btn-personal" id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">PRINCESA</h5>
                                                    <p class="card-text">Descripción de la card 4.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr ">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Agrega más slides aquí -->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido5.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">ROSITA</h5>
                                                    <p class="card-text">Descripción de la card 5.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr ">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido6.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">PEPE</h5>
                                                    <p class="card-text">Descripción de la card 6.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido7.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">COCO</h5>
                                                    <p class="card-text">Descripción de la card 7.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido8.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">PANCHITO</h5>
                                                    <p class="card-text">Descripción de la card 8.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 1</h5>
                                                    <p class="card-text">Descripción de la card 1.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 2</h5>
                                                    <p class="card-text">Descripción de la card 2.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Agrega más slides aquí -->
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top  card-img-adop" alt="...">

                                                <div class="card-body">
                                                    <h5 class="card-title">Card 3</h5>
                                                    <p class="card-text">Descripción de la card 1.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 4</h5>
                                                    <p class="card-text">Descripción de la card 2.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr ">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido5.jpg" class="card-img-top  card-img-adop" alt="...">

                                                <div class="card-body">
                                                    <h5 class="card-title">Card 5</h5>
                                                    <p class="card-text">Descripción de la card 1.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido6.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 6</h5>
                                                    <p class="card-text">Descripción de la card 2.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido7.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 7</h5>
                                                    <p class="card-text">Descripción de la card 1.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr ">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card card-don">
                                                <img src="/common/img/perdidos/perdido8.jpg" class="card-img-top card-img-adop" alt="...">
                                                <div class="card-body">
                                                    <h5 class="card-title">Card 8</h5>
                                                    <p class="card-text">Descripción de la card 2.</p>
                                                    <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
                                <div class="carousel-item active">
                                    <div class=" card card-don">
                                        <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 1</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 2</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 3</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 4</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido5.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 5</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido6.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 6</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido7.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 7</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>
                                <div class="carousel-item">
                                    <div class="card card-don">
                                        <img src="/common/img/perdidos/perdido8.jpg" class="card-img-top card-img-don-movil" alt="...">
                                        <div class="card-body">
                                            <h5 class="card-title">Card 8</h5>
                                            <p class="card-text">Descripción de la card 1.</p>
                                            <a href="#" class="btn btn-personal"  id="btn-crd-cr">Ver Solicitud</a>
                                        </div>
                                    </div>

                                </div>

                                <!-- Agrega más slides aquí -->

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
                            <a href="/user/solicitudesAdopcion.jsp" class="btn btn-personal2">Ver Portal de Adopciones</a>
                        </div>



                    </div>
                </div>

                <!-- Contenido derecha no puede cambiar-->
                <div class="col-md-3 d-flex flex-column" id="contenidoDerecha" style="max-width: 600px;">
                    <div class="container" id="MascotasPerdidas" >
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

<script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



</body>
</html>