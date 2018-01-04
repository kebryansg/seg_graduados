<?php

class Validation {
    public static function Array_Validar($array){
        foreach (array_keys($array) as $key) {
            if(isset($array[$key])){
                return FALSE;
            }
        }
        return TRUE;
    }
}
