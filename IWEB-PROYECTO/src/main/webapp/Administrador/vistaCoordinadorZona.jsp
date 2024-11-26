<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Crear Coordinador de Zona</title>
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
            <div class="welcome-text">Hola, Administrador</div>
        </div>
        <div class="logo"><a href="/administrator/dashboard.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="/administrator/administracionCuentas.html" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
                <li><a href="/administrator/solicitudCuentaAlbergues.html" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
                <li><a href="/administrator/validacionUsuarios.html" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
                <li><a href="/administrator/creacionCoordinadorZona.html" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
                <li><a href="/administrator/creacionLugarHabilitado.html" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
                <li><a href="/administrator/dashboard.html" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
                <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="/administrator/administracionCuentas.html">Administración</a>
            <hr>

            <a href="/administrator/solicitudCuentaAlbergues.html">Validar Albergues</a>
            <a href="/administrator/validacionUsuarios.html">Validar Usuarios</a>
            <hr>

            <a href="/administrator/creacionCoordinadorZona.html">Crear Coordinador de Zona</a>
            <a href="/administrator/creacionLugarHabilitado.html">Crear lugar habilitado</a>
            <hr>
            <a href="/administrator/dashboard.html">Dashboard</a>
            <hr>
            <a href="/login/login.html">Cerrar Sesión</a>

        </div>


        <div class="container-fluid d-flex" id="contenido-principal">

            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                    <form id="uploadForm" style="padding:10px" >
                        <h1 style="margin-top: 10px;" class="text-center">Vista de Coordinador Zonal</h1>
                        <!--Primera fila de selección-->
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="Nombre-coordinador">Nombres</label>
                                <input type="text" class="form-control" placeholder="Alan" id="Nombre-coordinador" name="Nombre-coordinador" maxlength="40" disabled>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="Apellido-coordinador">Apellidos</label>
                                <input type="text" class="form-control" placeholder="Garcia Perez" id="Apellido-coordinador" name="Apellido-coordinador" maxlength="50" disabled>
                            </div>
                        </div>
                        <!--Segunda fila de selección-->
                        <div class="row justify-content-center p-1">
                            <div class="col-md-5 p-1">
                                <label for="celular-coordinador">Celular</label>
                                <input type="number" class="form-control" id="celular-coordinador" placeholder="962137991" disabled>
                            </div>

                            <div class="col-md-7 p-1">
                                <label for="correo-coordinador">Correo electrónico</label>
                                <input type="email" class="form-control" id="correo-coordinador" min="10" max="254" placeholder="alanG@gmail.com" disabled>
                                <span id="errorMessage" style="color: red; display: none;">Error: correo inválido.</span>
                            </div>
                        </div>
                        <!--Tercera fila de selección-->
                        <div class="row justify-content-center p-1">
                            <div class="col-md-5 p-1">
                                <label for="dni-coordinador">DNI</label>
                                <input type="number" class="form-control" id="dni-coordinador" placeholder="79831285" disabled>
                            </div>

                            <div class="col-md-4 p-1">
                                <label for="zona-asignada">Zona Asignada</label>
                                <select class="form-select" id="zona-asignada" aria-label="Floating label select example" disabled>
                                    <option value="" disabled selected>Zona norte</option>
                                    <option value="Zona Norte">Zona Norte</option>
                                    <option value="Zona Sur">Zona Sur</option>
                                    <option value="Zona Este">Zona Este</option>
                                    <option value="Zona Oeste">Zona Oeste</option>
                                </select>
                            </div>

                            <div class="col-md-3 p-1">
                                <label for="fechaNacimineto">Fecha de nacimiento</label><br>
                                <input type="date" class="form-control"  id="fechaNacimineto" name="fechaNacimiento" disabled>
                            </div>



                        </div>
                        <!--Boton de enviar-->
                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1 d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary" disabled>Enviar</button>
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
    const nombreCoordinadorInput = document.getElementById('Nombre-coordinador');
    const apellidoCoordinadorInput = document.getElementById('Apellido-coordinador');
    const fechaNacimientoInput = document.getElementById('fechaNacimiento');


    //Nombre y apellidos coordinador//
    // Validar que solo se ingresen letras
    nombreCoordinadorInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
    // Validar que solo se ingresen letras
    apellidoCoordinadorInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que la fecha ingresada sea menor al día actual
    fechaNacimientoInput.addEventListener('input', function() {
        const selectedDate = new Date(fechaNacimientoInput.value);
        const today = new Date();

        // Establecer la hora de 'today' a 00:00:00 para solo comparar la fecha
        today.setHours(0, 0, 0, 0);

        // Comparar las fechas
        if (selectedDate >= today) {
            errorMessage.style.display = 'block'; // Mostrar mensaje de error si la fecha es igual o mayor a hoy
        } else {
            errorMessage.style.display = 'none'; // Ocultar mensaje de error
        }
    });
</script>
<script>
    const celularCoordinadorInput = document.getElementById('celular-coordinador');
    const correoCoordinadorInput = document.getElementById('correo-coordinador');
    const dniCoordinadorInput = document.getElementById('dni-coordinador');

    //Validar longitud de numero telefonico//
    celularCoordinadorInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = celularCoordinadorInput.value;

        // Validar que no se exceda la longitud de 9 cifras
        if (value.length > 9) {
            celularCoordinadorInput.value = value.slice(0, 9); // Limitar a dos cifras
        }

        // Validar que la primera cifra sea un "9"
        if (value.length > 0 && value[0] !== '9') {
            celularCoordinadorInput.value = ''; // Limpiar el campo si la primera cifra no es "9"
        }
    });

    //Validar DNI//
    dniCoordinadorInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = dniCoordinadorInput.value;

        // Validar que no se exceda la longitud de 9 cifras
        if (value.length > 8) {
            dniCoordinadorInput.value = value.slice(0, 8); // Limitar a dos cifras
        }
    });

    //Validar correo electronico//
    correoCoordinadorInput.addEventListener('input', function() {
        const value = correoCoordinadorInput.value;
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
</script>
</body>
