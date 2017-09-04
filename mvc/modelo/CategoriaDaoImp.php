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
}
