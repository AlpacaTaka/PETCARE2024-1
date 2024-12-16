<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.iwebproyecto.beans.Usuario" %>
<%@ page import="com.example.iwebproyecto.beans.Albergue" %>
<%@ page import="com.example.iwebproyecto.beans.CoordinadorZona" %>
<%@ page import="com.example.iwebproyecto.beans.LugarEvento" %>
<jsp:useBean id="listaAlb" type="java.util.ArrayList<com.example.iwebproyecto.beans.Albergue>" scope="request"/>
<jsp:useBean id="listaUser" type="java.util.ArrayList<com.example.iwebproyecto.beans.Usuario>" scope="request"/>
<jsp:useBean id="listaCordZone" type="java.util.ArrayList<com.example.iwebproyecto.beans.CoordinadorZona>" scope="request"/>
<jsp:useBean id="listaLugares" type="java.util.ArrayList<com.example.iwebproyecto.beans.LugarEvento>" scope="request"/>
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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" rel="stylesheet">
    <title>Administracion</title>
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
            max-width: auto;
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
        <div class="logo"><a href="<%=request.getContextPath()%>/Dashboard"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
    </header>

    <div class="main">

        <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
        <div class="barside">
            <ul class="navlinks">
                <li><a href="<%=request.getContextPath()%>/admincuentas" title="Administracion"><i class="fi-rr-ballot-check"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/ValidarAlb" title="Validacion Albergues"><i class="fi-rr-house-building"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/ValidarUser" title="Validacion Usuarios"><i class="fi-rr-user-trust"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/CrearCoordinador" title="Crear Coordinador de Zona"><i class="fi-rr-people-network-partner"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/LugarHabilitado" title="Crear Lugar Habilitado"><i class="fi-rr-map-location-track"></i></a></li>
                <li><a href="<%=request.getContextPath()%>/Dashboard" title="Dashboard"><i class="fi-rr-search-alt"></i></a></li>
                <li id="cerrar-sesion"><a href="<%=request.getContextPath()%>" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
            </ul>

        </div>

        <div id="menu" class="menu">
            <a href="<%=request.getContextPath()%>/admincuentas">Administración</a>
            <hr>

            <a href="<%=request.getContextPath()%>/ValidarAlb">Validar Albergues</a>
            <a href="<%=request.getContextPath()%>/ValidarUser">Validar Usuarios</a>
            <hr>

            <a href="<%=request.getContextPath()%>/CrearCoordinador">Crear Coordinador de Zona</a>
            <a href="<%=request.getContextPath()%>/LugarHabilitado">Crear lugar habilitado</a>
            <hr>
            <a href="<%=request.getContextPath()%>/Dashboard">Dashboard</a>
            <hr>
            <a href="<%=request.getContextPath()%>">Cerrar Sesión</a>

        </div>


        <div class="container-fluid d-flex" id="contenido-principal">

            <div class="row d-flex flex-column" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                <div class="container" style="flex-grow: 1;align-content:center">
                    <div style="background-color:#eb903b76; border-radius: 20px; padding-left: 20px; padding-right: 20px; width: 100%;">
                        <div style="padding-top: 10px;width: 100%;">
                            <div class="container mt-3">
                                <div class="row d-flex text-center justify-content-md-center">
                                    <div class="col-md-auto">
                                        <span class="fi-rr-ballot-check" style="font-size: 50px;"></span>
                                    </div>
                                    <div class="col-md-auto align-self-center">
                                        <h2 id="AdminCuentas">Administración de Cuentas</h2>
                                    </div>
                                </div>
                            </div>
                            <div class="container mt-3 d-flex justify-content-center ">

                                <a href="#Usarios"><button type="button" class="btn btn-personal" style="margin-left: 5px; margin-right: 5px;">Usuarios</button></a>
                                <a href="#Albergues"><button type="button" class="btn btn-personal" style="margin-left: 5px; margin-right: 5px">Albergues</button></a>
                                <a href="#Coordinadores"><button type="button" class="btn btn-personal" style="margin-left: 5px; margin-right: 5px">Coordinadores</button></a>

                            </div>
                            <hr>

                            <!-- Table Wrapper -->
                            <div class="table-responsive" style="padding-bottom: 7px;">
                                <h3 id="Usuarios" >Usuarios</h3>
                                <table id="usuariosT" class="table table-striped table-bordered dataTable" style="width:100%;max-height: 100px;">
                                    <thead>
                                    <tr>
                                        <th>Nombres</th>
                                        <th>DNI</th>
                                        <th>Distrito</th>
                                        <th>Dirección</th>
                                        <th>Estado</th>

                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for (Usuario usuario : listaUser){%>
                                    <tr>
                                        <td><%=usuario.getNombre()%> <%=usuario.getApellido()%></td>
                                        <td><%=usuario.getDni()%></td>
                                        <td><%=usuario.getDistrito().getNombreDistrito()%></td>
                                        <td><%=usuario.getDireccion()%></td>
                                        <td><%String habilitado = usuario.isEliminado()?"Deshabilitado":"Habilitado";%><%=habilitado%></td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="<%=request.getContextPath()%>/UserAdmin?action=view&id=<%=usuario.getUsuarioID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
                                                <a href="<%=request.getContextPath()%>/UserAdmin?action=edit&id=<%=usuario.getUsuarioID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></span></button></a>
                                                <button onclick="abrirPopupUsuario('<%=request.getContextPath()%>/admincuentas?action=deleteUser&id=<%=usuario.getUsuarioID()%>')" type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Eliminar"><span class="fi fi-rr-trash"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <hr>
                            <div class="table-responsive" style="padding-bottom: 7px;">
                                <h3 id="Albergues">Albergues</h3>
                                <table id="alberguesT" class="table table-striped table-bordered dataTable" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Albergue</th>
                                        <th>Encargado</th>
                                        <th>URL Red Social</th>
                                        <th>Distrito</th>
                                        <th>Dirección</th>
                                        <th>Estado</th>

                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for (Albergue albergue : listaAlb){%>
                                    <tr>
                                        <td><%=albergue.getNombreAlbergue()%></td>
                                        <td><%=albergue.getNombreEncargado()%></td>
                                        <td><%=albergue.getUrlFacebook()%></td>
                                        <td><%=albergue.getDistrito().getNombreDistrito()%></td>
                                        <td><%=albergue.getDireccion()%></td>
                                        <td><%String habilitado = albergue.isEliminado()?"Deshabilitado":"Habilitado";%><%=habilitado%></td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="<%=request.getContextPath()%>/AlbAdmin?action=view&id=<%=albergue.getAlbergueID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
                                                <a href="<%=request.getContextPath()%>/AlbAdmin?action=edit&id=<%=albergue.getAlbergueID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></span></button></a>
                                                <button onclick="abrirPopupAlbergue('<%=request.getContextPath()%>/admincuentas?action=deleteAlb&id=<%=albergue.getAlbergueID()%>')" type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Eliminar"><span class="fi fi-rr-trash"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <hr>

                            <div class="table-responsive" style="padding-bottom: 7px;">
                                <h3 id="Coordinadores">Coordinadores de Zona</h3>
                                <div style="margin: 0 0 5px 0;">
                                    <a href="<%=request.getContextPath()%>/CrearCoordinador?action=create"><button type="button" class="btn btn-personal"><span class="fi fi-rr-add"></span>&nbspNuevo</button></a>
                                </div>
                                <table id="coordinador" class="table table-striped table-bordered dataTable" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Telefono de Contacto</th>
                                        <th>Zona</th>
                                        <th>Estado</th>

                                        <th>Acciones</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%for (CoordinadorZona coordinador : listaCordZone){%>
                                    <tr>
                                        <td><%=coordinador.getNombre()%></td>
                                        <td><%=coordinador.getApellido()%></td>
                                        <td><%=coordinador.getDni()%></td>
                                        <td><%=coordinador.getZona().getNombreZona()%></td>
                                        <td><%String habilitado = coordinador.isFlag()?"Deshabilitado":"Habilitado";%><%=habilitado%></td>


                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="<%=request.getContextPath()%>/CrearCoordinador?action=view&id=<%=coordinador.getCoordinadorID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
                                                <a href="<%=request.getContextPath()%>/CrearCoordinador?action=edit&id=<%=coordinador.getCoordinadorID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></span></button></a>
                                                <button onclick="abrirPopupCoordinador('<%=request.getContextPath()%>/admincuentas?action=deleteCoord&id=<%=coordinador.getCoordinadorID()%>')" type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Eliminar"><span class="fi fi-rr-trash"></span></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="container" style="flex-grow: 1;align-content:center;padding-top: 30px;">
                    <div style="background-color:#eb903b76; border-radius: 20px; padding-left: 20px; padding-right: 20px; width: 100%;">
                        <div style="width: 100%;">
                            <div>
                                <div class="row d-flex text-center justify-content-md-center" style="padding-top: 20px;">
                                    <div class="col-md-auto">
                                        <span class="fi-rr-map-location-track" style="font-size: 50px;"></span>
                                    </div>
                                    <div class="col-md-auto align-self-center">
                                        <h2>Administración de Lugares Habilitados</h2>
                                    </div>
                                </div>
                                <hr>
                                <div style="margin: 0 0 5px 0;">
                                    <a href="<%=request.getContextPath()%>/LugarHabilitado?action=create"><button type="button" class="btn btn-personal"><span class="fi fi-rr-add"></span>&nbspNuevo</button></a>
                                </div>
                                <div class="table-responsive" style="padding-bottom: 7px;">
                                    <table id="lugar" class="table table-striped table-bordered dataTable" style="width:100%">
                                        <thead>
                                        <tr>
                                            <th> Nombre </th>
                                            <th> Direccion </th>
                                            <th> Aforo Máximo </th>
                                            <th> Acciones </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%for (LugarEvento lugar : listaLugares){%>
                                        <tr>
                                            <td><%=lugar.getNombreLugar()%></td>
                                            <td><%=lugar.getDireccionLugar()%></td>
                                            <td><%=lugar.getAforoMax()%></td>
                                            <td>
                                                <div style="display: flex; justify-content: center;">
                                                    <a href="<%=request.getContextPath()%>/LugarHabilitado?action=view&id=<%=lugar.getLugarID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
                                                    <a href="<%=request.getContextPath()%>/LugarHabilitado?action=edit&id=<%=lugar.getLugarID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></span></button></a>
                                                    <button onclick="abrirPopupLugar('<%=request.getContextPath()%>/admincuentas?action=deleteLugar&id=<%=lugar.getLugarID()%>')" type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Eliminar"><span class="fi fi-rr-trash"></span></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <%}%>
                                        </tbody>
                                    </table>
                                </div>


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

<!-- Popup Modal -->

<div id="popupUsuario" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea eliminar este usuario?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccionUsuario()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopupUsuario()">Cancelar</button>
        </div>
    </div>
</div>

<div id="popupAlbergue" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea eliminar este albergue?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccionAlbergue()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopupAlbergue()">Cancelar</button>
        </div>
    </div>
</div>

<div id="popupCoordinador" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea eliminar este coordinador?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccionCoordinador()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopupCoordinador()">Cancelar</button>
        </div>
    </div>
</div>

<div id="popupLugar" class="popup-overlay">
    <div class="popup-content">
        <h2>¿Seguro que desea eliminar este lugar?</h2>
        <div class="popup-buttons">
            <button class="btn-confirmar" onclick="confirmarAccionLugar()">Confirmar</button>
            <button class="btn-cancelar" onclick="cerrarPopupLugar()">Cancelar</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        // Aplica DataTables a todas las tablas con la clase .dataTable
        $('#usuarios').DataTable({
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
            "columnDefs": [
                { "orderable": false, "targets": [5] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
            ]
        });
        $('#albergues').DataTable({
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
            "columnDefs": [
                { "orderable": false, "targets": [6] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
            ]
        });
        $('#coordinador').DataTable({
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
            "columnDefs": [
                { "orderable": false, "targets": [5] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
            ]
        });
        $('#lugar').DataTable({
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
            "columnDefs": [
                { "orderable": false, "targets": [3] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
            ]
        });
    });
</script>
<script src="${pageContext.request.contextPath}/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    // Función para abrir el popup
    function abrirPopupLugar(redireccionamiento) {
        document.getElementById('popupLugar').style.display = 'block';
        document.getElementById('popupLugar').href = redireccionamiento;
    }
    // Función para cerrar el popup
    function cerrarPopupLugar() {
        document.getElementById('popupLugar').style.display = 'none';
        document.getElementById('popupLugar').href = null;
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccionLugar() {
        alert('Lugar eliminado correctamente.')
        window.location.href = document.getElementById('popupLugar').href;
        cerrarPopupLugar();
    }
</script>
<script>
    // Función para abrir el popup
    function abrirPopupUsuario(redireccionamiento) {
        document.getElementById('popupUsuario').style.display = 'block';
        document.getElementById('popupUsuario').href = redireccionamiento;
    }
    // Función para cerrar el popup
    function cerrarPopupUsuario() {
        document.getElementById('popupUsuario').style.display = 'none';
        document.getElementById('popupUsuario').href = null;
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccionUsuario() {
        alert('Usuario eliminado correctamente.')
        window.location.href = document.getElementById('popupUsuario').href;
        cerrarPopupUsuario();
    }
</script>
<script>
    // Función para abrir el popup
    function abrirPopupAlbergue(redireccionamiento) {
        document.getElementById('popupAlbergue').style.display = 'block';
        document.getElementById('popupAlbergue').href = redireccionamiento;
    }
    // Función para cerrar el popup
    function cerrarPopupAlbergue() {
        document.getElementById('popupAlbergue').style.display = 'none';
        document.getElementById('popupAlbergue').href = null;
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccionAlbergue() {
        alert('Albergue eliminado correctamente.')
        window.location.href = document.getElementById('popupAlbergue').href;
        cerrarPopupAlbergue();
    }
</script>
<script>
    // Función para abrir el popup
    function abrirPopupCoordinador(redireccionamiento) {
        document.getElementById('popupCoordinador').style.display = 'block';
        document.getElementById('popupCoordinador').href = redireccionamiento;
    }
    // Función para cerrar el popup
    function cerrarPopupCoordinador() {
        document.getElementById('popupCoordinador').style.display = 'none';
        document.getElementById('popupCoordinador').href = null;
    }

    // Función de confirmación (puedes agregar la lógica de eliminación aquí)
    function confirmarAccionCoordinador() {
        alert('Coordinador eliminado correctamente.')
        window.location.href = document.getElementById('popupCoordinador').href;
        cerrarPopupCoordinador();
    }
</script>

</body>
</html>
