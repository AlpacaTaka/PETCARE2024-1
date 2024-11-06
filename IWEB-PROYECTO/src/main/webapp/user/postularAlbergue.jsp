
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
    <title>Eventos</title>
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
                <a href="/user/postularAlbergue.html">Postular a Albergue</a>
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
                    <div class="container md-8" style="width: 85%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" onclick="location.href='inicio.jsp'" class="btn btn-personal2">Regresar</button>
                    </div>
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm" style="padding:10px" >
                            <h1 style="margin-top: 10px;" class="text-center">Postulación para Albergue</h1>
                            <!--Primera fila de selección-->
                            <div class="row justify-content-center p-1">
                                 <div class="col-md-12 p-1">
                                    <label for="Nombre-encargado">Nombres</label>
                                    <input type="text" class="form-control" placeholder="Ingrese los nombres del encargado" id="Nombre-encargado" name="Nombre-encargado" maxlength="40" required>
                                </div> 
                            </div>
                            <!--Segunda fila de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="Apellido-encargado">Apellidos</label>
                                    <input type="text" class="form-control" placeholder="Ingrese los apellidos del encargado" id="Apellido-encargado" name="Apellido-encargado" maxlength="60" required> 
                                </div>
                            </div>   
                            <!--Tercera fila de selección-->
                            <div class="row justify-content-center p-1">

                                <div class="col-md-12 p-1">
                                    <label for="correo-encargado">Correo electrónico</label>
                                    <input type="email" class="form-control" id="correo-encargado" min="10" max="254" placeholder="Ingrese el correo electrónico del encargado" required>
                                    <span id="errorMessage" style="color: red; display: none;">Error: correo inválido.</span>
                                </div>
                            </div>
                            <!--Cuarta fila de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">                         
                                    <label for="Nombre-user-albergue">Nombre de la organización</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el nombre del albergue" id="Nombre-user-albergue" name="Nombre-user-albergue" maxlength="100" required>      
                                </div>
                               
                            </div>

                             
                            <!--Boton de enviar-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button type="submit" class="btn btn-personal">Enviar</button>
                                </div>
                            </div>                        
                        </form>
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

<script>
    const nombreEncargadoInput = document.getElementById('Nombre-encargado');
    const apellidoEncargadoInput = document.getElementById('Apellido-encargado');


    //Nombre y apellidos encargado//
    // Validar que solo se ingresen letras
    nombreEncargadoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
    // Validar que solo se ingresen letras
    apellidoEncargadoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

</script>
<script>
    const correoEncargadoInput = document.getElementById('correo-encargado'); 
    const nombreAlbergueInput = document.getElementById('Nombre-user-albergue');

    //Validar correo electronico//
    correoEncargadoInput.addEventListener('input', function() {
        const value = correoEncargadoInput.value;
        const emailPattern = /^[^\s@]+@[^\s@]+\.(com|org|net|info|biz|co|edu|gov|mil|[a-z]{2})$/i;

        // Separar la parte antes del dominio
        const localPart = value.split('@')[0];

        // Validar el correo y la longitud de la parte local
        if (!emailPattern.test(value) || localPart.length < 10) {
            errorMessage.style.display = 'block'; // Mostrar mensaje de error
            event.preventDefault();
        } else {
            errorMessage.style.display = 'none'; // Ocultar mensaje de error

        }

    });

    // Validar que solo se ingresen letras
    nombreAlbergueInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
</script>
