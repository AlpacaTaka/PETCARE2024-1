<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
    <link href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <title>Validación de Usuarios</title>
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
            <div class="welcome-text">Hola, Administrador</div>
        </div>
        <div class="logo"><a href="/administrator/dashboard.html"><img src="/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/admincuentas" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
                <li><a href="/administrator/solicitudCuentaAlbergues.html" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
                <li><a href="/administrator/validacionUsuarios.html" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/CrearCoordinador" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/LugarHabilitado" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/Dashboard" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
                <li id="cerrar-sesion"><a href="/login/login.html" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="<%=request.getContextPath()%>/admincuentas">Administración</a>
            <hr>

            <a href="/administrator/solicitudCuentaAlbergues.html">Validar Albergues</a>
            <a href="/administrator/validacionUsuarios.html">Validar Usuarios</a>
            <hr>

            <a href="<%=request.getContextPath()%>/CrearCoordinador">Crear Coordinador de Zona</a>
            <a href="<%=request.getContextPath()%>/LugarHabilitado">Crear lugar habilitado</a>
            <hr>
            <a href="<%=request.getContextPath()%>/Dashboard">Dashboard</a>
            <hr>
            <a href="/login/login.html">Cerrar Sesión</a>


        </div>


        <div class="container-fluid d-flex" id="contenido-principal">



            <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container">
                    <div style="background-color:#eb903b76; border-radius: 20px; padding-left: 20px; padding-right: 20px; width: 100%;">

                        <div style="padding-top: 10px;width: 100%;">

                            <h2 style="margin-top: 10px;" class="text-center">Validacion de Usuarios</h2>
                            <hr>

                            <!-- Table Wrapper -->
                            <div class="table-responsive" style="padding-bottom: 7px;">
                                <table id="example" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Nombres</th>
                                        <th>DNI</th>
                                        <th>Distrito</th>
                                        <th>Dirección</th>

                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Agrega más filas según sea necesario -->
                                    <tr>
                                        <td>Pedro Castillo</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                    <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Juan Ernesto Pacheco Solorzano</td>
                                        <td>7421973</td>
                                        <td>Pueblo Libre</td>
                                        <td>Calle Parque San Martin 242 Dpto. 904</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <button type="button" onclick="aceptarSolicitud()" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Aceptar"><span class="fi fi-rr-check"></span></button>
                                                <button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Rechazar" onclick="abrirPopup()"><span class="fi fi-rr-x"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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

<div id="popup" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea rechazar esta solicitud?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccion()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopup()">Cancelar</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "info": true,
            "scrollX": true,
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
            "columnDefs": [
                { "orderable": false, "targets": [4] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
            ]
        });
    });
</script>
<script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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
