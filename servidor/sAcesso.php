<?php

include_once '../mvc/modelo/EncuestaDaoImp.php';
$op = $_POST["op"];
$resultado = "";
switch ($op) {
    case "getEstudiante":
        $estudiante = EstudianteDaoImp::_edit($_POST["id_estudiante"]);
        
        /*$clave = $_POST["clave"];
        $datos = array("clave" => md5($clave), "cedula" => $clave);
        if (EncuestaDaoImp::validarAcceso($datos)["status"]) {
            EncuestaDaoImp::acceso($datos);
            $resultado = md5($clave);
        } else {
            $resultado = "no";
        }*/
        break;
}
echo $resultado;
