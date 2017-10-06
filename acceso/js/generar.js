$("#tb_detallesEncuestas").bootstrapTable();
$("#tb_detallesEncuestas").bootstrapTable("hideColumn", "Cod");
$("#tb_detallesEncuestas").bootstrapTable("hideColumn", "titulo");
$("#tb_detallesEncuestas").bootstrapTable("hideColumn", "encuesta");
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
                $("#tb_detallesEncuestas").bootstrapTable("load", response.data);
            }else{
                //$("#info-result").addClass("hidden");
            }
        }
    });
});

$("#tb_detallesEncuestas").on("click", ".gen_acceso", function () {
    row = $("#tb_detallesEncuestas").bootstrapTable('getRowByUniqueId', $(this).attr("dt-num"));
    $.ajax({
        url: "servidor/sAcesso.php",
        data: {
            op: "genAcceso",
            id_titulo: row.titulo,
            id_encuesta: row.encuesta
        },
        type: "POST",
        success: function (response) {
            $("#btn_GenerarClave").click();
        }
    });
});
function asig_estudiante(estudiante){
    $("#info_cedula").html(estudiante.cedula);
    $("#info_nombre").html(estudiante.nombres);
}