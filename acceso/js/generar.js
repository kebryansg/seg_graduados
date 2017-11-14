$("#tb_detallesEncuestas").bootstrapTable();
$("#tb_detallesEncuestas").bootstrapTable("hideColumn", "id_titulo");
$("#tb_detallesEncuestas").bootstrapTable("hideColumn", "id_encuesta");
$("#btn_GenerarClave").click(function () {
    $.ajax({
        url: "servidor/sAcesso.php",
        data: {
            op: "getEstudiante",
            id_estudiante: $("#txt_Clave").val()
        },
        type: "POST",
        dataType: 'json',
        success: function (response) {
            if(response.status){
                $("#cod-busqueda").html($("#txt_Clave").val());
                $("#info-result").removeClass("hidden");
                asig_estudiante(response.estudiante);
                console.log(response.data);
                $("#tb_detallesEncuestas").bootstrapTable("load", response.data);
            }else{
                //$("#info-result").addClass("hidden");
            }
        }
    });
});

$("#txt_Clave").keydown(function(e){
    if(e.keyCode === 13 && e.currentTarget.value.length === 10){
        $("#btn_GenerarClave").click();
    }
});
function asig_estudiante(estudiante){
    $("#info_cedula").html(estudiante.cedula);
    $("#info_nombre").html(estudiante.nombres);
}
function btn_accion(value){
    if($.isEmptyObject(value)){
        return '<button class="btn btn-success btn-sm" name="gen_acceso">Generar acceso</button>';
    }
    return value;
}

window.event_accion = {
    "click button[name='gen_acceso']": function(e, value, row, index){
        $.ajax({
            url: "servidor/sAcesso.php",
            data: {
                op: "genAcceso",
                id_titulo: row.id_titulo,
                id_encuesta: row.id_encuesta
            },
            type: "POST",
            success: function (response) {
                $("#btn_GenerarClave").click();
            }
        });
    }
};