<?php
require_once '../resources/Classes/PHPExcel.php';
require_once '../resources/Classes/PHPExcel/Reader/Excel2007.php';
require_once '../files_excel/Excel_OUT.php';


require_once '../mvc/modelo/EstudianteDaoImp.php';
require_once '../mvc/modelo/CarreraDaoImp.php';
require_once '../mvc/modelo/TituloDaoImp.php';
/* Encuestas Carrera */
require_once '../mvc/modelo/EncuestaDaoImp.php';
require_once '../mvc/modelo/OpcionesDaoImp.php';
require_once '../mvc/modelo/RespuestasDaoImp.php';
require_once '../mvc/modelo/Preguntas_RespuestasDaoImp.php';


$op = $_GET["op"];
switch ($op){
    case "ingresar": 
        
        Header("Content-Type: application/json; charset=UTF-8");
        date_default_timezone_set('Europe/London');
        $file = $_FILES["excel_file"];
        $objReader = new PHPExcel_Reader_Excel2007();
        $objPHPExcel = $objReader->load($file["tmp_name"]);
        //Asignar la hoja a necesitar
        //$objPHPExcel->setActiveSheetIndex(1);

        /* Obtiene un array de las filas y columnas llenas */
        $sheetData = $objPHPExcel->getActiveSheet(1)->toArray(null,true,true,true);
        $pRow = 0;
        $bandera = TRUE;
        //while($shet = $sheetData){
        foreach ($sheetData as $row){
            if($pRow >= 2){
                $codCarrera = $row["A"];
                $cedulaEstudiante = $row["B"];
                $nombreEstudiante = $row["C"];

                $notaPensum = $row["G"];
                $notaTitulacion = $row["F"];
                $promedio = $row["H"];
                $periodoInicio = $row["D"];
                $periodoFin = $row["E"];
                
                // Validar Que las variables principales
                if(!isset($codCarrera) && !isset($cedulaEstudiante)){
                    break;
                }
                /* 
                 * Valida que el estudiante no este 
                 * Si el estudiante esta retorna el ID
                 * Caso contrario o
                 */
                $estudiante = new Estudiante();
                $estudiante->setCedula($cedulaEstudiante);
                EstudianteDaoImp::_validarEstudiante($estudiante);
                if($estudiante->getId() == 0){
                    $estudiante->setCedula($cedulaEstudiante);
                    $estudiante->setNombres($nombreEstudiante);
                    EstudianteDaoImp::_save($estudiante);
                }

                if(CarreraDaoImp::_validarCarrera($codCarrera)){
                    $titulo =  new Titulo();
                    $titulo->setCarrera($codCarrera);
                    $titulo->setEstudiante($estudiante->getId());
                    $titulo->setNotaPensum($notaPensum);
                    $titulo->setNotaTitulacion($notaTitulacion);
                    $titulo->setPromedio($promedio);

                    $titulo->setPeriodoInicio($periodoInicio);
                    $titulo->setPeriodoFin($periodoFin);
                    if(!TituloDaoImp::_validarTitulo($codCarrera,$estudiante->getId())){
                        TituloDaoImp::_save($titulo);
                    }
                }
            }
            $pRow++;
        }
        $response = array( 
            'status' => 'OK', 
            'NombreFile' => $file["name"],
            'type' => $file["type"]);

        echo json_encode($response);
        break;
    case "formato":
        $objReader = new PHPExcel_Reader_Excel2007();
        
        //Cargando el archivo para modificarlo
        $objPHPExcel = $objReader->load("../files_excel/FORMATO_INGRESO_ESTUDIANTES.xlsx");
        // Set document properties

        $objPHPExcel->setActiveSheetIndex(0);
        
        require_once '../mvc/modelo/CarreraDaoImp.php';
        
        $carreras = CarreraDaoImp::getCarreras();
        $fila = 2;
        foreach($carreras as $carrera){
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(0,$fila,$carrera["id"]);
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow(1,$fila,$carrera["nombre"]);
            $fila++;
        }
        
        out_excel("file", $objPHPExcel, "FORMATO_INGRESO_ESTUDIANTES");
        break;
    case "encuesta_carrera": 
        
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->setActiveSheetIndex(0);
        
        
        $list_result = array();
        $list_encuestas = EncuestaDaoImp::list_file($_GET["encuesta"]);
        
        
        $pRow = 1;
        $pColumn = 0;
        $num_p = 1;
        /* Llenar datos */
        foreach ($list_encuestas as $encuesta) {
            $encuesta["preguntas"] = EncuestaDaoImp::list_Preguntas($encuesta["carrera_encuesta"]);
            $list_preguntas = array();
            foreach ($encuesta["preguntas"] as $pregunta) {
                $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
                $list_preg_resp = Preguntas_RespuestasDaoImp::_listPregunta($encuesta["carrera_encuesta"], $pregunta["id"]);
                $list_preguntas_respuestas = array();
                foreach ($list_preg_resp as $preg_resp) {
                    $preg_resp["respuestas"] = RespuestasDaoImp::_getRespuesta($preg_resp["id"]);
                    array_push($list_preguntas_respuestas, $preg_resp);
                }
                $pregunta["preg_resp"] = $list_preguntas_respuestas;
                //$pregunta["respuestas"] = RespuestasDaoImp::_listRespuestas($encuesta["encuestas"]);
                //$pregunta["respuestas"] = RespuestasDaoImp::_getRespuesta($pregunta["id"]);
                array_push($list_preguntas, $pregunta);
            }
            $encuesta["preguntas"] = $list_preguntas;
            array_push($list_result, $encuesta);
        }
        
        /* Armar Cabecera */
        
        $keys = array("N","Facultad","Carrera","cedula","Estudiante");
        
        foreach ($list_result as $encuesta) {
            
            foreach ($keys as $key) {
                $objPHPExcel->getActiveSheet()
                        ->setCellValueByColumnAndRow($pColumn++, $pRow, $key);
            }
            
            
            foreach ($encuesta["preguntas"] as $pregunta) {
                $pColumn++;
                $objPHPExcel->getActiveSheet()
                        ->setCellValueByColumnAndRow($pColumn++, $pRow,$num_p++ . '.- ' . $pregunta["enunciado"]);
                
                switch ($pregunta["tipo"]) {
                    case "2": 
                        foreach ($pregunta["opciones"] as $opcion) {
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($pColumn++, $pRow, $opcion["enunciado"]);
                        }
                        break;
                    case "5": 
                        foreach ($pregunta["opciones"] as $opcion) {
                            $header_tabla = json_decode($opcion["enunciado"]);
                            $header_dominante = NULL;
                            foreach ($header_tabla as $header) {
                                if($header->columna_dominante){
                                    $header_dominante = $header;
                                    break;
                                }
                            }
                            if(isset($header_dominante)){
                                //$header = "["+ $header_dominante->title +"]";
                                foreach ($header_dominante->data_source as $rowSource) {
                                    $valor = "[". $header_dominante->title ."]". " " . $rowSource->text;
                                    $objPHPExcel->getActiveSheet()
                                        ->setCellValueByColumnAndRow($pColumn++, $pRow,$valor);
                                }
                            }
                            foreach ($header_tabla as $header) {
                                //if($header != $header_dominante){
                                if(true){
                                    $objPHPExcel->getActiveSheet()
                                        ->setCellValueByColumnAndRow($pColumn++, $pRow, $header->title);
                                }
                            }
                        }
                        break;
                }
                //$pregunta["respuestas"] = RespuestasDaoImp::_listRespuestas($encuesta["encuestas"]);
                //$pregunta["respuestas"] = RespuestasDaoImp::_getRespuesta($pregunta["id"]);
                //array_push($list_preguntas, $pregunta);
            }
            //$encuesta["preguntas"] = $list_preguntas;
            //array_push($list_result, $encuesta);
            break;
        }
        $pRow++;
        
        /* Ubicar Datos */
        $pColumn = 0;
        $pRowTabla = 0;
        foreach ($list_result as $encuesta) {
            $pColumn = 0;
            
            foreach ($keys as $key) {
                $objPHPExcel->getActiveSheet()
                        ->setCellValueByColumnAndRow($pColumn++, $pRow,$encuesta[$key]);
            }
            
            
            foreach ($encuesta["preguntas"] as $pregunta) {
                $pColumn += 2;
                 foreach ($pregunta["preg_resp"] as $preg_resp) {
                     switch ($pregunta["tipo"]) {
                        case "5": 
                            $auxpRow = $pRow;
                            $refColDominante = 0;
                            $refColDominanteInicio = 0;
                            
                            foreach ($pregunta["opciones"] as $opcion) {
                                $header_tabla = json_decode($opcion["enunciado"]);
                                $header_dominante = NULL;
                                foreach ($header_tabla as $header) {
                                    if($header->columna_dominante){
                                        $header_dominante = $header;
                                        break;
                                    }
                                }
                                if(isset($header_dominante)){
                                    $refColDominanteInicio = $pColumn;
                                    $pColumn = $pColumn + count($header_dominante->data_source);
                                }
                                $data = json_decode($preg_resp["opcion"],true);
                                $auxpColumn = $pColumn;
                                foreach ($data as $row) {
                                    $pColumn = $auxpColumn;
                                    foreach ($header_tabla as $header) {
                                        if($header->columna_dominante){
                                            $refColDominante = $pColumn;
                                        }
                                        $valor = $row[$header->title];
                                        $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($pColumn++, $auxpRow, $valor);
                                    }
                                    $auxpRow++;
                                }
                                
                                
                                if(isset($header_dominante)){
                                    $inicio_rango = $objPHPExcel->getActiveSheet()
                                                    ->getCellByColumnAndRow($refColDominante, $pRow)->getCoordinate();
                                    $fin_rango = $objPHPExcel->getActiveSheet()
                                                        ->getCellByColumnAndRow($refColDominante, $pRow + count($data) - 1 )->getCoordinate();

                                    $inicio_rango_estatica = $objPHPExcel->getActiveSheet()->getCell()->absoluteCoordinate($inicio_rango);
                                    $fin_rango_estatica = $objPHPExcel->getActiveSheet()->getCell()->absoluteCoordinate($fin_rango);
                                    foreach ($header_dominante->data_source as $source) {
                                        $valor = '=COUNTIF(' . $inicio_rango_estatica.':' . $fin_rango_estatica . ',"'. $source->text .'")';
                                        $objPHPExcel->getActiveSheet()
                                                    ->setCellValueByColumnAndRow($refColDominanteInicio++,$pRow, $valor);
                                    }
                                }
                            }
                            if(count($data) > $pRowTabla ){
                                $pRowTabla= count($data);
                            }
                            break;
                        case "1":
                            $pColumn--;
                            foreach ($preg_resp["respuestas"] as $respuesta) {
                                $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($pColumn++, $pRow,$respuesta["respuesta"]);
                            }
                            break;
                        case "3":  case "4":
                            $pColumn--;
                            if(isset($preg_resp["opcion"])){
                                $opcion = $preg_resp["opcion"];
                                $opciones = explode(",", $opcion);
                                $valores = array();
                                foreach ($opciones as $opcion) {
                                    $key = array_search($opcion, array_column($pregunta["opciones"], 'id'));
                                    $opciones_select = $pregunta["opciones"][$key];
                                    array_push($valores, $opciones_select["enunciado"]);
                                }
                                $objPHPExcel->getActiveSheet()
                                        ->setCellValueByColumnAndRow($pColumn++, $pRow, implode(",", $valores));
                                
                            }
                            break;
                        default :
                            foreach ($preg_resp["respuestas"] as $respuesta) {
                                $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($pColumn++, $pRow,$respuesta["respuesta"]);
                            }
                            break;
                    }
                 }
            }
            $pRow+= $pRowTabla + 1;
        }
        out_excel("file", $objPHPExcel, "test");
        break;
}
//http://localhost:8080/seguimiento_graduados/servidor/sExcel.php?op=encuesta_carrera&encuesta=12