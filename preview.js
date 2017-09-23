function select_format(value) {
    resultado = '<select data-field="' + this.field + '" class="form-control cbo">';
    $(this.data_source).each(function (i, v) {
        selected = value === v.value.toString() ? 'selected="true"' : "";
        resultado += '<option ' + selected + ' value="' + i + '">' + v.text + '</option>';
    });
    resultado += '</select>';
    return resultado;
}
function cbk_format(value) {
    checked = (value) ? "checked" : "";
    return '<input type="checkbox" class="form-control cbk" data-field="' + this.field + '" ' + checked + ' >';
}
function input_format(value) {
    value = $.isEmptyObject(value) ? "" : value;
    return '<input type="text" class="form-control col-md-1 txt" data-field="' + this.field + '" value="' + value + '">';
}

window.input_action = {
    'blur .txt': function (e, value, row, index) {
        $("#tb_listPreguntas").bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(e.target).val(), reinit: false});
    }
};
window.cbo_action = {
    'blur .cbo': function (e, value, row, index) {
        $("#tb_listPreguntas").bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(e.target).val(), reinit: false});
    }
};
window.cbk_action = {
    'change .cbk': function (e, value, row, index) {
        $("#tb_listPreguntas").bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(this).prop('checked'), reinit: false});
    }
};

columns = [];
data = {};

$(function () {
    $("#btn_colm").click(function () {
        console.log(JSON.stringify($("#tb_listPreguntas").bootstrapTable("getOptions").columns));
    });

    $("#add").click(function () {
        $("#tb_muestra").bootstrapTable("insertRow", {
            index: 1,
            row: {
                h1: "kevin",
                h2: "1"
            }
        });
    });
    $("#datos").click(function () {
        console.log(JSON.stringify($("#tb_muestra").bootstrapTable('getData')));
    });


    $("#cboTipo").change(function () {
        value = $(this).val();
        switch (value) {
            case "input":
                $("#op_select").addClass("hidden");
                break;
            case "check":
                $("#op_select").addClass("hidden");
                break;
            case "select":
                del_select();
                $("#op_select").removeClass("hidden");
                break;
        }
    });
    $("#btn_remove_column").click(function () {
        value = $("#cboColumnas").val();
        index = $("#cboColumnas").prop("selectedIndex") -1;
        $("#cboColumnas").find('[value="' + value + '"]').remove();
        $("#cboColumnas").selectpicker("refresh");
        columns.splice(index, 1);
        $("#tb_listPreguntas").bootstrapTable('refreshOptions', {
            columns: columns
        });
    });

    $("#btn_add_op").click(function () {
        value = $("#op_select input").val();
        $("#op_select select").append('<option>' + value + '</option>');
        $("#op_select select").selectpicker("refresh");
        $("#op_select input").val('');
    });

    $("#btn_remove_op").click(function () {
        del_select();
    });
    
    $("#btn_data").click(function () {
        //datos_p = [{"nombres": "kevin", "estado civil": "1"}, {"nombres": "bryan", "estado civil": "0"}];
        //$("#tb_listPreguntas").bootstrapTable('load', datos_p);
        console.log($("#tb_listPreguntas").bootstrapTable("getData"));
    });

    $("#tb_listPreguntas").bootstrapTable();

    $("#btn_new_row").click(function () {
        str_row = [];
        $.each(columns, function (index, value) {
            switch (value.tipo) {
                case "check":
                    str_row.push('"' + value.field + '" : false');
                    break;
                case "input":
                    str_row.push('"' + value.field + '" : ""');
                    break;
            }

        });
        total = $("#tb_listPreguntas").bootstrapTable('getData').length;
        $("#tb_listPreguntas").bootstrapTable('insertRow', {
            index: total,
            row: JSON.parse('{ ' + str_row.join() + ' }')
        });
    });

    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        tipo = $("#cboTipo").val();
        $("#cboColumnas").append('<option value="' + valor + '">' + valor + '</option>');
        $("#cboColumnas").selectpicker("refresh");

        switch (tipo) {
            case "check":
                columns.push({
                    field: valor,
                    title: valor,
                    tipo: "check",
                    sortable: false,
                    formatter: "cbk_format",
                    events: "cbk_action"
                });
                break;
            case "input":
                columns.push({
                    field: valor,
                    title: valor,
                    tipo: "input",
                    sortable: false,
                    formatter: "input_format",
                    events: "input_action"
                });
                break;
            case "select":
                source = [];
                $("#op_select select option").each(function (i, v) {
                    source.push({value: i, text: $(v).html()});
                    /*selected = value === i.toString() ? 'selected="true"' : "";
                     resultado += '<option ' + selected + ' value="' + i + '">' + $(v).html() + '</option>';*/
                });

                columns.push({
                    field: valor,
                    title: valor,
                    tipo: "select",
                    sortable: false,
                    data_source: source,
                    formatter: "select_format",
                    events: "cbo_action"
                });
                break;
        }

        $("#tb_listPreguntas").bootstrapTable('refreshOptions', {
            columns: columns
        });
        $("#col_add").val("");
        valor = null;
    });

});

function del_select() {
    $("#op_select input").val('');
    $("#op_select select").html("");
    $("#op_select select").selectpicker("refresh");
}

/*
 function generateColumns() {
 return "{" +
 "field: 'p1'," +
 "title: 'Final Buy (inc GST)'," +
 "align: 'center'," +
 "valign: 'middle'," +
 "width: '20%'" +
 "}";
 }
 
 * $table.bootstrapTable({
 //idField: 'id',
 height: getHeight(),
 columns: [{
 field: 'state',
 title: '',
 checkbox: true
 
 }, {
 field: 'id',
 title: 'ids',
 sortable: true
 }, {
 field: 'name',
 title: 'names',
 sortable: true,
 editable: {
 type: 'select',
 source: [
 {value: 1, text: 'Active'},
 {value: 2, text: 'Blocked'},
 {value: 3, text: 'Deleted'}
 ],
 //'title': 'Herd Tag',
 'prepend': {none: "--------------"}
 }
 }, {
 field: 'price',
 title: 'prices',
 sortable: true,
 switchable: true
 }, {
 field: 'operate',
 title: 'Action',
 sortable: true,
 editable: false,
 formatter: "operateFormatter",
 events: "operateEvents"
 
 }]
 });
 * 
 */