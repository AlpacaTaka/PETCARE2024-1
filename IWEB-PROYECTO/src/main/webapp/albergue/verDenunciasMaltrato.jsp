<%@ page import="com.example.iwebproyecto.beans.DenunciaMaltrato" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="lista" type="java.util.ArrayList<com.example.iwebproyecto.beans.DenunciaMaltrato>" scope="request" />
<jsp:useBean id="albergue" type="com.example.iwebproyecto.beans.Albergue" scope="request"/>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="${pageContext.request.contextPath}/common/img/logos/paw.ico">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common/css/baseDesign.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
  <link href="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css" rel="stylesheet">
  <title>Denuncias por maltrato</title>
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
      <div class="welcome-text">Hola, <%=albergue.getNombreAlbergue()%></div>
    </div>
    <div class="logo"><a href="<%=request.getContextPath()%>/miPerfilAlbergue"><img src="<%=request.getContextPath()%>/common/img/logos/logo_navbar.png" alt="logo"></a></div>
  </header>

  <div class="main">

    <!-- El barside y el menu se pueden modificar de acuerdo al actor-->
    <div class="barside">
      <ul class="navlinks">
        <li><a href="<%=request.getContextPath()%>/miPerfilAlbergue" title="Mi Perfil"><i class="fi-rr-circle-user"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/PortalAdopciones" title="Portal de Adopciones"><i class="fi-rr-cat-dog"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/eventos" title="Mis Eventos Benéficos"><i class="fi-rr-calendar-star"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/DonacionSuministros" title="Mis Eventos de Donación"><i class="fi-rr-hand-heart"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/HogaresTemporalesAlbergue" title="Hogares Temporales"><i class="fi-rr-home-heart"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/SolicitudesDeAdopcion" title="Solicitudes de Adopción"><i class="fi-rr-paw-heart"></i></a></li>
        <li><a href="<%=request.getContextPath()%>/DenunciasDeMaltrato" title="Denuncias de maltrato"><i class="fi-rr-siren-on"></i></a></li>
        <!--<li><a href="#cuenta" title="Administrar"><i class="fi-rr-chart-tree-map"></i></a></li> PARA MOSTRAR LOS DONANTES...-->
        <li id="cerrar-sesion"><a href="<%=request.getContextPath()%>" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
      </ul>
    </div>

    <div id="menu" class="menu">
      <a href="<%=request.getContextPath()%>/miPerfilAlbergue">Mi Perfil</a>
      <a href="<%=request.getContextPath()%>/PortalAdopciones">Portal de Adopciones</a>
      <a href="<%=request.getContextPath()%>/eventos">Mis Eventos Benéficos</a>
      <a href="<%=request.getContextPath()%>/DonacionSuministros">Mis Eventos de Donación</a>
      <a href="<%=request.getContextPath()%>/HogaresTemporalesAlbergue">Hogares Temporales</a>
      <a href="<%=request.getContextPath()%>/SolicitudesDeAdopcion">Solicitudes de Adopción</a>
      <a href="<%=request.getContextPath()%>/DenunciasDeMaltrato">Denuncias de maltrato</a>
      <!--<a href="#">Solicitudes de Adopción</a>-->
      <hr>
      <a href="<%=request.getContextPath()%>">Cerrar Sesión</a>
    </div>


    <div class="container-fluid d-flex" id="contenido-principal">
      <div class="container" style="flex-grow: 1;align-content:center;padding-top: 30px;">
        <div style="background-color:#eb903b76; border-radius: 20px; padding-left: 20px; padding-right: 20px; width: 100%;">
          <div style="width: 100%;">
            <div>
              <div class="row d-flex text-center justify-content-md-center" style="padding-top: 20px;">
                <div class="col-md-auto">
                  <span class="fi-rr-siren-on" style="font-size: 50px;"></span>
                </div>
                <div class="col-md-auto align-self-center">
                  <h2>Visualizar denuncias por maltrato</h2>
                </div>
              </div>
              <hr>

              <div class="table-responsive" style="padding-bottom: 7px;">
                <table id="verDenunciasMaltrato" class="table table-striped table-bordered dataTable" style="width:100%">
                  <thead>
                  <tr>
                    <th> Tipo de maltrato </th>
                    <th> Nombres y apellidos del matratador </th>
                    <th> Dirección de la mascota </th>
                    <th> Correo de contacto </th>
                    <th> Acciones</th>
                  </tr>
                  </thead>
                  <tbody>
                  <%String desconocido = "";%>
                  <%for(DenunciaMaltrato denunciaMaltrato : lista){%>
                  <tr>
                    <td><%=denunciaMaltrato.getTipoMaltrato()%></td>
                    <td><%desconocido = denunciaMaltrato.getNombreApellidoMaltratador()==null ? "Desconocido" : denunciaMaltrato.getNombreApellidoMaltratador();%><%=desconocido%></td>
                    <td><%=denunciaMaltrato.getUsuario().getDistrito().getNombreDistrito()+"-"+denunciaMaltrato.getDireccion()%></td>
                    <td><%=denunciaMaltrato.getUsuario().getCorreoElectronico()%></td>
                    <td>
                      <div style="display: flex; justify-content: center;">
                        <a href="<%=request.getContextPath()%>/DenunciasDeMaltrato?action=view&id=<%=denunciaMaltrato.getDenunciaID()%>"><button type="button" class="btn btn-light" style="margin-right: 3px;border-color: black; border-width: 1px;" title="Visualizar"><span class="fi fi-rr-eye"></span></button></a>
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
    $('#verDenunciasMaltrato').DataTable({
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
        { "orderable": false, "targets": [0,1,2,3,4] } // Suponiendo que la columna de Acciones es la sexta columna (índice 5)
      ]
    });
  });
</script>
<script src="<%=request.getContextPath()%>/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  // Función para abrir el popup
  function abrirPopupLugar() {
    document.getElementById('popupLugar').style.display = 'block';
  }

  // Función para cerrar el popup
  function cerrarPopupLugar() {
    document.getElementById('popupLugar').style.display = 'none';
  }

  // Función de confirmación (puedes agregar la lógica de eliminación aquí)
  function confirmarAccionLugar() {
    alert('Lugar eliminado correctamente.');
    cerrarPopupLugar();
  }
</script>

<script>
  // Función para abrir el popup
  function abrirPopupUsuario() {
    document.getElementById('popupUsuario').style.display = 'block';
  }

  // Función para cerrar el popup
  function cerrarPopupUsuario() {
    document.getElementById('popupUsuario').style.display = 'none';
  }

  // Función de confirmación (puedes agregar la lógica de eliminación aquí)
  function confirmarAccionUsuario() {
    alert('Usuario eliminado correctamente.');
    cerrarPopupUsuario();
  }
</script>

<script>
  // Función para abrir el popup
  function abrirPopupAlbergue() {
    document.getElementById('popupAlbergue').style.display = 'block';
  }

  // Función para cerrar el popup
  function cerrarPopupAlbergue() {
    document.getElementById('popupAlbergue').style.display = 'none';
  }

  // Función de confirmación (puedes agregar la lógica de eliminación aquí)
  function confirmarAccionAlbergue() {
    alert('Albergue eliminado correctamente.');
    cerrarPopupAlbergue();
  }
</script>

<script>
  // Función para abrir el popup
  function abrirPopupCoordinador() {
    document.getElementById('popupCoordinador').style.display = 'block';
  }

  // Función para cerrar el popup
  function cerrarPopupCoordinador() {
    document.getElementById('popupCoordinador').style.display = 'none';
  }

  // Función de confirmación (puedes agregar la lógica de eliminación aquí)
  function confirmarAccionCoordinador() {
    alert('Coordinador eliminado correctamente.');
    cerrarPopupCoordinador();
  }
</script>


</body>
</html>