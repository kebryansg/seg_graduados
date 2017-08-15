<?php

class Preguntas_Respuestas {

    private $id;
    private $opcion;
    private $encuesta_id;
    private $preguntas_id;

    function __construct() {
        $this->id = 0;
        $this->opcion = "";
    }

    function getId() {
        return $this->id;
    }

    function getOpcion() {
        return $this->opcion;
    }

    function getEncuesta_id() {
        return $this->encuesta_id;
    }

    function getPreguntas_id() {
        return $this->preguntas_id;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setOpcion($opcion) {
        $this->opcion = $opcion;
    }

    function setEncuesta_id($encuesta_id) {
        $this->encuesta_id = $encuesta_id;
    }

    function setPreguntas_id($preguntas_id) {
        $this->preguntas_id = $preguntas_id;
    }

}
