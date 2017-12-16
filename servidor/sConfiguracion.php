<?php

include_once '../mvc/modelo/ConfigDaoImp.php';

include_once '../mvc/Controlador/JsonMapper.php';

$op = $_POST["op"];
$accion = $_POST["accion"];
$mapper = new JsonMapper();
$resultado = "";
switch ($accion) {
    case "save":
        $json = json_decode($_POST["datos"]);
        switch ($op) {
            case "configuracion":
                $configuracion = $mapper->map($json, new Configuracion());
                ConfigDaoImp::save($configuracion);
                break;
        }
        break;
    case "list":
        switch ($op) {
            case "configuracion":
                $resultado = json_encode(ConfigDaoImp::_list()[0]);
                break;
        }
        break;
}
echo $resultado;
