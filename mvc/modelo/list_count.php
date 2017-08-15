<?php
class list_count{
    private $total;
    private $list;
    function __construct() {
        $this->total = 0;
        $this->list = null;
    }

    public function getTotal(){
        return $this->total;
    }
    public function getList(){
        return $this->list;
    }
    public function setTotal($total){
        $this->total = $total;
    }
    public function setList($list){
        $this->list = $list;
    }
}