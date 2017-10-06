<?php
class Estudiante{
    private $id;
    private $nombres;
    private $cedula;
    public function __construct() {
        $this->id = 0;
        $this->cedula =$this->nombres = "";
    }
    function getId() {
        return $this->id;
    }

    function getNombres() {
        return $this->nombres;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNombres($nombres) {
        $this->nombres = $nombres;
    }
    function getCedula() {
        return $this->cedula;
    }

    function setCedula($cedula) {
        $this->cedula = $cedula;
    }




}