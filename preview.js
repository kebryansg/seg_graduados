columns = [];
data = {};

$(function () {
    $("#tb_listPreguntas").bootstrapTable();

    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        $.extend(data, JSON.parse('{"' + valor + '" : 2}'));
        datos = [];
        datos.push(data);
        columns.push({
            field: valor,
            title: valor,
            sortable: false,
            editable: true
        });
        console.log(columns);
        $("#tb_listPreguntas").bootstrapTable('refreshOptions', {
            columns: columns,
            data: datos
        });
        //$("#tb_listPreguntas").bootstrapTable("load",datos);
    });

});

function generateColumns() {
    return "{" +
            "field: 'p1'," +
            "title: 'Final Buy (inc GST)'," +
            "align: 'center'," +
            "valign: 'middle'," +
            "width: '20%'" +
            "}";
}
