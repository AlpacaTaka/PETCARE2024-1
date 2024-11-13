<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int albergueID = (int) request.getAttribute("idAlbergue");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<%=request.getContextPath()%>/common/img/logos/paw.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/common/css/baseDesign.css">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Formulario de Adopción</title>
    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
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
            <div class="welcome-text"><%=albergueID%>Hola, Patitas Felices</div>
        </div>
        <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>
    <div class="main">
        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/PortalAdopciones" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
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
            <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
            <a href="<%=request.getContextPath()%>/PortalAdopciones">Portal de Adopciones</a>
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
            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container md-8  d-flex justify-content-center" style="width: 85%; margin-bottom: 20px; padding: 0;">
                    <a href="<%=request.getContextPath()%>/PortalAdopciones"><button type="button" class="btn btn-personal2">Regresar</button></a>
                </div>
                <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                    <form id="uploadForm" style="padding:10px" >
                        <h1 style="margin-top: 10px;" class="text-center">Creación de perfil de Mascota para Adopción</h1>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="nombreMascota">Nombre</label>
                                <input id="nombreMascota" type="text" class="form-control" placeholder="Ingrese el nombre de la mascota" maxlength="21" required>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="ESpecies">Especie</label>
                                <select class="form-select" id="Especies" aria-label="Floating label select example" required>
                                    <option selected value="">Seleccione la especie de la Mascota</option>
                                    <option value="Perro">Perro</option>
                                    <option value="Gato">Gato</option>
                                    <option value="Ave">Ave</option>
                                    <option value="Hamster">Hamster</option>
                                    <option value="Conejo">Conejo</option>
                                    <option value="Tortuga">Tortuga</option>
                                    <option value="Huron">Hurón</option>
                                    <option value="Chinchilla">Chinchilla</option>
                                    <option value="MiniPig">MiniPig</option>
                                </select>
                            </div>

                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="">Raza</label>
                                <select class="form-select" id="Razas" aria-label="Floating label select example" required>
                                    <option value="">Ingrese raza de la mascota</option>
                                </select>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="otra raza"> Si colocó otra raza,  escribala aquí
                                </label>
                                <input type="text" class="form-control"  id="otra-raza"  idplaceholder="Otra raza" disabled>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-4 p-1" >
                                <label for="distrito">Distrito</label>
                                <select class="form-select" name="distrito" id="distrito" required>
                                    <option value="">Selecciona un distrito</option>
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
                                <label for="Direccion">Dirección o referencia de Hallazgo</label>
                                <input type="text" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="Direccion">
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-7 p-1">
                                <label for="edad">Edad Aproximada</label>
                                <input type="number" class="form-control" id="edad" placeholder="Ingrese edad" required>
                            </div>
                            <div class="col-md-5 p-1 ">
                                <label for="Sexo"><strong>Sexo de la Mascota</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Macho
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Hembra
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1">
                                <label for="breve_descrip"> Breve Descripción de la Mascota</label>
                                <textarea name="breve_descrip" id="breve_descrip" class="form-control" placeholder="Ingrese la breve descripcion de la mascota" maxlength="300" required></textarea>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1 justify-content-center">
                                <label for="formFile" class="form-label">Subir una foto de la mascota (PNG)</label>
                                <input class="form-control" type="file" id="formFile" accept=".png" required>
                            </div>
                            <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>

                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-5 p-1 ">
                                <label for="hogarTemporal"><strong>¿Se encuentra en un hogar temporal?</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault1">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Si
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-7 p-1">
                                <label for="condiciones">Condiciones de adopción</label>
                                <input type="text" id="condiciones" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" name="condiciones">
                            </div>

                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1 d-flex justify-content-center">
                                <a href="<%=request.getContextPath()%>/PortalAdopciones"><button type="submit" class="btn btn-personal">Crear</button></a>
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

<script src="<%=request.getContextPath()%>/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    const select1 = document.getElementById('Especies');
    const select2 = document.getElementById('Razas');
    const otraRazaInput = document.getElementById('otra-raza');
    const nombreMascotaInput = document.getElementById('nombreMascota')

    const opciones = {
        Perro: ['Galgo', 'Shitzu', 'Chihuhua','No sabe','Otro'],
        Gato: ['Persa', 'Angora', 'Meinkoon','No sabe','Otro'],
        Ave: ['Ave1', 'Ave2', 'Ave3','Ave4','Otro'],
        Hamster: ['Hamster1', 'Hamster2', 'Hamster3','No sabe','Otro'],
        Conejo: ['Conejo1', 'Conejo2', 'Conejo3','No sabe','Otro'],
        Tortuga: ['T1', 'T2', 'T3','No sabe','Otro'],
        Huron: ['Manzana', 'Banana', 'Naranja','No sabe','Otro'],
        Chinchilla: ['Chinchilla1', 'Chinchilla1', 'Chinchilla3','No sabe','Otro'],
        MiniPig: ['No sabe']
    };

    select1.addEventListener('change', function() {
        const seleccion = this.value;

        // Limpiar las opciones anteriores
        select2.innerHTML = '<option value="">--Selecciona una opción--</option>';

        if (seleccion) {
            // Agregar las nuevas opciones
            opciones[seleccion].forEach(function(opcion) {
                const nuevaOpcion = document.createElement('option');
                nuevaOpcion.value = opcion.toLowerCase();
                nuevaOpcion.textContent = opcion;
                select2.appendChild(nuevaOpcion);
            });
        }
    });

    // Habilitar/deshabilitar el campo de texto "otra raza"
    select2.addEventListener('change', function() {
        if (this.value === 'otro') {  // El valor se convierte a minúsculas, por eso se usa "otro"
            otraRazaInput.disabled = false;
        } else {
            otraRazaInput.disabled = true;
            otraRazaInput.value = ''; // Limpiar el campo si se deshabilita
        }
    });

    //Nombre y apellidos mascota//
    // Validar que solo se ingresen letras
    nombreMascotaInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
</script>
<script>
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('formFile');
        const file = fileInput.files[0];
        const fileError = document.getElementById('fileError');

        // Verifica si el archivo tiene el tipo MIME de PNG
        if (file && file.type !== 'image/png') {
            event.preventDefault(); // Evita que el formulario se envíe
            fileError.style.display = 'block'; // Muestra el mensaje de error
        } else {
            fileError.style.display = 'none'; // Oculta el mensaje de error si está todo bien
        }
    });
</script>
<script>
    //Limita la cant digitos de números
    const numeroInput = document.getElementById('edad')
    numeroInput.addEventListener('input', function(){
        if(this.value.length > 2){
            this.value = this.value.slice(0,2);
        }

        // Validar el rango
        const numValue = Number(numeroInput.value);
        if (numValue < 1 || numValue > 25) {
            numeroInput.setCustomValidity('El número debe estar entre 1 y 25.');
        } else {
            numeroInput.setCustomValidity(''); // Restablecer el mensaje de error
        }
    })

</script>

<script>
    // Función para validar que solo se ingresen letras y espacios
    function validarSoloLetras(input) {
        input.value = input.value.replace(/[^a-zA-Z\s]/g, ''); // Elimina caracteres no permitidos
    }
</script>
<script>
    // Función para validar que solo se ingresen letras, números y espacios
    function validarDireccion(input) {
        input.value = input.value.replace(/[^a-zA-Z0-9\s]/g, ''); // Elimina caracteres no permitidos
    }
</script>
<script>
    // Función para permitir solo números (enteros o decimales)
    function validarSoloNumeros(input) {
        input.value = input.value.replace(/[^0-9]/g, ''); // Elimina caracteres no numéricos
    }
</script>


</body>
</html>