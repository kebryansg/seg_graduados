<?php

include_once "../mvc/modelo/CategoriaDaoImp.php";
include_once '../mvc/modelo/PreguntasDaoImp.php';
include_once '../mvc/modelo/OpcionesDaoImp.php';
include_once '../mvc/modelo/EncuestaDaoImp.php';
include_once '../mvc/modelo/RespuestasDaoImp.php';
include_once '../mvc/modelo/Preguntas_RespuestasDaoImp.php';

session_start();
$op = $_POST["op"];
$resultado = "";
$list_result = [];
switch ($op) {
    case "file":
        $list_encuesta = EncuestaDaoImp::list_file();
        foreach ($list_encuesta as $encuesta) {
            $list_preguntas = EncuestaDaoImp::list_Preguntas($encuesta["id"]);
            $list_pregunta = array();
            foreach ($list_preguntas as $pregunta) {
                $list_opciones = OpcionesDaoImp::list_($pregunta["id"]);
                $list_preg_resp = Preguntas_RespuestasDaoImp::_listPregunta($encuesta["id"], $pregunta["id"]);
                foreach ($list_preg_resp as $preg_resp) {
                    $list_preg_resp["respuestas"] = RespuestasDaoImp::_listRespuestas($preg_resp["id"]);
                }
                $pregunta["opciones"] = $list_opciones;
                $pregunta["preg_resp"] = $list_preg_resp;
                array_push($list_pregunta, $pregunta);
            }
            $encuesta["preguntas"] = $list_pregunta;
            array_push($list_result, $encuesta);
        }
        $_SESSION["file"] = ($list_result);
        break;
    case "list":
        $top = $_POST["top"];
        $pag = $_POST["pag"];
        $list = EncuestaDaoImp::_list($top, $pag);
        foreach ($list->getList() as $value) {
            $resultado = '{ "id" : ' . $value->getId() . ' , '
                    . '"fecha" : "' . $value->getFecha() . '" , '
                    . '"acceso" : "' . $value->getAcceso() . '" , '
                    . '"cedula" : "' . $value->getCedula() . '" , '
                    . '"accion" : "<button dat-id=\"' . $value->getId() . '\" name=\"edit_encuesta\" class=\"btn btn-success\"><i class=\"glyphicon glyphicon-edit\"></i></button>  <button dat-id=\"' . $value->getId() . '\" name=\"report_Encuesta\" class=\"btn btn-success\">R. Excel</button>" }'; //<i class=\"glyphicon glyphicon-align-justify\"></i>
            array_push($list_result, $resultado);
        }
        $resultado = '{ "total" : ' . ceil($list->getTotal() / $top) . ' , "load" : [' . join($list_result, ",") . '] }';
        break;
    case "save":
        $encuesta = new Encuesta();
        $encuesta->setId($_POST["id_encuesta"]);
        EncuestaDaoImp::save_evaluacion($encuesta);
        Preguntas_RespuestasDaoImp::delete($encuesta->getId());
        $preguntas_t1 = $_POST["preguntas_t1"];
        $preguntas_t2 = $_POST["preguntas_t2"];
        $preguntas_t3 = $_POST["preguntas_t3"];
        $preguntas_t4 = $_POST["preguntas_t4"];
        $preguntas_tb = $_POST["preguntas_tb"];
        if (true) {
            foreach ($preguntas_tb as $tbs) {
                $dt = json_decode($tbs);
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($encuesta->getId());
                $preguntas_respuestas->setPreguntas_id($dt->id_pregunta);
                $preguntas_respuestas->setOpcion(json_encode($dt->tb, TRUE));
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t3 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($encuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                $preguntas_respuestas->setOpcion($pregunta["opciones"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t4 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($encuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                $preguntas_respuestas->setOpcion($pregunta["opciones"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t1 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($encuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
                $respuesta = new Respuestas();
                $respuesta->setOpcion_id(0);
                $respuesta->setRespuesta($pregunta["valor"]);
                $respuesta->setPreguntas_respuestas_id($preguntas_respuestas->getId());
                RespuestasDaoImp::save($respuesta);
            }
            foreach ($preguntas_t2 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($encuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
                foreach ($pregunta["opciones"] as $opcion) {
                    $respuesta = new Respuestas();
                    $respuesta->setOpcion_id($opcion["id"]);
                    $respuesta->setRespuesta($opcion["valor"]);
                    $respuesta->setPreguntas_respuestas_id($preguntas_respuestas->getId());
                    RespuestasDaoImp::save($respuesta);
                }
            }
        }
        $resultado = '{"status":true}';
        break;
    case 'load_categoria':
        $list_Categoria = CategoriaDaoImp::listCategoria();
        foreach ($list_Categoria as $categoria) {
            $resultado = '{
                "id" : "' . $categoria->getId() . '",
                "descripcion" : "' . $categoria->getDescripcion() . '"
            }';
            array_push($list_result, $resultado);
        }
        $resultado = "[" . join($list_result, ",") . "]";
        break;
    case "load_preguntas":
        $list_preguntas = PreguntasDaoImp::list_($_POST["id"]);
        foreach ($list_preguntas as $value) {
            $pregunta = $value;
            $list_opciones = OpcionesDaoImp::list_($value["id"]);
            $list_preg_resp = Preguntas_RespuestasDaoImp::_listPregunta($_POST["id_encuesta"], $pregunta["id"]);
            foreach ($list_preg_resp as $preg_resp) {
                $list_preg_resp["respuestas"] = RespuestasDaoImp::_listRespuestas($preg_resp["id"]);
            }
            $pregunta["opciones"] = $list_opciones;
            $pregunta["preg_resp"] = $list_preg_resp;
            array_push($list_result, $pregunta);
        }
        $resultado = json_encode($list_result);
        break;
}
echo $resultado;