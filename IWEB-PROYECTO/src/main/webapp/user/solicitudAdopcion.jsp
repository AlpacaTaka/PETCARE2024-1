
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="mascota" class="com.example.iwebproyecto.beans.MascotasAdopcion" scope="request" />
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />

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
    <title>Solictud de Adopcion - Marcus</title>
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
                <div class="welcome-text">Hola, <%= UsuarioSession.getNombre() %></div>
            </div>
            <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->

            <div class="barside">
                <ul class="navlinks">
                    <li><a href="${pageContext.request.contextPath}/MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosEventos" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PostulacionTemporal" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/SolicitudesDeSuministros" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosAlbergues" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog" style="color: #000;"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/Inicio" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on" ></i></a></li>

                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>                </ul>

            </div>

            <div id="menu" class="menu">
                <a href="${pageContext.request.contextPath}/MiPerfilUsuario">Mi Perfil</a>
                <a href="${pageContext.request.contextPath}/MisEventosUsuario">Mis Eventos</a>
                <a href="${pageContext.request.contextPath}/MisDonacionesUsuario" id="Sep">Mis Donaciones</a>
                <hr>
                <a href="${pageContext.request.contextPath}/TodosLosEventos">Eventos</a>
                <a href="${pageContext.request.contextPath}/PostulacionTemporal">Hogar Temporal</a>
                <a href="${pageContext.request.contextPath}/SolicitudesDeSuministros">Donaciones de Suministros</a>
                <a href="${pageContext.request.contextPath}/TodosLosAlbergues">Donaciones Monetarias</a>
                <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal de Adopciones</a>
                <a href="${pageContext.request.contextPath}/Inicio">Portal de Mascotas Perdidas</a>
                <a href="${pageContext.request.contextPath}/Inicio">Portal Avistamiento Perdidos</a>
                <a href="${pageContext.request.contextPath}/Inicio">Reportar Mascota Perdida</a>
                <a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" class="btn btn-personal2" onclick="window.history.back();"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 45px;">
                            <h2 class="card-title" style="margin-top: 10px;"><%=mascota.getNombreMascota()%></h2>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="${pageContext.request.contextPath}/<%=mascota.getFoto().getRutaFoto()%>" class="card-img-eve" alt="Imagen" style="width: 100%; max-width: 60%; height: auto; border-radius: 15px;"

                                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                                <div class="placeholder bg-secondary text-white text-center"
                                     style="width: 100%; max-width: 60%; height: auto; padding: 20px; border-radius: 15px; display: none;">
                                    Imagen no disponible
                                </div>
                            </div>
                            <p class="card-text" style="text-align: left; margin-top: 10px;"><strong>Raza:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getRaza()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Lugar donde se encontro:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getDireccionHallazgo()%> - <%=mascota.getDistrito().getNombreDistrito()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Descripción:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getDescripcionGeneral()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Edad aproximada:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getEdadAprox()%> año(s)</p>
                            <p class="card-text" style="text-align: left;"><strong>Género:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getSexo()%> </p>
                            <p class="card-text" style="text-align: left;"><strong>¿Se encuentra en un hogar temporal?:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%= mascota.isSeEncuentraTemporal() ? "Sí" : "No" %></p>
                            <p class="card-text" style="text-align: left;"><strong>Condiciones de adopción:</strong> </p>
                            <p class="card-text" style="text-align: center;"><%=mascota.getCondicionesAdopcion()%></p>

                            <%
                                boolean estaInscrito = (boolean) request.getAttribute("estaInscrito");
                            %>

                            <% if (estaInscrito) { %>
                            <!-- Si ya está inscrito -->
                            <button class="btn btn-secondary" disabled>Ya estás inscrito</button>
                            <% } else { %>

                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button onclick="abrirConfirmacionCancelar('<%= mascota.getIdAdopcion()%>')" class="btn btn-personal">Adoptar</button>
                                </div>

                            </div>
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

    <!--Pop up-->
    <dialog id="confirm-adopcion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;"> Solicitud enviada </h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p> Tu solicitud ha sido enviada al albergue, en un plazo de 48 horas se pondrán en contacto contigo vía correo</p>
            <button onclick="closeAdopcionDialog()" class="btn btn-personal"> Cerrar </button>
        </div>
    </dialog>

    <div id="popup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <h2>¿Está seguro de adoptar esta mascota?</h2>
            <form method="POST" action="PortalDeAdopcion" id="adoptar">
                <input type="hidden" name="action" value="adoptar">
                <input type="hidden" name="idMascota" id="eventoIDInput" value="">
                <input type="hidden" name="nombreMascota" value="<%= mascota.getNombreMascota() %>">
                <div class="popup-buttons">
                    <button type="submit" class="btn btn-success">Confirmar</button>
                    <button type="button" class="btn btn-danger" onclick="cerrarConfirmacionCancelar()">Cancelar</button>
                </div>
            </form>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>

<script>
    const adopcionDialog = document.getElementById("confirm-adopcion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");

    function showAdopcionDialog(){
        adopcionDialog.showModal();
    }

    function closeAdopcionDialog(){
        adopcionDialog.close();
    }

    adopcionDialog.addEventListener("click", (e)=> {
        if(!contenidoPopDialog.contains(e.target)){
            adopcionDialog.close();
        }
    })
</script>

<script>
    let eventoIDSeleccionado = null;

    function abrirConfirmacionCancelar(eventoID) {
        eventoIDSeleccionado = eventoID;
        document.getElementById('eventoIDInput').value = eventoIDSeleccionado;
        document.getElementById('popup').style.display = 'block';
    }

    function cerrarConfirmacionCancelar() {
        eventoIDSeleccionado = null;
        document.getElementById('popup').style.display = 'none';
    }





</script>

<script>
    const cancelDialog = document.getElementById("cancel-inscripcion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");

    function showCancelarDialog(){
        cancelDialog.showModal();
    }

    function closeCancelDialog(){
        cancelDialog.close();
    }

    cancelDialog.addEventListener("click", (e)=> {
        if(!contenidoPopDialog.contains(e.target)){
            cancelDialog.close();
        }
    })
</script>