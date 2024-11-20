<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int albergueID = (int) request.getAttribute("idAlbergue");
%>
<%--jsp:useBean id=""/--%>
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
                <li id="cerrar-sesion"><a href="<%=request.getContextPath()%>/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
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
                    <form id="uploadForm" style="padding:10px" method="POST" action="<%=request.getContextPath()%>/PortalAdopciones?action=create">
                        <input type="hidden" name="id" value="<%=albergueID%>">
                        <h1 style="margin-top: 10px;" class="text-center">Creación de perfil de Mascota para Adopción</h1>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="nombreMascota">Nombre</label>
                                <input id="nombreMascota" name="nombreMascota" type="text" class="form-control" placeholder="Ingrese el nombreMascota de la mascota" maxlength="21" required>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="Especies">Especie</label>
                                <select class="form-select" id="Especies" name="especie" aria-label="Floating label select example" required>
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
                                <label for="Razas">Raza</label>
                                <select class="form-select" id="Razas" name="raza" aria-label="Floating label select example" required>
                                    <option value="">Ingrese raza de la mascota</option>
                                </select>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="otra-raza"> Si colocó otra raza,  escribala aquí
                                </label>
                                <input type="text" class="form-control" name="otraRaza" id="otra-raza"  <%--placeholder="Otra raza"--%> disabled>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-4 p-1" >
                                <label for="distrito">Distrito</label>
                                <select class="form-select" name="idDistrito" id="distrito" required>
                                    <option value="">Selecciona un distrito</option>
                                    <optgroup label="Lima Norte">
                                        <option value="1">Ancon</option>
                                        <option value="2">Santa Rosa</option>
                                        <option value="3">Carabayllo</option>
                                        <option value="4">Puente Piedra</option>
                                        <option value="5">Comas</option>
                                        <option value="6">Los Olivos</option>
                                        <option value="7">San Martín de Porres</option>
                                        <option value="8">Independencia</option>
                                    </optgroup>
                                    <optgroup label="Lima Sur">
                                        <option value="9">San Juan de Miraflores</option>
                                        <option value="10">Villa María del Triunfo</option>
                                        <option value="11">Villa el Salvador</option>
                                        <option value="12">Pachacamac</option>
                                        <option value="13">Lurín</option>
                                        <option value="14">Punta Hermosa</option>
                                        <option value="15">Punta Negra</option>
                                        <option value="16">San Bartolo</option>
                                        <option value="17">Santa María del Mar</option>
                                        <option value="18">Pucusana</option>
                                    </optgroup>
                                    <optgroup label="Lima Este">
                                        <option value="19">San Juan de Lurigancho</option>
                                        <option value="20">Lurigancho/Chosica</option>
                                        <option value="21">Ate</option>
                                        <option value="22">El Agustino</option>
                                        <option value="23">Santa Anita</option>
                                        <option value="24">La Molina</option>
                                        <option value="25">Cieneguilla</option>
                                    </optgroup>
                                    <optgroup label="Lima Oeste">
                                        <option value="26">Rimac</option>
                                        <option value="27">Cercado de Lima</option>
                                        <option value="28">Breña</option>
                                        <option value="29">Pueblo Libre</option>
                                        <option value="30">Magdalena</option>
                                        <option value="31">Jesus María</option>
                                        <option value="32">La Victoria</option>
                                        <option value="33">Lince</option>
                                        <option value="34">San Isidro</option>
                                        <option value="35">San Miguel</option>
                                        <option value="36">San Borja</option>
                                        <option value="37">Surquillo</option>
                                        <option value="38">Santiago de Surco</option>
                                        <option value="39">Barranco</option>
                                        <option value="40">Chorrillos</option>
                                        <option value="41">San Luis</option>
                                        <option value="42">Miraflores</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="col-md-8 p-1">
                                <label for="Direccion">Dirección o referencia de Hallazgo</label>
                                <input type="text" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="direccionHallazgo">
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-7 p-1">
                                <label for="edad">Edad Aproximada</label>
                                <input type="number" class="form-control" id="edad" name="edad" placeholder="Ingrese edad" required>
                            </div>
                            <div class="col-md-5 p-1 ">
                                <label><strong>Sexo de la Mascota</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault1" value="Macho">
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Macho
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault2" checked value="Hembra">
                                        <label class="form-check-label" for="flexRadioDefault2">
                                            Hembra
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1">
                                <label for="breve"> Breve Descripción de la Mascota</label>
                                <textarea name="breveDescripcion" id="breve" class="form-control" placeholder="Ingrese la breve descripcion de la mascota" maxlength="300" required></textarea>
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
                                <label><strong>¿Se encuentra en un hogar temporal?</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault3" value="true">
                                        <label class="form-check-label" for="flexRadioDefault3">
                                            Si
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault4" checked value="false">
                                        <label class="form-check-label" for="flexRadioDefault4">
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
                                <button type="submit" class="btn btn-personal">Crear</button>
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
                    nuevaOpcion.value = opcion;/*.toLowerCase();*/
                    nuevaOpcion.textContent = opcion;
                    select2.appendChild(nuevaOpcion);
                });
            }
        });

        // Habilitar/deshabilitar el campo de texto "otra raza"
        select2.addEventListener('change', function() {
            if (this.value === 'Otro') {  // El valor se convierte a minúsculas, por eso se usa "otro"
                otraRazaInput.disabled = false;
            } else {
                otraRazaInput.disabled = true;
                otraRazaInput.value = ''; // Limpiar el campo si se deshabilita
            }
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
                fileError.style.display = 'none'; // Oculta el mensaje de error si
            }
        });
    </script>
    <script>
        //Limita la cant digitos de números
        const numeroInput = document.getElementById('edad')
        numeroInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^0-9]/g, '');
            if(this.value.length > 2){
                this.value = this.value.slice(0,2);
            }
        })
    </script>
    <script>
        const direccionInput = document.getElementById('Direccion')
        direccionInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^a-zA-Z0-9.áéíóú\s]/g, '');
        })
    </script>
    <script>
        const nombreMascotaInput = document.getElementById('nombreMascota')
        nombreMascotaInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^a-zA-Z0-9áéíóú\s]/g, '');
        })
    </script>
    <script>
        const condicionesInput = document.getElementById('condiciones')
        condicionesInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^a-zA-Z0-9,.áéíóú\s]/g, '');
        })
    </script>
    <script>
        const breveInput = document.getElementById('breve')
        breveInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^a-zA-Z0-9,;.áéíóú\s]/g, '');
        })
    </script>
    <script>
        const razaInput = document.getElementById('otra-raza')
        razaInput.addEventListener('input', function(){
            this.value = this.value.replace(/[^a-zA-Z\s]/g, '');
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