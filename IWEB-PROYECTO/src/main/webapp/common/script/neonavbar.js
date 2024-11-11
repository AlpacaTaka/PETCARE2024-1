/* Función que abre y cierra el menú */
function toggleMenu() {
    var menu = document.getElementById('menu');
    menu.classList.toggle('active');
}

/* Cerrar el menú al hacer clic fuera de él */
window.onclick = function(event) {
    var menu = document.getElementById('menu');
    var openButton = document.querySelector('.menu-c'); // Aquí cambiamos a .menu-c porque es el contenedor del botón de apertura
    
    // Si el clic no es dentro del menú ni en el botón de apertura, cerrar el menú
    if (!menu.contains(event.target) && event.target !== openButton && !openButton.contains(event.target) && menu.classList.contains('active')) {
        menu.classList.remove('active');
    }
};

// Cerrar el menú cuando se hace clic en un enlace del menú
var menuLinks = document.querySelectorAll('.menu a');
menuLinks.forEach(function(link) {
    link.addEventListener('click', function() {
        var menu = document.getElementById('menu');
        menu.classList.remove('active');
    });
});