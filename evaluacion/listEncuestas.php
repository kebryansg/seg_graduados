<!DOCTYPE html>
<div class="col-md-12">
    <div class="row">
        <div class="pull-left">
            <select class="selectpicker" data-width="80px" id="cboTop">
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
            </select>
        </div>
        <div class="pull-right">
            <div class="form-inline">
                <select class="selectpicker" data-width="120px" id="cboFiltro">
                    <option value="0">Todas</option>
                    <option value="1">Facultad</option>
                    <option value="2">Carrera</option>
                </select>
                <button class="btn btn-default" id="btnGenerar">Generar Excel</button>
                <button class="btn btn-success" id="newEncuesta" data-toggle="modal" data-target="#modal_editEncuesta">Nueva Encuesta</button>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <table data-toggle="table" id="tb_listEncuestas" data-unique-id="id">
            <thead>
                <tr>
                    <th class="col-md-1" data-field="id">Código</th>
                    <th data-field="nombre">Encuestas</th>
                    <th class="col-md-1" data-field="fecha">F. Creación - Modificación</th>
                    <th class="col-md-1" data-field="cant">Cant. Preguntas</th>
                    <th class="col-md-3" data-field="accion">Acción</th>
                </tr>

            </thead>
        </table>
    </div>
    <div class="row">
        <div class="pull-right">
            <ul id="pagination-demo" class="pagination"></ul>
        </div>
    </div>
    <div class="row">
        <div id="modal_editEncuesta" class="modal fade" role="dialog" data-keyboard="false" data-backdrop="static">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title">Modificar Encuesta</h4>
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
                        <button id="btn_newEncuesta" type="button" class="btn btn-success" data-dismiss="modal">Modificar</button>
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
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-success" data-dismiss="modal">Duplicar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="evaluacion/js/listEncuestas.js" type="text/javascript" charset="utf-8" async defer></script>
