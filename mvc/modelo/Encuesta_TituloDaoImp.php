<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Encuesta_titulo.php';
class Encuesta_TituloDaoImp {

    public static function _update($encuesta_titulo){
        $conn = (new C_MySQL())->open();
        $sql = "update encuesta_titulo set estado = '". $encuesta_titulo->getEstado() ."' where id = ". $encuesta_titulo->getId() ."  ;";
        $conn->query($sql);
        $conn->close();
    }

}