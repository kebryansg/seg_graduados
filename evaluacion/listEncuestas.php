<!DOCTYPE html>
<?php
include_once '../mvc/modelo/CarreraDaoImp.php';
include_once '../mvc/modelo/EncuestaDaoImp.php';
//$conn = (new C_MySQL())->open();
?>
<div class="col-md-12">
    <div id="toolbar" class="pull-left">
        <button class="btn btn-success" id="newEncuesta" data-toggle="modal" data-target="#modal_editEncuesta">Nueva Encuesta</button>
        <select class="selectpicker"  id="cboFacultad_init">
            <?php
            $facultads = EncuestaDaoImp::_facultad();
            //$carreras = CarreraDaoImp::getCarreras();
            foreach ($facultads as $facultad) {
                ?>
                <option value="<?php echo $facultad["id"] ?>"><?php echo $facultad["descripcion"] ?></option>
                <?php
            }
            ?>
        </select>
        <select class="selectpicker" id="cboCarrera_init">
            <?php
            //$facultads = EncuestaDaoImp::_facultad();    
            $carreras = EncuestaDaoImp::_carrera($facultads[0]["id"]);
            foreach ($carreras as $carrera) {
                ?>
                <option value="<?php echo $carrera["id"] ?>"><?php echo $carrera["descripcion"] ?></option>
                <?php
            }
            ?>
        </select>
    </div>
    <div class="row">
        <table 
            data-toggle="table" 
            id="tb_listEncuestas" 
            data-unique-id="id"
            data-toolbar="#toolbar"
            data-ajax="loadEncuesta"
            >
            <thead>
                <tr>
                    <th class="col-md-1" data-align="center" data-field="id">Código</th>
                    <th  data-field="nombre">Encuestas</th>
                    <th class="col-md-1" data-align="center" data-field="fecha">F. Creación - Modificación</th>
                    <th class="col-md-1" data-align="center" data-field="total_preguntas">Cant. Preguntas</th>
                    <th class="col-md-3" data-align="center" data-events="events_accion" data-formatter="btn_accion" data-field="accion">Acción</th>
                </tr>

            </thead>
        </table>
    </div>
    <div class="row">
        <!--<div class="pull-right">
            <ul id="pagination-demo" class="pagination"></ul>
        </div>-->
        <div class="pull-left">
            <div class="checkbox">
                <label><input type="checkbox" id="cbk_encuestas_ocultas" >Ver encuentas deshabilitadas</label>
            </div>
            
        </div>
    </div>
    <div class="row">
        <div id="modal_editEncuesta" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title">Nueva Encuesta</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="control-label">Nombre: </label>
                                    <input type="text" id="edit_nombre" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btn_canEncuesta" type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button name="save" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="modal_duplEncuesta" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title">Duplicar Encuesta</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="control-label">Nombre: </label>
                                    <input type="text" id="dupli_nombre" class="form-control" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Duplicar de: </label>
                                    <select name="" class="selectpicker form-control" title="Selec. Encuesta" id="cboEncuestas"></select>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btn_canDuplicar" type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button id="btn_newDuplicar" type="button" class="btn btn-success" >Duplicar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="modal_genEncuesta" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title">Generar Excel - Encuesta</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="" class="control-label">Faculta: </label>
                                    <select id="cbo_Facultad" class="selectpicker form-control">
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="" class="control-label">Carrera: </label>
                                    <select id="cbo_Carrera" class="selectpicker form-control"></select>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button id="btn_GenExcel" type="button" class="btn btn-success" >Generar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="evaluacion/js/listEncuestas.js" type="text/javascript" charset="utf-8" async defer></script>
