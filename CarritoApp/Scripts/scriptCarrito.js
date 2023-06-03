function btnPasarPagar_Click() {
    var mensaje = "Esta funcionalidad estará disponible en una futura actualización.";
    alert(mensaje);
}

function restrictArrowKeys(event) {
    var keyCode = event.which ? event.which : event.keyCode;
    if (keyCode === 38 || keyCode === 40) { // Flecha arriba o flecha abajo
        event.preventDefault();
        return false;
    }
}

        