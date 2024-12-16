<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="albergue" type="com.example.iwebproyecto.beans.Albergue" scope="request" />
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

        /* Esto es solo de referencia para ver su espacio disponible - borrar*/

        .image-container {
            width: 170px; /* Puedes ajustar el tamaño según sea necesario */
            height: 170px;
            border-radius: 50%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Añade una sombra */
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Mantiene las proporciones de la imagen dentro del contenedor */
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
            <div class="welcome-text">Hola, Administrador</div>
        </div>
        <div class="logo"><a href="<%=request.getContextPath()%>/Dashboard"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/admincuentas" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/ValidarAlb" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/ValidarUser" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/CrearCoordinador" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/LugarHabilitado" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/Dashboard" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
                <li id="cerrar-sesion"><a href="<%=request.getContextPath()%>" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="<%=request.getContextPath()%>/admincuentas">Administración</a>
            <hr>

            <a href="<%=request.getContextPath()%>/ValidarAlb">Validar Albergues</a>
            <a href="<%=request.getContextPath()%>/ValidarUser">Validar Usuarios</a>
            <hr>

            <a href="<%=request.getContextPath()%>/CrearCoordinador">Crear Coordinador de Zona</a>
            <a href="<%=request.getContextPath()%>/LugarHabilitado">Crear lugar habilitado</a>
            <hr>
            <a href="<%=request.getContextPath()%>/Dashboard">Dashboard</a>
            <hr>
            <a href="<%=request.getContextPath()%>">Cerrar Sesión</a>

        </div>


        <div class="container-fluid d-flex" id="contenido-principal">

            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container">
                    <div class="container md-8" style="width: 100%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <a href="<%=request.getContextPath()%>/admincuentas"><button type="button" class="btn btn-personal2">Regresar   </button></a>
                    </div>
                    <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <form id="uploadForm" style="padding:10px" method="POST" action="<%=request.getContextPath()%>/AlbAdmin?action=edit">
                            <input type="hidden" name="id" value="<%=albergue.getAlbergueID()%>">
                            <h1 style="margin-top: 10px;" class="text-center">Perfil de Albergue</h1>

                            <div class="row justify-content-center p-1">
                                <div class="col d-flex justify-content-center">
                                    <div class="image-container">
                                        <img src="${pageContext.request.contextPath}/common/img/logos/albergueDefault.png" alt="Perfil de usuario">
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <h5>Datos del Encargado</h5>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="nombreEncargado">Nombre </label>
                                    <input type="text" class="form-control" name="nombreEncAlb" id="nombreEncargado" value="<%=albergue.getNombreEncargado()%>" disabled>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="apellidoEncargado">Apellido</label>
                                    <input type="text" class="form-control" id="apellidoEncargado" name="apelEncAlb" value="<%=albergue.getApellidoEncargado()%>"  disabled>
                                </div>
                            </div>
                            <hr>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <h5>Datos del Albergue</h5>
                                </div>
                                <div class="col-md-9 p-1">
                                    <label for="nombreAlb">Nombre</label>

                                    <input type="text" id="nombreAlb" name="nombreAlb" class="form-control" value="<%=albergue.getNombreAlbergue()%>"  disabled >

                                </div>
                                <div class="col-md-3 p-1">
                                    <label for="fecha">Fecha de Creación:</label>
                                    <input type="date" id="fecha" class="form-control" name="fecha" value="<%=albergue.getFechaCreacion()%>"  disabled >
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1" >
                                    <label for="correo">Correo:</label>
                                    <input type="text" id="correo" class="form-control" name="correo" value="<%=albergue.getCorreoElectronico()%>"  disabled >
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-4 p-1" >
                                    <label for="distrito">Distrito</label>
                                    <select class="form-select" name="idDistrito" id="distrito" disabled >
                                        <option value="">Selecciona un distrito</option>
                                        <optgroup label="Lima Norte">
                                            <option value="1" <%String distritoID= albergue.getDistrito().getDistritoID() == 1 ? "selected" : null;%><%=distritoID%>>Ancon</option>
                                            <option value="2" <%distritoID= albergue.getDistrito().getDistritoID() == 2 ? "selected" : null;%><%=distritoID%>>Santa Rosa</option>
                                            <option value="3" <%distritoID= albergue.getDistrito().getDistritoID() == 3 ? "selected" : null;%><%=distritoID%>>Carabayllo</option>
                                            <option value="4" <%distritoID= albergue.getDistrito().getDistritoID() == 4 ? "selected" : null;%><%=distritoID%>>Puente Piedra</option>
                                            <option value="5" <%distritoID= albergue.getDistrito().getDistritoID() == 5 ? "selected" : null;%><%=distritoID%>>Comas</option>
                                            <option value="6" <%distritoID= albergue.getDistrito().getDistritoID() == 6 ? "selected" : null;%><%=distritoID%>>Los Olivos</option>
                                            <option value="7" <%distritoID= albergue.getDistrito().getDistritoID() == 7 ? "selected" : null;%><%=distritoID%>>San Martín de Porres</option>
                                            <option value="8" <%distritoID= albergue.getDistrito().getDistritoID() == 8 ? "selected" : null;%><%=distritoID%>>Independencia</option>
                                        </optgroup>
                                        <optgroup label="Lima Sur">
                                            <option value="9" <%distritoID= albergue.getDistrito().getDistritoID() == 9 ? "selected" : null;%><%=distritoID%>>San Juan de Miraflores</option>
                                            <option value="10" <%distritoID= albergue.getDistrito().getDistritoID() == 10 ? "selected" : null;%><%=distritoID%>>Villa María del Triunfo</option>
                                            <option value="11" <%distritoID= albergue.getDistrito().getDistritoID() == 11 ? "selected" : null;%><%=distritoID%>>Villa el Salvador</option>
                                            <option value="12" <%distritoID= albergue.getDistrito().getDistritoID() == 12 ? "selected" : null;%><%=distritoID%>>Pachacamac</option>
                                            <option value="13" <%distritoID= albergue.getDistrito().getDistritoID() == 13 ? "selected" : null;%><%=distritoID%>>Lurín</option>
                                            <option value="14" <%distritoID= albergue.getDistrito().getDistritoID() == 14 ? "selected" : null;%><%=distritoID%>>Punta Hermosa</option>
                                            <option value="15" <%distritoID= albergue.getDistrito().getDistritoID() == 15 ? "selected" : null;%><%=distritoID%>>Punta Negra</option>
                                            <option value="16" <%distritoID= albergue.getDistrito().getDistritoID() == 16 ? "selected" : null;%><%=distritoID%>>San Bartolo</option>
                                            <option value="17" <%distritoID= albergue.getDistrito().getDistritoID() == 17 ? "selected" : null;%><%=distritoID%>>Santa María del Mar</option>
                                            <option value="18" <%distritoID= albergue.getDistrito().getDistritoID() == 18 ? "selected" : null;%><%=distritoID%>>Pucusana</option>
                                        </optgroup>
                                        <optgroup label="Lima Este">
                                            <option value="19" <%distritoID= albergue.getDistrito().getDistritoID() == 19 ? "selected" : null;%><%=distritoID%>>San Juan de Lurigancho</option>
                                            <option value="20" <%distritoID= albergue.getDistrito().getDistritoID() == 20 ? "selected" : null;%><%=distritoID%>>Lurigancho/Chosica</option>
                                            <option value="21" <%distritoID= albergue.getDistrito().getDistritoID() == 21 ? "selected" : null;%><%=distritoID%>>Ate</option>
                                            <option value="22" <%distritoID= albergue.getDistrito().getDistritoID() == 22 ? "selected" : null;%><%=distritoID%>>El Agustino</option>
                                            <option value="23" <%distritoID= albergue.getDistrito().getDistritoID() == 23 ? "selected" : null;%><%=distritoID%>>Santa Anita</option>
                                            <option value="24" <%distritoID= albergue.getDistrito().getDistritoID() == 24 ? "selected" : null;%><%=distritoID%>>La Molina</option>
                                            <option value="25" <%distritoID= albergue.getDistrito().getDistritoID() == 25 ? "selected" : null;%><%=distritoID%>>Cieneguilla</option>
                                        </optgroup>
                                        <optgroup label="Lima Oeste">
                                            <option value="26" <%distritoID= albergue.getDistrito().getDistritoID() == 26 ? "selected" : null;%><%=distritoID%>>Rimac</option>
                                            <option value="27" <%distritoID= albergue.getDistrito().getDistritoID() == 27 ? "selected" : null;%><%=distritoID%>>Cercado de Lima</option>
                                            <option value="28" <%distritoID= albergue.getDistrito().getDistritoID() == 28 ? "selected" : null;%><%=distritoID%>>Breña</option>
                                            <option value="29" <%distritoID= albergue.getDistrito().getDistritoID() == 29 ? "selected" : null;%><%=distritoID%>>Pueblo Libre</option>
                                            <option value="30" <%distritoID= albergue.getDistrito().getDistritoID() == 30 ? "selected" : null;%><%=distritoID%>>Magdalena</option>
                                            <option value="31" <%distritoID= albergue.getDistrito().getDistritoID() == 31 ? "selected" : null;%><%=distritoID%>>Jesus María</option>
                                            <option value="32" <%distritoID= albergue.getDistrito().getDistritoID() == 32 ? "selected" : null;%><%=distritoID%>>La Victoria</option>
                                            <option value="33" <%distritoID= albergue.getDistrito().getDistritoID() == 33 ? "selected" : null;%><%=distritoID%>>Lince</option>
                                            <option value="34" <%distritoID= albergue.getDistrito().getDistritoID() == 34 ? "selected" : null;%><%=distritoID%>>San Isidro</option>
                                            <option value="35" <%distritoID= albergue.getDistrito().getDistritoID() == 35 ? "selected" : null;%><%=distritoID%>>San Miguel</option>
                                            <option value="36" <%distritoID= albergue.getDistrito().getDistritoID() == 36 ? "selected" : null;%><%=distritoID%>>San Borja</option>
                                            <option value="37" <%distritoID= albergue.getDistrito().getDistritoID() == 37 ? "selected" : null;%><%=distritoID%>>Surquillo</option>
                                            <option value="38" <%distritoID= albergue.getDistrito().getDistritoID() == 38 ? "selected" : null;%><%=distritoID%>>Santiago de Surco</option>
                                            <option value="39" <%distritoID= albergue.getDistrito().getDistritoID() == 39 ? "selected" : null;%><%=distritoID%>>Barranco</option>
                                            <option value="40" <%distritoID= albergue.getDistrito().getDistritoID() == 40 ? "selected" : null;%><%=distritoID%>>Chorrillos</option>
                                            <option value="41" <%distritoID= albergue.getDistrito().getDistritoID() == 41 ? "selected" : null;%><%=distritoID%>>San Luis</option>
                                            <option value="42" <%distritoID= albergue.getDistrito().getDistritoID() == 42 ? "selected" : null;%><%=distritoID%>>Miraflores</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="col-md-8 p-1">
                                    <label for="Direccion">Dirección</label>
                                    <input type="text" class="form-control" value="<%=albergue.getDireccion()%>" maxlength="100" id="Direccion" name="Direccion" disabled>
                                </div>

                            </div>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="direc_donac">Direccion de donaciones</label>
                                    <input type="text" class="form-control" name="direcDonaciones" id="direc_donac" maxlength="100" value="<%=albergue.getDireccionDonaciones()%>" disabled >

                                </div>

                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="nom_contac">Nombre de contacto de Donaciones</label>
                                    <input type="text" class="form-control" name="nombreDonaciones" id="nom_contac" maxlength="100" value="<%=albergue.getNombreContactoDonaciones()%>" disabled>

                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="num_donac">Numero de contacto Donaciones</label>
                                    <input type="number" id="num_donac" name="numeroDonaciones" class="form-control" value="<%=albergue.getNumeroContactoDonaciones()%>" disabled >

                                </div>

                            </div>

                            <hr>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1" >
                                    <label for="cantidad_albergados">Cantidad de animales albergados</label>
                                    <input type="number" name="animalesAlbergados" id="cantidad_albergados" class="form-control" value="<%=albergue.getCantidadAnimales()%>"  disabled >
                                </div>
                                <div class="col-md-6 p-1" >
                                    <label for="espacios_disponibles">Cantidad de espacios para nuevos animales</label>
                                    <input type="number" name="espacioDisponible" id="espacios_disponibles" class="form-control" value="<%=albergue.getEspaciosDisponibles()%>"  disabled >
                                </div>

                            </div>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">+
                                    <label for="punto_acopio">Punto de acopio de donaciones</label>
                                    <input type="text" id="punto_acopio" class="form-control" maxlength="100" name="puntoAcopio" value="<%=albergue.getPuntoAcopioDonaciones()%>" disabled >
                                </div>
                            </div>

                            <hr>


                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <p>Si necesita cambiar alguno de estos datos, contactar son Soporte</p>
                                </div>

                            </div>
                        </form>
                    </div>


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

<script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    const nombreCoordinadorInput = document.getElementById('Nombre-coordinador');
    const apellidoCoordinadorInput = document.getElementById('Apellido-coordinador');
    const fechaNacimientoInput = document.getElementById('fechaNacimiento');


    //Nombre y apellidos coordinador//
    // Validar que solo se ingresen letras
    nombreCoordinadorInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });
    // Validar que solo se ingresen letras
    apellidoCoordinadorInput.addEventListener('input', function() {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Validar que la fecha ingresada sea menor al día actual
    fechaNacimientoInput.addEventListener('input', function() {
        const selectedDate = new Date(fechaNacimientoInput.value);
        const today = new Date();

        // Establecer la hora de 'today' a 00:00:00 para solo comparar la fecha
        today.setHours(0, 0, 0, 0);

        // Comparar las fechas
        if (selectedDate >= today) {
            errorMessage.style.display = 'block'; // Mostrar mensaje de error si la fecha es igual o mayor a hoy
        } else {
            errorMessage.style.display = 'none'; // Ocultar mensaje de error
        }
    });
</script>
<script>
    const celularCoordinadorInput = document.getElementById('celular-coordinador');
    const correoCoordinadorInput = document.getElementById('correo-coordinador');
    const dniCoordinadorInput = document.getElementById('dni-coordinador');

    //Validar longitud de numero telefonico//
    celularCoordinadorInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = celularCoordinadorInput.value;

        // Validar que no se exceda la longitud de 9 cifras
        if (value.length > 9) {
            celularCoordinadorInput.value = value.slice(0, 9); // Limitar a dos cifras
        }

        // Validar que la primera cifra sea un "9"
        if (value.length > 0 && value[0] !== '9') {
            celularCoordinadorInput.value = ''; // Limpiar el campo si la primera cifra no es "9"
        }
    });

    //Validar DNI//
    dniCoordinadorInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = dniCoordinadorInput.value;

        // Validar que no se exceda la longitud de 9 cifras
        if (value.length > 8) {
            dniCoordinadorInput.value = value.slice(0, 8); // Limitar a dos cifras
        }
    });

    //Validar correo electronico//
    correoCoordinadorInput.addEventListener('input', function() {
        const value = correoCoordinadorInput.value;
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
</body>
