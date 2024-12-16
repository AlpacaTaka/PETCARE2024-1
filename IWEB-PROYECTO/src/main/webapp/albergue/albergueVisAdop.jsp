<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--int albergueID = 6; /*(int) request.getAttribute("idAlbergue");*/--%>
<jsp:useBean id="albergue" scope="request" type="com.example.iwebproyecto.beans.Albergue"/>
<jsp:useBean id="mascota" scope="request" type="com.example.iwebproyecto.beans.MascotasAdopcion"/>
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
    <title>Vista Formulario de Adopción</title>
    <style>

        /* Esto es solo de referencia para ver su espacio disponible - borrar*/
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
                    <a href="<%=request.getContextPath()%>/PortalAdopciones"><button type="button" class="btn btn-personal2">Regresar</button></a>
                </div>
                <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                    <form id="uploadForm" style="padding:10px" method="POST" action="<%=request.getContextPath()%>/PortalAdopciones?action=edit">
                        <input type="hidden" name="id" value="<%=mascota.getIdAdopcion()%>">
                        <input type="hidden" name="idA" value="<%=albergue.getAlbergueID()%>">
                        <h1 style="margin-top: 10px;" class="text-center">Edición de perfil de Mascota para Adopción</h1>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="nombreMascota">Nombre</label>
                                <input id="nombreMascota" name="nombreMascota" value="<%=mascota.getNombreMascota()%>" type="text" class="form-control" maxlength="21" disabled>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="Especies">Especie</label>
                                <select class="form-select" id="Especies" name="especie" aria-label="Floating label select example" disabled>
                                    <option value="" <%String especie="";%>>Seleccione la especie de la Mascota</option>
                                    <option value="Perro" <%especie= mascota.getEspecie().equals("Perro") ? "selected" : "";%><%=especie%>>Perro</option>
                                    <option value="Gato" <%especie= mascota.getEspecie().equals("Gato") ? "selected" : "";%><%=especie%>>Gato</option>
                                    <option value="Ave" <%especie= mascota.getEspecie().equals("Ave") ? "selected" : "";%><%=especie%>>Ave</option>
                                    <option value="Hamster" <%especie= mascota.getEspecie().equals("Hamster") ? "selected" : "";%><%=especie%>>Hamster</option>
                                    <option value="Conejo" <%especie= mascota.getEspecie().equals("Conejo") ? "selected" : "";%><%=especie%>>Conejo</option>
                                    <option value="Tortuga" <%especie= mascota.getEspecie().equals("Tortuga") ? "selected" : "";%><%=especie%>>Tortuga</option>
                                    <option value="Huron" <%especie= mascota.getEspecie().equals("Huron") ? "selected" : "";%><%=especie%>>Hurón</option>
                                    <option value="Chinchilla" <%especie= mascota.getEspecie().equals("Chinchilla") ? "selected" : "";%><%=especie%>>Chinchilla</option>
                                    <option value="MiniPig" <%especie= mascota.getEspecie().equals("Minipig") ? "selected" : "";%><%=especie%>>MiniPig</option>
                                </select>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="Razas">Raza</label>
                                <select class="form-select" id="Razas" name="raza" aria-label="Floating label select example" disabled>
                                    <option value="<%=mascota.getRaza()%>"> <%=mascota.getRaza()%></option>
                                </select>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="otra-raza"> Si colocó otra raza,  escribala aquí
                                </label>
                                <input type="text" class="form-control" name="otraRaza" id="otra-raza"  placeholder="<%--Otra raza--%>" disabled>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-4 p-1" >
                                <label for="distrito">Distrito</label>
                                <select class="form-select" name="idDistrito" id="distrito" disabled>
                                    <option value="">Selecciona un distrito</option>
                                    <optgroup label="Lima Norte">
                                        <option value="1" <%String distritoID= mascota.getDistrito().getDistritoID() == 1 ? "selected" : null;%><%=distritoID%>>Ancon</option>
                                        <option value="2" <%distritoID= mascota.getDistrito().getDistritoID() == 2 ? "selected" : null;%><%=distritoID%>>Santa Rosa</option>
                                        <option value="3" <%distritoID= mascota.getDistrito().getDistritoID() == 3 ? "selected" : null;%><%=distritoID%>>Carabayllo</option>
                                        <option value="4" <%distritoID= mascota.getDistrito().getDistritoID() == 4 ? "selected" : null;%><%=distritoID%>>Puente Piedra</option>
                                        <option value="5" <%distritoID= mascota.getDistrito().getDistritoID() == 5 ? "selected" : null;%><%=distritoID%>>Comas</option>
                                        <option value="6" <%distritoID= mascota.getDistrito().getDistritoID() == 6 ? "selected" : null;%><%=distritoID%>>Los Olivos</option>
                                        <option value="7" <%distritoID= mascota.getDistrito().getDistritoID() == 7 ? "selected" : null;%><%=distritoID%>>San Martín de Porres</option>
                                        <option value="8" <%distritoID= mascota.getDistrito().getDistritoID() == 8 ? "selected" : null;%><%=distritoID%>>Independencia</option>
                                    </optgroup>
                                    <optgroup label="Lima Sur">
                                        <option value="9" <%distritoID= mascota.getDistrito().getDistritoID() == 9 ? "selected" : null;%><%=distritoID%>>San Juan de Miraflores</option>
                                        <option value="10" <%distritoID= mascota.getDistrito().getDistritoID() == 10 ? "selected" : null;%><%=distritoID%>>Villa María del Triunfo</option>
                                        <option value="11" <%distritoID= mascota.getDistrito().getDistritoID() == 11 ? "selected" : null;%><%=distritoID%>>Villa el Salvador</option>
                                        <option value="12" <%distritoID= mascota.getDistrito().getDistritoID() == 12 ? "selected" : null;%><%=distritoID%>>Pachacamac</option>
                                        <option value="13" <%distritoID= mascota.getDistrito().getDistritoID() == 13 ? "selected" : null;%><%=distritoID%>>Lurín</option>
                                        <option value="14" <%distritoID= mascota.getDistrito().getDistritoID() == 14 ? "selected" : null;%><%=distritoID%>>Punta Hermosa</option>
                                        <option value="15" <%distritoID= mascota.getDistrito().getDistritoID() == 15 ? "selected" : null;%><%=distritoID%>>Punta Negra</option>
                                        <option value="16" <%distritoID= mascota.getDistrito().getDistritoID() == 16 ? "selected" : null;%><%=distritoID%>>San Bartolo</option>
                                        <option value="17" <%distritoID= mascota.getDistrito().getDistritoID() == 17 ? "selected" : null;%><%=distritoID%>>Santa María del Mar</option>
                                        <option value="18" <%distritoID= mascota.getDistrito().getDistritoID() == 18 ? "selected" : null;%><%=distritoID%>>Pucusana</option>
                                    </optgroup>
                                    <optgroup label="Lima Este">
                                        <option value="19" <%distritoID= mascota.getDistrito().getDistritoID() == 19 ? "selected" : null;%><%=distritoID%>>San Juan de Lurigancho</option>
                                        <option value="20" <%distritoID= mascota.getDistrito().getDistritoID() == 20 ? "selected" : null;%><%=distritoID%>>Lurigancho/Chosica</option>
                                        <option value="21" <%distritoID= mascota.getDistrito().getDistritoID() == 21 ? "selected" : null;%><%=distritoID%>>Ate</option>
                                        <option value="22" <%distritoID= mascota.getDistrito().getDistritoID() == 22 ? "selected" : null;%><%=distritoID%>>El Agustino</option>
                                        <option value="23" <%distritoID= mascota.getDistrito().getDistritoID() == 23 ? "selected" : null;%><%=distritoID%>>Santa Anita</option>
                                        <option value="24" <%distritoID= mascota.getDistrito().getDistritoID() == 24 ? "selected" : null;%><%=distritoID%>>La Molina</option>
                                        <option value="25" <%distritoID= mascota.getDistrito().getDistritoID() == 25 ? "selected" : null;%><%=distritoID%>>Cieneguilla</option>
                                    </optgroup>
                                    <optgroup label="Lima Oeste">
                                        <option value="26" <%distritoID= mascota.getDistrito().getDistritoID() == 26 ? "selected" : null;%><%=distritoID%>>Rimac</option>
                                        <option value="27" <%distritoID= mascota.getDistrito().getDistritoID() == 27 ? "selected" : null;%><%=distritoID%>>Cercado de Lima</option>
                                        <option value="28" <%distritoID= mascota.getDistrito().getDistritoID() == 28 ? "selected" : null;%><%=distritoID%>>Breña</option>
                                        <option value="29" <%distritoID= mascota.getDistrito().getDistritoID() == 29 ? "selected" : null;%><%=distritoID%>>Pueblo Libre</option>
                                        <option value="30" <%distritoID= mascota.getDistrito().getDistritoID() == 30 ? "selected" : null;%><%=distritoID%>>Magdalena</option>
                                        <option value="31" <%distritoID= mascota.getDistrito().getDistritoID() == 31 ? "selected" : null;%><%=distritoID%>>Jesus María</option>
                                        <option value="32" <%distritoID= mascota.getDistrito().getDistritoID() == 32 ? "selected" : null;%><%=distritoID%>>La Victoria</option>
                                        <option value="33" <%distritoID= mascota.getDistrito().getDistritoID() == 33 ? "selected" : null;%><%=distritoID%>>Lince</option>
                                        <option value="34" <%distritoID= mascota.getDistrito().getDistritoID() == 34 ? "selected" : null;%><%=distritoID%>>San Isidro</option>
                                        <option value="35" <%distritoID= mascota.getDistrito().getDistritoID() == 35 ? "selected" : null;%><%=distritoID%>>San Miguel</option>
                                        <option value="36" <%distritoID= mascota.getDistrito().getDistritoID() == 36 ? "selected" : null;%><%=distritoID%>>San Borja</option>
                                        <option value="37" <%distritoID= mascota.getDistrito().getDistritoID() == 37 ? "selected" : null;%><%=distritoID%>>Surquillo</option>
                                        <option value="38" <%distritoID= mascota.getDistrito().getDistritoID() == 38 ? "selected" : null;%><%=distritoID%>>Santiago de Surco</option>
                                        <option value="39" <%distritoID= mascota.getDistrito().getDistritoID() == 39 ? "selected" : null;%><%=distritoID%>>Barranco</option>
                                        <option value="40" <%distritoID= mascota.getDistrito().getDistritoID() == 40 ? "selected" : null;%><%=distritoID%>>Chorrillos</option>
                                        <option value="41" <%distritoID= mascota.getDistrito().getDistritoID() == 41 ? "selected" : null;%><%=distritoID%>>San Luis</option>
                                        <option value="42" <%distritoID= mascota.getDistrito().getDistritoID() == 42 ? "selected" : null;%><%=distritoID%>>Miraflores</option>
                                    </optgroup>
                                </select>
                            </div>
                            <div class="col-md-8 p-1">
                                <label for="Direccion">Dirección o referencia de Hallazgo</label>
                                <input type="text" value="<%=mascota.getDireccionHallazgo()%>" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="direccionHallazgo" disabled>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-7 p-1">
                                <label for="edad">Edad Aproximada</label>
                                <input type="number" value="<%=mascota.getEdadAprox()%>" class="form-control" id="edad" name="edad" placeholder="Ingrese edad" disabled>
                            </div>
                            <div class="col-md-5 p-1 ">
                                <label><strong>Sexo de la Mascota</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault1" <%String sexo= mascota.getSexo().equals("Macho") ? "checked" : "";%><%=sexo%> value="Macho" disabled>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            Macho
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="sexoMascota" id="flexRadioDefault2" <%sexo= mascota.getSexo().equals("Hembra") ? "checked" : "";%><%=sexo%> value="Hembra" disabled>
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
                                <textarea name="breveDescripcion" id="breve" class="form-control" placeholder="Ingrese una breve descripcion de la mascota" maxlength="300" disabled><%=mascota.getDescripcionGeneral()%></textarea>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <%--<div class="col-md-12 p-1 justify-content-center">
                                <label for="formFile" class="form-label">Subir una foto de la mascota (PNG)</label>
                                <input class="form-control" type="file" id="formFile" accept=".png" required>
                            </div>
                            <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                            --%>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-5 p-1 ">
                                <label><strong>¿Se encuentra en un hogar temporal?</strong></label>
                                <div style="margin-top: 5px;" class="col-md-12 d-flex justify-content-around align-self-center">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault3" <%String isTemporal= mascota.isSeEncuentraTemporal() ? "checked" : "";%><%=isTemporal%> value="true" disabled>
                                        <label class="form-check-label" for="flexRadioDefault3">
                                            Si
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="hogarTemp" id="flexRadioDefault4" <%isTemporal= !mascota.isSeEncuentraTemporal() ? "checked" : "";%><%=isTemporal%> value="false" disabled>
                                        <label class="form-check-label" for="flexRadioDefault4">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 p-1">
                                <label for="condiciones">Condiciones de adopción</label>
                                <input type="text" id="condiciones" value="<%=mascota.getCondicionesAdopcion()%>" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" name="condiciones" disabled>
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
            fileError.style.display = 'none'; // Oculta el mensaje de error si está todo bien
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
        this.value = this.value.replace(/[^a-zA-Záéíóú\s]/g, '');
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