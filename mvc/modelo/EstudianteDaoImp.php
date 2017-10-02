<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Estudiante.php';

class EstudianteDaoImp {

    public static function _edit($id) {
        $estudiante = new Estudiante();
        $conn = (new C_MySQL())->open();
        $sql = "";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $estudiante->setId($row["id"]);
                $estudiante->setEnunciado($row["cedula"]);
                $estudiante->setTipo($row["nombres"]);
            }
            $resultado->free();
        }
        $conn->close();
        return $estudiante;
    }

}
