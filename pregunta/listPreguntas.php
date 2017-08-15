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
                </select>
                <button class="btn btn-success" id="newPregunta">Nueva Pregunta</button>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <table data-toggle="table" id="tb_listPreguntas" data-unique-id="id">
            <thead>
            <th data-field="id">ID</th>
            <th data-field="enunciado">Enunciado</th>
            <th data-field="tipo">Tipo</th>
            <th data-field="categoria">Categoria</th>
            <th data-field="accion">Acción</th>
            </thead>
        </table>
    </div>
    <br>
    <div class="row">
        <div class="pull-right">
            <ul class="pagination" id="pag_tb_listPreguntas">
                <li>
                    <a href="#" aria-label="Anterior">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li>
                    <a href="#" aria-label="Siguiente">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<script src="pregunta/js/listPreguntas.js" type="text/javascript" charset="utf-8" async defer></script>