<%@ page import="com.example.iwebproyecto.beans.DonacionSuministros" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="lista" type="java.util.ArrayList<com.example.iwebproyecto.beans.DonacionSuministros>" scope="request"/>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <link href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" rel="stylesheet">

    <title>Solicitudes de Donación</title>
    <style>
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/
        /* Fijar la parte superior (search, paginación, y cantidad de datos) */
        .dataTables_wrapper .dataTables_length,
        .dataTables_wrapper .dataTables_filter,
        .dataTables_wrapper .dataTables_info,
        .dataTables_wrapper .dataTables_paginate {
            position: sticky;
            top: 0;
            z-index: 10; /* Para que queden sobre la tabla al hacer scroll */
        }

        /* Hacer que solo la tabla tenga scroll */
        .table-responsive {
            max-height: auto; /* Ajusta el alto según necesites */
            overflow-y: auto;
            overflow-x: auto; /* Scroll horizontal si es necesario */
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
            <div class="welcome-text">Hola, Patitas Felices</div>
        </div>
        <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/PortalAdopciones" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                <li><a href="albergue/eventTable.jsp" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/DonacionSuministros" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                <li><a href="albergue/contactarTemporal.jsp" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                <li><a href="albergue/solicitudesAdopcion.jsp" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                <li><a href="albergue/verDenunciasMaltrato.jsp" title="Denuncias de maltrato"><i class="fi-rr-siren-on"></i></a></li>
                <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                <li id="cerrar-sesion"><a href="/login/login.jsp" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>
        </div>

        <div id="menu" class="menu">
            <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
            <a href="<%=request.getContextPath()%>/PortalAdopciones">Portal de Adopciones</a>
            <a href="albergue/eventTable.jsp">Mis Eventos Benéficos</a>
            <a href="<%=request.getContextPath()%>/DonacionSuministros">Mis Eventos de Donación</a>
            <a href="albergue/contactarTemporal.jsp">Hogares Temporales</a>
            <a href="albergue/solicitudesAdopcion.jsp">Solicitudes de Adopción</a>
            <a href="albergue/verDenunciasMaltrato.jsp">Denuncias de maltrato</a>
            <!--<a href="#">Solicitudes de Adopción</a>-->
            <hr>
            <a href="/login/login.html">Cerrar Sesión</a>
        </div>


        <div class="container-fluid d-flex" id="contenido-principal" >
            <div class="row d-flex flex-column" id="contenido-nofooter" style="flex-grow: 1; justify-content: center;">

                <div class="container md-8" style="width: 100%;max-width: 1200px;">
                    <!--Nombre Página-->
                    <h1 style="margin-top: 10px;" class="text-center">Donaciones</h1>

                    <div class="row g-3 justify-content-between pt-3 ps-4">
                        <div class="col-sm-4" style="min-width: 300px;">
                            <div class="input-group">
                                <button class="btn" type="button" aria-label="Close" style="background-color: #4D0E0E; cursor: default;">
                                    <span class="fi-rr-search" style="font-size: 20px; color: rgb(255, 255, 255);"></span>
                                </button>
                                <input type="text" id="searchInput" class="form-control" placeholder="Busque por nombre de la donación" maxlength="60">
                            </div>
                        </div>
                        <div class="col-sm-8 d-flex justify-content-start" style="padding-right: 10px;">
                            <a href="<%=request.getContextPath()%>/DonacionSuministros?action=create">
                                <button type="button" class="btn btn-personal">
                                    <span class="fi fi-rr-add">&nbsp;Nuevo</span>
                                </button>
                            </a>
                        </div>
                    </div>


                    <div class="container d-flex justify-content-center mt-4" style="margin-bottom: 30px;">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4" id="cardContainer" style="width: 100%;">
                            <%for (DonacionSuministros donacionSuministros: lista) {%>
                            <!-- Card 1 -->
                            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4 card-item">
                                <div class="card h-100">
                                    <img src="<%=request.getContextPath()%>/common/img/donaciones/donacion1.png" class="card-img-top" alt="Donacion 1" style="max-width: 300px; height: 260px;object-fit: cover;">
                                    <div class="card-body">
                                        <div class="row d-flex justify-content-center">
                                            <h4 class="card-title text-center"><%=donacionSuministros.getTituloAvisoDonacion()%></h4>
                                            <div class="badge text-bg-success text-wrap" style="max-width: 70%; margin-bottom: 10px">
                                                Activo
                                            </div>
                                        </div>
                                        <hr>
                                        <p style="text-align: center;line-height: 23px;"><strong>Dirección:</strong> <%=donacionSuministros.getDistrito().getNombreDistrito()+" "+donacionSuministros.getAlbergue().getDireccionDonaciones()%><strong><br>Fecha:</strong><%=donacionSuministros.getFechaInicioRecepcion()+" "+donacionSuministros.getFechaFinRecepcion()%><br><strong>Horario de recepción:</strong><%=donacionSuministros.getHoraInicioRecepcion()+" "+donacionSuministros.getHoraFinRecepcion()%></p>
                                        <div style="display: flex; justify-content: center;">
                                            <a href="<%=request.getContextPath()%>/DonacionSuministros?action=view&id=<%=donacionSuministros.getDonacionSuministrosID()%>"><button type="button" class="btn btn-personal2" style="margin-right: 3px; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
                                            <a href="<%=request.getContextPath()%>/DonacionSuministros?action=edit&id=<%=donacionSuministros.getDonacionSuministrosID()%>"><button type="button" class="btn btn-personal2" style="margin-right: 3px; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></span></button></a>
                                            <%--a <onclick="abrirPopup()"> href="<%=request.getContextPath()%>/DonacionSuministros?action=delete&id=<%=donacionSuministros.getDonacionSuministrosID()%>"><button type="button" class="btn btn-personal" style="margin-right: 3px; border-width: 1px;" title="Eliminar" onclick="abrirPopup()"><span class="fi fi-rr-trash"></span></button></a--%>
                                            <button onclick="abrirPopup('<%=request.getContextPath()%>/DonacionSuministros?action=delete&id=<%=donacionSuministros.getDonacionSuministrosID()%>')" type="button" class="btn btn-personal" style="margin-right: 3px; border-width: 1px;" title="Eliminar"><span class="fi fi-rr-trash"></span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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

<!-- Popup Modal -->
<div id="popup" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea eliminar este evento?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccion()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopup()">Cancelar</button>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    const select1 = document.getElementById('Especies');
    const select2 = document.getElementById('Razas');
    const otraRazaInput = document.getElementById('otra-raza');

    const opciones = {
        Perro: ['Galgo', 'Shitzu', 'Chihuhua','No sabe','Otro'],
        Gato: ['Persa', 'Angora', 'Meinkoon','No sabe','Otro'],
        Ave: ['Ave1', 'Ave2', 'Ave3','Ave4','Otro'],
        Hamster: ['Hamster1', 'Hamster2', 'Hamster3','No sabe','Otro'],
        Conejo: ['Conejo1', 'Conejo2', 'Conejo3','No sabe','Otro'],
        Tortuga: ['T1', 'T2', 'T3','No sabe','Otro'],
        Huron: ['Manzana', 'Banana', 'Naranja','No sabe','Otro'],
        Chinchilla: ['Chinchilla1', 'Chinchilla1', 'Chinchilla3','No sabe','Otro'],
        MiniPig: ['No sabe']
    };

    select1.addEventListener('change', function() {
        const seleccion = this.value;

        // Limpiar las opciones anteriores
        select2.innerHTML = '<option value="">--Selecciona una opción--</option>';

        if (seleccion) {
            // Agregar las nuevas opciones
            opciones[seleccion].forEach(function(opcion) {
                const nuevaOpcion = document.createElement('option');
                nuevaOpcion.value = opcion.toLowerCase();
                nuevaOpcion.textContent = opcion;
                select2.appendChild(nuevaOpcion);
            });
        }
    });

    // Habilitar/deshabilitar el campo de texto "otra raza"
    select2.addEventListener('change', function() {
        if (this.value === 'otro') {  // El valor se convierte a minúsculas, por eso se usa "otro"
            otraRazaInput.disabled = false;
        } else {
            otraRazaInput.disabled = true;
            otraRazaInput.value = ''; // Limpiar el campo si se deshabilita
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
<script>
    // Función para abrir el popup
    function abrirPopup(redireccionamiento) {
        document.getElementById('popup').style.display = 'block';
        document.getElementById('popup').href = redireccionamiento;
    }
    // Función para cerrar el popup
    function cerrarPopup() {
        document.getElementById('popup').style.display = 'none';
        document.getElementById('popup').href = null;
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccion() {
        alert('Evento eliminado correctamente.')
        window.location.href = document.getElementById('popup').href;
        cerrarPopup();
    }
</script>

</body>
</html>

