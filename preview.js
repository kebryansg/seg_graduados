$(function () {
    
    
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
    /*$("#content_evaluacion #btn_add_tb_estudios_formación_adicional").click(function () {
     alert();
     json_data = {};
     $("#content_tb_estudios_formación_adicional").find("input[data-field],select[data-field]").each(function (i, index) {
     $(this).attr("data-field");
     $.extend(json_data, JSON.parse('{"' + $(this).attr("data-field") + '" : "' + $(this).val() + '" }'));
     });
     $("#tb_estudios_formación_adicional").bootstrapTable('insertRow', {index: 0, row: json_data});
     });*/
});
$("#btnMostrar").click(function () {
    json_data = [];
    trs = $("#tb_Graduacion").find("tbody tr");
    $(trs).each(function (itr, tr) {
        json_val = {};
        $(tr).find("td").each(function (itd, td) {
            switch (itd) {
                case 0:
                    $.extend(json_val, {conocimiento: $(td).html()});
                    break;
                case 1:
                    resultado = $(td).find("input[type='radio']").prop('checked') ? "checked" : "";
                    $.extend(json_val, {1: resultado});
                    break;
                case 2:
                    resultado = $(td).find("input[type='radio']").prop('checked') ? "checked" : "";
                    $.extend(json_val, {2: resultado});
                    break;
                case 3:
                    resultado = $(td).find("input[type='radio']").prop('checked') ? "checked" : "";
                    $.extend(json_val, {3: resultado});
                    break;
                case 4:
                    resultado = $(td).find("input[type='radio']").prop('checked') ? "checked" : "";
                    $.extend(json_val, {4: resultado});
                    break;
                case 5:
                    resultado = $(td).find("input[type='radio']").prop('checked') ? "checked" : "";
                    $.extend(json_val, {5: resultado});
                    break;
            }
        });
        json_data.push(json_val);
    });
    //alert($("#tb_example").find("tbody tr input[type='radio']").length);
    alert(JSON.stringify(json_data));
});

$("#btnLoad").click(function () {

    tb_cbk_json("#tb_idioma_egresar");
    //tb_txt_json("#tb_Actividad_Horas");

    //data = [{"idioma":"Ingles","d_escazo":true,"e_nada":false,"a_alto":false,"a_medio":false,"a_bajo":false,"b_alto":false,"b_medio":false,"b_bajo":false,"c_alto":false,"c_medio":false,"c_bajo":false},{"idioma":"Frances","d_escazo":false,"e_nada":false,"a_alto":false,"a_medio":true,"a_bajo":false,"b_alto":false,"b_medio":false,"b_bajo":false,"c_alto":false,"c_medio":false,"c_bajo":false},{"idioma":"Aleman","d_escazo":false,"e_nada":false,"a_alto":false,"a_medio":false,"a_bajo":false,"b_alto":true,"b_medio":false,"b_bajo":false,"c_alto":false,"c_medio":false,"c_bajo":false}];
    //$("#tb_idioma_egresar").bootstrapTable("load", data);

});




$("#btn_add_tb_experiencia_laboral").click(function () {
    json_data = {};
    $("#content_tb_experiencia_laboral").find("input[data-field],select[data-field]").each(function (i, index) {
        $(this).attr("data-field");
        $.extend(json_data, JSON.parse('{"' + $(this).attr("data-field") + '" : "' + $(this).val() + '" }'));
    });
    $("#tb_experiencia_laboral").bootstrapTable('insertRow', {index: 0, row: json_data});
});



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
    alert(JSON.stringify(datos));
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
    alert(JSON.stringify(datos));
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
    alert(JSON.stringify(datos));
}


function cbk_tbA(value, row, index) {
    var checked = value ? 'checked' : '';
    return '<input type="radio" name="tbA' + index + '" ' + checked + ' />';
}
function cbk_tbG(value, row, index) {
    var checked = value ? 'checked' : '';
    return '<input type="radio" name="tbG' + index + '" ' + checked + ' />';
}
function cbk_tbFC(value, row, index) {
    var checked = (value === "true") ? 'checked' : '';
    return '<input type="radio" name="tbFC' + index + '" ' + checked + ' />';
}

function check(value) {
    var checked = value ? 'checked' : '';
    return '<input type="checkbox"  ' + checked + ' />';
}

function input_txt(value) {
    //style="width:50px;"
    value = (value === undefined) ? "" : value;
    alert();
    return '<input type="text" class="form-control"  value="' + value + '" />';
}

