idEncuesta = 0;
function order_Encuesta_id(id){
    idEncuesta = id;
}
$(function () {
    $("#cboCategoria").change(function () {
        load_Preguntas_cat($(this).val());
    });
    load_Categoria();
    $(".list-group").on("click", ".subir", function () {
        li = $(this).closest(".list-group-item");
        i = li.index();
        if (i !== 0) {
            i_ant = i - 1;
            id = $(li).data("id");
            id_ant = $(".list-group").find(".list-group-item").eq(i_ant).data("id");
            $(li).data("id", id_ant);
            $(".list-group").find(".list-group-item").eq(i_ant).data("id", id);

            enunciado = $(li).find("span").html();
            enunciado_ant = $(".list-group").find(".list-group-item").eq(i_ant).find("span").html();
            $(li).find("span").html(enunciado_ant);
            $(".list-group").find(".list-group-item").eq(i_ant).find("span").html(enunciado);
        }
    });
    $(".list-group").on("click", ".bajar", function () {
        li = $(this).closest(".list-group-item");
        i = li.index();
        if ((i + 1) <= ($(".list-group").find("li").length - 1)) {
            i_ant = i + 1;
            id = $(li).data("id");
            id_ant = $(".list-group").find(".list-group-item").eq(i_ant).data("id");
            $(li).data("id", id_ant);
            $(".list-group").find(".list-group-item").eq(i_ant).data("id", id);

            enunciado = $(li).find("span").html();
            enunciado_ant = $(".list-group").find(".list-group-item").eq(i_ant).find("span").html();
            $(li).find("span").html(enunciado_ant);
            $(".list-group").find(".list-group-item").eq(i_ant).find("span").html(enunciado);
        }
    });

    $("#saveOrder").click(function () {
        li_s = [];
        $(".list-group li").each(function (i, li) {
            li_s.push({id: $(li).data("id"), order: (i + 1)});
        });
        $.ajax({
            url: 'servidor/sPreguntas.php',
            type: 'POST',
            async: false,
            dataType: "json",
            data: {
                op: "save_order",
                preguntas: li_s
            },
            success: function (data) {
                
            }
        });

    });


});
function load_Preguntas_cat(id_cat) {
    $.ajax({
        url: 'servidor/sPreguntas.php',
        type: 'POST',
        async: false,
        dataType: "json",
        data: {
            op: "list_preguntas",
            encuesta: idEncuesta,
            categoria: id_cat
        },
        success: function (data) {
            $(".list-group").find("li").remove();
            $.each(data, function (i, item) {
                li_option = $("#option_li").find("li").clone();
                $(li_option).data("id", item.id);
                $(li_option).find("span").html(item.enunciado);
                $(li_option).appendTo(".list-group");
            });
        }
    });
}

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