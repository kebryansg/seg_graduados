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
    public static function _listCategoria($carrera_encuesta)
    {
        $conn = (new C_MySQL())->open();
        $list = [];
        $sentencia = $conn->prepare("select categoria.* "
                . "from categoria "
                . "where categoria.id  in "
                        . "(select categoria_id from carreras_encuesta c_e inner join encuestas e on c_e.Encuestas_id = e.id inner join preguntas p on p.Encuestas_id = e.id where c_e.id = $carrera_encuesta) "
                . "order by categoria.order_;");
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
