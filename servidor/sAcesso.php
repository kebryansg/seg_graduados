<?php

include_once '../mvc/modelo/EstudianteDaoImp.php';
$op = $_POST["op"];
$resultado = "";
switch ($op) {
    case "genAcceso":
        $id_titulo = $_POST["id_titulo"];
        $id_encuesta = $_POST["id_encuesta"];
        EstudianteDaoImp::_genAcceso($id_titulo, $id_encuesta);

        break;
    case "getEstudiante":
        $estudiante = EstudianteDaoImp::_edit($_POST["id_estudiante"]);
        if (count($estudiante) == 1) {
            $resultado = ($estudiante[0]);
            $data = EstudianteDaoImp::_encuestas_titulo($estudiante[0]["id"]);
            $resultado = json_encode(array(
                "status" => TRUE,
                "estudiante" => $resultado,
                "data" => $data
            ));
        }else{
            $resultado = json_encode(array(
                "status" => FALSE
            ));
        }
        break;
}
echo $resultado;
