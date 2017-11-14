<?php
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/CarreraEncuesta.php';
class CarreraEncuestaDaoImp {
    public static function _update($carreraEncuesta){
        $conn = (new C_MySQL())->open();
        $sql = "update carreras_encuesta set estado = '". $carreraEncuesta->getEstado() ."' where id = ". $carreraEncuesta->getId() ."  ;";
        $conn->query($sql);
        $conn->close();
    }
    
    
}
