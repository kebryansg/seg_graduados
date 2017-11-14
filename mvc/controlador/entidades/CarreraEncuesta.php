<?php

class CarreraEncuesta {
    private $id;
    private $acceso;
    private $fecha;
    private $encuesta_id;
    private $titulo_id;
    private $estado;
    
    function __construct() {
        $this->id = 0;
    }
    function getId() {
        return $this->id;
    }

    function getAcceso() {
        return $this->acceso;
    }

    function getFecha() {
        return $this->fecha;
    }

    function getEncuesta_id() {
        return $this->encuesta_id;
    }

    function getTitulo_id() {
        return $this->titulo_id;
    }

    function getEstado() {
        return $this->estado;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setAcceso($acceso) {
        $this->acceso = $acceso;
    }

    function setFecha($fecha) {
        $this->fecha = $fecha;
    }

    function setEncuesta_id($encuesta_id) {
        $this->encuesta_id = $encuesta_id;
    }

    function setTitulo_id($titulo_id) {
        $this->titulo_id = $titulo_id;
    }

    function setEstado($estado) {
        $this->estado = $estado;
    }
}
