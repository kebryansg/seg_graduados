columns = [];
$(function () {
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
    $("#tb_listPreguntas").bootstrapTable();

    $("#btn_new_row").click(function () {
        total = $("#tb_listPreguntas").bootstrapTable('getData').length;
        if (total === 0) {
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
        }
    });

    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        if (!$.isEmptyObject(valor)) {
            tipo = $("#cboTipo").val();
            bandera = 0;
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
                    if ($("#op_select select option").length > 0) {
                        $("#op_select select option").each(function (i, v) {
                            source.push({value: i, text: $(v).html()});
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
                    } else {
                        bandera = 3;
                    }
                    break;
            }
            if (bandera === 0) {
                $("#cboColumnas").append('<option value="' + valor + '">' + valor + '</option>');
                $("#cboColumnas").selectpicker("refresh");

                $("#tb_listPreguntas").bootstrapTable('refreshOptions', {
                    columns: columns
                });
                $("#col_add").val("");
                $("#cboTipo").selectpicker("val", "input").change();
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