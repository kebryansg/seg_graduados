$(function () {
    //alert();
    $(".selectpicker").selectpicker();
    $("#cboFacultad_init").change(function (e) {
        load_Carrera($(this).val(), "#cboCarrera_init");
    });
    $("form").submit(function (e) {
        e.preventDefault();
        var status = false;
        $.ajax({
            url: "servidor/sUsuario.php",
            type: 'POST',
            dataType: 'json',
            async: false,
            data: {
                op: "insertUsuario",
                datos: getJson("form")
            },
            success: function(response){
                alert(response.msj);
                status = (response.status);
            }
        });
        if(status){
            $(this).trigger("reset");
        }
    });

});

function getJson(div) {
    datos = {};
    $(div + " [name]").each(function (i, element) {
        datos[$(element).attr("name")] = $(element).val();
    });
    return JSON.stringify(datos);
}
function load_Carrera(facultad, cbo) {
    $.ajax({
        url: "servidor/sEvaluacion.php",
        type: "POST",
        //async: false,
        dataType: 'json',
        data: {
            op: "carrera",
            facultad: facultad
        },
        success: function (response) {
            //$(cbo).html("<option value='0'>Seleccione</option>");
            $.each(response, function (i, row) {
                option = document.createElement("option");
                $(option).val(row.id);
                $(option).text(row.descripcion);
                $(cbo).append(option);
            });
            $(cbo).selectpicker("refresh");
            $(cbo).change();
        }
    });
}