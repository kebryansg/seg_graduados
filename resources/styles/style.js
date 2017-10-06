$(function () {
    /*$("#").keypress(function(){
        
    });*/
    
    
    $("#content").on("keypress", ".solo-numero", function (e) {
        var key = window.Event ? e.which : e.keyCode;
        return (key >= 48 && key <= 57);
    });
    
    $(".tablinks").click(function () {
        panel = $(this).attr("data-id");
        $(".tabcontent").hide();
        $(".tablinks").removeClass("active");
        $(this).addClass("active");
        $(panel).show();
    });
    $("#btnAcceder").click(function () {
        $.ajax({
            type: "POST",
            url: "servidor/sUsuario.php",
            async: false,
            dataType: "json",
            data: {
                op: "acceso",
                acceso: $("#txtAcceso").val()
            },
            success: function (response) {
                if (response.status === "ok")
                    location.href = response.url;
                else {
                    alert("Acceso incorrecto");
                    $("#txtAcceso").val("");
                }
            }
        });
    });
    $(".menu_admin").click(function (e) {
        e.preventDefault();
        url = $(this).attr("href");
        if (url !== "#")
            $("#content").load(url);
    });

});

function redireccionar(response) {
    //alert(response);
    //alert($(location).attr("href"));
    window.location.replace(response);
    alert();
    //$(location).attr("href", response);
    //alert($(location).attr("href"));

}

function setData() {
    $.each($("#content button[dat-id]"), function (indexInArray, valueOfElement) {
        id = $(valueOfElement).attr("dat-id");
        $(valueOfElement).data("id", id);
        $(valueOfElement).removeAttr("dat-id");
    });
}