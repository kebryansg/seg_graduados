<?php
session_start();
/**
 * PHPExcel
 *
 * Copyright (c) 2006 - 2015 PHPExcel
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 * @category   PHPExcel
 * @package    PHPExcel
 * @copyright  Copyright (c) 2006 - 2015 PHPExcel (http://www.codeplex.com/PHPExcel)
 * @license    http://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt	LGPL
 * @version    ##VERSION##, ##DATE##
 */
/** Error reporting */
error_reporting(E_ALL);
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
date_default_timezone_set('Europe/London');

if (PHP_SAPI == 'cli')
    die('This example should only be run from a Web Browser');

/** Include PHPExcel */
include './resources/Classes/PHPExcel.php';


$list_result = $_SESSION["file"];

// Create new PHPExcel object
$objPHPExcel = new PHPExcel();

// Set document properties
$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
        ->setLastModifiedBy("Maarten Balliauw")
        ->setTitle("Office 2007 XLSX Test Document")
        ->setSubject("Office 2007 XLSX Test Document")
        ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
        ->setKeywords("office 2007 openxml php")
        ->setCategory("Test result file");

//Datos
$fila = 1;
$col = 0;
$fila_opcion = 0;
$objPHPExcel->setActiveSheetIndex(0);

//$objPHPExcel->getActiveSheet()->
$list_encuestas = $_SESSION["file"];
$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, "No.");
foreach ($list_encuestas as $encuesta) {
    if (count($encuesta["preguntas"]) > 0) {
        foreach ($encuesta["preguntas"] as $pregunta) {
            $objPHPExcel->getActiveSheet()
                    ->setCellValueByColumnAndRow($col++, $fila, $col . '.- ' . $pregunta["enunciado"]);
            switch ($pregunta["tipo"]) {
                case "2":
                    foreach ($pregunta["opciones"] as $opcion) {
                        $objPHPExcel->getActiveSheet()
                                ->setCellValueByColumnAndRow($col++, $fila, $opcion["enunciado"]);
                    }
                    break;
            }
        }
        break;
    }
}
$fila++;
foreach ($list_encuestas as $encuesta) {
    $col = 0;
    if (count($encuesta["preguntas"]) > 0) {
        // Numeracion de encuesta
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, ($fila - 1));
        //Datos simples
        foreach ($encuesta["preguntas"] as $pregunta) {
            $tipo = $pregunta["tipo"];
            switch ($tipo) {
                case "1":
                    $valor = $pregunta["preg_resp"]["respuestas"][0]["respuesta"];
                    $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, $valor);
                    break;
                case "2":
                    $col++;
                    foreach ($pregunta["preg_resp"]["respuestas"] as $respuesta) {
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, $respuesta["respuesta"]);
                    }
                    break;
                case "4":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $valor = "";
                        $opcion_id = $pregunta["preg_resp"][0]["opcion"];
                        foreach ($pregunta["opciones"] as $opcion) {
                            if ($opcion["id"] === $opcion_id) {
                                $valor = $opcion["enunciado"];
                                break;
                            }
                        }
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, $valor);
                    }
                    break;
                case "3":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $valor = array();
                        $opcion_id = $pregunta["preg_resp"][0]["opcion"];
                        $opciones = explode(",", $opcion_id);
                        foreach ($opciones as $opcion_selec) {
                            foreach ($pregunta["opciones"] as $opcion) {
                                if ($opcion_selec === $opcion["id"]) {
                                    array_push($valor, $opcion["enunciado"]);
                                    break;
                                }
                            }
                        }
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, implode(",", $valor));
                    }
                    break;
                default :
                    $col++;
                    break;
            }
        }
        $fila++;
    }
}
//$id_encuesta = 0;
// Add some data
//$objPHPExcel->setActiveSheetIndex(0)
//        ->setCellValue('A1', "asa")
//        ->setCellValue('B2', 'world!')
//        ->setCellValue('C1', 'Hello')
//        ->setCellValue('D2', 'world!');
//
//// Miscellaneous glyphs, UTF-8
//$objPHPExcel->setActiveSheetIndex(0)
//        ->setCellValue('A4', 'Miscellaneous glyphs')
//        ->setCellValue('A5', 'éàèùâêîôûëïüÿäöüç');
// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Simple');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Redirect output to a client’s web browser (Excel2007)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="01simple.xlsx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
$objWriter->save('php://output');
exit;
