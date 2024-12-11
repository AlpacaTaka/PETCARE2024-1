<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="icon" href="<%=request.getContextPath()%>/common/img/logos/paw.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/login/css/signin.css">

    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .image-container {
            flex: 1;
            margin-left: 10px;
            background-image: url('<%=request.getContextPath()%>/common/img/loginfiles/Login_Signin_Gatito.png'); /* Reemplaza con la URL de tu imagen */
            background-size: cover;
            background-position: center;
            border-radius: 8px;
            min-height: 650px;
        }
    </style>
</head>

<body background="<%=request.getContextPath()%>/common/img/backgrounds/paw_bck.jpg" style="background-repeat: repeat; background-size: cover;">

<div class="container-button">
    <a href="<%=request.getContextPath()%>/login/login.jsp">Regresar</a>
</div>
<div class="container">
    <div class="form-container">
        <h2>
            Registro
        </h2>
        <p>Completa tus datos y espera a que un administrador los valide</p>
        <form id="uploadForm" method="POST" action="${pageContext.request.contextPath}/SignIn" enctype="multipart/form-data" accept-charset="UTF-8">
            <div class="form-group">
                <label for="nombre-login">
                    Nombres
                </label>
                <input placeholder="Ingrese sus nombres" type="text" id="nombre-login" name="nombre-login" maxlength="40" required/>
            </div>

            <div class="form-group">
                <label for="apellido-login">
                    Apellidos
                </label>
                <input  placeholder="Ingrese sus apellidos" type="text" id="apellido-login" name="apellido-login" maxlength="70" required/>
            </div>

            <div class="form-group">
                <label for="dni-login">
                    DNI
                </label>
                <input placeholder="Ingrese el número de documento" type="number" id="dni-login" name="dni-login" required/>
            </div>
            <div class="form-group" for="direccion-login">
                <label>
                    Dirección
                </label>
                <input placeholder="Ingrese su direccion" type="text" name="direccion-login" for="direccion-login" maxlength="100" required/>
            </div>
            <div class="form-group">
                <label>
                    Distrito
                </label>
                <select class="form-select" name="distrito" id="distrito" required>
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
                        <option value="11">Villa El Salvador</option>
                        <option value="12">Pachacamac</option>
                        <option value="13">Lurin</option>
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
                        <option value="36">Surquillo</option>
                        <option value="37">San Borja</option>
                        <option value="38">Santiago de Surco</option>
                        <option value="39">Barranco</option>
                        <option value="40">Chorrillos</option>
                        <option value="41">San Luis</option>
                        <option value="42">Miraflores</option>
                    </optgroup>
                </select>
            </div>
            <div class="form-group" for="email-login">
                <label>
                    Correo electrónico
                </label>
                <input placeholder="Inserte su dirección de correo electronico" type="email" id="email-login" name="email-login" required/>
            </div>
            <div class="form-group">
                <label for="formFile" class="form-label">Adjunte una foto suya</label>
                <input class="form-control" type="file" id="formFile" name="foto" accept=".png" required>
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