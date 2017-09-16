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
    load_cboEncuestas();
    load_Encuestas(1);
    
    
    $(table).on("click","button[name='edit_encuesta']",function(){
        id = $(this).attr("dat-id");
        $("#modal_editEncuesta h4.modal-title").html("Modificar Encuesta");
        $("#modal_editEncuesta .modal-footer button").html("Modificar");
        row = $(table).bootstrapTable('getRowByUniqueId',id);
        $("#edit_nombre").val(row.nombre);
    });
    
    $(table).on("click","button[name='dupl_Encuesta']",function(){
        id = $(this).attr("dat-id");
        row = $(table).bootstrapTable('getRowByUniqueId',id);
        $("#dupli_nombre").val(row.nombre);
    });
    $("#newEncuesta").click(function(){
        $("#modal_editEncuesta h4.modal-title").html("Nueva Encuesta");
        $("#modal_editEncuesta .modal-footer button").html("Guardar");
        $("#edit_nombre").val("");
    });
    
    
    
    $("#btnGenerar").click(function () {
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "file"
            },
            beforeSend: function(){
                 waitingDialog.show('Este proceso podría tardar varios minutos',{
                     headerText: 'Generando archivos'				                     
                 });
            },
            success: function (data) {
                waitingDialog.hide();
                url = "xlsx.php";
                window.open(url, '_blank');
            }
        });
    });
    
    
});

function load_cboEncuestas(){
    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        async: false,
        data: {
            op: "list_cbo"
        },
        success: function (response) {
            $("#cboEncuestas").html(response);
            $("#cboEncuestas").selectpicker("refresh");
        }
    });
}

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
            console.log(response.load);
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