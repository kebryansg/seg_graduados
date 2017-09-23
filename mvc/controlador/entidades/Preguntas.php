<?php

class Preguntas {

    private $id;
    private $enunciado;
    private $tipo;
    private $categoria;
    private $encuesta;
    private $order_by;
    private $estado;
    private $estado_excel;

    function __construct() {
        $this->id = 0;
        $this->estado_excel = '1';
        $this->estado = '1';
        $this->order_by = 0;
    }
    
    function getOrder_by() {
        return $this->order_by;
    }

    function getEstado() {
        return $this->estado;
    }

    function getEstado_excel() {
        return $this->estado_excel;
    }

    function setOrder_by($order_by) {
        $this->order_by = $order_by;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }

    function setEstado_excel($estado_excel) {
        $this->estado_excel = $estado_excel;
    }

    
    function getEncuesta() {
        return $this->encuesta;
    }

    function setEncuesta($encuesta) {
        $this->encuesta = $encuesta;
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
