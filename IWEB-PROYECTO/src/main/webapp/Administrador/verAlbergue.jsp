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
                <div class="container">
                    <div class="container md-8" style="width: 100%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <a href="/administrator/administracionCuentas.html"><button type="button" class="btn btn-personal2">Regresar   </button></a>
                    </div>
                    <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm" style="padding:10px" >
                            <h1 style="margin-top: 10px;" class="text-center">Perfil de Albergue</h1>

                            <div class="row justify-content-center p-1">
                                <div class="col d-flex justify-content-center">
                                    <div class="image-container">
                                        <img src="/common/img/logos/albergueDefault.png" alt="Perfil de usuario">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <h5>Datos del Encargado</h5>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="nombre">Nombre </label>
                                    <input type="text" id="nombre" class="form-control" placeholder="Juan Ernesto" required disabled>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="apellido">Apellido</label>
                                    <input type="text" id="apellido" class="form-control" placeholder="Sifuentes Martinez" required disabled>
                                </div>
                            </div>
                            <hr>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <h5>Datos del Albergue</h5>
                                </div>
                                <div class="col-md-9 p-1">
                                    <label for="nombreAlb">Nombre</label>

                                    <input type="text" id="nombreAlb" class="form-control" placeholder=" Patitas Felices" required disabled>

                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="distrito">Año de Creación:</label>
                                    <input type="number" class="form-control" placeholder="2008" required disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1" >
                                    <label for="correo">Correo:</label>
                                    <input type="text" id="correo" class="form-control" placeholder="patitasfelices@gmail.com" required disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1" >
                                    <label for="direccion">Cantidad de animales albergados</label>
                                    <input type="number" class="form-control" placeholder="70" required disabled>
                                </div>
                                <div class="col-md-6 p-1" >
                                    <label for="direccion">Cantidad de espacios para nuevos animales</label>
                                    <input type="number" class="form-control" placeholder="30" required disabled >
                                </div>

                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-4 p-1" >
                                    <label for="distrito">Distrito</label>
                                    <select class="form-select" name="distrito" id="distrito" required disabled>
                                        <option value="">San Martín de Porres</option>
                                        <optgroup label="Lima Norte">
                                            <option value="ancon">Ancon</option>
                                            <option value="santa_rosa">Santa Rosa</option>
                                            <option value="carabayllo">Carabayllo</option>
                                            <option value="puente_piedra">Puente Piedra</option>
                                            <option value="comas">Comas</option>
                                            <option value="los_olivos">Los Olivos</option>
                                            <option value="san_martin_porres">San Martín de Porres</option>
                                            <option value="independencia">Independencia</option>
                                        </optgroup>
                                        <optgroup label="Lima Sur">
                                            <option value="san_juan_miraflores">San Juan de Miraflores</option>
                                            <option value="villa_maria_triunfo">Villa María del Triunfo</option>
                                            <option value="villa_salvador">Villa el Salvador</option>
                                            <option value="pachacamac">Pachacamac</option>
                                            <option value="lurin">Lurín</option>
                                            <option value="punta_hermosa">Punta Hermosa</option>
                                            <option value="punta_negra">Punta Negra</option>
                                            <option value="san_bartolo">San Bartolo</option>
                                            <option value="santa_maria_mar">Santa María del Mar</option>
                                            <option value="pucusana">Pucusana</option>
                                        </optgroup>
                                        <optgroup label="Lima Este">
                                            <option value="san_juan_lurigancho">San Juan de Lurigancho</option>
                                            <option value="chosica">Lurigancho/Chosica</option>
                                            <option value="ate">Ate</option>
                                            <option value="el_agustino">El Agustino</option>
                                            <option value="santa_anita">Santa Anita</option>
                                            <option value="la_molina">La Molina</option>
                                            <option value="cieneguilla">Cieneguilla</option>
                                        </optgroup>
                                        <optgroup label="Lima Oeste">
                                            <option value="rimac">Rimac</option>
                                            <option value="cercado_lima">Cercado de Lima</option>
                                            <option value="breña">Breña</option>
                                            <option value="pueblo_libre">Pueblo Libre</option>
                                            <option value="magdalena">Magdalena</option>
                                            <option value="jesus_maria">Jesus María</option>
                                            <option value="la_victoria">La Victoria</option>
                                            <option value="lince">Lince</option>
                                            <option value="san_isidro">San Isidro</option>
                                            <option value="san_miguel">San Miguel</option>
                                            <option value="san_borja">San Borja</option>
                                            <option value="surquillo">Surquillo</option>
                                            <option value="santiago_surco">Santiago de Surco</option>
                                            <option value="barranco">Barranco</option>
                                            <option value="chorrillos">Chorrillos</option>
                                            <option value="san_luis">San Luis</option>
                                            <option value="miraflores">Miraflores</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="col-md-8 p-1">
                                    <label for="Direccion">Dirección</label>
                                    <input type="text" class="form-control" placeholder="Mz. E Lt. 3 Urb. Señor de los Milagros (espalda de la posta)" maxlength="100" id="Direccion" name="Direccion" >
                                </div>

                            </div>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="direc_donac">Direccion de donaciones</label>
                                    <input type="text" class="form-control" id="direc_donac" maxlength="100" placeholder="Mz. E Lt. 3 Urb. Señor de los Milagros (espalda de la posta)" required disabled >

                                </div>

                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="nom_contac">Nombre de contacto de Donaciones</label>
                                    <input type="text" class="form-control" id="nom_contac" maxlength="100" placeholder="Simeon Carrasco" required disabled>

                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="num_donac">Numero de contacto Donaciones</label>
                                    <input type="number" id="num_donac" class="form-control" placeholder="993081812" required disabled>

                                </div>

                            </div>

                            <hr>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="cantidad_albergados">Cantidad de animales albergados</label>
                                    <input type="number" id="cantidad_albergados" class="form-control" placeholder="70" required disabled>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="espacios_nuevos">Cantidad de espacios para nuevos animales</label>
                                    <input type="number" id="espacios_nuevos" class="form-control" placeholder="30" required disabled>
                                </div>
                            </div>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="punto_acopio">Punto de acopio de donaciones</label>
                                    <input type="text" id="punto_acopio" class="form-control" maxlength="100" placeholder="Colegio Humanitas San Miguel" required disabled>
                                </div>
                            </div>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button type="button" class="btn btn-personal" id="editarBtn">Editar datos</button>
                                </div>
                            </div>
                            <hr>


                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <p>Si necesita cambiar alguno de estos datos, contactar son Soporte</p>
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
