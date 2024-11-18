<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <title>Solicitudes de Adopción</title>
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
                <div class="logo"><a href="/user/inicio.jsp"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
            </header>

            <div class="main">

                <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
                <div class="barside">
                    <ul class="navlinks">
                        <li><a href="miPerfil.jsp" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
                        <li><a href="adoptionTable.jsp" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                        <li><a href="eventTable.jsp" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
                        <li><a href="donationTable.jsp" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
                        <li><a href="contactarTemporal.jsp" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
                        <li><a href="solicitudesAdopcion.html" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
                        <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
                        <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
                    </ul>
                </div>

                <div id="menu" class="menu">
                    <a href="miPerfil.jsp">Mi Perfil</a>
                    <a href="adoptionTable.jsp">Portal de Adopciones</a>
                    <a href="eventTable.jsp">Mis Eventos Benéficos</a>
                    <a href="donationTable.jsp">Mis Eventos de Donación</a>
                    <a href="contactarTemporal.jsp">Hogares Temporales</a>
                    <a href="solicitudesAdopcion.html">Solicitudes de Adopción</a>
                    <!--<a href="#">Solicitudes de Adopción</a>-->
                    <hr>
                    <a href="/login/login.html">Cerrar Sesión</a>
                </div>


                <div class="container-fluid d-flex" id="contenido-principal" >
                    <div class="row d-flex flex-column" id="contenido-nofooter" style="flex-grow: 1; justify-content: center;">
                        <div class="container md-8" style="width: 100%;max-width: 1200px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            <!--Nombre Tabla-->
                            <h1 style="margin-top: 10px;" class="text-center">Solicitudes de Adopción</h1>

                            <!--Tabla DATATABLES-->
                            <div class="table-responsive" style="padding-bottom: 7px;">
                                <table class="table table-striped  table-bordered dataTable" style="width:100%;max-height: 100px;">
                                    <thead>
                                        <tr>
                                            <th> Solicitante </th><!--<th> Nombre del solicitante</th>-->
                                            <th> Distrito </th>
                                            <th> Dirección </th><!--Dirección del solicitante-->
                                            <th> Correo </th>
                                            <th> Acción </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Jeanpier Gutierrez</td>
                                            <td>Ancon</td>
                                            <td>Jr. Puente Terabithia</td>
                                            <td>dolorsit@gmail.com</td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></button> 
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>                                     
                                </table>
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

        <div id="popup" class="popup-overlay">
            <div class="popup-content">
            <h2>¿Seguro que desea rechazar esta solicitud?</h2>
            <div class="popup-buttons">
                <button class="btn-confirmar" onclick="confirmarAccion()">Confirmar</button>
                <button class="btn-cancelar" onclick="cerrarPopup()">Cancelar</button>
            </div>
            </div>
        </div>

        <!--DataTable-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function() {
                // Aplica DataTables a todas las tablas con la clase .dataTable
                $('.dataTable').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "info": true,
                    "scrollX": true,
                    // Opción para mostrar un menú de selección de cantidad de entradas
                    "lengthMenu": [[5, 10, 20, -1], [5, 10, 20, "Todos"]],
                    "pageLength": 5,
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por página",
                        "zeroRecords": "No se encontraron resultados",
                        "info": "Mostrando página _PAGE_ de _PAGES_",
                        "infoEmpty": "No hay registros disponibles",
                        "infoFiltered": "(filtrado de _MAX_ registros totales)",
                        "search": "Buscar:",
                        "paginate": {
                            "first": "Primero",
                            "last": "Último",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    },
                    columnDefs: [
                        { orderable: false, targets: [4] } // Cambia 0 por el índice de la columna que quieres deshabilitar
                    ]
                    
                });
            });
        </script>    


        <script src="/common/script/neonavbar.js"></script>
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
            function abrirPopup() {
              document.getElementById('popup').style.display = 'block';
            }
        
            // Función para cerrar el popup
            function cerrarPopup() {
              document.getElementById('popup').style.display = 'none';
            }
        
            // Función de confirmación (puedes agregar la lógica de eliminación aquí)
            function confirmarAccion() {
              alert('Solicitud rechazada');
              cerrarPopup();
            }
          </script>

        <script>
                
            // Función de confirmación 
            function aceptarSolicitud() {
            alert('Solicitud aceptada.');
            cerrarPopupCoordinador();
            }
        </script>
    </body>
</html>