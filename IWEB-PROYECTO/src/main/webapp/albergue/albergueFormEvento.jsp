<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="albergue" class="com.example.iwebproyecto.beans.Albergue" scope="request"/>
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
    <title>Crea tu evento</title>
    <style>
        
        /* Esto es solo de referencia para ver su espacio disponible - borrar*/ 
        
        
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
                    <li id="cerrar-sesion"><a href="${pageContext.request.contextPath}/Login?action=logout" title="Cerrar Sesion"><i class="fi-rr-power"></i></a></li>
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
                <a href="${pageContext.request.contextPath}/Login?action=logout">Cerrar Sesión</a>
            </div>
            <div class="container-fluid d-flex" id="contenido-principal">
                <div class="row" id="contenido-nofooter" style="flex-grow: 1;align-content:center">
                    <div class="container md-8  d-flex justify-content-center" style="width: 85%; margin-bottom: 20px; padding: 0;">
                        <a href="eventTable.jsp"><button type="button" class="btn btn-personal2">Regresar</button></a>
                    </div>
                    <div class="container md-8" style="width: 85%;max-width: 800px; background-color:#eb903b76; border-radius: 30px; padding: 0 20px;">
                            <form id="uploadForm" action="${pageContext.request.contextPath}/eventos" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                                <input type="hidden" name="action" value="guardar">
                                <h1 style="margin-top: 10px;" class="text-center">Completa los detalles requeridos para tu evento</h1>
                                <div class="row justify-content-center p-1">   
                                    <div class="col-md-12 p-1">
                                        <label for="nombre">Nombre del evento a realizar</label>
                                        <input type="text" id="nombre" name = "nombre" maxlength="30" class="form-control" placeholder="Ingrese el nombre del evento" required>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <label for="tipoDonacion">Entrada</label>
                                        <select class="form-select" name="tipoDonacion" id="tipoDonacion" required onchange="toggleInput()">
                                            <option value="">Selecciona una opción</option>
                                            <option value="Monetario">Monetario</option>
                                            <option value="Suministros">Suministros</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6 p-1">
                                        <label for="detalle">Detalle</label>
                                        <input id="detalle" name="detalleSuministro" class="form-control" type="text" placeholder="Seleccione una opción" disabled />
                                        <input type="hidden" id="detalleMonetario" name="detalleMonetario" />
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="row justify-content-center p-1">
                                        <div class="col-md-6 p-1">
                                            <label for="distrito">Distrito</label>
                                            <select class="form-select" name="distrito" id="distrito" required>
                                                <option value="">Selecciona un distrito</option>
                                                <optgroup label="Lima Norte">
                                                    <option value="1">Ancon</option>
                                                    <option value="2">Santa Rosa</option>
                                                    <option value="3">Carabayllo</option>
                                                    <option value="4">Puente Piedra</option>
                                                    <option value="5">Comas</option>
                                                    <option value="6">Los Olivos</option>
                                                    <option value="7">San Martín de Porres</option>
                                                    <option value="8">Independencia</option>
                                                </optgroup>
                                                <optgroup label="Lima Sur">
                                                    <option value="9">San Juan de Miraflores</option>
                                                    <option value="10">Villa María del Triunfo</option>
                                                    <option value="11">Villa El Salvador</option>
                                                    <option value="12">Pachacamac</option>
                                                    <option value="13">Lurin</option>
                                                    <option value="14">Punta Hermosa</option>
                                                    <option value="15">Punta Negra</option>
                                                    <option value="16">San Bartolo</option>
                                                    <option value="17">Santa María del Mar</option>
                                                    <option value="18">Pucusana</option>
                                                </optgroup>
                                                <optgroup label="Lima Este">
                                                    <option value="19">San Juan de Lurigancho</option>
                                                    <option value="20">Lurigancho/Chosica</option>
                                                    <option value="21">Ate</option>
                                                    <option value="22">El Agustino</option>
                                                    <option value="23">Santa Anita</option>
                                                    <option value="24">La Molina</option>
                                                    <option value="25">Cieneguilla</option>
                                                </optgroup>
                                                <optgroup label="Lima Oeste">
                                                    <option value="26">Rimac</option>
                                                    <option value="27">Cercado de Lima</option>
                                                    <option value="28">Breña</option>
                                                    <option value="29">Pueblo Libre</option>
                                                    <option value="30">Magdalena</option>
                                                    <option value="31">Jesus María</option>
                                                    <option value="32">La Victoria</option>
                                                    <option value="33">Lince</option>
                                                    <option value="34">San Isidro</option>
                                                    <option value="35">San Miguel</option>
                                                    <option value="36">Surquillo</option>
                                                    <option value="37">San Borja</option>
                                                    <option value="38">Santiago de Surco</option>
                                                    <option value="39">Barranco</option>
                                                    <option value="40">Chorrillos</option>
                                                    <option value="41">San Luis</option>
                                                    <option value="42">Miraflores</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                        <div class="col-md-6 p-1">
                                            <label for="fechaEvento">Fecha del evento</label>
                                            <input type="date" class="form-control" id="fechaEvento" name="fechaEvento" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-4 p-1">
                                        <label for="aforo">Aforo máximo del evento</label>
                                        <input type="number" class="form-control" id="aforo" placeholder="Escoja un local" required readonly disabled>
                                    </div>
                                    <div class="col-md-8 p-1">
                                        <label for="lugar">Locales disponibles</label>
                                        <select class="form-select" name="lugar" id="lugar" required>
                                            <option value="">Seleccione un local</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="Direccion">Dirección del evento</label>
                                        <input type="text" class="form-control" placeholder="Escoja un local" maxlength="100" id="Direccion" name="Direccion" readonly disabled>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <label for="horaInicio">Hora Inicio</label>
                                        <input type="time" class="form-control" name = "horaInicio" id="horaInicio" placeholder="Ingrese la hora de inicio" required onchange="validarHoras()">
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="horaFin">Hora Fin</label>
                                        <input type="time" class="form-control" name = "horaFin" id="horaFin" placeholder="Ingrese la hora de fin" required onchange="validarHoras()">
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="razon"> Motivo de la realización del evento</label>
                                        <textarea name="razon" id="razon" class="form-control" maxlength="300" placeholder="Ingrese su motivo (max. 300 caracteres)"></textarea>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="descripcion"> Descripción de su evento</label>
                                        <textarea name="descripcion" id="descripcion" class="form-control" maxlength="1000" placeholder="Ingrese su descripción (max. 1000 caracteres)"></textarea>
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1">
                                        <label for="invitados">Invitados al evento (opcional)</label>
                                        <input type="text" name= "invitados" id="invitados" class="form-control" placeholder="Ingrese invitados, si es más de uno separar con comas">
                                    </div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 justify-content-center">
                                        <label for="foto" class="form-label">Subir un flyer del evento (PNG)</label>
                                        <input class="form-control" type="file" name = "foto" id="foto" accept=".png" required>
                                    </div>
                                    <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                                </div>
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-12 p-1 d-flex justify-content-center">
                                        <button type="submit" class="btn btn-personal">Crear</button>
                                    </div>
                                </div>
                            </form>
                    </div>    
                </div>
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

    <script src="/common/script/neonavbar.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        document.getElementById('uploadForm').addEventListener('submit', function(event) {
            const fileInput = document.getElementById('foto');
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
        //Limita la cant digitos de números
        const numeroInput = document.getElementById('cant_animales')
        numeroInput.addEventListener('input', function(){
            if(this.value.length > 3){
                this.value = this.value.slice(0,3);
            }
        })

    </script>
    <script>
        //Limita la cant digitos de números
        const numeroInput2 = document.getElementById('aforo')
        numeroInput2.addEventListener('input', function(){
            if(this.value.length > 4){
                this.value = this.value.slice(0,4);
            }
        })

    </script>
<script>
    function validarNumero() {
        const input = document.getElementById('num_contacto');
        let valor = input.value;

        // Limitar a un máximo de 9 caracteres
        if (valor.length > 9) {
            valor = valor.slice(0, 9);
        }

        // Verificar que el primer carácter sea 9
        if (valor.length > 0 && valor[0] !== '9') {
            input.value = ''; // Reiniciar el campo si no comienza con 9
            return;
        }

        // Verificar que el número tiene exactamente 9 dígitos
        if (valor.length === 9 && /^\d+$/.test(valor)) {
            // Si es válido, no hacer nada
        } else if (valor.length === 9) {
            input.value = ''; // Reiniciar si tiene 9 dígitos pero no es válido
        }

        // Asignar el valor limitado al input
        input.value = valor;
    }
</script>

<script>
    function validarHoras() {
        const inicio = document.getElementById('inicio').value;
        const fin = document.getElementById('fin').value;

        // Verificar si ambos campos tienen valores
        if (inicio && fin) {
            if (inicio > fin) {
                alert('La hora de inicio no puede ser posterior a la hora de fin.');
                document.getElementById('inicio').value = ''; // Limpiar el campo de inicio
                document.getElementById('fin').value = ''; // Limpiar el campo de fin
            }
        }
    }
</script>

    <script>
        document.getElementById('distrito').addEventListener('change', function() {
            const distritoId = this.value;
            const lugarSelect = document.getElementById('lugar');
            const aforoInput = document.getElementById('aforo');
            const direccionInput = document.getElementById('Direccion');

            // Resetear los campos
            aforoInput.value = '';
            direccionInput.value = '';

            if (distritoId) {
                // Crear y configurar la solicitud XMLHttpRequest
                const xhr = new XMLHttpRequest();
                xhr.open('GET', '${pageContext.request.contextPath}/eventos?action=getLugares&distritoId=' + distritoId, true);

                xhr.onload = function() {
                    if (xhr.status === 200) {
                        lugarSelect.innerHTML = xhr.responseText;
                    } else {
                        lugarSelect.innerHTML = '<option value="">Error al cargar lugares</option>';
                    }
                };

                xhr.onerror = function() {
                    lugarSelect.innerHTML = '<option value="">Error de conexión</option>';
                };

                xhr.send();
            } else {
                lugarSelect.innerHTML = '<option value="">Seleccione un local</option>';
            }
        });

        // Mantener el evento change para el select de lugar
        document.getElementById('lugar').addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            const aforoInput = document.getElementById('aforo');
            const direccionInput = document.getElementById('Direccion');

            if (selectedOption.value) {
                aforoInput.value = selectedOption.dataset.aforo;
                direccionInput.value = selectedOption.dataset.direccion;
            } else {
                aforoInput.value = '';
                direccionInput.value = '';
            }
        });
    </script>

<script>
    function toggleInput() {
        const select = document.getElementById('tipoDonacion');
        const detalleInput = document.getElementById('detalle');
        const detalleMonetarioHidden = document.getElementById('detalleMonetario');

        detalleInput.value = ''; // Limpia el campo
        detalleMonetarioHidden.value = ''; // Limpia el campo oculto

        if (select.value === 'Monetario') {
            detalleInput.type = 'number';
            detalleInput.placeholder = 'Ingrese el monto (máx. 3 dígitos)';
            detalleInput.maxLength = 3;
            detalleInput.name = 'detalleMonetario'; // Seteamos el nombre para que sea enviado como detalle monetario

            detalleInput.oninput = function() {
                this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);
                detalleMonetarioHidden.value = this.value; // Actualizamos el hidden input con el valor
            };
        } else if (select.value === 'Suministros') {
            detalleInput.type = 'text';
            detalleInput.placeholder = 'Ingrese los suministros requeridos';
            detalleInput.maxLength = 60;
            detalleInput.name = 'detalleSuministro'; //Seteamos el nombre para que sea enviado como suministros
            detalleInput.oninput = function() {
                this.value = this.value.replace(/[^a-zA-Z\s]/g, '').slice(0, 60);
                detalleMonetarioHidden.value = ''; //limpiamos el valor anterior
            };
        } else {
            detalleInput.placeholder = 'Seleccione una opción';
            detalleInput.name = ''; //limpiamos el nombre anterior
        }

        //Importante:  se quita el disable del input
        detalleInput.disabled = false;
    }


    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const tipoDonacion = document.getElementById('tipoDonacion').value;
        const detalle = document.getElementById('detalle').value;
        const detalleMonetario = document.getElementById('detalleMonetario').value;

        if (tipoDonacion === 'Monetario' && detalleMonetario.trim() === '') { //Validamos que si es monetario, detalleMonetario no este vacio
            event.preventDefault();
            alert('Por favor ingrese el monto');
        } else if (tipoDonacion === 'Suministros' && detalle.trim() === '') {  //Validamos que si es suministro, detalle no este vacio
            event.preventDefault();
            alert('Por favor ingrese los suministros');
        }
    });
</script>
</body>
</html>