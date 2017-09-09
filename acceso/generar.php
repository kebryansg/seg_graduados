<!DOCTYPE html>
<div class="row">
    <div class="container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3>Generar Acceso</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <p class="lead">
                        Ingresar la cédula para generar el código que servirá de acceso a la encuesta.
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <div class="form-inline">
                            <div class="form-group ">
                                <label class="control-label ">Cédula:</label>
                                <input type="text" class="form-control" id="txt_Clave" maxlength="10">
                                <button class="btn btn-success" id="btn_GenerarClave">Generar</button>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <div class="col-md-8">
                        <div class="panel panel-success">
                            <div class="panel-body">
                                <span class="h4">El código de <strong>Acceso</strong> es: <i id="cod-access" class="negrita"></i></span>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    
                </div>

            </div>
        </div>
    </div>
</div>
<script src="acceso/js/generar.js"></script>