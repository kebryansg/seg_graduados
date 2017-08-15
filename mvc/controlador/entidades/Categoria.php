<?php

/**
 *
 */
class Categoria {

    private $id;
    private $descripcion;
    private $preguntas;

    public function __construct($id, $descripcion) {
        $this->id = $id;
        $this->descripcion = $descripcion;
        $this->preguntas = array();
    }

    function getPreguntas() {
        return $this->preguntas;
    }

    function setPreguntas($preguntas) {
        $this->preguntas = $preguntas;
    }

    public function getId() {
        return $this->id;
    }

    public function getDescripcion() {
        return $this->descripcion;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setDescripcion($descripcion) {
        $this->descripcion = $descripcion;
    }

}
