<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesion</title>
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/Login/CSS/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<body background="/common/img/backgrounds/paw_bck.jpg" style="background-repeat: repeat; background-size: cover;">
<div class="container">
    <!-- -->
    <div class="form-container">
        <h2>Iniciar Sesión</h2>
        <form id="loginForm" method="get">
            <div class="form-group">
                <input type="email"  id="email" placeholder="Correo" maxlength="80" required>
            </div>
            <div class="form-group">
                <input type="password" id="password" placeholder="Contraseña" maxlength="30" required>
                <span><i id="toggler"class="far fa-eye"></i></span>
            </div>
            <div class="alert">
                <p>Credenciales incorrectas</p>
            </div>
            <div class="form-group">
                <button type="submit">Iniciar sesión</button>
            </div>
            <div class="form-group">
                <a href="<%=request.getContextPath()%>/fpassword.jsp">¿Olvido su contraseña?</a>
                <a href="<%=request.getContextPath()%>/signin.jsp"">Crear cuenta</a>
                <a href="signinAlbergue.html">Inscribir su albergue</a>
            </div>
        </form>
    </div>

    <!-- imagen perrito, se desativara para la vista web-->
    <div class="image-container"></div>
</div>
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



    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Evitar el envío del formulario

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;

        // Verificar credenciales y roles
        if (email === 'admin@admin.com' && password === 'admin') {
            window.location.href = '/administrator/dashboard.html'; // Redirigir al administrador
        } else if (email === 'user@user.com' && password === 'user') {
            window.location.href = '/user/inicio.html'; // Redirigir al usuario
        } else if (email === 'coordinador@coordinador.com' && password === 'coordinador') {
            window.location.href = '/cordinador/listaSolicitudesDeHogarTemporal1.html'; // Redirigir al coordinador
        } else if (email === 'albergue@albergue.com' && password === 'albergue') {
            window.location.href = '/albergue/adoptionTable.html'; // Redirigir al albergue
        } else {
            alertMessage.style.display = 'block'; // Mostrar error si las credenciales no coinciden
        }
    });
</script>


</body>
</html>