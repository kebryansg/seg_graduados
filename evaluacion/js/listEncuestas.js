table = "#tb_listEncuestas";
paginacion = ("#pag_tb_listEncuestas");
$(function(){
    $(".selectpicker").selectpicker();
    $("table").bootstrapTable();
    load_Encuestas(true,1);
    
    $("#btnGenerar").click(function () {
        $.ajax({
            url: "servidor/sEvaluacion.php",
            type: 'POST',
            data: {
                op: "file"
            }
            , success: function (data) {
                url = "xlsx.php";
                window.open(url, '_blank');
            }
        });
    });
    
    
});

function loadPaginacion(total) {
    $(paginacion + " li a").not("[aria-label]").closest("li").remove();
    li = '';
    for (var c = 0; c < total; c++) {
        li += ('<li ' + ((c === 0) ? 'class="active"' : '') + ' ><a href="#">' + (c + 1) + '</a></li>');
    }
    $(paginacion + " li").first().after(li);
}
$("#content").on("click", paginacion + " li a[aria-label]", function (e) {
    e.preventDefault();
    li_old = $(paginacion + " li[class='active']");
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
$("#content").on("click", paginacion + " li:not([class='active']) a:not([aria-label])", function (e) {
    e.preventDefault();
    li = $(this).closest("li");
    $(paginacion + " li[class='active']").toggleClass("active");
    $(li).toggleClass("active");
    load_Preguntas(false, $(this).html());
});

function load_Encuestas(bandera, pag) {
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sEvaluacion.php",
        async: false,
        data: {
            op: "list",
            top: top,
            pag: ((pag - 1) * top)
        },
        success: function (response) {
            if (bandera)
                loadPaginacion(response.total);
            $(table).bootstrapTable("load", (response.load));
            $(table).bootstrapTable('resetView');
        }
    });
}


