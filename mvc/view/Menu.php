<?php
if (isset($_SESSION["rol"])) {
    switch ($_SESSION["rol"]) {
        case "admin":
            ?>
            <div class="row">
                <header class="navbar navbar-inverse negrita " role="banner">
                    <div class="container">
                        <div class="navbar-header">
                            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <nav class="navbar-collapse bs-navbar-collapse collapse" role="navigation" style="height: 1px;">
                            <ul class="nav navbar-nav ">
                                <!--<li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Preguntas <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>-->
                                <!--<li>
                                    <a class="menu_admin" href="pregunta/listPreguntas.php">Preguntas</a>
                                </li>-->
                                <li>
                                    <a class="menu_admin" href="evaluacion/listEncuestas.php">Encuestas</a>
                                </li>
                                <li>
                                    <a class="menu_admin" href="acceso/generar.php">Graduados</a>
                                </li>
                                <li>
                                    <a href="cerrar_session.php">Salir</a>
                                </li>

                            </ul>
                        </nav>
                    </div>
                </header>
            </div>
            <?php
            break;
        case "eval":
            $url_body = "evaluacion/newEvaluacion.php";
            break;
    }
} else {
    ?>
    <script>
        location.href = "./";
    </script>
    <?php
}

