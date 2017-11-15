<?php
require_once '../resources/Classes/PHPExcel.php';
require_once '../resources/Classes/PHPExcel/Reader/Excel2007.php';
require_once '../files_excel/Excel_OUT.php';


require_once '../mvc/modelo/EstudianteDaoImp.php';
require_once '../mvc/modelo/CarreraDaoImp.php';
require_once '../mvc/modelo/TituloDaoImp.php';

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
}