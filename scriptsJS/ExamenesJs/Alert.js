function ShowAlertSucess(pageRedirect, optionMessage) {
    //alert("Se guardo correctamente");
    swal({ title: "Buen trabajo", text: getMessage(optionMessage), icon: "success", closeOnClickOutside: false })
    .then(function (value) {
        switch (value) {
            case true:
                if (validarPath(pageRedirect)) {
                    $(location).attr("href", pageRedirect);
                }

                break;
            default:
                //$(location).attr("href", "ExamenGral.aspx");
        }
    }); 
}

function ShowAlertSucesseEdit(pageRedirect, optionMessage) {
    //alert("Se guardo correctamente");
    swal({ title: "Buen trabajo", text: getMessage(optionMessage), icon: "success", closeOnClickOutside: false })
     .then(function (value) {
         switch (value) {
             case true:
                 if (validarPath(pageRedirect)) {
                     $(location).attr("href", pageRedirect);
                 }

                 break;
             default:
                 //$(location).attr("href", "ExamenGral.aspx");
         }
     });
}


function ShowAlertError(message) {
    swal({ title: "Hubo un problema!", text: "El examen no se guardo correctamente  Error : " + message, icon: "error", closeOnClickOutside: false });
}

function ShowAlertInfo(optionMessage) {
    swal({ title: "Lo sentimos", text: optionMessage , icon: "info", closeOnClickOutside: false });
}

function ShowAlertErrorUrl(optionMessage) {
    swal({ title: "Hubo un problema!", text: getMessage(optionMessage), icon: "error", closeOnClickOutside: false })
     .then(function (value) {
         switch (value) {
             case true:
                 window.close();
                 break;
             default:
                 //$(location).attr("href", "ExamenGral.aspx");
         }
     });
}

function ShowAlertErrorGral(messageGral) {
    swal({ title: "Hubo un problema!", text: messageGral , icon: "error", closeOnClickOutside: false });

}

function validarPath(pageRedirect) {

    //var pathname = window.location.pathname;

    //if (pathname.indexOf(pageRedirect) == -1) {
    //    return true
    //}
    //else {
    //    return false;
    //}

    if (pageRedirect.lenght <= 0)
        return false;
    else
        return true;

}

function getMessage(option) {
    var message = "";
    switch (option) {
        case 1:
            message = "El examen se guardo correctamente";
            break;
        case 2:
            message = "El examen se actualizó correctamente";
            break;
        case 3:
            message = "El examen no se guardo correctamente  Error : ";
            break;
        case 4:
            message = "Necesitas seleccionar un registro para generar un reporte.";
            break;
        case 5:
            message = "Datos incompletos para procesar la información";
            break;
        case 6:
            message = "Cotizacion creada exitosamente";
            break;
    }

    return message;
}





