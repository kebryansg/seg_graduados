<!DOCTYPE html>
<div class="row">
    <div class="col-md-12">
        <div id="exTab2" class="card">
            <ul class="nav nav-tabs">
                <li  >
                    <a  href="#tabGenerar" data-toggle="tab">Generar</a>
                </li>
                <li class="active" >
                    <a href="#tabRegistro" data-toggle="tab">Registro</a>
                </li>
                <li >
                    <a href="#tabImportar" data-toggle="tab">Importar</a>
                </li>
            </ul>
            <div class="tab-content ">
                <div class="tab-pane " id="tabGenerar">
                    <?php
                        include '../mvc/view/acceso/tabGenerar.php';
                    ?>
                </div>
                <div class="tab-pane active" id="tabRegistro">
                    <?php
                        include '../mvc/view/acceso/tabRegistro.php';
                    ?>
                </div>
                <div class="tab-pane " id="tabImportar">
                    <?php
                        include '../mvc/view/acceso/tabImportar.php';
                    ?>
                </div>
            </div>
        </div>
    </div>
</div>