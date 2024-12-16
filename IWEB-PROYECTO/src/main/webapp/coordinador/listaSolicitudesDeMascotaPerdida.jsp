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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSSDELAPAGINA.css">
    <title>Solicitudes de mascota perdida</title>
    <style>
        
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/ 
        #contenido-nofooter{
            border-radius: 50px;
            height: 100%;
        }
        .dropdown-item:active {
            background-color: #4D0E0E; /* Cambia este color por el que desees */
        }
        .bg-brown {
            background-color: #4D0E0E; /* Use your desired brown color */
        }

        .text-brown {
            color: #4D0E0E; /* Use your desired brown color */
        }

        .text-white {
            color: #fff;
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
                    
                    <div class="container" >
                        <% String quitar = (String) request.getSession().getAttribute("quitar3");
                            if (quitar == null){

                        %>

                        <h1 style="text-align: center; margin-bottom: 40px;">Solicitudes de Mascota Perdida</h1>

                        <%
                        }else{

                        %>

                        <h1 style="text-align: center; margin-bottom: 40px;">Solicitudes de Mascota Perdida Rechazadas</h1>

                        <%
                            } %>

                        
                        <div class="row g-0 justify-content-between">
                            <div class="col-sm-4 order-first" style="min-width: 300px;">
                                <div class="input-group ">
                                    <button class="btn" button type="button"  aria-label="Close" style="background-color: #4D0E0E; cursor: default;"><span class="fi-rr-search" style="font-size: 20px; color:rgb(255, 255, 255)"></span></button>
                                    <input type="text" id="searchInput" class="form-control" placeholder="Busque por nombre" maxlength="60">
                                </div>
                            </div>
                            <div class="col-sm-4 order-second" style="min-width: 300px;">
                                <form action="FiltrosCoordinador?action=SolicitudesPerdidas" method="post" class="d-flex justify-content-center">


                                    <%
                                        if (quitar == null){

                                    %>


                                    <button type="submit" class="btn btn-personal">
                                        Ver Solicitudes Rechazadas
                                    </button>
                                    <%
                                    }else{

                                    %>
                                    <button type="button" class="btn btn-personal" onclick="location.href='${pageContext.request.contextPath}/ListaMascotaPerdida?action=ListaSolicitudes';">
                                        Regresar
                                    </button>


                                    <%
                                        } %>


                                </form>

                            </div>
                            <!-- 
                            <div class="col-12 col-sm-4 d-flex justify-content-center mt-3 mt-sm-0">
                                <button class="btn btn-personal2 dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
                                    Ordenar
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                    <li>
                                        <label class="dropdown-item">
                                            <input type="radio" name="filter" class="filter-radio" value="card1"> Fecha de envío (más recientes)
                                        </label>
                                    </li>
                                    <li>
                                        <label class="dropdown-item">
                                            <input type="radio" name="filter" class="filter-radio" value="card2"> Fecha de envío (más antiguos)
                                        </label>
                                    </li>
                                </ul>
                            </div>  -->

                        </div>

                        <div class="container d-flex justify-content-center mt-4" style="margin-bottom: 30px;">
                            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="cardContainer" style="width: 100%;">
                                <!-- Aquí se insertan todas las cards, las cuales se manejarán con paginación -->


                                <%
                                    List<PublicacionMascotaPerdida> lista = (List<PublicacionMascotaPerdida>) request.getSession().getAttribute("listaMascotaPerdida");
                                    if (lista != null) {
                                        for (PublicacionMascotaPerdida so : lista) {
                                %>
                                <div class="col-12 col-md-6 col-lg-4 mb-4 card-item">
                                    <div class="card h-100">
                                        <div class="card-body text-center">
                                            <h4 class="card-title"><%=so.getNombreMascota()%></h4>
                                            <img src="${pageContext.request.contextPath}<%=so.getFoto().getRutaFoto()%>" class="card-img-top" alt="..." style="max-width: 300px; height: 260px; object-fit: cover;">
                                            <p class="card-text" style="margin-top: 10px; text-align: center;">Solicitud enviada el <%=so.getFechaFormulario()%>.</p>
                                            <a href="VerSolicitudMascotaPerdida?id=<%=so.getPublicacionMascotaPerdidaID()%>" class="btn btn-personal" id="btn-crd-cr">Ver solicitud</a>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                } else {
                                %>
                                <p>No hay solicitudes disponibles.</p>
                                <% } %>

                        
                                <!-- Card 2 -->
                                


                            
                            </div>
                        </div>

                        <!-- Pagination -->
                        <div class="container d-flex justify-content-center mt-5">
                            <div class="row">
                                <nav aria-label="...">
                                    <ul class="pagination" id="pagination">
                                      <!-- Pagos dinámicos -->
                                    </ul>
                                </nav>
                            </div>
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

    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
        // Capturamos el campo de búsqueda
        var searchInput = document.querySelector('.form-control');
        var pagination = document.getElementById('pagination'); // Referencia a la paginación

        // Evento 'keyup' para filtrar las cards cuando se escribe
        searchInput.addEventListener('keyup', function() {
            var inputValue = searchInput.value.toLowerCase(); // Convertir el texto a minúsculas
            var cards = document.querySelectorAll('.card-item'); // Seleccionar todas las cards

            let visibleCards = 0; // Contador para cards visibles

            cards.forEach(function(card) {
                var cardTitle = card.querySelector('.card-title').textContent.toLowerCase(); // Obtener título
                
                if (cardTitle.includes(inputValue)) {
                    if (inputValue.length > 0 || visibleCards < 6) { // Mostrar solo 6 como máximo cuando no hay búsqueda
                        card.classList.add('d-block'); // Mostrar la card si coincide
                        card.classList.remove('d-none'); // Asegurarse de que no esté oculta
                        visibleCards++; // Aumentar el contador de cards visibles
                    } else {
                        card.classList.remove('d-block'); // Ocultar si excede 6 cards
                        card.classList.add('d-none'); // Asegurarse de que esté oculta
                    }
                } else {
                    card.classList.remove('d-block'); // Ocultar la card si no coincide
                    card.classList.add('d-none'); // Asegurarse de que esté oculta
                }
            });

            // Si el input está vacío, asegúrate de que no se muestren más de 6 cards
            if (inputValue.length === 0) {
                visibleCards = 0;
                cards.forEach(function(card) {
                    if (visibleCards < 6) {
                        card.classList.add('d-block');
                        card.classList.remove('d-none');
                        visibleCards++;
                    } else {
                        card.classList.remove('d-block');
                        card.classList.add('d-none');
                    }
                });
            }

            // Si se está buscando, ocultar la paginación
            if (inputValue.length > 0) {
                pagination.style.display = 'none'; // Ocultar la paginación
            } else {
                pagination.style.display = ''; // Mostrar la paginación si no hay búsqueda
                showPage(1); // Mostrar la primera página cuando no hay búsqueda
            }
        });

    });

    document.addEventListener("DOMContentLoaded", function() {
        const itemsPerPage = 6;
        let currentPage = 1;
        const cardItems = document.querySelectorAll('.card-item');
        const totalPages = Math.ceil(cardItems.length / itemsPerPage);
        const pagination = document.getElementById('pagination');

        function showPage(page) {
            if (page < 1 || page > totalPages) {
                return;
            }

            currentPage = page; // Actualiza la página actual
            let start = (currentPage - 1) * itemsPerPage;
            let end = start + itemsPerPage;

            // Mostrar solo los elementos de la página actual
            cardItems.forEach((card, index) => {
                if (index >= start && index < end) {
                    card.classList.add('d-block'); // Mostrar la card
                    card.classList.remove('d-none'); // Asegurarse de que no esté oculta
                } else {
                    card.classList.remove('d-block'); // Ocultar la card
                    card.classList.add('d-none'); // Asegurarse de que esté oculta
                }
            });

            renderPagination(); // Re-renderizar la paginación
        }

        function renderPagination() {
            pagination.innerHTML = '';

            // Botón anterior (se desactiva si estamos en la primera página)
            let prevClass = currentPage === 1 ? 'disabled' : '';
            pagination.innerHTML += `<li class="page-item <%="${prevClass}"%>"><a class="page-link" data-page="<%="${currentPage - 1}"%>" href="#">Anterior</a></li>`;

            // Números de página
            for (let i = 1; i <= totalPages; i++) {
                let activeClass = currentPage === i ? 'active' : '';
                let pageClass = activeClass ? 'bg-brown text-white' : 'bg-white text-brown'; // Añadir clases de color marrón para la página activa
                pagination.innerHTML += `<li class="page-item <%="${activeClass} ${pageClass}"%>"><a class="page-link" data-page="<%="${i}"%>" href="#"><%="${i}"%></a></li>`;
            }

            // Botón siguiente (se desactiva si estamos en la última página)
            let nextClass = currentPage === totalPages ? 'disabled' : '';
            pagination.innerHTML += `<li class="page-item <%="${nextClass}"%>"><a class="page-link" data-page="<%="${currentPage + 1}"%>" href="#">Siguiente</a></li>`;

            // Añadir un evento a los enlaces de la paginación para que llamen a showPage()
            const paginationLinks = document.querySelectorAll('.page-link');
            paginationLinks.forEach(link => {
                link.addEventListener('click', function(event) {
                    event.preventDefault();
                    const page = parseInt(this.getAttribute('data-page'));
                    showPage(page);
                });
            });
        }

        // Reiniciar a la primera página cuando se borre el texto en la barra de búsqueda
        searchInput.addEventListener('keyup', function() {
            var inputValue = searchInput.value.toLowerCase();

            if (inputValue.length === 0) {
                currentPage = 1; // Restablecer a la página 1 cuando no haya búsqueda
                pagination.style.display = ''; // Mostrar la paginación
                showPage(1); // Mostrar la primera página
            } else {
                pagination.style.display = 'none'; // Ocultar la paginación cuando haya búsqueda
            }
        });

        showPage(currentPage); // Inicialmente mostrar la primera página
    });

    </script>
</body>
</html>
