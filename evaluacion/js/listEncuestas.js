table = "#tb_listEncuestas";
paginacion = ("#pag_tb_listEncuestas");
default_encuesta = {
    initiateStartPageClick: false,
    totalPages: 1,
    visiblePages: 5,
    first: "&larrb;",
    prev: "&laquo;",
    next: "&raquo;",
    last: "&rarrb;"
};
$(function(){
    $(".selectpicker").selectpicker();
    $("table").bootstrapTable();
    load_Encuestas(1);
    
    $("#btnGenerar").click(function () {
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "file"
            }
            , success: function (data) {
                url = "xlsx.php";
                window.open(url, '_blank');
            }
        });
    });
    
    
});



function load_Encuestas( pag) {
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sEvaluacion.php",
        async: false,
        data: {
            op: "list",
            top: top,
            pag: ((pag - 1) * top)
        },
        success: function (response) {
            $(table).bootstrapTable("load", (response.load));
            //$(table).bootstrapTable('resetView');
            $("#pagination-demo").twbsPagination('destroy');
            $("#pagination-demo").twbsPagination($.extend({}, default_encuesta, {
                startPage: pag,
                totalPages: response.count,
                onPageClick: function (event, page) {
                    load_Encuestas(page);
                }
            }));
        }
    });
}