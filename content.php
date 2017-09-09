<?php session_start();?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/bootstrap/boostrap-select/bootstrap-select.min.css" rel="stylesheet">
        <link href="resources/bootstrap/table/bootstrap-table.min.css" rel="stylesheet">
        <link href="resources/styles/style.css" rel="stylesheet">
        <link href="resources/styles/menu.css" rel="stylesheet">
        <script src="resources/bootstrap/js/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/bootstrap/boostrap-select/bootstrap-select.min.js"></script>
        <script src="resources/bootstrap/table/bootstrap-table.min.js"></script>
        <script src="resources/bootstrap/table/locale/bootstrap-table-es-ES.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/pagination/jquery.twbsPagination.min.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/waitingfor.js" type="text/javascript"></script>
        <script src="resources/styles/style.js"></script>
        <title>Seguimientos a graduados</title>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="banner">
                    <img class="img-responsive" src="resources/images/uteq_banner.PNG">
                </div>
            </div>
            <?php
                 include_once 'mvc/view/Menu.php';
            ?>
            <div class="row">
                <div class="panel panel-body col-md-12" id="content">
                    <?php
                    //$url_body = "preview.html";
                        if(isset($url_body)){
                            include_once $url_body;
                        }
                    ?>
                </div>
            </div>
            <div class="row" id="error">

            </div>
        </div>
        

        <script type="text/javascript">
                //$("#content").load("pregunta/listPreguntas.php");
                //$("#content").load("preview.html");
        </script>
    </body>
</html>