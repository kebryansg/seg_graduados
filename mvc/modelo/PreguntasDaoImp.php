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

    public static function save($pregunta) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($pregunta->getId() == "0") {
            $sql = "insert into preguntas(enunciado,tipo,categoria_id,estado,Encuestas_id,estado_excel,order_by,estado_tabulacion) values('" . ($pregunta->getEnunciado()) . "'," . ($pregunta->getTipo()) . "," . ($pregunta->getCategoria()->getId()) . ",'" . ($pregunta->getEstado()) . "'," . ($pregunta->getEncuesta()) . ",'" . ($pregunta->getEstado_excel()) . "'," . ($pregunta->getOrder_by()) . ",'0');";
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

    public static function _listDuplicar($id_origen, $id_destino) {
        $conn = (new C_MySQL())->open();
        $sql = "select * from preguntas where Encuestas_id = $id_origen;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $id_pregunta = $row["id"];
                $pregunta = new Preguntas();
                $pregunta->setEnunciado($row["enunciado"]);
                $pregunta->setTipo($row["tipo"]);
                $pregunta->setCategoria(new Categoria($row["categoria_id"], ""));
                $pregunta->setEstado($row["estado"]);
                $pregunta->setOrder_by($row["order_by"]);
                $pregunta->setEncuesta($id_destino);
                $pregunta->setEstado_excel($row["estado_excel"]);
                PreguntasDaoImp::save($pregunta);
                $sql2 = "select * from opciones where preguntas_id = $id_pregunta;";
                if ($resultado2 = $conn->query($sql2)) {
                    while ($row2 = $resultado2->fetch_assoc()) {
                        $opcion = new Opcion();
                        $opcion->setEnunciado($row2["enunciado"]);
                        $opcion->setPreguntas_id($pregunta->getId());
                        OpcionesDaoImp::save($opcion);
                    }
                    $resultado2->free();
                    $resultado2->close();
                }
            }
            $resultado->free();
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function list_($categoria_id,$encuesta_id) {
        $conn = (new C_MySQL())->open();
        $list = array();
        //$sql = ("select * from preguntas where (estado = '1' or estado = '2') and categoria_id = " . $categoria_id . " and Encuestas_id = $encuesta_id order by order_by");
        $sql = "select p.* from carreras_encuesta e_t "
                . "inner join encuestas e on e.id = e_t.Encuestas_id "
                . "inner join preguntas p on p.Encuestas_id = e.id  "
                . "where (p.estado = '1' or p.estado = '2') and categoria_id = $categoria_id and "
                . "e_t.id = $encuesta_id;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }
    
    public static function _listPreguntasReporte($encuesta_id){
        $conn = (new C_MySQL())->open();
        $list = array();
        $sql = "SELECT  p.id,p.enunciado,p.tipo from preguntas p 
			where 
			p.Encuestas_id = $encuesta_id 
			and 
			p.estado_tabulacion = '1';";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function list_filter($top, $limit, $categoria_id, $encuesta_id,$deshabilitada) {
        $conn = (new C_MySQL())->open();
        $list_count = new list_count();
        $list = array();
        $sql_1 = ($categoria_id == 0) ? "" : " and $categoria_id = cat.id ";
        $_sql_2 = ($deshabilitada == "true")? "" : "p.estado = '1' and ";
        $sql = "select SQL_CALC_FOUND_ROWS  p.* , cat.descripcion from preguntas p inner join categoria cat on cat.id = p.categoria_id  $sql_1  where $_sql_2 Encuestas_id = $encuesta_id limit $top offset $limit;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {

                $pregunta = new Preguntas();
                $pregunta->setId($row["id"]);
                $pregunta->setEnunciado($row["enunciado"]);
                $pregunta->setTipo($row["tipo"]);
                $pregunta->setEstado($row["estado"]);
                $pregunta->setEstado_excel($row["estado_excel"]);
                $pregunta->setEstado_tabulacion($row["estado_tabulacion"]);
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

    public static function refresh($id) {
        $conn = (new C_MySQL())->open();
        $sql = "update preguntas set estado = '1' where id = " . $id;
        $conn->query($sql);
        $conn->close();
    }

    public static function estado_excel($id,$estado) {
        $conn = (new C_MySQL())->open();
        $sql = "update preguntas set estado_excel = '$estado' where id = " . $id;
        $conn->query($sql);
        $conn->close();
    }
    public static function estado_tabulacion($id,$estado) {
        $conn = (new C_MySQL())->open();
        $sql = "update preguntas set estado_tabulacion = '$estado' where id = " . $id;
        $conn->query($sql);
        $conn->close();
    }

}
