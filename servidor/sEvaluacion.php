<?php

include_once '../mvc/controlador/entidades/Encuesta_titulo.php';
include_once "../mvc/modelo/CategoriaDaoImp.php";
include_once '../mvc/modelo/PreguntasDaoImp.php';
include_once '../mvc/modelo/OpcionesDaoImp.php';
include_once '../mvc/modelo/EncuestaDaoImp.php';
include_once '../mvc/modelo/RespuestasDaoImp.php';
include_once '../mvc/modelo/Preguntas_RespuestasDaoImp.php';
include_once '../mvc/modelo/Encuesta_TituloDaoImp.php';
include_once '../mvc/modelo/CarreraEncuestaDaoImp.php';

session_start();
$op = $_POST["op"];
$resultado = "";
$list_result = [];
switch ($op) {
    case "facultad":
        $resultado = json_encode(EncuestaDaoImp::_facultad());
        break;
    case "carrera":
        $resultado = json_encode(EncuestaDaoImp::_carrera($_POST["facultad"]));
        break;
    case "refresh":
        EncuestaDaoImp::_refresh($_POST["id"]);
        break;
    case "duplicar":
        $id_origen = $_POST["id_origen"];
        $id_destino = $_POST["id_destino"];
        PreguntasDaoImp::_listDuplicar($id_origen, $id_destino);
        break;
    case "saveEncuesta":
        $encuesta = new Encuesta();
        $encuesta->setId($_POST["id"]);
        $encuesta->setNombre($_POST["nombre"]);
        $encuesta->setCarrera($_POST["carrera"]);
        EncuestaDaoImp::_save($encuesta);
        $resultado = "ok";
        break;
    case "file":
        $list_encuestas = EncuestaDaoImp::list_file($_POST["encuesta"]);
        foreach ($list_encuestas as $encuesta) {
            $encuesta["preguntas"] = EncuestaDaoImp::list_Preguntas($encuesta["encuestas"]);
            $list_preguntas = array();
            foreach ($encuesta["preguntas"] as $pregunta) {
                $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
                //$pregunta["respuestas"] = RespuestasDaoImp::_listRespuestas($encuesta["encuestas"]);
                $pregunta["respuestas"] = RespuestasDaoImp::_getRespuesta($pregunta["id"]);
                array_push($list_preguntas, $pregunta);
            }
            $encuesta["preguntas"] = $list_preguntas;
            array_push($list_result, $encuesta);
        }
        return $list_result;

        break;

    case "file_carrera":
        $carrera = $_POST["carrera"];

        break;
    case "list":
        /*$top = $_POST["top"];
        $pag = $_POST["pag"];
        $deshabilitada = $_POST["deshabilitada"];
        $carrera = $_POST["carrera"];*/
        
        $top = (isset($_POST["limit"])) ? $_POST["limit"] : 0;
        $pag = (isset($_POST["offset"])) ? $_POST["offset"] : 0;
        
        $params = array(
            "top" => $_POST["limit"],
            "pag" => $_POST["offset"],
            "deshabilitada" => $_POST["deshabilitada"],
            "carrera" => $_POST["carrera"]
        );

        //$list = EncuestaDaoImp::_list($top, $pag, $carrera, $deshabilitada); //$top
        $list = EncuestaDaoImp::_list($params);
        
        $resultado = json_encode($list);
        break;
    case "list_cbo":
        $params = array(
            "top" => 0,
            "pag" => 0,
            "deshabilitada" => "false",
            "carrera" => $_POST["carrera"]
        );
        
        $list = EncuestaDaoImp::_list($params);
        foreach ($list["rows"] as $value) {
            $resultado .= '<option value="' . $value["id"] . '">' . $value["nombre"] . '</option>';
        }
        break;
    case "save":
        $carreraEncuesta = new CarreraEncuesta();
        $carreraEncuesta->setId($_POST["id"]);
        $carreraEncuesta->setEstado($_POST["estado"]);
        CarreraEncuestaDaoImp::_update($carreraEncuesta);
        //Encuesta_TituloDaoImp::_update($encuesta);
        Preguntas_RespuestasDaoImp::delete($carreraEncuesta->getId());
        $preguntas_t1 = isset($_POST["preguntas_t1"]) ? $_POST["preguntas_t1"] : array();
        $preguntas_t2 = isset($_POST["preguntas_t2"]) ? $_POST["preguntas_t2"] : array();
        $preguntas_t3 = isset($_POST["preguntas_t3"]) ? $_POST["preguntas_t3"] : array();
        $preguntas_t4 = isset($_POST["preguntas_t4"]) ? $_POST["preguntas_t4"] : array();
        $preguntas_t5 = isset($_POST["preguntas_t5"]) ? $_POST["preguntas_t5"] : array();
        if (true) {
            foreach ($preguntas_t5 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($carreraEncuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                $preguntas_respuestas->setOpcion($pregunta["opciones"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t3 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($carreraEncuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                $preguntas_respuestas->setOpcion($pregunta["opciones"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t4 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($carreraEncuesta->getId());
                $preguntas_respuestas->setPreguntas_id($pregunta["id"]);
                $preguntas_respuestas->setOpcion($pregunta["opciones"]);
                Preguntas_RespuestasDaoImp::save($preguntas_respuestas);
            }
            foreach ($preguntas_t1 as $pregunta) {
                $preguntas_respuestas = new Preguntas_Respuestas();
                $preguntas_respuestas->setEncuesta_id($carreraEncuesta->getId());
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
                $preguntas_respuestas->setEncuesta_id($carreraEncuesta->getId());
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
        $list_Categoria = CategoriaDaoImp::_listCategoria($_POST["id_carrera_encuesta"]);
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
        $list_preguntas = PreguntasDaoImp::list_($_POST["id"], $_POST["id_encuesta"]);
        foreach ($list_preguntas as $value) {
            $pregunta = $value;
            $list_opciones = OpcionesDaoImp::list_($value["id"]);
            $list_preg_resp = Preguntas_RespuestasDaoImp::_listPregunta($_POST["id_encuesta"], $pregunta["id"]);
            foreach ($list_preg_resp as $preg_resp) {
                $list_preg_resp["respuestas"] = RespuestasDaoImp::_getRespuesta($preg_resp["id"]);
            }
            $pregunta["opciones"] = $list_opciones;
            $pregunta["preg_resp"] = $list_preg_resp;
            array_push($list_result, $pregunta);
        }
        $resultado = json_encode($list_result);
        break;
    case "delete":
        EncuestaDaoImp::_delete($_POST["id"]);
        $resultado = "ok";
        break;
}
echo $resultado;
