columns = [];
data = {};

$(function () {
    $("#tb_listPreguntas").bootstrapTable();


    $("#btn_add").click(function () {
        valor = $("#col_add").val();
        tipo_editable = null;
        tipo = $("#cboTipo").val();
        switch (tipo) {
            case "input":
                tipo_editable = true;
                break;
            case "select":
                tipo_editable = {
                    type: 'select',
                    source: [
                        {value: 1, text: 'Active'},
                        {value: 2, text: 'Blocked'},
                        {value: 3, text: 'Deleted'}
                    ],
                    //'title': 'Herd Tag',
                    'prepend': {none: "--------------"}
                };
                break;
        }

        $.extend(data, JSON.parse('{"' + valor + '" : 2}'));
        datos = [];
        datos.push(data);
        columns.push({
            field: valor,
            title: valor,
            sortable: false,
            editable: tipo_editable
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
/*
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