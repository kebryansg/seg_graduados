<?php

include_once '../mvc/controlador/entidades/Preguntas_Respuestas.php';

class Preguntas_RespuestasDaoImp {

    public static function _listPregunta($encuesta_titulo_id, $pregunta_id) {
        $conn = (new C_MySQL())->open();
        $sql = "select p_r.* from preguntas_respuestas p_r where p_r.encuesta_carreras_id = $encuesta_titulo_id and p_r.pregunta_id = $pregunta_id ;";
        $list = array();
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }

    public static function delete($encuesta_id) {
        $conn = (new C_MySQL())->open();
        $sql = "delete from preguntas_respuestas where encuesta_carreras_id = '$encuesta_id';";
        if ($conn->query($sql)) {
            
        }
        $conn->close();
    }

    public static function save($preguntas_respuestas) {
        $conn = (new C_MySQL())->open();
        $sql = "";
        //$preguntas_respuestas = new Preguntas_Respuestas();
        if ($preguntas_respuestas->getId() == 0) {
            $sql = "insert into preguntas_respuestas(opcion,encuesta_carreras_id,pregunta_id) values('" . $preguntas_respuestas->getOpcion() . "'," . $preguntas_respuestas->getEncuesta_id() . "," . $preguntas_respuestas->getPreguntas_id() . ");";
        } else {
            //$sql = "update preguntas set enunciado = '". $pregunta->getEnunciado() ."', tipo = ". $pregunta->getTipo() .", categoria_id = ". $pregunta->getCategoria()->getId() ." where id = ". $pregunta->getId();
        }
        if ($conn->query($sql)) {
            if ($preguntas_respuestas->getId() == 0) {
                $preguntas_respuestas->setId($conn->insert_id);
            }
        }
        $conn->close();
    }

}
