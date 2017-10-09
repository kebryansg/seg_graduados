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
                        if ($response_encuesta["estado"] == "2") {
                            $response["status"] = "no";
                            $response["mensaje"] = "Encuesta no se puede editar.";
                        } else if ($response_encuesta["estado"] == "1") {
                            if ($response_encuesta["encuesta_estado"] == "0") {
                                $response["status"] = "no";
                                $response["mensaje"] = "Encuesta se encuentra deshabilitada.";
                            } else {
                                $_SESSION["data_encuesta"] = $response_encuesta;
                                $_SESSION["rol"] = "eval";
                            }
                        }
                    } else {
                        $response["status"] = "no";
                        $response["mensaje"] = "Clave no valida";
                    }
                    break;
            }
        }
        echo json_encode($response);
        break;
}
