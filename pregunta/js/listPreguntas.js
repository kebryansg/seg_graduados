idEncuesta = 0;
deshabilitada = false;



function getEncuesta_id(id) {
    idEncuesta = id;
}
$(function () {
    $("#tb_listPreguntas").bootstrapTable();
    $(".selectpicker").selectpicker("refresh");
});

window.event_colAccion = {
    'click button[name="editPregunta"]' : function(e, value, row, index){
        id_e = idEncuesta;
        $("#content").load("pregunta/newPregunta.php", function () {
            editPregunta(row.id);
            NewEncuesta_id(id_e);
        });
    },
    'click button[name="estado_excel"]' : function(e, value, row, index){
        btn = $(this);
        estado = 0;
        if($(this).hasClass("btn-danger")){
          estado = 1;
        }
        $.ajax({
            url: "servidor/sPreguntas.php",
            type: 'POST',
            data: {
                id : row.id,
                estado: estado,
                op: "estado_excel"
            },
            success: function(response){
                if(estado === 1){
                    $(btn).removeClass("btn-danger");
                    $(btn).addClass("btn-success");
                    $(btn).find("i").removeClass("glyphicon-remove");
                    $(btn).find("i").addClass("glyphicon-ok");
                }
                else {
                    $(btn).removeClass("btn-success");
                    $(btn).addClass("btn-danger");
                    $(btn).find("i").removeClass("glyphicon-ok");
                    $(btn).find("i").addClass("glyphicon-remove");
                }
            }
        });
    },
    'click button[name="deletePregunta"]' : function(e, value, row, index){
        $.post("servidor/sPreguntas.php",
                {
                    op: "delete",
                    id: row.id
                },
                function (data) {
                    load_Preguntas(1);
                }
        );
    },
    'click button[name="addPregunta"]' : function(e, value, row, index){
        $.post("servidor/sPreguntas.php",
                {
                    op: "refresh",
                    id: row.id
                },
                function (data) {
                    load_Preguntas(1);
                }
        );
    },
    'click button[name="tabulacion"]' : function(e, value, row, index){
        btn = $(this);
        estado = 0;
        if($(this).hasClass("btn-danger")){
          estado = 1;
        }
        $.ajax({
            url: "servidor/sPreguntas.php",
            type: 'POST',
            data: {
                id : row.id,
                estado: estado,
                op: "estado_tabulacion"
            },
            success: function(response){
                if(estado === 1){
                    $(btn).removeClass("btn-danger");
                    $(btn).addClass("btn-success");
                    $(btn).find("i").removeClass("glyphicon-remove");
                    $(btn).find("i").addClass("glyphicon-ok");
                }
                else {
                    $(btn).removeClass("btn-success");
                    $(btn).addClass("btn-danger");
                    $(btn).find("i").removeClass("glyphicon-ok");
                    $(btn).find("i").addClass("glyphicon-remove");
                }
            }
        });
    }
};

function colAccion(value){
    estado = '';
    estado_tabulacion = '';
    estado_1 = '';
    estado_2 = '';
    //console.log(value);
    values = value.split(":");
    value_estado = parseInt(values[0]);
    value_estado_excel = parseInt(values[1]);
    value_estado_tabulacion = parseInt(values[2]);
    
    
    if(value_estado_tabulacion === 1){
        estado_tabulacion = '<button name="tabulacion" data-toggle="tooltip" title="Permitir Tabulación" class="btn btn-sm btn-success" ><i class="glyphicon glyphicon-ok"></i></button> ';
    }else{
        estado_tabulacion = '<button name="tabulacion" data-toggle="tooltip" title="Permitir Tabulación" class="btn btn-sm btn-danger" ><i class="glyphicon glyphicon-trash"></i></button> ';
    }
    
    if(value_estado === 1){
        estado = '<button name="deletePregunta" data-toggle="tooltip" title="Eliminar Pregunta" class="btn btn-sm btn-danger" ><i class="glyphicon glyphicon-trash"></i></button> ';
    }else {
        estado = '<button name="addPregunta" data-toggle="tooltip" title="Reestablecer Pregunta" class="btn btn-sm btn-success" ><i class="glyphicon glyphicon-refresh"></i></button> ';
    }
    if(value_estado_excel === 1){
        estado_1 = 'btn-success';
        estado_2 = 'glyphicon-ok';
    }else {
        estado_1 = 'btn-danger';
        estado_2 = 'glyphicon-remove';
    }
    
    return ''+
           '<button data-toggle="tooltip" title="Editar Pregunta" name="editPregunta" class="btn btn-sm btn-primary" ><i class="glyphicon glyphicon-edit"></i></button> '+
           estado +
           '<button name="estado_excel" data-toggle="tooltip" title="Permitir excel" class="btn btn-sm '+ estado_1 +'" ><i class="glyphicon '+ estado_2 +'"></i></button> '+
           estado_tabulacion ;
}

/*$("#tb_listPreguntas").on("click","button[name='estado_excel']",function(){
    btn = $(this);
    id = $(this).attr("dat-id");
    estado = 0;
    if($(this).hasClass("btn-danger")){
        estado = 1;
    }
    $.ajax({
        url: "servidor/sPreguntas.php",
        type: 'POST',
        data: {
            id : id,
            estado: estado,
            op: "estado_excel"
        },
        success: function(response){
            if(estado === 1){
                $(btn).removeClass("btn-danger");
                $(btn).addClass("btn-success");
                $(btn).find("i").removeClass("glyphicon-remove");
                $(btn).find("i").addClass("glyphicon-ok");
            }
            else{
                $(btn).removeClass("btn-success");
                $(btn).addClass("btn-danger");
                $(btn).find("i").removeClass("glyphicon-ok");
                $(btn).find("i").addClass("glyphicon-remove");
            }
        }
    });
});*/

$("#cbk_preguntas_ocultas").change(function () {
    deshabilitada = $(this).is(":checked");
    load_Preguntas(1);
    /*if ($(this).is(":checked")) {
        alert("true");
    }*/
});

$("#orderPregunta").click(function () {
    id = idEncuesta;
    $("#content").load('pregunta/orderPregunta.php', function () {
        order_Encuesta_id(id);
    });
});

default_pregunta = {
    initiateStartPageClick: false,
    totalPages: 1,
    visiblePages: 5,
    first: "&larrb;",
    prev: "&laquo;",
    next: "&raquo;",
    last: "&rarrb;"
};

function load_Preguntas(pag) {
    //alert(deshabilitada);
    var top = $("#cboTop").val();
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: "servidor/sPreguntas.php",
        async: false,
        data: {
            op: "list",
            top: top,
            deshabilitada: deshabilitada,
            idEncuesta: idEncuesta,
            pag: ((pag - 1) * top),
            categoria: $("#cboCategoria").val()
        },
        success: function (response) {
            $("#tb_listPreguntas").bootstrapTable("load", response.load);
            $("#pagination-demo").twbsPagination('destroy');

            $("#pagination-demo").twbsPagination($.extend({}, default_pregunta, {
                startPage: pag,
                totalPages: response.count,
                onPageClick: function (event, page) {
                    load_Preguntas(page);
                }
            }));
        }
    });
}

$("#cboCategoria").change(function () {
    load_Preguntas(1);
});

$("#cboTop").change(function () {
    load_Preguntas(1);
});

$("#newPregunta").click(function (e) {
    e.preventDefault();
    id = (idEncuesta);
    $("#content").load("pregunta/newPregunta.php", function () {
        NewEncuesta_id(id);
    });
});

/*$("#tb_listPreguntas").on("click", 'button[name="editPregunta"]', function () {
    
});*/

/*$("#tb_listPreguntas").on("click", 'button[name="deletePregunta"]', function () {
    id = ($(this).attr("dat-id"));
    $.post("servidor/sPreguntas.php",
            {
                op: "delete",
                id: id
            },
            function (data) {
                load_Preguntas(1);
            }
    );
});*/
/*$("#tb_listPreguntas").on("click", 'button[name="addPregunta"]', function () {
    id = ($(this).attr("dat-id"));
    $.post("servidor/sPreguntas.php",
            {
                op: "refresh",
                id: id
            },
            function (data) {
                load_Preguntas(1);
            }
    );
});*/






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