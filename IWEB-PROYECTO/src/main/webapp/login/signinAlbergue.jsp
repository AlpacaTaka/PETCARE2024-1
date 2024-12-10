<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/Login/CSS/signin.css">

    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .form-control {
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px;

        }
        textarea {
            resize: vertical;
            font-family: Arial, sans-serif;
        }
        input{
            font-family: inherit;
        }

    </style>
</head>

<body background="/common/img/backgrounds/paw_bck.jpg" style="background-repeat: repeat; background-size: cover;">

<div class="container-button">
    <a href="/login/login.html">Regresar</a>
</div>

<div class="container" style="margin-bottom: 5px;">
    <div class="form-container">
        <h2>
            Postulación para albergue
        </h2>
        <p>Completa tus datos y espera a que un administrador los valide</p>
    </div>
</div>

<div class="container">
    <div class="form-container">
        <form id="uploadForm">
            <div class="form-group">
                <label for="nombre-login">
                    Nombres
                </label>
                <input placeholder="Ingrese sus nombres" type="text" id="nombre-login" maxlength="50" required/>
            </div>
            <div class="form-group">
                <label for="apellido-login">
                    Apellidos
                </label>
                <input  placeholder="Ingrese sus apellidos" type="text" id="apellido-login" maxlength="70" required/>
            </div>
            <div class="form-group" for="albergue-login">
                <label>
                    Nombre del albergue
                </label>
                <input placeholder="Ingrese su direccion" type="text" for="albergue-login" maxlength="80" required/>
            </div>
            <div class="form-group" for="email-login">
                <label>
                    Correo electrónico
                </label>
                <input placeholder="Inserte su dirección de correo electronico" type="email" id="email-login" required/>
            </div>

            <div class="form-group">
                <label for="formFile" class="form-label">Adjunte una foto de perfil</label>
                <input class="form-control" type="file" id="formFile" accept=".png" required>
                <div id="fileError" class="text-danger mt-2" style="display: none; color: red;">El archivo debe ser una imagen PNG.</div>
            </div>

            <div class="form-group">
                <label for="fecha">Fecha de creación del albergue</label>
                <input type="date" id="fecha" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="cant_animales">Cantidad de animales albergados</label>
                <input type="number" class="form-control" id="cant_animales" placeholder="Ingrese la cantidad de animales" required>
            </div>
            <div class="form-group">
                <label for="punto_acopio">Punto de acopio de donaciones</label>
                <input type="text" class="form-control" id="punto_acopio" maxlength="100" placeholder="Max. 100 caracteres" required>
            </div>
            <div class="form-group">
                <label for="capacidad">Capacidad para nuevos animales</label>
                <input type="number" class="form-control" id="capacidad" placeholder="Ingrese la capacidad" required>
            </div>
            <div class="form-group">
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
            <div class="form-group">
                <label for="Direccion">Dirección del albergue</label>
                <input type="text" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="Direccion">
            </div>
            <div class="form-group">
                <label for="nombre_contacto">Nombre del contacto para donaciones</label>
                <input type="text" class="form-control" id="nombre_contacto" placeholder="Ingrese el nombre completo" maxlength="80" required>
            </div>
            <div class="form-group">
                <label for="num_contacto">Número del contacto para donaciones</label>
                <input type="number" class="form-control" id="num_contacto" oninput="validarNumero()" placeholder="Ingrese el número de contacto" required>
            </div>
            <div class="form-group">
                <label for="breve_mensaje"> Breve mensaje sobre su albergue (este estará presente en avisos de donación o descripción suya en la página)</label>
                <textarea name="breve_mensaje" id="breve_mensaje" class="form-control" maxlength="1000" placeholder="Ingrese un mensaje breve (max. 300 caracteres)"></textarea>
            </div>
            <div class="form-group">
                <label for="link1">Ingrese dos links para sus redes sociales</label>
                <input type="url" class="form-control" id="link1" placeholder="Ingrese el primer link" maxlength="255" required>
                <p id="mensaje1" style="color: red;"></p>
            </div>
            <div class="form-group">
                <label for="link2"></label>
                <input type="url" class="form-control" id="link2" placeholder="Ingrese el segundo link" maxlength="255" required>
                <p id="mensaje2" style="color: red;"></p>
            </div>

            <div class="form-group">
                <label for="formFile2" class="form-label">Adjunte código qr YAPE</label>
                <input class="form-control" type="file" id="formFile2" accept=".png" required>
                <div id="fileError" class="text-danger mt-2" style="display: none; color: red;">El archivo debe ser una imagen PNG.</div>
            </div>

            <div class="form-group">
                <label for="formFile3" class="form-label">Adjunte código qr PLIN</label>
                <input class="form-control" type="file" id="formFile3" accept=".png" required>
                <div id="fileError" class="text-danger mt-2" style="display: none; color: red;">El archivo debe ser una imagen PNG.</div>
            </div>

            <div class="form-group">
                <button type="submit" class="button">
                    Enviar
                </button>
                </div-->
        </form>
        <!--div class="image-container"></div-->
    </div>
</div>
</body>
</html>

<script>
    const nombreInput = document.getElementById('nombre-login');
    const apellidoInput = document.getElementById('apellido-login');
    const albergueInput = document.getElementById('albergue-login');
    const dniInput = document.getElementById('dni-login');

    // Validar que solo se ingresen letras
    nombreInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que solo se ingresen letras
    apellidoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que solo se ingresen letras
    albergueInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras, espacios y números
    });

    //Validar longitud del DNI//
    dniInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = dniInput.value;

        // Validar que no se exceda la longitud de 8 cifras
        if (value.length > 8) {
            dniInput.value = value.slice(0, 8); // Limitar a dos cifras
        }

    });
</script>
<script>
    document.getElementById("formFile").addEventListener("change", function (event) {
        const fileInput = event.target;
        const file = fileInput.files[0];
        const fileError = document.getElementById("fileError");

        if (file && file.type !== "image/png") {
            fileError.style.display = "block";
            fileInput.value = ""; // Limpia el campo de archivo
        } else {
            fileError.style.display = "none";
        }
    });

    // Evita el envío del formulario si hay un error
    document.querySelector("form").addEventListener("submit", function (event) {
        const file = document.getElementById("formFile").files[0];
        if (file && file.type !== "image/png") {
            event.preventDefault(); // Evita el envío del formulario
            document.getElementById("fileError").style.display = "block";
        }
    });
</script>
<script>
    document.getElementById("formFile2").addEventListener("change", function (event) {
        const fileInput = event.target;
        const file = fileInput.files[0];
        const fileError = document.getElementById("fileError");

        if (file && file.type !== "image/png") {
            fileError.style.display = "block";
            fileInput.value = ""; // Limpia el campo de archivo
        } else {
            fileError.style.display = "none";
        }
    });

    // Evita el envío del formulario si hay un error
    document.querySelector("form").addEventListener("submit", function (event) {
        const file = document.getElementById("formFile2").files[0];
        if (file && file.type !== "image/png") {
            event.preventDefault(); // Evita el envío del formulario
            document.getElementById("fileError").style.display = "block";
        }
    });
</script>
<script>
    document.getElementById("formFile3").addEventListener("change", function (event) {
        const fileInput = event.target;
        const file = fileInput.files[0];
        const fileError = document.getElementById("fileError");

        if (file && file.type !== "image/png") {
            fileError.style.display = "block";
            fileInput.value = ""; // Limpia el campo de archivo
        } else {
            fileError.style.display = "none";
        }
    });

    // Evita el envío del formulario si hay un error
    document.querySelector("form").addEventListener("submit", function (event) {
        const file = document.getElementById("formFile3").files[0];
        if (file && file.type !== "image/png") {
            event.preventDefault(); // Evita el envío del formulario
            document.getElementById("fileError").style.display = "block";
        }
    });
</script>
<script>
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const fileInput = document.getElementById('formFile3');
        const file = fileInput.files[0];
        const fileError = document.getElementById('fileError');

        // Verifica si el archivo tiene el tipo MIME de PNG
        if (file && file.type !== 'image/png') {
            event.preventDefault(); // Evita que el formulario se envíe
            fileError.style.display = 'block'; // Muestra el mensaje de error
            fileInput.value = ''; // Resetea el input
        } else {
            fileError.style.display = 'none'; // Oculta el mensaje de error si es válido
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
            fileInput.value = ''; // Resetea el input
        } else {
            fileError.style.display = 'none'; // Oculta el mensaje de error si es válido
        }
    });
</script>

<script src="/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    const fechaCreacionInput =document.getElementById('fecha');
    const nombreContactoInput = document.getElementById('nombre_contacto');
    const cantAnimAlberInput = document.getElementById('cant_animales');
    const capacidadNuevosAnimInput = document.getElementById('capacidad');


    // Deshabilitar la entrada manual de texto
    fechaCreacionInput.addEventListener('keydown', function(event) {
        event.preventDefault();
    });

    function validarFecha() {
        // Obtener el valor del input tipo date
        const fechaInput = fechaCreacionInput.value;

        // Verificar si el campo está vacío
        if (!fechaInput) {
            document.getElementById('mensaje').innerText = "Por favor, ingrese una fecha.";
            return;
        }

        // Crear objeto Date a partir de la fecha ingresada
        const fechaIngresada = new Date(fechaInput);

        // Obtener la fecha actual
        const fechaActual = new Date();

        // Establecer la hora de la fecha actual a las 00:00:00 para hacer la comparación solo de fechas
        fechaActual.setHours(0, 0, 0, 0); // Esto asegura que se comparen solo las fechas, sin la hora

        // Comparar las fechas
        if (fechaIngresada >= fechaActual) {
            document.getElementById('mensaje').innerText = "La fecha debe ser menor a la fecha actual.";
        } else {
            document.getElementById('mensaje').innerText = ""; // Borrar el mensaje de error si la fecha es válida
        }
    }

    //Nombre persona de contacto//
    // Validar que solo se ingresen letras
    nombreContactoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    //Validar animales albergados//
    cantAnimAlberInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = cantAnimAlberInput.value;

        if (value < 1 || value > 999) {
            cantAnimAlberInput.value = value.slice(0, 3); // Limpiar el campo si está fuera de rango
        }
    });

    //Validar animales albergados//
    capacidadNuevosAnimInput.addEventListener('input', function() {
        let value = capacidadNuevosAnimInput.value;

        // Eliminar caracteres no numéricos, incluyendo + y -
        value = value.replace(/[^0-9]/g, '');
        // Validar que el valor esté dentro del rango
        if (parseInt(value) < 1 || parseInt(value) > 999) {
            value = value.slice(0, 3);;  // Limpiar el campo si está fuera de rango
        }

        // Asignar el valor validado al campo de entrada
        capacidadNuevosAnimInput.value = value;
    });


</script>

<script>

    // Validar la URL cuando se envíe el formulario
    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        event.preventDefault();  // Prevenir el envío del formulario por defecto
        let isValid = true;  // Bandera para controlar si todo está bien

        const urlInput = document.getElementById('link1').value.trim();
        const url1Input = document.getElementById('link2').value.trim();
        const mensaje1 = document.getElementById('mensaje1');
        const mensaje2 = document.getElementById('mensaje2');

        // Expresión regular para validar una URL básica
        const urlRegex = /^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\/[^\s]*)?$/;

        /// Validar la primera URL
        if (!urlRegex.test(urlInput)) {
            mensaje1.innerText = 'Por favor ingrese una URL válida (ejemplo: https://www.sitio.com).';
            isValid = false;
        } else {
            mensaje1.innerText = '';  // Limpiar el mensaje si la URL es válida
        }

        // Validar la segunda URL
        if (!urlRegex.test(url1Input)) {
            mensaje2.innerText = 'Por favor ingrese una URL válida (ejemplo: https://www.sitio.com).';
            isValid = false;
        } else {
            mensaje2.innerText = '';  // Limpiar el mensaje si la URL es válida
        }

        // Validar que las URLs no sean iguales
        if (urlInput === url1Input) {
            mensaje1.innerText = 'Las dos URLs no pueden ser la misma.';
            isValid = false;
        }

        // Si ambas URLs son válidas, enviar el formulario
        if (isValid) {
            window.location.href = 'eventTable.html'; // Redirigir a 'eventTable.html'
        }
    });
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
