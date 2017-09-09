<div class="row">
    <div class="col-md-12">
        <div class="pull-right">
            <a href="cerrar_session.php" class="btn btn-danger">Cancelar</a>
            <button id="saveEvaluacion" class="btn btn-success">Enviar</button>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12 text-center" data-id="<?php echo $_SESSION["id_encuesta"]; ?>">
        <h3>ENCUESTA PARA EL SEGUIMIENTO A GRADUADOS DE LAS CARRERAS DE GRADO DE LA UNIVERSIDAD TÉCNICA ESTATAL DE QUEVEDO</h3>
    </div>

</div>
<div class="row ">
    <div class="col-md-12" id="content_evaluacion">
    </div>
</div>
<div class="row hidden">
    <div id="pISimple">
        <div class="pregunta_content">
            <div class="form-horizontal">
                <div class="form-group ">
                    <label class="control-label label-mod enunciado_pregunta col-sm-3"></label>
                    <div class="col-md-8">
                        <input type="text" class="form-control">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="pIMultiple">
        <div class="pregunta_content flex-parent">
            <div class="col-md-3 flex-child">
                <label class="control-label label-mod enunciado_pregunta"  ></label>
            </div>
            <div class="col-md-9 opcion_content">

            </div>
        </div>
    </div>
    <div id="op_pIMultiple">
        <div class="form-horizontal">
            <div class="form-group">
                <label class="control-label label-mod col-md-2"></label>
                <div class="col-md-9">
                    <input type="text" class="form-control">
                </div>
            </div>
        </div>
    </div>
    <div id="pSMultiple">
        <div class="pregunta_content flex-parent">
            <div class="col-md-3 flex-child">
                <label class="control-label label-mod enunciado_pregunta"></label>
            </div>
            <div class="col-md-9  opcion_content">
                <div class="col-md-6"></div>
                <div class="col-md-6"></div>
            </div>
        </div>
    </div>
    <div id="op_pSMultiple">
        <div class="checkbox">
            <label><input type="checkbox" value=""></label>
        </div>
        <div class="clearfix"></div>
    </div>
    <div id="pSUnica">
        <div class="pregunta_content flex-parent">
            <div class="col-md-3 flex-child">
                <label class="control-label label-mod enunciado_pregunta"></label>
            </div>
            <div class="col-md-9  opcion_content">
                <!--<div class="col-md-6"></div>
                <div class="col-md-6"></div>-->
                <select class="selectpicker form-control" data-live-search="true">
                    
                </select>
            </div>
        </div>
    </div>
    <div id="op_pSUnica">
        <div class="checkbox">
            <label><input type="radio" value=""> </label>
        </div>
        <div class="clearfix"></div>
    </div>
    <div id="tb_mes_actividad">
        <div class="pregunta_content">
            <label class="control-label enunciado_pregunta">Enunciado:</label>
            <table data-toggle="table" id="tb_Actividad_Mes" >
                <thead>
                    <tr>
                        <th data-field="actividad">Actividad</th>
                        <th data-formatter="input_txt" data-events="txtEvents" data-field="mes">Meses</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Empleo / trabajo NO relacionado con el estudio </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Empleo / trabajo relacionado con el estudio </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Trabajo, prácticas (como parte de su carrera</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Crianza de los hijos u otros familiares</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Servicio Militar o equivalente</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Sin empleo, buscando empleo</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

    <div id="tb_horas_semana">
        <div class="pregunta_content">
            <label class="control-label enunciado_pregunta">Enunciado:</label>
            <table data-toggle="table" id="tb_Actividad_Horas">
                <thead>
                    <tr>
                        <th data-field="actividad">Actividad</th>
                        <th data-formatter="input_txt" data-events="txtEvents" data-field="hora">Horas</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Estudios, incluyen asistencia a clases y evaluaciones, trabajo autónomo</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Deporte</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Empleo/Trabajo</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div id="tb_conocimiento_informatico">
        <div class="pregunta_content">
            <label for="" class="control-label enunciado_pregunta"></label>
            <div class="col-md-6">
                <table data-toggle="table" id="tb_Graduacion">
                    <thead>
                        <tr>
                            <th colspan="6">Graduacion</th>
                        </tr>
                        <tr>
                            <th data-field="conocimiento" >Conocimientos de informatica</th>
                            <th data-field="op1" data-formatter="cbk_tbG" >1</th>
                            <th data-field="op2" data-formatter="cbk_tbG">2</th>
                            <th data-field="op3" data-formatter="cbk_tbG">3</th>
                            <th data-field="op4" data-formatter="cbk_tbG">4</th>
                            <th data-field="op5" data-formatter="cbk_tbG">5</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Procesador de palabras o texto</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Hoja de Cálculo</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Base de Datos</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Software especializado </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Lenguajes de programación</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <table data-toggle="table" id="tb_Actualidad">
                    <thead>
                        <tr>
                            <th colspan="6">Actualmente</th>
                        </tr>
                        <tr>
                            <th data-field="title">Conocimientos de informatica</th>

                            <th data-field="op1" data-formatter="cbk_tbA" >1</th>
                            <th data-field="op2" data-formatter="cbk_tbA">2</th>
                            <th data-field="op3" data-formatter="cbk_tbA">3</th>
                            <th data-field="op4" data-formatter="cbk_tbA">4</th>
                            <th data-field="op5" data-formatter="cbk_tbA">5</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Procesador de palabras o texto</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Hoja de Cálculo</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Base de Datos</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Software especializado </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Lenguajes de programación</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div id="ptb_estudios_formación_adicional">
        <div class="pregunta_content">
            <label for="" class="enunciado_pregunta control-label">sasas</label>
            <div class="pull-right">
                <button class="btn btn-success" id="btn_add_tb_estudios_formación_adicional">Agregar</button>
            </div>
            <div id="content_tb_estudios_formación_adicional">
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Tipo de Curso:</label>
                        <select data-field="tipo_curso" class="selectpicker form-control">
                            <option value="1">Curso de corta duración</option>
                            <option value="3">Licenciatura en Educación</option>
                            <option value="4">Licenciatura en Ciencias</option>
                            <option value="5">Ingeniería</option>
                            <option value="6">Diplomado</option>
                            <option value="7">Especialidad</option>
                            <option value="8">Master en Educación</option>
                            <option value="9">Master en Ciencias</option>
                            <option value="10">Doctorado PhD</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre del curso o Título obtenido:</label>
                        <input type="text" class="form-control" data-field="nombre_curso">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nombre de la universidad  o empresa:</label>
                        <input type="text" class="form-control" data-field="nombre_u">
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">País:</label>
                        <input type="text" class="form-control" data-field="pais">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Ciudad:</label>
                        <input type="text" class="form-control" data-field="ciudad">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Culminó:</label>
                        <select data-field="culmino" class="selectpicker">
                            <option value="Si">Si</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group row">
                        <label class="control-label col-sm-12">Fecha Inicio:</label>
                        <div class="clearfix"></div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" data-field="fi_mes"   placeholder="Mes">    
                        </div>

                        <div class="col-md-6">
                            <input type="text" class="form-control" data-field="fi_ano"   placeholder="Año">
                        </div>      

                    </div>
                    <div class="form-group row">
                        <label class="control-label col-sm-12">Fecha Fin:</label>
                        <div class="col-md-6">
                            <input type="text" class="form-control" data-field="ff_mes"  placeholder="Mes">    
                        </div>

                        <div class="col-md-6">
                            <input type="text" class="form-control" data-field="ff_ano"  placeholder="Año">
                        </div>      
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nota media /10:</label>
                        <input type="text" class="form-control" data-field="nota_media">
                    </div>
                </div>
            </div>
            <table data-toggle="table" id="tb_estudios_formación_adicional">
                <thead>
                    <tr>
                        <th data-field="tipo_curso" rowspan="2" data-valign="middle">Tipo Curso</th>
                        <th data-field="nombre_curso" rowspan="2" data-valign="middle">Nombre del curso o Título obtenido</th>
                        <th data-field="nombre_u" rowspan="2" data-valign="middle">Nombre de la universidad  o empresa</th>
                        <th data-field="pais" rowspan="2" data-width="200px" data-valign="middle">País</th>
                        <th data-field="ciudad" rowspan="2" data-width="200px" data-valign="middle">Ciudad</th>
                        <th colspan="2">Fecha Inicio</th>
                        <th colspan="2">Fecha Fin</th>
                        <th data-field="culmino" rowspan="2" data-valign="middle">Culminó?</th>
                        <th data-field="nota_media" rowspan="2" data-valign="middle">Nota media /10</th>
                    </tr>
                    <tr>
                        <th data-field="fi_mes">Mes</th>
                        <th data-field="fi_ano">Año</th>
                        <th data-field="ff_mes">Mes</th>
                        <th data-field="ff_ano">Año</th>
                    </tr>
                </thead>
            </table>
        </div>

    </div>

    <div id="ptb_experiencia_laboral">
        <div class="pregunta_content">
            <label for="" class="enunciado_pregunta control-label"></label>
            <div class="pull-right">
                <button class="btn btn-success" id="btn_add_tb_experiencia_laboral">Agregar</button>
            </div>
            <div id="content_tb_experiencia_laboral">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="control-label">Empresa:</label>
                        <input type="text" class="form-control" data-field="empresa">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Cargo:</label>
                        <input type="text" class="form-control" data-field="cargo">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Lugar:</label>
                        <input type="text" class="form-control" data-field="lugar">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Tiempo de trabajo:</label>
                        <input type="text" class="form-control" data-field="tiempo_trabajo">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Años en que trabajó(Desde - Hasta):</label>
                        <input type="text" class="form-control" data-field="anos_trabajo">
                    </div>
                    <div class="form-group">
                        <label class="control-label">Nivel jerárquico de su puesto:</label>
                        <input type="text" class="form-control" data-field="nivel_jerarquico">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label class="control-label">Naturaleza de la empresa (pública, privada):</label>
                        <select class="form-control" data-field="naturaleza_empresa">
                            <option value="Pública">Publica</option>
                            <option value="Privada">Privada</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Porcentaje de relación del Cargo con su Título:</label>
                        <input type="text" class="form-control" data-field="porcentaje_relacion">
                    </div>
                </div>
            </div>
            <table data-toggle="table" id="tb_experiencia_laboral">
                <thead>
                    <tr>
                        <th data-field="empresa" >Empresa</th>
                        <th data-field="cargo" >Cargo</th>
                        <th data-field="lugar" >Lugar</th>
                        <th data-field="tiempo_trabajo" >Tiempo de trabajo</th>
                        <th data-field="anos_trabajo" >Años en que trabajó</th>
                        <th data-field="nivel_jerarquico" >Nivel jerárquico de su puesto</th>
                        <th data-field="naturaleza_empresa" >Naturaleza de la empresa</th>
                        <th data-field="porcentaje_relacion" >Porcentaje de relación del Cargo con su Título</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    <div id="ptb_idioma_egresar">
        <div class="pregunta_content">
            <label class="enunciado_pregunta control-label">asas</label>
            <table data-toggle="table" id="tb_idioma_egresar">
                <thead>
                    <tr>
                        <th data-field="idioma" rowspan="3"></th>
                        <th colspan="11" data-halign="center">Nivel de conomiento del idioma</th>
                    </tr>
                    <tr>
                        <th colspan="3" data-halign="center" >A. Capaz de escribir textos profesionales relevantes</th>
                        <th colspan="3" data-halign="center">B. Capaz de leer textos profesionalmente relevantes</th>
                        <th colspan="3" data-halign="center">C. Capaz de hablar en un contexto profesionalmente relevante</th>
                        <th colspan="2" data-halign="center">Otros</th>
                    </tr>
                    <tr>
                        <th data-field="a_alto" data-formatter="check" data-align="center" data-halign="center" >Alto</th>
                        <th data-field="a_medio" data-halign="center" data-formatter="check" data-align="center" >Medio</th>
                        <th data-field="a_bajo" data-halign="center" data-formatter="check" data-align="center" >Bajo</th>
                        <th data-field="b_alto" data-halign="center" data-formatter="check" data-align="center">Alto</th>
                        <th data-field="b_medio" data-halign="center" data-formatter="check" data-align="center">Medio</th>
                        <th data-field="b_bajo" data-halign="center" data-formatter="check" data-align="center">Bajo</th>
                        <th data-field="c_alto" data-halign="center" data-formatter="check" data-align="center">Alto</th>
                        <th data-field="c_medio" data-halign="center" data-formatter="check" data-align="center">Medio</th>
                        <th data-field="c_bajo" data-halign="center" data-formatter="check" data-align="center">Bajo</th>
                        <th data-field="d_escazo" data-align="center" data-halign="center" data-formatter="check">D. Escaso</th>
                        <th data-field="e_nada" data-align="center" data-halign="center" data-formatter="check">E. Sin dominio del idioma</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ingles</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Frances</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Aleman</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <div id="ptb_facilidad_condicion">
        <div class="pregunta_content">
            <label for="" class="enunciado_pregunta control-label"></label>
            <table data-toggle="table" id="tb_facilidad_condicion">
                <thead>
                    <tr>
                        <th data-field="enunciado">Facilidades y Condiciones de Estudio</th>
                        <th data-formatter="cbk_tbFC" data-field="mb">MB</th>
                        <th data-formatter="cbk_tbFC" data-field="b">B</th>
                        <th data-formatter="cbk_tbFC" data-field="r">R</th>
                        <th data-formatter="cbk_tbFC" data-field="m">M</th>
                        <th data-formatter="cbk_tbFC" data-field="d">D</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Consejería académica ofrecida en general</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Asistencia/ asesoría para el examen final</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Contenido del curso de especialización</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Variedad de cursos ofertados</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Diseño del programa de grado</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Sistema de evaluación/ clasificación</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Oportunidad para escoger los cursos y áreas de especialización</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Énfasis práctico en la enseñanza y el aprendizaje</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Calidad de enseñanza</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Oportunidades para participar en proyectos de investigación</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Énfasis en la investigación de la enseñanza + aprendizaje</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Provisión de lugares de trabajo y otras experiencias de trabajo</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Oportunidad de contactos extra-clase con la planta docente</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Contactos con compañeros de estudios</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Oportunidad para los estudiantes de tener un impacto en las políticas universitarias</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Equipamiento y bibliografía de las bibliotecas</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Disponibilidad de material de enseñanza </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Calidad del equipo técnico (ej. PC, instrumentos de medición, etc.)</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div> 

    <div id="ptb_idioma_actualmente">
        <div class="pregunta_content">
            <label class="enunciado_pregunta control-label"></label>
            <table data-toggle="table" id="tb_idioma_actualmente">
                <thead>
                    <tr>
                        <th data-field="idioma" rowspan="3"></th>
                        <th colspan="11" data-halign="center">Nivel de conomiento del idioma</th>
                    </tr>
                    <tr>
                        <th colspan="3" data-halign="center" >A. Capaz de escribir textos profesionales relevantes</th>
                        <th colspan="3" data-halign="center">B. Capaz de leer textos profesionalmente relevantes</th>
                        <th colspan="3" data-halign="center">C. Capaz de hablar en un contexto profesionalmente relevante</th>
                        <th colspan="2" data-halign="center">Otros</th>
                    </tr>
                    <tr>
                        <th data-field="a_alto" data-formatter="check" data-align="center" data-halign="center" >Alto</th>
                        <th data-field="a_medio" data-halign="center" data-formatter="check" data-align="center" >Medio</th>
                        <th data-field="a_bajo" data-halign="center" data-formatter="check" data-align="center" >Bajo</th>
                        <th data-field="b_alto" data-halign="center" data-formatter="check" data-align="center">Alto</th>
                        <th data-field="b_medio" data-halign="center" data-formatter="check" data-align="center">Medio</th>
                        <th data-field="b_bajo" data-halign="center" data-formatter="check" data-align="center">Bajo</th>
                        <th data-field="c_alto" data-halign="center" data-formatter="check" data-align="center">Alto</th>
                        <th data-field="c_medio" data-halign="center" data-formatter="check" data-align="center">Medio</th>
                        <th data-field="c_bajo" data-halign="center" data-formatter="check" data-align="center">Bajo</th>
                        <th data-field="d_escazo" data-align="center" data-halign="center" data-formatter="check">D. Escaso</th>
                        <th data-field="e_nada" data-align="center" data-halign="center" data-formatter="check">E. Sin dominio del idioma</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ingles</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Frances</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Aleman</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>


    <div class="panel panel-primary" id="panel_default">
        <div class="panel-heading">
            <h4>Datos Personales</h4>
        </div>
        <div class="panel-body">
        </div>
    </div>
</div>
<script src="evaluacion/js/newEvaluacion.js"></script>