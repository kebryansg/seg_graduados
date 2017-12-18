<!DOCTYPE html>
<?php
include_once '../mvc/modelo/CarreraDaoImp.php';
include_once '../mvc/modelo/EncuestaDaoImp.php';
//$conn = (new C_MySQL())->open();
?>
<form class="panel-body">
    <div class="col-md-4">
        <div class="form-group ">
            <label for="" class="control-label">Cédula</label>
            <input name="cedula" type="text" class="form-control" maxlength="10" required>
        </div>
    </div> 
    <div class="col-md-6">
        <div class="form-group ">
            <label for="" class="control-label">Nombres</label>
            <input name="nombres" type="text" class="form-control" maxlength="10" required>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-2">
        <div class="form-group ">
            <label for="" class="control-label">Nota Titulación</label>
            <input name="notaTitulacion" type="text" class="form-control" maxlength="10" required>
        </div>

    </div>
    <div class="col-md-2">
        <div class="form-group ">
            <label for="" class="control-label">Nota Pensum</label>
            <input name="notaPensum" type="text" class="form-control" maxlength="10" required>
        </div>
    </div>
    <!--<div class="clearfix"></div>-->
    <div class="col-md-3">
        <div class="form-group">
            <label for="f_pedido" class="control-label">Periodo Inicio: </label>
            <div class="input-group date day_date" data-link-field="periodoInicio">
                <input class="form-control" size="16" type="text" value="" readonly>
                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
            </div>
            <input name="periodoInicio" type="text" class="hidden" id="periodoInicio" required />
        </div>

    </div>
    <div class="col-md-3">
        <div class="form-group ">
            <label for="" class="control-label">Periodo Fin</label>
            <div class="input-group date day_date" data-link-field="periodoFin">
                <input class="form-control" size="16" type="text" value="" readonly>
                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
            </div>
            <input type="text" class="hidden" id="periodoFin" name="periodoFin" required />
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-md-12">
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
        <select class="selectpicker" id="cboCarrera_init" name="carrera" required>
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
    <div class="pull-right">
        <div class="form-inline">
            <button class="btn btn-danger" type="reset" ><i class="fa fa-reply"></i> Cancelar</button>
            <button class="btn btn-success" type="submit" ><i class="fa fa-save"></i> Guardar</button>
        </div>
    </div>

</form>

<script src="resources/datetimepicker/style_datetimepicker.js" type="text/javascript"></script>
<script src="acceso/js/adminAcceso.js" type="text/javascript"></script>