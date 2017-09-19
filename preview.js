columns = [];
$(function () {
    $("#tb_listPreguntas").bootstrapTable();

    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        columns.push({
            field: valor,
            title: valor,
            sortable: false
        });
        $("#tb_listPreguntas").bootstrapTable('refreshOptions', {
            columns: columns
        });
        //console.log(($("#tb_listPreguntas").bootstrapTable("getOptions").columns[0]));
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
