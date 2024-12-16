<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="albergue" scope="request" type="com.example.iwebproyecto.beans.Albergue"/>
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
    <title>Envío a temporal</title>
    <style>
        
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/ 
        
        
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
                <div class="welcome-text">Hola, <%=albergue.getNombreAlbergue()%></div>
            </div>
            <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/PortalAdopciones" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/eventos" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/DonacionSuministros" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/HogaresTemporalesAlbergue" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/SolicitudesDeAdopcion" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/DenunciasDeMaltrato" title="Denuncias de maltrato"><i class="fi-rr-siren-on"></i></a></li>
                    <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
            </div>

            <div id="menu" class="menu">
                <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
                <a href="<%=request.getContextPath()%>/PortalAdopciones">Portal de Adopciones</a>
                <a href="<%=request.getContextPath()%>/eventos">Mis Eventos Benéficos</a>
                <a href="<%=request.getContextPath()%>/DonacionSuministros">Mis Eventos de Donación</a>
                <a href="<%=request.getContextPath()%>/HogaresTemporalesAlbergue">Hogares Temporales</a>
                <a href="<%=request.getContextPath()%>/SolicitudesDeAdopcion">Solicitudes de Adopción</a>
                <a href="<%=request.getContextPath()%>/DenunciasDeMaltrato">Denuncias de maltrato</a>
                <!--<a href="#">Solicitudes de Adopción</a>-->
                <hr>
                <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>
            </div>
            <div class="container-fluid d-flex" id="contenido-principal">
                <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <div class="container md-8  d-flex justify-content-center" style="width: 85%; margin-bottom: 20px; padding: 0;">
                        <a href="<%=request.getContextPath()%>/HogaresTemporalesAlbergue"><button type="button" class="btn btn-personal2">Regresar</button></a>
                    </div>
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm" style="padding:10px" method="POST" ACTION="<%=request.getContextPath()%>/HogaresTemporalesAlbergue?action=send">
                            <input type="hidden" name="idUser" value="<%=request.getParameter("id")%>">
                            <h1 style="margin-top: 10px;" class="text-center">Complete los datos de la mascota a enviar</h1>
                            <div class="row justify-content-center p-1">
                                
                                <div class="col-md-6 p-1">
                                    <label for="nombreMascota">Nombre</label>
                                    <input name="nombreMascota" type="text" id="nombreMascota" class="form-control" placeholder="Ingrese el nombreMascota de la mascota" required>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="Especies">Especie</label>
                                    <select class="form-select" id="Especies" name="especie" aria-label="Floating label select example" required>
                                        <option selected value="">Seleccione la especie de la Mascota</option> vv
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
                                    <select name="raza" class="form-select" id="Razas" aria-label="Floating label select example" required>
                                    <option value="">Ingrese raza de la mascota</option>
                                  </select>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="otraRaza"> Si colocó otra raza,  escribala aquí
                                    </label>
                                    <input name="otraRaza" type="text" class="form-control"  id="otraRaza"  idplaceholder="Otra raza" disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="tamaño">Tamaño (en cm)</label>
                                    <input name="tamanio" type="number" class="form-control" id="tamaño" placeholder="Ingrese el tamaño de la mascota" required>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="peso">Peso (en kg)</label>
                                    <input name="peso" type="number" class="form-control" id="peso" placeholder="Ingrese el peso de la mascota" required>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-7 p-1">
                                    <label for="edad">Edad Aproximada</label>
                                    <input name="edad" type="number" class="form-control" id="edad" placeholder="Ingrese edad" required>
                                </div>
                                <div class="col-md-5 p-1 ">
                                    <label>Sexo de la mascota</label>
                                    <div class="col-md-12 d-flex justify-content-around align-self-center">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="Macho">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                            Macho
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked value="Hembra">
                                            <label class="form-check-label" for="flexRadioDefault2">
                                            Hembra
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="discapacidad">Posee alguna discapacidad?</label>
                                    <select name="posee" class="form-select" id="discapacidad" aria-label="Floating label select example" required onchange="toggleDiscapacidad()">
                                        <option value="">Ingrese su respuesta</option>
                                        <option value="si">Sí</option>
                                        <option value="no">No</option>
                                    </select>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="tipo_discapacidad">Describa la discapacidad (max. 100 caracteres)</label>
                                    <input name="discapacidad" type="text" class="form-control" id="tipo_discapacidad" maxlength="100" disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 justify-content-center">
                                    <label for="formFile" class="form-label">Subir una foto de la mascota (PNG)</label>
                                    <input class="form-control" type="file" id="formFile" accept=".png">
                                </div>
                                <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>

                            </div> 

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
    </script>

<script>
    function toggleDiscapacidad() {
        const select = document.getElementById('discapacidad');
        const input = document.getElementById('tipo_discapacidad');

        // Habilitar o deshabilitar el campo de entrada basado en la selección
        if (select.value === 'si') {
            input.disabled = false;
        } else {
            input.disabled = true;
            input.value = ''; // Limpiar el campo si se deshabilita
        }
    }
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
    })

</script>
    
<script>
    //Limita la cant digitos de números
    const numeroInput2 = document.getElementById('tamaño')
    numeroInput2.addEventListener('input', function(){
        if(this.value.length > 3){
            this.value = this.value.slice(0,3);
        }
    })

</script>

<script>
    //Limita la cant digitos de números
    const numeroInput3 = document.getElementById('peso')
    numeroInput3.addEventListener('input', function(){
        if(this.value.length > 2){
            this.value = this.value.slice(0,2);
        }
    })

</script>
    
</body>
</html>