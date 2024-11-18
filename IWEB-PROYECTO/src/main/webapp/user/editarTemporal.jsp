<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/common/css/baseDesign.css">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Postular como Hogar Temporal</title>

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

            <div id="menu" class="menu">
                <a href="/user/miPerfil.jsp">Mi Perfil</a>
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

            <div class="container-fluid d-flex" id="contenido-principal">
                <!--Boton de regreso a la página principal-->
                <div class="col" id="contenido-nofooter">
                    <div class="container md-8 d-flex justify-content-between" style="width: 85%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='misSolicitudesTemporales.jsp'">  Regresar   </button>
                        
                    </div>
                    
                    
                    <!--Container del formulario-->
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm"style="padding:10px">
                            <h1 style="margin-top: 10px;" class="text-center">Edición de Solicitud de Hogar Temporal</h1>
                            <br>
                            <!--Primera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">                         
                                    <label for="Nombre-temporal">Nombres</label>
                                    <input type="text" class="form-control" placeholder="Ingrese sus nombres" id="Nombre-temporal" name="Nombre-temporal" maxlength="40" required>      
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="Apellido-temporal">Apellidos</label>
                                    <input type="text" class="form-control" placeholder="Ingrese sus apellidos" id="Apellido-temporal" name="Apellido-temporal" maxlength="50" required> 
                                </div>
                            </div>
                            <!--Segunda columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1">
                                    <label for="edad">Edad</label>
                                    <input type="number" class="form-control" id="edad" min="14" max="90" placeholder="Ingrese su edad" style="appearance: none; -moz-appearance: textfield;" required>
                                </div>
                                <div class="col-md-7 p-1 ">
                                    <label for="Sexo">Género</label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="genero" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Masculino
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="genero" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            Femenino
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="genero" id="flexRadioDefault3" checked>
                                            <label class="form-check-label" for="flexRadioDefault3">
                                            Otro
                                            </label>
                                        </div>
                                    </div>
                                </div> 
                                
                            </div>
                            <!--Tercera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-8 p-1">
                                    <label for="Direccion">Dirección</label>
                                    <input type="text" class="form-control" placeholder="Ingrese su dirección" maxlength="100" id="Direccion" name="Direccion" required>
                               </div>
                               <div class="col-md-4 p-1" >
                                    <label for="distrito">Distrito</label>
                                    <select class="form-select" name="distrito" id="distrito" required>
                                        <option value="" disabled selected>Seleccione una opción</option>
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
                                
                            </div>
                            <!--Cuarta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1">
                                    <label for="celular">Celular</label>
                                    <input type="number" class="form-control" id="celular" placeholder="Ingrese su número de celular" required>
                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="cantidad-cuartos">Cantidad de cuartos</label>
                                    <input type="number" class="form-control" id="cantidad-cuartos" min="1" max="5" placeholder="Ingrese un número" required>
                                </div>
                                <div class="col-md-4 p-1">
                                    <label for="metraje-casa">Metraje de la vivienda <strong>(m²)</strong></label>
                                    <input type="number" class="form-control" id="metraje-casa" min="30" max="300" placeholder="Ingrese un número" required>
                                </div>
                            </div>
                            <!--Quinta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-2 p-1 ">
                                    <label for="tiene-mascotas"><b>¿Tiene hijos?</b></label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tieneHijos" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tieneHijos" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                            </label>
                                        </div>
                                     </div>
                                </div>
                                <div class="col-md-4 p-1 ">
                                    <label for="tiene-mascotas"><b>¿Vive solo o con dependientes?</b></label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="viveSolo" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Solo
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="viveSolo" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            Con dependientes
                                            </label>
                                        </div>
                                     </div>
                                </div>
                                <div class="col-md-6 p-1 ">
                                    <label for="tiene-mascotas"><b>¿Su trabajo/estudios es remoto o presencial?</b></label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="modoTrabajo" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Remoto
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="modoTrabajo" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            Presencial
                                            </label>
                                        </div>
                                     </div>
                                </div>
                            </div>
                            <!--Sexta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1 ">
                                    <label for="tiene-mascotas"><b>¿Tiene mascotas?</b></label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tieneMascotas" id="flexRadioDefault1" value="si">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="tieneMascotas" id="flexRadioDefault2" value="no" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                            </label>
                                        </div>
                                     </div>
                                </div>
                                <div class="col-md-5 p-1">
                                    <label for="num-mascotas">Indique el número de mascotas</label>
                                    <input type="number" class="form-control" id="num-mascotas" min="1" max="10" placeholder="Ingrese un número" required disabled>
                                </div>
                            </div>
                            <!--Septima columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-8 p-1">                         
                                    <label for="Nombre-referncia">Nombre completo de la persona de referencia</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el nombreMascota completo" id="Nombre-referncia" name="Nombre-referncia" maxlength="70" required>
                                </div>
                                <div class="col-md-4 p-1">
                                    <label for="celular-referencia">Celular</label>
                                    <input type="number" class="form-control" id="celular-referencia" placeholder="Ingrese el número de celular" required>
                                </div>
                            </div>
                            <!--Octava columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="formFileMultiple" class="form-label">Adjunte imágenes de la vivienda</label>
                                    <input class="form-control" type="file" id="formFileMultiple" multiple accept=".png" onchange="validateFiles(this)" required>
                                    <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                                    <div id="cantError" class="text-danger mt-3" style="display: none;">El máximo de archivos a subir es 4.</div>
                                </div>
                                
                            </div>
                            <!--Novena columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="tiempo-temporal">Tiempo de temporal (en semanas)</label>
                                    <input type="number" class="form-control" id="tiempo-temporal" placeholder="Ingrese la cantidad de semanas" min="2" max="104" required>
                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="fechaInicio">Fecha de inicio:</label><br>
                                    <input type="date"  class="form-control" id="fechaInicio" name="fechaInicio" required> 
                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="fechaFin">Fecha de final:</label><br>
                                    <input type="date" class="form-control" id="fechaFin" name="fechaFin" required> 
                                </div>
                            </div>
                            <br>
                            <!--Boton de enviar-->
                             <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button type="submit" class="btn btn-personal">Editar</button>
                                </div>
                            </div>                           
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

        <script src="/common/script/neonavbar.js"></script>
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