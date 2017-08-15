<?php
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Opcion.php';
interface OpcionesDao{
    public function save($opcion);
    public static function list_($pregunta);
}