
$(document).ready(function () {
    getDate();

    $("#aspnetForm").submit(function () {
        getDate();
    });

    $("#form1").submit(function () {
        getDate();
    });

    buttonGridView();
   

    //var table = document.getElementById("GridView1");
    //table.addEventListener("click",getDate());

});

function getDate() {

    var dates = new Date();
    var fullDate = $.datepicker.formatDate('dd/mm/yy', new Date());
    
    $("#hdnDate").val(fullDate + " " + dates.getHours() + ":" + dates.getMinutes() + ":" + dates.getSeconds());
    console.log($("#hdnDate").val());
    $("#hdnCotizadorDate").val(fullDate + " " + dates.getHours() + ":" + dates.getMinutes() + ":" + dates.getSeconds());
    console.log($("#hdnCotizadorDate").val());
    
}

function buttonGridView() {
    $("#GridView1 tr").each(function () {

        $(this).each(function () {
            $(this).click(function () {
                getDate();
            })
        })
    });

}


