
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
                <div class="welcome-text">Hola, Juan</div>
            </div>
            <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        <div class="main">

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.html" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
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
                <a href="/user/miPerfil.html">Mi Perfil</a>
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
                
            

                <div class="row d-flex flex-column" id="contenido-nofooter">
                    <div class="container">
                        <div class="container md-8" style="width: 100%;max-width: 800px; margin-bottom: 20px; padding: 0;">
                            <button type="button" onclick="location.href='inicio.jsp'" class="btn btn-personal2">Regresar   </button>
                        </div>
                        <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            <form id="uploadForm" style="padding:10px" >
                                <h1 style="margin-top: 10px;" class="text-center">Mi Perfil</h1>

                                <div class="row justify-content-center p-1">
                                    <div class="col d-flex justify-content-center">
                                        <div class="image-container">
                                            <img src="/common/img/logos/boy.png" alt="Perfil de usuario">
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    
                                    <div class="col-md-6 p-1">
                                        <label for="">Nombre</label>
                                        <input type="text" class="form-control" placeholder="Juan" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="">Apellido</label>
                                        <input type="text" class="form-control" placeholder="Guerrero Adrianzen" required disabled>
                                    </div>
                                    
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-4 p-1">
                                        <label for="">DNI</label>
                                        
                                        <input type="number" class="form-control" placeholder="03203852" required disabled>
                                      
                                    </div>
                                    <div class="col-md-8 p-1">
                                        <label for="distrito">Distrito</label>
                                        <select class="form-select" name="distrito" id="distrito" required disabled>
                                            <option value="">Pueblo Libre</option>
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
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1" >
                                        <label for="direccion">Dirección</label>
                                        <input type="text" class="form-control" placeholder="Calle Parque San Martin 252 Dpto. 501" required disabled>
                                    </div>
                                    
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1" >
                                        <label for="direccion">Correo (Gmail)</label>
                                        <input type="email" class="form-control" placeholder="tubebitofiufiu@gmail.com" required disabled>
                                    </div>
                                    
                                </div>
                                
    
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <p>Si necesita cambiar sus datos personales, contactar con Soporte</p>
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

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>