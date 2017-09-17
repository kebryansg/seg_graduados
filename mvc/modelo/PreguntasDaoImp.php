<?php

include_once '../mvc/modelo/PreguntasDao.php';

class PreguntasDaoImp implements PreguntasDao {

    public function delete($id) {
        $conn = (new C_MySQL())->open();
        $sql = "update preguntas set estado = '0' where id = " . $id;
        $conn->query($sql);
        $conn->close();
    }

    public static function edit($id) {
        $conn = (new C_MySQL())->open();
        $pregunta = new Preguntas();
        $sql = "select p.* , cat.descripcion from preguntas p inner join categoria cat on cat.id = p.categoria_id where p.id = " . $id;
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $pregunta->setId($row["id"]);
                $pregunta->setEnunciado($row["enunciado"]);
                $pregunta->setTipo($row["tipo"]);
                $pregunta->setCategoria(new Categoria($row["categoria_id"], $row["descripcion"]));
            }
            $resultado->free();
        }
        $conn->close();
        return $pregunta;
    }

    public function save($pregunta) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($pregunta->getId() == "0") {
            $sql = "insert into preguntas(enunciado,tipo,categoria_id,estado,Encuestas_id,estado_excel) values('" . ($pregunta->getEnunciado()) . "'," . ($pregunta->getTipo()) . "," . ($pregunta->getCategoria()->getId()) . ",'1',". ($pregunta->getEncuesta()) .",'1');";
        } else {
            $sql = "update preguntas set enunciado = '" . $pregunta->getEnunciado() . "', tipo = " . $pregunta->getTipo() . ", categoria_id = " . $pregunta->getCategoria()->getId() . " where id = " . $pregunta->getId();
        }
        if ($conn->query($sql)) {
            if ($pregunta->getId() == "0") {
                $pregunta->setId($conn->insert_id);
            }
        }
        $conn->close();
    }

    public static function order_save($pregunta) {
        $conn = (new C_MySQL())->open();
        $sql = "update preguntas set order_by = " . $pregunta['order'] . " where id = " . $pregunta["id"];
        $conn->query($sql);
        $conn->close();
    }

    public static function list_($categoria_id) {
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = ("select * from preguntas where (estado = '1' or estado = '2') and categoria_id = " . $categoria_id . " order by order_by");
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                /* $pregunta = new Preguntas();
                  $pregunta->setId($row["id"]);
                  $pregunta->setEnunciado($row["enunciado"]);
                  $pregunta->setTipo($row["tipo"]);
                  $pregunta->setCategoria(new Categoria($row["categoria_id"], "")); */
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function list_filter($top, $limit, $categoria_id, $encuesta_id) {
        $conn = (new C_MySQL())->open();
        $list_count = new list_count();
        $list = array();
        $sql_1 = ($categoria_id == 0) ? "" : " and $categoria_id = cat.id ";
        $sql = "select SQL_CALC_FOUND_ROWS  p.* , cat.descripcion from preguntas p inner join categoria cat on cat.id = p.categoria_id  $sql_1  where p.estado = '1' and Encuestas_id = $encuesta_id limit $top offset $limit;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {

                $pregunta = new Preguntas();
                $pregunta->setId($row["id"]);
                $pregunta->setEnunciado($row["enunciado"]);
                $pregunta->setTipo($row["tipo"]);
                $pregunta->setCategoria(new Categoria($row["categoria_id"], $row["descripcion"]));
                array_push($list, $pregunta);
            }
            $resultado->close();
        }
        $list_count->setList($list);
        $list_count->setTotal(C_MySQL::row_count($conn));
        $conn->close();
        return $list_count;
    }

}
