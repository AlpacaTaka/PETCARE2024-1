<%@ page import="com.example.iwebproyecto.beans.SolicitudTemporal" %>
<%@ page import="com.example.iwebproyecto.beans.PublicacionMascotaPerdida" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>
<%@ page import="com.example.iwebproyecto.beans.Comentarios" %>
<%@ page import="java.util.List" %>
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
    <title>Publicación de mascota perdida</title>
    <style>
        /* Esto es solo de referencia para ver su espacio disponible - borrar */
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
                    <li><a href="${pageContext.request.contextPath}/ListaSolicitudes" title="Solicitudes de hogar temporal"><i class="fi-rr-subscription-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaTemporales" title="Hogares temporales"><i class="fi-rr-user-check"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes" title="Solicitudes de mascota perdida"><i class="fi fi-rr-paw"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaPublicaciones" title="Publicaciones de mascota perdida"><i class="fi-rr-pets" <%-- style="color: #000;" --%>></i></a></li>

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
                <%
                    PublicacionMascotaPerdida sol = (PublicacionMascotaPerdida) request.getSession().getAttribute("VerPubicacionMascotaPerdida");

                %>

                <div class="col" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <a href="${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaPublicaciones" style="color: black;"><button type="button" class="btn btn-personal2"> Regresar </button></a>
                    </div>

                    <h1 class="card-title" style="margin-top: 10px; margin-bottom: 10px; text-align: center;margin-bottom: 20px;">Publicación de Mascota Perdida</h1>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">

                        <div class="card-body" style="width: 100%; text-align: center;">
                            <h2 class="card-title" style="margin-top: 10px; margin-bottom: 15px;"><%=sol.getNombreMascota()%></h2>

                            <div class="row">
                                <div class="col" style="margin-bottom:15px;">
                                    <div style="display: flex; justify-content: center; margin-top: 2%; ">
                                        <img src="${pageContext.request.contextPath}<%=sol.getFoto().getRutaFoto()%>" class="card-img-top" alt="..."
                                            style="min-width: 250px ; min-height: 300px; object-fit: cover;">
                                    </div>
                                </div>

                                <div class="col">
                                    <div style="margin-bottom: 30px;">
                                        <div class="row" style="text-align: left;">
                                            <h5><strong>Resumen:</strong></h5>

                                        </div>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Edad: </strong></div>
                                            <div class="col" style="word-wrap: break-word;"><%=sol.getEdadMascota()%> </div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Raza: </strong></div>
                                            <div class="col"><%=sol.getRaza()%> </div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Distintivo:</strong></div>
                                            <div class="col"><%=sol.getDistintivo()%>.</div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Tamaño:</strong></div>
                                            <div class="col"><%=sol.getTamanio()%></div>
                                        </div>
                                        <hr>

                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Lugar de extravío:</strong></div>
                                            <div class="col"><%=sol.getLugarPerdida()%></div>
                                        </div>
                                        <hr>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Hora de perdida:</strong></div>
                                            <div class="col"><%=sol.getHoraPerdida()%></div>
                                        </div>
                                        <hr>
                                            <%
                                                // Obtenengo la fecha actual
                                                LocalDate fechaActual = LocalDate.now();

                                                // Obtener la fecha de perdida
                                                LocalDate fechaPerdida = sol.getFechaPerdida();

                                                // Convertir la diferencia de milisegundos a días
                                                long diasPerdidos = ChronoUnit.DAYS.between(fechaPerdida, fechaActual);
                                            %>
                                        <div class="row" style="text-align: left;">
                                            <div class="col"><strong>Días perdido: </strong></div>
                                            <div class="col"><%=diasPerdidos%></div>
                                        </div>

                                    </div>

                                </div>
                                <hr>
                                <h5 style="text-align: left;"><strong>Contacto:</strong></h5>
                                <div class="row" style="margin-bottom: 15px;">
                                    <div class="col d-flex flex-column">
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <strong>Nombre de contacto:</strong>
                                            </div>
                                            <div class="col">
                                                <%=sol.getNombreContacto()%>
                                            </div>
                                        </div>
                                        <hr class="mt-auto">
                                    </div>
                                    <div class="col d-flex flex-column">
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <strong>Número de celular:</strong>
                                            </div>
                                            <div class="col">
                                                <%=sol.getTelefonoContacto()%>
                                            </div>
                                        </div>
                                        <hr class="mt-auto">
                                    </div>
                                </div>
                                <div class="row" style="margin-bottom: 15px;">
                                    <div class="col">
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <strong>Correo electrónico:</strong>
                                            </div>
                                            <div class="col">
                                                <%=sol.getUsuario().getCorreoElectronico()%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="row justify-content-between">
                                            <div class="col">
                                                <strong>Recompensa:</strong>
                                            </div>
                                            <% if(sol.getMontoRecompensa()==0){

                                            %>
                                            <div class="col">
                                                Sin recompensa
                                            </div>
                                            <%

                                            }else{%>
                                            <div class="col">
                                                <%=sol.getMontoRecompensa()%>
                                            </div>
                                            <%

                                                }%>
                                        </div>
                                    </div>
                                </div>

                                <hr>

                            </div>
                            <form action="${pageContext.request.contextPath}/EliminarPublicacionMascotaPerdida" method="post">
                                <input type="hidden" name="publicacionMascotaPerdidaID" value="<%=sol.getPublicacionMascotaPerdidaID()%>">
                                <div class="col">
                                    <button type="submit" class="btn btn-personal">ELIMINAR PUBLICACIÓN DUPLICADA</button>
                                </div>
                            </form>

                            <hr>
                            <p class="card-text" style="text-align: left; display: flex; margin-top: 1%;"><strong>COMENTARIOS: </strong></p>

                            <!-- Contenedor de Comentarios -->
                            <div id="comentarios" class="col">
                                <%
                                    List<Comentarios> lista = (List<Comentarios>) request.getSession().getAttribute("comentariosMascotaPerdida");
                                    if (lista != null) {
                                        for (Comentarios coo : lista) {
                                %>


                                <div class="row justify-content-center p-1">
                                    <div class="col align-items">
                                        <p class="card-text" style="text-align: left; background-color: white; border-radius: 15px;padding: 10px;"><strong>Coordinador: <%=coo.getCoordinadorZona().getNombre()%> <%=coo.getCoordinadorZona().getApellido()%></strong><br><%=coo.getComentarios()%></p>
                                    </div>
                                </div>
                                <!--
                                <div class="row justify-content-center p-1">
                                    <div class="col align-items">
                                        <p class="card-text" style="text-align: left; background-color: white; border-radius: 15px;padding: 10px;"><strong>Rosa:</strong><br>Alguien dijo haber visto a Oscar cerca de la tienda de comestibles. Sería buena idea ir para allá.</p>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col align-items">
                                        <p class="card-text" style="text-align: left; background-color: white; border-radius: 15px;padding: 10px;"><strong>Animalover:</strong><br>Oscar fue vista corriendo cerca del lago del parque hace un par de días. Algunas personas intentaron llamarla.</p>
                                    </div>
                                </div>-->
                                <%
                                    }
                                    }
                                %>
                            </div>


                            <% if(!sol.isMascotaEncontrada()){

                            %>
                            <hr>
                            <form action="VerPubicacionMascotaPerdida" method="POST">
                                <input id="id" type="hidden" name="id" value="<%=sol.getPublicacionMascotaPerdidaID()%>">
                                <div class="col justify-content-center p-1" style="margin-bottom: 5px;">
                                    <div class="row " style="text-align: start; margin-bottom: 10px;">
                                        <strong>Realiza un comentario de actualización:</strong>
                                    </div>

                                    <div class="row" style="margin-bottom: 10px;">
                                        <textarea class="form-control" id="nuevoComentario" name="comentario" rows="3" placeholder="Escribe tu comentario aquí..." required></textarea>
                                    </div>
                                    <div class="row justify-content-end">
                                        <div class="col-md-6 p-1 align-items">
                                            <button type="submit" class="btn btn-personal"  id="realizarComentario"> REALIZAR COMENTARIO</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <%
                            } else {

                            %>
                            <br>
                            <%

                                }%>


                        </div>
                    </div>
                </div>

                <footer class="pt-4">
                    <div class="container">
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
        <h2>¿Seguro que eliminar esta publicación?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccion()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopup()">Cancelar</button>
        </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
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
        alert('Has eliminado la publicación.');
        cerrarPopup();
        }
    </script>

</body>

</html>