<?php

include_once '../mvc/modelo/CategoriaDao.php';

class CategoriaDaoImp implements CategoriaDao
{

    public function edit($id)
    {
        echo $id;
    }

    public static function listCategoria()
    {
        $conn = (new C_MySQL())->open();
        $list = [];
        $sentencia = $conn->prepare("select * from categoria order by order_;");
        $sentencia->execute();
        $resultado = $sentencia->get_result();
        while ($row = $resultado->fetch_assoc()) {
            array_push($list, new Categoria($row["id"], $row["descripcion"]));
        }
        $resultado->free();
        $sentencia->close();
        $conn->close();
        return $list;
    }
    public static function _listCategoria($encuesta_titulo_id)
    {
        $conn = (new C_MySQL())->open();
        $list = [];
        $sentencia = $conn->prepare("select categoria.* from (select distinct categoria_id from encuesta_titulo e_t inner join encuestas e on e_t.Encuestas_id = e.id inner join preguntas p on p.Encuestas_id = e.id where e_t.id = $encuesta_titulo_id) categoria_e_t inner join categoria on categoria.id = categoria_id order by categoria.order_;");
        $sentencia->execute();
        $resultado = $sentencia->get_result();
        while ($row = $resultado->fetch_assoc()) {
            array_push($list, new Categoria($row["id"], $row["descripcion"]));
        }
        $resultado->free();
        $sentencia->close();
        $conn->close();
        return $list;
    }
}
