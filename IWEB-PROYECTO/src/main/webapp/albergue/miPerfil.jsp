<%@ page import="com.example.iwebproyecto.beans.Albergue" %>
<%@ page import="com.example.iwebproyecto.beans.Distrito" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Albergue albergue = (Albergue) request.getAttribute("albergue");
%>
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
    <title>Mi  cuenta</title>
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
                <div class="welcome-text">Hola, Patitas Felices</div>
            </div>
            <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="<%=request.getContextPath()%>/Albergue" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="eventTable.jsp" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="donationTable.jsp" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                    <li><a href="contactarTemporal.jsp" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="solicitudesAdopcion.jsp" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                    <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                    <li id="cerrar-sesion"><a href="#micuenta" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
            </div>

            <div id="menu" class="menu">
                <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
                <a href="<%=request.getContextPath()%>/Albergue">Portal de Adopciones</a>
                <a href="eventTable.jsp">Mis Eventos Benéficos</a>
                <a href="donationTable.jsp">Mis Eventos de Donación</a>
                <a href="contactarTemporal.jsp">Hogares Temporales</a>
                <a href="solicitudesAdopcion.jsp">Solicitudes de Adopción</a>
                <!--<a href="#">Solicitudes de Adopción</a>-->
                <hr>
                <a href="#">Cerrar Sesión</a>

            </div>

            <div class="container-fluid d-flex" id="contenido-principal">

                <div class="row d-flex flex-column" id="contenido-nofooter">
                    <div class="container">
                        <div class="container md-8" style="width: 100%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                            <a href="eventTable.jsp"><button type="button" class="btn btn-personal2">Regresar   </button></a>
                        </div>
                        <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            <form id="uploadForm" style="padding:10px" method="post" action="miPerfil">
                                <input type="hidden" name="albergueID" value="<%= albergue.getAlbergueID() %>">
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
                                        <label >Nombre </label>
                                        <input type="text" class="form-control" value="<%= albergue.getNombreEncargado() %>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label >Apellido</label>
                                        <input type="text" class="form-control" value="<%= albergue.getApellidoEncargado() %>" required disabled>
                                    </div>
                                </div>
                                <hr>

                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <h5>Datos del Albergue</h5>
                                    </div>
                                    <div class="col-md-9 p-1">
                                        <label>Nombre</label>

                                        <input type="text" class="form-control" value="<%= albergue.getNombreAlbergue() %>" required disabled>

                                    </div>
                                    <div class="col-md-3 p-1">
                                        <label for="distrito">Fecha de Creación:</label>
                                        <input type="text" class="form-control" value="<%= albergue.getFechaCreacion() %>" required disabled>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1" >
                                        <label>Correo:</label>
                                        <input type="text" class="form-control" value="<%= albergue.getCorreoElectronico() %>" required disabled>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1" >
                                        <label for="direccion">Cantidad de animales albergados</label>
                                        <input type="number" class="form-control" value="<%= albergue.getCantidadAnimales() %>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1" >
                                        <label for="direccion">Cantidad de espacios para nuevos animales</label>
                                        <input type="number" class="form-control" value="<%= albergue.getEspaciosDisponibles() %>" required disabled>
                                    </div>

                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-4 p-1" >
                                        <label for="distrito">Distrito</label>
                                        <select class="form-select" name="distrito" id="distrito" required disabled>
                                            <option value=""><%= albergue.getDistrito().getNombreDistrito() %></option>
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
                                        <label for="Direccion">Dirección</label>
                                        <input type="text" class="form-control" value="<%= albergue.getDireccion() %>" maxlength="100" id="Direccion" name="Direccion" disabled>
                                    </div>

                                </div>

                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="direc_donac">Direccion de donaciones</label>
                                        <input type="text" class="form-control" id="direc_donac" maxlength="100" value="<%= albergue.getDireccionDonaciones() %>" required disabled>

                                    </div>

                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <label for="nom_contac">Nombre de contacto de Donaciones</label>
                                        <input type="text" class="form-control" id="nom_contac" maxlength="100" value="<%= albergue.getNombreContactoDonaciones() %>" required disabled>

                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="num_donac">Numero de contacto Donaciones</label>
                                        <input type="number" id="num_donac" class="form-control" value="<%= albergue.getNumeroContactoDonaciones() %>" required disabled>

                                    </div>

                                </div>

                                <hr>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <label for="cantidad_animales">Cantidad de animales albergados</label>
                                        <input type="number" id="cantidad_animales" name="cantidad_animales" class="form-control" value="<%= albergue.getCantidadAnimales() %>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="espacios_disponibles">Cantidad de espacios para nuevos animales</label>
                                        <input type="number" id="espacios_disponibles" name="espacios_disponibles" class="form-control" value="<%= albergue.getEspaciosDisponibles() %>" required disabled>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="punto_acopio">Punto de acopio de donaciones</label>
                                        <input type="text" id="punto_acopio" name="punto_acopio" class="form-control" maxlength="100" value="<%= albergue.getPuntoAcopioDonaciones() %>" required disabled>
                                    </div>
                                </div>

                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <button type="button" class="btn btn-personal" id="editarBtn">Editar datos</button>
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

    <script src="<%=request.getContextPath()%>/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Referencias a los inputs y al botón
        const editarBtn = document.getElementById('editarBtn');
        const inputs = document.querySelectorAll('#cantidad_animales, #espacios_disponibles, #punto_acopio');

        // Estado inicial: false (no en modo edición)
        let modoEdicion = false;

        // Evento de clic para alternar entre editar y guardar
        editarBtn.addEventListener('click', () => {
            modoEdicion = !modoEdicion; // Alterna el modo

            if (modoEdicion) {
                editarBtn.textContent = 'Guardar'; // Cambia el texto a "Guardar"
                inputs.forEach(input => input.disabled = false); // Habilita los inputs
            } else {
                editarBtn.textContent = 'Editar datos'; // Cambia el texto a "Editar datos"
                inputs.forEach(input => input.disabled = true); // Deshabilita los inputs
                // Envía el formulario
                document.getElementById('uploadForm').submit();
            }
        });
    </script>
    <script>
        //Limita la cant digitos de números
        const numeroInput2 = document.getElementById('cantidad_albergados')
        numeroInput2.addEventListener('input', function(){
            if(this.value.length > 3){
                this.value = this.value.slice(0,3);
            }
        })

    </script>
    <script>
        //Limita la cant digitos de números
        const numeroInput3 = document.getElementById('espacios_nuevos')
        numeroInput2.addEventListener('input', function(){
            if(this.value.length > 3){
                this.value = this.value.slice(0,3);
            }
        })

    </script>


</body>
</html>