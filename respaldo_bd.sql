/*
 Navicat Premium Data Transfer

 Source Server         : Xammp
 Source Server Type    : MySQL
 Source Server Version : 100129
 Source Host           : localhost:3306
 Source Schema         : seg_graduados_v3

 Target Server Type    : MySQL
 Target Server Version : 100129
 File Encoding         : 65001

 Date: 11/01/2018 10:26:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carreras
-- ----------------------------
DROP TABLE IF EXISTS `carreras`;
CREATE TABLE `carreras`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Facultad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_Carreras_Facultad1_idx`(`Facultad_id`) USING BTREE,
  CONSTRAINT `fk_Carreras_Facultad1` FOREIGN KEY (`Facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carreras
-- ----------------------------
INSERT INTO `carreras` VALUES (1, 'Ingenieria en Sistemas', 1);
INSERT INTO `carreras` VALUES (2, 'Ing. Telematica', 1);

-- ----------------------------
-- Table structure for carreras_encuesta
-- ----------------------------
DROP TABLE IF EXISTS `carreras_encuesta`;
CREATE TABLE `carreras_encuesta`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acceso` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `fecha` date NULL DEFAULT NULL,
  `Encuestas_id` int(11) NOT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Titulo_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_carreras_encuesta_Encuestas1_idx`(`Encuestas_id`) USING BTREE,
  CONSTRAINT `fk_carreras_encuesta_encuestas_1` FOREIGN KEY (`Encuestas_id`) REFERENCES `encuestas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `order_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES (1, 'CONDICIÓN SOCIO-ECONÓMICA', 2);
INSERT INTO `categoria` VALUES (2, 'INFORMACIÓN SOBRE EL BACHILLERATO', 3);
INSERT INTO `categoria` VALUES (3, 'INFORMACIÓN DE LOS ESTUDIOS', 4);
INSERT INTO `categoria` VALUES (4, 'INFORMACIÓN LABORAL', 5);
INSERT INTO `categoria` VALUES (5, 'SATISFACCIÓN CON LA FORMACION Y ATENCION OFRECIDA POR LA UNIVERSIDAD', 6);
INSERT INTO `categoria` VALUES (6, 'DATOS PERSONALES', 1);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `objetivo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `imagen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (3, 'Encuestas de graduados', 'Descripción para el sitio web', 'Objetivo', NULL);
INSERT INTO `config` VALUES (4, '', '', '', NULL);

-- ----------------------------
-- Table structure for encuestas
-- ----------------------------
DROP TABLE IF EXISTS `encuestas`;
CREATE TABLE `encuestas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ref_carrera_id`(`carrera_id`) USING BTREE,
  CONSTRAINT `ref_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carreras` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombres` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for facultad
-- ----------------------------
DROP TABLE IF EXISTS `facultad`;
CREATE TABLE `facultad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of facultad
-- ----------------------------
INSERT INTO `facultad` VALUES (1, 'Ciencias de la Ingenieria');

-- ----------------------------
-- Table structure for opciones
-- ----------------------------
DROP TABLE IF EXISTS `opciones`;
CREATE TABLE `opciones`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `preguntas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_opciones_preguntas_idx`(`preguntas_id`) USING BTREE,
  CONSTRAINT `fk_opciones_preguntas` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for preguntas
-- ----------------------------
DROP TABLE IF EXISTS `preguntas`;
CREATE TABLE `preguntas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `tipo` int(11) NULL DEFAULT NULL,
  `categoria_id` int(11) NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `order_by` int(11) NULL DEFAULT NULL,
  `Encuestas_id` int(11) NOT NULL,
  `estado_excel` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado_tabulacion` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pregunta_categoria_idx`(`categoria_id`) USING BTREE,
  INDEX `fk_preguntas_Encuestas1_idx`(`Encuestas_id`) USING BTREE,
  CONSTRAINT `fk_preguntas_encuestas_1` FOREIGN KEY (`Encuestas_id`) REFERENCES `encuestas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pregunta_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for preguntas_respuestas
-- ----------------------------
DROP TABLE IF EXISTS `preguntas_respuestas`;
CREATE TABLE `preguntas_respuestas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `encuesta_carreras_id` int(11) NOT NULL,
  `pregunta_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_preguntas_respuestas_encuesta_titulo1_idx`(`encuesta_carreras_id`) USING BTREE,
  CONSTRAINT `fk_encuestas_carreras_id` FOREIGN KEY (`encuesta_carreras_id`) REFERENCES `carreras_encuesta` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `preguntas_respuestas_id` int(11) NULL DEFAULT NULL,
  `opciones_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ref_preguntas_respuestas_id_idx`(`preguntas_respuestas_id`) USING BTREE,
  CONSTRAINT `ref_preguntas_respuestas_id` FOREIGN KEY (`preguntas_respuestas_id`) REFERENCES `preguntas_respuestas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for titulo
-- ----------------------------
DROP TABLE IF EXISTS `titulo`;
CREATE TABLE `titulo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_titulacion` float NULL DEFAULT NULL,
  `nota_pensum` float NULL DEFAULT NULL,
  `promedio` float NULL DEFAULT NULL,
  `periodo_inicio` date NULL DEFAULT NULL,
  `periodo_fin` date NULL DEFAULT NULL,
  `Estudiante_id` int(11) NOT NULL,
  `Carreras_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_Titulo_Estudiante1_idx`(`Estudiante_id`) USING BTREE,
  INDEX `fk_Titulo_Carreras1_idx`(`Carreras_id`) USING BTREE,
  CONSTRAINT `fk_Titulo_Carreras1` FOREIGN KEY (`Carreras_id`) REFERENCES `carreras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Titulo_Estudiante1` FOREIGN KEY (`Estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for viewencuesta
-- ----------------------------
DROP VIEW IF EXISTS `viewencuesta`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewencuesta` AS select `e`.`id` AS `id`,`e`.`nombre` AS `nombre`,`e`.`fecha` AS `fecha`,`e`.`carrera_id` AS `carrera`,`e`.`estado` AS `estado`,count(`p`.`id`) AS `total_preguntas` from ((`encuestas` `e` join `carreras` `c` on((`c`.`id` = `e`.`carrera_id`))) left join `preguntas` `p` on(((`p`.`Encuestas_id` = `e`.`id`) and (`p`.`estado` = '1')))) group by `e`.`id`; ;

-- ----------------------------
-- View structure for viewfilecarrera
-- ----------------------------
DROP VIEW IF EXISTS `viewfilecarrera`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewfilecarrera` AS select `rownum`() AS `N`,`e`.`id` AS `encuestas`,`est`.`id` AS `codigoEstudiante`,`est`.`cedula` AS `cedula`,`est`.`nombres` AS `Estudiante`,`f`.`nombre` AS `Facultad`,`c`.`nombre` AS `Carrera`,`c_e`.`id` AS `carrera_encuesta`,`c_e`.`estado` AS `estado` from (((((`carreras_encuesta` `c_e` join `encuestas` `e` on((`e`.`id` = `c_e`.`Encuestas_id`))) join `carreras` `c` on((`c`.`id` = `e`.`carrera_id`))) join `facultad` `f` on((`f`.`id` = `c`.`Facultad_id`))) join `titulo` `t` on((`t`.`id` = `c_e`.`Titulo_id`))) join `estudiante` `est` on((`est`.`id` = `t`.`Estudiante_id`))) ;

-- ----------------------------
-- View structure for viewpreguntaencuestascarrera
-- ----------------------------
DROP VIEW IF EXISTS `viewpreguntaencuestascarrera`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewpreguntaencuestascarrera` AS select `p`.`id` AS `id`,`p`.`enunciado` AS `enunciado`,`p`.`tipo` AS `tipo`,`p_r`.`encuesta_carreras_id` AS `encuesta_carreras_id`,`cat`.`order_` AS `catOrder`,`p`.`order_by` AS `pregOrder` from ((`preguntas_respuestas` `p_r` join `preguntas` `p` on(((`p`.`id` = `p_r`.`pregunta_id`) and (`p`.`estado_excel` = 1)))) join `categoria` `cat` on((`cat`.`id` = `p`.`categoria_id`))) ;

-- ----------------------------
-- Procedure structure for pcdValidarAcceso
-- ----------------------------
DROP PROCEDURE IF EXISTS `pcdValidarAcceso`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pcdValidarAcceso`(IN `acceso` text)
BEGIN

	IF validarAcceso(acceso) = 1 THEN
		select "OK" as "status", c_e.* , e.estado encuesta_estado from carreras_encuesta c_e inner join encuestas e on e.id = c_e.Encuestas_id
			where c_e.acceso = acceso;
	ELSE
		 SELECT "ERROR" as "status";
	END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for rownum
-- ----------------------------
DROP FUNCTION IF EXISTS `rownum`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rownum`() RETURNS int(11)
BEGIN
	#Routine body goes here...
	set @prvrownum=if(@ranklastrun=CURTIME(6),@prvrownum+1,1);
  set @ranklastrun=CURTIME(6);
  RETURN @prvrownum;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for validarAcceso
-- ----------------------------
DROP FUNCTION IF EXISTS `validarAcceso`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarAcceso`(`valor` text) RETURNS int(11)
BEGIN
	RETURN EXISTS(SELECT * from carreras_encuesta c_e where acceso = valor);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for validarCarrera
-- ----------------------------
DROP FUNCTION IF EXISTS `validarCarrera`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarCarrera`(`pCarrera` int) RETURNS int(11)
BEGIN
	RETURN EXISTS(SELECT * from carreras where id = pCarrera LIMIT 1);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for validarEstudiante
-- ----------------------------
DROP FUNCTION IF EXISTS `validarEstudiante`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarEstudiante`(`pCedula` char(10)) RETURNS int(11)
BEGIN
	declare pID int;
	-- Pregunto si existe
	IF EXISTS(SELECT * from estudiante where cedula = pCedula) = 1 THEN
	-- Retorno el ID
		SELECT id into pID from estudiante where cedula = pCedula LIMIT 1;
		RETURN pID;
	ELSE
	-- Retorno el el valor por default
		return 0;
	END IF;	
END
;;
delimiter ;

-- ----------------------------
-- Function structure for validarTitulo
-- ----------------------------
DROP FUNCTION IF EXISTS `validarTitulo`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `validarTitulo`(`IdCarrera` int,`idEstudiante` int) RETURNS int(11)
BEGIN
	RETURN EXISTS(SELECT * from titulo t where t.Carreras_id = IdCarrera and Estudiante_id = idEstudiante);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
