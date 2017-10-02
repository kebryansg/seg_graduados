<?php
class Estudiante{
    private $id;
    private $nombres;
    public function __construct() {
        $this->id = 0;
        $this->nombres = "";
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


}