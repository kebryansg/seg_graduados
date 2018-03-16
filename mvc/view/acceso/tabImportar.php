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
<br>
<div class="row">
    <div class="col-md-12">
        <table id="RowProblems">
            <thead>
                <tr>
                    <th data-field="fila">F. Excel</th>
                    <th data-field="codCarrera">Carrera</th>
                    <th data-field="cedula">Cédula</th>
                    <th data-field="nombre">Estudiante</th>
                    <th data-field="periodoInicio" data-align="center">P. Inicio</th>
                    <th data-field="periodoFin" data-align="center">P. Fin</th>
                    <th data-field="titulacion" data-align="center">N. Titulación</th>
                    <th data-field="pensum" data-align="center">N. Pensum</th>
                    <th data-field="estado">Estado</th>
                </tr>
            </thead>
        </table>
    </div>
</div>

<script src="resources/file_input/fileinput.min.js" type="text/javascript"></script>
<script src="resources/file_input/locales/es.js" type="text/javascript"></script>
<script>

    $("#RowProblems").bootstrapTable();

    $("#btnGenerarFormato").click(function () {
        url = "servidor/sExcel.php?op=formato";
        window.open(url, '_blank');
    });

    $("#excel_file").fileinput({
        uploadUrl: "servidor/sExcel.php?op=ingresar",
        language: 'es',
        allowedFileExtensions: ['xlsx']

    }).on('fileuploaded', function(event, data, previewId, index) {
        console.log(data.response);
        if (data.response.row.length > 0) {
            $("#RowProblems").bootstrapTable("load", data.response.row);
            
        }
        //console.log(params);

    });

</script>
