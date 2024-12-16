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
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Donacion de suministros - Se necesitan camas</title>
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
                

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" class="btn btn-personal2"onclick="location.href='mascotasPerdidas.jsp'"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 5px 50px;">
                            <h2 class="card-title" style="margin-top: 30px; font-size: 50px; color: #4d0e0e;">Canela</h2>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="/common/img/perdidos/perdido1.jpg" class="card-img-eve" alt="Imagen" style="width: 100%; max-width: 60%; height: auto; border-radius: 15px;">
                            </div>
                            <div class="badge text-bg-success text-wrap" style="margin-top: 10px; font-size: 20px; padding: 6px 20px;">
                                Activo
                            </div>
                            <div class="information-card" style="padding: 15px 0px;">
                                <p class="card-text" >¡Hola! Necesito tu ayuda para encontrar a mi pequeño si tienes cualquier información acerca de él no dudes en contactarme</p>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-2">
                                        <p class="card-text" style="text-align: left;"><strong>Tamaño:</strong> </p>
                                        <p class="card-text" style="text-align: left;"> Pequeño </p>
                                        <p class="card-text" style="text-align: left;"><strong>Especie:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Perro</p>
                                        <p class="card-text" style="text-align: left;"><strong>Raza:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Esquimal americano</p>
                                        <p class="card-text" style="text-align: left;"><strong>Edad:</strong></p>
                                        <p class="card-text" style="text-align: left;">5 meses</p>
                                        <p class="card-text" style="text-align: left;"><strong>Distintivo:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Una de sus orejas es más pequeña que la otra</p>
                                    </div>
                                    <div class="col-md-6 p-2">
                                        <p class="card-text" style="text-align: left;"><strong>Lugar de perdida:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Parque Condesa - Pueblo Libre</p>
                                        <p class="card-text" style="text-align: left;"><strong>Hora aproximada de pérdida:</strong> </p>
                                        <p class="card-text" style="text-align: left;">14:20 pm</p>
                                        <p class="card-text" style="text-align: left;"><strong>Descricpción adicional:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Canela es un perro de muy pequeño que aún no inicio a consumir croquetas, debido a que no ha desarrollado sus dientes aún</p>
                                        <p class="card-text" style="text-align: left;"><strong>Recompensa:</strong></p>
                                        <p class="card-text" style="text-align: left;">200</p>
                                    </div>
                                </div>
                                
                                <p class="card-text" style="text-align: left; color: #4d0e0e; font-size: 22px;"><em><strong>Información de contacto</strong></em> </p>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <p class="card-text" style="text-align: left;"><strong>Nombres del dueñ@:</strong> </p>
                                        <p class="card-text" style="text-align: left;">Luz Marina Perez Ayala</p>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <p class="card-text" style="text-align: left;"><strong>Celular:</strong></p>
                                        <p class="card-text" style="text-align: left;">988565452</p>
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

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>