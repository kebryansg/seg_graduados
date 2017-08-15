$("#btn_GenerarClave").click(function () {
    $.ajax({
        url: "servidor/sAcesso.php",
        data: {
            op: "gen",
            clave: $("#txt_Clave").val()
        },
        type: "POST",
        success: function (response) {
            if(response !== "no"){
                $("#cod-access").html(response);
            }
            else{
                $("#cod-access").html("(Cédula ya registrada)");
            }
        }
    });
});