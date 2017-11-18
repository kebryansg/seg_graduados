<?php
    include_once '../mvc/modelo/CategoriaDaoImp.php';
?>
<div class="col-md-12">
    <div class="row">
        <div class="pull-left">
            <select class="selectpicker" data-width="80px" id="cboTop">
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
            </select>
            <button class="btn btn-success" id="orderPregunta">Ordenar Preguntas</button>
        </div>
        <div class="pull-right">
            <div class="form-inline">
                <select class="selectpicker form-control" data-width="300px" id="cboCategoria">
                    <option value="0">Seleccione Categoria</option>
                    <?php
                        $categorias = CategoriaDaoImp::listCategoria();
                        foreach ($categorias as $categoria) {
                            ?>
                    <option value="<?php echo $categoria->getId();  ?>"><?php echo $categoria->getDescripcion();  ?></option>
                            <?php
                        }
                        
                    ?>
                </select>
                <button class="btn btn-success" id="newPregunta">Nueva Pregunta</button>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <table data-toggle="table" data-width="300" id="tb_listPreguntas" data-unique-id="id">
            <thead>
                <tr>
                    <th  data-field="id">ID</th>
                    <th class="col-md-5" data-field="enunciado">Enunciado</th>
                    <th data-field="tipo">Tipo</th>
                    <th class="col-md-4" data-field="categoria">Categoria</th>
                    <th data-formatter='colAccion' data-events="event_colAccion" data-field="accion">Acción</th>
                </tr>
            </thead>
        </table>
    </div>
    <!--<br>-->
    <div class="row">
        <div class="pull-right">
            <ul id="pagination-demo" class="pagination"></ul>
        </div>
        <div class="pull-left">
            <div class="checkbox">
                <label><input type="checkbox" id="cbk_preguntas_ocultas" >Ver preguntas deshabilitadas</label>
            </div>
            
        </div>
    </div>
</div>
<script src="pregunta/js/listPreguntas.js" type="text/javascript" charset="utf-8" async defer></script>