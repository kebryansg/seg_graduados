<?php

class Preguntas {

    private $id;
    private $enunciado;
    private $tipo;
    private $categoria;

    function __construct() {
        $this->id = 0;
    }

    function getId() {
        return $this->id;
    }

    function getEnunciado() {
        return $this->enunciado;
    }

    function getTipo() {
        return $this->tipo;
    }

    function getCategoria() {
        return $this->categoria;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setEnunciado($enunciado) {
        $this->enunciado = $enunciado;
    }

    function setTipo($tipo) {
        $this->tipo = $tipo;
    }

    function setCategoria($categoria) {
        $this->categoria = $categoria;
    }

}
