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
$num_p = 1;
$fila_opcion = 0;
$objPHPExcel->setActiveSheetIndex(0);

$list_encuestas = $_SESSION["file"];
$objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, "No.");
foreach ($list_encuestas as $encuesta) {
    if (count($encuesta["preguntas"]) > 0) {
        foreach ($encuesta["preguntas"] as $pregunta) {
            $objPHPExcel->getActiveSheet()
                    ->setCellValueByColumnAndRow($col++, $fila, $num_p++ . '.- ' . $pregunta["enunciado"]);
            switch ($pregunta["tipo"]) {
                case "2":
                    foreach ($pregunta["opciones"] as $opcion) {
                        $objPHPExcel->getActiveSheet()
                                ->setCellValueByColumnAndRow($col++, $fila, $opcion["enunciado"]);
                    }
                    break;
                /*case "5": case "6":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        foreach ($data as $value) {
                            $actividad = $value->actividad;
                            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, $actividad);
                        }
                    }
                    break;
                case "7":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, "Graduacion");
                        foreach ($data->tb_Graduacion as $value) {
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $value->conocimiento);
                        }
                        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, "Actualidad");
                        foreach ($data->tb_Actualidad as $value) {
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $value->title);
                        }
                    }
                    break;
                case "12":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        foreach ($data as $value) {
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $value->enunciado);
                        }
                    }
                    break;
                case "8": case "9": case "10": case "11":
                    $columnas = [];
                    if ($pregunta["tipo"] === "8") {
                        $columnas = ["empresa", "cargo", "lugar", "tiempo_trabajo", "au00f1os_trabajo", "nivel_jerarquico", "naturaleza_empresa", "porcentaje_relacion"];
                    } else if ($pregunta["tipo"] === "9") {
                        $columnas = ["tipo_curso", "nombre_curso", "nombre_universidad", "pais", "ciudad", "culmino", "fechainicio_mes", "fechainicio_año", "fechafinal_mes", "fechafinal_año", "nota_media"];
                    } else if ($pregunta["tipo"] === "10" || $pregunta["tipo"] === "11") {
                        $columnas = ["Idioma", "A. Capaz de escribir textos profesionales relevantes", "B. Capaz de leer textos profesionalmente relevantes Ingles", "C. Capaz de hablar en un contexto profesionalmente relevante", "D. Escaso", "E. Sin dominio del idioma"];
                    }
                    foreach ($columnas as $value) {
                        $objPHPExcel->getActiveSheet()
                                ->setCellValueByColumnAndRow($col++, $fila, $value);
                    }
                    break;*/
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
        $fil_aumentar = 1;
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
                /*case "5": case "6":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $col++;
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        foreach ($data as $value) {
                            $val = ($tipo === "5") ? $value->hora : $value->mes;
                            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++, $fila, $val);
                        }
                    }
                    break;
                case "7":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        $col += 2;
                        foreach ($data->tb_Graduacion as $value) {
                            $val = "";
                            if ($value->op1) {
                                $val = "1";
                            } else if ($value->op2) {
                                $val = "2";
                            } else if ($value->op3) {
                                $val = "3";
                            } else if ($value->op4) {
                                $val = "4";
                            } else if ($value->op5) {
                                $val = "5";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $val);
                        }
                        $col++;
                        foreach ($data->tb_Actualidad as $value) {
                            $val = "";
                            if ($value->op1) {
                                $val = "1";
                            } else if ($value->op2) {
                                $val = "2";
                            } else if ($value->op3) {
                                $val = "3";
                            } else if ($value->op4) {
                                $val = "4";
                            } else if ($value->op5) {
                                $val = "5";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $val);
                        }
                    }
                    break;
                case "12":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        $col++;
                        foreach ($data as $value) {
                            $val = "";
                            if ($value->mb) {
                                $val = "mb";
                            } else if ($value->b) {
                                $val = "b";
                            } else if ($value->r) {
                                $val = "r";
                            } else if ($value->m) {
                                $val = "m";
                            } else if ($value->d) {
                                $val = "d";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col++, $fila, $val);
                        }
                    }
                    break;
                case "8": case "9":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        if (count($data) > $fil_aumentar) {
                            $fil_aumentar = count($data);
                        }
                        $col++;
                        switch ($tipo) {
                            case "8":
                                $fila_reg = $fila;
                                $col_reg = 0;
                                foreach ($data as $value) {
                                    $col_reg = $col;
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->empresa);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->cargo);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->lugar);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->tiempo_trabajo);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->anos_trabajo);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->nivel_jerarquico);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->naturaleza_empresa);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->porcentaje_relacion);
                                    $fila_reg++;
                                }
                                break;
                            case "9":
                                $fila_reg = $fila;
                                $col_reg = 0;
                                foreach ($data as $value) {
                                    $col_reg = $col;
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->tipo_curso);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->nombre_curso);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->nombre_u);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->pais);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->ciudad);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->culmino);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->fi_mes);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->fi_ano);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->ff_mes);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->ff_ano);
                                    $objPHPExcel->getActiveSheet()
                                            ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->nota_media);
                                    $fila_reg++;
                                }

                                break;
                        }
                        $col = $col_reg;
                    }
                    break;
                case "10": case"11":
                    if (isset($pregunta["preg_resp"][0]["opcion"])) {
                        $data = json_decode($pregunta["preg_resp"][0]["opcion"]);
                        if (count($data) > $fil_aumentar) {
                            $fil_aumentar = count($data);
                        }
                        $col++;
                        $fila_reg = $fila;
                        $col_reg = 0;
                        foreach ($data as $value) {
                            $valor_ = "";
                            $col_reg = $col;
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $value->idioma);
                            if($value->a_alto){
                                $valor_ = "alto";
                            }else if($value->a_medio){
                                $valor_ = "medio";
                            }else if($value->a_bajo){
                                $valor_ = "bajo";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $valor_);
                            if($value->b_alto){
                                $valor_ = "alto";
                            }else if($value->b_medio){
                                $valor_ = "medio";
                            }else if($value->b_bajo){
                                $valor_ = "bajo";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $valor_);
                            if($value->b_alto){
                                $valor_ = "alto";
                            }else if($value->b_medio){
                                $valor_ = "medio";
                            }else if($value->b_bajo){
                                $valor_ = "bajo";
                            }
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg, $valor_);
                            
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg,($value->d_escazo)?"Si":"No");
                            $objPHPExcel->getActiveSheet()
                                    ->setCellValueByColumnAndRow($col_reg++, $fila_reg,($value->e_nada)?"Si":"No");
                            $fila_reg++;
                        }
                        $col = $col_reg;
                    }
                    break;*/
                default :
                    $col++;
                    break;
            }
        }
        $fila += $fil_aumentar;
    }
}

// Rename worksheet
$objPHPExcel->getActiveSheet()->setTitle('Encuesta');


// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$objPHPExcel->setActiveSheetIndex(0);


// Redirect output to a client’s web browser (Excel2007)
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="encuesta.xlsx"');
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
