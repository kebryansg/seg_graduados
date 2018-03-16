<?php

final class C_MySQL {
    
    protected $mysqli;

    function __construct() {
        //$this->open();
    }
    public static function returnListAsoc($conn, $sql){
        $list = array();
        foreach ($conn->query($sql) as $row) {
            array_push($list, $row);
        }
        //$conn->close();
        return $list;
    }

    public function open() {
        $this->mysqli = new mysqli("localhost", "kbsg", "kbsg", "seg_graduados_v3");
        //Commit soft
        //$this->mysqli = new mysqli("localhost", "id2412119_root", "seg_graduados", "id2412119_seg_graduados");
        if ($this->mysqli->connect_errno) {
            echo "Fallo al conectar a MySQL: (" . $this->mysqli->connect_errno . ") " . $this->mysqli->connect_error;
        }
        $this->mysqli->set_charset("utf8");
        return $this->mysqli;
    }
    public static function row_count($conn){
        $total = -1;
        $sql = "select FOUND_ROWS() as total;";
        if($result = $conn->query($sql)) {
            while ($row = $result->fetch_assoc()) {
                $total = $row["total"];
            }
            $result->free();
        }
        return $total;
    }
}
