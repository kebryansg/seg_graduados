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
        if ($estudiante->getId() !== 0) {
            $resultado = '{"id": "' . $estudiante->getId() . '" ,"nombres" : "' . strtoupper($estudiante->getNombres()) . '","cedula" : "' . $estudiante->getCedula() . '"}';
            $data = EstudianteDaoImp::_encuestas_titulo($estudiante->getId());
        }
        $resultado = '{ "status" : ' . !($estudiante->getId() === 0) . ', "estudiante" : ' . $resultado . ' , "data" : ' . json_encode($data) . ' }';
        break;
}
echo $resultado;
