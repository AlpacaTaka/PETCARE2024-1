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
    </style>
</head>

<body background="/common/img/backgrounds/paw_bck.jpg" style="background-repeat: repeat; background-size: cover;">

<div class="container-button">
    <a href="/login/login.html">Regresar</a>
</div>
<div class="container">
    <div class="form-container">
        <h2>
            Registro
        </h2>
        <p>Completa tus datos y espera a que un administrador los valide</p>
        <form id="uploadForm">
            <div class="form-group">
                <label for="nombre-login">
                    Nombres
                </label>
                <input placeholder="Ingrese sus nombres" type="text" id="nombre-login" maxlength="40" required/>
            </div>

            <div class="form-group">
                <label for="apellido-login">
                    Apellidos
                </label>
                <input  placeholder="Ingrese sus apellidos" type="text" id="apellido-login" maxlength="70" required/>
            </div>

            <div class="form-group">
                <label for="dni-login">
                    DNI
                </label>
                <input placeholder="Ingrese el número de documento" type="number" id="dni-login" required/>
            </div>
            <div class="form-group" for="direccion-login">
                <label>
                    Dirección
                </label>
                <input placeholder="Ingrese su direccion" type="text" for="direccion-login" maxlength="100" required/>
            </div>
            <div class="form-group">
                <label>
                    Distrito
                </label>
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
            <div class="form-group" for="email-login">
                <label>
                    Correo electrónico
                </label>
                <input placeholder="Inserte su dirección de correo electronico" type="email" id="email-login" required/>
            </div>
            <div class="form-group">
                <label for="formFile" class="form-label">Adjunte una foto suya</label>
                <input class="form-control" type="file" id="formFile" accept=".png" required>
                <div id="fileError" class="text-danger mt-2" style="display: none; color: red;">El archivo debe ser una imagen PNG.</div>
            </div>

            <div class="form-group">
                <button type="submit" class="button">
                    Enviar
                </button>
            </div>
        </form>

    </div>
    <div class="image-container"></div>
</div>
</body>
</html>

<script>
    const nombreInput = document.getElementById('nombre-login');
    const apellidoInput = document.getElementById('apellido-login');
    const dniInput = document.getElementById('dni-login');

    // Validar que solo se ingresen letras
    nombreInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que solo se ingresen letras
    apellidoInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
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