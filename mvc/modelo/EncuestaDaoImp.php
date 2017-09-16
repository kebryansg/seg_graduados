<?php

include_once '../mvc/modelo/list_count.php';
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Encuesta.php';

class EncuestaDaoImp {

    public static function list_file() {
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = "select id , fecha from encuesta;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function _delete($id) {
        $conn = (new C_MySQL())->open();
        $sql = "select count(*) total from encuesta_titulo where Encuestas_id = $id;";
        $total = 0;
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $total = $row["total"];
            }
            $resultado->free();
            //$resultado->close();
        }
        if($total == 0){
            $sql = "update encuestas set estado = '0' where id = $id;";
            $conn->query($sql);
        }
        $conn->close();
    }

    public static function _save($encuesta) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($encuesta->getId() == 0) {
            $sql = "insert into encuestas(nombre,fecha,estado) values('" . $encuesta->getNombre() . "',curdate(),'1');";
        } else {
            $sql = "update encuestas set nombre = '" . $encuesta->getNombre() . "', fecha = curdate() where id = " . $encuesta->getId() . " ";
        }
        $conn->query($sql);
        $conn->close();
    }

    public static function _list($top, $limit) {
        $conn = (new C_MySQL())->open();
        $list_count = new list_count();
        $list = array();
        $pag = ($top > 0 ) ? "limit $top offset $limit" : "";
        $sql = "select SQL_CALC_FOUND_ROWS * from viewEncuesta $pag;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $list_count->setTotal(5);
                $encuesta = new Encuesta();
                $encuesta->setId($row["id"]);
                $encuesta->setFecha($row["fecha"]);
                $encuesta->setNombre($row["nombre"]);
                $encuesta->setCant_preg($row["total_preguntas"]);
                array_push($list, $encuesta);
            }
            $resultado->close();
        }
        $list_count->setList($list);
        $conn->close();
        return $list_count;
    }

    public static function list_Preguntas($id_encuesta) {
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = "select p.* from preguntas_respuestas p_r inner join  preguntas p on p.id = p_r.preguntas_id inner join categoria cat on cat.id = p.categoria_id where p_r.encuesta_id = $id_encuesta order by cat.order_;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function save_evaluacion($encuesta) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($encuesta->getId() == 0) {
            $sql = "insert into encuesta(fecha) values(current_date());";
        } else {
            $sql = "update encuesta set fecha = current_date() where id = " . $encuesta->getId();
        }
        if ($conn->query($sql)) {
            if ($encuesta->getId() == 0) {
                $encuesta->setId($conn->insert_id);
            }
        }
        $conn->close();
    }

    public static function validarAcceso($datos) {
        $conn = (new C_MySQL())->open();
        $response = [];
        $response["status"] = true;
        $sql = "select * from encuesta where cedula_clave = '" . $datos["cedula"] . "' or acceso_clave = '" . $datos["clave"] . "' ;";
        if ($result = $conn->query($sql)) {
            $row_cnt = $result->num_rows;
            if ($row_cnt > 0) {
                $response["status"] = false;
                $response["id_encuesta"] = $result->fetch_assoc()["id"];
            }
            $result->close();
        }
        $conn->close();
        return $response;
    }

    public static function acceso($datos) {
        $conn = (new C_MySQL())->open();
        $sql = "insert into encuesta(acceso_clave,cedula_clave) values('" . $datos["clave"] . "','" . $datos["cedula"] . "');";
        $conn->query($sql);
        $conn->close();
        return true;
    }

}
