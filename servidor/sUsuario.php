<?php

include_once '../mvc/modelo/EncuestaDaoImp.php';
$op = $_POST["op"];
switch ($op) {
    case "acceso":
        $acceso = $_POST["acceso"];
        $response = [];
        $response["url"] = "content.php";
        $response["status"] = "ok";
        session_start();
        if (isset($acceso)) {
            switch ($acceso) {
                case "admin123":
                    $_SESSION["rol"] = "admin";
                    break;
                case "":
                    $response["status"] = "no";
                    break;
                default:
                    $response_encuesta = EncuestaDaoImp::validarAcceso($acceso);
                    if ($response_encuesta["status"]) {
                        $_SESSION["data_encuesta"] = $response_encuesta;
                        $_SESSION["rol"] = "eval";
                    } else {
                        $response["status"] = "no";
                    }
                    break;
            }
        }
        echo json_encode($response);
        break;
}
