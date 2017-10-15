idEncuesta = 0;
deshabilitada = false;
function getEncuesta_id(id) {
    idEncuesta = id;
}
$(function () {
    $("#tb_listPreguntas").bootstrapTable();
    $(".selectpicker").selectpicker("refresh");
    load_Categoria();
    //load_Preguntas(1);
    //setData();
});

$("#cbk_preguntas_ocultas").change(function () {
    deshabilitada = $(this).is(":checked");
    load_Preguntas(1);
    /*if ($(this).is(":checked")) {
        alert("true");
    }*/
});
$("#orderPregunta").click(function () {
    id = idEncuesta;
    $("#content").load('pregunta/orderPregunta.php', function () {
        order_Encuesta_id(id);
    });
});

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
    //alert(deshabilitada);
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sPreguntas.php",
        async: false,
        data: {
            op: "list",
            top: top,
            deshabilitada: deshabilitada,
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
    id = (idEncuesta);
    $("#content").load("pregunta/newPregunta.php", function () {
        NewEncuesta_id(id);
    });
});

$("#tb_listPreguntas").on("click", 'button[name="editPregunta"]', function () {
    id = ($(this).attr("dat-id"));
    id_e = idEncuesta;
    $("#content").load("pregunta/newPregunta.php", function () {
        editPregunta(id);
        NewEncuesta_id(id_e);
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
$("#tb_listPreguntas").on("click", 'button[name="addPregunta"]', function () {
    id = ($(this).attr("dat-id"));
    $.post("servidor/sPreguntas.php",
            {
                op: "refresh",
                id: id
            },
            function (data) {
                load_Preguntas(1);
            }
    );
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