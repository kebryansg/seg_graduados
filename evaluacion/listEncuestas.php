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
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <table data-toggle="table" id="tb_listEncuestas">
            <thead>
                <tr>
                    <th data-field="id">Código</th>
                    <th data-field="nombre">Encuestas</th>
                    <th data-field="fecha">Fecha</th>
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
</div>

<script src="evaluacion/js/listEncuestas.js" type="text/javascript" charset="utf-8" async defer></script>
