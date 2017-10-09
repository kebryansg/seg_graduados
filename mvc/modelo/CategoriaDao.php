<?php
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Categoria.php';
interface CategoriaDao{
	public function edit($id);
	public static function listCategoria();
        public static function _listCategoria($encuesta_titulo_id);
}
 ?>
