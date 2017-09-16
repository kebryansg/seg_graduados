idEncuesta = 0;
$("#orderPregunta").click(function () {
    $("#content").load('pregunta/orderPregunta.php');
});
function getEncuesta_id(id){
    idEncuesta = id;
}
default_pregunta = {
    initiateStartPageClick: false,
    totalPages: 1,
    visiblePages: 5,
    first: "&larrb;",
    prev: "&laquo;",
    next: "&raquo;",
    last: "&rarrb;"
};

function load_Preguntas(pag) {
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sPreguntas.php",
        async: false,
        data: {
            op: "list",
            top: top,
            idEncuesta: idEncuesta,
            pag: ((pag - 1) * top),
            categoria: $("#cboCategoria").val()
        },
        success: function (response) {
            $("#tb_listPreguntas").bootstrapTable("load", response.load);
            $("#pagination-demo").twbsPagination('destroy');

            $("#pagination-demo").twbsPagination($.extend({}, default_pregunta, {
                startPage: pag,
                totalPages: response.count,
                onPageClick: function (event, page) {
                    load_Preguntas(page);
                }
            }));
        }
    });
}

$("#cboCategoria").change(function () {
    load_Preguntas(1);
});

$("#cboTop").change(function () {
    load_Preguntas(1);
});

$("#newPregunta").click(function (e) {
    e.preventDefault();
    $("#content").load("pregunta/newPregunta.php");
});

$("#tb_listPreguntas").on("click", 'button[name="editPregunta"]', function () {
    id = ($(this).attr("dat-id"));
    $("#content").load("pregunta/newPregunta.php", function () {
        editPregunta(id);
    });
});

$("#tb_listPreguntas").on("click", 'button[name="deletePregunta"]', function () {
    id = ($(this).attr("dat-id"));
    $.post("servidor/sPreguntas.php",
            {
                op: "delete",
                id: id
            },
            function (data) {
                load_Preguntas(1);
            }
    );
});

$(function () {
    $("#tb_listPreguntas").bootstrapTable();
    $(".selectpicker").selectpicker("refresh");
    load_Categoria();
    //load_Preguntas(1);
    //setData();
});



function load_Categoria() {
    $.ajax({
        url: 'servidor/sPreguntas.php',
        type: 'POST',
        async: false,
        data: {
            op: "load_categoria"
        },
        success: function (data) {
            $("#cboCategoria").html(data);
            $("#cboCategoria").selectpicker("refresh");
        }
    });
}