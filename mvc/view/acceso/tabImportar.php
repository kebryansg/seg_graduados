<!DOCTYPE html>
<link href="resources/file_input/fileinput.min.css" rel="stylesheet" />

<div class="row">
    <div class="col-md-12">
        <br>
        <div class="pull-right">
            <button id="btnGenerarFormato" class="btn btn-danger btn-sm">Descargar Formato de Ingreso de Estudiantes</button>
        </div>
        <div class="clearfix"></div>
        <br>
        
        <!--<input type="file" class="btn btn-success" value="Cargar Excel">-->
        <div class="file-loading">
            <input id="excel_file" name="excel_file" type="file">
        </div>
    </div>
</div>

<script src="resources/file_input/fileinput.min.js" type="text/javascript"></script>
<script src="resources/file_input/locales/es.js" type="text/javascript"></script>
<script>
    
    $("#btnGenerarFormato").click(function() {
        url = "servidor/sExcel.php?op=formato";
        window.open(url, '_blank');
    });

    $("#excel_file").fileinput({
        uploadUrl: "servidor/sExcel.php?op=ingresar",
        language: 'es',
        allowedFileExtensions: ['xlsx']
        
    }).on('fileuploaded', function(e, params) {
        console.log(params.response);
    });

</script>
