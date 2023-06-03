
$(document).ready(function () {
    // Calcular el monto total inicial
    calcularTotal();

    // Manejar el evento de cambio de cantidad
    $(".item-quantity input").on("input", function () {
        calcularTotal();
    });

    function calcularTotal() {
        var total = 0;

        // Recorrer cada fila de artículo
        $(".item-row").each(function () {
            var quantity = parseInt($(this).find(".item-quantity input").val());
            var price = parseFloat($(this).find(".item-price").text().replace("$", ""));
            var itemTotal = quantity * price;
            total += itemTotal;

            // Actualizar el total de cada artículo
            $(this).find(".item-total").text("Total: $" + itemTotal.toFixed(2));
        });

        // Actualizar el total general
        $("#lblTotalGeneral").text("$" + total.toFixed(2));
    }
});
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

