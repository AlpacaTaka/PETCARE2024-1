
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="usuario" class="com.example.iwebproyecto.beans.Usuario" scope="request" />

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
    <title>Mi  cuenta</title>
    <style>
        
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/ 
        
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
                    <li><a href="${pageContext.request.contextPath}/MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user" style="color: #000;"></i></a></li>
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
                
            

                <div class="row d-flex flex-column" id="contenido-nofooter">
                    <div class="container">
                        <div class="container md-8" style="width: 100%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                            <button type="button" onclick="location.href='inicio.jsp'" class="btn btn-personal2">Regresar   </button>
                        </div>
                        <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            <form id="uploadForm" style="padding:10px" >
                                <h1 style="margin-top: 10px;" class="text-center">Mi Perfil</h1>

                                <div class="row justify-content-center p-1">
                                    <div class="col d-flex justify-content-center">
                                        <div class="image-container">
                                            <img src="${pageContext.request.contextPath}/<%=usuario.getFoto().getRutaFoto()%>" alt="Perfil de usuario">
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    
                                    <div class="col-md-6 p-1">
                                        <label for="">Nombre</label>
                                        <input type="text" class="form-control" value="<%=usuario.getNombre()%>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="">Apellido</label>
                                        <input type="text" class="form-control" value="<%=usuario.getApellido()%>" required disabled>
                                    </div>
                                    
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-4 p-1">
                                        <label for="">DNI</label>
                                        
                                        <input type="number" class="form-control" placeholder="03203852" required disabled>
                                      
                                    </div>
                                    <div class="col-md-8 p-1">
                                        <label for="distrito">Distrito</label>
                                        <input type="text" class="form-control" value="<%=usuario.getDistrito().getNombreDistrito()%>" required disabled>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1" >
                                        <label for="direccion">Dirección</label>
                                        <input type="text" class="form-control" value="<%=usuario.getDireccion()%>" required disabled>
                                    </div>
                                    
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1" >
                                        <label for="direccion">Correo (Gmail)</label>
                                        <input type="email" class="form-control" value="<%=usuario.getCorreoElectronico()%>" required disabled>
                                    </div>
                                    
                                </div>
                                
    
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <p>Si necesita cambiar sus datos personales, contactar con Soporte</p>
                                    </div>
    
                                </div>                           
                            </form>
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

    
    
</body>
</html>