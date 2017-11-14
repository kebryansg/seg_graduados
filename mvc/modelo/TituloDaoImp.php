<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Titulo.php';

class TituloDaoImp {
    public static function _save($titulo){
        //$titulo = new Titulo();
        $conn = (new C_MySQL())->open();
        $sql = "";
        if($titulo->getId() == 0){
            $sql = "insert into titulo"
                . "("
                . "nota_titulacion,"
                . "nota_pensum,"
                . "promedio,"
                . "periodo_inicio,"
                . "periodo_fin,"
                . "Estudiante_id,"
                . "Carreras_id"
                . ") "
                . "values"
                . "(". $titulo->getNotaTitulacion() .",". $titulo->getNotaPensum() .",". $titulo->getPromedio() .",'". $titulo->getPeriodoInicio() ."','". $titulo->getPeriodoFin() ."',". $titulo->getEstudiante() .",". $titulo->getCarrera() .")";
        }
        
        if($conn->query($sql) == TRUE){
            $titulo->setId($conn->insert_id);
        }
        $conn->close();
        return $titulo;
    }
    
    public static function _validarTitulo($IdCarrera, $IdEstudiante){
        $conn = (new C_MySQL())->open();
        $sql = "select validarTitulo( $IdCarrera ,$IdEstudiante) as 'resultado'";
        $resultado = FALSE;
        if($result = $conn->query($sql)){
            while ($row = $result->fetch_assoc()) {
                $resultado = $row["resultado"] == "1";
            }
            $result->free();
        }
        $conn->close();
        return $resultado;
    }
}
