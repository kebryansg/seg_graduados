<?php
class Opcion{
    private $id;
    private $enunciado;
    private $preguntas_id;

    function __construct() {
        $this->id = 0;
    }
    
    function getId() {
        return $this->id;
    }

    function getEnunciado() {
        return $this->enunciado;
    }
    function setId($id) {
        $this->id = $id;
    }

    function setEnunciado($enunciado) {
        $this->enunciado = $enunciado;
    }

    function setPreguntas_id($preguntas_id) {
        $this->preguntas_id = $preguntas_id;
    }
    
    function getPreguntas_id() {
        return $this->preguntas_id;
    }
}