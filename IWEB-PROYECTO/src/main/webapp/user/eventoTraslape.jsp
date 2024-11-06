<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!--ESTA ES SOLO UNA PÁGINA CREADA PARA VER LAS FUNCIONES A IMPLEMENTARSE EN UN BOTON RESPONSIVE EN CADA CASO DADO-->
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
    <title>Gran Evento de Vacunación!</title>
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
                <a href="/user/postularAlbergue.jsp">Postular a Albergue</a>
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
                        <button type="button" class="btn btn-personal2" onclick="location.href='allEventos.jsp'"> Regresar </button>
                    </div>
                    <div class="container md-8" style="width: 85%; max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px; display: flex; justify-content: center; align-items: center;">
                        <div class="card-body" style="width: 100%; text-align: center; padding: 10px 50px;">
                            <h2 class="card-title" style="margin-top: 10px;">Gran Evento de Vacunación!</h2>
                            <div style="display: flex; justify-content: center; margin-top: 10px; ">
                                <img src="/common/img/eventos/evento2.jpeg" class="card-img-eve" alt="Imagen" style="width: 100%; max-width: 100%; height: auto; border-radius: 15px;">
                            </div>
                            <div class="badge text-bg-primary text-wrap" style="margin-top: 10px; font-size: 1.5rem; padding: 10px 20px;">
                                25 Sep. 08:00am
                            </div>                            
                            <p class="card-text" style="margin-top: 10px;">¡Prepárate para el evento más emocionante del año para ti y tu mascota! El CANinaton 5K es una maratón especialmente diseñada para que disfrutes junto a tu compañero de cuatro patas. Tendremos sorpresas, premios, artistas invitados y muchas actividades para que tú y tu mascota pasen un día inolvidable.</p>
                            <p class="card-text" style="text-align: left;"><strong>Artistas e Invitados Especiales:</strong></p>
                            <p class="card-text" style="margin-top: 10px;">Carlos Torres - DJ Luna Beats - Alejandra Paws - Maxi el Labrador Influencer</p>
                            <p class="card-text" style="text-align: left;"><strong>Descripción del Evento:</strong></p>
                            <p class="card-text" style="margin-top: 10px;">El CANinaton 5K es un evento familiar y amigable con mascotas, donde podrás correr, trotar o caminar junto a tu perro. No importa la raza o tamaño, todos son bienvenidos. La idea es disfrutar de un día de actividad física, diversión y compartir con otros amantes de los animales. </p>
                            <p class="card-text" style="margin-top: 10px;">Además, tendremos stands de comida, bebidas, artículos para mascotas, y servicios de veterinaria y grooming gratuitos durante el evento. También se realizará una subasta de productos, y parte de los fondos recaudados se donarán a una fundación que apoya la adopción de mascotas abandonadas. </p>
                            <p class="card-text" style="text-align: left;"><strong>Cronograma del Evento:</strong></p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">08:00 am - Registro y entrega de kits de bienvenida</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">08:30 am - Calentamiento con el entrenador profesional David Morales</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">09:00 am - Inicio de la maratón</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">10:30 am - Exhibición de adiestramiento y habilidades caninas</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">12:00 pm - Sorteo y entrega de premios a los ganadores de la carrera</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">01:00 pm - Charlas sobre cuidado y bienestar de mascotas con Alejandra Paws</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">02:00 pm - Despedida y cierre del evento</p>
                            <p class="card-text" style="text-align: left;"><strong>Precio de la Entrada:</strong></p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">Entrada General: S/ 50 (Incluye kit de bienvenida con camiseta, gorra y pañuelo para tu mascota)</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">Entrada VIP: S/ 80 (Incluye kit de bienvenida + acceso a la zona de snacks para mascotas y fotos con los invitados especiales)</p>
                            <p class="card-text" style="margin-top: 10px; text-align: left;">Nota: Los menores de 12 años ingresan gratis acompañados de un adulto con entrada pagada.</p>
                            <p class="card-text" style="text-align: left;"><strong>Finalidad del Evento:</strong></p>
                            <p class="card-text" style="margin-top: 10px;">Este evento busca fomentar el cuidado de nuestras mascotas, así como promover la adopción y tenencia responsable. Parte de los fondos recaudados se destinarán a la fundación "Huellas de Amor", que trabaja en la adopción de perros y gatos abandonados. ¡Ven y corre con tu mejor amigo, diviértete y contribuye a una buena causa!</p>
                                                       
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <button onclick="showInscribirseDialog()" class="btn btn-personal">Inscribirse</button>
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
    <dialog id="alert-inscripcion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;"> Traslape de eventos</h2>
            <span class="fi-rr-problem-solving" style="font-size: 70px;"></span>
            <p> Sabemos que deseas inscribirte a este evento, pero encontramos un cruce de horarios con un evento al que te inscribiste previamente</p>
            <button onclick="closeInscripcionDialog()" class="btn btn-personal"> Cerrar </button>
        </div>
    </dialog>

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>

<script>
    const inscripcionDialog = document.getElementById("alert-inscripcion");
    const contenidoPopDialog = document.querySelector(".pop-up-content");

    function showInscribirseDialog(){
        inscripcionDialog.showModal();
    }

    function closeInscripcionDialog(){
        inscripcionDialog.close();
    }

    inscripcionDialog.addEventListener("click", (e)=> {
        if(!contenidoPopDialog.contains(e.target)){
            inscripcionDialog.close();
        }
    })
</script>