<?php

class Encuesta{
    private $id;
    private $fecha;
    private $acceso;
    private $cedula;
    function getAcceso() {
        return $this->acceso;
    }

    function getCedula() {
        return $this->cedula;
    }

    function setAcceso($acceso) {
        $this->acceso = $acceso;
    }

    function setCedula($cedula) {
        $this->cedula = $cedula;
    }

    
    function __construct() {
        $this->id = 0;
    }
    function getId() {
        return $this->id;
    }

    function getFecha() {
        return $this->fecha;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setFecha($fecha) {
        $this->fecha = $fecha;
    }



}