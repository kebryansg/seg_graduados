<?php
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Preguntas.php';
interface PreguntasDao
{
    public function save($pregunta);
    public static function edit($id);
    public function delete($id);
    public static function list_($categoria_id);
    public static function list_filter($top, $limit, $categoria_id);
}
