$(function () {

    $.post("servidor/sConfiguracion.php",
            {
                accion: "list",
                op: "configuracion"
            },
            function (response) {
                datos = JSON.parse(response);
                edit(datos, ".panel-body");
            });


    $("button[cancelar]").click(function (e) {
        $("#content").html("");
    });


    $("button[save]").click(function (e) {
        datos = {
            url: "servidor/sConfiguracion.php",
            dt: {
                accion: "save",
                op: "configuracion",
                datos: loadJson(".panel-body")
            }
        };

        $.post(
                datos.url,
                datos.dt
                );
        //$("form").trigger("reset");
    });
});

function edit(datos, div) {

    for (var clave in datos) {
        $(div + " [name='" + clave.toLowerCase() + "']").val(datos[clave]);
    }
}

function loadJson(div) {
    datos = {};
    $(div).find("[name]").each(function (index, element) {
        switch (element.tagName) {
            default:
                datos[$(element).attr("name")] = $(element).val();
                break;
        }
    });
    console.log(JSON.stringify(datos));
    return JSON.stringify(datos);
}