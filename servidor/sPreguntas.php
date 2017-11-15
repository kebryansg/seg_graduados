<?php

include_once '../mvc/modelo/list_count.php';
include_once '../mvc/modelo/PreguntasDaoImp.php';
include_once '../mvc/modelo/OpcionesDaoImp.php';
include_once '../mvc/modelo/CategoriaDaoImp.php';
$op = $_POST["op"];
$resultado = "";
$list_resultado = [];
switch ($op) {
    case "edit":
        $pregunta = PreguntasDaoImp::edit($_POST["id"]);
        $list_opciones = OpcionesDaoImp::list_($pregunta->getId());
        $resultado = '{
                "id" : "' . $pregunta->getId() . '",
                "enunciado" : "' . $pregunta->getEnunciado() . '",
                "tipo" : "' . $pregunta->getTipo() . '",
                "id_categoria" : "' . $pregunta->getCategoria()->getId() . '",
                "categoria" : "' . $pregunta->getCategoria()->getDescripcion() . '"
            }';
        $resultado = '{ "pregunta" :  ' . $resultado . ' , "opciones" : ' . json_encode($list_opciones) . ' }';
        break;
    case "delete":
        (new PreguntasDaoImp())->delete($_POST["id"]);
        break;
    case "refresh":
        PreguntasDaoImp::refresh($_POST["id"]);
        break;
    case "list":
        $top = $_POST["top"];
        $pag = $_POST["pag"];
        $id_categoria = $_POST["categoria"];
        $deshabilitada = $_POST["deshabilitada"];
        $id_encuesta = $_POST["idEncuesta"];
        $list = PreguntasDaoImp::list_filter($top, $pag, $id_categoria, $id_encuesta, $deshabilitada);
        foreach ($list->getList() as $pregunta) {
            $estado_excel = $pregunta->getEstado_excel() == "1"? "btn-success":"btn-danger";
            $estado_excel_2 = $pregunta->getEstado_excel() == "1"? "glyphicon-ok":"glyphicon-remove";
            $estado = ($pregunta->getEstado() == "1") ?
                    '<button dat-id=\"' . $pregunta->getId() . '\" name=\"deletePregunta\" data-toggle=\"tooltip\" title=\"Eliminar Pregunta\" class=\"btn btn-sm btn-danger\" ><i class=\"glyphicon glyphicon-trash\"></i></button>' : 
                    '<button dat-id=\"' . $pregunta->getId() . '\" name=\"addPregunta\" data-toggle=\"tooltip\" title=\"Reestablecer Pregunta\" class=\"btn btn-sm btn-success\" ><i class=\"glyphicon glyphicon-refresh\"></i></button>';
            $resultado = '{
                "id" : "' . $pregunta->getId() . '",
                "enunciado" : "' . $pregunta->getEnunciado() . '",
                "tipo" : "' . $pregunta->getTipo() . '",
                "categoria" : "' . $pregunta->getCategoria()->getDescripcion() . '",
                "accion": "<button data-toggle=\"tooltip\" title=\"Editar Pregunta\" dat-id=\"' . $pregunta->getId() . '\" name=\"editPregunta\" class=\"btn btn-sm btn-primary\" ><i class=\"glyphicon glyphicon-edit\"></i></button> '
                    . ' ' . $estado . ' '
                    . ' <button dat-id=\"' . $pregunta->getId() . '\" name=\"estado_excel\" data-toggle=\"tooltip\" title=\"Permitir excel\" class=\"btn btn-sm '. $estado_excel .'\" ><i class=\"glyphicon '. $estado_excel_2 .'\"></i></button>"}';
            array_push($list_resultado, $resultado);
        }
        $resultado = '{ "count": ' . ceil($list->getTotal() / $top) . ' , "load": [' . join($list_resultado, ",") . ']}';
        break;
    case "load_categoria":
        $list = (new CategoriaDaoImp())->listCategoria();
        $resultado = "<option value='0'>Seleccione Categoria</option>";
        foreach ($list as $categoria) {
            $resultado .= "<option value='" . $categoria->getId() . "'>" . $categoria->getDescripcion() . "</option>";
        }
        break;
    case "save":
        $pregunta = new Preguntas();
        $pregunta->setId($_POST["id"]);
        $pregunta->setEnunciado($_POST["enunciado"]);
        $pregunta->setTipo($_POST["tipo"]);
        $pregunta->setCategoria(new Categoria($_POST["categoria"], ''));
        $pregunta->setEncuesta($_POST["encuesta"]);
        PreguntasDaoImp::save($pregunta);
        if ($pregunta->getId() !== "0") {
            if (isset($_POST['opciones'])) {
                $opciones = $_POST['opciones'];
                OpcionesDaoImp::_DeletexPreguntas($pregunta->getId());
                foreach ($opciones as $value) {
                    $opcion = new Opcion();
                    $opcion->setId($value["id"]);
                    $opcion->setEnunciado($value["value"]);
                    $opcion->setPreguntas_id($pregunta->getId());
                    OpcionesDaoImp::save($opcion);
                }
            }
            /*if (isset($_POST["opciones_del"])) {
                $opciones = $_POST['opciones_del'];
                foreach ($opciones as $value) {
                    OpcionesDaoImp::delete($value);
                }
            }*/
            echo "Exito en todo";
        } else {
            echo "Salio mal";
        }
        break;
    case "list_preguntas":
        $list_preguntas = PreguntasDaoImp::list_($_POST["categoria"], $_POST["encuesta"]);
        foreach ($list_preguntas as $pregunta) {
            $resultado = '{
                "id" : "' . $pregunta["id"] . '",
                "enunciado" : "' . $pregunta["enunciado"] . '"
            }';
            array_push($list_resultado, $resultado);
        }
        $resultado = "[" . join($list_resultado, ",") . "]";
        break;
    case "save_order":
        if (isset($_POST["preguntas"])) {
            $preguntas = $_POST["preguntas"];
            foreach ($preguntas as $value) {
                PreguntasDaoImp::order_save($value);
            }
        }
        break;
    case "estado_excel":
        PreguntasDaoImp::estado_excel($_POST["id"],$_POST["estado"]);
        break;
        
}
echo $resultado;
