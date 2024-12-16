<%@ page import="com.example.iwebproyecto.beans.SolicitudTemporal" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="java.util.Objects" %>
<%@ page import="com.example.iwebproyecto.beans.CoordinadorZona" %>
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
    <title>Marcus - Solicitud de mascota perdida</title>
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
                <%
                    CoordinadorZona coor= (com.example.iwebproyecto.beans.CoordinadorZona) request.getSession().getAttribute("CoordinadorZona");
                %>
                <div class="welcome-text">Hola, Coordinador <%=coor.getZona().getNombreZona()%></div>
            </div>
            <div class="logo"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="${pageContext.request.contextPath}/coordinador/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaSolicitudes" title="Solicitudes de hogar temporal"><i class="fi-rr-subscription-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaTemporales" title="Hogares temporales"><i class="fi-rr-user-check"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes" title="Solicitudes de mascota perdida"><i class="fi fi-rr-paw" <%-- style="color: #000;" --%>></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaPublicaciones" title="Publicaciones de mascota perdida"><i class="fi-rr-pets"></i></a></li>

                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            <div id="menu" class="menu">
                <a href="${pageContext.request.contextPath}/coordinador/miPerfil.jsp">Mi Perfil</a>
                <hr>
                <a href="${pageContext.request.contextPath}/ListaSolicitudes">Solicitudes de hogar temporal</a>
                <a href="${pageContext.request.contextPath}/ListaTemporales">Comentarios de hogares temporales</a>
                <hr>
                <a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes">Solicitudes de mascota perdida</a>
                <a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaPublicaciones">Publicaciones de mascota perdida</a>
                <hr>
                <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>

            </div>



            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="col" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <%
                        PublicacionMascotaPerdida sol = (PublicacionMascotaPerdida) request.getSession().getAttribute("VerSolicitudMascotaPerdida");

                    %>
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">

                        <% String quitar = (String) request.getSession().getAttribute("quitar3");
                            if (quitar == null){

                        %>

                        <a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes" style="color: black;"><button type="button" class="btn btn-personal2"> Regresar </button></a>

                        <%
                        }else{

                        %>

                        <form action="${pageContext.request.contextPath}/FiltrosCoordinador?action=SolicitudesPerdidas" method="post" style="display: inline;">
                            <button type="submit" class="btn btn-personal2">
                                Regresar
                            </button>
                        </form>
                        <%
                            } %>



                    </div>

                    <%
                        if (quitar == null){

                    %>

                    <h1 class="card-title" style="margin-top: 10px; margin-bottom: 10px; text-align: center;margin-bottom: 20px;">Solicitud de Mascota Perdida</h1>

                    <%
                    }else{

                    %>

                    <h1 class="card-title" style="margin-top: 10px; margin-bottom: 10px; text-align: center;margin-bottom: 20px;">Solicitud de Mascota Perdida Rechazada</h1>

                    <%
                        } %>


                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center;">
                            <h2 class="card-title" style="margin-top: 10px;"><%=sol.getNombreMascota()%></h2>

                            <div class="col">
                                <div id="carouselEvento" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                
                                            <div class="d-flex justify-content-center">
                                                <div class="card" style="width: 80%;">
                                                    
                                                        <div class="col">
                                                            <img src="${pageContext.request.contextPath}<%=sol.getFoto().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="height: 400px;width: 100%;">
                                                        </div>
                                            
                                                    
                                                </div>
                                            </div>
                                       
                                </div>
                            </div>
                                                       
                            <p class="card-text" style="margin-top: 30px;">Solicitud enviada el <%=sol.getFechaFormulario()%></p>
                            <hr>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">                         
                                    <label for="Descripcion">Descripción</label>
                                    <input type="text" class="form-control" placeholder="Ingrese una breve descripción" id="Descripcion" name="Descripcion" maxlength="300" required disabled value="<%=sol.getDescripcion()%>">
                                </div>
                            </div>
                            <!--Segunda columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-5 p-1"> 
                                    <label for="nombre-mascota">Nombre</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el nombre de su mascota" id="nombre-mascota" name="nombre-mascota" maxlength="24" required disabled value="<%=sol.getNombreMascota()%>">
                                </div>
                                <div class="col-md-5 p-1"> 
                                    <label for="distintivo">Distintivo</label>
                                    <input type="text" class="form-control" placeholder="Ingrese el distintivo de su mascota" id="distintivo" name="distintivo" maxlength="30" required disabled value="<%=sol.getDistintivo()%>">
                                </div>
                                <div class="col-md-2 p-1">
                                    <label for="edad-mascota">Edad (años)</label>
                                    <input type="number" class="form-control" id="edad-mascota" min="1" max="20" placeholder="En años" required disabled value="<%=sol.getEdadMascota()%>">
                                </div>
                            </div>
                            
                            <!--Tercera columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label >Tamaño</label>
                                    <select class="form-select" id="Tamaño" aria-label="Floating label select example" required disabled>
                                        <option value="" disabled>Seleccione una opción</option>
                                        <option selected><%=sol.getTamanio()%></option>

                                    </select>
                                    
                                </div>
                                <div class="col-md-6 p-1">
                                    <label >Especie</label>
                                    <select class="form-select" id="Especies" aria-label="Floating label select example" required disabled>
                                        <option  selected><%=sol.getEspecie()%></option>
                                    </select>
                                </div>
                                
                            </div>
                            <!--Cuarta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label >Raza</label>
                                    <select class="form-select" id="Razas" aria-label="Floating label select example" required disabled>
                                    <option value=""><%=sol.getRaza()%></option>
                                  </select>
                                </div>

                            </div>
                            <!--Sexta columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">                         
                                    <label for="Descripcion-mascota">Descripción adicional</label>
                                    <input type="text" class="form-control" placeholder="Ingrese la descripción de su mascota" id="Descripcion-mascota" name="Descripcion-mascota" maxlength="300" required disabled value="<%=sol.getDescripcionAdicional()%>">
                                </div>
                            </div>
                            <!--Septima columna de selección-->
                            <div class="row justify-content-center p-1">
                                <div class="col-md-8 p-1">
                                    <label>Lugar de pérdida</label>
                                    <input type="text" class="form-control" placeholder="Ingrese la dirección o lugar de perdida" maxlength="100" id="Direccion" name="Direccion-perdida" required disabled value="<%=sol.getLugarPerdida()%>">
                                </div>
                                <div class="col-md-4 p-1">
                                    <label for="hora-perdida">Hora aproximada de perdida</label>
                                    <input type="time" class="form-control" id="hora-perdida" required disabled value="<%=sol.getHoraPerdida()%>">
                                </div>
                            </div>
                            <!--Octava columna de selección-->
                            <div class="row justify-content-center p-1" >
                                <div class="col-6 p-1"> 
                                    <label for="nombre-contacto">Nombre de contacto</label>
                                    <input type="text" class="form-control" placeholder="Ingrese su nombre completo para contactarlo" id="nombre-contacto" name="nombre-contacto" maxlength="70" required disabled value="<%=sol.getNombreContacto()%>">
                                </div>
                                <div class="col-4 p-1">
                                    <label for="monto-recompensa">Indique el monto (soles)</label>
                                    <input type="number" class="form-control"  id="monto-recompensa" min="50" max="800" placeholder="Ingrese un número" required disabled value="<%=sol.getMontoRecompensa()%>">
                                </div>
                            </div>


                            <%
                                if (quitar == null){

                            %>

                            <form action="AceptarSolicitudMascotaPerdida" method="POST">
                                <input id="id" type="hidden" name="id" value="<%=sol.getPublicacionMascotaPerdidaID()%>">
                                <input type="hidden" id="accion" name="accion" value="">
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1 d-flex justify-content-center">
                                        <button type="button" class="btn btn-personal" onclick="abrirPopup('popup', '¿Seguro que desea aceptar esta solicitud?', 'aceptar')">ACEPTAR</button>
                                    </div>
                                    <div class="col-md-6 p-1 d-flex justify-content-center">
                                        <button type="button" class="btn btn-personal" onclick="abrirPopup('popup', '¿Seguro que desea rechazar esta solicitud?', 'rechazar')">RECHAZAR</button>
                                    </div>
                                </div>
                            </form>

                            <div class="row justify-content-center p-1" id="razonDiv" style="display: none;">
                                <div class="col-md-12 p-1">
                                    <label for="razon">Razón del rechazo:</label>
                                    <input type="text" class="form-control" id="razon" placeholder="Escriba la razón" />
                                </div>
                            </div>

                            <%
                            }else{

                            %>

                            <br>

                            <%
                                } %>


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

    <div id="popup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <h2 id="mensaje-popup"></h2>
            <div class="popup-buttons">
                <button class="btn-confirmar" onclick="enviarFormulario()">Confirmar</button>
                <button class="btn-cancelar" onclick="cerrarPopup('popup')">Cancelar</button>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        let accionSeleccionada = '';

        function abrirPopup(popupId, mensaje, accion) {
            accionSeleccionada = accion; // Guardar la acción
            document.getElementById('mensaje-popup').textContent = mensaje;
            document.getElementById(popupId).style.display = 'block';
        }

        function cerrarPopup(popupId) {
            document.getElementById(popupId).style.display = 'none';
        }

        function enviarFormulario() {
            document.getElementById('accion').value = accionSeleccionada; // Establecer la acción seleccionada
            document.querySelector('form').submit(); // Enviar el formulario
        }
    </script>


    
</body>
</html>