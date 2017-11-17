<!DOCTYPE html>
<script type="text/javascript" src="resources/chart/Chart.bundle.min.js"></script>
<script type="text/javascript">
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
<?php
    include_once '../mvc/modelo/PreguntasDaoImp.php';
    include_once '../mvc/modelo/OpcionesDaoImp.php';
    
    //global $opciones_count;
    
    $encuesta_id = 13;
    $listPreguntas = PreguntasDaoImp::_listPreguntasReporte($encuesta_id);
    $opciones = OpcionesDaoImp::_listEncuesta($encuesta_id);
    $opciones_count = array_count_values($opciones);
    
    //echo var_dump($opciones);
    
    //echo var_dump(array_count_values($opciones));
    
    //echo var_dump(array_count_values($opciones)["1345"]);
    
    
    /*foreach ($listPreguntas as $pregunta) {
        $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
        
        
        
        
        switch ($pregunta["tipo"]) {
            case "3": case "4":
                
                break;

        }
    }*/
    
    
    

    foreach ($listPreguntas as $pregunta) {
        $pregunta["opciones"] = OpcionesDaoImp::list_($pregunta["id"]);
        $func_label = function($opcion){
            return $opcion["enunciado"];
        };
        $fun_data = function ($opcion){
            global $opciones_count;
            return   array_key_exists($opcion["id"],$opciones_count)? $opciones_count[$opcion["id"]] : 0;
        };
        //echo(json_encode(array_map($func, $pregunta["opciones"])));
?>
<div class="row">
    <div class="col-md-12">
        <div name="pregunta" class="well well-sm">
            <h4><?php echo $pregunta["enunciado"];  ?></h4>
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
            labels: <?php echo(json_encode(array_map($func_label, $pregunta["opciones"]))); ?>,
            datasets: [{
                label: '# of Votes',
                //data: [12, 19, 3, 5, 2, 3],
                data: <?php echo(json_encode(array_map($fun_data, $pregunta["opciones"]))); ?>,
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
                    position: 'top'
                },
                title: {
                    display: true,
                    text: 'Chart.js Doughnut Chart'
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