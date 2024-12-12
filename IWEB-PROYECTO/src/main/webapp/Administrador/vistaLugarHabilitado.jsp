<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="lugar" scope="request" type="com.example.iwebproyecto.beans.LugarEvento"/>
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
    <div class="logo"><a href=""><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
  </header>

  <div class="main">

    <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
    <div class="barside">
      <ul class="navlinks">
        <li><a href="<%=request.getContextPath()%>/admincuentas" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
        <li><a href="/administrator/solicitudCuentaAlbergues.html" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
        <li><a href="/administrator/validacionUsuarios.html" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/CrearCoordinador" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/LugarHabilitado" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/Dashboard" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
        <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
      </ul>

    </div>

    <div id="menu" class="menu">
      <a href="<%=request.getContextPath()%>/admincuentas">Administración</a>
      <hr>

      <a href="/administrator/solicitudCuentaAlbergues.html">Validar Albergues</a>
      <a href="/administrator/validacionUsuarios.html">Validar Usuarios</a>
      <hr>

      <a href="<%=request.getContextPath()%>/CrearCoordinador">Crear Coordinador de Zona</a>
      <a href="<%=request.getContextPath()%>/LugarHabilitado">Crear lugar habilitado</a>
      <hr>
      <a href="<%=request.getContextPath()%>/Dashboard">Dashboard</a>
      <hr>
      <a href="/login/login.html">Cerrar Sesión</a>

    </div>


    <div class="container-fluid d-flex" id="contenido-principal">

      <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">

        <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
          <form id="uploadForm" style="padding:10px" method="POST" action="<%=request.getContextPath()%>/LugarHabilitado?action=view" >
            <h1 style="margin-top: 10px;" class="text-center">Vista de Lugar Habilitado</h1>
            <!--Primera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-12 p-1">
                <label for="Nombre-lugar">Nombre del lugar</label>
                <input type="text" class="form-control" value="<%=lugar.getNombreLugar()%>" placeholder="Ingrese el nombre del lugar" id="Nombre-lugar" name="nombreLugar" maxlength="50" disabled>
              </div>
            </div>
            <!--Segunda fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-4 p-1" >
                <label for="distrito">Distrito</label>
                <select class="form-select" name="idDistrito" id="distrito" disabled>
                  <option value="">Selecciona un distrito</option>
                  <optgroup label="Lima Norte">
                    <option value="1" <%String distritoID= lugar.getDistrito().getDistritoID() == 1 ? "selected" : null;%><%=distritoID%>>Ancon</option>
                    <option value="2" <%distritoID= lugar.getDistrito().getDistritoID() == 2 ? "selected" : null;%><%=distritoID%>>Santa Rosa</option>
                    <option value="3" <%distritoID= lugar.getDistrito().getDistritoID() == 3 ? "selected" : null;%><%=distritoID%>>Carabayllo</option>
                    <option value="4" <%distritoID= lugar.getDistrito().getDistritoID() == 4 ? "selected" : null;%><%=distritoID%>>Puente Piedra</option>
                    <option value="5" <%distritoID= lugar.getDistrito().getDistritoID() == 5 ? "selected" : null;%><%=distritoID%>>Comas</option>
                    <option value="6" <%distritoID= lugar.getDistrito().getDistritoID() == 6 ? "selected" : null;%><%=distritoID%>>Los Olivos</option>
                    <option value="7" <%distritoID= lugar.getDistrito().getDistritoID() == 7 ? "selected" : null;%><%=distritoID%>>San Martín de Porres</option>
                    <option value="8" <%distritoID= lugar.getDistrito().getDistritoID() == 8 ? "selected" : null;%><%=distritoID%>>Independencia</option>
                  </optgroup>
                  <optgroup label="Lima Sur">
                    <option value="9" <%distritoID= lugar.getDistrito().getDistritoID() == 9 ? "selected" : null;%><%=distritoID%>>San Juan de Miraflores</option>
                    <option value="10" <%distritoID= lugar.getDistrito().getDistritoID() == 10 ? "selected" : null;%><%=distritoID%>>Villa María del Triunfo</option>
                    <option value="11" <%distritoID= lugar.getDistrito().getDistritoID() == 11 ? "selected" : null;%><%=distritoID%>>Villa el Salvador</option>
                    <option value="12" <%distritoID= lugar.getDistrito().getDistritoID() == 12 ? "selected" : null;%><%=distritoID%>>Pachacamac</option>
                    <option value="13" <%distritoID= lugar.getDistrito().getDistritoID() == 13 ? "selected" : null;%><%=distritoID%>>Lurín</option>
                    <option value="14" <%distritoID= lugar.getDistrito().getDistritoID() == 14 ? "selected" : null;%><%=distritoID%>>Punta Hermosa</option>
                    <option value="15" <%distritoID= lugar.getDistrito().getDistritoID() == 15 ? "selected" : null;%><%=distritoID%>>Punta Negra</option>
                    <option value="16" <%distritoID= lugar.getDistrito().getDistritoID() == 16 ? "selected" : null;%><%=distritoID%>>San Bartolo</option>
                    <option value="17" <%distritoID= lugar.getDistrito().getDistritoID() == 17 ? "selected" : null;%><%=distritoID%>>Santa María del Mar</option>
                    <option value="18" <%distritoID= lugar.getDistrito().getDistritoID() == 18 ? "selected" : null;%><%=distritoID%>>Pucusana</option>
                  </optgroup>
                  <optgroup label="Lima Este">
                    <option value="19" <%distritoID= lugar.getDistrito().getDistritoID() == 19 ? "selected" : null;%><%=distritoID%>>San Juan de Lurigancho</option>
                    <option value="20" <%distritoID= lugar.getDistrito().getDistritoID() == 20 ? "selected" : null;%><%=distritoID%>>Lurigancho/Chosica</option>
                    <option value="21" <%distritoID= lugar.getDistrito().getDistritoID() == 21 ? "selected" : null;%><%=distritoID%>>Ate</option>
                    <option value="22" <%distritoID= lugar.getDistrito().getDistritoID() == 22 ? "selected" : null;%><%=distritoID%>>El Agustino</option>
                    <option value="23" <%distritoID= lugar.getDistrito().getDistritoID() == 23 ? "selected" : null;%><%=distritoID%>>Santa Anita</option>
                    <option value="24" <%distritoID= lugar.getDistrito().getDistritoID() == 24 ? "selected" : null;%><%=distritoID%>>La Molina</option>
                    <option value="25" <%distritoID= lugar.getDistrito().getDistritoID() == 25 ? "selected" : null;%><%=distritoID%>>Cieneguilla</option>
                  </optgroup>
                  <optgroup label="Lima Oeste">
                    <option value="26" <%distritoID= lugar.getDistrito().getDistritoID() == 26 ? "selected" : null;%><%=distritoID%>>Rimac</option>
                    <option value="27" <%distritoID= lugar.getDistrito().getDistritoID() == 27 ? "selected" : null;%><%=distritoID%>>Cercado de Lima</option>
                    <option value="28" <%distritoID= lugar.getDistrito().getDistritoID() == 28 ? "selected" : null;%><%=distritoID%>>Breña</option>
                    <option value="29" <%distritoID= lugar.getDistrito().getDistritoID() == 29 ? "selected" : null;%><%=distritoID%>>Pueblo Libre</option>
                    <option value="30" <%distritoID= lugar.getDistrito().getDistritoID() == 30 ? "selected" : null;%><%=distritoID%>>Magdalena</option>
                    <option value="31" <%distritoID= lugar.getDistrito().getDistritoID() == 31 ? "selected" : null;%><%=distritoID%>>Jesus María</option>
                    <option value="32" <%distritoID= lugar.getDistrito().getDistritoID() == 32 ? "selected" : null;%><%=distritoID%>>La Victoria</option>
                    <option value="33" <%distritoID= lugar.getDistrito().getDistritoID() == 33 ? "selected" : null;%><%=distritoID%>>Lince</option>
                    <option value="34" <%distritoID= lugar.getDistrito().getDistritoID() == 34 ? "selected" : null;%><%=distritoID%>>San Isidro</option>
                    <option value="35" <%distritoID= lugar.getDistrito().getDistritoID() == 35 ? "selected" : null;%><%=distritoID%>>San Miguel</option>
                    <option value="36" <%distritoID= lugar.getDistrito().getDistritoID() == 36 ? "selected" : null;%><%=distritoID%>>San Borja</option>
                    <option value="37" <%distritoID= lugar.getDistrito().getDistritoID() == 37 ? "selected" : null;%><%=distritoID%>>Surquillo</option>
                    <option value="38" <%distritoID= lugar.getDistrito().getDistritoID() == 38 ? "selected" : null;%><%=distritoID%>>Santiago de Surco</option>
                    <option value="39" <%distritoID= lugar.getDistrito().getDistritoID() == 39 ? "selected" : null;%><%=distritoID%>>Barranco</option>
                    <option value="40" <%distritoID= lugar.getDistrito().getDistritoID() == 40 ? "selected" : null;%><%=distritoID%>>Chorrillos</option>
                    <option value="41" <%distritoID= lugar.getDistrito().getDistritoID() == 41 ? "selected" : null;%><%=distritoID%>>San Luis</option>
                    <option value="42" <%distritoID= lugar.getDistrito().getDistritoID() == 42 ? "selected" : null;%><%=distritoID%>>Miraflores</option>
                  </optgroup>
                </select>
              </div>
              <div class="col-md-8 p-1">
                <label for="Direccion">Dirección</label>
                <input type="text" class="form-control" value="<%=lugar.getDireccionLugar()%>" placeholder="Maximo 100 caracteres" maxlength="100" id="Direccion" name="direccionLugar" disabled>
              </div>
            </div>
            <!--Tercera fila de selección-->
            <div class="row justify-content-center p-1">
              <div class="col-md-4 p-1">
                <label for="aforo-maximo">Aforo máximo</label>
                <input type="number" class="form-control" name="aforoLugar" value="<%=lugar.getAforoMax()%>" id="aforo-maximo" style="margin-top: 6px;" placeholder="Ingrese una cantidad" min="50" max="800" disabled>
              </div>

              <div class="col-md-8 p-1">
                <label for="formFileMultiple" class="form-label">Adjuntar imágenes del lugar</label>
                <input class="form-control" type="file" name="fotoLugar" id="formFileMultiple" multiple accept=".png" onchange="validateFiles(this)" disabled>
                <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                <div id="cantError" class="text-danger mt-3" style="display: none;">El máximo de archivos a subir es 4.</div>
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
