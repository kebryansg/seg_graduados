var TablePaginationDefault = {
    //height: 400,
    pageSize: 5,
    //search: true,
    pageList: [5, 10, 15, 20],
    cache: false,
    showRefresh: true,
    pagination: true,
    sidePagination: "server"
};

function getJsonOptimizado(params) {
    result = {};
    $.ajax({
        url: params.url,
        async: false,
        type: 'POST',
        dataType: 'json',
        data: params.data,
        success: function (response) {
            result = response;
        }
    });
    return result;
}

$(function () {
    $("#content").on("keypress", ".solo-numero", function (e) {
        var charCode = window.Event ? e.which : e.keyCode;
        return !(charCode > 31 && (charCode < 48 || charCode > 57));
    });
    
    $("#txtAcceso").keydown(function(e){
        if(e.keyCode === 13){
            $("#btnAcceder").click();
        }
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
                else if (response.status === "no") {
                    alert(response.mensaje);
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

function row_count(value, row, index) {
    return index;
}

function select_format(value) {
    resultado = '<select data-field="' + this.field + '" class="form-control cbo">';
    $(this.data_source).each(function (i, v) {
        selected = value === v.value.toString() ? 'selected="true"' : "";
        resultado += '<option ' + selected + ' value="' + v.text + '">' + v.text + '</option>';
    });
    resultado += '</select>';
    return resultado;
}
function cbk_format(value) {
    checked = (value) ? "checked" : "";
    return '<input type="checkbox" class="form-control cbk" data-field="' + this.field + '" ' + checked + ' >';
}
function input_format(value) {
    value = $.isEmptyObject(value) ? "" : value;
    return '<input type="text" class="form-control col-md-1 txt" data-field="' + this.field + '" value="' + value + '">';
}

window.input_action = {
    'blur .txt': function (e, value, row, index) {
        table = $(this).closest("table");
        $(table).bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(e.target).val(), reinit: false});
    }
};
window.cbo_action = {
    'change .cbo': function (e, value, row, index) {
        table = $(this).closest("table");
        $(table).bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(e.target).val(), reinit: false});
    }
};
window.cbk_action = {
    'change .cbk': function (e, value, row, index) {
        table = $(this).closest("table");
        $(table).bootstrapTable('updateCell', {index: index, field: $(e.target).attr('data-field'), value: $(this).prop('checked'), reinit: false});
    }
};