<?php

include_once '../mvc/modelo/OpcionesDao.php';

class OpcionesDaoImp implements OpcionesDao {

    public static function save($opcion) {
        $conn = (new C_MySQL())->open();
        if ($opcion->getId() == "0") {
            $sql = "insert into opciones(enunciado,preguntas_id) values('" . ($opcion->getEnunciado()) . "'," . ($opcion->getPreguntas_id()) . ");";
        } else {
            $sql = "update opciones set enunciado = '".$opcion->getEnunciado()."', preguntas_id = " . ($opcion->getPreguntas_id()) . " where id = ".$opcion->getId()." ;";
        }
        if ($conn->query($sql)) {
            if ($opcion->getId() == "0") {
                $opcion->setId($conn->insert_id);
            }
        }
        $conn->close();
    }

    public static function delete($id_opcion) {
        $conn = (new C_MySQL())->open();
        $sql = "delete from opciones where id = $id_opcion;";
        $conn->query($sql);
        $conn->close();
    }

    public static function list_($pregunta) {
        $conn = (new C_MySQL())->open();
        $list = [];
        $sql = "select * from opciones where preguntas_id = " . $pregunta . ";";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $opcion = new Opcion();
                $opcion->setEnunciado($row["enunciado"]);
                $opcion->setId($row["id"]);
                $opcion->setPreguntas_id($row["preguntas_id"]);
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

}
