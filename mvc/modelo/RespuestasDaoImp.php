<?php
include_once '../mvc/controlador/entidades/Respuestas.php';

class RespuestasDaoImp{
    
    public static function _listRespuestas($id_preg_resp){
        $conn = (new C_MySQL())->open();
        $sql = "SELECT p_r.id ,p_r.opcion from preguntas_respuestas p_r
                inner join preguntas p on p.id = p_r.pregunta_id and p.estado_excel = 1
                where p_r.encuesta_titulo_id = 6;";
        $list = array();
        if($resultado = $conn->query($sql)){
            while ($row = $resultado->fetch_assoc()) {
                array_push($list,$row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }
    public static function _getRespuesta($idPregunta){
        $conn = (new C_MySQL())->open();
        $sql = "SELECT p_r.id ,p_r.opcion from preguntas_respuestas p_r
                where p_r.pregunta_id = $idPregunta";
                /*inner join preguntas p on p.id = p_r.pregunta_id and p.estado_excel = 1
                where p_r.encuesta_titulo_id = 6;";*/
        $list = array();
        if($resultado = $conn->query($sql)){
            while ($row = $resultado->fetch_assoc()) {
                array_push($list,$row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }
    
    public static function save($respuesta){
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($respuesta->getId() == 0) {
            $sql = "insert into respuestas(respuesta,preguntas_respuestas_id,opciones_id) values('". $respuesta->getRespuesta() ."',". $respuesta->getPreguntas_respuestas_id() .",".$respuesta->getOpcion_id().");";
        } else {
            //$sql = "update preguntas set enunciado = '". $pregunta->getEnunciado() ."', tipo = ". $pregunta->getTipo() .", categoria_id = ". $pregunta->getCategoria()->getId() ." where id = ". $pregunta->getId();
        }
        if ($conn->query($sql)) {
            if ($respuesta->getId() == 0) {
                $respuesta->setId($conn->insert_id);
            }
        }
        $conn->close();
    }
}