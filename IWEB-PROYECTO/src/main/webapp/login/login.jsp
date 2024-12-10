<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesion</title>
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Login/CSS/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<body background="${pageContext.request.contextPath}/common/img/backgrounds/paw_bck.jpg" style="background-repeat: repeat; background-size: cover;">
<div class="container">
    <!-- -->
    <div class="form-container">
        <h2>Iniciar Sesión</h2>
        <form action="${pageContext.request.contextPath}/Login" id="loginForm" name="login" method="post" onsubmit="return hashPassword()">
            <div class="form-group">
                <input type="email" id="email" name="email" placeholder="Correo" maxlength="80" required>
            </div>
            <div class="form-group">
                <input type="password" id="password" placeholder="Contraseña" maxlength="30" required>
                <input type="hidden" id="hashedPassword" name="password">
                <span><i id="toggler" class="far fa-eye"></i></span>
            </div>
            <div class="alert">
                <p>Credenciales incorrectas</p>
            </div>
            <div class="form-group">
                <button type="submit">Iniciar sesión</button>
            </div>
            <div class="form-group">
                <a href="<%=request.getContextPath()%>/fpassword.jsp">¿Olvido su contraseña?</a>
                <a href="<%=request.getContextPath()%>/signin.jsp">Crear cuenta</a>
                <a href="signinAlbergue.html">Inscribir su albergue</a>
            </div>
        </form>
    </div>

    <!-- imagen perrito, se desativara para la vista web-->
    <div class="image-container"></div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
<script>
    function hashPassword() {
        // Obtener la contraseña sin hashear del campo input
        const passwordField = document.getElementById('password');
        const hashedPasswordField = document.getElementById('hashedPassword');

        // Verificar que la contraseña no esté vacía
        if (!passwordField.value) {
            alert("Por favor, ingresa tu contraseña.");
            return false;
        }

        // Hashear la contraseña usando SHA-256 (CryptoJS)
        const hashedPassword = CryptoJS.SHA256(passwordField.value).toString();

        // Establecer el valor hasheado en el campo oculto
        hashedPasswordField.value = hashedPassword;

        // Limpiar el campo de la contraseña para que no se envíe el texto plano
        passwordField.value = '';

        return true; // Permitir que el formulario se envíe
    }
</script>
<script>
    let password = document.getElementById('password');
    let toggler = document.getElementById('toggler');
    showHidePassword = () => {
        if (password.type == 'password') {
            password.setAttribute('type', 'text');
            toggler.classList.add('fa-eye-slash');
        } else {
            toggler.classList.remove('fa-eye-slash');
            password.setAttribute('type', 'password');
        }
    };
    toggler.addEventListener('click', showHidePassword);

</script>


</body>
</html>