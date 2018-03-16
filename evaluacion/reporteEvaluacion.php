<!DOCTYPE html>
<script type="text/javascript" src="resources/chart/Chart.bundle.min.js"></script>
<script type="text/javascript">
    $("#btnRegresar").click(function(){
        $("a[href='evaluacion/listEncuestas.php']").click();
    });
    
    window.chartColors = {
                red: 'rgb(255, 99, 132)',
                orange: 'rgb(255, 159, 64)',
                yellow: 'rgb(255, 205, 86)',
                green: 'rgb(75, 192, 192)',
                blue: 'rgb(54, 162, 235)',
                purple: 'rgb(153, 102, 255)',
                grey: 'rgb(201, 203, 207)'
        };
</script>
<div class="row">
    <div class="col-md-12">
        <div class="pull-right">
            <button class="btn btn-danger" id="btnRegresar">Regresar</button>
        </div>
    </div>
</div>
<br>
<?php
    include_once '../mvc/modelo/PreguntasDaoImp.php';
    include_once '../mvc/modelo/OpcionesDaoImp.php';
    
    //$encuesta_id = 13;
    $encuesta_id = $_GET["id_encuesta"];
    $listPreguntas = PreguntasDaoImp::_listPreguntasReporte($encuesta_id);
    $opciones = OpcionesDaoImp::_listEncuesta($encuesta_id);
    $opciones_count = array_count_values($opciones);
    

    foreach ($listPreguntas as $pregunta) {
        $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
        $func_label = function($opcion){
            return $opcion["enunciado"];
        };
        $func_label_tabla = function($opcion){
            return $opcion->text;
        };
        $fun_data = function ($opcion){
            global $opciones_count;
            return   array_key_exists($opcion["id"],$opciones_count)? $opciones_count[$opcion["id"]] : 0;
        };
        
        $label = NULL;
        $data = NULL;
        
        switch ($pregunta["tipo"]) {
            case "3": case "4":
                $label = json_encode(array_map($func_label, $pregunta["opciones"]));
                $data = json_encode(array_map($fun_data, $pregunta["opciones"]));
                break;
            case "5":
                $enunciado = array_map($func_label, $pregunta["opciones"]);
                $enunciados = json_decode($enunciado[0]); 
                foreach ($enunciados as $enunciado) {
                    if($enunciado->columna_dominante){
                        $label = json_encode(array_map($func_label_tabla, $enunciado->data_source));
                        $data = json_encode(array(1,4,7,4));
                    }
                }        
                break;
        }
?>

<div class="row">
    
    <div class="col-md-12">
        <div name="pregunta" class="well well-sm">
            <!--<h4><?php echo $pregunta["enunciado"];  ?></h4>-->
            <br>
            <div style="width: 400px;height: 400px;" class="center-block" >
                <canvas id="<?php echo $pregunta["id"]; ?>"  width="400" height="400"></canvas>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var ctx = $("#<?php echo $pregunta["id"]; ?>");// document.getElementById("myChart");
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            //labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            labels: <?php echo $label; ?>,
            datasets: [{
                label: '# of Votes',
                //data: [12, 19, 3, 5, 2, 3],
                data: <?php echo$data; ?>,
                backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.orange,
                        window.chartColors.yellow,
                        window.chartColors.green,
                        window.chartColors.blue
                ],
                borderWidth: 1
            }]
        },
        options: {
                responsive: true,
                legend: {
                    position: 'right'
                },
                title: {
                    display: true,
                    text: '<?php echo $pregunta["enunciado"];  ?>'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
    });
</script>
<?php
    }
?>