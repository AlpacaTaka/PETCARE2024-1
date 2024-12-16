<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.iwebproyecto.beans.EventoBenefico" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.LocalDate" %>
<jsp:useBean id="UsuarioSession" class="com.example.iwebproyecto.beans.Usuario" scope="session" />
<jsp:useBean id="evento" class="com.example.iwebproyecto.beans.EventoBenefico" scope="request" />
<%
DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("dd MMM.").withLocale(new Locale("es", "ES"));
DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("hh:mm a").withLocale(new Locale("es", "ES"));
LocalDate fechaEvento = evento.getFechaEvento();  // Obtener la fecha del evento
LocalTime horaEvento = evento.getHoraInicio();    // Obtener la hora del evento

// Formatear la fecha y la hora
String fechaFormateada = fechaEvento.format(formatoFecha);
String horaFormateada = horaEvento.format(formatoHora);
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
    <title>Evento CANinaton 5K</title>
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
            <div class="logo"><a href="/user/inicio.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="${pageContext.request.contextPath}/MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosEventos" title="Eventos"><i class="fi-rr-calendar-star" style="color: #000;"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PostulacionTemporal" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/SolicitudesDeSuministros" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosAlbergues" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/Inicio" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>

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
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 50px;">
                            <h2 class="card-title" style="margin-top: 10px;"><%=evento.getNombre()%></h2>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="${pageContext.request.contextPath}/<%=evento.getFoto().getRutaFoto()%>"
                                     class="card-img-eve"
                                     alt="Imagen"
                                     style="width: 100%; max-width: 60%; height: auto; border-radius: 15px;"
                                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                                <div class="placeholder bg-secondary text-white text-center"
                                     style="width: 100%; max-width: 60%; height: auto; padding: 20px; border-radius: 15px; display: none;">
                                    Imagen no disponible
                                </div>
                            </div>

                            <div class="badge text-bg-primary text-wrap" style="margin-top: 10px; font-size: 1.5rem; padding: 10px 20px;">
                                <%= fechaFormateada + " " + horaFormateada %>
                            </div>                            
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getDescripcionEvento()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Artistas e Invitados Especiales:</strong></p>
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getInvitados()%></p>
                            <p class="card-text" style="text-align: left;"><strong>Donación para la entrada al Evento:</strong></p>
                            <% if ("Monetario".equals(evento.getTipoDonacion())) { %>
                            <p class="card-text" style="text-align: left;"><strong>Valor de Entrada:</strong> S/ <%= evento.getDetalleMonetario() %></p>
                            <p class="card-text" style="text-align: left;">Recuerde que debe de cancelar su entrada al llegar al evento o a través del contacto directo con el Albergue</p>

                            <p class="card-text" style="text-align: left;"><strong>Contacto:</strong> <%= evento.getAlbergue().getNumeroContactoDonaciones() %></p>
                            <% } else if ("Suministros".equals(evento.getTipoDonacion())) { %>
                            <p><strong>Donación Solicitada:</strong> <%= evento.getDetalleSuministro() %></p>
                            <% } %>
                            <p class="card-text" style="margin-top: 10px; text-align: left;"> </p>
                            <p class="card-text" style="text-align: left;"><strong>Finalidad del Evento:</strong></p>
                            <p class="card-text" style="margin-top: 10px;"><%= evento.getRazonEvento()%></p>
                            <hr>
                            <p class="card-text" style="margin-top: 10px;">La gestión de su donación como entrada será usada para la finalidad con la que se creo el evento. Ayudanos a seguir ayudando.</p>
                                                       
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <form action="TodosLosEventos" method="post">
                                        <input type="hidden" name="idEvento" value="<%= evento.getEventoAlbergueID()%>"/>
                                        <button type="submit" class="btn btn-personal d-flex"  style="font-size: 19px;">Inscribirse</button>
                                    </form>

                                </div>

                            </div>  
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
    <dialog id="confirm-donacion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none; justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;border-style:dashed; border-radius: 20px;border-color: black;padding: 10px;border-width: 2px;">
            <h2 style="color: #721313;"><italic>Confirma tu entrada</italic></h2>
            <span class="fi-rr-form" style="font-size: 70px;"></span>
            <p> Esta es la información sobre lo que el albergue organizador estableció como requerimiento para la entrada al evento, de no entregar esto en la puerta del evento no se permitirá su ingreso</p>
            <form id="suministroForm" onsubmit="handleFormSubmit(event)">
                <!--Primera columna de selección-->
                <div class="row justify-content-center p-2">
                    <div class="col-md-7 p-1">                         
                        <label for="tipo-donacion" style="font-size: 14px; font-weight: bold;">Tipo de sumnistro</label>
                        <input type="text" class="form-control" placeholder="Ingrese la donación a realizar" value="<%=evento.getDetalleSuministro()%>" id="tipo-donacion" name="tipo-donacion" maxlength="20" disabled>
                    </div>
                    <div class="col-md-4 p-1">
                        <label for="cantidad" style="font-size: 14px; font-weight: bold;">Cantidad</label>
                        <input type="number" class="form-control" placeholder="Cantidad" value="5" id="cantidad" name="cantidad" maxlength="2" >
                    </div>
                </div>
                <!--Segunda columna de selección-->
                <div class="row justify-content-center p-2">
                    <div class="col-md-11 p-1">
                        <label for="punto-acopio" style="font-size: 14px; font-weight: bold;">Lugar de entrega</label>
                        <select class="form-select" id="punto-acopio" aria-label="Floating label select example" disabled>
                            <option value="" disabled >Seleccione un lugar</option>
                            <option value="1" disabled selected><%=evento.getLugar().getDireccionLugar()%></option>
                            <option value="2" disabled>2</option>
                            <option value="3" disabled>3</option>
                          </select>
                    </div>
                </div>
                    <button type="submit" class="btn btn-personal"> Enviar </button>
            </form>
        </div>
    </dialog>

    <!-- Pop-up de confirmación -->
    <dialog id="confirm-envio" style="max-width: 400px; border-radius: 20px; background-color: #fca651e1; border: none; justify-content: center;">
        <div class="pop-up-content" style="text-align: center; padding: 0px 15px;padding: 10px;">
            <h2 style="color: #721313;">¡Confirmación de entrada!</h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p>Tu entrada ha sido recibida con éxito. ¡Gracias por tu colaboración!</p>
            <button onclick="closeEnvioDialog()" class="btn btn-personal">Cerrar</button>
        </div>
    </dialog>
    
</body>
</html>

<script src="/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    const donacionDialog = document.getElementById("confirm-donacion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");
    const confirmEnvioDialog = document.getElementById("confirm-envio");
    const contenidoEnvio = confirmEnvioDialog.querySelector(".pop-up-content");

    function showDonarSumDialog(){
        donacionDialog.showModal();
    }

    function closeDonacionDialog(){
        donacionDialog.close();
    }

    function closeEnvioDialog() {
        confirmEnvioDialog.close(); // Cierra el diálogo de confirmación
    }

   // Cerrar el pop-up de confirmación al hacer clic fuera del contenido
   confirmEnvioDialog.addEventListener("click", (e) => {
        if (!contenidoEnvio.contains(e.target)) {
            closeEnvioDialog();
        }
    });

    // Cerrar el diálogo de donación al hacer clic fuera del contenido
    donacionDialog.addEventListener("click", (e) => {
        if (!contenidoPopDialog.contains(e.target)) {
            closeDonacionDialog();
        }
    });

    function handleFormSubmit(event) {
        event.preventDefault(); // Previene el comportamiento por defecto del formulario
        closeDonacionDialog(); // Cierra el diálogo de donación

        // Muestra el diálogo de confirmación
        confirmEnvioDialog.showModal();        

        return false; // Asegúrate de no enviar el formulario de manera tradicional
    }

</script>

<script>
    const tipoDonacionInput = document.getElementById('tipo-donacion');
    const fechaEntregaInput = document.getElementById('fechaEntrega');
    const cantidadInput = document.getElementById('cantidad')

    // Validar que solo se ingresen letras
    tipoDonacionInput.addEventListener('input', function() {
                this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    // Deshabilitar la entrada manual de texto
    fechaEntregaInput.addEventListener('keydown', function(event) {
                event.preventDefault();
    });

    cantidadInput.addEventListener('input', function() {
        // Convertir el valor a string para verificar la longitud
        const value = cantidadInput.value;

        // Validar que no se exceda la longitud de 1 cifras
        if (value.length > 2) {
            cantidadInput.value = value.slice(0, 2); // Limitar a dos cifras
        }
    });
</script>
