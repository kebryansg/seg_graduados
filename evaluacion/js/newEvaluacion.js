//var tables = [];
var preguntas = [];

$("#btnData").click(function(){
    $("table").each(function(i, table){
        console.log($(this).bootstrapTable("getData"));
    });
});

$(window).load(function () {
    load_categorias();
    $("table").bootstrapTable("hideColumn", "id");
    load_data();
    $("select").selectpicker();
    
    
    
    $(".btn-add-table").click(function () {
        table = $(this).closest(".pregunta_content").find("table");
        columns = $(this).closest(".pregunta_content").data("columns");
        str_row = [];
        $.each(columns, function (index, value) {
            
            switch (value.tipo) {
                case "3":
                    str_row.push('"' + value.field + '" : false');
                    break;
                case "1": 
                    str_row.push('"' + value.field + '" : ""');
                    break;
                case "2":
                    //console.log(value);
                    str_row.push('"' + value.field + '" : "'+ value.data_source[0].text +'"');
                    break;
            }
        });
        total = $(table).bootstrapTable('getData').length;
        $(table).bootstrapTable('insertRow', {
            index: total,
            row: JSON.parse('{ ' + str_row.join() + ' }')
        });
    });
    $(".btn-remove-table").click(function () {
        table = $(this).closest(".pregunta_content").find("table");
        var ids = $.map($(table).bootstrapTable('getSelections'), function (row) {
            //console.log(row);
            return row.id;
        });
        $(table).bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
    });
});




function input_txt(value) {
    return '<input type="text" class="form-control " style="width:100px;" value="' + value + '" />';
}

function check(value) {
    var checked = (value) ? 'checked' : '';
    return '<input type="checkbox"  ' + checked + ' />';
}
function cbk_tbA(value, row, index) {
    var checked = (value) ? 'checked' : '';
    return '<input type="radio" name="tbA' + index + '" ' + checked + ' />';
}
function cbk_tbG(value, row, index) {
    var checked = (value) ? 'checked' : '';
    return '<input type="radio" name="tbG' + index + '" ' + checked + ' />';
}
function cbk_tbFC(value, row, index) {
    var checked = (value) ? 'checked' : '';
    return '<input type="radio" name="tbFC' + index + '" ' + checked + ' />';
}

function saveE(id_enc_tit, estado) {
    pregunta_t1 = [];
    pregunta_t2 = [];
    pregunta_t3 = [];
    pregunta_t4 = [];
    pregunta_t5 = [];
    pregunta_especial = [];
    $("#content_evaluacion .pregunta_content").each(function (index, div_pregunta) {
        tipo = $(div_pregunta).data("tipo");
        id = $(div_pregunta).data("id");
        opciones = [];
        switch (tipo) {
            case "1":
                pregunta_t1.push({"id": id, "valor": $(div_pregunta).find("input").val()});
                break;
            case "2":
                $(div_pregunta).find(".form-horizontal").each(function (i, div_opcion) {
                    opciones.push({"id": $(div_opcion).data("id"), "valor": $(div_opcion).find("input").val()});
                });
                pregunta_t2.push({"id": id, "opciones": opciones});
                break;
            case "3":
                $(div_pregunta).find("input:checked").each(function (i, input_opcion) {
                    opciones.push($(input_opcion).data("id"));
                });
                pregunta_t3.push({"id": id, "opciones": opciones.join()});
                break;
            case "4":
                val = $(div_pregunta).find("select").val();
                pregunta_t4.push({"id": id, "opciones": val});
                break;
            case "5":
                data = $(div_pregunta).find("table").bootstrapTable('getData');
                //console.log(JSON.stringify(data));
                pregunta_t5.push({"id": id, "opciones": JSON.stringify(data)});
                break;

        }
    });

    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        dataType: "json",
        data: {
            op: "save",
            preguntas_t1: pregunta_t1,
            preguntas_t2: pregunta_t2,
            preguntas_t3: pregunta_t3,
            preguntas_t4: pregunta_t4,
            preguntas_t5: pregunta_t5,
            id: id_enc_tit,
            estado: estado
        },
        beforeSend: function () {
            waitingDialog.show('Este proceso podría tardar varios minutos', {
                headerText: 'Enviando encuesta'
            });
        },
        success: function (response) {
            waitingDialog.hide();
            if (response.status) {
                $("#content").load("evaluacion/successEvaluacion.php");
            }
        }
    });
}

$("#saveEvaluacion").click(function () {
    estado = '2';
    saveE($(this).attr("data-id"), estado);
});
$("#submitEval").click(function () {
    estado = '1';
    saveE($(this).attr("data-id"), estado);
});

function load_preguntas_cat(id, panel) {
    //alert($("#saveEvaluacion").attr("data-encuesta"));
    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        data: {
            op: "load_preguntas",
            id: id,
            id_encuesta: $("#saveEvaluacion").attr("data-id")
        },
        async: false,
        dataType: "json",
        success: function (response) {
            //preguntas = response;
            $(response).each(function (index, pregunta) {
                bandera = false;
                div_original = _TipoPregunta(pregunta.tipo);
                div_tipoPregunta = $(div_original).find(".pregunta_content").clone();

                $(div_tipoPregunta).data("id", pregunta.id);

                $(div_tipoPregunta).data("tipo", pregunta.tipo);
                $(div_tipoPregunta).find(".enunciado_pregunta").html(pregunta.enunciado);
                switch (pregunta.tipo) {
                    case "1":
                        preguntas.push({div: div_tipoPregunta, pregunta: pregunta});
                        break;
                    case "2":

                        $(pregunta.opciones).each(function (index, opcion) {
                            div_opcion = $("#op_pIMultiple").find(".form-horizontal").clone();
                            $(div_opcion).data("id", opcion.id);
                            $(div_opcion).find("label").html(opcion.enunciado);
                            preguntas.push({div: div_opcion, pregunta: pregunta});
                            $(div_opcion).appendTo($(div_tipoPregunta).find(".opcion_content"));
                        });
                        break;
                    case "3":
                        $(pregunta.opciones).each(function (index, opcion) {
                            div_opcion = $("#op_pSMultiple").clone();
                            $(div_opcion).removeAttr("id");
                            $(div_opcion).find("input").data("id", opcion.id);
                            $(div_opcion).find("label").append(opcion.enunciado);
                            orden = par(index) ? 0 : 1;
                            preguntas.push({div: div_opcion, pregunta: pregunta});
                            $(div_opcion).appendTo($(div_tipoPregunta).find(".opcion_content > div").eq(orden));
                        });
                        break;
                    case "4":
                        result = "";
                        $(pregunta.opciones).each(function (index, opcion) {
                            result += '<option value="' + opcion.id + '">' + opcion.enunciado + '</option>';
                        });
                        preguntas.push({div: $(div_tipoPregunta).find("select"), pregunta: pregunta});
                        $(div_tipoPregunta).find("select").html(result);
                        break;
                    case "5":
                        columns = JSON.parse(pregunta.opciones[0].enunciado);
                        columns.unshift({
                            field: "state",
                            checkbox: true
                        }, {
                            field: "id",
                            title: "id"
                            /*, formatter: "row_count"*/
                        });

                        $(div_tipoPregunta).data("columns", columns);
                        $(div_tipoPregunta).find("table").bootstrapTable();
                        $(div_tipoPregunta).find("table").bootstrapTable('refreshOptions', {
                            columns: columns
                        });
                        preguntas.push({div: $(div_tipoPregunta).find("table"), pregunta: pregunta});
                        break;
                    default :
                        bandera = true;
                        break;
                }
                /*if (bandera)
                 load_tabla(pregunta);*/
                $(div_tipoPregunta).appendTo(panel);
                $(div_tipoPregunta).after('<hr class="style14">');
            });
        }
    });
}


function load_data() {
    $(preguntas).each(function (i, value) {
        load_respuestas_preguntas(value.div, value.pregunta);
    });
}

function load_tabla(pregunta) {
    if (!$.isEmptyObject(pregunta.preg_resp)) {
        switch (pregunta.tipo) {
            case "7":
                tables.push({tb: "#tb_Graduacion", datos: JSON.parse(pregunta.preg_resp[0].opcion).tb_Graduacion});
                tables.push({tb: "#tb_Actualidad", datos: JSON.parse(pregunta.preg_resp[0].opcion).tb_Actualidad});
                break;
            default :
                if (!$.isEmptyObject(pregunta.preg_resp[0].opcion)) {
                    tables.push({tb: _TipoTabla(pregunta.tipo), datos: JSON.parse(pregunta.preg_resp[0].opcion)});
                }
                break;
        }
    }

}

function load_respuestas_preguntas(div_pregunta, pregunta) {
    if (!$.isEmptyObject(pregunta.preg_resp)) {
        switch (pregunta.tipo) {
            case "5":
                data = JSON.parse(pregunta.preg_resp[0].opcion);
                $.each(data,function(i,row){
                    $.extend(row,{id: i});
                });
                $(div_pregunta).bootstrapTable("load", data);
                break;
            case "4":
                id = pregunta.preg_resp[0].opcion;
                $(div_pregunta).selectpicker("val", id);
                break;
            case "3":
                id = $(div_pregunta).find("input").data("id");
                $.each(pregunta.preg_resp[0].opcion.split(","), function (i, op_id) {
                    if (op_id === id) {
                        $(div_pregunta).find("input").prop("checked", true);
                    }
                });
                break;
            case "1":
                $(div_pregunta).find("input").val(pregunta.preg_resp.respuestas[0].respuesta);
                break;
            case "2":
                id = $(div_pregunta).data("id");
                $.each(pregunta.preg_resp.respuestas, function (i, resp) {
                    if (resp.opciones_id === id) {
                        $(div_pregunta).find("input").val(resp.respuesta);
                        return;
                    }
                });
                break;
        }
    }
}

function _TipoPregunta(tipo) {
    switch (tipo) {
        case "1":
            return "#pISimple";
            break;
        case "2":
            return "#pIMultiple";
            break;
        case "3":
            return "#pSMultiple";
        case "4":
            return "#pSUnica";
        case "5":
            return "#pTabla";
            break;
    }
}

function _TipoTabla(tipo) {
    switch (tipo) {
        case "5":
            return "#tb_Actividad_Horas";
            break;
        case "6":
            return "#tb_Actividad_Mes";
            break;
        case "8":
            return "#tb_experiencia_laboral";
            break;
        case "9":
            return "#tb_estudios_formación_adicional";
            break;
        case "10":
            return "#tb_idioma_egresar";
            break;
        case "11":
            return "#tb_idioma_actualmente";
            break;
        case "12":
            return "#tb_facilidad_condicion";
            break;
    }
}

function load_categorias() {
    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        data: {
            op: "load_categoria",
            id_carrera_encuesta: $("#saveEvaluacion").attr("data-id")
        },
        async: false,
        dataType: "json",
        success: function (response) {
            $(response).each(function (index, categoria) {
                panel_default = $("#panel_default").clone();
                $(panel_default).find("h4").html(categoria.descripcion);
                $(panel_default).removeAttr("id");
                $(panel_default).find(".panel-body").attr("id", "panel_" + categoria.id);
                $(panel_default).appendTo("#content_evaluacion");
                $(panel_default).find(".panel-body").html("");
                load_preguntas_cat(categoria.id, $(panel_default).find(".panel-body"));
            });
        }
    });
}

function par(num) {
    return (num % 2) === 0;
}



