<?php

final class C_MySQL {
    
    protected $mysqli;

    function __construct() {
        $this->open();
    }

    public function open() {
        $this->mysqli = new mysqli("localhost", "root", "", "seg_graduados_mod");
        //Commit soft
        //$this->mysqli = new mysqli("localhost", "id2412119_root", "seg_graduados", "id2412119_seg_graduados");
        if ($this->mysqli->connect_errno) {
            echo "Fallo al conectar a MySQL: (" . $this->mysqli->connect_errno . ") " . $this->mysqli->connect_error;
        }
        $this->mysqli->set_charset("utf8");
        return $this->mysqli;
    }
}
