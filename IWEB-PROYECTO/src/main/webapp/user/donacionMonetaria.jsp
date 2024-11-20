<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.iwebproyecto.beans.Albergue" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    ArrayList<Albergue> listaAlbergues = (ArrayList) request.getAttribute("listaAlbergues");

%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/eventos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/user/css/inicio.css">
    <title>Donaciones monetarias </title>
    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .card-body{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-img-top{
            height: 250px;
            background: cover;
            object-fit: cover;
        }
        .card-text{
            text-align: center;
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
            <div class="logo"><a href="/user/inicio.jsp"><img src="${pageContext.request.contextPath}/common/img/logos/logo_navbar.png" alt="logo"></a></div>
        </header>

        
        

            


        <div class="main">
            

            <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
            <div class="barside">
                <ul class="navlinks">
                    <li><a href="/user/miPerfil.jsp" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="/user/allEventos.jsp" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="/user/postularTemporal.jsp" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="/user/solicitudesDonacionSuministros.jsp" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="/user/donacionMonetaria.html" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="/user/solicitudesAdopcion.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="/user/reportarMascotaPerdida.jsp" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>
                    <li><a href="/user/reportarMaltrato.jsp" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>
                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>
                
            </div>

            

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
                <a href="/user/donacionMonetaria.html">Donaciones Monetarias</a>
                <a href="/user/solicitudesAdopcion.jsp">Portal de Adopciones</a>
                <a href="/user/mascotasPerdidas.jsp">Portal de Mascotas Perdidas</a>
                <a href="/user/reportarMascotaPerdida.jsp">Reportar Mascota Perdida</a>
                <a href="/user/reportarMaltrato.jsp" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal">
                
            

                <div class="row" id="contenido-nofooter">
                    
                    <div class="col-md-9" id="contenidoIzquierda">
                        <div class="container" id="Eventos">
                            <h1>Todos los Albergues</h1>
                            <div class="row">

                            <hr>
                            <div class="row justify-content-between pt-3 mb-4">
                                <div class="col-sm-5" style="min-width: 300px;">
                                    <div class="input-group">
                                        <button class="btn" type="button" aria-label="Close" style="background-color: #4D0E0E; cursor: default;">
                                            <span class="fi-rr-search" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
                                        </button>
                                        <input type="text" id="searchInput" class="form-control" placeholder="Busque por nombreMascota del albergue" maxlength="60">
                                    </div>
                                </div>
                            </div>

                                <%
                                    int i = 1;
                                    for (Albergue a : listaAlbergues) {
                                %>

                                <!-- Card 1 -->
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card h-100">
                                        <img src="${pageContext.request.contextPath}/<%=a.getFoto().getRutaFoto()%>" class="card-img-top" alt="Card 1">
                                        <div class="card-body">
                                            <div class="row d-flex justify-content-center">
                                                <h4 class="card-title text-center"><%=a.getNombreAlbergue()%></h4>

                                            </div>

                                            <a href="TodosLosAlbergues?action=vista&id=<%=a.getAlbergueID()%>" class="btn btn-personal">Ver Albergue</a>
                                        </div>
                                    </div>
                                </div>

                                <%
                                        i++;
                                    }
                                %>
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
                    <div class="col-md-3 d-flex flex-column" id="contenidoDerecha">
                        <div class="container" id="MascotasPerdidas">
                            <h1> Mascotas perdidas</h1>
                            <div class="grid-container" id="grilla-perdidos">
                                <!-- Card 1 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top card-img-don" alt="Canela">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Canela</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Parque Condesa</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 2</p>
                                    </div>
                                </div>
                        
                                <!-- Card 2 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top card-img-don" alt="Thor">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Thor</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Puente Azul Santa Anita</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 8</p>
                                    </div>
                                </div>
                        
                                <!-- Card 3 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top card-img-don" alt="Sam">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Sam</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Calle Flor Tristán La Molina</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 1</p>
                                    </div>
                                </div>
                                <!-- Card 4 -->
                                <div class="card .perdido">
                                    <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top card-img-don" alt="Sam">
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Sam</h5>
                                        <p class="card-text"><strong>Lugar de extravío:</strong> Calle Flor Tristán La Molina</p>
                                        <p class="card-text"><strong>Días perdido:</strong> 1</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="/user/mascotasPerdidas.jsp" class="btn btn-personal m-2" id="btn-crd-cr">Ver más</a>

                        

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
    <dialog id="hacer-donacion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none; justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;">Números de yape/plin</h2><br>
            <div class="row justify-content-center">
                <!--Primera columna de selección-->
                <div class="col-md-6 justify-content-center p-1">
                    <img src="/common/img/donacionesMonetarias/logoPlin.png" class="card-img-monetaria" alt="Imagen" style="width: 100%; max-width: 60%; height: auto;">
                    <p style="padding: 10px;font-size: 23px;">997565443</p>
                </div>
                <!--Segunda columna de selección-->
                <div class="col-md-6 justify-content-center p-1">
                    <img src="/common/img/donacionesMonetarias/logoYape.png" class="card-img-monetaria" alt="Imagen" style="width: 100%; max-width: 60%; height: auto;">
                    <p style="padding: 10px;font-size: 23px;">998865443</p>
                </div>
            </div>
            <form id="suministroForm" onsubmit="handleFormSubmit(event)" >
                <!--Primera columna de selección-->
                <div class="row justify-content-center p-1">
                    <div class="col-md-8 p-1">                         
                        <label for="cant-donacion" style="font-size: 14px; font-weight: bold;">Ingrese el monto</label>
                        <input type="number" class="form-control" placeholder="Ingrese el monto a donar" id="cant-donacion" name="cant-donacion" min="10" max="500" required>      
                    </div>
                </div>
                <button type="submit" class="btn btn-personal"> Enviar </button>
            </form>
        </div>
    </dialog>

    <!--Pop up confirmacion-->
    <dialog id="confirm-donacion" style="max-width: 400px;border-radius: 20px;background-color: #fca651e1;border: none;justify-content: center;">
        <div class="pop-up-content" style="text-align: center;padding: 0px 15px;">
            <h2 style="color: #721313;">Donación exitosa</h2>
            <span class="fi-rr-badge-check" style="font-size: 70px;"></span>
            <p> Se ha procesado tu donación con éxito! Gracias por colaborar para ayudar a nuestros pequeños</p>
            <button onclick="closeConfirmDialog()" class="btn btn-personal"> Cerrar </button>
        </div>
    </dialog>
    <script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    
    
</body>
</html>

<script>
    const donacionMonetariaDialog = document.getElementById("hacer-donacion");
    const confirmEnvioDialog = document.getElementById("confirm-donacion");
    const contenidoPopDialog = donacionMonetariaDialog.querySelector(".pop-up-content");
    const contenidoConfirmDialog = confirmEnvioDialog.querySelector(".pop-up-content");
    const montoInput = document.getElementById("cant-donacion"); // Obtener el input del monto

    function showDonarSumDialog() {
        montoInput.value = ""; // Restablecer el valor del input a vacío
        donacionMonetariaDialog.showModal();
    }

    function closeDonacionDialog() {
        donacionMonetariaDialog.close();
    }

    function closeConfirmDialog() {
        confirmEnvioDialog.close();
    }

    // Cerrar el diálogo de donación al hacer clic fuera del contenido
    donacionMonetariaDialog.addEventListener("click", (e) => {
        if (!contenidoPopDialog.contains(e.target)) {
            closeDonacionDialog();
        }
    });

    // Cerrar el diálogo de confirmación al hacer clic fuera del contenido
    confirmEnvioDialog.addEventListener("click", (e) => {
        if (!contenidoConfirmDialog.contains(e.target)) {
            closeConfirmDialog();
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
    const cantDonacionInput = document.getElementById('cant-donacion');
    //Validar cantidad donacion//
    cantDonacionInput.addEventListener('input', function() {
            // Convertir el valor a string para verificar la longitud
            const value = cantDonacionInput.value;

            // Validar que no se exceda la longitud de 2 cifras
            if (value.length > 3) {
                cantDonacionInput.value = value.slice(0, 3); // Limitar a dos cifras
            }

    });
</script>

<!--Barra de busqueda y creacion de nuevo archivo-->
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
                    if (inputValue.length > 0 || visibleCards < 9) { // Mostrar solo 6 como máximo cuando no hay búsqueda
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

                // Si el input está vacío, asegúrate de que no se muestren más de 9 cards
                if (inputValue.length === 0) {
                    visibleCards = 0;
                    cards.forEach(function(card) {
                        if (visibleCards < 9) {
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
        const itemsPerPage = 9;
        let currentPage = 1;
        const cardItems = document.querySelectorAll('.card-item');
        const totalPages = Math.ceil(cardItems.length / itemsPerPage);
        const pagination = document.getElementById('pagination');

        function showPage(page) {
            const visibleCards = getVisibleCards(); // Obtener las tarjetas visibles después del filtro de búsqueda
            const totalPages = Math.ceil(visibleCards.length / itemsPerPage);
            if (page < 1 || page > totalPages) {
                return;
            }

            currentPage = page; // Actualiza la página actual
            let start = (currentPage - 1) * itemsPerPage;
            let end = start + itemsPerPage;

            // Mostrar solo los elementos de la página actual
            cardItems.forEach((card, index) => {
            const isVisible = visibleCards.includes(card);
                if (isVisible) {
                    if (index >= start && index < end) {
                        card.classList.add('d-block');
                        card.classList.remove('d-none');
                    } else {
                        card.classList.remove('d-block');
                        card.classList.add('d-none');
                    }
                } else {
                    card.classList.remove('d-block');
                    card.classList.add('d-none');
                }
            });

            renderPagination(totalPages); // Re-renderizar la paginación
        }

        // Función para obtener todas las tarjetas visibles (después de aplicar búsqueda)
        function getVisibleCards() {
            const inputValue = searchInput.value.toLowerCase();
            let visibleCards = [];

            cardItems.forEach(function(card) {
                const cardTitle = card.querySelector('.card-title').textContent.toLowerCase();
                if (cardTitle.includes(inputValue)) {
                    visibleCards.push(card);
                }
            });

            return visibleCards;
        }

        function renderPagination(totalPages) {
            pagination.innerHTML = '';

            // Botón anterior (se desactiva si estamos en la primera página)
            let prevClass = currentPage === 1 ? 'disabled' : '';
            pagination.innerHTML += `<li class="page-item ${prevClass}"><a class="page-link" data-page="${currentPage - 1}" href="#">Anterior</a></li>`;

            // Números de página
            for (let i = 1; i <= totalPages; i++) {
                let activeClass = currentPage === i ? 'active' : '';
                let pageClass = activeClass ? 'bg-brown text-white' : 'bg-white text-brown'; // Añadir clases de color marrón para la página activa
                pagination.innerHTML += `<li class="page-item ${activeClass} ${pageClass}"><a class="page-link" data-page="${i}" href="#">${i}</a></li>`;
            }

            // Botón siguiente (se desactiva si estamos en la última página)
            let nextClass = currentPage === totalPages ? 'disabled' : '';
            pagination.innerHTML += `<li class="page-item ${nextClass}"><a class="page-link" data-page="${currentPage + 1}" href="#">Siguiente</a></li>`;

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

        // Lógica de búsqueda
        searchInput.addEventListener('keyup', function() {
            showPage(1); // Reiniciar a la primera página cuando se haga una búsqueda
        });

        // Inicializar la paginación
        function initPagination() {
            const visibleCards = getVisibleCards(); // Obtener las tarjetas visibles
            const totalPages = Math.ceil(visibleCards.length / itemsPerPage);
            renderPagination(totalPages);
            showPage(currentPage);
        }

        initPagination(); // Llamar la función para inicializar la paginación
     });
  </script>