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
                <button class="btn btn-default" id="btnGenerar">Generar</button>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <table data-toggle="table" id="tb_listEncuestas">
            <thead>
                <tr>
                    <th data-field="id">Código</th>
                    <th data-field="fecha">Fecha</th>
                    <th data-field="cedula">Cédula</th>
                    <th data-field="acceso">Acceso</th>
                    <!--<th data-field="accion">Acción</th>-->
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