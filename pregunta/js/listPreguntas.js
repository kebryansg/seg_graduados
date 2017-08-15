paginacion_listPreguntas = ("#pag_tb_listPreguntas");
function loadPaginacionlistPreguntas(total) {
    $(paginacion_listPreguntas + " li a").not("[aria-label]").closest("li").remove();
    li = '';
    for (var c = 0; c < total; c++) {
        li += ('<li ' + ((c === 0) ? 'class="active"' : '') + ' ><a href="#">' + (c + 1) + '</a></li>');
    }
    $(paginacion_listPreguntas + " li").first().after(li);
}
$("#orderPregunta").click(function(){
    $("#content").load('pregunta/orderPregunta.php');
});

$("#content").on("click", paginacion_listPreguntas + " li a[aria-label]", function (e) {
    e.preventDefault();
    li_old = $(paginacion_listPreguntas + " li[class='active']");
    li = undefined;
    switch ($(this).attr("aria-label")) {
        case "Anterior":
            li = $(li_old).prev();
            break;
        case "Siguiente":
            li = $(li_old).next();
            break;
    }
    if ($(li).find("a[aria-label]").length === 0) {
        $(li).toggleClass("active");
        $(li_old).toggleClass("active");
        load_Preguntas(false, $(li).find("a").html());
    }
});
$("#content").on("click", paginacion_listPreguntas + " li:not([class='active']) a:not([aria-label])", function (e) {
    e.preventDefault();
    li = $(this).closest("li");
    $(paginacion_listPreguntas + " li[class='active']").toggleClass("active");
    $(li).toggleClass("active");
    load_Preguntas(false, $(this).html());
});

function load_Preguntas(bandera, pag) {
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sPreguntas.php",
        async: false,
        data: {
            op: "list",
            top: top,
            pag: ((pag - 1) * top),
            categoria: $("#cboCategoria").val()
        },
        success: function (response) {
            if (bandera)
                loadPaginacionlistPreguntas(response.count);
            $("#tb_listPreguntas").bootstrapTable("load", response.load);
            $('#tb_listPreguntas').bootstrapTable('resetView');
        }
    });
}

$("#cboCategoria").change(function () {
    load_Preguntas(true, 1);
});

$("#cboTop").change(function () {
    load_Preguntas(true, 1);
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
                load_Preguntas(true, 1);
            }
    );
});

$(function () {

    $("#tb_listPreguntas").bootstrapTable();
    $(".selectpicker").selectpicker("refresh");
    load_Categoria();
    load_Preguntas(true, 1);


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