function SearchText() {
   
    $("[id$=txtProductoCFDI]").autocomplete({
        source: function (request, response) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "AltaProductoKepler.aspx/GetProductoCFDI",
                data: "{'strProductoCFDI':'" + $("[id$=txtProductoCFDI]").val() + "'}",
                dataType: "json",
                success: function (data) {
                    response(data.d);
                },
                error: function (result) {
                    alert("No Match");
                }
            });
        }
    });
}