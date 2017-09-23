table = "#tb_listEncuestas";
paginacion = ("#pag_tb_listEncuestas");
ban_new = true;
default_encuesta = {
    initiateStartPageClick: false,
    totalPages: 1,
    visiblePages: 5,
    first: "&larrb;",
    prev: "&laquo;",
    next: "&raquo;",
    last: "&rarrb;"
};
$(function () {
    $(".selectpicker").selectpicker();
    $("table").bootstrapTable();
    load_cboEncuestas();

    load_Encuestas(1);

    $(table).on("click", "button[name='edit_encuesta']", function () {
        id = $(this).attr("dat-id");
        $("#modal_editEncuesta h4.modal-title").html("Modificar Encuesta");
        $("#modal_editEncuesta .modal-footer button.btn-success").html("Modificar");
        $("#modal_editEncuesta .modal-footer button.btn-success").data("id", id);
        row = $(table).bootstrapTable('getRowByUniqueId', id);
        $("#edit_nombre").val(row.nombre);

    });
    $(table).on("click", "button[name='del_encuesta']", function () {

    });
    $(table).on("click", "button[name='list_pregunt_Encuesta']", function () {
        id = $(this).attr("dat-id");
        $("#content").load("pregunta/listPreguntas.php", function () {
            getEncuesta_id(id);
            load_Preguntas(1);
        });
    });

    $(table).on("click", "button[name='dupl_Encuesta']", function () {
        id = $(this).attr("dat-id");
        row = $(table).bootstrapTable('getRowByUniqueId', id);
        $("#dupli_nombre").val(row.nombre);
        $("#btn_newDuplicar").data("encuesta", id);
    });
    $("#newEncuesta").click(function () {
        $("#modal_editEncuesta h4.modal-title").html("Nueva Encuesta");
        $("#modal_editEncuesta .modal-footer button.btn-success").data("id", 0);
        $("#modal_editEncuesta .modal-footer button.btn-success").html("Guardar");
        $("#edit_nombre").val("");
    });
    $("#btn_newDuplicar").click(function () {
        if (!$.isEmptyObject($("#cboEncuestas").selectpicker("val"))) {
            $.ajax({
                url: "servidor/sEvaluacion.php",
                type: 'POST',
                async: false,
                data: {
                    op: "duplicar",
                    id_origen: $("#cboEncuestas").selectpicker("val"),
                    id_destino: $(this).data("encuesta")
                },
                success: function (data) {
                    $('#modal_duplEncuesta').modal("toggle");
                    load_Encuestas(1);
                }
            });
        }
    });
    $("#btn_canEncuesta").click(function () {
        $('#modal_editEncuesta').modal("toggle");
        $("#edit_nombre").val("");
    });
    $("#btn_newEncuesta").click(function () {
        if (!$.isEmptyObject($("#edit_nombre").val())) {
            $.ajax({
                url: "servidor/sEvaluacion.php",
                type: 'POST',
                async: false,
                data: {
                    op: "saveEncuesta",
                    id: $(this).data("id"),
                    nombre: $("#edit_nombre").val()
                },
                success: function (data) {
                    $('#modal_editEncuesta').modal("toggle");
                    load_Encuestas(1);
                }
            });
        }
    });

    $("#btnGenerar").click(function () {
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "file"
            },
            beforeSend: function () {
                waitingDialog.show('Este proceso podría tardar varios minutos', {
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

function load_cboEncuestas() {
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

function load_Encuestas(pag) {
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
            console.log(response.count);
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