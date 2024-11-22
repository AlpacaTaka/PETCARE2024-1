
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/common/css/baseDesign.css">
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
                <div class="welcome-text">Hola, Juan</div>
            </div>
            <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
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
                

                <div class="col" id="contenido-nofooter">
                    <div class="container md-8" style="width: 85%; max-width: 800px; margin-bottom: 20px; padding: 0;">
                        <button type="button" class="btn btn-personal2"onclick="location.href='solicitudesDonacionSuministros.jsp'"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 50px;">
                            <h1 class="card-title" style="margin-top: 10px;">Se necesitan camas</h1>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="/common/img/donaciones/donacion1.png" class="card-img-eve" alt="Imagen" style="width: 100%; max-width: 60%; height: auto; border-radius: 15px;">
                            </div>
                            <div class="badge text-bg-success text-wrap" style="margin-top: 10px; font-size: 1.5rem; padding: 10px 20px;">
                                Activo
                            </div>         
                            <p class="card-text" style="padding: 10px 0px;" >¡Hola! En estamos necesitando camas para perros que actualmente no tienen un lugar cómodo donde descansar. Si tienes alguna cama para donar, por pequeña o grande que sea, sería de gran ayuda para nuestros peludos mientras esperan ser adoptados. ¡Gracias por tu apoyo! </p>
                            <div class="row justify-content-center p-1" style="text-align: center;">
                                <div class="col-md-6 p-1 justify-content-center">
                                    <p class="card-text" style="color: #721313;"><strong>Dirección de recolección:</strong></p>
                                    <p class="card-text">1) Avenida Universitaria 1807 - Pueblo Libre</p>
                                    <p class="card-text" style="color: #721313;"><strong>Horario de recepción:</strong> </p>
                                    <p class="card-text">8:00 am - 5:00 pm</p>
                                </div>
                                <div class="col-md-6 p-1 justify-content-center">
                                    <p class="card-text" style="color: #721313;"><strong>Teléfono de contacto:</strong> </p>
                                    <p class="card-text">995522664</p>
                                    <p class="card-text" style="color: #721313;"><strong>Correo electrónico del albergue:</strong> </p>
                                    <p class="card-text">patitasdeamor@gmail.com</p>
                                </div>
                            </div>                 
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button onclick="showDonarSumDialog()" class="btn btn-personal">Donar</button>
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
            <h2 style="color: #721313;"><italic>Confirma tu donación</italic></h2>
            <span class="fi-rr-form" style="font-size: 70px;"></span>
            <p> Completa el siguiente formulario indicando la información requerida para que el albergue tenga en cuenta tu participación</p>
            <form id="suministroForm" onsubmit="handleFormSubmit(event)">
                <!--Primera columna de selección-->
                <div class="row justify-content-center p-2">
                    <div class="col-md-7 p-1">                         
                        <label for="tipo-donacion" style="font-size: 14px; font-weight: bold;">Tipo de donación</label>
                        <input type="text" class="form-control" placeholder="Ingrese la donación a realizar" id="tipo-donacion" name="tipo-donacion" maxlength="20" required>      
                    </div>
                    <div class="col-md-4 p-1">
                        <label for="cantidad" style="font-size: 14px; font-weight: bold;">Cantidad</label>
                        <input type="number" class="form-control" placeholder="Cantidad" id="cantidad" name="cantidad" maxlength="2" required> 
                    </div>
                </div>
                <!--Segunda columna de selección-->
                <div class="row justify-content-center p-2">
                    <div class="col-md-6 p-1">
                        <label for="fechaEntrega" style="font-size: 14px; font-weight: bold;">Fecha de entrega</label><br>
                        <input type="date"  class="form-control" id="fechaEntrega" name="fechaEntrega" required> 
                    </div>
                    <div class="col-md-5 p-1">
                        <label for="punto-acopio" style="font-size: 14px; font-weight: bold;">Lugar de entrega</label>
                        <select class="form-select" id="punto-acopio" aria-label="Floating label select example" required>
                            <option value="" disabled selected>Seleccione un lugar</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
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
            <h2 style="color: #721313;">¡Confirmación de Envío!</h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p>Tu donación ha sido enviada con éxito. ¡Gracias por tu colaboración!</p>
            <button onclick="closeEnvioDialog()" class="btn btn-personal">Cerrar</button>
        </div>
    </dialog>
    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>
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