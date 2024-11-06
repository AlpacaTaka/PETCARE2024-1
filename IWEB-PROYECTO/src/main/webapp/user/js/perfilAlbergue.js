document.addEventListener("DOMContentLoaded", function() {
    const btnEventos = document.getElementById("btnEventos");
    const btnSolicitudes = document.getElementById("btnSolicitudes");

    const contentEventos = document.getElementById("contentEventos");
    const contentSolicitudes = document.getElementById("contentSolicitudes");

    btnEventos.addEventListener("click", function() {
        btnEventos.classList.add("active");
        btnSolicitudes.classList.remove("active");

        contentEventos.classList.add("active-content");
        contentSolicitudes.classList.remove("active-content");
    });

    btnSolicitudes.addEventListener("click", function() {
        btnSolicitudes.classList.add("active");
        btnEventos.classList.remove("active");

        contentSolicitudes.classList.add("active-content");
        contentEventos.classList.remove("active-content");
    });
});
