<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="/common/img/logos/paw.ico">
  <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="/common/css/baseDesign.css">
  <link rel="stylesheet" href="CSSDELAPAGINA.css">
  <title>Crear Coordinador de Zona</title>
  <style>

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
      <div class="welcome-text">Hola, Administrador</div>
    </div>
    <div class="logo"><a href="/administrator/dashboard.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
  </header>

  <div class="main">

    <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
    <div class="barside">
      <ul class="navlinks">
        <li><a href="/administrator/administracionCuentas.html" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
        <li><a href="/administrator/solicitudCuentaAlbergues.html" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
        <li><a href="/administrator/validacionUsuarios.html" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
        <li><a href="/administrator/creacionCoordinadorZona.html" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
        <li><a href="/administrator/creacionLugarHabilitado.html" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
        <li><a href="/administrator/dashboard.html" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
        <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
      </ul>

    </div>

    <div id="menu" class="menu">
      <a href="/administrator/administracionCuentas.html">Administración</a>
      <hr>

      <a href="/administrator/solicitudCuentaAlbergues.html">Validar Albergues</a>
      <a href="/administrator/validacionUsuarios.html">Validar Usuarios</a>
      <hr>

      <a href="/administrator/creacionCoordinadorZona.html">Crear Coordinador de Zona</a>
      <a href="/administrator/creacionLugarHabilitado.html">Crear lugar habilitado</a>
      <hr>
      <a href="/administrator/dashboard.html">Dashboard</a>
      <hr>
      <a href="/login/login.html">Cerrar Sesión</a>

    </div>


    <div class="container-fluid d-flex" id="contenido-principal">

      <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">

        <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
          <form id="uploadForm" style="padding:10px" >
            <h1 style="margin-top: 10px;" class="text-center">Vista de Lugar Habilitado</h1>
            <!--Primera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-12 p-1">
                <label for="Nombre-lugar">Nombre del lugar</label>
                <input type="text" class="form-control" placeholder="Estadio Lolo Fernadez" id="Nombre-lugar" name="Nombre-lugar" maxlength="50" disabled>
              </div>
            </div>
            <!--Segunda fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-12 p-1">
                <label for="direccion-lugar">Dirección</label>
                <input type="text" class="form-control" id="direccion-lugar" maxlength="100" placeholder="Av Aguarico 133" disabled>
              </div>
            </div>
            <!--Tercera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-4 p-1">
                <label for="aforo-maximo">Aforo máximo</label>
                <input type="number" class="form-control" id="aforo-maximo" style="margin-top: 6px;" placeholder="300" min="50" max="800" disabled>
              </div>

              <div class="col-md-8 p-1">
                <label for="formFileMultiple" class="form-label">Adjuntar imágenes del lugar</label>
                <input class="form-control" type="file" id="formFileMultiple" multiple accept=".png" onchange="validateFiles(this)" disabled>
                <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                <div id="cantError" class="text-danger mt-3" style="display: none;">El máximo de archivos a subir es 4.</div>
              </div>

            </div>
            <!--Boton de enviar-->
            <div class="row justify-content-center p-1">
              <div class="col-md-12 p-1 d-flex justify-content-center">
                <button type="button" class="btn btn-secondary" disabled>Enviar</button>
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

</body>


<script src="/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
