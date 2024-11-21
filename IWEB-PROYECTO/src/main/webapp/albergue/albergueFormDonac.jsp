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
    <title>Formulario de donación</title>
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
            <div class="welcome-text">Hola, Patitas Felices</div>
        </div>
        <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/PortalAdopciones" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                <li><a href="albergue/eventTable.jsp" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/DonacionSuministros" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                <li><a href="albergue/contactarTemporal.jsp" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                <li><a href="albergue/solicitudesAdopcion.jsp" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                <li><a href="albergue/verDenunciasMaltrato.jsp" title="Denuncias de maltrato"><i class="fi-rr-siren-on"></i></a></li>
                <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                <li id="cerrar-sesion"><a href="/login/login.jsp" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>
        </div>

        <div id="menu" class="menu">
            <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
            <a href="<%=request.getContextPath()%>/PortalAdopciones">Portal de Adopciones</a>
            <a href="albergue/eventTable.jsp">Mis Eventos Benéficos</a>
            <a href="<%=request.getContextPath()%>/DonacionSuministros">Mis Eventos de Donación</a>
            <a href="albergue/contactarTemporal.jsp">Hogares Temporales</a>
            <a href="albergue/solicitudesAdopcion.jsp">Solicitudes de Adopción</a>
            <a href="albergue/verDenunciasMaltrato.jsp">Denuncias de maltrato</a>
            <!--<a href="#">Solicitudes de Adopción</a>-->
            <hr>
            <a href="/login/login.html">Cerrar Sesión</a>
        </div>


        <div class="container-fluid d-flex" id="contenido-principal">



            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container md-8  d-flex justify-content-center" style="width: 85%; margin-bottom: 20px; padding: 0;">
                    <a href="donationTable.html"><button type="button" class="btn btn-personal2">Regresar</button></a>
                </div>
                <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                    <form id="uploadForm" style="padding:10px" >
                        <h1 style="margin-top: 10px;" class="text-center">Creación de Avisos de Donación</h1>
                        <div class="row justify-content-center p-1">

                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="titulo_donacion">Nombre del evento de donación</label>
                                    <input type="text" class="form-control" id="titulo_donacion" placeholder="Ingrese el número de contacto"  maxlength="50" required>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="correo">Correo Electrónico del albergue</label>
                                    <input type="email" class="form-control" id="correo" placeholder="Ingrese su correo electrónico" required>
                                    <span id="errorMessage" style="color: red; display: none;">Error: correo inválido.</span>
                                </div>
                            </div>

                            <div class="col-md-6 p-1">
                                <label for="tipo_donacion">Tipo de Suministro</label>
                                <select class="form-select" id="tipo_donacion" aria-label="Floating label select example" required onchange="toggleInput()">
                                    <option selected value="">Seleccione el tipo de donación necesitada</option>
                                    <option value="Alimenticios">Alimenticios</option>
                                    <option value="Higiene">Higiene</option>
                                    <option value="Confort">Confort</option>
                                    <option value="Medica">Médica</option>
                                </select>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="otra-donacion">Especifique el nombre del suministro</label>
                                <input type="text" class="form-control" id="otra-donacion" maxlength="50" required disabled>
                            </div>

                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="cant_donacion">Cantidad de donaciones</label>
                                <input type="number" class="form-control" id="cant_donacion" oninput="validarNumero()" placeholder="Ingrese la cantidad requerida" required>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="marca_donacion">Especifique la marca (opcional)</label>
                                <input type="text" class="form-control" id="marca_donacion" placeholder="Ingrese la marca o marcas (use comas)">
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
                                <label for="Direccion">Dirección de recepción</label>
                                <input type="text" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="Direccion">
                            </div>
                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="fecha_inicio_donacion">Fecha inicio</label>
                                <input type="date" class="form-control" id="fecha_inicio_donacion" required>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="fecha_fin_donacion">Fecha fin</label>
                                <input type="date" class="form-control" id="fecha_fin_donacion" required>
                            </div>
                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="inicio">Hora Inicio</label>
                                <input type="time" class="form-control" id="inicio" placeholder="Ingrese la hora de inicio" required onchange="validarHoras()">
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="fin">Hora Fin</label>
                                <input type="time" class="form-control" id="fin" placeholder="Ingrese la hora de fin" required onchange="validarHoras()">
                            </div>
                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-6 p-1">
                                <label for="nombre_contacto">Nombre de contacto del albergue</label>
                                <input type="text" class="form-control" id="nombre_contacto" placeholder="Ingrese el nombre de la persona" maxlength="80" required>
                            </div>
                            <div class="col-md-6 p-1">
                                <label for="num_contacto">Número de contacto para la donación</label>
                                <input type="number" class="form-control" id="num_contacto" oninput="validarNumero()" placeholder="Ingrese el número de contacto" required>
                            </div>
                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1">
                                <label for="mensaje"> Breve Mensaje a los Donantes (200 caracteres maximo)</label>
                                <textarea name="" id="mensaje" maxlength="200" class="form-control" placeholder="Ingrese un mensaje para los donantes"></textarea>
                            </div>
                        </div>
                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1 justify-content-center">
                                <label for="formFile" class="form-label">Subir una foto de la donacion solicitada (PNG)</label>
                                <input class="form-control" type="file" id="formFile" accept=".png" required>
                            </div>
                            <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>

                        </div>

                        <div class="row justify-content-center p-1">
                            <div class="col-md-12 p-1 d-flex justify-content-center">
                                <a href="donationTable.html"><button type="submit" class="btn btn-personal">Crear</button></a>
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
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('formFile');
        const file = fileInput.files[0];
        const fileError = document.getElementById('fileError');

        // Verifica si el archivo tiene el tipo MIME de PNG
        if (file && file.type !== 'image/png') {
            event.preventDefault(); // Evita que el formulario se envíe
            fileError.style.display = 'block'; // Muestra el mensaje de error
        } else {
            fileError.style.display = 'none'; // Oculta el mensaje de error si está
        }
    });
</script>
<script>
    function toggleInput() {
        const tipoDonacion = document.getElementById("tipo_donacion").value;
        const otraDonacionInput = document.getElementById("otra-donacion");

        // Habilita el campo solo si se ha seleccionado alguna opción distinta al valor por defecto
        if (tipoDonacion) {
            otraDonacionInput.disabled = false;
        } else {
            otraDonacionInput.disabled = true;
            otraDonacionInput.value = ""; // Limpia el campo si no hay selección
        }
    }
</script>

<script>
    function toggleInputs() {
        const tipoDonacion = document.getElementById("tipo_donacion").value;
        const otraDonacionInput = document.getElementById("otra-donacion");

        if (tipoDonacion === "otra") {
            otraDonacionInput.disabled = false;
        } else {
            otraDonacionInput.disabled = true;
            otraDonacionInput.value = ""; // Limpia el campo si no es "Otra"
        }
    }
</script>

<script>
    const nombreDonacionInput = document.getElementById('titulo_donacion');
    const marcaDonacionInput =document.getElementById('marca_donacion');
    const nombreContactoInput = document.getElementById('nombre_contacto');
    const cantDonacionInput = document.getElementById('cant_donacion');

    // Validar que solo se ingresen letras
    nombreDonacionInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que solo se ingresen letras
    nombreContactoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que solo se ingresen letras
    marcaDonacionInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    //Limita la cant digitos de números
    cantDonacionInput.addEventListener('input', function(){
        if(this.value.length > 4){
            this.value = this.value.slice(0,3);
        }

        // Validar el rango
        const numValue = Number(cantDonacionInput.value);
        if (numValue < 1 || numValue > 999) {
            cantDonacionInput.setCustomValidity('El número debe estar entre 1 y 999.');
        } else {
            cantDonacionInput.setCustomValidity(''); // Restablecer el mensaje de error
        }
    })

</script>
<script>
    const correoAlbergueInput = document.getElementById('correo');

    //Validar correo electronico//
    correoAlbergueInput.addEventListener('input', function() {
        const value = correoAlbergueInput.value;
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

<script>

    //Validar fechas de evento donacion//
    const fechaInicioInput = document.getElementById('fecha_inicio_donacion');
    const fechaFinInput = document.getElementById('fecha_fin_donacion');

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


    function validarHoras() {
        const inicio = document.getElementById('inicio').value;
        const fin = document.getElementById('fin').value;

        // Verificar si ambos campos tienen valores
        if (inicio && fin) {
            if (inicio > fin) {
                alert('La hora de inicio no puede ser posterior a la hora de fin.');
                document.getElementById('inicio').value = ''; // Limpiar el campo de inicio
                document.getElementById('fin').value = ''; // Limpiar el campo de fin
            }
        }
    }
</script>

<script>
    function validarNumero() {
        const input = document.getElementById('num_contacto');
        let valor = input.value;

        // Limitar a un máximo de 9 caracteres
        if (valor.length > 9) {
            valor = valor.slice(0, 9);
        }

        // Verificar que el primer carácter sea 9
        if (valor.length > 0 && valor[0] !== '9') {
            input.value = ''; // Reiniciar el campo si no comienza con 9
            return;
        }

        // Verificar que el número tiene exactamente 9 dígitos
        if (valor.length === 9 && /^\d+$/.test(valor)) {
            // Si es válido, no hacer nada
        } else if (valor.length === 9) {
            input.value = ''; // Reiniciar si tiene 9 dígitos pero no es válido
        }

        // Asignar el valor limitado al input
        input.value = valor;
    }
</script>
<script>
    const nombreAlbInput = document.getElementById('otra-donacion');

    // Validar que solo se ingresen letras en Nombre albergue
    nombreAlbInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
</script>

</body>
</html>