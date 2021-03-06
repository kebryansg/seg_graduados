<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Estudiante.php';

class EstudianteDaoImp {

    public static function _list($params) {
        $conn = (new C_MySQL())->open();
        $pag = ($params["top"] > 0 ) ? "limit " . $params['top'] . " offset " . $params['pag'] : "";
        $where = ($params["buscar"] != NULL) ? " where nombres like '%" . $params["buscar"] . "%' or cedula like '%". $params["buscar"] ."%' "   : "";
        
        $sql = "select SQL_CALC_FOUND_ROWS * from estudiante $where $pag;";

        $dts = array(
            "rows" => C_MySQL::returnListAsoc($conn, $sql),
            "total" => C_MySQL::row_count($conn)
        );
        $conn->close();
        return $dts;
    }

    public static function _genAcceso($id_titulo, $id_encuesta) {
        $conn = (new C_MySQL())->open();
        $acceso = md5($id_titulo . $id_encuesta . rand());
        $sql = "insert into carreras_encuesta(Encuestas_id,Titulo_id,fecha,acceso,estado) values($id_encuesta,$id_titulo,curdate(),'$acceso','1')";
        $conn->query($sql);
        $conn->close();
    }

    public static function _save($estudiante) {
        //$estudiante = new Estudiante();
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($estudiante->getId() == 0) {
            $sql = "insert into estudiante(nombres,cedula) values('" . $estudiante->getNombres() . "'," . $estudiante->getCedula() . ")";
        }
        if ($conn->query($sql) == TRUE) {
            $estudiante->setId($conn->insert_id);
        }
        $conn->close();
        return $estudiante;
    }

    public static function _validarEstudiante($estudiante) {
        $conn = (new C_MySQL())->open();
        $sql = "select validarEstudiante('" . $estudiante->getCedula() . "') as 'resultado'";
        if ($result = $conn->query($sql)) {
            while ($row = $result->fetch_assoc()) {
                $resultado = $row["resultado"];
            }
            $result->free();
        }
        $estudiante->setId($resultado);
        $conn->close();
        //return $resultado;
    }

    public static function _edit($cedula) {
        //$estudiante = new Estudiante();
        $conn = (new C_MySQL())->open();
        $sql = "select * from estudiante where cedula = '$cedula';";
        $estudiante = C_MySQL::returnListAsoc($conn, $sql);
        
        /*if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $estudiante->setId($row["id"]);
                $estudiante->setNombres($row["nombres"]);
                $estudiante->setCedula($row["cedula"]);
            }
            $resultado->free();
        }*/
        $conn->close();
        return $estudiante;
    }

    public static function _encuestas_titulo($idEstudiante) {
        $data = [];
        $conn = (new C_MySQL())->open();
        $sql = "SELECT c_e.id as 'cod', tb.*, e.nombre as 'nom_encuesta',e.id as 'id_encuesta',c_e.acceso,c_e.fecha
                from (
                SELECT f.nombre as 'Facultad',c.nombre as 'Carrera', t.id as 'id_titulo',  c.id as 'id_carrera' from estudiante es 
                inner join titulo t on t.Estudiante_id = es.id
                inner join carreras c on c.id = t.Carreras_id
                inner join facultad f on f.id = c.Facultad_id
                where es.id = $idEstudiante
                ) tb inner join encuestas e on e.carrera_id = tb.id_carrera and e.estado = 1
                LEFT join carreras_encuesta c_e on c_e.Encuestas_id = e.id and c_e.Titulo_id = tb.id_titulo
                ORDER BY c_e.fecha;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($data, $row);
            }
            $resultado->free();
        }
        $conn->close();
        return $data;
    }

}
