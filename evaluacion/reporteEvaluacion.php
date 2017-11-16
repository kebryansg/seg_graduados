<!DOCTYPE html>
<?php

    include '../mvc/modelo/PreguntasDaoImp.php';
    include '../mvc/modelo/OpcionesDaoImp.php';
    
    $encuesta_id = 13;
    $listPreguntas = PreguntasDaoImp::_listPreguntasReporte($encuesta_id);
    $opciones = OpcionesDaoImp::_listEncuesta($encuesta_id);
    
    echo var_dump($opciones);
    
    echo var_dump(array_count_values($opciones));
    
    echo var_dump(array_count_values($opciones)["1345"]);
    
    
    foreach ($listPreguntas as $pregunta) {
        $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
        
        switch ($pregunta["tipo"]) {
            case "3": case "4":
                
                break;

        }
        
        echo $pregunta["enunciado"];
    }

?>