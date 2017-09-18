<?php
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Preguntas.php';
include_once '../mvc/controlador/entidades/Opcion.php';
include_once '../mvc/controlador/entidades/Categoria.php';
interface PreguntasDao
{
    public static function save($pregunta);
    public static function _listDuplicar($id_origen, $id_destino);
    public static function edit($id);
    public function delete($id);
    public static function list_($categoria_id);
    public static function list_filter($top, $limit, $categoria_id,$encuesta_id);
}
