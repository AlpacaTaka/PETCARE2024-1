<%@ page import="com.example.iwebproyecto.beans.Albergue" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    Albergue a = (Albergue) request.getAttribute("albergue");


%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Postular como Hogar Temporal</title>

    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        
        .image-container {
            width: 170px; /* Puedes ajustar el tamaño según sea necesario */
            height: 170px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Añade una sombra */
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Mantiene las proporciones de la imagen dentro del contenedor */
        }
        /* Estilos generales */


        

        .card-body{
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        }

        .card-img-top{
            min-height: 150px !important;
            background-size:  cover;
            object-fit: cover !important;
        }
        
        .card-img-top, .card-img-sol::after{
            min-height: 150px !important;
            background-size: cover;
            object-fit: cover !important;
        }
        
        
        .card-text{
            text-align: center;
        }

        .custom-nav .btn {
            color: white;
            font-size: 18px;
            transition: all 0.3s ease;
            border-bottom: 2px solid transparent;
        }

        .custom-nav .btn:hover {
            color: white; /* Efecto hover */
        }


        .content-section {
            display: none;
            text-align: center;
        }

        .active-content {
            display: block;
        }
         .active-content .h-100 .card-img-sol{
            min-height: 200px !important;
            background-size: cover;
            object-fit: cover !important;
        }

        /* Animación suave */
        .custom-nav .btn.active {
            animation: fadeIn 0.5s ease-in-out;
        }
        

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            <div class="logo"><a href="/user/inicio.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.html" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.html" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.html" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.html" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="/user/donacionMonetaria.html" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.html" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="/user/reportarMascotaPerdida.html" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                    <li><a href="/user/reportarMaltrato.html" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
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
                <!--Boton de regreso a la página principal-->
                <div class="col" id="contenido-nofooter">
                    <div class="container md-8 d-flex justify-content-between g-2" style="width: 90%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='donacionMonetaria.html'">  Regresar   </button>

                    </div>
                    <div class="container md-12" style="width: 90%;max-width: 800px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 20px; padding: 10px 20px;">
                        <h1 style="margin-top: 10px; color: #4d0e0e; font-style: italic" class="text-center" ><%=a.getNombreAlbergue()%></h1>
        
                        <hr>
                        <div class="row">
                            <div class="col-md-4 p-1 d-flex align-items-center justify-content-center">
                                <div class="row justify-content-center p-1">
                                    <div class="col d-flex justify-content-center">
                                        <div class="image-container">
                                            <img src="${pageContext.request.contextPath}<%=a.getFoto().getRutaFoto()%>" alt="Perfil de usuario">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8 p-1 d-flex flex-column justify-content-center">
    
                                <div class="row justify-content-center p-2">
                                    <div class="col-md-6 p-2">
                                        <p class="card-text" style="text-align: left;"><strong>Fecha de Creación</strong> </p>
                                        <p class="card-text" style="text-align: left;"><%=a.getFechaCreacion()%></p>
                                        <p class="card-text" style="text-align: left;"><strong>Distrito</strong> </p>
                                        <p class="card-text" style="text-align: left;"><%=a.getDistrito().getNombreDistrito()%></p>
                                        <p class="card-text" style="text-align: left;"><strong>Direccion</strong> </p>
                                        <p class="card-text" style="text-align: left;"><%=a.getDireccion()%></p>
                                        
                                    </div>
                                    <div class="col-md-6 p-2">
                                        
                                        <p class="card-text" style="text-align: left;"><strong>Cantidad de Animales Albergados:</strong> </p>
                                        <p class="card-text" style="text-align: left;"><%=a.getCantidadAnimales()%></p>
                                        <p class="card-text" style="text-align: left;"><strong>Capacidad para nuevos animales:</strong> </p>
                                        <p class="card-text" style="text-align: left;"><%=a.getEspaciosDisponibles()%></p>
                                        
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-6 p-1">

                                    </div>
                                    <div class="col-md-6 p-1">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <article style="text-align: justify;">
                            <p><%=a.getDescripcion()%></p>
                           
                        </article>
                        <div class="container md-8 d-flex justify-content-center">
                            <button type="button"  class="btn btn-personal d-flex " onclick="showDonarSumDialog()" style="font-size: 19px;"><span class="fi-rr-hand-holding-usd"></span>&nbsp;Realizar un aporte</button>
                        </div>
                        
                    </div>
                    
                    <!--Container del formulario-->
                    <div class="container md-8 d-none" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; overflow:hidden ; padding-left: 0;padding-right: 0;">
                        <nav class="custom-nav navbar-expand-lg " style="margin: 0; background-color: #4d0e0e;">
                            <div class="container-fluid justify-content-around d-flex" style="min-height: 50px; padding: 0;">
                                <div class="col d-flex nav-link btn btn-dark active justify-content-center align-items-center" id="btnEventos" aria-current="page">
                                    Eventos
                                </div>
                                <div class="col d-flex nav-link btn btn-dark justify-content-center align-items-center" id="btnSolicitudes">
                                    Solicitudes de Donación
                                </div>

                            </div>
                        </nav>
                    
                        <div class="container mt-4">
                            <div id="contentEventos" class="content-section active-content">
                                
                                <div  class="row">
                                    <div class="container" id="Eventos">
                                        <h2>Eventos organizados por el Albergue</h2>
                                        <hr>
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
                                                    <input type="text" class="form-control" placeholder="Busca Eventos">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3 g-3">
                                            <div class="col-md-6 d-flex align-items-center justify-content-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="d-flex align-items-center">
                                                        <label class="me-">Ver desde:</label>
                                                        <input type="text" class="form-control" id="datepicker" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6 d-flex justify-content-center">
                                                <button class="btn btn-personal2 dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Filtrar
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card1"> Mostrar eventos más próximos
                                                        </label>
                                                    </li>
                                                    <hr>
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card2"> Mostrar eventos Activos
                                                        </label>
                                                    </li>
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card3"> Mostrar eventos Pasados
                                                        </label>
                                                    </li>
                                                    <!-- Añade más checkboxes según tus necesidades -->
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Card 1 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento1.jpg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-primary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">CANinaton 5K</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a caminar con tu amigo de 4 patas. Tendremos grandes premios y artistas invitados.</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 2 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento3.jpg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-primary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">Concurso de Disfraces en La Molina</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Se acerca Halloween! Ven con tu peludito disfrazado y podras ganar grandes premios.</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 3 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento2.jpeg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-primary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">Gran Evento de Vacunación!</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Se acerca Halloween! Ven con tu peludito disfrazado y podras ganar grandes premios.</p>
                                                        <a href="eventoTraslape.html" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 4 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento4.jpg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-primary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">Fiesta PERRRRUNA</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Ven al parque el faro en San Isidro para la fiesta de nuestros perritos albergados en Huellitas Felices</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
            
                                            <!-- Card 5 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento5.jpg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-primary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">Tenencia Responsable</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">La Municipalidad Distrital de Surco y el Albergue Rayito de Sol-Surco los invita a este  evento de gran importancia para la comunidad</p>
            
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 6 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento6.jpg" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-secondary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">EXPOMASCOTAS</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Unete a esta fiesta! Trae a tu mascota</p>
                                                        <a href="eventoCompleto.html" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 7 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/eventos/evento7.png" class="card-img-top" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-secondary text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                                25 Sep. 08:00am
                                                              </div>
                                                              <h5 class="card-title text-center">LATINPET</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Unete a esta fiesta! Trae a tu mascota</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Evento</a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                    
                                            
            
                                        </div>
                                        
                                    
                                        
                                    </div>
                                    <div class="container d-flex justify-content-center mt-5">
                                        <div class="row">
                                            <nav aria-label="...">
                                                <ul class="pagination">
                                                  <li class="page-item disabled">
                                                    <span class="page-link active">Anterior</span>
                                                  </li>
                                                  <li class="page-item active" aria-current="page">
                                                    <span class="page-link">1</span>
                                                  </li>
                                                  
                                                  <li class="page-item disabled">
                                                    <a class="page-link" href="allEventos2.html">Siguiente</a>
                                                  </li>
                                                </ul>
                                              </nav>
                                        </div>
                                    </div>


                                </div>
                            </div>
                    
                            <div id="contentSolicitudes" class="content-section">
                                <div class="row">
                                    <div class="container" id="Donaciones">
                                        <h2>Donaciones pedidas por el Albergue</h2>
                                        <hr>
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
                                                    <input type="text" class="form-control" placeholder="Busca Solicitudes">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3 g-3">
                                            <div class="col-md-6 d-flex align-items-center justify-content-center">
                                                <div class="d-flex align-items-center">
                                                    <div class="d-flex align-items-center">
                                                        <label class="me-">Ver desde:</label>
                                                        <input type="text" class="form-control" id="datepicker" readonly>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6 d-flex justify-content-center">
                                                <button class="btn btn-personal2 dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Filtrar
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card1"> Mostrar solicitudes recientes
                                                        </label>
                                                    </li>
                                                    <hr>
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card2"> Mostrar solicitudes Activas
                                                        </label>
                                                    </li>
                                                    <li>
                                                        <label class="dropdown-item">
                                                            <input type="checkbox" class="filter-checkbox" value="card3"> Mostrar solicitudes Pasados
                                                        </label>
                                                    </li>
                                                    <!-- Añade más checkboxes según tus necesidades -->
                                                </ul>
                                            </div>
                                        </div>
                                        <div  class="row">
                                            <!-- Card 1 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion1.png" class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Se necesitan camas</h5>
                                                        </div>
                        
            
                                                          <p class="card-text"> Animate a donar, ayudanos a ayudar</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 2 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion2.png" class="card-img-sol" alt="Card 20" >
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Donación Monetaria</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 3 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion3.png"class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Ayudanos</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
                                                        <a href="eventoTraslape.html" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 4 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion4.jpg" class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Donacion de ropa</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
            
                                            <!-- Card 5 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion5.jpg" class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Se necesitan  donaciones para vacunas</h5>

                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
            
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 6 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion6.jpg" class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-success text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Activo
                                                              </div>
                                                              <h5 class="card-title text-center">Ayudanos con Comida</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
                                                        <a href="eventoCompleto.html" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Card 7 -->
                                            <div class="col-12 col-md-6 col-lg-4 mb-4">
                                                <div class="card h-100">
                                                    <img src="/common/img/donaciones/donacion7.png" class="card-img-sol" alt="Card 1">
                                                    <div class="card-body">
                                                        <div class="row d-flex justify-content-center">
                                                            <div class="badge text-bg-secondary text-wrap" style="width: 7rem; margin-bottom: 10px;">
                                                                Pasado
                                                              </div>
                                                              <h5 class="card-title text-center">Se necesita dinero para Alquiler</h5>
                                                        </div>
                                                        
            
                                                          <p class="card-text">Animate a donar, ayudanos a ayudar</p>
                                                        <a href="evento.jsp" class="btn btn-personal">Ver Solicitud</a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            
                                    
                                            
            
                                        </div>
                                        
                                    
                                        
                                    </div>
                                    <div class="container d-flex justify-content-center mt-5">
                                        <div class="row">
                                            <nav aria-label="...">
                                                <ul class="pagination">
                                                  <li class="page-item disabled">
                                                    <span class="page-link active">Anterior</span>
                                                  </li>
                                                  <li class="page-item active" aria-current="page">
                                                    <span class="page-link">1</span>
                                                  </li>
                                                  
                                                  <li class="page-item disabled">
                                                    <a class="page-link" href="allEventos2.html">Siguiente</a>
                                                  </li>
                                                </ul>
                                              </nav>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- Footer (no tocar si ya esta listo)-->
                <footer class="p-3">
                    <div class="container">
                      <!-- Copyright  y Soporte-->
                      <div class="text-end">
                        <p> Soporte: soporte@teletubbies.com</p>
                      </div>
                    </div>
                </footer>
                <!--Pop up-->
                <dialog id="hacer-donacion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none; justify-content: center;">
                    <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
                        <h2 style="color: #721313;">Números de yape/plin</h2><br>
                        <div class="row justify-content-center">
                            <!--Primera columna de selección-->
                            <div class="col-md-6 justify-content-center p-1">
                                <img src="/common/img/donacionesMonetarias/logoPlin.png" class="card-img-monetaria" alt="Imagen" style="width: 100%; max-width: 60%; height: auto;">
                                <p style="padding: 10px;font-size: 23px;">997565443</p>
                            </div>
                            <!--Segunda columna de selección-->
                            <div class="col-md-6 justify-content-center p-1">
                                <img src="/common/img/donacionesMonetarias/logoYape.png" class="card-img-monetaria" alt="Imagen" style="width: 100%; max-width: 60%; height: auto;">
                                <p style="padding: 10px;font-size: 23px;">998865443</p>
                            </div>
                        </div>
                        <form id="suministroForm" onsubmit="handleFormSubmit(event)" >
                            <!--Primera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1">                         
                                    <label for="cant-donacion" style="font-size: 14px; font-weight: bold;">Ingrese el monto</label>
                                    <input type="number" class="form-control" placeholder="Ingrese el monto a donar" id="cant-donacion" name="cant-donacion" min="10" max="500" required>      
                                </div>
                                <div class="col-md-7 p-1">                         
                                    <label for="solicitud-donacion" style="font-size: 14px; font-weight: bold;">Solicitud elegida</label>
                                    <select class="form-select" id="solicitud-donacion" aria-label="Floating label select example" required >
                                        <option value="" selected>Ninguna solicitud seleccionada</option>
                                        <option value="1">Ayudanos a ayudar</option>
                                        <option value="2">Necesitamos su apoyo</option>
                                        <option value="3">Necesitamos vacunas</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-personal"> Enviar </button>
                        </form>
                    </div>
                </dialog>

                <!--Pop up confirmacion-->
                <dialog id="confirm-donacion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
                    <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
                        <h2 style="color: #721313;">Donación exitosa</h2>
                        <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
                        <p> Se ha procesado tu donación con éxito! Gracias por colaborar para ayudar a nuestros pequeños</p>
                        <button onclick="closeConfirmDialog()" class="btn btn-personal"> Cerrar </button>
                    </div>
                </dialog>
            </div>
        </div>
    </div>

        <script src="/common/script/neonavbar.js"></script>
        <script src="js/perfilAlbergue.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            const donacionMonetariaDialog = document.getElementById("hacer-donacion");
            const confirmEnvioDialog = document.getElementById("confirm-donacion");
            const contenidoPopDialog = donacionMonetariaDialog.querySelector(".pop-up-content");
            const contenidoConfirmDialog = confirmEnvioDialog.querySelector(".pop-up-content");
            const montoInput = document.getElementById("cant-donacion"); // Obtener el input del monto
        
            function showDonarSumDialog() {
                montoInput.value = ""; // Restablecer el valor del input a vacío
                donacionMonetariaDialog.showModal();
            }
        
            function closeDonacionDialog() {
                donacionMonetariaDialog.close();
            }
        
            function closeConfirmDialog() {
                confirmEnvioDialog.close();
            }
        
            // Cerrar el diálogo de donación al hacer clic fuera del contenido
            donacionMonetariaDialog.addEventListener("click", (e) => {
                if (!contenidoPopDialog.contains(e.target)) {
                    closeDonacionDialog();
                }
            });
        
            // Cerrar el diálogo de confirmación al hacer clic fuera del contenido
            confirmEnvioDialog.addEventListener("click", (e) => {
                if (!contenidoConfirmDialog.contains(e.target)) {
                    closeConfirmDialog();
                }
            });
        
            function handleFormSubmit(event) {
                event.preventDefault(); // Previene el comportamiento por defecto del formulario
                closeDonacionDialog(); // Cierra el diálogo de donación
        
                // Muestra el diálogo de confirmación
                confirmEnvioDialog.showModal();        
        
                return false; // Asegúrate de no enviar el formulario de manera tradicional
            }
        </script>
        <script>
            const cantDonacionInput = document.getElementById('cant-donacion');
            //Validar cantidad donacion//
            cantDonacionInput.addEventListener('input', function() {
                    // Convertir el valor a string para verificar la longitud
                    const value = cantDonacionInput.value;
        
                    // Validar que no se exceda la longitud de 2 cifras
                    if (value.length > 3) {
                        cantDonacionInput.value = value.slice(0, 3); // Limitar a dos cifras
                    }
        
            });
        </script>


        
    </body>
</html>