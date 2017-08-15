<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Seguimiento de Graduados</title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="resources/styles/style.css" rel="stylesheet">
        
        <script src="resources/bootstrap/js/jquery.min.js"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/styles/style.js"></script>
        
        
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="banner">
                    <img class="img-responsive" src="resources/images/uteq_banner.PNG">
                </div>
            </div>
            <div class="row">
                <div class="tab">
                    <button class="tablinks active" data-id="#informacion" >Información</button>
                    <button class="tablinks" data-id="#Paris" >Informacion</button>
                    <button class="tablinks" data-id="#Tokyo" >Informacion</button>
                </div>

                <div id="informacion" class="tabcontent active">
                    <h2 class="negrita">Encuesta de seguimiento a graduados</h2>
                    <h3 class="negrita">Objetivo</h3>
                    <p class="lead text-justify">Ésta encuesta  pretende recopilar los datos de profesionales graduados en la Universidad Técnica Estatal de Quevedo, con el objetivo de mejorar los procesos de aprendizaje que otorga la universidad a los futuros profesionales.
                </div>

                <div id="Paris" class="tabcontent">
                    <h3>Paris</h3>
                    <p>Paris is the capital of France.</p>
                </div>

                <div id="Tokyo" class="tabcontent">
                    <h3>Tokyo</h3>
                    <p>Tokyo is the capital of Japan.</p>
                </div> 
                <!--<div id="informacion-title" class="panel panel-body" style="background-color: #eee;">-->
                <!--<div class="jumbotron">
                    <h2 class="negrita">Encuesta de seguimiento a graduados</h2>
                    <h3 class="negrita">Objetivo</h3>
                    <p class="lead text-justify">Ésta encuesta  pretende recopilar los datos de profesionales graduados en la Universidad Técnica Estatal de Quevedo, con el objetivo de mejorar los procesos de aprendizaje que otorga la universidad a los futuros profesionales.
                </div>-->
            </div>
            <div class="row bg-white">
                <div id="informacion-descripcion" class="panel-index">
                    <h3 class="negrita">Informacion:</h3>
                    <img class="center-block img-responsive"  src="resources/images/uteq_panorama.jpg">
                    <p class="lead text-justify">Apreciados Graduados, el grupo de investigación conformado por el Vicerrectorado Administrativo y la Dirección Académica, solicitamos su participación en esta encuesta, al informar de las experiencias que usted personalmente hizo en sus estudios y después de la graduación. La información proporcionada constituirá una valiosa retroalimentación para nuestra querida UTEQ en procura de mejorar nuestros sistemas de enseñanza aprendizaje y de mantenernos en contacto con usted para propiciar futuros refuerzos a la educación y seguirle ofreciendo nuestros servicios universitarios.   Deseamos actualizar el directorio de nuestros graduados, conocer su situación y los problemas que enfrentan para integrarse al mercado de trabajo, además de su criterio respecto a la educación recibida y cómo ésta ha influido en el mejoramiento de su calidad de vida.
                    <br> Su información será tratada estrictamente confidencial. Los resultados se publicarán de tal manera que se excluya la identificación de personas individuales.  Por tal motivo, y agradeciéndole con anticipación su colaboración, ponemos a su consideración ingrese la <strong>clave de acceso</strong> y llenar el cuestionario:
                </div>
            </div>
            <div class="row bg-white">
                <div class="text-center" id="form-acceso">
                    <div class="form-group form-inline">
                        <label class="control-label">Clave de acceso:</label>
                        <input type="text" class="form-control" id="txtAcceso" style="width: 200px;">
                        <button class="btn btn-default" id="btnAcceder">Acceder</button>
                    </div>
                </div>
                
            </div>
            <div class="row">
                <div class="panel-footer footer" >
                    <p >© 2017 Universidad Técnica Estatal de Quevedo derechos reservados</p>
                </div>
            </div>

        </div>



        
    </body>
</html>
