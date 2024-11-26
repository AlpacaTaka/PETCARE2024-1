<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="logo"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
  </header>

  <div class="main">

    <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
    <div class="barside">
      <ul class="navlinks">
        <li><a href="/administrator/administracionCuentas.html" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
        <li><a href="/administrator/solicitudCuentaAlbergues.html" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
        <li><a href="/administrator/validacionUsuarios.html" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/CrearCoordinador" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/LugarHabilitado" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
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

      <a href="<%=request.getContextPath()%>/CrearCoordinador">Crear Coordinador de Zona</a>
      <a href="<%=request.getContextPath()%>/LugarHabilitado">Crear lugar habilitado</a>
      <hr>
      <a href="/administrator/dashboard.html">Dashboard</a>
      <hr>
      <a href="/login/login.html">Cerrar Sesión</a>

    </div>


    <div class="container-fluid d-flex" id="contenido-principal">

      <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">

        <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
          <form id="uploadForm" style="padding:10px" method="POST" action="<%=request.getContextPath()%>/LugarHabilitado?action=create">
            <h1 style="margin-top: 10px;" class="text-center">Creación de Lugar Habilitado</h1>
            <!--Primera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-12 p-1">
                <label for="Nombre-lugar">Nombre del lugar</label>
                <input type="text" class="form-control" placeholder="Ingrese el nombre del lugar" id="Nombre-lugar" name="nombreLugar" maxlength="50" required>
              </div>
            </div>
            <!--Segunda fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-4 p-1" >
                <label for="distrito">Distrito</label>
                <select class="form-select" name="idDistrito" id="distrito" required>
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
                    <option value="11">Villa el Salvador</option>
                    <option value="12">Pachacamac</option>
                    <option value="13">Lurín</option>
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
                    <option value="36">San Borja</option>
                    <option value="37">Surquillo</option>
                    <option value="38">Santiago de Surco</option>
                    <option value="39">Barranco</option>
                    <option value="40">Chorrillos</option>
                    <option value="41">San Luis</option>
                    <option value="42">Miraflores</option>
                  </optgroup>
                </select>
              </div>
              <div class="col-md-8 p-1">
                <label for="Direccion">Dirección</label>
                <input type="text" class="form-control" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="direccionLugar">
              </div>
            </div>
            <!--Tercera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-4 p-1">
                <label for="aforo-maximo">Aforo máximo</label>
                <input type="number" class="form-control" name="aforoLugar" id="aforo-maximo" style="margin-top: 6px;" placeholder="Ingrese una cantidad" min="50" max="800" required>
              </div>

              <div class="col-md-8 p-1">
                <label for="formFileMultiple" class="form-label">Adjuntar imágenes del lugar</label>
                <input class="form-control" type="file" name="fotoLugar" id="formFileMultiple" multiple accept=".png" onchange="validateFiles(this)" required>
                <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                <div id="cantError" class="text-danger mt-3" style="display: none;">El máximo de archivos a subir es 4.</div>
              </div>

            </div>
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

