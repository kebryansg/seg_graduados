<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/Controlador/Entidades/Configuracion.php';
class ConfigDaoImp {
    public static function save($configuracion) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($configuracion->ID == 0) {
            $sql = $configuracion->Insert();
        } else {
            $sql = $configuracion->Update();
        }
        if ($conn->query($sql)) {
            if ($configuracion->ID == 0) {
                $configuracion->ID = $conn->insert_id;
            }
        }
        $conn->close();
    }
    public static function _list(){
        $conn = (new C_MySQL())->open();
        //where estado = 'ACT'
        $sql = "select * from config;";

        $list = C_MySQL::returnListAsoc($conn, $sql);
        $conn->close();
        return $list;
    }
}
