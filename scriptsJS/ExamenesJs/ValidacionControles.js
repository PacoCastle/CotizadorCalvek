$(document).ready(function () {

    $("#imgBtnAgregar").click(function (e) {
        $("#HeaderExamn").show();

        e.preventDefault();
        $('html,body').animate({
            scrollTop: $("#HeaderExamn").offset().top
        }, 900);
        //});
    });

    $('th').click(function () {
        alert('clicked');

    });


    getDate();
    panelTipoSexo();
    validaPeriodo();
    onlyNumbers();
    onlyNumbersDec();
    onlyNumberComplete();
    //dataPicker();
    aptitudHallazgo();
    onlyNumbersNeg();

    //MuestraImagenAptitud();
    //$("#txtFechaNac").val($.now)

    $(".datepicker").datetimepicker({
        //dateFormat: 'dd/mm/yyyy',
        todayBtn: true,
        autoclose: true,
        //forceParse: 0,
        minView: 2,
        format: 'dd/mm/yyyy',
        language: 'es',
        startDate: new Date(1900, 1, 1),
        endDate: new Date()
    });


    $(".datepicker, .only").keydown(function (e) {
        try {
            if ((e.keycode == 8 || e.keycode == 46))
                return false;
            else
                return false;
        } catch (e) {
            return false;
        }
    });

    $("#ddlComplexion").attr('disabled', 'disabled');

});

//Calcula el IMC
function calculoIMC() {

    localStorage['Peso'] = $("#txtPesoKg").val();
    localStorage['Altura'] = $("#txtTallaCm").val();

    var Peso = localStorage['Peso'];
    var Altura = localStorage['Altura'];
    var operacion;

    if (Peso == 0)
        $("#txtImc").val("")
    if (Altura == 0)
        $("#txtImc").val("")
    if ($("#txtImc").val() == 0)
        //$("#txtComplexion").val("");
        $("#ddlComplexion option[value=0]").attr("selected", true);

    operacion = parseFloat(Peso / (Math.pow(Altura, 2).toFixed(2))).toFixed(2);
    if (Peso > 0 && Altura > 0) {
        $("#txtImc").val(operacion);
        intervalos(operacion);
    }
    else {
        $("#txtImc").val("0.00");
        $('#ddlComplexion').val(5);
    }

}

function intervalos(cantidad) {
  
    if (cantidad < 18.50) {
        $('#ddlComplexion').val(5);
    }
    else if (cantidad >= 18.50 && cantidad <= 24.99) {
        $('#ddlComplexion').val(0);
    }

    else if (cantidad >= 25.00 && cantidad <= 29.99) {
        $('#ddlComplexion').val(1);
    }

    else if (cantidad >= 30.00 && cantidad <= 34.99) {
        $('#ddlComplexion').val(2);
    }

    else if (cantidad >= 35.00 && cantidad <= 39.99) {
        $('#ddlComplexion').val(3);
    }

    else if (cantidad >= 40.00) {
        $('#ddlComplexion').val(4);
    }

    //else if (cantidad >= 50.00) {
    //    $('#ddlComplexion').val(5);
    //    alert("complexion:" + 50.00);
    //}


    var txtComplexion = $("#ddlComplexion option:selected").text();
    var valueComplexion = $("#ddlComplexion option:selected").val();
    $("#txtENEstadoNutricional").val(txtComplexion);

    $("#hdnIdComplexion").val(valueComplexion);

}
function setIdComplexion(IdComplexion) {

    var oParam = "{'IdComplexion' : '" + IdComplexion + "'}";
    $.ajax({
        type: "POST",                                              // tipo de request que estamos generando
        url: 'ExamenGral.aspx/setIdComplexion',                    // URL al que vamos a hacer el pedido
        data: null,                                                // data es un arreglo JSON que contiene los parámetros que 
        // van a ser recibidos por la función del servidor
        data: oParam,
        contentType: "application/json; charset=utf-8",            // tipo de contenido
        dataType: "json",                                          // formato de transmición de datos
        async: true,                                               // si es asincrónico o no
        success: function (resultado) {                            // función que va a ejecutar si el pedido fue exitoso
            //var num = resultado.d;
            //$('#lblResultado').text('Número aleatorio es ' + num);
            //console.log(num)x|
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) { // función que va a ejecutar si hubo algún tipo de error en el pedido
            //var error = eval("(" + XMLHttpRequest.responseText + ")");
            //aler(error.Message);
        }
    });
}


function calculoCinturaCadera() {

    var cintura = $("#txtCintura").val();
    var cadera = $("#txtCadera").val();


    if (cadera.length > 0 && cintura.length > 0) {
        var operacion = parseFloat(cintura / cadera).toFixed(2);
        $("#txtCinCad").val(operacion);
    }

}


//Valida solo Numeros Positivos y Negativos
function onlyNumbersNeg() {
    
    $(".onlyNumbersNeg").keyup(function (e) {

        valor = this.value;
        if (valor.length == 1) {
            if (valor.substring(0, 1) != "-") {
                if (!/^([0-9])*$/.test(valor))
                    this.value = (this.value + '').replace(/[^0-9/]/g, '')
            }
        }
        else {
            var valSinSigno = valor.substring(1, valor.length);
            if (!/^([0-9])*$/.test(valSinSigno)) {
                this.value = (this.value + '').replace(/[^0-9/]/g, '');
            }
        }
     
    });
}

//Valida solo Numeros
function onlyNumbers() {
    $(".numeric").keyup(function () {
        this.value = (this.value + '').replace(/[^0-9/]/g, '')
    });
}

//Valida Numeros con 2 decimales
function onlyNumbersDec() {
    $(".numericDec").numeric({ decimalPlaces: "2" });
}

//Funcion para mostrar o ocultar Atecedentes Hombre o Mujer
function panelTipoSexo() {
    $('select#ddlSexo').change(function () {
        var valor = $(this).val();

        if (valor == 1) {
            $("#PanelAntecedentesGinecol").show();
            $("#PanelAtecedentesRepro").hide();
            document.getElementById("collapseGinecol").click();
        }
        if (valor == 2) {
            $("#PanelAntecedentesGinecol").hide();
            $("#PanelAtecedentesRepro").show();
            document.getElementById("collapseRepro").click();
        }
    });
}

function validaPeriodo() {

    $("#rblOpciones").change(function (e) {
        var selectValue = parseInt(e.target.value);
        switch (selectValue) {
            case 0:
                enabledHistoriaLaboral();
                break;
            case 1:
                disableHistoriaLaboral();
                break;
            case 2:
                enabledHistoriaLaboral();
                break;
        }
    });
}


function disableHistoriaLaboral() {
    $("#historialLaboralPeriodico").show();
    $("#HistoriaLaboral").hide();
    //document.getElementById("historialLaboralPeriodico").click();
}


function enabledHistoriaLaboral() {
    $("#historialLaboralPeriodico").hide();
    $("#HistoriaLaboral").show();
    //document.getElementById("HistoriaLaboral").click();
}

//function dataPicker() {
//    $('.input-group.date').datepicker({ format: "dd/mm/yyyy" });
//}

function existeFecha(fecha) {
    var fechaf = fecha.split("/");
    var day = fechaf[0];
    var month = fechaf[1];
    var year = fechaf[2];
    var date = new Date(year, month, '0');
    if ((day - 0) > (date.getDate() - 0)) {
        return false;
    }
    return true;
}

function existeFecha2(fecha) {
    var fechaf = fecha.split("/");
    var d = fechaf[0];
    var m = fechaf[1];
    var y = fechaf[2];
    return m > 0 && m < 13 && y > 0 && y < 32768 && d > 0 && d <= (new Date(y, m, 0)).getDate();
}

function aptitudHallazgo() {

    var IdHallazgo;

    $("#IdHallazgo0").click(function () {
        IdHallazgo = $("#IdAptitud").val();
        if (IdHallazgo !== "0") {
            $("#IdAptitud").val("0");
            console.log($("#IdAptitud").val());
            $("#IdHallazgo0").append("<img id='theImg0' src='../Imagenes/checked.png'/>");

            ocultaImagenAptitud($("#IdAptitud").val());
        }
    });

    $("#IdHallazgo1").click(function () {
        IdHallazgo = $("#IdAptitud").val();
        if (IdHallazgo !== "1") {
            $("#IdAptitud").val("1");
            console.log($("#IdAptitud").val());
            $("#IdHallazgo1").append("<img id='theImg1' src='../Imagenes/checked.png' />");

            ocultaImagenAptitud($("#IdAptitud").val());
        }
    });

    $("#IdHallazgo2").click(function () {
        IdHallazgo = $("#IdAptitud").val();
        if (IdHallazgo !== "2") {
            $("#IdAptitud").val("2");
            console.log($("#IdAptitud").val());
            $("#IdHallazgo2").append("<img id='theImg2' src='../Imagenes/checked.png'/>");
            ocultaImagenAptitud($("#IdAptitud").val());
        }
    });
}

//function MuestraImagenAptitud(Id) {

//    if (Id == "0") {
//        $("#IdHallazgo0").append("<img id='theImg0' src='../Imagenes/checked.png'/>");
//    }
//    if (Id == "1") {
//        $("#IdHallazgo1").append("<img id='theImg1' src='../Imagenes/checked.png'/>");
//    }
//    if (Id == "2") {
//        $("#IdHallazgo2").append("<img id='theImg2' src='../Imagenes/checked.png'/>");
//    }
//}

function ocultaImagenAptitud(Id) {

    switch (Id) {
        case "0":
            $("#theImg1").remove();
            $("#theImg2").remove();
            break;
        case "1":
            $("#theImg0").remove();
            $("#theImg2").remove();
            break;
        case "2":
            $("#theImg0").remove();
            $("#theImg1").remove();
            break;
    }

}

function validaCamposVacios() {

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        //"positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }


    //Datos Personales
    var Nombre = $("#txtNombre").val();
    var Paterno = $("#txtPaterno").val();
    var Materno = $("#txtMaterno").val();
    var LugarNac = $("#txtLugarNac").val();
    var FechaNac = $("#txtFechaNac").val();
    var Telefono = $("#txtTelefono").val();
    var Direc = $("#txtDirec").val();

    //DatosPersonales
    var Nom = ["Nombre", $("#txtNombre").val()];
    var Pat = ["Paterno", $("#txtPaterno").val()];
    var Mat = ["Materno", $("#txtMaterno").val()];
    var LugarNa = ["Lugar de Nacimiento", $("#txtLugarNac").val()];
    var Fecha = ["Fecha de Nacimiento", FechaNac];
    var Tel = ["Telefono", Telefono];
    var Dir = ["Direccion", Direc];

    //SOMATOMETRÍA / SIGNOS VITALES
    var TA = ["TA", $("#txtTa").val()];
    var FC = ["FC", $("#txtFcMIn").val()];
    var FR = ["FR", $("#txtFrMin").val()];
    var T = ["T", $("#txtT").val()];
    var Peso = ["Peso", $("#txtPesoKg").val()];
    var Talla = ["Talla", $("#txtTallaCm").val()];
    var Cintura = ["Cintura", $("#txtCintura").val()];
    var Cadera = ["Cadera", $("#txtCadera").val()];

    var arrayDatos = [Nom, Pat, Mat, LugarNa, Fecha, Tel, Dir];

    var arraySomatometria = [TA, FC, FR, T, Peso, Talla];

    existClase = $("#collapseOne").hasClass("in");
    existeSomato = $("#collapseSeven").hasClass("in");

    if (existClase == false) {
        $("#collapseOne").collapse("show");
        validaCamposEmoty(arrayDatos);
    } if (existeSomato == false) {
        $("#collapseSeven").collapse("show");
        validaCamposEmoty(arraySomatometria);
    }

}

function validaCamposEmoty(Array) {
    Array.forEach(function (element, value) {
        var key = element[0];
        var value = element[1];
        if (value.length == 0)
            toastr.error("No ha ingresado " + key, "Aviso!");
    });

}

function muestraHistoriaLaboral() {
    $("#HistoriaLaboral").hide();
    $("#historialLaboralPeriodico").show();
}

function muestraSexo() {
    $("#PanelAntecedentesGinecol").hide();
    $("#PanelAtecedentesRepro").show();
}

function removeSrcripts() {


    var s = document.createElement("script");
    s.type = "text/javascript";
    s.src = "../Scripts/jquery-3.0.0.min.js";

    // Use any selector
    $("html").append(s);

    var a = document.createElement("script");
    a.type = "text/javascript";
    a.src = "../Scripts/bootstrap.js";
    $("html").append(a);

    $("#Jquery3").remove();
    $("#bootstrap").remove();


}

function OpenWindow(Url) {
    window.open(Url);
}


//Cuando esten completas las especificaciones , utiliar este como generico y quitar onlyNumbers
function onlyNumberComplete() {

    $(".autoCompleteNumberDec").numeric({ decimalPlaces: "2" });

    $(".autoCompleteNumberDec").keypress(function (element) {
        var txtVal = $(this).val();
        var length = txtVal.length;
        var sub = $(this).val().substring(txtVal.indexOf(".") + 1, length).length;

        if (length == 3 && txtVal.indexOf(".") != -1) {
            if (length > 5) {
                this.value = txtVal.substring(0, length - 1);
            }
        }
        else if (length == 3) {
            this.value = txtVal + ".";
        }

        else if (txtVal.indexOf(".") != -1 && parseInt(sub) > 1) {
            var txt = $(this).val().substring(0, length - 1)
            this.value = txt;
        }

    });

    $(".autoCompleteNumberDec").blur(function (element) {
        var txt = $(this).val();
        var length = txt.length;
        var sub = $(this).val().substring(txt.indexOf(".") + 1, length).length;

        console.log("Sub : " + sub + " " + txt);

        if (sub == "0" && txt.indexOf(".") != -1) {
            this.value = txt + "00";
        }
        else if (sub == '0') {
            console.log("entro a esto");
            this.value = "0.00";
        }

        else if (txt.indexOf(".") != -1 && sub < 2) {
            this.value = txt + "0";
        }
        //else if (txt.indexOf(".") != -1) {
        //    //if (txt.length <= 5) {
        //        this.value = txt + "00";
        //    //}
        //}

        console.log(this.value);

    });
}

function mostrarPestaña() {
    $(".ShowPestaña").collapse("show");
}

//function sortTable(n) {
//    var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
//    table = document.getElementById("GridView1");
//    switching = true;
//    //Set the sorting direction to ascending:
//    dir = "asc";
//    /*Make a loop that will continue until
//    no switching has been done:*/
//    while (switching) {
//        //start by saying: no switching is done:
//        switching = false;
//        rows = table.rows;
//        /*Loop through all table rows (except the
//        first, which contains table headers):*/
//        for (i = 1; i < (rows.length - 1) ; i++) {
//            //start by saying there should be no switching:
//            shouldSwitch = false;
//            /*Get the two elements you want to compare,
//            one from current row and one from the next:*/
//            x = rows[i].getElementsByTagName("TD")[n];
//            y = rows[i + 1].getElementsByTagName("TD")[n];
//            /*check if the two rows should switch place,
//            based on the direction, asc or desc:*/
//            if (dir == "asc") {
//                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
//                    //if so, mark as a switch and break the loop:
//                    shouldSwitch = true;
//                    break;
//                }
//            } else if (dir == "desc") {
//                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
//                    //if so, mark as a switch and break the loop:
//                    shouldSwitch = true;
//                    break;
//                }
//            }
//        }
//        if (shouldSwitch) {
//            /*If a switch has been marked, make the switch
//            and mark that a switch has been done:*/
//            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
//            switching = true;
//            //Each time a switch is done, increase this count by 1:
//            switchcount++;
//        } else {
//            /*If no switching has been done AND the direction is "asc",
//            set the direction to "desc" and run the while loop again.*/
//            if (switchcount == 0 && dir == "asc") {
//                dir = "desc";
//                switching = true;
//            }
//        }
//    }
//}


