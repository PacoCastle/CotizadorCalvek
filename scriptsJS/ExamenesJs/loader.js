$(function () {
    PageLoadClose();
});

function PageLoadClose() {
    //$(window).load(function () {
    $(".loader").fadeOut("slow");
    //>});
}

function PageLoadStart() {
    $(".loader").fadeIn("slow");
}

function PageLoadButton() {
    $(".loader").fadeOut("slow");

    //if ($("#hddMensaje").val() == "True") {
    //    $('#smallModal').modal({ backdrop: 'static', keyboard: false })
    //    $("#smallModal").modal('show');
    //    $("#hddMensaje").val("False");

    //    $('.modal').on('hidden.bs.modal', function () {
    //        $('#txtFolio').val("");
    //        $('#txtMonto').val("");
    //        $('#ddlPlan').val("");

    //        $("#formModal").empty();
    //    });


    //}
}