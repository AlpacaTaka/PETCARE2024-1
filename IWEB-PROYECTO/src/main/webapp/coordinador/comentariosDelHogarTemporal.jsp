<%@ page import="com.example.iwebproyecto.beans.SolicitudTemporal" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSSDELAPAGINA.css">
    <title>Comentarios de hogar temporal</title>
    <style>
        
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/ 
        #contenido-nofooter{
            border-radius: 50px;
            height: 100%;
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
                <div class="welcome-text">Hola, Coordinador Zona Norte</div>
            </div>
            <div class="logo"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="${pageContext.request.contextPath}/coordinador/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaSolicitudes" title="Solicitudes de hogar temporal"><i class="fi-rr-subscription-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaTemporales" title="Comentarios de hogares temporales"><i class="fi fi-rr-comment"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida" title="Solicitudes de mascota perdida"><i class="fi-rr-piggy-bank-budget"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/listaPublicacionesDeMascotaPerdida.html" title="Publicaciones de mascota perdida"><i class="fi-rr-pets"></i></a></li>

                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            <div id="menu" class="menu">
                <a href="miPerfil.jsp">Mi Perfil</a>
                <hr>
                <a href="listaSolicitudesDeHogarTemporal1.jsp">Solicitudes de hogar temporal</a>
                <a href="listaHogaresTemporales.jsp">Comentarios de hogares temporales</a>
                <hr>
                <a href="listaSolicitudesDeMascotaPerdida.jsp">Solicitudes de mascota perdida</a>
                <a href="listaPublicacionesDeMascotaPerdida.html">Publicaciones de mascota perdida</a>
                <hr>
                <a href="#">Cerrar Sesión</a>

            </div>



            <div class="container-fluid d-flex" id="contenido-principal">

                <%
                    SolicitudTemporal sol = (SolicitudTemporal) request.getSession().getAttribute("VerHogarTemporal");
                    String color="";

                    if("Activo".equals(sol.getEstadoTemporal())){
                        color = "rgb(4, 181, 4)";
                    }else{
                        color = "rgb(181, 4, 4)";
                    }
                %>


                <div class="col" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <a href="listaHogaresTemporales.jsp" style="color: black;"><button type="button" class="btn btn-personal2"> Regresar </button></a>
                    </div>

                    
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center;">
                            <h2 class="card-title" style="margin-top: 10px;"><%=sol.getUsuario().getNombre()%> <%=sol.getUsuario().getApellido()%></h2>
                            <h5 class="card-title" style="margin-top: 10px; color: <%=color%>; text-align: left;"><%=sol.getEstadoTemporal()%></h5>

                            <div class="row">
                                <div class="col" style="margin-bottom:15px;">

                                    <div style="display: flex; justify-content: center; margin-top: 2%; min-width: 200px; ">
                                        <img src="/common/img/solTemporales/st10.jpg" class="card-img-top" alt="..." style="min-width: 250px ; min-height: 300px; object-fit: cover;">
                                    </div>
                                    

                                </div>

                                <div class="col" >
                                    <div>
                                        <div class="row" style="text-align: left;">
                                            <div class="col-sm-6 col-md-7"><strong>DNI: </strong></div>
                                            <div class="col-6 col-md-6"style="word-wrap: break-word;"><%=sol.getUsuario().getDni()%> </div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col-sm-6 col-md-7"><strong>Dirección: </strong></div>
                                            <div class="col-6 col-md-6"><%=sol.getUsuario().getDireccion()%> </div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col-sm-6 col-md-7"><strong>Distrito:</strong></div>
                                            <div class="col-6 col-md-6"><%=sol.getUsuario().getDistrito().getNombreDistrito()%></div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col-sm-6 col-md-7"><strong>Correo Electrónico:</strong></div>
                                            <div class="col-6 col-md-6"style="word-wrap: break-word;"><%=sol.getUsuario().getCorreoElectronico()%></div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col-sm-6 col-md-7"><strong>Número de celular:</strong></div>
                                            <div class="col-6 col-md-6"><%=sol.getCelular()%></div>
                                        </div>
                                        <hr>
                                    </div>
                                    
                                
                                </div>   
                                <div class="row">
                                    <div class="row" style="text-align: center; margin-bottom: 15px; margin-top: 10px;">
                                        <div class="col-8"><strong>Número de veces que rechazó una solicitud de adopción: </strong> <%=sol.getNumeroRechazos()%></div>
                                        
                                    </div>
                                </div> 
                                <hr>
                                
                                
                                
                            </div>
                            <p class="card-text" style="text-align: left; display: flex; "><strong>COMENTARIOS: </strong></p>

                            <%
                                if (sol.getComentario() == null){

                            %>

                            <div class="row justify-content-center p-1">
                                <div class="col align-items">
                                    <p class="card-text" style="text-align: left; background-color:#4D0E0E ; border-radius: 15px;padding: 10px; color:white">
                                        <strong>No hay comentarios.</strong><br>
                                    </p>
                                </div>
                            </div>
                            <%
                                }else {
                            %>
                            <div class="row justify-content-center p-1">
                                <div class="col align-items">
                                    <p class="card-text" style="text-align: left; background-color:#4D0E0E ; border-radius: 15px;padding: 10px; color:white">
                                        <strong>Coordinador de zona <%=sol.getUsuario().getDistrito().getZona().getNombreZona()%>:</strong><br><%=sol.getComentario()%>
                                    </p>
                                </div>

                            </div>
                            <%
                                }
                            %>

                                <!-- 
                                <div class="col-md-2 p-1" style="text-align: center;">
                                    <button type="submit" class="btn btn-personal2">Ir a publicación</button>
                                </div>
                                <div class="col-md-2 p-1 align-items" style="text-align: center;">
                                    <button type="submit" class="btn btn-personal2">Marcar Comentario</button>
                                </div>-->

                            <!-- 
                                <div class="col-md-2 p-1" style="text-align: center;">
                                    <button type="submit" class="btn btn-personal2">Ir a publicación</button>
                                </div>
                                <div class="col-md-2 p-1 align-items" style="text-align: center;">
                                    <button type="submit" class="btn btn-personal2">Marcar Comentario</button>
                                </div>-->

                            <% if("Activo".equals(sol.getEstadoTemporal())){

                             %>
                            <div class="row justify-content-end">
                                <div class="col-md-6 p-1 align-items" style="margin-bottom: 10px;">
                                    <button type="submit" class="btn btn-personal" id="realizarComentario" onclick="abrirPopup()"> DESACTIVAR POR MAL COMPORTAMIENTO</button>
                                </div>
                            </div>
                            <% } else {%>
                            <!--
                                <div class="row justify-content-end">
                                    <div class="col-md-6 p-1 align-items" style="margin-bottom: 10px;">
                                        <button type="submit" class="btn btn-personal" onclick="abrirPopup()" > ACTIVAR </button>
                                    </div>
                                </div>
                            -->
                            <% } %>

    
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

    <div id="popup" class="popup-overlay">
        <div class="popup-content">
        <h2>¿Seguro que desea desactivar el hogar temporal?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="desactivarHogarTemporal(<%=sol.getSolicitudID()%>)">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopup()">Cancelar</button>
        </div>
        </div>
      </div>

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        // Función para abrir el popup
        function abrirPopup() {
            document.getElementById('popup').style.display = 'block';
        }

        // Función para cerrar el popup
        function cerrarPopup() {
            document.getElementById('popup').style.display = 'none';
        }

        // Función de confirmación (puedes agregar la lógica de eliminación aquí)
        function confirmarAccion() {
            alert('Has desactivado el hogar temporal.');
            cerrarPopup();
        }


        function desactivarHogarTemporal(solicitudID) {
        // Crear un formulario dinámicamente
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'DesactivarHogarTemporal';

        // Crear el input hidden para el ID
        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'id';
        input.value = solicitudID;

        // Añadir el input al formulario
        form.appendChild(input);

        // Añadir el formulario al body y enviarlo
        document.body.appendChild(form);
        form.submit();
        }

    </script>


</body>
</html>