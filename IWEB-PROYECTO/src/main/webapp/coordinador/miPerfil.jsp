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
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Mi  perfil</title>
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
                    <li><a href="${pageContext.request.contextPath}/coordinador/listaPublicacionesDeMascotaPerdida.jsp" title="Publicaciones de mascota perdida"><i class="fi-rr-pets"></i></a></li>
                    
                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            <div id="menu" class="menu">
                <a href="miPerfil.html">Mi Perfil</a>
                <hr>
                <a href="listaSolicitudesDeHogarTemporal1.jsp">Solicitudes de hogar temporal</a>
                <a href="listaHogaresTemporales.jsp">Comentarios de hogares temporales</a>
                <hr>
                <a href="listaSolicitudesDeMascotaPerdida.jsp">Solicitudes de mascota perdida</a>
                <a href="listaPublicacionesDeMascotaPerdida.jsp">Publicaciones de mascota perdida</a>
                <hr>
                <a href="#">Cerrar Sesión</a>

            </div>



            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <div class="container">

                        <h1 style="margin-top: 10px; text-align: center; margin-bottom: 35px;" class="text-center" >Mi Perfil de Coordinador</h1>
                        
                        <div class="container md-8" style="width: 100%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            
        
                            <form id="uploadForm" style="padding:10px" >

                                <%
                                    CoordinadorZona coor= (com.example.iwebproyecto.beans.CoordinadorZona) request.getSession().getAttribute("CoordinadorZona");
                                %>

                                <div class="row justify-content-center p-1" style="margin-top: 25px;">
                                    <div class="col d-flex justify-content-center">
                                        <div class="image-container" style="border-radius: 4%; width: 300px; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/common/img/coordinador/c1.jpeg" alt="Perfil de usuario">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row justify-content-center p-1">

                                    <div class="col-md-6 p-1">
                                        <label >Nombres </label>
                                        <input type="text" class="form-control" placeholder="<%=coor.getNombre()%>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label >Apellidos</label>
                                        <input type="text" class="form-control" placeholder="<%=coor.getApellido()%>" required disabled>
                                    </div>
                                    
                                </div>
                                

                                <div class="row justify-content-center p-1">
                                    <div class="col-md-9 p-1">

                                        <label >Correo electrónico</label>
                                        
                                        <input type="text" class="form-control" placeholder="<%=coor.getCorreoElectronico()%>" required disabled>
                                      
                                    </div>
                                    <div class="col-md-3 p-1">
                                        <label >DNI</label>
                                        <input type="number" class="form-control" placeholder="<%=coor.getDni()%>" required disabled>
                                    </div>
                                </div>
                                
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1" >
                                        <label >Teléfono de Contacto</label>
                                        <input type="number" class="form-control" placeholder="<%=coor.getCelular()%>" required disabled>
                                    </div>
                                    <div class="col-md-6 p-1" >
                                        <label >Zona Asignada</label>
                                        <input type="number" class="form-control" placeholder="<%=coor.getZona().getNombreZona()%>" required disabled>
                                    </div>
                                    
                                </div>
                               
                                
    
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <p>Si necesita cambiar alguno de estos datos, contactar son Soporte</p>
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