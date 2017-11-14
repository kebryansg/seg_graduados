<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Titulo
 *
 * @author kebryan
 */
class Titulo {
    private $id;
    private $notaTitulacion;
    private $notaPensum;
    private $promedio;
    private $periodoInicio;
    private $periodoFin;
    private $estudiante;
    private $carrera;
    
    function __construct() {
        $this->id = 0;
    }
    function getId() {
        return $this->id;
    }

    function getNotaTitulacion() {
        return $this->notaTitulacion;
    }

    function getNotaPensum() {
        return $this->notaPensum;
    }

    function getPromedio() {
        return $this->promedio;
    }

    function getPeriodoInicio() {
        return $this->periodoInicio;
    }

    function getPeriodoFin() {
        return $this->periodoFin;
    }

    function getEstudiante() {
        return $this->estudiante;
    }

    function getCarrera() {
        return $this->carrera;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setNotaTitulacion($notaTitulacion) {
        $this->notaTitulacion = $notaTitulacion;
    }

    function setNotaPensum($notaPensum) {
        $this->notaPensum = $notaPensum;
    }

    function setPromedio($promedio) {
        $this->promedio = $promedio;
    }

    function setPeriodoInicio($periodoInicio) {
        $this->periodoInicio = $periodoInicio;
    }

    function setPeriodoFin($periodoFin) {
        $this->periodoFin = $periodoFin;
    }

    function setEstudiante($estudiante) {
        $this->estudiante = $estudiante;
    }

    function setCarrera($carrera) {
        $this->carrera = $carrera;
    }



}
