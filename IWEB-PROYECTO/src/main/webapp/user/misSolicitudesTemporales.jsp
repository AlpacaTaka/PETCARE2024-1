<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/common/img/logos/paw.ico">
    <link rel="stylesheet" href="/common/uicons-regular-rounded/css/uicons-regular-rounded.css">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="/common/css/baseDesign.css">
    <link rel="stylesheet" href="CSSDELAPAGINA.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <link href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" rel="stylesheet">
    <title>Postular como Hogar Temporal</title>

    <style>
        /* Para Chrome, Safari y Opera */
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        
        .table td, .table th {
    vertical-align: middle; /* Alinea verticalmente al centro */
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
                    <li><a href="${pageContext.request.contextPath}/MiPerfilUsuario" title="Mi cuenta"><i class="fi-rr-circle-user"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosEventos" title="Eventos"><i class="fi-rr-calendar-star"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PostulacionTemporal" title="Hogar Temporal"><i class="fi-rr-home-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/SolicitudesDeSuministros" title="Donaciones de suministros"><i class="fi-rr-paw-heart"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/TodosLosAlbergues" title="Donaciones Monetarias"><i class="fi-rr-hand-holding-usd"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/PortalDeAdopcion" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
                    <li><a href="${pageContext.request.contextPath}/Inicio" title="Reportar Mascota Perdida"><i class="fi-rr-message-alert"></i></a></li>

                    <li><a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" title="Reportar Maltrato"><i class="fi-rr-siren-on"></i></a></li>

                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>                </ul>

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
                <a href="${pageContext.request.contextPath}/Inicio">Portal de Mascotas Perdidas</a>
                <a href="${pageContext.request.contextPath}/Inicio">Portal Avistamiento Perdidos</a>
                <a href="${pageContext.request.contextPath}/Inicio">Reportar Mascota Perdida</a>
                <a href="${pageContext.request.contextPath}/ReportarMaltratoServlet" id="Sep">Reportar Maltrato</a>
                <hr>
                <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>

            </div>

            <div class="container-fluid d-flex" id="contenido-principal">
                <!--Boton de regreso a la página principal-->
                <div class="col" id="contenido-nofooter">
                    <div class="container md-8 d-flex justify-content-between" style="width: 93%;max-width: 1400px; margin-bottom: 20px; padding: 0;">
                        <button type="button"  class="btn btn-personal2" onclick="location.href='postularTemporal.jsp'">  Regresar   </button>
                        
                    </div>
                    <div class="container md-12" style="width: 93%;max-width: 1400px; background-color: #fca6519f; border-radius: 30px; margin-bottom: 10px; padding: 10px 20px;">
                        <div class="row d-flex text-center justify-content-md-center">
                            <div class="col-md-auto">
                                <span  id="casaAmor" class="fi-rr-home-heart" style="font-size: 60px;color: #4d0e0e"></span>
                            </div>
                            <div class="col-md-auto align-self-center">
                                <h1 style=" color: #4d0e0e; font-style: italic" class="text-center" >Tus postulaciones como hogar  temporal</h1>
                            </div>
                        </div>
                        

                        <p style="margin: 0px 20px;" class="text-center">En este portal puedes ver el historial de tus solicitudes; asi como editar solicitudes sin aprobar.</p>
                        <hr class="huellitas">
                        <p style="margin: 5px 20px" class="text-center">Solo podras editar solicitudes activas que  no hayan sido aprobadas. </p>

                        
                    </div>
                    
                    <!--Container del formulario-->
                    <div class="container md-8" style="width: 93%;max-width: 1400px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                        <!--Tabla DATATABLES-->
                        <div class="table-responsive p-3" style="padding-bottom: 10px;">
                            <table id="example" class="table table-striped  table-bordered dataTable" style="width:100%;max-height: 100px;">
                                <thead>
                                    <tr>
                                        <th> Id</th>

                                        <!--<th>Motivo/Descripción</th>-->
                                        
                                        <th> Distrito </th>
                                        <th> Dirección </th>
                                        <th> Fecha Inicio </th>
                                        <th> Fecha Final</th><!--Hora inicio-Hora fin-->
                                        <th> 1° Momento </th>
                                        
                                        <th> Acción </th>
                                        <th>  </th>
                                        <th> Estado </th>
                                    </tr>    
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>001</td>
                                        
                                        <td>Ate</td>
                                        <td>Av. De  la Marina 123</td>
                                        <td>20-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>En espera</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light disabled" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" hidden>Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>002</td>
                                        
                                        <td>Ate</td>
                                        <td>Av. Los Sauces 454</td>
                                        <td>19-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Habilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light disabled" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp" ><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" >Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>003</td>
                                        
                                        <td>Jesús María</td>
                                        <td>Av. Alfredo Benavides 1543</td>
                                        <td>21-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Inhabilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light disabled" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" hidden>Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>004</td>
                                        
                                        <td>Lurin</td>
                                        <td>Calle Los Alisos 345</td>
                                        <td>30-02-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Habilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                               
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp" ><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" >Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>005</td>
                                        
                                        <td>Santiago de Surco</td>
                                        <td>Av. Batallón Callao Sur 654</td>
                                        <td>19-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>En espera</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light disabled" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                    
                                               
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" hidden>Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>006</td>
                                        
                                        <td>Miraflores</td>
                                        <td>Av. El Ejército 123</td>
                                        <td>19-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Habilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp" ><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" >Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>007</td>
                                        
                                        <td>Ate</td>
                                        <td>Av. De  la Marina 123</td>
                                        <td>19-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Habilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp" ><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascota" >Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>Aceptado</td>
                                    </tr>
                                    <tr>
                                        <td>008</td>
                                        
                                        <td>Ate</td>
                                        <td>Av. De  la Marina 123</td>
                                        <td>19-10-2024</td>
                                        <td>15-12-2024</td>
                                        <td>Habilitado</td>

                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                <a href="verSolicitudTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></button></a>
                                                <a href="editarTemporal.jsp"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Editar"><span class="fi fi-rr-edit"></button></a>
                                            </div>  
                                        </td>
                                        <td>
                                            <div style="display: flex; justify-content: center;">
                                                
                                                <a href="verMascotasARecibir.jsp" ><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Ver Mascotas" >Ver Mascota</button></a>
                                                
                                            </div>  
                                        </td>
                                        <td>Aceptado</td>
                                    </tr>
                                </tbody>                                     
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Footer (no tocar si ya esta listo)-->
                <footer class="p-3">
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
                        { orderable: false, targets: [6,7,8] } // Cambia 0 por el índice de la columna que quieres deshabilitar
                    ]
                    
                });
            });
        </script>
    </body>
</html>