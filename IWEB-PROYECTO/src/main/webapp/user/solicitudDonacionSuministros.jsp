
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="donacionSuministros" class="com.example.iwebproyecto.beans.DonacionSuministros" scope="request" />
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
    <title>Donacion de suministros - Se necesitan camas</title>
    <style>

        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
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
                <div class="welcome-text">Hola, <%= UsuarioSession.getNombre() %></div>
            </div>
            <div class="logo"><a href="${pageContext.request.contextPath}/Inicio"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart" style="color: #000;"></i></a></li>
                    <li><a href="/user/donacionMonetaria.jsp" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="/user/reportarMascotaPerdida.jsp" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                    <li><a href="/user/reportarMaltrato.jsp" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            <div id="menu" class="menu">
                <a href="/user/miPerfil.jsp">Mi Perfil</a>
                <a href="/user/misEventos.jsp">Mis Eventos</a>
                <a href="/user/misDonaciones.jsp" id="Sep">Mis Donaciones</a>
                <hr>
                <a href="/user/allEventos.jsp">Eventos</a>
                <a href="/user/postularTemporal.jsp">Hogar Temporal</a>
                <a href="/user/solicitudesDonacionSuministros.jsp">Donaciones de Suministros</a>
                <a href="/user/donacionMonetaria.jsp">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.jsp">Portal de Adopciones</a>
                <a href="/user/mascotasPerdidas.jsp">Portal de Mascotas Perdidas</a>
                <a href="/user/reportarMascotaPerdida.jsp">Reportar Mascota Perdida</a>
                <a href="/user/reportarMaltrato.jsp" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">

                <%
                    // Obtener la fecha y hora actuales
                    java.util.Date fechaActual = new java.util.Date();
                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.text.SimpleDateFormat timeFormat12Hours = new java.text.SimpleDateFormat("hh:mm a"); // Formato 12 horas con AM/PM
                    java.time.format.DateTimeFormatter timeFormat = java.time.format.DateTimeFormatter.ofPattern("HH:mm:ss");
                    java.time.LocalTime horaActual = java.time.LocalTime.now();

                    // Inicializa las variables para las fechas y horas de inicio y fin
                    java.util.Date fechaInicio = null;
                    java.util.Date fechaFin = null;
                    java.util.Date horaInicio12 = null;
                    java.util.Date horaFin12 = null;
                    java.time.LocalTime horaInicio = null;
                    java.time.LocalTime horaFin = null;

                    String estadoDonacion = "Pasado"; // Por defecto es "Pasado"

                    try {
                        // Parsear las fechas
                        fechaInicio = dateFormat.parse(donacionSuministros.getFechaInicioRecepcion());
                        fechaFin = dateFormat.parse(donacionSuministros.getFechaFinRecepcion());

                        // Parsear las horas
                        horaInicio = java.time.LocalTime.parse(donacionSuministros.getHoraInicioRecepcion(), timeFormat);
                        horaFin = java.time.LocalTime.parse(donacionSuministros.getHoraFinRecepcion(), timeFormat);

                        // Convertir las horas a Date para formato 12 horas
                        horaInicio12 = new java.text.SimpleDateFormat("HH:mm:ss").parse(donacionSuministros.getHoraInicioRecepcion());
                        horaFin12 = new java.text.SimpleDateFormat("HH:mm:ss").parse(donacionSuministros.getHoraFinRecepcion());

                        // Determinar el estado
                        if (fechaActual.before(fechaInicio)) {
                            estadoDonacion = "Activo"; // Futuro, pero marcado como activo
                        } else if (!fechaActual.before(fechaInicio) && !fechaActual.after(fechaFin)) {
                            // Si está entre las fechas de inicio y fin
                            if (fechaActual.equals(fechaInicio)) {
                                if (!horaActual.isBefore(horaInicio)) {
                                    estadoDonacion = "Activo";
                                }
                            } else if (fechaActual.equals(fechaFin)) {
                                if (!horaActual.isAfter(horaFin)) {
                                    estadoDonacion = "Activo";
                                }
                            } else {
                                estadoDonacion = "Activo"; // Está entre las fechas, todo el día está activo
                            }
                        }
                    } catch (Exception e) {
                        // Manejar excepciones de parseo
                        estadoDonacion = "Pasado";
                    }
                %>
                

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" class="btn btn-personal2" onclick="window.history.back();"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 50px;">
                            <h1 class="card-title" style="margin-top: 10px;"><%=donacionSuministros.getTituloAvisoDonacion()%></h1>
                            <p>Solicicitado por <strong><%= donacionSuministros.getAlbergue().getNombreAlbergue() %></strong> </p>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="${pageContext.request.contextPath}/<%=donacionSuministros.getFoto().getRutaFoto()%>"
                                     class="card-img-eve"
                                     alt="Imagen"
                                     style="width: 100%; max-width: 60%; height: auto; border-radius: 15px;"
                                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
                                <div class="placeholder bg-secondary text-white text-center"
                                     style="width: 100%; max-width: 60%; height: auto; padding: 20px; border-radius: 15px; display: none;">
                                    Imagen no disponible
                                </div>
                            </div>
                            <div class="badge text-bg-<%= estadoDonacion.equals("Activo") ? "success" : "secondary" %> text-wrap" style="margin-top: 10px; font-size: 1.5rem; padding: 10px 20px;">
                                <%= estadoDonacion %>
                            </div>
                            <p class="card-text" style="padding: 10px 0px;" ><%=donacionSuministros.getMensajeParaDonantes()%></p>
                            <div class="row justify-content-center p-1" style="text-align: center;">
                                <div class="col-md-6 p-1 justify-content-center">
                                    <p class="card-text" style="color: #721313;"><strong>Dirección de recolección:</strong></p>
                                    <p class="card-text"><%=donacionSuministros.getAlbergue().getDistrito().getNombreDistrito()%> - <%=donacionSuministros.getAlbergue().getDireccion()%> </p>
                                    <p class="card-text" style="color: #721313;"><strong>Horario de recepción:</strong> </p>
                                    <p class="card-text"><%=timeFormat12Hours.format(horaInicio12)%> - <%=timeFormat12Hours.format(horaFin12)%></p>
                                </div>
                                <div class="col-md-6 p-1 justify-content-center">
                                    <p class="card-text" style="color: #721313;"><strong>Teléfono de contacto:</strong> </p>
                                    <p class="card-text"><%=donacionSuministros.getAlbergue().getNombreContactoDonaciones()%> - <%=donacionSuministros.getAlbergue().getNumeroContactoDonaciones()%></p>
                                    <p class="card-text" style="color: #721313;"><strong>Correo electrónico del albergue:</strong> </p>
                                    <p class="card-text"><%=donacionSuministros.getCorreoElectronicoDonacion()%></p>
                                </div>
                            </div>                 
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1 d-flex justify-content-center">
                                    <button onclick="showDonarSumDialog()" class="btn btn-personal" <%= estadoDonacion.equals("Pasado") ? "disabled" : "" %>>Donar</button>
                                </div>
                                <div class="col-md-6 p-1 d-flex justify-content-center">
                                    <button onclick="location.href='${pageContext.request.contextPath}/TodosLosAlbergues?action=vista&id=<%= donacionSuministros.getAlbergue().getAlbergueID()%>'" class="btn btn-personal">Ver Albergue</button>
                                </div>
                                <div>
                                    <% if (estadoDonacion.equals("Pasado")) { %>
                                    <p class="card-text" style="margin-top: 10px; color: #721313; font-size: 1.2rem;">
                                        Esta solicitud ha finalizado y ya no se aceptan donaciones. Agradecemos su interés y apoyo.
                                    </p>
                                    <% } %>
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
    <dialog id="form-donacion" style="max-width: 500px; border-radius: 20px; background-color: #fca651e1; border: none;">
        <div class="pop-up-content" style="text-align: center; padding: 0px 15px; border-style: dashed; border-radius: 20px; border-color: black; padding: 10px; border-width: 2px;">
            <h2 style="color: black;"><i>Confirma tu donación</i></h2>
            <span class="fi-rr-form" style="font-size: 70px;"></span>
            <p>Completa el siguiente formulario indicando la información requerida para que el albergue tenga en cuenta tu participación</p>
            <form id="suministroForm" method="POST" action="${pageContext.request.contextPath}/SolicitudesDeSuministros">
                <!-- Primera fila -->
                <input type="hidden" name="donacionSuministrosID" value="<%=donacionSuministros.getDonacionSuministrosID()%>">
                <div class="row justify-content-center p-2">
                    <div class="col-md-8 p-1">
                        <label for="fechaEntrega" style="font-size: 14px; font-weight: bold;">Fecha de entrega</label><br>
                        <input type="date" class="form-control" id="fechaEntrega" name="fechaEntrega" required>
                    </div>
                    <div class="col-md-4 p-1">
                        <label for="cantidad" style="font-size: 14px; font-weight: bold;">Cantidad</label>
                        <input type="number" class="form-control" placeholder="Cantidad" id="cantidad" name="cantidad" maxlength="2" required>
                    </div>
                </div>
                <!-- Segunda fila -->
                <div class="row justify-content-center p-2">
                    <div class="col-md-12 p-1">
                        <label for="tipo-donacion" style="font-size: 14px; font-weight: bold;">Tipo de donación</label>
                        <input type="text" class="form-control" placeholder="Ingrese la donación a realizar" id="tipo-donacion" name="tipo-donacion" maxlength="20" required>
                    </div>
                </div>
                <div class="popup-buttons">
                    <button type="submit" class="btn btn-personal">Enviar</button>
                    <button type="button" class="btn btn-secondary" onclick="closeDialog()">Cancelar</button>
                </div>
            </form>
        </div>
    </dialog>



    <div id="popup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <h2>¿Está seguro de realizar esta donación?</h2>
            <form method="POST" id="donacionForm">
                <div class="popup-buttons">
                    <button type="submit" class="btn btn-danger">Confirmar</button>
                    <button type="button" class="btn btn-secondary" onclick="cerrarConfirmacionDonacion()">Cancelar</button>
                </div>
            </form>
        </div>
    </div>


    <!-- Pop-up de confirmación -->
    <dialog id="confirm-envio" style="max-width: 400px; border-radius: 20px; background-color: #fca651e1; border: none; justify-content: center;">
        <div class="pop-up-content" style="text-align: center; padding: 0px 15px;padding: 10px;">
            <h2 style="color: #721313;">¡Confirmación de Envío!</h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p>Tu donación ha sido enviada con éxito. ¡Gracias por tu colaboración!</p>
            <button onclick="closeEnvioDialog()" class="btn btn-personal">Cerrar</button>
        </div>
    </dialog>
    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>
<script>
    // Comprueba si hay un parámetro de error en la URL
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error'); // Busca el parámetro 'error'

    if (error === 'true') {
        // Abre el dialog en caso de error
        const formDialog = document.getElementById("form-donacion");
        if (formDialog) {
            formDialog.showModal();
        }
    }
</script>

<script>
    const formDialog = document.getElementById("form-donacion");
    const suministroForm = document.getElementById("suministroForm");

    // Abre el formulario de donación
    function showDonarSumDialog() {
        formDialog.showModal();
    }

    // Cierra el formulario de donación
    function closeDialog() {
        formDialog.close();
    }

    // Validaciones del formulario
    const tipoDonacionInput = document.getElementById('tipo-donacion');
    const fechaEntregaInput = document.getElementById('fechaEntrega');
    const cantidadInput = document.getElementById('cantidad');

    tipoDonacionInput.addEventListener('input', function () {
        this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Solo permite letras y espacios
    });

    fechaEntregaInput.addEventListener('keydown', function (event) {
        event.preventDefault(); // Desactiva la entrada manual en el campo de fecha
    });

    cantidadInput.addEventListener('input', function () {
        const value = cantidadInput.value;
        if (value.length > 2) {
            cantidadInput.value = value.slice(0, 2); // Limita a dos dígitos
        }
    });
</script>



