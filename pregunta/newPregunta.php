<div class="col-md-12">
    <div class="row">
        <div class="pull-right">
            <!--<button class="btn btn-success" id="viewPregunta">Visualizar</button>-->
            <button class="btn btn-danger" id="cancelPregunta">Cancelar</button>
            <button class="btn btn-primary" id="savePregunta">Guardar</button>
        </div>
        <div class="clearfix"></div>
        <div class="form-group">
            <label class="control-label">Ingrese el enunciado:</label>
            <input type="text" class="form-control" id="txtEnunciado">
        </div>
        <div class="form-group">
            <label  class="control-label">Categoria:</label>
            <select class="form-control selectpicker" id="cboCategoria" >

            </select>
        </div>
        <div class="form-group">
            <label  class="control-label">Tipo de Pregunta:</label>
            <select class="form-control selectpicker" id="cboTipoPregunta" >
                <option value="1" div_content="ISimple" >Ingreso Simple</option>
                <option value="2" div_content="IMultiple">Ingreso Multiple</option>
                <option value="3" div_content="SMultiple">Seleccion Multiple</option>
                <option value="4" div_content="SUnica">Seleccion Unica</option>
                <option value="5" div_content="table">Tabla</option>
            </select>
        </div>
    </div>
    <div class="row" id="div_tipoPreguntas">
        <div id="ISimple">
            <div class="form-group">
                <input type="text" class="form-control">
            </div>
        </div>
        <div id="IMultiple">
            <div class="pull-right">
                <button class="btn btn-success" id="btnAgregar_IMultiple"> <span class="glyphicon glyphicon-plus"></span></button>
            </div>
            <div class="clearfix"></div>
            <br>
            <div id="content_IMultiple" class="limpiarOpciones">

            </div>
        </div>
        <div id="SMultiple">
            <div class="pull-right">
                <button class="btn btn-success" id="btnAgregar_SMultiple"> <span class="glyphicon glyphicon-plus"></span></button>
            </div>
            <div class="clearfix"></div>
            <br>
            <div id="content_SMultiple" class="limpiarOpciones">

            </div>
        </div>
        <div id="SUnica">
            <div class="pull-right">
                <button class="btn btn-success" id="btnAgregar_SUnica"> <span class="glyphicon glyphicon-plus"></span></button>
            </div>
            <div class="clearfix"></div>
            <br>
            <div id="content_SUnica" class="limpiarOpciones">

            </div>
        </div>
        <div id="table">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-inline">
                        <label for="" class="control-label">Nombre columna:</label>
                        <input type="text" class="form-control" id="col_add">
                        <select name="" class="form-control selectpicker" data-width="120" id="cboTipo">
                            <option value="input">Ingreso</option>
                            <option value="select">Combo</option>
                            <option value="check">Checkbox</option>
                        </select>
                        <!--<input type="text" >-->
                        <button id="btn_add" class="btn btn-success">Agregar</button>
                        <!--<button id="btn_colm" class="btn btn-success">Columnas</button>-->
                    </div>
                </div>
                <div id="op_select" class="hidden">
                    <div class="col-md-6">
                        <div class="form-inline">
                            <input type="text" class="form-control">
                            <button class="btn btn-success" id="btn_add_op"><i class="glyphicon glyphicon-arrow-right"></i></button>
                            <button class="btn btn-danger" id="btn_remove_op"><i class="glyphicon glyphicon-trash"></i></button>
                            <select name=""  class="form-control selectpicker" data-width="200" ></select>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-inline">
                        <label for="" class="control-label">Eliminar columna:</label>
                        <select class="selectpicker form-control" data-width="220" id="cboColumnas" title="Eliminar"></select>
                        <button id="btn_remove_column" class="btn btn-danger">Eliminar</button>
                    </div>

                </div>
            </div>
            <br>
            <!--<div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <button id="btn_new_row" class="btn btn-success"> <i class="glyphicon glyphicon-adjust"></i> </button>
                        <button id="btn_data" class="btn btn-success"> Datos</button>

                    </div>
                </div>
            </div>
            <br>-->
            <div class="row">
                <div class="col-md-12">
                    <table data-toggle="table" data-width="300" id="tb_listPreguntas">
                        <thead>
                            <tr>
                                <!--<th data-field="h1">h1</th>
                                <th data-field="h2">h2</th>-->
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="hidden" >
        <div id="opIMultiple">
            <div class="input-group form-group">
                <div class="input-group-btn">
                    <button class="btn btn-danger del_opcion"><span class="glyphicon glyphicon-trash"></span></button>
                </div>
                <span class="input-group-addon" id="basic-addon3">Etiqueta</span>
                <input type="text" class="form-control" aria-label="...">
            </div>
        </div>
        <div id="opSMultiple">
            <div class="input-group form-group">
                <div class="input-group-btn">
                    <button class="btn btn-danger del_opcion"><span class="glyphicon glyphicon-trash"></span></button>
                </div>
                <span class="input-group-addon"><input type="checkbox" aria-label="..."></span>
                <input type="text" class="form-control" aria-label="...">
            </div>
        </div>
        <div id="opSUnica">
            <div class="input-group form-group">
                <div class="input-group-btn">
                    <button class="btn btn-danger del_opcion"><span class="glyphicon glyphicon-trash"></span></button>
                </div>
                <span class="input-group-addon"><input type="radio" aria-label="..."></span>
                <input type="text" class="form-control" aria-label="...">
            </div>
        </div>
    </div>
</div>
<script src="pregunta/js/create_table.js" type="text/javascript" charset="utf-8" async defer></script>
<script src="pregunta/js/newPregunta.js" type="text/javascript" charset="utf-8" async defer></script>
