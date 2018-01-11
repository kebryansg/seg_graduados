<?php

class Validation {
    public static function Array_Validar($array){
        foreach (array_keys($array) as $key) {
            $value = $array[$key];
            if(empty($value)){
                return FALSE;
            }
        }
        return TRUE;
    }
}
