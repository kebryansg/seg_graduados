columns = [];
contador = 1;
function get_Data() {
    rows = $.map($("#tb_columnas").bootstrapTable("getData"), function (row) {
        value = {
            field: row.columna,
            title: row.columna,
            sortable: false,
            tipo: row.tipo,
            excel: row.excel,
            columna_dominante: (row.columna === $("#cboColumnas").selectpicker("val"))
        };
        //console.log(value);
        
        switch (row.tipo) {
            case "1":
                $.extend(value, {
                    formatter: "input_format",
                    events: "input_action"
                });
                break;
            case "2":
                $.extend(value, {
                    data_source: row.data_source,
                    formatter: "select_format",
                    events: "cbo_action"
                });
                break;
            case "3":
                $.extend(value, {
                    formatter: "cbk_format",
                    events: "cbk_action"
                });
                break;
        }
        return value;
    });
    return rows;
}
$(function () {
    $("#cboTipo").change(function () {
        value = $(this).val();
        switch (value) {
            case "1":
                $("#op_select").addClass("hidden");
                break;
            case "3":
                $("#op_select").addClass("hidden");
                break;
            case "2":
                del_select();
                $("#op_select").removeClass("hidden");
                break;
        }
    });
    $("#btn_remove_column").click(function () {
        value = $("#cboColumnas").val();
        index = $("#cboColumnas").prop("selectedIndex") - 1;
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

    $("#datos").click(function () {
        rows = get_Data();
        console.log(rows);
    });
    $(".btn-remove-table").click(function () {
        table = $(this).closest(".row").find("table");
        var ids = $.map($(table).bootstrapTable('getSelections'), function (row) {
            return row.id;
        });
        $(table).bootstrapTable('remove', {
            field: 'id',
            values: ids
        });
    });

    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        if (!$.isEmptyObject(valor)) {
            tipo = $("#cboTipo").val();
            bandera = 0;
            row = {};
            switch (tipo) {
                default:
                    row = {
                        id: contador,
                        columna: valor,
                        tipo: tipo,
                        excel: true
                    };
                    break;
                case "2":
                    source = [];
                    if ($("#op_select select option").length > 0) {
                        $("#op_select select option").each(function (i, v) {
                            source.push({value: i, text: $(v).html()});
                        });
                        row = {
                            id: contador,
                            columna: valor,
                            data_source: source,
                            tipo: tipo,
                            excel: true
                        };
                    } else {
                        bandera = 3;
                    }
                    break;
            }
            if (bandera === 0) {
                $("#tb_columnas").bootstrapTable("insertRow", {index: contador, row: row});
                if (row.tipo === "2") {
                    $("#cboColumnas").append("<option value='" + row.columna + "'>" + row.columna + "</option>");
                    $("#cboColumnas").selectpicker("refresh");
                }
                contador++;
                $("#col_add").val("");
                $("#cboTipo").selectpicker("val", "1").change();
                valor = null;
            } else if (bandera === 3) {
                alert("Advertencia: Combo vacio.");
            }
        } else {
            alert("Advertencia: Campo requerido.");
        }
    });
});

function del_select() {
    $("#op_select input").val('');
    $("#op_select select").html("");
    $("#op_select select").selectpicker("refresh");
}

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
function tipo_format(value) {
    valor = "";
    switch (value) {
        case "1":
            valor = "Ingreso";
            break;
        case "2":
            valor = "Combo";
            break;
        case "3":
            valor = "Checkbox";
            break;
    }
    return valor;
}