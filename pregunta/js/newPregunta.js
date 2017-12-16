idEncuesta = 0;
function NewEncuesta_id(id) {
    idEncuesta = id;
}
$(".selectpicker").selectpicker();
$("#div_tipoPreguntas > div").hide();
$(function () {
    //loadCategoria();
    $("#tb_columnas").bootstrapTable();
    $("#savePregunta").data("id", 0);
});

function cboTipoPregunta(val) {
    limpiarOpciones();
    $("#" + val).show();
}

$("#cboTipoPregunta").change(function (e) {
    cboTipoPregunta(_TipoPregunta($(this).val()));
});

function savePregunta() {
    if ($("#txtEnunciado").val() !== "" && $("#cboCategoria").val() !== "0") {
        $.ajax({
            url: 'servidor/sPreguntas.php',
            type: 'POST',
            data: {
                op: "save",
                id: $("#savePregunta").data("id"),
                enunciado: $("#txtEnunciado").val(),
                tipo: $("#cboTipoPregunta").val(),
                categoria: $("#cboCategoria").val(),
                tabulacion: $('#tabulacion input[type="checkbox"]').prop("checked") ? '1' : '0',
                encuesta: idEncuesta,
                opciones: getOpciones($("#cboTipoPregunta").val())
                        //,opciones_del: $("#content_" + _TipoPregunta($("#cboTipoPregunta").val())).data("opcion_del")
            },
            success: function (data) {
                id = idEncuesta;
                $("#content").load("pregunta/listPreguntas.php", function () {
                    getEncuesta_id(id);
                    load_Preguntas(1);
                });
            }
        });
    } else {
        alert("error");
    }
}

$("#savePregunta").click(function () {
    savePregunta();
});

$("#cancelPregunta").click(function () {
    id = idEncuesta;
    $("#content").load("pregunta/listPreguntas.php", function () {
        getEncuesta_id(id);
        load_Preguntas(1);
    });
});

$("#btnAgregar_IMultiple").click(function () {
    $("#content_IMultiple").append($("#opIMultiple").html());
});

$("#btnAgregar_SMultiple").click(function () {
    $("#content_SMultiple").append($("#opSMultiple").html());
});

$("#btnAgregar_SUnica").click(function () {
    $("#content_SUnica").append($("#opSUnica").html());
});

$("#div_tipoPreguntas").on("click", ".del_opcion", function (e) {
    if ($.isEmptyObject($(this).data("id"))) {
        $(this).closest('.input-group').remove();
    } else {
        data = [];
        if (!$.isEmptyObject($(this).closest('.limpiarOpciones').data("opcion_del"))) {
            data = $(this).closest('.limpiarOpciones').data("opcion_del");
            data.push($(this).data("id"));
        } else {
            data.push($(this).data("id"));
            $(this).closest('.limpiarOpciones').data("opcion_del", data);
        }
        $(this).closest('.input-group').remove();
    }
});

function limpiarOpciones() {
    $("#div_tipoPreguntas > div").hide();
    $("#div_tipoPreguntas input").val("");
    $(".limpiarOpciones").html("");
}

function getOpciones(tipoPregunta) {
    etiquetas = [];
    switch (tipoPregunta) {
        case "5":
            //alert($("#table table").attr("data-id"));
            bandera = $.isEmptyObject($("#tb_columnas").data("id"));
            if (bandera) {
                etiquetas.push({id: 0, value: JSON.stringify(get_Data())});
            } else {
                etiquetas.push({id: $("#tb_columnas").data("id"), value: JSON.stringify(get_Data())});
            }
            //console.log(JSON.stringify(columns));
            break;
        case "2":
            $("#content_IMultiple input").each(function (index, item) {
                if (!$.isEmptyObject($(item).val()))
                    if ($.isEmptyObject($(item).data("id")))
                        etiquetas.push({id: 0, value: $(item).val()});
                    else
                        etiquetas.push({id: $(item).data("id"), value: $(item).val()});
            });
            break;
        case "3":
            $("#content_SMultiple input[type='text']").each(function (index, item) {
                if (!$.isEmptyObject($(item).val()))
                    if ($.isEmptyObject($(item).data("id")))
                        etiquetas.push({id: 0, value: $(item).val()});
                    else
                        etiquetas.push({id: $(item).data("id"), value: $(item).val()});
            });
            break;
        case "4":
            $("#content_SUnica input[type='text']").each(function (index, item) {
                if (!$.isEmptyObject($(item).val()))
                    if ($.isEmptyObject($(item).data("id")))
                        etiquetas.push({id: 0, value: $(item).val()});
                    else
                        etiquetas.push({id: $(item).data("id"), value: $(item).val()});
            });
            break;
    }
    return etiquetas;
}

function editPregunta(id) {
    $.ajax({
        url: 'servidor/sPreguntas.php',
        type: 'POST',
        dataType: 'json',
        async: false,
        data: {
            op: "edit",
            id: id
        },
        success: function (data) {
            asignarPregunta(data.pregunta);
            generarOpciones(data.opciones);
        }
    });
}

function asignarPregunta(pregunta) {
    $("#savePregunta").data("id", pregunta.id);
    $("#savePregunta").html("Actualizar");
    $("#txtEnunciado").val(pregunta.enunciado);
    $("#cboCategoria").selectpicker("val", pregunta.id_categoria);
    $("#cboTipoPregunta").selectpicker("val", pregunta.tipo);
    cboTipoPregunta(_TipoPregunta(pregunta.tipo));
}

function generarOpciones(opciones) {
    if (_TipoPregunta($("#cboTipoPregunta").val()) !== "table") {
        contenedor = "#content_" + _TipoPregunta($("#cboTipoPregunta").val());
        opcion_html = "#op" + _TipoPregunta($("#cboTipoPregunta").val());
        $(opciones).each(function (index, opcion) {
            div_clone = $(opcion_html + " > div").clone();
            $(div_clone).find("button").data("id", opcion.id);
            $(div_clone).find("input[type='text']").val(opcion.enunciado);
            $(div_clone).find("input[type='text']").data("id", opcion.id);
            $(div_clone).appendTo(contenedor);
        });
    } else {
        if (opciones.length > 0) {
            columns = JSON.parse(opciones[0].enunciado);
            contador = 0;
            data = $.map(columns, function (column) {
                row = {
                    id: contador++,
                    columna: column.title,
                    tipo: column.tipo,
                    excel: column.excel
                };
                switch (column.tipo) {
                    case "2":
                        $("#cboColumnas").append("<option value='" + column.title + "'>" + column.title + "</option>");
                        $("#cboColumnas").selectpicker("refresh");
                        $.extend(row, {
                            data_source: column.data_source
                        });
                        if (column.columna_dominante) {
                            $("#cboColumnas").selectpicker("val", column.title);
                        }
                        break;
                }
                return row;
            });
            $("#tb_columnas").data("id", opciones[0].id);
            $("#tb_columnas").bootstrapTable("load", data);
        }

    }
}

function _TipoPregunta(index) {
    $('#tabulacion input[type="checkbox"]').prop("checked", false);
    if (!$("#tabulacion").hasClass("hidden")) {
        $("#tabulacion").addClass("hidden");
    }

    switch (index) {
        case "1":
            return "ISimple";
            break;
        case "2":
            return "IMultiple";
            break;
        case "3":
            $("#tabulacion").removeClass("hidden");
            return "SMultiple";
            break;
        case "4":
            $("#tabulacion").removeClass("hidden");
            return "SUnica";
            break;
        case "5":
            $("#tabulacion").removeClass("hidden");
            return "table";
            break;
    }
}