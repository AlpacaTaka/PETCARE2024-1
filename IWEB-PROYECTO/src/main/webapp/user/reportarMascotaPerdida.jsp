<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
    <title>Post de mascota perdida</title>

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
                <a href="/user/miPerfil.html">Mi Perfil</a>
                <a href="/user/misEventos.html">Mis Eventos</a>
                <a href="/user/misDonaciones.html" id="Sep">Mis Donaciones</a>
                <hr>
                <a href="/user/allEventos.html">Eventos</a>
                <a href="/user/postularAlbergue.html">Postular a Albergue</a>
                <a href="/user/postularTemporal.html">Hogar Temporal</a>
                <a href="/user/solicitudesDonacionSuministros.html">Donaciones de Suministros</a>
                <a href="/user/donacionMonetaria.html">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.html">Portal de Adopciones</a>
                <a href="/user/mascotasPerdidas.html">Portal de Mascotas Perdidas</a>
                <a href="/user/avistamientoPerdidos.html">Portal Avistamiento Perdidos</a>
                <a href="/user/reportarMascotaPerdida.html">Reportar Mascota Perdida</a>
                <a href="/user/reportarMaltrato.html" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>

            <div class="container-fluid d-flex" id="contenido-principal">
                <!--Boton de regreso a la página principal-->
                <div class="col" id="contenido-nofooter">
                    <div class="container md-8 d-flex justify-content-between" style="width: 85%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='/user/inicio.html'">  Regresar   </button>
                        <button type="button"  class="btn btn-personal" onclick="location.href='/ReportarPerdido?action=listar'">  Ver mis reportes  </button>
                    </div>
                    <div class="container md-12" style="width: 85%;max-width: 800px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 20px; padding: 10px 20px;">
                        <h1 style="margin-top: 10px; color: #4d0e0e; font-style: italic" class="text-center" >Generar un post por mascota perdida</h1>
                        <p style="margin: 5px 20px" class="text-center">Ingresa la información requerida en el formulario para que se muestre en nuestra página y así, los demás usuarios puedan ayudarte a localizar a tu pequeñ@</p><br>
                    </div>
                    
                    <!--Container del formulario-->
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm" style="padding:10px" action="ReportarPerdido?action=guardar" method="post">
                            <h1 style="margin-top: 10px;" class="text-center">Formulario de mascota perdida</h1>
                            <br>
                            <!--Primera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">                         
                                    <label for="Descripcion">Descripción</label>
                                    <input type="text" class="form-control" placeholder="Ingrese una breve descripción" id="Descripcion" name="Descripcion" maxlength="300" required>      
                                </div>
                            </div>
                            <!--Segunda columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1"> 
                                    <label for="nombre-mascota">Nombre</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el nombre de su mascota" id="nombre-mascota" name="nombre-mascota" maxlength="24" required>
                                </div>
                                <div class="col-md-5 p-1"> 
                                    <label for="distintivo">Distintivo</label>
                                    <input type="text"  class="form-control" placeholder="Ingrese el distintivo de su mascota" id="distintivo" name="distintivo" maxlength="30" required>
                                </div>
                                <div class="col-md-2 p-1">
                                    <label for="edad-mascota">Edad</label>
                                    <input type="number" name="edad-mascota" class="form-control" id="edad-mascota" min="1" max="20" placeholder="En años" required>
                                </div>
                            </div>
                            <!--Tercera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="">Tamaño</label>
                                    <select name= "tamanio" class="form-select" id="Tamaño" aria-label="Floating label select example" required>
                                        <option value="" disabled selected>Seleccione una opción</option>
                                        <option value="Pequeño">Pequeño</option>
                                        <option value="Mediano">Mediano</option>
                                        <option value="Grande">Grande</option>
                                    </select> 
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="">Especie</label>
                                    <select class="form-select" name="Especie" id="Especies" aria-label="Floating label select example" required>
                                        <option value="" disabled selected>Seleccione una opción</option>
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
                            <!--Cuarta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="">Raza</label>
                                    <select name="Raza" class="form-select" id="Razas" aria-label="Floating label select example" required>
                                    <option value="">Ingrese raza de la mascota</option>
                                  </select>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="otra raza"> Si colocó otra raza,  escribala aquí</label>
                                    <input type="text" name="otra-raza" class="form-control"  id="otra-raza" placeholder="Indique el tipo de raza" idplaceholder="Otra raza" maxlength="30" disabled>
                                </div>
                            </div>
                            <!--Sexta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">                         
                                    <label for="Descripcion-mascota">Descripción adicional</label>
                                    <input type="text" class="form-control" placeholder="Ingrese la descripción de su mascota" id="Descripcion-mascota" name="descripcion-adicional" maxlength="300" required>
                                </div>
                            </div>
                            <!--Septima columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="Direccion-perdida">Lugar de pérdida</label>
                                    <input type="text" class="form-control" placeholder="Ingrese la dirección o lugar de perdida" maxlength="100" id="Direccion" name="Direccion-perdida" required>
                               </div>
                               <div class="col-md-3 p-1">
                                    <label for="fechaPerdida">Fecha de perdida</label><br>
                                    <input type="date"  class="form-control" id="fechaPerdida" name="fechaPerdida" required> 
                                </div>
                               <div class="col-md-3 p-1">
                                    <label for="hora-perdida">Hora de perdida</label>
                                    <input type="time" class="form-control" id="hora-perdida" name="hora-perdida" required>
                                </div>
                            </div>
                            <!--Octava columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-8 p-1"> 
                                    <label for="nombre-contacto">Nombre de contacto</label>
                                    <input type="text" class="form-control" placeholder="Ingrese su nombre completo para contactarlo" id="nombre-contacto" name="nombre-contacto" maxlength="70" required>
                                </div>
                                <div class="col-md-4 p-1">
                                    <label for="celular-contacto">Teléfono de contacto</label>
                                    <input type="number" class="form-control" id="celular-contacto" placeholder="Ingrese un número de celular" name="telefono-contacto" required>
                                </div>
                            </div>
                            <!--Novena columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5  p-1 justify-content-center">
                                    <label for="formFile" class="form-label">Adjunte una foto de su mascota (PNG)</label>
                                    <input class="form-control" type="file" id="formFile" accept=".png" required>
                                    <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                                </div>
                                <div class="col-md-4 p-1 ">
                                    <label for="recompensa"><b>Desea añadir una recompensa?</b></label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center" style="margin-top: 10px;">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="recompensa" id="flexRadioDefault1" value="si">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="recompensa" id="flexRadioDefault2" value="no" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                            </label>
                                        </div>
                                     </div>
                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="monto-recompensa">Indique el monto</label>
                                    <input type="number" class="form-control" style="margin-top: 5px;" id="monto-recompensa" min="50" max="800" placeholder="Ingrese un número" required disabled>
                                </div>
                                
                            </div>
                            <br>
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

        <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script>
            const nombreMascotaInput = document.getElementById('nombre-mascota');
            const select1 = document.getElementById('Especies');
            const select2 = document.getElementById('Razas');
            const otraRazaInput = document.getElementById('otra-raza');
            const recompensaInput =  document.querySelectorAll('input[name="recompensa"]');
            const montoRecompensaInput = document.getElementById('monto-recompensa');
            const nombreContactoInput = document.getElementById('nombre-contacto');
            const celularContactoInput = document.getElementById('celular-contacto');
            const fechaPerdidaInput = document.getElementById('fechaPerdida');

            // Validar que solo se ingresen letras
            nombreMascotaInput.addEventListener('input', function() {
                this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
            });

            //Descripcion de la mascota//
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
                otraRazaInput.disabled = true; // Deshabilitar el campo de otra raza
                otraRazaInput.value = ''; // Limpiar el campo

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
            // Validar que solo se ingresen letras
            otraRazaInput.addEventListener('input', function() {
                this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
            });

            //Recompensa ofrecida//
            recompensaInput.forEach(radio => {
                radio.addEventListener('change', function() {
                    if (this.value === 'si') {
                        montoRecompensaInput.disabled = false; // Habilitar el campo
                    } else {
                        montoRecompensaInput.disabled = true; // Deshabilitar el campo
                        montoRecompensaInput.value = ''; // Limpiar el campo si se deshabilita
                    }
                });
            });
            //Validación de cifras de recompensa//  
            montoRecompensaInput.addEventListener('input', function() {
                const value = montoRecompensaInput.value;

                // Cifras menores a 1 digito
                if (value.length > 3) {
                    montoRecompensaInput.value = value.slice(0, 3); // Limitar a 3 cifras
                }

                // Asegúrate de que el valor esté dentro del rango permitido
                if (parseInt(value) < 50 || parseInt(value) > 800) {
                    montoRecompensaInput.setCustomValidity('El monto debe estar entre 50 y 800.');
                    montoRecompensaInput.reportValidity(); // Muestra el mensaje de error
                } else {
                    montoRecompensaInput.setCustomValidity(''); // Restablecer el mensaje de error
                }
             });

            // Validar que solo se ingresen letras
            nombreContactoInput.addEventListener('input', function() {
                this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
            });

            //Validar longitud de numero telefonico//
            celularContactoInput.addEventListener('input', function() {
                // Convertir el valor a string para verificar la longitud
                const value = celularContactoInput.value;

                // Validar que no se exceda la longitud de 2 cifras
                if (value.length > 9) {
                    celularContactoInput.value = value.slice(0, 9); // Limitar a dos cifras
                }

                // Validar que la primera cifra sea un "9"
                if (value.length > 0 && value[0] !== '9') {
                    celularContactoInput.value = ''; // Limpiar el campo si la primera cifra no es "9"
                }
            });

            // Deshabilitar la entrada manual de texto
            fechaPerdidaInput.addEventListener('keydown', function(event) {
                event.preventDefault();
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
                    input.value = ''; // Resetea el input
                    return;
                }
            });
        </script>
</body>
</html>
            