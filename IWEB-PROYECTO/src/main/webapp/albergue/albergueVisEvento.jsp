<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="evento" scope="request" type="com.example.iwebproyecto.beans.EventoBenefico"/>
<jsp:useBean id="albergue" scope="request" type="com.example.iwebproyecto.beans.Albergue"/>
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
    <title>Visualiza tu evento</title>
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
                        <form id="uploadForm" style="padding:10px" >
                            <h1 style="margin-top: 10px;" class="text-center">Estos son los detalles de tu evento</h1>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="nombre">Nombre del evento a realizar</label>
                                    <input type="text" id="nombre" class="form-control" value="${evento.nombre}" readonly disabled>
                                </div>
                                
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="tipoDonacion">Entrada</label>
                                    <select class="form-select" name="tipoDonacion" id="tipoDonacion" required disabled>
                                        <option value="${evento.tipoDonacion}" selected>${evento.tipoDonacion}</option>
                                    </select>
                                </div>

                                <div class="col-md-6 p-1">
                                    <label for="detalle">Detalle</label>
                                    <% System.out.println("Tipo de Donación: " + evento.getTipoDonacion()); %>
                                    <%  // Formatear el detalle según el tipo de donación
                                        if ("Monetario".equals(evento.getTipoDonacion())) {
                                    %>
                                    <input id="detalle" name="detalle" class="form-control" type="text" value="${evento.detalleMonetario}" disabled />
                                    <%
                                    } else {
                                    %>
                                    <input id="detalle" name="detalle" class="form-control" type="text" value="${evento.detalleSuministro}" disabled />
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="row justify-content-center p-1">
                                    <div class="col-md-6 p-1">
                                        <label for="distrito">Distrito</label>
                                        <select class="form-select" name="distrito" id="distrito" disabled>
                                            <option value="${evento.distrito.distritoID}">${evento.distrito.nombreDistrito}</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 p-1">
                                        <label for="fechaEvento">Fecha del evento</label>
                                        <input type="date" class="form-control" id="fechaEvento" value ="${evento.fechaEvento}" readonly disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-4 p-1">
                                    <label for="aforo">Aforo máximo del evento</label>
                                    <input type="number" class="form-control" id="aforo" value="${evento.lugar.aforoMax}" readonly disabled>
                                </div>
                                <div class="col-md-8 p-1">
                                    <label for="lugar">Locales disponibles</label>
                                    <select class="form-select" name="lugar" id="lugar" disabled>
                                        <option value="lugar">${evento.lugar.nombreLugar}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="Direccion">Dirección del evento</label>
                                    <input type="text" class="form-control" value="${evento.lugar.direccionLugar}" maxlength="100" id="Direccion" name="Direccion" readonly disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-6 p-1">
                                    <label for="horaInicio">Hora Inicio</label>
                                    <input type="time" class="form-control" id="horaInicio" value="${evento.horaInicio}" readonly disabled>
                                </div>
                                <div class="col-md-6 p-1">
                                    <label for="horaFin">Hora Fin</label>
                                    <input type="time" class="form-control" id="horaFin" value="${evento.horaFin}" readonly disabled>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="razon"> Motivo de la realización del evento</label>
                                    <textarea name="" id="razon" disabled class="form-control" maxlength="300" placeholder="${evento.razonEvento}"></textarea>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="descripcion"> Descripción de su evento</label>
                                    <textarea name="" id="descripcion" disabled class="form-control" maxlength="1000" placeholder="${evento.descripcionEvento}"></textarea>
                                </div>
                            </div>
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1">
                                    <label for="invitados">Invitados al evento (opcional)</label>
                                    <input type="text" id="invitados" class="form-control" value="${evento.invitados}" readonly disabled>
                                </div>
                            </div> 
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 justify-content-center">
                                    <label for="formFile" class="form-label">Subir un flyer del evento (PNG)</label>
                                    <input class="form-control" type="text" id="formFile" accept=".png" value="${evento.foto.rutaFoto}" disabled>
                                </div>
                                <div id="fileError" class="text-danger mt-2" style="display: none;">El archivo debe ser una imagen PNG.</div>
                            </div> 
                            <div class="row justify-content-center p-1">
                                <div class="col-md-12 p-1 d-flex justify-content-center">
                                    <a href="eventTable.jsp"><button type="button" class="btn btn-personal">Cerrar</button></a>
                                </div>
                            </div>                           
                        </form>
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
            console.log('Valor detalleSuministro:', document.getElementsByName('detalleSuministro')[0]?.value);
            console.log('Valor detalleMonetario:', document.getElementsByName('detalleMonetario')[0]?.value);
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
    const localData = {
        "ancon": {
            locales: [
                { name: "El clasico local 1", aforo: 100, direccion: "Av. San Juan 123" },
                { name: "El local de la playa", aforo: 120, direccion: "Calle Mar Azul 456" }
            ]
        },
        "santa_rosa": {
            locales: [
                { name: "El bonito local 2", aforo: 150, direccion: "Calle Futura 456" },
                { name: "El local del parque", aforo: 80, direccion: "Av. Parque Central 789" }
            ]
        },
        "carabayllo": {
            locales: [
                { name: "El pequeño local 3", aforo: 80, direccion: "Jr. Esperanza 789" },
                { name: "El local del río", aforo: 90, direccion: "Calle Río Verde 101" }
            ]
        },
        "puente_piedra": {
            locales: [
                { name: "El gran local 4", aforo: 200, direccion: "Av. Libertad 321" },
                { name: "El local histórico", aforo: 250, direccion: "Calle Historia 202" }
            ]
        },
    };

    document.getElementById('distrito').addEventListener('change', function() {
        const selectedDistrito = this.value;
        const localSelect = document.getElementById('locales');
        localSelect.innerHTML = '<option value="">Seleccione un local</option>';

        if (localData[selectedDistrito]) {
            localData[selectedDistrito].locales.forEach(local => {
                const option = document.createElement('option');
                option.value = local.name;
                option.text = local.name;
                localSelect.appendChild(option);
            });
        }
    });

    document.getElementById('locales').addEventListener('change', function() {
        const selectedLocalName = this.value;
        const aforoInput = document.getElementById('aforo');
        const direccionInput = document.getElementById('Direccion');

        // Clear values
        aforoInput.value = '';
        direccionInput.value = '';

        for (const distrito in localData) {
            const locales = localData[distrito].locales;
            const foundLocal = locales.find(local => local.name === selectedLocalName);
            if (foundLocal) {
                aforoInput.value = foundLocal.aforo;
                direccionInput.value = foundLocal.direccion;
                break;
            }
        }
    });
</script>
<script>
    function toggleInput() {
        const select = document.getElementById('tipoDonacion');
        const detalleInput = document.getElementById('detalle');
        const detalleMonetarioHidden = document.getElementById('detalleMonetario');

        // Resetear valores
        detalleInput.value = '';
        detalleMonetarioHidden.value = '';
        detalleInput.disabled = false;

        if (select.value === 'monetario') {
            detalleInput.type = 'number';
            detalleInput.placeholder = 'Ingrese el monto (máx. 3 dígitos)';
            detalleInput.maxLength = 3;

            // Para entrada monetaria
            detalleInput.oninput = function() {
                // Limitar a 3 dígitos y solo números
                this.value = this.value.replace(/[^0-9]/g, '').slice(0, 3);
                // Actualizar el campo hidden para detalleMonetario
                detalleMonetarioHidden.value = this.value;
                // Limpiar el name del input visible para que no se envíe como detalleSuministro
                this.name = '';
            };
        } else if (select.value === 'suministros') {
            detalleInput.type = 'text';
            detalleInput.placeholder = 'Ingrese los suministros requeridos';
            detalleInput.maxLength = 60;

            // Para entrada de suministros
            detalleInput.oninput = function() {
                // Solo permitir letras y espacios
                this.value = this.value.replace(/[^a-zA-Z\s]/g, '').slice(0, 60);
                // Restablecer el name para enviar como detalleSuministro
                this.name = 'detalleSuministro';
                // Limpiar el campo hidden de detalleMonetario
                detalleMonetarioHidden.value = '';
            };
        } else {
            detalleInput.disabled = true;
            detalleInput.placeholder = 'Seleccione una opción';
        }
    }

    document.getElementById('uploadForm').addEventListener('submit', function(event) {
        const tipoDonacion = document.getElementById('tipoDonacion').value;
        const detalle = document.getElementById('detalle').value;

        if (tipoDonacion && !detalle) {
            event.preventDefault();
            alert('Por favor complete el detalle de la donación');
        }
    });
</script>
</body>
</html>