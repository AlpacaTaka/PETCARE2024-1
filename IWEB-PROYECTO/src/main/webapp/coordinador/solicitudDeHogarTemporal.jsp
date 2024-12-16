<%@ page import="com.example.iwebproyecto.beans.SolicitudTemporal" %>
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
    <title>Solicitud de hogar temporal</title>
    <style>
        #contenido-nofooter {
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
        <div class="barside">
            <ul class="navlinks">
                <li><a href="${pageContext.request.contextPath}/coordinador/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/ListaSolicitudes" title="Solicitudes de hogar temporal"><i class="fi-rr-subscription-user" <%-- style="color: #000;" --%>></i></a></li>
                <li><a href="${pageContext.request.contextPath}/ListaTemporales" title="Hogares temporales"><i class="fi-rr-user-check"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes" title="Solicitudes de mascota perdida"><i class="fi fi-rr-paw"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaPublicaciones" title="Publicaciones de mascota perdida"><i class="fi-rr-pets"></i></a></li>

                <li id="cerrar-sesion"><a href="<%=request.getContextPath()%>" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
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
            <a href="<%=request.getContextPath()%>">Cerrar Sesión</a>

        </div>

        <div class="container-fluid d-flex" id="contenido-principal">
            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <% String quitar = (String) request.getSession().getAttribute("quitar");
                    SolicitudTemporal sol = (SolicitudTemporal) request.getSession().getAttribute("VerSolicitudTemporal"); %>

                <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">

                    <%
                        if (quitar == null){

                    %>

                    <a href="${pageContext.request.contextPath}/ListaSolicitudes" style="color: black;"><button type="button" class="btn btn-personal2"> Regresar </button></a>
                    <%
                    }else{

                    %>

                    <form action="${pageContext.request.contextPath}/FiltrosCoordinador?action=SolicitudesHogares" method="post" style="display: inline;">
                        <button type="submit" class="btn btn-personal2">
                            Regresar
                        </button>
                    </form>

                    <%
                        } %>



                </div>

                <div>
                    <%if (quitar == null){
                    %>
                    <h1 class="text-center">Revisar Solicitud de Hogar Temporal</h1>
                    <%
                    } else{

                    %>
                    <h1 class="text-center">Solicitud de Hogar Temporal Rechazada</h1>
                    <%
                        }%>
                </div>



                <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; margin-top: 30px;">

                    <h4 style="margin-top: 10px;" class="text-center"><%=sol.getUsuario().getNombre()%> <%=sol.getUsuario().getApellido()%></h4>
                    <div class="row">
                        <div class="col">
                            <div id="carouselEvento" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                <div class="carousel-inner" >

                                    <!-- Primera tarjeta -->
                                    <div class="carousel-item active">
                                        <div class="d-flex justify-content-center">
                                            <div class="card" style="width: 80%;">

                                                <div class="col">
                                                    <img src="${pageContext.request.contextPath}<%=sol.getFoto().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="height: 400px;width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Segunda tarjeta -->
                                    <div class="carousel-item">
                                        <div class="d-flex justify-content-center">
                                            <div class="card" style="width: 80%;">

                                                <div class="col">
                                                    <img src="${pageContext.request.contextPath}<%=sol.getFoto2().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="height: 400px; width: 100%;">
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                    <!-- Tercera tarjeta -->
                                    <div class="carousel-item">
                                        <div class="d-flex justify-content-center">
                                            <div class="card" style="width: 80%;">

                                                <div class="col">
                                                    <img src="${pageContext.request.contextPath}<%=sol.getFoto3().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="height: 400px;width: 100%;">
                                                </div>


                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Controles -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselEvento" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselEvento" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>

                                <!-- Indicadores -->
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselEvento" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center p-1">

                        <div class="col-md-6 p-1">
                            <label >Edad:</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getEdad()%>" disabled>
                        </div>
                        <div class="col-md-6 p-1">
                            <label>Género:</label>
                            <input type="text" class="form-control" placeholder="<%=sol.getGenero()%>" disabled>
                        </div>

                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >Celular:</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getCelular()%>" disabled>
                        </div>
                        <div class="col-md-6 p-1">
                            <label >Distrito:</label>
                            <input type="text" class="form-control" placeholder="<%=sol.getUsuario().getDistrito().getNombreDistrito()%>" disabled>
                        </div>
                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-12 p-1">
                            <label >Dirección:</label>
                            <input type="text" class="form-control" placeholder="<%=sol.getUsuario().getDireccion()%>" disabled>
                        </div>
                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >Cantidad de cuartos:</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getCantidadCuartos()%>" disabled>
                        </div>
                        <div class="col-md-6 p-1">
                            <label >Metraje de vivienda (en m²):</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getMetrajeVivienda()%>" disabled>
                        </div>
                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label>¿Tiene mascotas?</label>
                            <% if (sol.getTieneMascotas()==1){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="mascotas"  checked disabled>
                                    <label class="form-check-label" >Sí</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="mascotas"  disabled>
                                    <label class="form-check-label" >No</label>
                                </div>
                            </div>
                            <%

                                } %>
                            <% if (sol.getTieneMascotas()==0){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="mascotas" disabled>
                                    <label class="form-check-label" >Sí</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="mascotas" checked disabled>
                                    <label class="form-check-label" >No</label>
                                </div>
                            </div>
                            <%

                                } %>
                        </div>

                        <% if (sol.getTieneMascotas()==1){

                        %>
                        <div class="col-md-6 p-1">
                            <label >Cantidad de mascotas</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getCantidadMascota()%>" disabled>
                        </div>
                        <%
                            } %>

                        <% if (sol.getTieneMascotas()==0){

                        %>
                        <div class="col-md-6 p-1">
                            <label >Cantidad de mascotas</label>
                            <input type="number" class="form-control" placeholder="" disabled>
                        </div>
                        <%
                            } %>

                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >¿Tiene hijos?</label>
                            <% if (sol.getTieneHijos()==1){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="hijos" id="hijosSi" checked disabled>
                                    <label class="form-check-label" for="hijosSi">Sí</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="hijos" id="hijosNo" disabled>
                                    <label class="form-check-label" for="hijosNo">No</label>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <% if (sol.getTieneHijos()==0){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="hijos"  disabled>
                                    <label class="form-check-label" for="hijosSi">Sí</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="hijos" checked  disabled>
                                    <label class="form-check-label" for="hijosNo">No</label>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <div class="col-md-6 p-1">
                            <label >¿Vive solo o con dependientes?</label>
                            <% if (sol.getViveSolo()==1){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes" id="solo" checked disabled>
                                    <label class="form-check-label" for="solo">Solo</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes" id="conDependientes" disabled>
                                    <label class="form-check-label" for="conDependientes">Con dependientes</label>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <% if (sol.getViveSolo()==0){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes" disabled>
                                    <label class="form-check-label" for="solo">Solo</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes"  checked disabled>
                                    <label class="form-check-label" for="conDependientes">Con dependientes</label>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >¿Modalidad de trabajo?</label>
                            <% if (sol.getTrabajaRemoto()==1){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes"  checked disabled>
                                    <label class="form-check-label" for="solo">Remoto</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes" disabled>
                                    <label class="form-check-label" for="conDependientes">Presencial</label>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <% if (sol.getTrabajaRemoto()==0){

                            %>
                            <div class="col-md-12 d-flex justify-content-around align-self-center">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes"   disabled>
                                    <label class="form-check-label" for="solo">Remoto</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" name="dependientes" checked disabled>
                                    <label class="form-check-label" for="conDependientes">Presencial</label>
                                </div>
                            </div>
                            <%
                                }
                            %>

                        </div>
                        <div class="col-md-6 p-1">
                            <label >Persona de referencia:</label>
                            <input type="text" class="form-control" placeholder="<%=sol.getNombrePersonaReferencia()%>" disabled>
                        </div>
                    </div>

                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >Celular de la persona de referencia:</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getNumeroContactoPR()%>" disabled>
                        </div>
                        <div class="col-md-6 p-1">
                            <label >Tiempo de temporal (en meses):</label>
                            <input type="number" class="form-control" placeholder="<%=sol.getTiempoTemporal()%>" disabled>
                        </div>
                    </div>

                    <div class="row justify-content-center p-1">
                        <div class="col-md-6 p-1">
                            <label >Rango de fechas:</label>
                            <input type="date" class="form-control" value="<%=sol.getInicioTemporal()%>" disabled>
                        </div>
                        <div class="col-md-6 p-1">
                            <label ></label>
                            <input type="date" class="form-control" value="<%=sol.getFinTemporal()%>" disabled>

                        </div>
                    </div>

                    <hr>
                    <%
                       System.out.println(quitar);
                        if (quitar == null) {

                    %>

                    <label  style="margin-bottom: 10px;" ><strong>Indique si se ha comunicado por teléfono con el postulante y si ha realizado una visita inopinada (indicando el día y la hora):</strong></label>

                        <form action="AceptarSolicitudHogarTemporal" method="POST">
                            <input id="id" type="hidden" name="id" value="<%=sol.getSolicitudID()%>">
                    <textarea id="comunicacion" name="comunicacion" class="form-control" maxlength="300" placeholder="Escriba aquí..." rows="4" required></textarea>
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
                    <% }
                    %>

                    <% SolicitudTemporal com = (SolicitudTemporal) request.getSession().getAttribute("VerComentario");
                        if (quitar != null){
                    %>
                        <div class="row justify-content-center p-1">
                            <div class="col align-items">
                                <p class="card-text" style="text-align: left; background-color:#4D0E0E ; border-radius: 15px;padding: 10px; color:white;">
                                     <strong>Coordinador de zona <%=com.getUsuario().getDistrito().getZona().getNombreZona()%>:</strong><br><%=com.getComentario()%>
                                </p>
                            </div>
                        </div>
                        <br>
                    <%
                        }
                        session.setAttribute("quitar", null);%>




                </div>
            </div>
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
