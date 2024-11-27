<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >
    <!-- CSS de Bootstrap Datepicker -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/common/css/baseDesign.css">
    <link rel="stylesheet" href="css/eventos.css">
    <link rel="stylesheet" href="css/inicio.css">
    <title>Eventos</title>
    <style>
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
            <div class="logo"><a href="/user/inicio.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
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
                    <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/ReportarPerdido" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>

                    <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                </ul>

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
                <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal de Mascotas Perdidas</a>
                <a href="${pageContext.request.contextPath}/PortalDeAdopcion">Portal Avistamiento Perdidos</a>
                <a href="${pageContext.request.contextPath}/ReportarPerdido">Reportar Mascota Perdida</a>
                <a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="/login/login.html">Cerrar Sesión</a>

            </div>


            <div class="container-fluid d-flex" id="contenido-principal" >
                <div class="row d-flex flex-column" id="contenido-nofooter" style="flex-grow: 1; justify-content: center;">
                    <!--Boton de regreso a la página principal-->
                    <div class="container md-8 d-flex justify-content-between" style="width: 93%;max-width: 1400px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='/user/reportarMascotaPerdida.html'">  Regresar   </button>
                        
                    </div>
                    <div class="container md-12" style="width: 93%;max-width: 1400px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 25px; padding: 10px 20px;">
                        <div class="row d-flex text-center justify-content-md-center">
                            <div class="col-md-auto">
                                <span  id="casaAmor" class="fi-rr-message-alert" style="font-size: 60px;color: #4d0e0e"></span>
                            </div>
                            <div class="col-md-auto align-self-center">
                                <h1 style=" color: #4d0e0e; font-style: italic" class="text-center" >Tus reportes de mascotas perdidas</h1>
                            </div>
                        </div>
                        <hr class="huellitas mt-1">
                        <p style="margin: 12px 20px;" class="text-center">En este portal puedes ver el historial de tus reportes y actualizar el estatus de la mascota perdida en caso haya sido encontrada.</p>
                        
                    </div>
                  <div class="container md-8" style="width: 100%;max-width: 1200px;">
                    <div class="row g-3 justify-content-between pt-3 ps-4">
                      <div class="col-sm-4" style="min-width: 300px;">
                        <div class="input-group">
                            <button class="btn" type="button" aria-label="Close" style="background-color: #4D0E0E; cursor: default;">
                                <span class="fi-rr-search" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
                            </button>
                            <input type="text" id="searchInput" class="form-control" placeholder="Busque por nombre de la mascota" maxlength="60">
                        </div>
                      </div>
                    </div>

                    <div class="container d-flex justify-content-center mt-4" style="margin-bottom: 30px;">
                      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="cardContainer" style="width: 100%;">
                        <!-- Card 1 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top" alt="Perdido 1">
                            <div class="card-body">
                              <h4 class="card-title text-center">Canela</h4>
                              <hr>
                              <div style="display: flex; justify-content: center;">
                                  <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                              </div>
                            </div>
                          </div>
                        </div>
                    
                        <!-- Card 2 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido2.jpg" class="card-img-top" alt="Perdido 2">
                            <div class="card-body">
                              <h4 class="card-title text-center">Canelo</h4>
                              <hr>
                              <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                              </div>
                            </div>
                          </div>
                        </div>
                    
                        <!-- Card 3 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido3.jpg" class="card-img-top" alt="Evento 3">
                            <div class="card-body">
                                <h4 class="card-title text-center">Cooper</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>
                    
                        <!-- Card 4 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido4.jpg" class="card-img-top" alt="Evento 4">
                            <div class="card-body">
                                <h4 class="card-title text-center">Gerardo</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

                        <!-- Card 5 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido8.jpg" class="card-img-top" alt="Evento 3">
                            <div class="card-body">
                                <h4 class="card-title text-center">Orion</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

                        <!-- Card 6 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido7.jpg" class="card-img-top" alt="Evento 3">
                            <div class="card-body">
                                <h4 class="card-title text-center">Garfield</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

                        <!-- Card 7 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido6.jpg" class="card-img-top" alt="Evento 3">
                            <div class="card-body">
                                <h4 class="card-title text-center">Michifus</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

                        <!-- Card 8 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido5.jpg" class="card-img-top" alt="Evento 3">
                            <div class="card-body">
                                <h4 class="card-title text-center">Fidodido</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

                        <!-- Card 9 -->
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                          <div class="card h-100">
                            <img src="/common/img/perdidos/perdido1.jpg" class="card-img-top" alt="Evento 1">
                            <div class="card-body">
                                <h4 class="card-title text-center">Ringo</h4>
                                <hr>
                                <div style="display: flex; justify-content: center;">
                                    <button type="button" class="btn btn-personal" style="border-width: 1px;">Encontrada</button> 
                                </div>
                            </div>
                          </div>
                        </div>

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
        
        <script>
            document.getElementById('uploadForm').addEventListener('submit', function(event) {
                const fileInput = document.getElementById('formFile');
                const file = fileInput.files[0];
                const fileError = document.getElementById('fileError');

                // Verifica si el archivo tiene el tipo MIME de PNG
                if (file && file.type !== 'image/png') {
                    event.preventDefault(); // Evita que el formulario se envíe
                    fileError.style.display = 'block'; // Muestra el mensaje de error
                } else {
                    fileError.style.display = 'none'; // Oculta el mensaje de error si está todo bien
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
                            if (inputValue.length > 0 || visibleCards < 8) { // Mostrar solo 6 como máximo cuando no hay búsqueda
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

                        // Si el input está vacío, asegúrate de que no se muestren más de 8 cards
                        if (inputValue.length === 0) {
                            visibleCards = 0;
                            cards.forEach(function(card) {
                                if (visibleCards < 8) {
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
                const itemsPerPage = 8;
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