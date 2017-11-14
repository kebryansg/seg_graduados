<?php
include_once '../mvc/controlador/C_MySQL.php';
class CarreraDaoImp {
    public static function getCarreras(){
        $conn = (new C_MySQL())->open();
        $sql = "select * from carreras";
        $list = array();
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($list, $row);
            }
            $resultado->close();
        }
        $conn->close();
        return $list;
    }
    public static function _validarCarrera($IdCarrera){
        $conn = (new C_MySQL())->open();
        $sql = "select validarCarrera(". $IdCarrera .") as 'resultado'";
        $resultado = FALSE;
        if($result = $conn->query($sql)){
            while ($row = $result->fetch_assoc()) {
                $resultado = $row["resultado"] == "1";
            }
            $result->free();
        }
        $conn->close();
        return $resultado;
    }
}
