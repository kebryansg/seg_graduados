<?php

include_once 'ModelSQL.php';
class Configuracion extends ModelSQL {
    public $tabla;
    public $ID;
    public $Titulo;
    public $Descripcion;
    public $Objetivo;
    public $Imagen;

    function __construct() {
        $this->ID = 0;
        $this->tabla = "config";
    }
}
