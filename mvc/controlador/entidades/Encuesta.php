<?php

class Encuesta{
    private $id;
    private $fecha;
    private $nombre;
    private $cant_preg;
    
    function __construct() {
        $this->id = 0;
    }
    function getCant_preg() {
        return $this->cant_preg;
    }

    function setCant_preg($cant_preg) {
        $this->cant_preg = $cant_preg;
    }

        function getNombre() {
        return $this->nombre;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
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
