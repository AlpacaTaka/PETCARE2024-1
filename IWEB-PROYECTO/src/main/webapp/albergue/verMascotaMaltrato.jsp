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
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Mascota maltratada</title>
    <style>

        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }


        .image-container {
            width: 400px; /* Puedes ajustar el tamaño según sea necesario */
            height: 300px;
            border-radius: 5%;
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

        .form-control{
            background-color: transparent;
            border-color: transparent;
            font-size: 17px;
            margin-bottom: 2px;
        }

        @media (max-width: 768px) {

            .image-container{
                height: 300px; /* Asegura que la imagen ocupe toda la altura del contenedor */
                width: 270px;
                object-fit: cover; /* Ajuste perfecto sin deformar la imagen */
            }
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
            <div class="welcome-text">Hola, Patitas Felices</div>
        </div>
        <div class="logo"><a href="/user/inicio.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="miPerfil.html" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="adoptionTable.html" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                <li><a href="eventTable.html" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                <li><a href="donationTable.html" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                <li><a href="contactarTemporal.html" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                <li><a href="solicitudesAdopcion.html" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                <li><a href="verDenunciasMaltrato.html" title="Denuncias de maltrato"><i class="fi-rr-siren-on"></i></a></li>
                <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="miPerfil.html">Mi Perfil</a>
            <a href="adoptionTable.html">Portal de Adopciones</a>
            <a href="eventTable.html">Mis Eventos Benéficos</a>
            <a href="donationTable.html">Mis Eventos de Donación</a>
            <a href="contactarTemporal.html">Hogares Temporales</a>
            <a href="solicitudesAdopcion.html">Solicitudes de Adopción</a>
            <a href="verDenunciasMaltrato.html">Denuncias de maltrato</a>
            <!--<a href="#">Solicitudes de Adopción</a>-->
            <hr>
            <a href="/login/login.html">Cerrar Sesión</a>
        </div>

        <div class="container-fluid d-flex" id="contenido-principal">
            <!--Boton de regreso a la página principal-->
            <div class="col" id="contenido-nofooter">
                <div class="container md-8 d-flex justify-content-between g-2" style="width: 90%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                    <button type="button"  class="btn btn-personal2" onclick="location.href='verDenunciasMaltrato.html'">  Regresar   </button>

                </div>
                <div class="container md-12" style="width: 90%;max-width: 800px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 20px; padding: 10px 20px;">
                    <h1 style="margin-top: 10px; color: #4d0e0e; font-style: italic" class="text-center" >Pochita</h1>

                    <hr>
                    <div class="row">
                        <div class="col-md-12 p-1 d-flex align-items-center justify-content-center">
                            <div class="row justify-content-center p-1">
                                <div class="col d-flex justify-content-center">
                                    <div class="image-container">
                                        <img src="/common/img/perdidos/perdido5.jpg" alt="Perfil de usuario">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <form id="uploadForm" style="padding:10px" >
                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1">
                                <label for="nombre"><strong>Nombre y apellido del maltratador</strong></label>
                                <p class="form-control">Gerardo Rabanal</p>
                            </div>
                        </div>
                        <hr style="margin:0;">
                        <div class="row justify-content-center p-1">

                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Especie</strong></label>
                                <p class="form-control">Perro</p>
                            </div>
                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Raza</strong></label>
                                <p class="form-control">No sabe</p>
                            </div>
                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Tipo de Maltrato</strong></label>
                                <p class="form-control">Abandono</p>
                            </div>

                        </div>
                        <hr style="margin: 0;">
                        <div class="row justify-content-center p-1">

                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Tamaño</strong></label>
                                <p class="form-control">Pequeño</p>
                            </div>
                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Dirección de la mascota</strong></label>
                                <p class="form-control">Avenida Maravilla 221</p>
                            </div>
                            <div class="col-md-4 p-1">
                                <label for="nombre"><strong>Realizó una denuncia?</strong></label>
                                <p class="form-control">Sí</p>
                            </div>

                        </div>
                        <hr style="margin: 0;">



                    </form>

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
        </div>
    </div>
</div>

</div>
<script src="/common/script/neonavbar.js"></script>
<script src="js/perfilAlbergue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    const nombreTemporalInput = document.getElementById('Nombre-temporal');
    const nombreReferenciaInput = document.getElementById('Nombre-referncia');
    const apellidoTemporalInput = document.getElementById('Apellido-temporal');
    const edadInput = document.getElementById('edad');
    const celularInput = document.getElementById('celular');
    const cuartosInput = document.getElementById('cantidad-cuartos');
    const metrajeInput = document.getElementById('metraje-casa');
    const mascotasInput =  document.querySelectorAll('input[name="tieneMascotas"]');
    const numeroMascotasInput = document.getElementById('num-mascotas');
    const celularReferenciaInput = document.getElementById('celular-referencia');

    //Nombre y apellidos temporal//
    // Validar que solo se ingresen letras
    nombreTemporalInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
    // Validar que solo se ingresen letras
    apellidoTemporalInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    //Validar edad//
    edadInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = edadInput.value;

        // Validar que no se exceda la longitud de 2 cifras
        if (value.length > 2) {
            edadInput.value = value.slice(0, 2); // Limitar a dos cifras
        }

    });


    //Validar longitud de numero telefonico//
    celularInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = celularInput.value;

        // Validar que no se exceda la longitud de 2 cifras
        if (value.length > 9) {
            celularInput.value = value.slice(0, 9); // Limitar a dos cifras
        }

        // Validar que la primera cifra sea un "9"
        if (value.length > 0 && value[0] !== '9') {
            celularInput.value = ''; // Limpiar el campo si la primera cifra no es "9"
        }
    });

    //Validar cuartos//
    cuartosInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = cuartosInput.value;

        // Validar que no se exceda la longitud de 1 cifras
        if (value.length > 1) {
            cuartosInput.value = value.slice(0, 1); // Limitar a dos cifras
        }
        if (value < 1 || value > 6) {
            cuartosInput.value = ''; // Limpiar el campo si está fuera de rango
        }
    });

    // Validar metraje
    metrajeInput.addEventListener('input', function() {
        const value = metrajeInput.value;

        // Validar que no se exceda la longitud de 3 cifras
        if (value.length > 3) {
            metrajeInput.value = value.slice(0, 3); // Limitar a tres cifras
        }

    });

    // Validar el rango al perder el foco
    metrajeInput.addEventListener('blur', function() {
        const value = parseInt(metrajeInput.value, 10); // Convertir a número entero

        // Verificar si está dentro del rango
        if (value < 30 || value > 300) {
            alert('Por favor, ingrese un valor entre 30 y 300.'); // Mensaje de alerta
            metrajeInput.value = ''; // Limpiar el campo si está fuera de rango
        }
    });

    //Mascotas//
    mascotasInput.forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.value === 'si') {
                numeroMascotasInput.disabled = false; // Habilitar el campo
            } else {
                numeroMascotasInput.disabled = true; // Deshabilitar el campo
                numeroMascotasInput.value = ''; // Limpiar el campo si se deshabilita
            }
        });
    });
    //Validación de cifras de num mascotas//
    numeroMascotasInput.addEventListener('input', function(){
        const value = numeroMascotasInput.value;

        //Cifras menores a 1 digito//
        if (value.length > 1) {
            numeroMascotasInput.value = value.slice(0, 1); // Limitar a 3 cifras
        }
    });

    //Nombre persona de referencia//
    // Validar que solo se ingresen letras
    nombreReferenciaInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    //Validar longitud de numero telefonico persona Referencia//
    celularReferenciaInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^0-9]/g, '');
        // Convertir el valor a string para verificar la longitud
        const value = celularReferenciaInput.value;

        // Validar que no se exceda la longitud de 9 cifras
        if (value.length > 9) {
            celularReferenciaInput.value = value.slice(0, 9); // Limitar a dos cifras
        }

        // Validar que la primera cifra sea un "9"
        if (value.length > 0 && value[0] !== '9') {
            celularReferenciaInput.value = ''; // Limpiar el campo si la primera cifra no es "9"
        }
    });
</script>

<script>
    const tiempoTemporalInput = document.getElementById('tiempo-temporal');

    tiempoTemporalInput.addEventListener('input', function() {
        const value = tiempoTemporalInput.value;

        // Validar la longitud (1 cifra o 3 cifras)
        if (value.length > 0 && (value.length !== 3)) {
            // Limitar a 1 o 3 cifras
            if (value.length > 3) {
                tiempoTemporalInput.value = value.slice(0, 3); // Limitar a 3 cifras
            }
        }

        // Validar el rango
        const numValue = Number(tiempoTemporalInput.value);
        if (numValue < 2 || numValue > 104) {
            tiempoTemporalInput.setCustomValidity('El número debe estar entre 2 y 104.');
        } else {
            tiempoTemporalInput.setCustomValidity(''); // Restablecer el mensaje de error
        }
    });
</script>

<script>
    //Validar fechas de temporal//
    const fechaInicioInput = document.getElementById('fechaInicio');
    const fechaFinInput = document.getElementById('fechaFin');

    // Deshabilitar la entrada manual de texto
    fechaInicioInput.addEventListener('keydown', function(event) {
        event.preventDefault();
    });

    fechaFinInput.addEventListener('keydown', function(event) {
        event.preventDefault();
    });

    fechaFinInput.addEventListener('input', function() {
        const fechaInicio = new Date(fechaInicioInput.value);
        const fechaFin = new Date(fechaFinInput.value);

        // Validar que la fecha de fin sea mayor que la fecha de inicio
        if (fechaInicio && fechaFin) {
            if (fechaFin <= fechaInicio) {
                fechaFinInput.setCustomValidity('La fecha de fin debe ser posterior a la fecha de inicio.');
                fechaFinInput.reportValidity(); // Muestra el mensaje de error
                fechaFinInput.value = ''; // Limpiar el campo si la validación falla
            } else {
                fechaFinInput.setCustomValidity(''); // Restablecer el mensaje de error
            }
        }
    });

    fechaInicioInput.addEventListener('input', function() {
        const fechaInicio = new Date(fechaInicioInput.value);
        const fechaFin = new Date(fechaFinInput.value);

        // Validar que la fecha de inicio sea menor que la fecha de fin
        if (fechaInicio && fechaFin) {
            if (fechaInicio >= fechaFin) {
                fechaInicioInput.setCustomValidity('La fecha de inicio debe ser anterior a la fecha de fin.');
                fechaInicioInput.reportValidity(); // Muestra el mensaje de error
            } else {
                fechaInicioInput.setCustomValidity(''); // Restablecer el mensaje de error
            }
        }
    });
</script>

<script>
    //Validar el numero de archivos
    function validateFiles(input) {
        const files = input.files;
        const maxFiles = 4;
        const fileError = document.getElementById('fileError');
        const cantError = document.getElementById('cantError');

        // Reiniciar los mensajes de error
        fileError.style.display = 'none';
        cantError.style.display = 'none';

        // Verificar el número de archivos
        if (files.length > maxFiles) {
            cantError.style.display = 'block';
            input.value = ''; // Resetear el input
            return;
        }

        // Verificar el formato de cada archivo
        for (let i = 0; i < files.length; i++) {
            if (files[i].type !== 'image/png') {
                fileError.style.display = 'block';
                input.value = ''; // Resetea el input
                return;
            }
        }
    }
</script>
</body>
</html>
