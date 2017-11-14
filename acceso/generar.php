<!DOCTYPE html>
<div class="row">
    <div class="container">
        <div class="panel panel-success">
            <!--<div class="panel-heading">
                <h3>Generar Acceso</h3>
            </div>-->
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-inline">
                            <div class="form-group ">
                                <label class="control-label ">Cédula:</label>
                                <input type="text" class="form-control" id="txt_Clave" maxlength="10">
                                <button class="btn btn-default" id="btn_GenerarClave">Consultar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div id="info-result" class="hidden">
                    <div class="row">
                        <div class="col-md-5">
                            <span class="h4">Resultados para <i id="cod-busqueda" class="negrita"></i></span>
                            <hr>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="h4 negrita">Cédula: &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <span class="h4" id="info_cedula"></span>
                            </div>
                            <div class="form-group">
                                <label class="h4 negrita">Nombre: &nbsp;&nbsp;&nbsp;</label>
                                <span class="h4" id="info_nombre"></span>
                            </div>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>
                    <div class="row">
                        <h4 class="text-center negrita">Detalles de accesos generados sobre encuestas</h4>
                        <div class="clearfix"></div>
                        <div class="col-md-12">
                            <table id="tb_detallesEncuestas" data-unique-id="num">
                                <thead>
                                    <tr>
                                        <!--<th class="col-md-1" data-field="num">Cod.</th>-->
                                        <th class="col-md-1" data-field="cod">Cod.</th>
                                        <th data-field="id_titulo">titulo</th>
                                        <th data-field="id_encuesta">encuesta</th>
                                        <th class="col-md-2" data-field="Facultad">Facultad</th>
                                        <th class="col-md-2" data-field="Carrera">Carrera</th>
                                        <th data-field="acceso">Clave - Acceso</th>
                                        <th class="col-md-2" data-field="nom_encuesta">Encuesta</th>
                                        <th data-align="center" data-field="fecha" data-events="event_accion" data-formatter="btn_accion">Acción</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="acceso/js/generar.js"></script>