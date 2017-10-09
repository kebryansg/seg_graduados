<?php

include_once '../mvc/controlador/C_MySQL.php';
include_once '../mvc/controlador/entidades/Estudiante.php';

class EstudianteDaoImp {

    public static function _genAcceso($id_titulo, $id_encuesta) {
        $conn = (new C_MySQL())->open();
        $acceso = md5($id_titulo . $id_encuesta . rand());
        $sql = "insert into encuesta_titulo(Encuestas_id,Titulo_id,fecha,acceso,estado) values($id_encuesta,$id_titulo,curdate(),'$acceso','1')";
        $conn->query($sql);
        $conn->close();
    }

    public static function _edit($id) {
        $estudiante = new Estudiante();
        $conn = (new C_MySQL())->open();
        $sql = "select * from estudiante where cedula = '$id';";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $estudiante->setId($row["id"]);
                $estudiante->setNombres($row["nombres"]);
                $estudiante->setCedula($row["cedula"]);
            }
            $resultado->free();
        }
        $conn->close();
        return $estudiante;
    }

    public static function _encuestas_titulo($idEstudiante) {
        $data = NULL;
        $a_titulo = [];
        $a_encuestas = [];
        //$a_encuestas_in = [];
        $a_encuestas_titulo_in = [];
        $a_encuestas_titulo = [];
        $cont = 1;
        $conn = (new C_MySQL())->open();
        $sql = "select t.id titulo,f.nombre facultad,c.nombre carrera from titulo t 
                inner join carreras c on c.id = t.Carreras_id
                inner join facultad f on f.id = c.Facultad_id
                where t.Estudiante_id = $idEstudiante;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($a_titulo, $row);
            }
            $resultado->free();
        }

        $sql = "select e_t.id Cod,e_t.Titulo_id titulo,encuestas.id encuesta,f.nombre facultad,c.nombre carrera, e_t.acceso acceso,encuestas.nombre nom_encuesta,concat('Generado : ', e_t.fecha ) accion from encuesta_titulo e_t
                inner join encuestas on encuestas.id = e_t.Encuestas_id and encuestas.estado = '1'
                inner join titulo t on t.id = e_t.Titulo_id
                inner join carreras c on c.id = t.Carreras_id
                inner join facultad f on f.id = c.Facultad_id
                where t.Estudiante_id = $idEstudiante;";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                $row["num"] = $cont;
                array_push($a_encuestas_titulo, $row);
                array_push($a_encuestas_titulo_in, $row["titulo"] . ':' . $row["encuesta"]);
                //array_push($a_encuestas_in, $row["encuesta"]);
                $cont++;
            }
            $resultado->free();
        }

        $sql = "select e.id cod,e.nombre from encuestas e where e.estado = '1';";
        if ($resultado = $conn->query($sql)) {
            while ($row = $resultado->fetch_assoc()) {
                array_push($a_encuestas, $row);
            }
            $resultado->free();
        }
        $conn->close();

        foreach ($a_titulo as $titulo) {
            foreach ($a_encuestas as $encuesta) {
                if (!in_array(($titulo["titulo"] . ':' . $encuesta["cod"]), $a_encuestas_titulo_in)) {
                    $row = array("num" => $cont, "Cod" => "0", "titulo" => $titulo["titulo"], "encuesta" => $encuesta["cod"],
                        "facultad" => $titulo["facultad"], "carrera" => $titulo["carrera"],
                        "acceso" => "", "nom_encuesta" => $encuesta["nombre"], "accion" => "<button dt-num=\"" . $cont . "\" class=\"btn btn-success btn-sm gen_acceso\">Generar acceso</button>");
                    array_push($a_encuestas_titulo, $row);
                    $cont++;
                }
            }
        }
        return $a_encuestas_titulo;
    }

}
