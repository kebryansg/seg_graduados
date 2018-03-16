<?php

include_once '../mvc/modelo/list_count.php';
include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Encuesta.php';

class EncuestaDaoImp {

    public static function _facultad() {
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = "select * from facultad;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, (array('id' => $row["id"], 'descripcion' => $row["nombre"])));
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function _carrera($facultad) {
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = "select * from carreras where Facultad_id = $facultad;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, (array('id' => $row["id"], 'descripcion' => $row["nombre"])));
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function list_file($encuesta) {
        $conn = (new C_MySQL())->open();
        $list = array();
        /* $sql = "SELECT e.cedula, e.nombres ,f.nombre,c.nombre,e_t.id from estudiante e 
          inner join titulo t on t.Estudiante_id = e.id
          inner join carreras c on c.id = t.Carreras_id
          inner join facultad f on f.id = c.Facultad_id
          inner join encuesta_titulo e_t on e_t.Titulo_id = t.id and e_t.Encuestas_id = $encuesta and e_t.estado = 2;"; */

        $sql = "select * from viewfilecarrera where encuestas = $encuesta and estado = 2 ";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function _refresh($id) {
        $conn = (new C_MySQL())->open();
        $sql = "update encuestas set estado = '1' where id = '$id'";
        $conn->query($sql);
        $conn->close();
    }

    public static function _delete($id) {
        $conn = (new C_MySQL())->open();
        $sql = "select count(*) total from carreras_encuesta where Encuestas_id = $id;";
        $total = 0;
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $total = $row["total"];
            }
            $resultado->free();
            //$resultado->close();
        }
        if ($total == 0) {
            $sql = "update encuestas set estado = '0' where id = $id;";
            $conn->query($sql);
        }
        $conn->close();
    }

    public static function _save($encuesta) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($encuesta->getId() == 0) {
            $sql = "insert into encuestas(nombre,fecha,carrera_id,estado) values('" . $encuesta->getNombre() . "',curdate()," . $encuesta->getCarrera() . ",'1');";
        } else {
            $sql = "update encuestas set nombre = '" . $encuesta->getNombre() . "' where id = " . $encuesta->getId() . " ";
        }
        $conn->query($sql);
        $conn->close();
    }


    public static function _list($params) {
        $conn = (new C_MySQL())->open();
        $pag = ($params["top"] > 0 ) ? "limit " . $params['top'] . " offset " . $params['pag'] : "";
        $sql_2 = ($params['deshabilitada'] == "true") ? "" : "and estado = '1'";
        $carrera = ($params['carrera'] == "0")? "carrera like '%'": "carrera = " . $params['carrera'];
        
        $sql = "select SQL_CALC_FOUND_ROWS * from viewEncuesta where $carrera  $sql_2  $pag;";
        
        $dts = array(
            "rows" => C_MySQL::returnListAsoc($conn, $sql),
            "total" => C_MySQL::row_count($conn)
        );
        $conn->close();
        return $dts;
        
        
        
    }

    public static function list_Preguntas($id_encuesta) {
        $conn = (new C_MySQL())->open();
        $list = array();
        
        $sql = "SELECT * from viewpreguntaencuestascarrera where encuesta_carreras_id = $id_encuesta ORDER BY catOrder, pregOrder;";
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
        $response["status"] = FALSE;
        $sql = "CALL pcdValidarAcceso('$datos');";
        if ($result = $conn->query($sql)) {
            $row = $result->fetch_assoc();
            if ($row["status"] == "OK") {
                $response["status"] = true;
                $response["id"] = $row["id"];
                $response["encuesta"] = $row["Encuestas_id"];
                $response["encuesta_estado"] = $row["encuesta_estado"];
                $response["estado"] = $row["estado"];
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
