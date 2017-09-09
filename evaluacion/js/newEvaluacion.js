var tables = [];
var preguntas = [];
load_categorias();
load_data();


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

$(window).load(function () {
    $(tables).each(function (i, tb) {
        $("#content_evaluacion").find(tb.tb).bootstrapTable("load", tb.datos);
    });
});

$("#saveEvaluacion").click(function () {
    pregunta_t1 = [];
    pregunta_t2 = [];
    pregunta_t3 = [];
    pregunta_t4 = [];
    pregunta_tb = [];
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
                /*$(div_pregunta).find("input:checked").each(function (i, input_opcion) {
                 opciones.push($(input_opcion).data("id"));
                 });*/
                val = $(div_pregunta).find("select").val();
                pregunta_t4.push({"id": id, "opciones": val});
                break;
            case "5":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + tb_txt_json($(div_pregunta).find("#tb_Actividad_Horas")) + ' }'));
                break;
            case "6":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + tb_txt_json($(div_pregunta).find("#tb_Actividad_Mes")) + ' }'));
                break;
            case "7":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : {"tb_Graduacion" : ' + tb_rdb_json($(div_pregunta).find("#tb_Graduacion")) + ' , "tb_Actualidad" : ' + tb_rdb_json($(div_pregunta).find("#tb_Actualidad")) + ' }}'));
                break;
            case "8":
                dat_boostrap = $(div_pregunta).find("#tb_experiencia_laboral").bootstrapTable("getData");
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + JSON.stringify(dat_boostrap) + ' }'));
                break;
            case "9":
                dat_boostrap = $(div_pregunta).find("#tb_estudios_formación_adicional").bootstrapTable("getData");
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + JSON.stringify(dat_boostrap) + ' }'));
                break;
            case "10":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + tb_cbk_json($(div_pregunta).find("#tb_idioma_egresar")) + ' }'));
                break;
            case "11":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + tb_cbk_json($(div_pregunta).find("#tb_idioma_actualmente")) + ' }'));
                break;
            case "12":
                pregunta_tb.push(('{ "id_pregunta" : ' + id + ' , "tb" : ' + tb_rdb_json($(div_pregunta).find("#tb_facilidad_condicion")) + ' }'));
                break;
        }
    });
    console.log(pregunta_t4);

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
            preguntas_tb: pregunta_tb,
            id_encuesta: $("div[data-id]").attr("data-id")
        },
        success: function (response) {
            if (response.status) {
                $("#content").load("evaluacion/successEvaluacion.php");
            }
        }
    });
});

function load_preguntas_cat(id, panel) {
    $.ajax({
        type: "POST",
        url: "servidor/sEvaluacion.php",
        data: {
            op: "load_preguntas",
            id: id,
            id_encuesta: $("div[data-id]").attr("data-id")
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
                        //load_respuestas_preguntas(div_tipoPregunta, pregunta);
                        preguntas.push({div: div_tipoPregunta, pregunta: pregunta});
                        break;
                    case "2":
                        $(pregunta.opciones).each(function (index, opcion) {
                            div_opcion = $("#op_pIMultiple").find(".form-horizontal").clone();
                            $(div_opcion).data("id", opcion.id);
                            $(div_opcion).find("label").html(opcion.enunciado);
                            //load_respuestas_preguntas(div_opcion, pregunta);
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
                            //load_respuestas_preguntas(div_opcion, pregunta);
                            $(div_opcion).appendTo($(div_tipoPregunta).find(".opcion_content > div").eq(orden));
                        });
                        break;
                    case "4":
                        $(pregunta.opciones).each(function (index, opcion) {
                            //div_opcion = $("#op_pSUnica").clone();
                            option = document.createElement("option");
                            option.value = opcion.id;
                            option.textContent = opcion.enunciado;

                            /*$(div_opcion).removeAttr("id");
                             $(div_opcion).find("input").attr("name", "rdb" + pregunta.id);
                             $(div_opcion).find("input").data("id", opcion.id);
                             $(div_opcion).find("label").append(" " + opcion.enunciado);
                             orden = par(index) ? 0 : 1;*/
                             preguntas.push({div: $(div_tipoPregunta).find("select"), pregunta: pregunta});
                            $(div_tipoPregunta).find("select").append(option);
                            //$(div_opcion).appendTo($(div_tipoPregunta).find(".opcion_content > div").eq(orden));
                        });
                        break;
                    default :
                        bandera = true;
                        break;
                }
                if (bandera)
                    load_tabla(pregunta);
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
                if(!$.isEmptyObject(pregunta.preg_resp[0].opcion)){
                    tables.push({tb: _TipoTabla(pregunta.tipo), datos: JSON.parse(pregunta.preg_resp[0].opcion)});
                }
                break;
        }
    }

}

function load_respuestas_preguntas(div_pregunta, pregunta) {
    if (!$.isEmptyObject(pregunta.preg_resp)) {
        switch (pregunta.tipo) {
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
            return "#tb_horas_semana";
            break;
        case "6":
            return "#tb_mes_actividad";
            break;
        case "7":
            return "#tb_conocimiento_informatico";
            break;
        case "8":
            return "#ptb_experiencia_laboral";
            break;
        case "9":
            return "#ptb_estudios_formación_adicional";
            break;
        case "10":
            return "#ptb_idioma_egresar";
            break;
        case "11":
            return "#ptb_idioma_actualmente";
            break;
        case "12":
            return "#ptb_facilidad_condicion";
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
            op: "load_categoria"
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

function tb_header(tb) {
    thead = [];
    $(tb).find("thead tr th[data-field]").each(function (i, th) {
        thead.push($(th).attr("data-field"));
    });
    return thead;
}

function tb_rdb_json(tb) {
    thead = tb_header(tb);
    datos = [];
    $(tb).find("tbody tr").each(function (itr, tr) {
        dat_td = {};
        $(tr).find("td").each(function (itd, td) {
            value = '"' + thead[itd] + '" : ';
            if (itd === 0)
                value += '"' + $(td).html() + '"';
            else
                value += '' + $(td).find("input[type='radio']").prop('checked') + '';
            $.extend(dat_td, JSON.parse("{ " + value + " }"));
        });
        datos.push(dat_td);
    });
    //alert(JSON.stringify(datos));
    return (JSON.stringify(datos));
}

function tb_cbk_json(tb) {
    thead = tb_header(tb);
    datos = [];
    $(tb).find("tbody tr").each(function (itr, tr) {
        dat_td = {};
        $(tr).find("td").each(function (itd, td) {
            value = '"' + thead[itd] + '" : ';
            if (itd === 0)
                value += '"' + $(td).html() + '"';
            else
                value += '' + $(td).find("input[type='checkbox']").prop('checked') + '';
            $.extend(dat_td, JSON.parse("{ " + value + " }"));
        });
        datos.push(dat_td);
    });
    //alert(JSON.stringify(datos));
    return(JSON.stringify(datos));
}

function tb_txt_json(tb) {
    thead = tb_header(tb);
    datos = [];
    $(tb).find("tbody tr").each(function (itr, tr) {
        dat_td = {};
        $(tr).find("td").each(function (itd, td) {
            value = '"' + thead[itd] + '" : ';
            if (itd === 0)
                value += '"' + $(td).html() + '"';
            else
                value += '"' + $(td).find("input[type='text']").val() + '"';
            $.extend(dat_td, JSON.parse("{ " + value + " }"));
        });
        datos.push(dat_td);
    });
    //alert(JSON.stringify(datos));
    return(JSON.stringify(datos));
}

$(function () {

    $("#content_evaluacion #btn_add_tb_estudios_formación_adicional").click(function () {
        json_data = {};
        $("#content_evaluacion #content_tb_estudios_formación_adicional").find("input[data-field],select[data-field]").each(function (i, index) {
            $(this).attr("data-field");
            $.extend(json_data, JSON.parse('{"' + $(this).attr("data-field") + '" : "' + $(this).val() + '" }'));
        });
        $("#content_evaluacion #tb_estudios_formación_adicional").bootstrapTable('insertRow', {index: 0, row: json_data});
    });
    $("#content_evaluacion #btn_add_tb_experiencia_laboral").click(function () {
        json_data = {};
        $("#content_evaluacion #content_tb_experiencia_laboral").find("input[data-field],select[data-field]").each(function (i, index) {
            $(this).attr("data-field");
            $.extend(json_data, JSON.parse('{"' + $(this).attr("data-field") + '" : "' + $(this).val() + '" }'));
        });
        $("#content_evaluacion #tb_experiencia_laboral").bootstrapTable('insertRow', {index: 0, row: json_data});
    });


});