<!DOCTYPE html>
<div class="col-md-12">
    <div class="row">
        <div class="pull-right">
            <div class="form-inline">
                <select class="selectpicker form-control" data-width="300px" id="cboCategoria">
                </select>    
                <button class="btn btn-success" id="saveOrder">Guardar Orden</button>
            </div>

        </div>
    </div>
    <br>
    <div class="row">
        <ul class="list-group">
        </ul>
    </div>
    <div class="row hidden">
        <div id="option_li">
            <li class="list-group-item" style="padding-bottom: 22px;">
                <span></span> 
                <div class="right" style="float: right;">
                    <button class="btn btn-primary subir">Subir</button>
                    <button class="btn btn-danger bajar">Bajar</button>
                </div>
            </li>
        </div>
    </div>
</div>
<script src="pregunta/js/orderPregunta.js"></script>