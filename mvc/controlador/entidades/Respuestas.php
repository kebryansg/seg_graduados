<?php

class Respuestas {

    private $id;
    private $respuesta;
    private $opcion_id;
    private $preguntas_respuestas_id;

    function __construct() {
        $this->id = 0;
    }
    function getOpcion_id() {
        return $this->opcion_id;
    }

    function setOpcion_id($opcion_id) {
        $this->opcion_id = $opcion_id;
    }

    function getId() {
        return $this->id;
    }

    function getRespuesta() {
        return $this->respuesta;
    }

    function getPreguntas_respuestas_id() {
        return $this->preguntas_respuestas_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setRespuesta($respuesta) {
        $this->respuesta = $respuesta;
    }

    function setPreguntas_respuestas_id($preguntas_respuestas_id) {
        $this->preguntas_respuestas_id = $preguntas_respuestas_id;
    }

}
