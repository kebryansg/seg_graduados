<div class="col-md-12">

    <form class="panel panel-default">
        <div class="panel-heading">
            Configuraciones
            <div class="pull-right">
                <div class="form-inline">
                    <button class="btn btn-sm btn-danger" type="button" cancelar>Cancelar</button>
                    <button class="btn btn-sm btn-success" type="button" save>Guardar</button>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="panel-body">
            <input type="text" class="form-control hidden" name="id">
            <div class="form-group">
                <label for="" class="control-label">Título</label>
                <input type="text" class="form-control" name="titulo" required>
            </div>
            <div class="form-group">
                <label for="" class="control-label">Descripción</label>
                <textarea type="text" class="form-control" name="descripcion" required></textarea>
            </div>
            <div class="form-group">
                <label for="" class="control-label">Objetivo</label>
                <textarea type="text" class="form-control" name="objetivo" required></textarea>
            </div>
        </div>
    </form>


</div>

<script src="configuracion/js/configuracion.js" type="text/javascript" charset="utf-8" async defer></script>