table = "#tb_listEncuestas";
paginacion = ("#pag_tb_listEncuestas");
deshabilitada = false;
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
window.events_accion = {
    'click li[name="reporte_Encuesta"]': function (e, value, row, index) {
        $("#content").load("evaluacion/reporteEvaluacion.php?id_encuesta=" + row.id);
    },
    'click li[name="edit_encuesta"]': function (e, value, row, index) {
        $("#modal_editEncuesta h4.modal-title").html("Modificar Encuesta");
        $("#modal_editEncuesta button[name='save']")
                .html("Modificar")
                .data("id", row.id);
        $("#edit_nombre").val(row.nombre);
    },
    'click li[name="dupl_Encuesta"]': function (e, value, row, index) {
        $("#dupli_nombre").val(row.nombre);
        $("#btn_newDuplicar").data("encuesta", row.id);
    },
    'click li[name="gen_Encuesta"]': function (e, value, row, index) {
        url = "servidor/sExcel.php?op=encuesta_carrera&encuesta=" + row.id;
        window.open(url, '_blank');
    },
    'click li[name="list_pregunt_Encuesta"]': function (e, value, row, index) {
        $("#content").load("pregunta/listPreguntas.php", function () {
            getEncuesta_id(row.id);
            load_Preguntas(1);
        });
    },
    'click li[name="del_encuesta"]': function (e, value, row, index) {
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "delete",
                id: row.id
            },
            success: function (data) {
                //load_Encuestas(1);
                $("#tb_listEncuestas").bootstrapTable("refresh");
            }
        });
    },
    'click li[name="refresh_encuesta"]': function (e, value, row, index) {
        $.post("servidor/sEvaluacion.php",
                {
                    op: "refresh",
                    id: row.id
                }, function (response) {
            //load_Encuestas(1);
            $("#tb_listEncuestas").bootstrapTable("refresh");
        });
    }
};



$(function () {
    $(".selectpicker").selectpicker();
    $("table").bootstrapTable(TablePaginationDefault);

    //load_Encuestas(1);  


    $("#cboFacultad_init").change(function (e) {
        load_Carrera($(this).val(), "#cboCarrera_init");
    });

    $("#cboCarrera_init").change(function (e) {
        //load_Encuestas(1);
        $("#tb_listEncuestas").bootstrapTable("refresh");
        load_cboEncuestas();
    });

    $("#cbo_Facultad").change(function (e) {
        load_Carrera($(this).val(), "#cbo_Carrera");
    });
    //load_Facultad("#cbo_Facultad");

    load_cboEncuestas();

    //load_Encuestas(1);
    $("#cbk_encuestas_ocultas").change(function () {
        deshabilitada = $(this).is(":checked");
        $("#tb_listEncuestas").bootstrapTable("refresh");
        //load_Encuestas(1);
    });

    $("#modal_editEncuesta").on("hidden.bs.modal", function (e) {
        $(this).find("input").val("");
        $(this).find(".modal-title").html("Nueva Encuesta");
        $(this).find("button[name='save']")
                .data("id", 0)
                .html("Guardar");
    });

    $("#btn_GenExcel").click(function (e) {
        id = $(this).data("id");
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "file",
                encuesta: id
            }
        });
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
                    //load_Encuestas(1);
                    $("#tb_listEncuestas").bootstrapTable("refresh");
                }
            });
        }
    });

    $("#modal_editEncuesta button[name='save']").click(function () {
        if (!$.isEmptyObject($("#edit_nombre").val())) {
            $.ajax({
                url: "servidor/sEvaluacion.php",
                type: 'POST',
                async: false,
                data: {
                    op: "saveEncuesta",
                    id: $(this).data("id"),
                    carrera: $("#cboCarrera_init").selectpicker("val"),
                    nombre: $("#edit_nombre").val()
                },
                success: function (data) {
                    $('#modal_editEncuesta').modal("toggle");
                    //load_Encuestas(1);
                    $("#tb_listEncuestas").bootstrapTable("refresh");
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


function load_Facultad(cbo) {
    $.ajax({
        url: "servidor/sEvaluacion.php",
        type: "POST",
        dataType: 'json',
        data: {
            op: "facultad"
        },
        success: function (response) {
            //$(cbo).html("<option value='0'>Seleccione</option>");
            $(cbo).html("");
            $.each(response, function (i, row) {
                option = document.createElement("option");
                $(option).val(row.id);
                $(option).text(row.descripcion);
                $(cbo).append(option);
            });
            $(cbo).selectpicker("refresh");
            $(cbo).change();
        }
    });
}

function load_Carrera(facultad, cbo) {
    $.ajax({
        url: "servidor/sEvaluacion.php",
        type: "POST",
        //async: false,
        dataType: 'json',
        data: {
            op: "carrera",
            facultad: facultad
        },
        success: function (response) {
            //$(cbo).html("<option value='0'>Seleccione</option>");
            $(cbo).html("");
            $.each(response, function (i, row) {
                option = document.createElement("option");
                $(option).val(row.id);
                $(option).text(row.descripcion);
                $(cbo).append(option);
            });
            $(cbo).selectpicker("refresh");
            $(cbo).change();
        }
    });
}

function load_cboEncuestas() {
    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        async: false,
        data: {
            op: "list_cbo",
            carrera: 0
        },
        success: function (response) {
            $("#cboEncuestas").html(response);
            $("#cboEncuestas").selectpicker("refresh");
        }
    });
}

/*function paramsQ(params) {
 console.log(params);
 return $.extend({}, params, {
 deshabilitada: deshabilitada,
 carrera: $("#cboCarrera_init").selectpicker("val")
 });
 }*/

function loadEncuesta(params) {
    json_data = {
        data: $.extend({}, {
            op: "list",
            accion: "list",
            deshabilitada: deshabilitada,
            carrera: $("#cboCarrera_init").selectpicker("val")
        }, params.data),
        url: "servidor/sEvaluacion.php"
    };
    params.success(getJsonOptimizado(json_data));
}

/*function load_Encuestas(pag) {
 var top = $("#cboTop").val();
 $.ajax({
 type: "POST",
 dataType: 'json',
 url: "servidor/sEvaluacion.php",
 //async: false,
 data: {
 op: "list",
 deshabilitada: deshabilitada,
 top: top,
 pag: ((pag - 1) * top),
 carrera:  $("#cboCarrera_init").selectpicker("val")
 },
 success: function (response) {
 $(table).bootstrapTable("load", (response.load));
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
 }*/

function formatEstado(value, row, index) {
    return (value === "0")? "DESHABILITADA" : "HABILITADA";
}
function btnAccion(value, row, index) {
    estado = '<li name="del_encuesta"><a href="#"><i class="fa fa-trash"></i> Eliminar Encuesta</a></li> ';
    if(row.estado === "0"){
        estado = '<li name="refresh_encuesta" ><a href="#"><i class="fa fa-refresh"></i> Reestablecer Encuesta</a></li> ';
    }
    
    return '<div class="btn-group" name="shows">' +
                '<button type="button" class="btn btn-success dropdown-toggle btn-sm"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
                    '<i class="fa fa-fw fa-align-justify"></i>' +
                '</button>' +
                '<ul class="dropdown-menu dropdown-menu-left" >' +
                    '<li name="edit_encuesta"><a href="#" data-toggle="modal" data-target="#modal_editEncuesta"> <i class="fa fa-edit"></i> Editar Encuesta</a></li>' +
                    estado +
                    '<li name="dupl_Encuesta"><a href="#" data-toggle="modal" data-target="#modal_duplEncuesta"> <i class="fa fa-files-o"></i> Duplicar Encuesta</a></li>' +
                    '<li name="gen_Encuesta"><a href="#"> <i class="fa fa-download"></i> Generar Encuesta</a></li>' +
                    '<li name="reporte_Encuesta"><a href="#"> <i class="fa fa-file"></i> Reportes</a></li>' +
                    '<li name="list_pregunt_Encuesta" ><a href="#"> <i class="fa fa-align-justify"></i> Listado de Preguntas</a></li>' +
                '</ul>' +
            '</div>';
}
function btn_accion(value) {
    estado = '<button name="del_encuesta" class="btn btn-danger btn-sm" data-toggle="tooltip" title="Eliminar encuesta"><i class="fa fa-trash"></i></button> ';
    if (value !== "1") {
        estado = '<button name="refresh_encuesta" class="btn btn-success btn-sm" data-toggle="tooltip" title="Reestablecer encuesta"><i class="fa fa-refresh"></i></button> ';
    }
    return '' +
            '<button name="edit_encuesta" data-toggle="modal" data-target="#modal_editEncuesta" class="btn btn-success btn-sm" data-toggle="tooltip" title="Editar encuesta"><i class="fa fa-edit"></i></button> ' +
            estado +
            '<button name="dupl_Encuesta" data-toggle="modal" data-target="#modal_duplEncuesta" class="btn btn-primary btn-sm" data-toggle="tooltip" title="Duplicar"><i class="fa fa-files-o"></i></button> ' +
            '<button name="gen_Encuesta" class="btn btn-default btn-sm" data-toggle="tooltip" title="Generar Excel"><i class="fa fa-download"></i></button> ' +
            '<button name="reporte_Encuesta" class="btn btn-default btn-sm" data-toggle="tooltip" title="Reportes"><i class="fa fa-file"></i></button> ' +
            '<button name="list_pregunt_Encuesta" class="btn btn-info btn-sm" data-toggle="tooltip" title="Listado de Preguntas"><i class="fa fa-align-justify"></i></button>';
}

