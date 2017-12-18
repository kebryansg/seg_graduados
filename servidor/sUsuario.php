<?php

include_once '../mvc/modelo/EncuestaDaoImp.php';
require_once '../mvc/modelo/EstudianteDaoImp.php';
require_once '../mvc/modelo/TituloDaoImp.php';
$op = $_POST["op"];
switch ($op) {
    case "insertUsuario":
        $datos = json_decode($_POST["datos"], true);
        $estudiante = new Estudiante();
        $estudiante->setCedula($datos["cedula"]);
        $estudiante->setNombres($datos["nombres"]);
        EstudianteDaoImp::_validarEstudiante($estudiante);
        if ($estudiante->getId() == 0) {
            EstudianteDaoImp::_save($estudiante);
        }

        if ($estudiante->getId() > 0) {
            $titulo = new Titulo();
            $titulo->setEstudiante($estudiante->getId());
            $titulo->setCarrera($datos["carrera"]);
            $titulo->setNotaPensum($datos["notaPensum"]);
            $titulo->setNotaTitulacion($datos["notaTitulacion"]);
            $titulo->setPeriodoInicio($datos["periodoInicio"]);
            $titulo->setPeriodoFin($datos["periodoFin"]);
            $promedio = (floatval($titulo->getNotaPensum()) + floatval($titulo->getNotaTitulacion())) / 2;
            $titulo->setPromedio($promedio);
            if (!TituloDaoImp::_validarTitulo($titulo->getCarrera(), $estudiante->getId())) {
                TituloDaoImp::_save($titulo);
                if ($titulo->getId() > 0) {
                    $response = array(
                        'status' => True,
                        'msj' => "Registro Exitoso.");
                } else {
                    $response = array(
                        'status' => False,
                        'msj' => "Problema registrando el Titulo.");
                }
            }else{
                $response = array(
                        'status' => False,
                        'msj' => "Error \nTitulo ya ingresado.");
            }
            //TituloDaoImp::_save($titulo);
        } else {
            $response = array(
                'status' => False,
                'msj' => "Cédula ya ingresada.");
        }

        echo json_encode($response);
        break;
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
