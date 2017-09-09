$(function () {
    $("#tb_listPreguntas").bootstrapTable();
    
    $(".pagination").twbsPagination({
        initiateStartPageClick: false,
        totalPages: 35,
        visiblePages: 7,
        onPageClick: function (event, page) {
            //load_Preguntas(false, page);
            //$('#page-content').text('Page ' + page);
        }
    });
    load_Preguntas(false, 1);

});
function load_Preguntas(bandera, pag) {
    //var top = $("#cboTop").val();
    top = 10;
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sPreguntas.php",
        async: false,
        data: {
            op: "list",
            top: top,
            pag: ((pag - 1) * top),
            categoria: 0//$("#cboCategoria").val()
        },
        success: function (response) {
            alert();
            /*if (bandera)
                loadPaginacionlistPreguntas(response.count);*/
            $("#tb_listPreguntas").bootstrapTable("load", response.load);
            $('#tb_listPreguntas').bootstrapTable('resetView');
        }
    });
}
