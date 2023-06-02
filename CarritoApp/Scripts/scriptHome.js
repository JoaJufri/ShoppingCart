    //Script Validacion de Textbox en 'Precio hasta $'
    function validarEntrada() {
    var dropdown = document.getElementById("ddl_Criterio");
    var selectedOption = dropdown.options[dropdown.selectedIndex].value;
    var input = document.getElementById("tbFiltro");

    if (selectedOption === "Precio") {
      var regex = /^\d+(\.\d{1, 2})?$/;
    if (!regex.test(input.value)) {
        alert("Ingrese un valor decimal válido.");
    return false;
      }
    }

    return true;
  }
