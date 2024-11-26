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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/inicio.css">

    <title>Reportar Maltrato</title>

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
                    <li><a href="/user/reportarMaltrato.html" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
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
                <a href="/user/reportarMaltrato.html" >Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                <!--Boton de regreso a la página principal-->
                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='inicio.jsp'">  Regresar   </button>
                    </div>
                    <div class="container md-12" style="width: 85%;max-width: 800px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 20px; padding: 10px 20px;">
                        <h1 style="margin-top: 10px; color: #4d0e0e; font-style: italic" class="text-center" >Generar una denuncia de maltrato</h1>
                        <p style="margin: 5px 20px" class="text-center">Recuerde que el bienestar de una mascota es esencial para nosotros y al generar una denunciala 
                        persona indicada podría enfrentar un proceso penal, por lo cual, se pide que relleneeste formulario con la seriedad del caso.</p><br>
                    </div>
                    <!--Container del formulario-->
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form action="${pageContext.request.contextPath}/ReportarMaltratoServlet" method="post" enctype="multipart/form-data" id="uploadForm" style="padding:10px" >


                        <h1 style="margin-top: 10px;" class="text-center">Formulario denuncia maltrato</h1>
                            <br>
                            <!--Primera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="Tamanio">tamanio</label>
                                    <select class="form-select" name= "tamanio" id="Tamanio" aria-label="Floating label select example" required>
                                        <option value="" disabled selected>Seleccione una opción</option>
                                        <option value="Pequenio">Pequeño</option>
                                        <option value="Mediano">Mediano</option>
                                        <option value="Grande">Grande</option>
                                    </select> 
                                </div>
                                <div class="col-md-6 p-1">
                                    <label>Especie</label>
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
                            <!--Segunda columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label>Raza</label>
                                    <select class="form-select" name="Raza" id="Razas" aria-label="Floating label select example" required>
                                    <option value="">Ingrese raza de la mascota</option>
                                  </select>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label> Si colocó otra raza,  escribala aquí</label>
                                    <input type="text" class="form-control" name="otra-raza"  id="otra-raza" placeholder="Indique el tipo de raza" idplaceholder="Otra raza" maxlength="30" disabled>
                                </div>
                            </div>
                            <!--Tercera columna de selección-->
                            <div class="row justify-content-center p-1">
                                 <div class="col-md-6 p-1">
                                    <label for="tipo-maltrato">Tipo de maltrato</label>
                                    <select class="form-select" id="tipo-maltrato" name="tipo-maltrato" aria-label="Floating label select example" required>
                                        <option value="" disabled selected>Seleccione una opción</option>
                                        <option value="Abandono">Situación de abandono</option>
                                        <option value="Violencia">Violencia</option>
                                        <option value="Otro">Otro</option>
                                      </select>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="otro-maltrato">Si seleccionó "Otro", especifíquelo aquí</label>
                                    <input type="text" class="form-control" id="otro-maltrato" name="otro-maltrato" placeholder="Especifique el tipo de maltrato" maxlength="50" disabled>
                                </div> 
                            </div>
                             <!--Cuarta columna de selección (1 columna)-->  
                             <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="Nombre-maltratador">Nombres y apellidos del maltratador</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el nombreMascota completo de la persona" id="Nombre-maltratador" name="Nombre-maltratador" maxlength="70" required>
                                </div>
                             </div>
                             <!--Quints columna de selección (1 columna)-->
                             <div class="row justify-content-center p-1">   
                                <div class="col-md-12 p-1">
                                     <label for="Direccion">Dirección de la mascota</label>
                                     <input type="text" class="form-control" placeholder="Ingrese la dirección de la mascota" maxlength="100" id="Direccion" name="Direccion" required>
                                </div>
                             </div>
                             <!--Sexta columna de seleccion-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-8  p-1 justify-content-center">
                                    <label for="formFile" class="form-label">Adjunte una foto de la mascota (PNG)</label>
                                    <input class="form-control" type="file" id="formFile" accept=".png" required name="imagen">
                                    <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                                </div>
                                
                                <div class="col-md-4 p-1 ">
                                    <label>Realizo una denuncia policial</label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" value="si" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Si
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" value="no" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            No
                                            </label>
                                        </div>
                                    </div>
                                </div> 
                            </div>



                            <p style="margin: 5px 20px; color:#4d0e0e;" class="text-center">Si esta seguro, pulse el botón para proceder con la denuncia.</p>
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


    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        const select1 = document.getElementById('Especies');
        const select2 = document.getElementById('Razas');
        const otraRazaInput = document.getElementById('otra-raza');
        const selectMaltrato = document.getElementById('tipo-maltrato');
        const otroMaltratoInput = document.getElementById('otro-maltrato');
        const nombreMaltratadorInput = document.getElementById('Nombre-maltratador');

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

        //Habilitar/deshabilitar el campo de texto de "otro maltrato"
        selectMaltrato.addEventListener('change', function() {
            if (this.value === 'Otro') { // Verificar si la opcion es otro
                otroMaltratoInput.disabled = false;
            } else {
                otroMaltratoInput.disabled = true;
                otroMaltratoInput.value = ''; // Limpiar el campo si se deshabilita
            }
        });
        // Validar que solo se ingresen letras
        otroMaltratoInput.addEventListener('input', function() {
            this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
        });
        //Nombre Maltratador//
        // Validar que solo se ingresen letras
        nombreMaltratadorInput.addEventListener('input', function() {
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
                input.value = ''; // Resetea el input
                return;
            }
        });
    </script>
    
</body>
</html>