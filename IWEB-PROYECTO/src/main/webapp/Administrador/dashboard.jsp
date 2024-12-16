<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="dashboardDTO" scope="request" type="com.example.iwebproyecto.dtos.DashboardDTO"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="<%=request.getContextPath()%>/common/img/logos/paw.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/common/uicons-regular-rounded/css/uicons-regular-rounded.css"  >

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/common/css/baseDesign.css">
    <title>Dashboard</title>
    <style>

    </style>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            <div class="row" id="contenido-nofooter" style="display: flex; flex-wrap: wrap; justify-content: center;flex-grow: 1;align-content:center">
                <!-- Primera Fila -->
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Donaciones Recibidas por Albergue</div>
                        <div class="card-body">
                            <canvas id="donacionesPorAlbergue" style="max-height: 184px"></canvas>
                            <input type="text" id="searchInput" placeholder="Buscar albergue">
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Top 10 Donaciones por Usuario</div>
                        <div class="card-body">
                            <canvas id="topDonacionesPorUsuario" style="max-height: 300px"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Segunda Fila -->
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Mascotas Perdidas en los Últimos Tres Meses</div>
                        <div class="card-body">
                            <canvas id="mascotasPerdidasMes" style="max-height: 300px"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Usuarios Inactivos vs Activos</div>
                        <div class="card-body">
                            <canvas id="usuariosBaneadosActivos" style="max-height: 215px"></canvas>
                        </div>
                    </div>
                </div>

                <!-- Tercera Fila -->
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Albergues Registrados En El Año</div>
                        <div class="card-body">
                            <canvas id="alberguesRegistrados" style="max-height: 300px"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="width: 100%;max-width: 500px;border-radius: 30px; padding: 20px;">
                    <div class="card">
                        <div class="card-header">Mascotas Encontradas en los Últimos Tres Meses</div>
                        <div class="card-body">
                            <canvas id="mascotasEncontradasMes" style="max-height: 300px"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <footer class="pt-4">
                <div class="container">
                    <div class="text-end">
                        <p>Soporte: soporte@teletubbies.com</p>
                    </div>
                </div>
            </footer>
        </div>


    </div>
</div>

<script src="<%=request.getContextPath()%>/common/script/neonavbar.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>

    const ctx = document.getElementById('donacionesPorAlbergue').getContext('2d');
    let donacionesPorAlbergue;

    // Datos de ejemplo (reemplaza con tus datos reales)
    const donacionesPorAlbergueData = {
        labels: [<%for(String NombreAlbergue : dashboardDTO.getAlberguesDonacion()){%>'<%=NombreAlbergue%>', <%}%>],
        datasets: [{
            label: 'Cantidad de donaciones',
            data: [<%for(int Cantidad : dashboardDTO.getCantidadesTotalesDonacionAlbergue()){%><%=Cantidad+", "%><%}%>],
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    };

    // Gráfico 1: Donaciones Recibidas por Albergue
    const ctxDonacionesPorAlbergue = document.getElementById('donacionesPorAlbergue').getContext('2d');
    donacionesPorAlbergue = new Chart(ctxDonacionesPorAlbergue, {
        type: 'bar',
        data: donacionesPorAlbergueData,
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value, index, values) {
                            return 'S/ ' + value;
                        }
                    }
                },

                x: {
                    ticks: {
                        maxRotation: 90, // Rota las etiquetas para ahorrar espacio
                        autoSkip: true, // Omite etiquetas si hay muchas
                    }
                }

            }
        }
    });

    // Gráfico 2: Top 10 Donaciones por Usuario
    const topDonacionesPorUsuarioData = {
        labels: [<%for (String user : dashboardDTO.getUsuariosDonacion()){%><%="'"+user+"',"%><%}%>],
        datasets: [{
            label: 'Cantidad de donaciones',
            data: [<%for (int cant : dashboardDTO.getCantidadesTotalesDonacionUsuario()){%><%="'"+cant+"',"%><%}%>],
            backgroundColor: 'rgba(255, 159, 64, 0.2)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1
        }]
    };
    const ctxTopDonacionesPorUsuario = document.getElementById('topDonacionesPorUsuario').getContext('2d');
    new Chart(ctxTopDonacionesPorUsuario, {
        type: 'bar',
        data: topDonacionesPorUsuarioData,
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value, index, values) {
                            return 'S/ ' + value;
                        }
                    }
                },

                x: {
                    ticks: {
                        maxRotation: 90, // Rota las etiquetas para ahorrar espacio
                        autoSkip: true, // Omite etiquetas si hay muchas
                    }
                }
            }
        }
    });

    // Suponiendo que tienes un array con la cantidad de mascotas perdidas por mes
    const monthsMap = {<%--"Enero": 5,"Febrero": 8,"Marzo": 12,"Abril": 4,"Mayo": 3,"Junio": 2,"Julio": 2,"Agosto": 5,"Septiembre": 8,"Octubre": 4,"Noviembre": 10,"Diciembre": 11,--%><%String comafinal=", ";%><%for (int i=dashboardDTO.getMesesMascotaPerdida().size()-1;i>=0;i--){%>
        "<%=dashboardDTO.getMesesMascotaPerdida().get(i)%>": <%=dashboardDTO.getCantidadesTotalesMesMascotaPerdida().get(i)%><%if(i==0){comafinal="";}%><%=comafinal%><%}%>
    };

    // Ejemplo de datos del año

    const mascotasPerdidasPorMes = Object.values(monthsMap);

    const { lastThreeMonths, totalYear } = getLastThreeMonthsAndYearTotal(monthsMap);


    console.log('Últimos 3 meses:', lastThreeMonths);
    console.log('Total del año:', totalYear);


    // Gráfico 3: Mascotas Perdidas por Mes
    const mascotasPerdidasMesData = {
        labels: lastThreeMonths, // Los últimos 3 meses
        datasets: [{
            label: 'Mascotas Perdidas',
            data: [<%--mascotasPerdidasPorMes[monthsMap[lastThreeMonths[0]]], // Julio mascotasPerdidasPorMes[monthsMap[lastThreeMonths[1]]], // AgostomascotasPerdidasPorMes[monthsMap[lastThreeMonths[2]]] // Septiembre--%>
                <%for (String mesParaMascotaPerdida: dashboardDTO.getMesesMascotaPerdida()){%>monthsMap["<%=mesParaMascotaPerdida%>"],<%}%>
            ],
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false
        }]
    };

    document.addEventListener("DOMContentLoaded", function() {
        const ctxMascotasPerdidasMes = document.getElementById('mascotasPerdidasMes').getContext('2d');
        new Chart(ctxMascotasPerdidasMes, {
            type: 'line',
            data: mascotasPerdidasMesData,
            options: {
                <%--plugins: {
                    title: {
                        display: true,
                        text: `Total de Mascotas Perdidas en el Año: ${totalYear}`
                    }
                },--%>
                scales: {
                    y: {
                        title: {
                            display: true,
                            text: 'Cantidad de Mascotas'
                        }
                    }
                }
            }
        });
    });

    // Gráfico 4: Usuarios Baneados vs Activos
    const usuariosBaneadosActivosData = {
        labels: ['Baneados', 'Activos'],
        datasets: [{
            label: 'Usuarios',
            data: [<%=dashboardDTO.getUsuariosDesactivados()%>,<%=dashboardDTO.getUsuarioActivos()%>],
            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(75, 192, 192, 0.2)'],
            borderColor: ['rgba(255, 99, 132, 1)', 'rgba(75, 192, 192, 1)'],
            borderWidth: 1
        }]
    };

    const ctxUsuariosBaneadosActivos = document.getElementById('usuariosBaneadosActivos').getContext('2d');
    new Chart(ctxUsuariosBaneadosActivos, {
        type: 'pie',
        data: usuariosBaneadosActivosData
    });

    // Gráfico 5: Albergues Registrados

    // Obtener la fecha actual
    const hoy = new Date();
    const indiceMesActual = hoy.getMonth();

    // Array con los nombres de todos los meses
    const todosLosMeses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

    // Datos de Albergues Registrados para
    const todosLosDatosDeAlbergues = [<%for (int k=1;k<13;k++){%><%int numero= dashboardDTO.getDiccionarioMesyRegistrados().containsKey(k) ? dashboardDTO.getDiccionarioMesyRegistrados().get(k) : 0;%><%=numero%>,<%}%>];

    // Filtrar los meses y los datos hasta el mes actual
    const etiquetasAlbergues = todosLosMeses.slice(0, indiceMesActual + 1);
    const datosAlbergues = todosLosDatosDeAlbergues.slice(0, indiceMesActual + 1);

    // Calcular la suma de albergues registrados hasta el mes actual
    const totalAlberguesRegistrados = datosAlbergues.reduce((total, valor) => total + valor, 0);

    // Crear el gráfico de Albergues Registrados
    const alberguesRegistradosData = {
        labels: etiquetasAlbergues,  // Mostrar solo etiquetas hasta el mes actual
        datasets: [{
            label: 'Albergues Registrados',
            data: datosAlbergues,  // Mostrar solo los datos hasta el mes actual
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
        }]
    };

    // Renderizar el gráfico cuando el DOM esté completamente cargado
    document.addEventListener("DOMContentLoaded", function() {
        const ctxAlberguesRegistrados = document.getElementById('alberguesRegistrados').getContext('2d');
        new Chart(ctxAlberguesRegistrados, {
            type: 'bar',
            data: alberguesRegistradosData,
            options: {
                <%--plugins: {
                    title: {
                        display: true,
                        text: `Total de Albergues Registrados en el Año: ${totalAlberguesRegistrados}` // Mostrar el total en el título
                    }
                },--%>
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Cantidad de Albergues'
                        }
                    }
                }
            }
        });
    });

    const foundMonthsMap = {<%String comafinalDos=", ";%><%for (int j=dashboardDTO.getMesesMascotaEncontrada().size()-1;j>=0;j--){%>
        "<%=dashboardDTO.getMesesMascotaEncontrada().get(j)%>": <%=dashboardDTO.getCantidadesTotalesMesMascotaEncontrada().get(j)%><%if(j==0){comafinalDos="";}%><%=comafinalDos%><%}%>
    };


    const { lastThreeMonths: lastThreeMonthsFound, totalYear: totalYearFound } = getLastThreeMonthsAndYearTotal(foundMonthsMap);

    console.log('Últimos 3 meses de mascotas encontradas:', lastThreeMonthsFound);
    console.log('Total del año de mascotas encontradas:', totalYearFound);

    // Gráfico 6: Mascotas Encontradas por Mes
    const mascotasEncontradasMesData = {
        labels: lastThreeMonthsFound, // Los últimos 3 meses para mascotas encontradas
        datasets: [{
            label: 'Mascotas Encontradas',
            data: [<%--foundMonthsMap[lastThreeMonthsFound[0]], // Mes 1 foundMonthsMap[lastThreeMonthsFound[1]], // Mes 2 foundMonthsMap[lastThreeMonthsFound[2]]  // Mes 3--%>
                <%for (String mesParaMascotaEncontrada: dashboardDTO.getMesesMascotaEncontrada()){%>foundMonthsMap["<%=mesParaMascotaEncontrada%>"],<%}%>
            ],
            borderColor: 'rgba(255, 206, 86, 1)',
            borderWidth: 1,
            fill: false
        }]
    };

    document.addEventListener("DOMContentLoaded", function() {
        const ctxMascotasEncontradasMes = document.getElementById('mascotasEncontradasMes').getContext('2d');
        new Chart(ctxMascotasEncontradasMes, {
            type: 'line',
            data: mascotasEncontradasMesData,
            options: {
                <%--plugins: {
                    title: {
                        display: true,
                        text: `Total de Mascotas Encontradas en el Año: ${totalYearFound}`
                    }
                },--%>
                scales: {
                    y: {
                        title: {
                            display: true,
                            text: 'Cantidad de Mascotas'
                        }
                    }
                }
            }
        });
    });

    let donacionesPorAlbergueDataOriginal = JSON.parse(JSON.stringify(donacionesPorAlbergueData)); // Guardar una copia profunda de los datos originales

    function filterData(searchValue) {
        if (searchValue.trim() === '') {
            // Si el campo de búsqueda está vacío, restaurar los datos originales
            donacionesPorAlbergue.data.labels = donacionesPorAlbergueDataOriginal.labels;
            donacionesPorAlbergue.data.datasets[0].data = donacionesPorAlbergueDataOriginal.datasets[0].data;
        } else {
            // Filtrar los datos según el valor de búsqueda
            const filteredData = donacionesPorAlbergueDataOriginal.labels.filter(label => label.toLowerCase().includes(searchValue.toLowerCase()));
            const filteredDataset = donacionesPorAlbergueDataOriginal.datasets[0].data.filter((value, index) => donacionesPorAlbergueDataOriginal.labels[index].toLowerCase().includes(searchValue.toLowerCase()));

            // Actualizar los datos del gráfico con los filtrados
            donacionesPorAlbergue.data.labels = filteredData;
            donacionesPorAlbergue.data.datasets[0].data = filteredDataset;
        }

        // Actualizar el gráfico siempre después de modificar los datos
        donacionesPorAlbergue.update();
    }

    // Escuchador de eventos para el campo de búsqueda
    document.getElementById('searchInput').addEventListener('input', (event) => {
        filterData(event.target.value);
    });

    // Función para obtener los últimos 3 meses y el total del año
    function getLastThreeMonthsAndYearTotal(data) {
        const today = new Date();
        const months = [
            "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
            "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
        ];

        const lastThreeMonths = [];
        const yearTotal = []; // Cambia esto a un array vacío

        // Obtener el índice del mes actual
        const currentMonthIndex = today.getMonth();

        // Rellenar el array yearTotal solo hasta el mes actual
        for (let i = 0; i <= currentMonthIndex; i++) {
            yearTotal.push(data[months[i]]); // Asegúrate de usar el objeto monthsMap
        }

        // Obtener los últimos 3 meses usando el mapa de meses
        for (let i = 0; i < 3; i++) {
            const monthIndex = (currentMonthIndex - i + 12) % 12; // Calcula el índice del mes actual y los anteriores
            lastThreeMonths.unshift(months[monthIndex]); // Agrega el mes al inicio del array
        }

        // Calcular el total del año solo hasta el mes actual
        const totalYear = yearTotal.reduce((sum, current) => sum + current, 0);

        console.log('Total del año:', totalYear); // Para depurar

        return { lastThreeMonths, totalYear };
    }



</script>

</body>
