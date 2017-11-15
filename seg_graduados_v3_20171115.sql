/*
 Navicat Premium Data Transfer

 Source Server         : local_MySQL
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : seg_graduados_v3

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 15/11/2017 04:07:03
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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carreras_encuesta
-- ----------------------------
INSERT INTO `carreras_encuesta` VALUES (8, '9a0fe792620c21f73f43c6b2fba2f889', '2017-11-12', 11, '1', 1);
INSERT INTO `carreras_encuesta` VALUES (9, '81949e1e03de635c16a39dd16f833e2b', '2017-11-12', 10, '1', 2);
INSERT INTO `carreras_encuesta` VALUES (10, 'a8781a1f67d3ce32a93ac6c84e491765', '2017-11-12', 3, '1', 1);
INSERT INTO `carreras_encuesta` VALUES (11, '212d4b510ef0afc81c123629254eff71', '2017-11-13', 2, '1', 1);
INSERT INTO `carreras_encuesta` VALUES (12, 'd12e69253080cb7b869b8ef6313665a1', '2017-11-14', 13, '2', 6);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of encuestas
-- ----------------------------
INSERT INTO `encuestas` VALUES (1, 'Encuesta 2015', '2017-09-15', '0', 1);
INSERT INTO `encuestas` VALUES (2, 'Encuesta 2016', '2017-09-15', '1', 1);
INSERT INTO `encuestas` VALUES (3, 'Encuesta 2017', '2017-09-15', '1', 1);
INSERT INTO `encuestas` VALUES (4, 'Encuesta 2014', '2017-09-23', '0', 2);
INSERT INTO `encuestas` VALUES (5, 'Encuesta 2013', '2017-09-17', '0', 1);
INSERT INTO `encuestas` VALUES (6, 'Encuesta 2012', '2017-09-17', '0', 2);
INSERT INTO `encuestas` VALUES (7, 'Encuesta 2011', '2017-09-17', '0', 1);
INSERT INTO `encuestas` VALUES (8, 'Encuesta 2010', '2017-09-17', '0', 2);
INSERT INTO `encuestas` VALUES (9, 'encuesta prueba', '2017-09-23', '0', 1);
INSERT INTO `encuestas` VALUES (10, 'Encuesta 2015', '2017-10-06', '0', 1);
INSERT INTO `encuestas` VALUES (11, 'Encuesta tabla', '2017-10-07', '1', 2);
INSERT INTO `encuestas` VALUES (12, 'test', '2017-11-13', '1', 2);
INSERT INTO `encuestas` VALUES (13, 'Test Edit Preguntas', '2017-11-14', '1', 1);

-- ----------------------------
-- Table structure for estudiante
-- ----------------------------
DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` char(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombres` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of estudiante
-- ----------------------------
INSERT INTO `estudiante` VALUES (1, '1206249391', 'suarez guzman kevin');
INSERT INTO `estudiante` VALUES (4, '1234567890', 'Test');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1342 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of opciones
-- ----------------------------
INSERT INTO `opciones` VALUES (16, 'Soltero', 29);
INSERT INTO `opciones` VALUES (17, 'Viudo', 29);
INSERT INTO `opciones` VALUES (18, 'Unión libre', 29);
INSERT INTO `opciones` VALUES (19, 'Casado', 29);
INSERT INTO `opciones` VALUES (20, 'Divorciado', 29);
INSERT INTO `opciones` VALUES (21, 'Separado', 29);
INSERT INTO `opciones` VALUES (22, 'Provincia', 31);
INSERT INTO `opciones` VALUES (23, 'Cantón', 31);
INSERT INTO `opciones` VALUES (24, 'Sector', 31);
INSERT INTO `opciones` VALUES (25, 'Convencional(es)', 32);
INSERT INTO `opciones` VALUES (26, 'Celular(es)', 32);
INSERT INTO `opciones` VALUES (27, 'Masculino', 34);
INSERT INTO `opciones` VALUES (28, 'Femenino', 34);
INSERT INTO `opciones` VALUES (29, 'Padre', 35);
INSERT INTO `opciones` VALUES (30, 'Madre', 35);
INSERT INTO `opciones` VALUES (31, 'Padres', 36);
INSERT INTO `opciones` VALUES (32, 'Tíos', 36);
INSERT INTO `opciones` VALUES (33, 'Hermanos', 36);
INSERT INTO `opciones` VALUES (34, 'Abuelos', 36);
INSERT INTO `opciones` VALUES (35, 'Otros Parientes', 36);
INSERT INTO `opciones` VALUES (36, 'Independiente', 36);
INSERT INTO `opciones` VALUES (37, 'Primaria', 37);
INSERT INTO `opciones` VALUES (38, 'Secundaria', 37);
INSERT INTO `opciones` VALUES (39, 'Superior Universitaria culminada', 37);
INSERT INTO `opciones` VALUES (40, 'Superior Universitaria no culminada', 37);
INSERT INTO `opciones` VALUES (41, 'Posgrado', 37);
INSERT INTO `opciones` VALUES (42, 'Centro de alfabetización', 37);
INSERT INTO `opciones` VALUES (43, 'No sabe, no vive el padre', 37);
INSERT INTO `opciones` VALUES (44, 'Ninguna', 37);
INSERT INTO `opciones` VALUES (45, 'Primaria', 38);
INSERT INTO `opciones` VALUES (46, 'Secundaria', 38);
INSERT INTO `opciones` VALUES (47, 'Superior Universitaria culminada', 38);
INSERT INTO `opciones` VALUES (48, 'Superior Universitaria no culminada', 38);
INSERT INTO `opciones` VALUES (49, 'Posgrado', 38);
INSERT INTO `opciones` VALUES (50, 'Centro de alfabetización', 38);
INSERT INTO `opciones` VALUES (51, 'No sabe, no vive con la madre', 38);
INSERT INTO `opciones` VALUES (52, 'Ninguna', 38);
INSERT INTO `opciones` VALUES (53, 'Si', 39);
INSERT INTO `opciones` VALUES (54, 'No', 39);
INSERT INTO `opciones` VALUES (55, 'Fiscal', 43);
INSERT INTO `opciones` VALUES (56, 'Fiscomisional', 43);
INSERT INTO `opciones` VALUES (57, 'Particular', 43);
INSERT INTO `opciones` VALUES (58, 'Agricultor', 53);
INSERT INTO `opciones` VALUES (59, 'Dependiente del gobierno', 53);
INSERT INTO `opciones` VALUES (60, 'Funcionario público', 53);
INSERT INTO `opciones` VALUES (61, 'Dependientes del comercio, vendedores o similares', 53);
INSERT INTO `opciones` VALUES (62, 'Empresario', 53);
INSERT INTO `opciones` VALUES (63, 'Arquitectos, ingenieros y profesionales similares', 53);
INSERT INTO `opciones` VALUES (64, 'Profesionales de la salud', 53);
INSERT INTO `opciones` VALUES (65, 'Profesionales de la agropecuaria', 53);
INSERT INTO `opciones` VALUES (66, 'Profesionales del Derecho', 53);
INSERT INTO `opciones` VALUES (67, 'Profesor(a) de primaria', 53);
INSERT INTO `opciones` VALUES (68, 'Profesor(a) de secundaria', 53);
INSERT INTO `opciones` VALUES (69, 'Profesor(a) de Universidad', 53);
INSERT INTO `opciones` VALUES (70, 'Otros profesionales de enseñanza', 53);
INSERT INTO `opciones` VALUES (71, 'Legislador', 53);
INSERT INTO `opciones` VALUES (72, 'Director y jefe ejecutivo', 53);
INSERT INTO `opciones` VALUES (73, 'Gerente del departamento', 53);
INSERT INTO `opciones` VALUES (74, 'Empleado de oficina', 53);
INSERT INTO `opciones` VALUES (75, 'Fuerzas Armadas y Policía', 53);
INSERT INTO `opciones` VALUES (76, 'Otra', 53);
INSERT INTO `opciones` VALUES (77, 'Agricultor', 54);
INSERT INTO `opciones` VALUES (78, 'Dependiente del gobierno', 54);
INSERT INTO `opciones` VALUES (79, 'Funcionario público', 54);
INSERT INTO `opciones` VALUES (80, 'Dependientes del comercio, vendedores o similares', 54);
INSERT INTO `opciones` VALUES (81, 'Empresario', 54);
INSERT INTO `opciones` VALUES (82, 'Arquitectos, ingenieros y profesionales similares', 54);
INSERT INTO `opciones` VALUES (83, 'Profesionales de la salud', 54);
INSERT INTO `opciones` VALUES (84, 'Profesionales de la agropecuaria', 54);
INSERT INTO `opciones` VALUES (85, 'Profesionales del Derecho', 54);
INSERT INTO `opciones` VALUES (86, 'Profesor(a) de primaria', 54);
INSERT INTO `opciones` VALUES (87, 'Profesor(a) de secundaria', 54);
INSERT INTO `opciones` VALUES (88, 'Profesor(a) de Universidad', 54);
INSERT INTO `opciones` VALUES (89, 'Otros profesionales de enseñanza', 54);
INSERT INTO `opciones` VALUES (90, 'Legislador', 54);
INSERT INTO `opciones` VALUES (91, 'Director y jefe ejecutivo', 54);
INSERT INTO `opciones` VALUES (92, 'Gerente del departamento', 54);
INSERT INTO `opciones` VALUES (93, 'Empleado de oficina', 54);
INSERT INTO `opciones` VALUES (94, 'Fuerzas Armadas y Policía', 54);
INSERT INTO `opciones` VALUES (95, 'Otra', 54);
INSERT INTO `opciones` VALUES (96, 'Sueldo propio', 55);
INSERT INTO `opciones` VALUES (97, 'Crédito', 55);
INSERT INTO `opciones` VALUES (98, 'Beca', 55);
INSERT INTO `opciones` VALUES (99, 'Otro Padres', 55);
INSERT INTO `opciones` VALUES (100, 'Propia', 57);
INSERT INTO `opciones` VALUES (101, 'Familiar', 57);
INSERT INTO `opciones` VALUES (102, 'Prestada', 57);
INSERT INTO `opciones` VALUES (103, 'Arrendada', 57);
INSERT INTO `opciones` VALUES (104, 'Hipotecada', 57);
INSERT INTO `opciones` VALUES (105, 'Otro', 57);
INSERT INTO `opciones` VALUES (106, 'Agua potable', 58);
INSERT INTO `opciones` VALUES (107, 'Energía eléctrica', 58);
INSERT INTO `opciones` VALUES (108, 'Recolección de basura', 58);
INSERT INTO `opciones` VALUES (109, 'Agua entubada', 58);
INSERT INTO `opciones` VALUES (110, 'Alcantarillado', 58);
INSERT INTO `opciones` VALUES (111, 'Teléfono', 58);
INSERT INTO `opciones` VALUES (112, 'Si', 59);
INSERT INTO `opciones` VALUES (113, 'No', 59);
INSERT INTO `opciones` VALUES (114, 'Auditiva', 60);
INSERT INTO `opciones` VALUES (115, 'Física', 60);
INSERT INTO `opciones` VALUES (116, 'Intelectual', 60);
INSERT INTO `opciones` VALUES (117, 'Visual', 60);
INSERT INTO `opciones` VALUES (118, 'Multidiscapacidad', 60);
INSERT INTO `opciones` VALUES (119, 'Si', 61);
INSERT INTO `opciones` VALUES (120, 'No', 61);
INSERT INTO `opciones` VALUES (121, 'Pública', 62);
INSERT INTO `opciones` VALUES (122, 'Privada', 62);
INSERT INTO `opciones` VALUES (123, 'Universitaria', 62);
INSERT INTO `opciones` VALUES (124, 'Ciencias', 63);
INSERT INTO `opciones` VALUES (125, 'Polivalente', 63);
INSERT INTO `opciones` VALUES (126, 'Técnico', 63);
INSERT INTO `opciones` VALUES (127, 'Artes', 63);
INSERT INTO `opciones` VALUES (128, 'Otro', 63);
INSERT INTO `opciones` VALUES (129, 'Si', 72);
INSERT INTO `opciones` VALUES (130, 'No', 72);
INSERT INTO `opciones` VALUES (131, 'Años', 73);
INSERT INTO `opciones` VALUES (132, 'Meses', 73);
INSERT INTO `opciones` VALUES (133, '1. En muy alto grado', 74);
INSERT INTO `opciones` VALUES (134, '2', 74);
INSERT INTO `opciones` VALUES (135, '3', 74);
INSERT INTO `opciones` VALUES (136, '4', 74);
INSERT INTO `opciones` VALUES (137, '5. De ningún modo', 74);
INSERT INTO `opciones` VALUES (138, '6. No aplica, sin trabajo', 74);
INSERT INTO `opciones` VALUES (139, 'Trabaja', 75);
INSERT INTO `opciones` VALUES (140, 'Estudia', 75);
INSERT INTO `opciones` VALUES (141, 'Ambas', 75);
INSERT INTO `opciones` VALUES (142, 'Ni estudia Ni trabaja', 75);
INSERT INTO `opciones` VALUES (143, 'Antes de graduar', 76);
INSERT INTO `opciones` VALUES (144, 'Menos de 6 meses luego de graduar', 76);
INSERT INTO `opciones` VALUES (145, 'Entre 6 meses y un año luego de graduar', 76);
INSERT INTO `opciones` VALUES (146, 'Más de un año luego de graduar', 76);
INSERT INTO `opciones` VALUES (147, 'Apliqué para un anuncio de vacante', 77);
INSERT INTO `opciones` VALUES (148, 'Contacté empleadores sin saber si había una vacante', 77);
INSERT INTO `opciones` VALUES (149, 'Publiqué mi oferta de servicios', 77);
INSERT INTO `opciones` VALUES (150, 'Fui contactado por un empleador', 77);
INSERT INTO `opciones` VALUES (151, 'Contacté una agencia pública de empleo', 77);
INSERT INTO `opciones` VALUES (152, 'Contacté una agencia comercial de empleo', 77);
INSERT INTO `opciones` VALUES (153, 'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior', 77);
INSERT INTO `opciones` VALUES (154, 'Solicité la ayuda del personal docente de la institución de educación superior', 77);
INSERT INTO `opciones` VALUES (155, 'Establecí contactos mientras trabajaba durante mis estudios', 77);
INSERT INTO `opciones` VALUES (156, 'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)', 77);
INSERT INTO `opciones` VALUES (157, 'Empecé mi propio negocio/ autoempleo', 77);
INSERT INTO `opciones` VALUES (158, 'Ser de universidad de prestigio', 78);
INSERT INTO `opciones` VALUES (159, 'Experiencia laboral en la especialidad', 78);
INSERT INTO `opciones` VALUES (160, 'Expediente académico – Notas - Calificaciones', 78);
INSERT INTO `opciones` VALUES (161, 'Tener título profesional en el área de trabajo', 78);
INSERT INTO `opciones` VALUES (162, 'Aprobar examen', 78);
INSERT INTO `opciones` VALUES (163, 'Experiencia en el extranjero', 78);
INSERT INTO `opciones` VALUES (164, 'Conocimiento de idiomas extranjeros', 78);
INSERT INTO `opciones` VALUES (165, 'Conocimientos de informática', 78);
INSERT INTO `opciones` VALUES (166, 'Habilidades personales', 78);
INSERT INTO `opciones` VALUES (167, 'Entrevista personal', 78);
INSERT INTO `opciones` VALUES (168, 'Por tener convenio con la UTEQ', 78);
INSERT INTO `opciones` VALUES (169, 'Recomendaciones/referencias de terceras personas', 78);
INSERT INTO `opciones` VALUES (170, 'País:', 80);
INSERT INTO `opciones` VALUES (171, 'Provincia:', 80);
INSERT INTO `opciones` VALUES (172, 'Cantón:', 80);
INSERT INTO `opciones` VALUES (173, 'Menos de un año', 87);
INSERT INTO `opciones` VALUES (174, 'Un año', 87);
INSERT INTO `opciones` VALUES (175, 'Dos años', 87);
INSERT INTO `opciones` VALUES (176, 'Tres años ', 87);
INSERT INTO `opciones` VALUES (177, 'Más de tres años', 87);
INSERT INTO `opciones` VALUES (178, 'Menos de un año', 88);
INSERT INTO `opciones` VALUES (179, 'Un año', 88);
INSERT INTO `opciones` VALUES (180, 'Dos años', 88);
INSERT INTO `opciones` VALUES (181, 'Tres años', 88);
INSERT INTO `opciones` VALUES (182, 'Más de tres años', 88);
INSERT INTO `opciones` VALUES (183, 'Técnico', 90);
INSERT INTO `opciones` VALUES (184, 'Jefe de área', 90);
INSERT INTO `opciones` VALUES (185, 'Supervisor ', 90);
INSERT INTO `opciones` VALUES (186, 'Funcionario ', 90);
INSERT INTO `opciones` VALUES (187, 'Directivo', 90);
INSERT INTO `opciones` VALUES (188, 'Empresario', 90);
INSERT INTO `opciones` VALUES (189, 'Nombramiento', 91);
INSERT INTO `opciones` VALUES (190, 'Contrato ', 91);
INSERT INTO `opciones` VALUES (191, 'Eventual', 91);
INSERT INTO `opciones` VALUES (192, '0%', 92);
INSERT INTO `opciones` VALUES (193, '1-20%', 92);
INSERT INTO `opciones` VALUES (194, '21-40%', 92);
INSERT INTO `opciones` VALUES (195, '41-60%', 92);
INSERT INTO `opciones` VALUES (196, '61-80%', 92);
INSERT INTO `opciones` VALUES (197, '81-100%', 92);
INSERT INTO `opciones` VALUES (198, 'Propia', 93);
INSERT INTO `opciones` VALUES (199, 'Pública ', 93);
INSERT INTO `opciones` VALUES (200, 'Privada', 93);
INSERT INTO `opciones` VALUES (201, 'Social-ONG', 93);
INSERT INTO `opciones` VALUES (202, 'Microempresa (1-30 Personas) ', 94);
INSERT INTO `opciones` VALUES (203, 'Pequeña (31-100 Personas) ', 94);
INSERT INTO `opciones` VALUES (204, 'Mediana (101-500 Personas) ', 94);
INSERT INTO `opciones` VALUES (205, 'Grande (más de 500 Personas) ', 94);
INSERT INTO `opciones` VALUES (206, 'Agroindustrial', 95);
INSERT INTO `opciones` VALUES (207, 'Agrícola', 95);
INSERT INTO `opciones` VALUES (208, 'Pecuario', 95);
INSERT INTO `opciones` VALUES (209, 'Pesquero ', 95);
INSERT INTO `opciones` VALUES (210, 'Minero', 95);
INSERT INTO `opciones` VALUES (211, 'Forestal', 95);
INSERT INTO `opciones` VALUES (212, 'Industrial ', 95);
INSERT INTO `opciones` VALUES (213, 'Construcción ', 95);
INSERT INTO `opciones` VALUES (214, 'Petrolero ', 95);
INSERT INTO `opciones` VALUES (215, 'Educativo', 95);
INSERT INTO `opciones` VALUES (216, 'Turismo', 95);
INSERT INTO `opciones` VALUES (217, 'Comercio', 95);
INSERT INTO `opciones` VALUES (218, 'Jurídico', 95);
INSERT INTO `opciones` VALUES (219, 'Informático', 95);
INSERT INTO `opciones` VALUES (220, 'Finanzas ', 95);
INSERT INTO `opciones` VALUES (221, 'De 354 a 500 USD	', 96);
INSERT INTO `opciones` VALUES (222, 'De 501 a 700 USD', 96);
INSERT INTO `opciones` VALUES (223, 'De 701 a 900 USD', 96);
INSERT INTO `opciones` VALUES (224, 'De 901 a 1200 USD', 96);
INSERT INTO `opciones` VALUES (225, 'De 1201 a 1500 USD', 96);
INSERT INTO `opciones` VALUES (226, 'De 1501 a 2000 USD', 96);
INSERT INTO `opciones` VALUES (227, 'De 2001 a 3000 USD', 96);
INSERT INTO `opciones` VALUES (228, 'De 3001 a 5000 USD', 96);
INSERT INTO `opciones` VALUES (229, 'Mayor a 5000 USD', 96);
INSERT INTO `opciones` VALUES (230, 'Tengo un empleo regular / Yo soy trabajador por cuenta propia', 97);
INSERT INTO `opciones` VALUES (231, 'Tengo trabajos ocasionales relacionados con mi estudio', 97);
INSERT INTO `opciones` VALUES (232, 'Tengo trabajos ocasionales NO relacionados con mi estudio', 97);
INSERT INTO `opciones` VALUES (233, 'Tengo más de un trabajo', 97);
INSERT INTO `opciones` VALUES (234, 'Actualmente estoy haciendo servicio militar o civil.', 97);
INSERT INTO `opciones` VALUES (235, 'Capacidad de abstracción, análisis y síntesis', 98);
INSERT INTO `opciones` VALUES (236, 'Capacidad de aplicar los conocimientos en la práctica', 98);
INSERT INTO `opciones` VALUES (237, 'Capacidad para organizar y planificar el tiempo', 98);
INSERT INTO `opciones` VALUES (238, 'Conocimientos sobre el área de estudio y la profesión', 98);
INSERT INTO `opciones` VALUES (239, 'Responsabilidad social y compromiso ciudadano', 98);
INSERT INTO `opciones` VALUES (240, 'Capacidad de comunicación oral  y escrita', 98);
INSERT INTO `opciones` VALUES (241, 'Capacidad de comunicación en un segundo idioma', 98);
INSERT INTO `opciones` VALUES (242, 'Habilidades en el uso de las tecnologías de la información y de la comunicación', 98);
INSERT INTO `opciones` VALUES (243, 'Capacidad de investigación', 98);
INSERT INTO `opciones` VALUES (244, 'Capacidad de aprender y actualizarse permanentemente', 98);
INSERT INTO `opciones` VALUES (245, 'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas', 98);
INSERT INTO `opciones` VALUES (246, 'Capacidad crítica y autocrítica', 98);
INSERT INTO `opciones` VALUES (247, 'Capacidad para actuar en nuevas situaciones', 98);
INSERT INTO `opciones` VALUES (248, 'Capacidad para identificar, plantear y resolver problemas', 98);
INSERT INTO `opciones` VALUES (249, 'Capacidad para tomar decisiones', 98);
INSERT INTO `opciones` VALUES (250, 'Capacidad de trabajo en equipo', 98);
INSERT INTO `opciones` VALUES (251, 'Habilidades interpersonales', 98);
INSERT INTO `opciones` VALUES (252, 'Capacidad de motivar y conducir hacia metas comunes', 98);
INSERT INTO `opciones` VALUES (253, 'Compromiso con la preservación del medio ambiente', 98);
INSERT INTO `opciones` VALUES (254, 'Capacidad creativa', 98);
INSERT INTO `opciones` VALUES (255, 'Compromiso con su medio socio-cultural', 98);
INSERT INTO `opciones` VALUES (256, 'Valoración y respecto por la diversidad y multiculturalidad', 98);
INSERT INTO `opciones` VALUES (257, 'Habilidad para trabajar en contextos internacionales', 98);
INSERT INTO `opciones` VALUES (258, 'Habilidad para trabajar en forma autónoma', 98);
INSERT INTO `opciones` VALUES (259, 'Capacidad para formular y gestionar proyectos', 98);
INSERT INTO `opciones` VALUES (260, 'Compromiso ético', 98);
INSERT INTO `opciones` VALUES (261, 'Compromiso con la calidad', 98);
INSERT INTO `opciones` VALUES (262, '1. Peor de lo que me esperaba', 99);
INSERT INTO `opciones` VALUES (263, '2.', 99);
INSERT INTO `opciones` VALUES (264, '3.', 99);
INSERT INTO `opciones` VALUES (265, '4.', 99);
INSERT INTO `opciones` VALUES (266, '5. Mucho mejor de lo que me esperaba', 99);
INSERT INTO `opciones` VALUES (267, '0. No he tenido ninguna expectativa', 99);
INSERT INTO `opciones` VALUES (268, '1. Nada en absoluto', 100);
INSERT INTO `opciones` VALUES (269, '2.', 100);
INSERT INTO `opciones` VALUES (270, '3.', 100);
INSERT INTO `opciones` VALUES (271, '4.', 100);
INSERT INTO `opciones` VALUES (272, '5. En un grado muy alto', 100);
INSERT INTO `opciones` VALUES (273, 'No aplicable, considero que mi trabajo se corresponde con mis estudios', 101);
INSERT INTO `opciones` VALUES (274, 'Todavía no he encontrado un trabajo más apropiado', 101);
INSERT INTO `opciones` VALUES (275, 'Haciendo este trabajo tengo mejores perspectivas profesionales. ', 101);
INSERT INTO `opciones` VALUES (276, 'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ', 101);
INSERT INTO `opciones` VALUES (277, 'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ', 101);
INSERT INTO `opciones` VALUES (278, 'Consigo ingresos más altos con mi trabajo actual. ', 101);
INSERT INTO `opciones` VALUES (279, 'Mi trabajo actual me ofrece seguridad. ', 101);
INSERT INTO `opciones` VALUES (280, 'Mi trabajo actual es interesante. ', 101);
INSERT INTO `opciones` VALUES (281, 'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ', 101);
INSERT INTO `opciones` VALUES (282, 'Mi trabajo actual me permite trabajar en la localidad que prefiero.', 101);
INSERT INTO `opciones` VALUES (283, 'Mi trabajo actual me permite atender las obligaciones familiares.', 101);
INSERT INTO `opciones` VALUES (284, 'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.', 101);
INSERT INTO `opciones` VALUES (285, 'Muy satisfecho', 102);
INSERT INTO `opciones` VALUES (286, 'Satisfecho', 102);
INSERT INTO `opciones` VALUES (287, 'Poco satisfecho', 102);
INSERT INTO `opciones` VALUES (288, 'No satisfecho', 102);
INSERT INTO `opciones` VALUES (289, 'Excelente', 104);
INSERT INTO `opciones` VALUES (290, 'Muy buenos', 104);
INSERT INTO `opciones` VALUES (291, 'Buenos', 104);
INSERT INTO `opciones` VALUES (292, 'Regulares', 104);
INSERT INTO `opciones` VALUES (293, 'Deficientes', 104);
INSERT INTO `opciones` VALUES (294, 'Excelente', 105);
INSERT INTO `opciones` VALUES (295, 'Muy buenos', 105);
INSERT INTO `opciones` VALUES (296, 'Buenos', 105);
INSERT INTO `opciones` VALUES (297, 'Regulares', 105);
INSERT INTO `opciones` VALUES (298, 'Deficientes', 105);
INSERT INTO `opciones` VALUES (299, 'Excelentes', 106);
INSERT INTO `opciones` VALUES (300, 'Muy buenos', 106);
INSERT INTO `opciones` VALUES (301, 'Buenos', 106);
INSERT INTO `opciones` VALUES (302, 'Regulares', 106);
INSERT INTO `opciones` VALUES (303, 'Deficientes', 106);
INSERT INTO `opciones` VALUES (304, 'Constantemente', 107);
INSERT INTO `opciones` VALUES (305, 'Rara vez', 107);
INSERT INTO `opciones` VALUES (306, 'Nunca ', 107);
INSERT INTO `opciones` VALUES (307, '1. Nada apropiado', 111);
INSERT INTO `opciones` VALUES (308, '2.', 111);
INSERT INTO `opciones` VALUES (309, '3.', 111);
INSERT INTO `opciones` VALUES (310, '4.', 111);
INSERT INTO `opciones` VALUES (311, '5. Completamente apropiado', 111);
INSERT INTO `opciones` VALUES (312, 'Constantemente', 113);
INSERT INTO `opciones` VALUES (313, 'Rara vez', 113);
INSERT INTO `opciones` VALUES (314, 'Nunca', 113);
INSERT INTO `opciones` VALUES (315, 'Si', 114);
INSERT INTO `opciones` VALUES (316, 'No', 114);
INSERT INTO `opciones` VALUES (317, 'Conferencia académica', 115);
INSERT INTO `opciones` VALUES (318, 'Revista no indexada', 115);
INSERT INTO `opciones` VALUES (319, 'Informe técnico', 115);
INSERT INTO `opciones` VALUES (320, 'Revista indexada (latindex, scielo, isi/jcr, scopus)', 115);
INSERT INTO `opciones` VALUES (321, 'Si', 116);
INSERT INTO `opciones` VALUES (322, 'No', 116);
INSERT INTO `opciones` VALUES (323, '1 mod', 120);
INSERT INTO `opciones` VALUES (324, '2 mod', 120);
INSERT INTO `opciones` VALUES (325, 'Ing. Sistemas', 66);
INSERT INTO `opciones` VALUES (326, 'Ing. Diseño Grafico', 66);
INSERT INTO `opciones` VALUES (327, 'Ing. Agroindustrial', 66);
INSERT INTO `opciones` VALUES (328, 'Ing. Telematica', 66);
INSERT INTO `opciones` VALUES (329, 'Ing. Seguridad Industrial', 66);
INSERT INTO `opciones` VALUES (330, 'F. Ciencias de la Ingenieria', 71);
INSERT INTO `opciones` VALUES (331, 'F. Ciencias Empresariales', 71);
INSERT INTO `opciones` VALUES (332, 'F. Ciencias Ambientales', 71);
INSERT INTO `opciones` VALUES (333, 'F. Ciencias Agrarias', 71);
INSERT INTO `opciones` VALUES (334, 'F. Ciencias Pecuarias', 71);
INSERT INTO `opciones` VALUES (335, 'Ud. Estudios a Distancia', 71);
INSERT INTO `opciones` VALUES (336, 'Soltero', 307);
INSERT INTO `opciones` VALUES (337, 'Viudo', 307);
INSERT INTO `opciones` VALUES (338, 'Unión libre', 307);
INSERT INTO `opciones` VALUES (339, 'Casado', 307);
INSERT INTO `opciones` VALUES (340, 'Divorciado', 307);
INSERT INTO `opciones` VALUES (341, 'Separado', 307);
INSERT INTO `opciones` VALUES (342, 'Provincia', 309);
INSERT INTO `opciones` VALUES (343, 'Cantón', 309);
INSERT INTO `opciones` VALUES (344, 'Sector', 309);
INSERT INTO `opciones` VALUES (345, 'Convencional(es)', 310);
INSERT INTO `opciones` VALUES (346, 'Celular(es)', 310);
INSERT INTO `opciones` VALUES (347, 'Masculino', 312);
INSERT INTO `opciones` VALUES (348, 'Femenino', 312);
INSERT INTO `opciones` VALUES (349, 'Padre', 313);
INSERT INTO `opciones` VALUES (350, 'Madre', 313);
INSERT INTO `opciones` VALUES (351, 'Padres', 314);
INSERT INTO `opciones` VALUES (352, 'Tíos', 314);
INSERT INTO `opciones` VALUES (353, 'Hermanos', 314);
INSERT INTO `opciones` VALUES (354, 'Abuelos', 314);
INSERT INTO `opciones` VALUES (355, 'Otros Parientes', 314);
INSERT INTO `opciones` VALUES (356, 'Independiente', 314);
INSERT INTO `opciones` VALUES (357, 'Primaria', 315);
INSERT INTO `opciones` VALUES (358, 'Secundaria', 315);
INSERT INTO `opciones` VALUES (359, 'Superior Universitaria culminada', 315);
INSERT INTO `opciones` VALUES (360, 'Superior Universitaria no culminada', 315);
INSERT INTO `opciones` VALUES (361, 'Posgrado', 315);
INSERT INTO `opciones` VALUES (362, 'Centro de alfabetización', 315);
INSERT INTO `opciones` VALUES (363, 'No sabe, no vive el padre', 315);
INSERT INTO `opciones` VALUES (364, 'Ninguna', 315);
INSERT INTO `opciones` VALUES (365, 'Primaria', 316);
INSERT INTO `opciones` VALUES (366, 'Secundaria', 316);
INSERT INTO `opciones` VALUES (367, 'Superior Universitaria culminada', 316);
INSERT INTO `opciones` VALUES (368, 'Superior Universitaria no culminada', 316);
INSERT INTO `opciones` VALUES (369, 'Posgrado', 316);
INSERT INTO `opciones` VALUES (370, 'Centro de alfabetización', 316);
INSERT INTO `opciones` VALUES (371, 'No sabe, no vive con la madre', 316);
INSERT INTO `opciones` VALUES (372, 'Ninguna', 316);
INSERT INTO `opciones` VALUES (373, 'Si', 317);
INSERT INTO `opciones` VALUES (374, 'No', 317);
INSERT INTO `opciones` VALUES (375, 'Fiscal', 321);
INSERT INTO `opciones` VALUES (376, 'Fiscomisional', 321);
INSERT INTO `opciones` VALUES (377, 'Particular', 321);
INSERT INTO `opciones` VALUES (378, 'Agricultor', 330);
INSERT INTO `opciones` VALUES (379, 'Dependiente del gobierno', 330);
INSERT INTO `opciones` VALUES (380, 'Funcionario público', 330);
INSERT INTO `opciones` VALUES (381, 'Dependientes del comercio, vendedores o similares', 330);
INSERT INTO `opciones` VALUES (382, 'Empresario', 330);
INSERT INTO `opciones` VALUES (383, 'Arquitectos, ingenieros y profesionales similares', 330);
INSERT INTO `opciones` VALUES (384, 'Profesionales de la salud', 330);
INSERT INTO `opciones` VALUES (385, 'Profesionales de la agropecuaria', 330);
INSERT INTO `opciones` VALUES (386, 'Profesionales del Derecho', 330);
INSERT INTO `opciones` VALUES (387, 'Profesor(a) de primaria', 330);
INSERT INTO `opciones` VALUES (388, 'Profesor(a) de secundaria', 330);
INSERT INTO `opciones` VALUES (389, 'Profesor(a) de Universidad', 330);
INSERT INTO `opciones` VALUES (390, 'Otros profesionales de enseñanza', 330);
INSERT INTO `opciones` VALUES (391, 'Legislador', 330);
INSERT INTO `opciones` VALUES (392, 'Director y jefe ejecutivo', 330);
INSERT INTO `opciones` VALUES (393, 'Gerente del departamento', 330);
INSERT INTO `opciones` VALUES (394, 'Empleado de oficina', 330);
INSERT INTO `opciones` VALUES (395, 'Fuerzas Armadas y Policía', 330);
INSERT INTO `opciones` VALUES (396, 'Otra', 330);
INSERT INTO `opciones` VALUES (397, 'Agricultor', 331);
INSERT INTO `opciones` VALUES (398, 'Dependiente del gobierno', 331);
INSERT INTO `opciones` VALUES (399, 'Funcionario público', 331);
INSERT INTO `opciones` VALUES (400, 'Dependientes del comercio, vendedores o similares', 331);
INSERT INTO `opciones` VALUES (401, 'Empresario', 331);
INSERT INTO `opciones` VALUES (402, 'Arquitectos, ingenieros y profesionales similares', 331);
INSERT INTO `opciones` VALUES (403, 'Profesionales de la salud', 331);
INSERT INTO `opciones` VALUES (404, 'Profesionales de la agropecuaria', 331);
INSERT INTO `opciones` VALUES (405, 'Profesionales del Derecho', 331);
INSERT INTO `opciones` VALUES (406, 'Profesor(a) de primaria', 331);
INSERT INTO `opciones` VALUES (407, 'Profesor(a) de secundaria', 331);
INSERT INTO `opciones` VALUES (408, 'Profesor(a) de Universidad', 331);
INSERT INTO `opciones` VALUES (409, 'Otros profesionales de enseñanza', 331);
INSERT INTO `opciones` VALUES (410, 'Legislador', 331);
INSERT INTO `opciones` VALUES (411, 'Director y jefe ejecutivo', 331);
INSERT INTO `opciones` VALUES (412, 'Gerente del departamento', 331);
INSERT INTO `opciones` VALUES (413, 'Empleado de oficina', 331);
INSERT INTO `opciones` VALUES (414, 'Fuerzas Armadas y Policía', 331);
INSERT INTO `opciones` VALUES (415, 'Otra', 331);
INSERT INTO `opciones` VALUES (416, 'Sueldo propio', 332);
INSERT INTO `opciones` VALUES (417, 'Crédito', 332);
INSERT INTO `opciones` VALUES (418, 'Beca', 332);
INSERT INTO `opciones` VALUES (419, 'Otro Padres', 332);
INSERT INTO `opciones` VALUES (420, 'Propia', 334);
INSERT INTO `opciones` VALUES (421, 'Familiar', 334);
INSERT INTO `opciones` VALUES (422, 'Prestada', 334);
INSERT INTO `opciones` VALUES (423, 'Arrendada', 334);
INSERT INTO `opciones` VALUES (424, 'Hipotecada', 334);
INSERT INTO `opciones` VALUES (425, 'Otro', 334);
INSERT INTO `opciones` VALUES (426, 'Agua potable', 335);
INSERT INTO `opciones` VALUES (427, 'Energía eléctrica', 335);
INSERT INTO `opciones` VALUES (428, 'Recolección de basura', 335);
INSERT INTO `opciones` VALUES (429, 'Agua entubada', 335);
INSERT INTO `opciones` VALUES (430, 'Alcantarillado', 335);
INSERT INTO `opciones` VALUES (431, 'Teléfono', 335);
INSERT INTO `opciones` VALUES (432, 'Si', 336);
INSERT INTO `opciones` VALUES (433, 'No', 336);
INSERT INTO `opciones` VALUES (434, 'Auditiva', 337);
INSERT INTO `opciones` VALUES (435, 'Física', 337);
INSERT INTO `opciones` VALUES (436, 'Intelectual', 337);
INSERT INTO `opciones` VALUES (437, 'Visual', 337);
INSERT INTO `opciones` VALUES (438, 'Multidiscapacidad', 337);
INSERT INTO `opciones` VALUES (439, 'Si', 338);
INSERT INTO `opciones` VALUES (440, 'No', 338);
INSERT INTO `opciones` VALUES (441, 'Pública', 339);
INSERT INTO `opciones` VALUES (442, 'Privada', 339);
INSERT INTO `opciones` VALUES (443, 'Universitaria', 339);
INSERT INTO `opciones` VALUES (444, 'Ciencias', 340);
INSERT INTO `opciones` VALUES (445, 'Polivalente', 340);
INSERT INTO `opciones` VALUES (446, 'Técnico', 340);
INSERT INTO `opciones` VALUES (447, 'Artes', 340);
INSERT INTO `opciones` VALUES (448, 'Otro', 340);
INSERT INTO `opciones` VALUES (449, 'Ing. Sistemas', 343);
INSERT INTO `opciones` VALUES (450, 'Ing. Diseño Grafico', 343);
INSERT INTO `opciones` VALUES (451, 'Ing. Agroindustrial', 343);
INSERT INTO `opciones` VALUES (452, 'Ing. Telematica', 343);
INSERT INTO `opciones` VALUES (453, 'Ing. Seguridad Industrial', 343);
INSERT INTO `opciones` VALUES (454, 'F. Ciencias de la Ingenieria', 348);
INSERT INTO `opciones` VALUES (455, 'F. Ciencias Empresariales', 348);
INSERT INTO `opciones` VALUES (456, 'F. Ciencias Ambientales', 348);
INSERT INTO `opciones` VALUES (457, 'F. Ciencias Agrarias', 348);
INSERT INTO `opciones` VALUES (458, 'F. Ciencias Pecuarias', 348);
INSERT INTO `opciones` VALUES (459, 'Ud. Estudios a Distancia', 348);
INSERT INTO `opciones` VALUES (460, 'Si', 349);
INSERT INTO `opciones` VALUES (461, 'No', 349);
INSERT INTO `opciones` VALUES (462, 'Años', 350);
INSERT INTO `opciones` VALUES (463, 'Meses', 350);
INSERT INTO `opciones` VALUES (464, '1. En muy alto grado', 351);
INSERT INTO `opciones` VALUES (465, '2', 351);
INSERT INTO `opciones` VALUES (466, '3', 351);
INSERT INTO `opciones` VALUES (467, '4', 351);
INSERT INTO `opciones` VALUES (468, '5. De ningún modo', 351);
INSERT INTO `opciones` VALUES (469, '6. No aplica, sin trabajo', 351);
INSERT INTO `opciones` VALUES (470, 'Trabaja', 352);
INSERT INTO `opciones` VALUES (471, 'Estudia', 352);
INSERT INTO `opciones` VALUES (472, 'Ambas', 352);
INSERT INTO `opciones` VALUES (473, 'Ni estudia Ni trabaja', 352);
INSERT INTO `opciones` VALUES (474, 'Antes de graduar', 353);
INSERT INTO `opciones` VALUES (475, 'Menos de 6 meses luego de graduar', 353);
INSERT INTO `opciones` VALUES (476, 'Entre 6 meses y un año luego de graduar', 353);
INSERT INTO `opciones` VALUES (477, 'Más de un año luego de graduar', 353);
INSERT INTO `opciones` VALUES (478, 'Apliqué para un anuncio de vacante', 354);
INSERT INTO `opciones` VALUES (479, 'Contacté empleadores sin saber si había una vacante', 354);
INSERT INTO `opciones` VALUES (480, 'Publiqué mi oferta de servicios', 354);
INSERT INTO `opciones` VALUES (481, 'Fui contactado por un empleador', 354);
INSERT INTO `opciones` VALUES (482, 'Contacté una agencia pública de empleo', 354);
INSERT INTO `opciones` VALUES (483, 'Contacté una agencia comercial de empleo', 354);
INSERT INTO `opciones` VALUES (484, 'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior', 354);
INSERT INTO `opciones` VALUES (485, 'Solicité la ayuda del personal docente de la institución de educación superior', 354);
INSERT INTO `opciones` VALUES (486, 'Establecí contactos mientras trabajaba durante mis estudios', 354);
INSERT INTO `opciones` VALUES (487, 'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)', 354);
INSERT INTO `opciones` VALUES (488, 'Empecé mi propio negocio/ autoempleo', 354);
INSERT INTO `opciones` VALUES (489, 'Ser de universidad de prestigio', 355);
INSERT INTO `opciones` VALUES (490, 'Experiencia laboral en la especialidad', 355);
INSERT INTO `opciones` VALUES (491, 'Expediente académico – Notas - Calificaciones', 355);
INSERT INTO `opciones` VALUES (492, 'Tener título profesional en el área de trabajo', 355);
INSERT INTO `opciones` VALUES (493, 'Aprobar examen', 355);
INSERT INTO `opciones` VALUES (494, 'Experiencia en el extranjero', 355);
INSERT INTO `opciones` VALUES (495, 'Conocimiento de idiomas extranjeros', 355);
INSERT INTO `opciones` VALUES (496, 'Conocimientos de informática', 355);
INSERT INTO `opciones` VALUES (497, 'Habilidades personales', 355);
INSERT INTO `opciones` VALUES (498, 'Entrevista personal', 355);
INSERT INTO `opciones` VALUES (499, 'Por tener convenio con la UTEQ', 355);
INSERT INTO `opciones` VALUES (500, 'Recomendaciones/referencias de terceras personas', 355);
INSERT INTO `opciones` VALUES (501, 'País:', 357);
INSERT INTO `opciones` VALUES (502, 'Provincia:', 357);
INSERT INTO `opciones` VALUES (503, 'Cantón:', 357);
INSERT INTO `opciones` VALUES (504, 'Menos de un año', 362);
INSERT INTO `opciones` VALUES (505, 'Un año', 362);
INSERT INTO `opciones` VALUES (506, 'Dos años', 362);
INSERT INTO `opciones` VALUES (507, 'Tres años ', 362);
INSERT INTO `opciones` VALUES (508, 'Más de tres años', 362);
INSERT INTO `opciones` VALUES (509, 'Menos de un año', 363);
INSERT INTO `opciones` VALUES (510, 'Un año', 363);
INSERT INTO `opciones` VALUES (511, 'Dos años', 363);
INSERT INTO `opciones` VALUES (512, 'Tres años', 363);
INSERT INTO `opciones` VALUES (513, 'Más de tres años', 363);
INSERT INTO `opciones` VALUES (514, 'Técnico', 364);
INSERT INTO `opciones` VALUES (515, 'Jefe de área', 364);
INSERT INTO `opciones` VALUES (516, 'Supervisor ', 364);
INSERT INTO `opciones` VALUES (517, 'Funcionario ', 364);
INSERT INTO `opciones` VALUES (518, 'Directivo', 364);
INSERT INTO `opciones` VALUES (519, 'Empresario', 364);
INSERT INTO `opciones` VALUES (520, 'Nombramiento', 365);
INSERT INTO `opciones` VALUES (521, 'Contrato ', 365);
INSERT INTO `opciones` VALUES (522, 'Eventual', 365);
INSERT INTO `opciones` VALUES (523, '0%', 366);
INSERT INTO `opciones` VALUES (524, '1-20%', 366);
INSERT INTO `opciones` VALUES (525, '21-40%', 366);
INSERT INTO `opciones` VALUES (526, '41-60%', 366);
INSERT INTO `opciones` VALUES (527, '61-80%', 366);
INSERT INTO `opciones` VALUES (528, '81-100%', 366);
INSERT INTO `opciones` VALUES (529, 'Propia', 367);
INSERT INTO `opciones` VALUES (530, 'Pública ', 367);
INSERT INTO `opciones` VALUES (531, 'Privada', 367);
INSERT INTO `opciones` VALUES (532, 'Social-ONG', 367);
INSERT INTO `opciones` VALUES (533, 'Microempresa (1-30 Personas) ', 368);
INSERT INTO `opciones` VALUES (534, 'Pequeña (31-100 Personas) ', 368);
INSERT INTO `opciones` VALUES (535, 'Mediana (101-500 Personas) ', 368);
INSERT INTO `opciones` VALUES (536, 'Grande (más de 500 Personas) ', 368);
INSERT INTO `opciones` VALUES (537, 'Agroindustrial', 369);
INSERT INTO `opciones` VALUES (538, 'Agrícola', 369);
INSERT INTO `opciones` VALUES (539, 'Pecuario', 369);
INSERT INTO `opciones` VALUES (540, 'Pesquero ', 369);
INSERT INTO `opciones` VALUES (541, 'Minero', 369);
INSERT INTO `opciones` VALUES (542, 'Forestal', 369);
INSERT INTO `opciones` VALUES (543, 'Industrial ', 369);
INSERT INTO `opciones` VALUES (544, 'Construcción ', 369);
INSERT INTO `opciones` VALUES (545, 'Petrolero ', 369);
INSERT INTO `opciones` VALUES (546, 'Educativo', 369);
INSERT INTO `opciones` VALUES (547, 'Turismo', 369);
INSERT INTO `opciones` VALUES (548, 'Comercio', 369);
INSERT INTO `opciones` VALUES (549, 'Jurídico', 369);
INSERT INTO `opciones` VALUES (550, 'Informático', 369);
INSERT INTO `opciones` VALUES (551, 'Finanzas ', 369);
INSERT INTO `opciones` VALUES (552, 'De 354 a 500 USD	', 370);
INSERT INTO `opciones` VALUES (553, 'De 501 a 700 USD', 370);
INSERT INTO `opciones` VALUES (554, 'De 701 a 900 USD', 370);
INSERT INTO `opciones` VALUES (555, 'De 901 a 1200 USD', 370);
INSERT INTO `opciones` VALUES (556, 'De 1201 a 1500 USD', 370);
INSERT INTO `opciones` VALUES (557, 'De 1501 a 2000 USD', 370);
INSERT INTO `opciones` VALUES (558, 'De 2001 a 3000 USD', 370);
INSERT INTO `opciones` VALUES (559, 'De 3001 a 5000 USD', 370);
INSERT INTO `opciones` VALUES (560, 'Mayor a 5000 USD', 370);
INSERT INTO `opciones` VALUES (561, 'Tengo un empleo regular / Yo soy trabajador por cuenta propia', 371);
INSERT INTO `opciones` VALUES (562, 'Tengo trabajos ocasionales relacionados con mi estudio', 371);
INSERT INTO `opciones` VALUES (563, 'Tengo trabajos ocasionales NO relacionados con mi estudio', 371);
INSERT INTO `opciones` VALUES (564, 'Tengo más de un trabajo', 371);
INSERT INTO `opciones` VALUES (565, 'Actualmente estoy haciendo servicio militar o civil.', 371);
INSERT INTO `opciones` VALUES (566, 'Capacidad de abstracción, análisis y síntesis', 372);
INSERT INTO `opciones` VALUES (567, 'Capacidad de aplicar los conocimientos en la práctica', 372);
INSERT INTO `opciones` VALUES (568, 'Capacidad para organizar y planificar el tiempo', 372);
INSERT INTO `opciones` VALUES (569, 'Conocimientos sobre el área de estudio y la profesión', 372);
INSERT INTO `opciones` VALUES (570, 'Responsabilidad social y compromiso ciudadano', 372);
INSERT INTO `opciones` VALUES (571, 'Capacidad de comunicación oral  y escrita', 372);
INSERT INTO `opciones` VALUES (572, 'Capacidad de comunicación en un segundo idioma', 372);
INSERT INTO `opciones` VALUES (573, 'Habilidades en el uso de las tecnologías de la información y de la comunicación', 372);
INSERT INTO `opciones` VALUES (574, 'Capacidad de investigación', 372);
INSERT INTO `opciones` VALUES (575, 'Capacidad de aprender y actualizarse permanentemente', 372);
INSERT INTO `opciones` VALUES (576, 'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas', 372);
INSERT INTO `opciones` VALUES (577, 'Capacidad crítica y autocrítica', 372);
INSERT INTO `opciones` VALUES (578, 'Capacidad para actuar en nuevas situaciones', 372);
INSERT INTO `opciones` VALUES (579, 'Capacidad para identificar, plantear y resolver problemas', 372);
INSERT INTO `opciones` VALUES (580, 'Capacidad para tomar decisiones', 372);
INSERT INTO `opciones` VALUES (581, 'Capacidad de trabajo en equipo', 372);
INSERT INTO `opciones` VALUES (582, 'Habilidades interpersonales', 372);
INSERT INTO `opciones` VALUES (583, 'Capacidad de motivar y conducir hacia metas comunes', 372);
INSERT INTO `opciones` VALUES (584, 'Compromiso con la preservación del medio ambiente', 372);
INSERT INTO `opciones` VALUES (585, 'Capacidad creativa', 372);
INSERT INTO `opciones` VALUES (586, 'Compromiso con su medio socio-cultural', 372);
INSERT INTO `opciones` VALUES (587, 'Valoración y respecto por la diversidad y multiculturalidad', 372);
INSERT INTO `opciones` VALUES (588, 'Habilidad para trabajar en contextos internacionales', 372);
INSERT INTO `opciones` VALUES (589, 'Habilidad para trabajar en forma autónoma', 372);
INSERT INTO `opciones` VALUES (590, 'Capacidad para formular y gestionar proyectos', 372);
INSERT INTO `opciones` VALUES (591, 'Compromiso ético', 372);
INSERT INTO `opciones` VALUES (592, 'Compromiso con la calidad', 372);
INSERT INTO `opciones` VALUES (593, '1. Peor de lo que me esperaba', 373);
INSERT INTO `opciones` VALUES (594, '2.', 373);
INSERT INTO `opciones` VALUES (595, '3.', 373);
INSERT INTO `opciones` VALUES (596, '4.', 373);
INSERT INTO `opciones` VALUES (597, '5. Mucho mejor de lo que me esperaba', 373);
INSERT INTO `opciones` VALUES (598, '0. No he tenido ninguna expectativa', 373);
INSERT INTO `opciones` VALUES (599, '1. Nada en absoluto', 374);
INSERT INTO `opciones` VALUES (600, '2.', 374);
INSERT INTO `opciones` VALUES (601, '3.', 374);
INSERT INTO `opciones` VALUES (602, '4.', 374);
INSERT INTO `opciones` VALUES (603, '5. En un grado muy alto', 374);
INSERT INTO `opciones` VALUES (604, 'No aplicable, considero que mi trabajo se corresponde con mis estudios', 375);
INSERT INTO `opciones` VALUES (605, 'Todavía no he encontrado un trabajo más apropiado', 375);
INSERT INTO `opciones` VALUES (606, 'Haciendo este trabajo tengo mejores perspectivas profesionales. ', 375);
INSERT INTO `opciones` VALUES (607, 'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ', 375);
INSERT INTO `opciones` VALUES (608, 'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ', 375);
INSERT INTO `opciones` VALUES (609, 'Consigo ingresos más altos con mi trabajo actual. ', 375);
INSERT INTO `opciones` VALUES (610, 'Mi trabajo actual me ofrece seguridad. ', 375);
INSERT INTO `opciones` VALUES (611, 'Mi trabajo actual es interesante. ', 375);
INSERT INTO `opciones` VALUES (612, 'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ', 375);
INSERT INTO `opciones` VALUES (613, 'Mi trabajo actual me permite trabajar en la localidad que prefiero.', 375);
INSERT INTO `opciones` VALUES (614, 'Mi trabajo actual me permite atender las obligaciones familiares.', 375);
INSERT INTO `opciones` VALUES (615, 'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.', 375);
INSERT INTO `opciones` VALUES (616, 'Muy satisfecho', 376);
INSERT INTO `opciones` VALUES (617, 'Satisfecho', 376);
INSERT INTO `opciones` VALUES (618, 'Poco satisfecho', 376);
INSERT INTO `opciones` VALUES (619, 'No satisfecho', 376);
INSERT INTO `opciones` VALUES (620, 'Excelente', 378);
INSERT INTO `opciones` VALUES (621, 'Muy buenos', 378);
INSERT INTO `opciones` VALUES (622, 'Buenos', 378);
INSERT INTO `opciones` VALUES (623, 'Regulares', 378);
INSERT INTO `opciones` VALUES (624, 'Deficientes', 378);
INSERT INTO `opciones` VALUES (625, 'Excelente', 379);
INSERT INTO `opciones` VALUES (626, 'Muy buenos', 379);
INSERT INTO `opciones` VALUES (627, 'Buenos', 379);
INSERT INTO `opciones` VALUES (628, 'Regulares', 379);
INSERT INTO `opciones` VALUES (629, 'Deficientes', 379);
INSERT INTO `opciones` VALUES (630, 'Excelentes', 380);
INSERT INTO `opciones` VALUES (631, 'Muy buenos', 380);
INSERT INTO `opciones` VALUES (632, 'Buenos', 380);
INSERT INTO `opciones` VALUES (633, 'Regulares', 380);
INSERT INTO `opciones` VALUES (634, 'Deficientes', 380);
INSERT INTO `opciones` VALUES (635, 'Constantemente', 381);
INSERT INTO `opciones` VALUES (636, 'Rara vez', 381);
INSERT INTO `opciones` VALUES (637, 'Nunca ', 381);
INSERT INTO `opciones` VALUES (638, '1. Nada apropiado', 385);
INSERT INTO `opciones` VALUES (639, '2.', 385);
INSERT INTO `opciones` VALUES (640, '3.', 385);
INSERT INTO `opciones` VALUES (641, '4.', 385);
INSERT INTO `opciones` VALUES (642, '5. Completamente apropiado', 385);
INSERT INTO `opciones` VALUES (643, 'Constantemente', 387);
INSERT INTO `opciones` VALUES (644, 'Rara vez', 387);
INSERT INTO `opciones` VALUES (645, 'Nunca', 387);
INSERT INTO `opciones` VALUES (646, 'Si', 388);
INSERT INTO `opciones` VALUES (647, 'No', 388);
INSERT INTO `opciones` VALUES (648, 'Conferencia académica', 389);
INSERT INTO `opciones` VALUES (649, 'Revista no indexada', 389);
INSERT INTO `opciones` VALUES (650, 'Informe técnico', 389);
INSERT INTO `opciones` VALUES (651, 'Revista indexada (latindex, scielo, isi/jcr, scopus)', 389);
INSERT INTO `opciones` VALUES (652, 'Si', 390);
INSERT INTO `opciones` VALUES (653, 'No', 390);
INSERT INTO `opciones` VALUES (654, '1 mod', 391);
INSERT INTO `opciones` VALUES (655, '2 mod', 391);
INSERT INTO `opciones` VALUES (656, 'Soltero', 396);
INSERT INTO `opciones` VALUES (657, 'Viudo', 396);
INSERT INTO `opciones` VALUES (658, 'Unión libre', 396);
INSERT INTO `opciones` VALUES (659, 'Casado', 396);
INSERT INTO `opciones` VALUES (660, 'Divorciado', 396);
INSERT INTO `opciones` VALUES (661, 'Separado', 396);
INSERT INTO `opciones` VALUES (662, 'Provincia', 398);
INSERT INTO `opciones` VALUES (663, 'Cantón', 398);
INSERT INTO `opciones` VALUES (664, 'Sector', 398);
INSERT INTO `opciones` VALUES (665, 'Convencional(es)', 399);
INSERT INTO `opciones` VALUES (666, 'Celular(es)', 399);
INSERT INTO `opciones` VALUES (667, 'Masculino', 401);
INSERT INTO `opciones` VALUES (668, 'Femenino', 401);
INSERT INTO `opciones` VALUES (669, 'Padre', 402);
INSERT INTO `opciones` VALUES (670, 'Madre', 402);
INSERT INTO `opciones` VALUES (671, 'Padres', 403);
INSERT INTO `opciones` VALUES (672, 'Tíos', 403);
INSERT INTO `opciones` VALUES (673, 'Hermanos', 403);
INSERT INTO `opciones` VALUES (674, 'Abuelos', 403);
INSERT INTO `opciones` VALUES (675, 'Otros Parientes', 403);
INSERT INTO `opciones` VALUES (676, 'Independiente', 403);
INSERT INTO `opciones` VALUES (677, 'Primaria', 404);
INSERT INTO `opciones` VALUES (678, 'Secundaria', 404);
INSERT INTO `opciones` VALUES (679, 'Superior Universitaria culminada', 404);
INSERT INTO `opciones` VALUES (680, 'Superior Universitaria no culminada', 404);
INSERT INTO `opciones` VALUES (681, 'Posgrado', 404);
INSERT INTO `opciones` VALUES (682, 'Centro de alfabetización', 404);
INSERT INTO `opciones` VALUES (683, 'No sabe, no vive el padre', 404);
INSERT INTO `opciones` VALUES (684, 'Ninguna', 404);
INSERT INTO `opciones` VALUES (685, 'Primaria', 405);
INSERT INTO `opciones` VALUES (686, 'Secundaria', 405);
INSERT INTO `opciones` VALUES (687, 'Superior Universitaria culminada', 405);
INSERT INTO `opciones` VALUES (688, 'Superior Universitaria no culminada', 405);
INSERT INTO `opciones` VALUES (689, 'Posgrado', 405);
INSERT INTO `opciones` VALUES (690, 'Centro de alfabetización', 405);
INSERT INTO `opciones` VALUES (691, 'No sabe, no vive con la madre', 405);
INSERT INTO `opciones` VALUES (692, 'Ninguna', 405);
INSERT INTO `opciones` VALUES (693, 'Si', 406);
INSERT INTO `opciones` VALUES (694, 'No', 406);
INSERT INTO `opciones` VALUES (695, 'Fiscal', 410);
INSERT INTO `opciones` VALUES (696, 'Fiscomisional', 410);
INSERT INTO `opciones` VALUES (697, 'Particular', 410);
INSERT INTO `opciones` VALUES (698, 'Agricultor', 419);
INSERT INTO `opciones` VALUES (699, 'Dependiente del gobierno', 419);
INSERT INTO `opciones` VALUES (700, 'Funcionario público', 419);
INSERT INTO `opciones` VALUES (701, 'Dependientes del comercio, vendedores o similares', 419);
INSERT INTO `opciones` VALUES (702, 'Empresario', 419);
INSERT INTO `opciones` VALUES (703, 'Arquitectos, ingenieros y profesionales similares', 419);
INSERT INTO `opciones` VALUES (704, 'Profesionales de la salud', 419);
INSERT INTO `opciones` VALUES (705, 'Profesionales de la agropecuaria', 419);
INSERT INTO `opciones` VALUES (706, 'Profesionales del Derecho', 419);
INSERT INTO `opciones` VALUES (707, 'Profesor(a) de primaria', 419);
INSERT INTO `opciones` VALUES (708, 'Profesor(a) de secundaria', 419);
INSERT INTO `opciones` VALUES (709, 'Profesor(a) de Universidad', 419);
INSERT INTO `opciones` VALUES (710, 'Otros profesionales de enseñanza', 419);
INSERT INTO `opciones` VALUES (711, 'Legislador', 419);
INSERT INTO `opciones` VALUES (712, 'Director y jefe ejecutivo', 419);
INSERT INTO `opciones` VALUES (713, 'Gerente del departamento', 419);
INSERT INTO `opciones` VALUES (714, 'Empleado de oficina', 419);
INSERT INTO `opciones` VALUES (715, 'Fuerzas Armadas y Policía', 419);
INSERT INTO `opciones` VALUES (716, 'Otra', 419);
INSERT INTO `opciones` VALUES (717, 'Agricultor', 420);
INSERT INTO `opciones` VALUES (718, 'Dependiente del gobierno', 420);
INSERT INTO `opciones` VALUES (719, 'Funcionario público', 420);
INSERT INTO `opciones` VALUES (720, 'Dependientes del comercio, vendedores o similares', 420);
INSERT INTO `opciones` VALUES (721, 'Empresario', 420);
INSERT INTO `opciones` VALUES (722, 'Arquitectos, ingenieros y profesionales similares', 420);
INSERT INTO `opciones` VALUES (723, 'Profesionales de la salud', 420);
INSERT INTO `opciones` VALUES (724, 'Profesionales de la agropecuaria', 420);
INSERT INTO `opciones` VALUES (725, 'Profesionales del Derecho', 420);
INSERT INTO `opciones` VALUES (726, 'Profesor(a) de primaria', 420);
INSERT INTO `opciones` VALUES (727, 'Profesor(a) de secundaria', 420);
INSERT INTO `opciones` VALUES (728, 'Profesor(a) de Universidad', 420);
INSERT INTO `opciones` VALUES (729, 'Otros profesionales de enseñanza', 420);
INSERT INTO `opciones` VALUES (730, 'Legislador', 420);
INSERT INTO `opciones` VALUES (731, 'Director y jefe ejecutivo', 420);
INSERT INTO `opciones` VALUES (732, 'Gerente del departamento', 420);
INSERT INTO `opciones` VALUES (733, 'Empleado de oficina', 420);
INSERT INTO `opciones` VALUES (734, 'Fuerzas Armadas y Policía', 420);
INSERT INTO `opciones` VALUES (735, 'Otra', 420);
INSERT INTO `opciones` VALUES (736, 'Sueldo propio', 421);
INSERT INTO `opciones` VALUES (737, 'Crédito', 421);
INSERT INTO `opciones` VALUES (738, 'Beca', 421);
INSERT INTO `opciones` VALUES (739, 'Otro Padres', 421);
INSERT INTO `opciones` VALUES (740, 'Propia', 423);
INSERT INTO `opciones` VALUES (741, 'Familiar', 423);
INSERT INTO `opciones` VALUES (742, 'Prestada', 423);
INSERT INTO `opciones` VALUES (743, 'Arrendada', 423);
INSERT INTO `opciones` VALUES (744, 'Hipotecada', 423);
INSERT INTO `opciones` VALUES (745, 'Otro', 423);
INSERT INTO `opciones` VALUES (746, 'Agua potable', 424);
INSERT INTO `opciones` VALUES (747, 'Energía eléctrica', 424);
INSERT INTO `opciones` VALUES (748, 'Recolección de basura', 424);
INSERT INTO `opciones` VALUES (749, 'Agua entubada', 424);
INSERT INTO `opciones` VALUES (750, 'Alcantarillado', 424);
INSERT INTO `opciones` VALUES (751, 'Teléfono', 424);
INSERT INTO `opciones` VALUES (752, 'Si', 425);
INSERT INTO `opciones` VALUES (753, 'No', 425);
INSERT INTO `opciones` VALUES (754, 'Auditiva', 426);
INSERT INTO `opciones` VALUES (755, 'Física', 426);
INSERT INTO `opciones` VALUES (756, 'Intelectual', 426);
INSERT INTO `opciones` VALUES (757, 'Visual', 426);
INSERT INTO `opciones` VALUES (758, 'Multidiscapacidad', 426);
INSERT INTO `opciones` VALUES (759, 'Si', 427);
INSERT INTO `opciones` VALUES (760, 'No', 427);
INSERT INTO `opciones` VALUES (761, 'Pública', 428);
INSERT INTO `opciones` VALUES (762, 'Privada', 428);
INSERT INTO `opciones` VALUES (763, 'Universitaria', 428);
INSERT INTO `opciones` VALUES (764, 'Ciencias', 429);
INSERT INTO `opciones` VALUES (765, 'Polivalente', 429);
INSERT INTO `opciones` VALUES (766, 'Técnico', 429);
INSERT INTO `opciones` VALUES (767, 'Artes', 429);
INSERT INTO `opciones` VALUES (768, 'Otro', 429);
INSERT INTO `opciones` VALUES (769, 'Ing. Sistemas', 432);
INSERT INTO `opciones` VALUES (770, 'Ing. Diseño Grafico', 432);
INSERT INTO `opciones` VALUES (771, 'Ing. Agroindustrial', 432);
INSERT INTO `opciones` VALUES (772, 'Ing. Telematica', 432);
INSERT INTO `opciones` VALUES (773, 'Ing. Seguridad Industrial', 432);
INSERT INTO `opciones` VALUES (774, 'F. Ciencias de la Ingenieria', 437);
INSERT INTO `opciones` VALUES (775, 'F. Ciencias Empresariales', 437);
INSERT INTO `opciones` VALUES (776, 'F. Ciencias Ambientales', 437);
INSERT INTO `opciones` VALUES (777, 'F. Ciencias Agrarias', 437);
INSERT INTO `opciones` VALUES (778, 'F. Ciencias Pecuarias', 437);
INSERT INTO `opciones` VALUES (779, 'Ud. Estudios a Distancia', 437);
INSERT INTO `opciones` VALUES (780, 'Si', 438);
INSERT INTO `opciones` VALUES (781, 'No', 438);
INSERT INTO `opciones` VALUES (782, 'Años', 439);
INSERT INTO `opciones` VALUES (783, 'Meses', 439);
INSERT INTO `opciones` VALUES (784, '1. En muy alto grado', 440);
INSERT INTO `opciones` VALUES (785, '2', 440);
INSERT INTO `opciones` VALUES (786, '3', 440);
INSERT INTO `opciones` VALUES (787, '4', 440);
INSERT INTO `opciones` VALUES (788, '5. De ningún modo', 440);
INSERT INTO `opciones` VALUES (789, '6. No aplica, sin trabajo', 440);
INSERT INTO `opciones` VALUES (790, 'Trabaja', 441);
INSERT INTO `opciones` VALUES (791, 'Estudia', 441);
INSERT INTO `opciones` VALUES (792, 'Ambas', 441);
INSERT INTO `opciones` VALUES (793, 'Ni estudia Ni trabaja', 441);
INSERT INTO `opciones` VALUES (794, 'Antes de graduar', 442);
INSERT INTO `opciones` VALUES (795, 'Menos de 6 meses luego de graduar', 442);
INSERT INTO `opciones` VALUES (796, 'Entre 6 meses y un año luego de graduar', 442);
INSERT INTO `opciones` VALUES (797, 'Más de un año luego de graduar', 442);
INSERT INTO `opciones` VALUES (798, 'Apliqué para un anuncio de vacante', 443);
INSERT INTO `opciones` VALUES (799, 'Contacté empleadores sin saber si había una vacante', 443);
INSERT INTO `opciones` VALUES (800, 'Publiqué mi oferta de servicios', 443);
INSERT INTO `opciones` VALUES (801, 'Fui contactado por un empleador', 443);
INSERT INTO `opciones` VALUES (802, 'Contacté una agencia pública de empleo', 443);
INSERT INTO `opciones` VALUES (803, 'Contacté una agencia comercial de empleo', 443);
INSERT INTO `opciones` VALUES (804, 'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior', 443);
INSERT INTO `opciones` VALUES (805, 'Solicité la ayuda del personal docente de la institución de educación superior', 443);
INSERT INTO `opciones` VALUES (806, 'Establecí contactos mientras trabajaba durante mis estudios', 443);
INSERT INTO `opciones` VALUES (807, 'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)', 443);
INSERT INTO `opciones` VALUES (808, 'Empecé mi propio negocio/ autoempleo', 443);
INSERT INTO `opciones` VALUES (809, 'Ser de universidad de prestigio', 444);
INSERT INTO `opciones` VALUES (810, 'Experiencia laboral en la especialidad', 444);
INSERT INTO `opciones` VALUES (811, 'Expediente académico – Notas - Calificaciones', 444);
INSERT INTO `opciones` VALUES (812, 'Tener título profesional en el área de trabajo', 444);
INSERT INTO `opciones` VALUES (813, 'Aprobar examen', 444);
INSERT INTO `opciones` VALUES (814, 'Experiencia en el extranjero', 444);
INSERT INTO `opciones` VALUES (815, 'Conocimiento de idiomas extranjeros', 444);
INSERT INTO `opciones` VALUES (816, 'Conocimientos de informática', 444);
INSERT INTO `opciones` VALUES (817, 'Habilidades personales', 444);
INSERT INTO `opciones` VALUES (818, 'Entrevista personal', 444);
INSERT INTO `opciones` VALUES (819, 'Por tener convenio con la UTEQ', 444);
INSERT INTO `opciones` VALUES (820, 'Recomendaciones/referencias de terceras personas', 444);
INSERT INTO `opciones` VALUES (821, 'País:', 446);
INSERT INTO `opciones` VALUES (822, 'Provincia:', 446);
INSERT INTO `opciones` VALUES (823, 'Cantón:', 446);
INSERT INTO `opciones` VALUES (824, 'Menos de un año', 451);
INSERT INTO `opciones` VALUES (825, 'Un año', 451);
INSERT INTO `opciones` VALUES (826, 'Dos años', 451);
INSERT INTO `opciones` VALUES (827, 'Tres años ', 451);
INSERT INTO `opciones` VALUES (828, 'Más de tres años', 451);
INSERT INTO `opciones` VALUES (829, 'Menos de un año', 452);
INSERT INTO `opciones` VALUES (830, 'Un año', 452);
INSERT INTO `opciones` VALUES (831, 'Dos años', 452);
INSERT INTO `opciones` VALUES (832, 'Tres años', 452);
INSERT INTO `opciones` VALUES (833, 'Más de tres años', 452);
INSERT INTO `opciones` VALUES (834, 'Técnico', 453);
INSERT INTO `opciones` VALUES (835, 'Jefe de área', 453);
INSERT INTO `opciones` VALUES (836, 'Supervisor ', 453);
INSERT INTO `opciones` VALUES (837, 'Funcionario ', 453);
INSERT INTO `opciones` VALUES (838, 'Directivo', 453);
INSERT INTO `opciones` VALUES (839, 'Empresario', 453);
INSERT INTO `opciones` VALUES (840, 'Nombramiento', 454);
INSERT INTO `opciones` VALUES (841, 'Contrato ', 454);
INSERT INTO `opciones` VALUES (842, 'Eventual', 454);
INSERT INTO `opciones` VALUES (843, '0%', 455);
INSERT INTO `opciones` VALUES (844, '1-20%', 455);
INSERT INTO `opciones` VALUES (845, '21-40%', 455);
INSERT INTO `opciones` VALUES (846, '41-60%', 455);
INSERT INTO `opciones` VALUES (847, '61-80%', 455);
INSERT INTO `opciones` VALUES (848, '81-100%', 455);
INSERT INTO `opciones` VALUES (849, 'Propia', 456);
INSERT INTO `opciones` VALUES (850, 'Pública ', 456);
INSERT INTO `opciones` VALUES (851, 'Privada', 456);
INSERT INTO `opciones` VALUES (852, 'Social-ONG', 456);
INSERT INTO `opciones` VALUES (853, 'Microempresa (1-30 Personas) ', 457);
INSERT INTO `opciones` VALUES (854, 'Pequeña (31-100 Personas) ', 457);
INSERT INTO `opciones` VALUES (855, 'Mediana (101-500 Personas) ', 457);
INSERT INTO `opciones` VALUES (856, 'Grande (más de 500 Personas) ', 457);
INSERT INTO `opciones` VALUES (857, 'Agroindustrial', 458);
INSERT INTO `opciones` VALUES (858, 'Agrícola', 458);
INSERT INTO `opciones` VALUES (859, 'Pecuario', 458);
INSERT INTO `opciones` VALUES (860, 'Pesquero ', 458);
INSERT INTO `opciones` VALUES (861, 'Minero', 458);
INSERT INTO `opciones` VALUES (862, 'Forestal', 458);
INSERT INTO `opciones` VALUES (863, 'Industrial ', 458);
INSERT INTO `opciones` VALUES (864, 'Construcción ', 458);
INSERT INTO `opciones` VALUES (865, 'Petrolero ', 458);
INSERT INTO `opciones` VALUES (866, 'Educativo', 458);
INSERT INTO `opciones` VALUES (867, 'Turismo', 458);
INSERT INTO `opciones` VALUES (868, 'Comercio', 458);
INSERT INTO `opciones` VALUES (869, 'Jurídico', 458);
INSERT INTO `opciones` VALUES (870, 'Informático', 458);
INSERT INTO `opciones` VALUES (871, 'Finanzas ', 458);
INSERT INTO `opciones` VALUES (872, 'De 354 a 500 USD	', 459);
INSERT INTO `opciones` VALUES (873, 'De 501 a 700 USD', 459);
INSERT INTO `opciones` VALUES (874, 'De 701 a 900 USD', 459);
INSERT INTO `opciones` VALUES (875, 'De 901 a 1200 USD', 459);
INSERT INTO `opciones` VALUES (876, 'De 1201 a 1500 USD', 459);
INSERT INTO `opciones` VALUES (877, 'De 1501 a 2000 USD', 459);
INSERT INTO `opciones` VALUES (878, 'De 2001 a 3000 USD', 459);
INSERT INTO `opciones` VALUES (879, 'De 3001 a 5000 USD', 459);
INSERT INTO `opciones` VALUES (880, 'Mayor a 5000 USD', 459);
INSERT INTO `opciones` VALUES (881, 'Tengo un empleo regular / Yo soy trabajador por cuenta propia', 460);
INSERT INTO `opciones` VALUES (882, 'Tengo trabajos ocasionales relacionados con mi estudio', 460);
INSERT INTO `opciones` VALUES (883, 'Tengo trabajos ocasionales NO relacionados con mi estudio', 460);
INSERT INTO `opciones` VALUES (884, 'Tengo más de un trabajo', 460);
INSERT INTO `opciones` VALUES (885, 'Actualmente estoy haciendo servicio militar o civil.', 460);
INSERT INTO `opciones` VALUES (886, 'Capacidad de abstracción, análisis y síntesis', 461);
INSERT INTO `opciones` VALUES (887, 'Capacidad de aplicar los conocimientos en la práctica', 461);
INSERT INTO `opciones` VALUES (888, 'Capacidad para organizar y planificar el tiempo', 461);
INSERT INTO `opciones` VALUES (889, 'Conocimientos sobre el área de estudio y la profesión', 461);
INSERT INTO `opciones` VALUES (890, 'Responsabilidad social y compromiso ciudadano', 461);
INSERT INTO `opciones` VALUES (891, 'Capacidad de comunicación oral  y escrita', 461);
INSERT INTO `opciones` VALUES (892, 'Capacidad de comunicación en un segundo idioma', 461);
INSERT INTO `opciones` VALUES (893, 'Habilidades en el uso de las tecnologías de la información y de la comunicación', 461);
INSERT INTO `opciones` VALUES (894, 'Capacidad de investigación', 461);
INSERT INTO `opciones` VALUES (895, 'Capacidad de aprender y actualizarse permanentemente', 461);
INSERT INTO `opciones` VALUES (896, 'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas', 461);
INSERT INTO `opciones` VALUES (897, 'Capacidad crítica y autocrítica', 461);
INSERT INTO `opciones` VALUES (898, 'Capacidad para actuar en nuevas situaciones', 461);
INSERT INTO `opciones` VALUES (899, 'Capacidad para identificar, plantear y resolver problemas', 461);
INSERT INTO `opciones` VALUES (900, 'Capacidad para tomar decisiones', 461);
INSERT INTO `opciones` VALUES (901, 'Capacidad de trabajo en equipo', 461);
INSERT INTO `opciones` VALUES (902, 'Habilidades interpersonales', 461);
INSERT INTO `opciones` VALUES (903, 'Capacidad de motivar y conducir hacia metas comunes', 461);
INSERT INTO `opciones` VALUES (904, 'Compromiso con la preservación del medio ambiente', 461);
INSERT INTO `opciones` VALUES (905, 'Capacidad creativa', 461);
INSERT INTO `opciones` VALUES (906, 'Compromiso con su medio socio-cultural', 461);
INSERT INTO `opciones` VALUES (907, 'Valoración y respecto por la diversidad y multiculturalidad', 461);
INSERT INTO `opciones` VALUES (908, 'Habilidad para trabajar en contextos internacionales', 461);
INSERT INTO `opciones` VALUES (909, 'Habilidad para trabajar en forma autónoma', 461);
INSERT INTO `opciones` VALUES (910, 'Capacidad para formular y gestionar proyectos', 461);
INSERT INTO `opciones` VALUES (911, 'Compromiso ético', 461);
INSERT INTO `opciones` VALUES (912, 'Compromiso con la calidad', 461);
INSERT INTO `opciones` VALUES (913, '1. Peor de lo que me esperaba', 462);
INSERT INTO `opciones` VALUES (914, '2.', 462);
INSERT INTO `opciones` VALUES (915, '3.', 462);
INSERT INTO `opciones` VALUES (916, '4.', 462);
INSERT INTO `opciones` VALUES (917, '5. Mucho mejor de lo que me esperaba', 462);
INSERT INTO `opciones` VALUES (918, '0. No he tenido ninguna expectativa', 462);
INSERT INTO `opciones` VALUES (919, '1. Nada en absoluto', 463);
INSERT INTO `opciones` VALUES (920, '2.', 463);
INSERT INTO `opciones` VALUES (921, '3.', 463);
INSERT INTO `opciones` VALUES (922, '4.', 463);
INSERT INTO `opciones` VALUES (923, '5. En un grado muy alto', 463);
INSERT INTO `opciones` VALUES (924, 'No aplicable, considero que mi trabajo se corresponde con mis estudios', 464);
INSERT INTO `opciones` VALUES (925, 'Todavía no he encontrado un trabajo más apropiado', 464);
INSERT INTO `opciones` VALUES (926, 'Haciendo este trabajo tengo mejores perspectivas profesionales. ', 464);
INSERT INTO `opciones` VALUES (927, 'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ', 464);
INSERT INTO `opciones` VALUES (928, 'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ', 464);
INSERT INTO `opciones` VALUES (929, 'Consigo ingresos más altos con mi trabajo actual. ', 464);
INSERT INTO `opciones` VALUES (930, 'Mi trabajo actual me ofrece seguridad. ', 464);
INSERT INTO `opciones` VALUES (931, 'Mi trabajo actual es interesante. ', 464);
INSERT INTO `opciones` VALUES (932, 'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ', 464);
INSERT INTO `opciones` VALUES (933, 'Mi trabajo actual me permite trabajar en la localidad que prefiero.', 464);
INSERT INTO `opciones` VALUES (934, 'Mi trabajo actual me permite atender las obligaciones familiares.', 464);
INSERT INTO `opciones` VALUES (935, 'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.', 464);
INSERT INTO `opciones` VALUES (936, 'Muy satisfecho', 465);
INSERT INTO `opciones` VALUES (937, 'Satisfecho', 465);
INSERT INTO `opciones` VALUES (938, 'Poco satisfecho', 465);
INSERT INTO `opciones` VALUES (939, 'No satisfecho', 465);
INSERT INTO `opciones` VALUES (940, 'Excelente', 467);
INSERT INTO `opciones` VALUES (941, 'Muy buenos', 467);
INSERT INTO `opciones` VALUES (942, 'Buenos', 467);
INSERT INTO `opciones` VALUES (943, 'Regulares', 467);
INSERT INTO `opciones` VALUES (944, 'Deficientes', 467);
INSERT INTO `opciones` VALUES (945, 'Excelente', 468);
INSERT INTO `opciones` VALUES (946, 'Muy buenos', 468);
INSERT INTO `opciones` VALUES (947, 'Buenos', 468);
INSERT INTO `opciones` VALUES (948, 'Regulares', 468);
INSERT INTO `opciones` VALUES (949, 'Deficientes', 468);
INSERT INTO `opciones` VALUES (950, 'Excelentes', 469);
INSERT INTO `opciones` VALUES (951, 'Muy buenos', 469);
INSERT INTO `opciones` VALUES (952, 'Buenos', 469);
INSERT INTO `opciones` VALUES (953, 'Regulares', 469);
INSERT INTO `opciones` VALUES (954, 'Deficientes', 469);
INSERT INTO `opciones` VALUES (955, 'Constantemente', 470);
INSERT INTO `opciones` VALUES (956, 'Rara vez', 470);
INSERT INTO `opciones` VALUES (957, 'Nunca ', 470);
INSERT INTO `opciones` VALUES (958, '1. Nada apropiado', 474);
INSERT INTO `opciones` VALUES (959, '2.', 474);
INSERT INTO `opciones` VALUES (960, '3.', 474);
INSERT INTO `opciones` VALUES (961, '4.', 474);
INSERT INTO `opciones` VALUES (962, '5. Completamente apropiado', 474);
INSERT INTO `opciones` VALUES (963, 'Constantemente', 476);
INSERT INTO `opciones` VALUES (964, 'Rara vez', 476);
INSERT INTO `opciones` VALUES (965, 'Nunca', 476);
INSERT INTO `opciones` VALUES (966, 'Si', 477);
INSERT INTO `opciones` VALUES (967, 'No', 477);
INSERT INTO `opciones` VALUES (968, 'Conferencia académica', 478);
INSERT INTO `opciones` VALUES (969, 'Revista no indexada', 478);
INSERT INTO `opciones` VALUES (970, 'Informe técnico', 478);
INSERT INTO `opciones` VALUES (971, 'Revista indexada (latindex, scielo, isi/jcr, scopus)', 478);
INSERT INTO `opciones` VALUES (972, 'Si', 479);
INSERT INTO `opciones` VALUES (973, 'No', 479);
INSERT INTO `opciones` VALUES (974, '1 mod', 480);
INSERT INTO `opciones` VALUES (975, '2 mod', 480);
INSERT INTO `opciones` VALUES (976, '[{\"field\":\"a\",\"title\":\"a\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"b\",\"title\":\"b\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 481);
INSERT INTO `opciones` VALUES (977, '[{\"field\":\"nombres\",\"title\":\"nombres\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 483);
INSERT INTO `opciones` VALUES (978, 'Soltero', 488);
INSERT INTO `opciones` VALUES (979, 'Viudo', 488);
INSERT INTO `opciones` VALUES (980, 'Unión libre', 488);
INSERT INTO `opciones` VALUES (981, 'Casado', 488);
INSERT INTO `opciones` VALUES (982, 'Divorciado', 488);
INSERT INTO `opciones` VALUES (983, 'Separado', 488);
INSERT INTO `opciones` VALUES (984, 'Provincia', 490);
INSERT INTO `opciones` VALUES (985, 'Cantón', 490);
INSERT INTO `opciones` VALUES (986, 'Sector', 490);
INSERT INTO `opciones` VALUES (987, 'Convencional(es)', 491);
INSERT INTO `opciones` VALUES (988, 'Celular(es)', 491);
INSERT INTO `opciones` VALUES (989, 'Masculino', 493);
INSERT INTO `opciones` VALUES (990, 'Femenino', 493);
INSERT INTO `opciones` VALUES (991, 'Padre', 494);
INSERT INTO `opciones` VALUES (992, 'Madre', 494);
INSERT INTO `opciones` VALUES (993, 'Padres', 495);
INSERT INTO `opciones` VALUES (994, 'Tíos', 495);
INSERT INTO `opciones` VALUES (995, 'Hermanos', 495);
INSERT INTO `opciones` VALUES (996, 'Abuelos', 495);
INSERT INTO `opciones` VALUES (997, 'Otros Parientes', 495);
INSERT INTO `opciones` VALUES (998, 'Independiente', 495);
INSERT INTO `opciones` VALUES (999, 'Primaria', 496);
INSERT INTO `opciones` VALUES (1000, 'Secundaria', 496);
INSERT INTO `opciones` VALUES (1001, 'Superior Universitaria culminada', 496);
INSERT INTO `opciones` VALUES (1002, 'Superior Universitaria no culminada', 496);
INSERT INTO `opciones` VALUES (1003, 'Posgrado', 496);
INSERT INTO `opciones` VALUES (1004, 'Centro de alfabetización', 496);
INSERT INTO `opciones` VALUES (1005, 'No sabe, no vive el padre', 496);
INSERT INTO `opciones` VALUES (1006, 'Ninguna', 496);
INSERT INTO `opciones` VALUES (1007, 'Primaria', 497);
INSERT INTO `opciones` VALUES (1008, 'Secundaria', 497);
INSERT INTO `opciones` VALUES (1009, 'Superior Universitaria culminada', 497);
INSERT INTO `opciones` VALUES (1010, 'Superior Universitaria no culminada', 497);
INSERT INTO `opciones` VALUES (1011, 'Posgrado', 497);
INSERT INTO `opciones` VALUES (1012, 'Centro de alfabetización', 497);
INSERT INTO `opciones` VALUES (1013, 'No sabe, no vive con la madre', 497);
INSERT INTO `opciones` VALUES (1014, 'Ninguna', 497);
INSERT INTO `opciones` VALUES (1015, 'Si', 498);
INSERT INTO `opciones` VALUES (1016, 'No', 498);
INSERT INTO `opciones` VALUES (1017, 'Fiscal', 502);
INSERT INTO `opciones` VALUES (1018, 'Fiscomisional', 502);
INSERT INTO `opciones` VALUES (1019, 'Particular', 502);
INSERT INTO `opciones` VALUES (1020, 'Agricultor', 511);
INSERT INTO `opciones` VALUES (1021, 'Dependiente del gobierno', 511);
INSERT INTO `opciones` VALUES (1022, 'Funcionario público', 511);
INSERT INTO `opciones` VALUES (1023, 'Dependientes del comercio, vendedores o similares', 511);
INSERT INTO `opciones` VALUES (1024, 'Empresario', 511);
INSERT INTO `opciones` VALUES (1025, 'Arquitectos, ingenieros y profesionales similares', 511);
INSERT INTO `opciones` VALUES (1026, 'Profesionales de la salud', 511);
INSERT INTO `opciones` VALUES (1027, 'Profesionales de la agropecuaria', 511);
INSERT INTO `opciones` VALUES (1028, 'Profesionales del Derecho', 511);
INSERT INTO `opciones` VALUES (1029, 'Profesor(a) de primaria', 511);
INSERT INTO `opciones` VALUES (1030, 'Profesor(a) de secundaria', 511);
INSERT INTO `opciones` VALUES (1031, 'Profesor(a) de Universidad', 511);
INSERT INTO `opciones` VALUES (1032, 'Otros profesionales de enseñanza', 511);
INSERT INTO `opciones` VALUES (1033, 'Legislador', 511);
INSERT INTO `opciones` VALUES (1034, 'Director y jefe ejecutivo', 511);
INSERT INTO `opciones` VALUES (1035, 'Gerente del departamento', 511);
INSERT INTO `opciones` VALUES (1036, 'Empleado de oficina', 511);
INSERT INTO `opciones` VALUES (1037, 'Fuerzas Armadas y Policía', 511);
INSERT INTO `opciones` VALUES (1038, 'Otra', 511);
INSERT INTO `opciones` VALUES (1039, 'Agricultor', 512);
INSERT INTO `opciones` VALUES (1040, 'Dependiente del gobierno', 512);
INSERT INTO `opciones` VALUES (1041, 'Funcionario público', 512);
INSERT INTO `opciones` VALUES (1042, 'Dependientes del comercio, vendedores o similares', 512);
INSERT INTO `opciones` VALUES (1043, 'Empresario', 512);
INSERT INTO `opciones` VALUES (1044, 'Arquitectos, ingenieros y profesionales similares', 512);
INSERT INTO `opciones` VALUES (1045, 'Profesionales de la salud', 512);
INSERT INTO `opciones` VALUES (1046, 'Profesionales de la agropecuaria', 512);
INSERT INTO `opciones` VALUES (1047, 'Profesionales del Derecho', 512);
INSERT INTO `opciones` VALUES (1048, 'Profesor(a) de primaria', 512);
INSERT INTO `opciones` VALUES (1049, 'Profesor(a) de secundaria', 512);
INSERT INTO `opciones` VALUES (1050, 'Profesor(a) de Universidad', 512);
INSERT INTO `opciones` VALUES (1051, 'Otros profesionales de enseñanza', 512);
INSERT INTO `opciones` VALUES (1052, 'Legislador', 512);
INSERT INTO `opciones` VALUES (1053, 'Director y jefe ejecutivo', 512);
INSERT INTO `opciones` VALUES (1054, 'Gerente del departamento', 512);
INSERT INTO `opciones` VALUES (1055, 'Empleado de oficina', 512);
INSERT INTO `opciones` VALUES (1056, 'Fuerzas Armadas y Policía', 512);
INSERT INTO `opciones` VALUES (1057, 'Otra', 512);
INSERT INTO `opciones` VALUES (1058, 'Sueldo propio', 513);
INSERT INTO `opciones` VALUES (1059, 'Crédito', 513);
INSERT INTO `opciones` VALUES (1060, 'Beca', 513);
INSERT INTO `opciones` VALUES (1061, 'Otro Padres', 513);
INSERT INTO `opciones` VALUES (1062, 'Propia', 515);
INSERT INTO `opciones` VALUES (1063, 'Familiar', 515);
INSERT INTO `opciones` VALUES (1064, 'Prestada', 515);
INSERT INTO `opciones` VALUES (1065, 'Arrendada', 515);
INSERT INTO `opciones` VALUES (1066, 'Hipotecada', 515);
INSERT INTO `opciones` VALUES (1067, 'Otro', 515);
INSERT INTO `opciones` VALUES (1068, 'Agua potable', 516);
INSERT INTO `opciones` VALUES (1069, 'Energía eléctrica', 516);
INSERT INTO `opciones` VALUES (1070, 'Recolección de basura', 516);
INSERT INTO `opciones` VALUES (1071, 'Agua entubada', 516);
INSERT INTO `opciones` VALUES (1072, 'Alcantarillado', 516);
INSERT INTO `opciones` VALUES (1073, 'Teléfono', 516);
INSERT INTO `opciones` VALUES (1074, 'Si', 517);
INSERT INTO `opciones` VALUES (1075, 'No', 517);
INSERT INTO `opciones` VALUES (1076, 'Auditiva', 518);
INSERT INTO `opciones` VALUES (1077, 'Física', 518);
INSERT INTO `opciones` VALUES (1078, 'Intelectual', 518);
INSERT INTO `opciones` VALUES (1079, 'Visual', 518);
INSERT INTO `opciones` VALUES (1080, 'Multidiscapacidad', 518);
INSERT INTO `opciones` VALUES (1081, 'Si', 519);
INSERT INTO `opciones` VALUES (1082, 'No', 519);
INSERT INTO `opciones` VALUES (1083, 'Pública', 520);
INSERT INTO `opciones` VALUES (1084, 'Privada', 520);
INSERT INTO `opciones` VALUES (1085, 'Universitaria', 520);
INSERT INTO `opciones` VALUES (1086, 'Ciencias', 521);
INSERT INTO `opciones` VALUES (1087, 'Polivalente', 521);
INSERT INTO `opciones` VALUES (1088, 'Técnico', 521);
INSERT INTO `opciones` VALUES (1089, 'Artes', 521);
INSERT INTO `opciones` VALUES (1090, 'Otro', 521);
INSERT INTO `opciones` VALUES (1091, 'Ing. Sistemas', 524);
INSERT INTO `opciones` VALUES (1092, 'Ing. Diseño Grafico', 524);
INSERT INTO `opciones` VALUES (1093, 'Ing. Agroindustrial', 524);
INSERT INTO `opciones` VALUES (1094, 'Ing. Telematica', 524);
INSERT INTO `opciones` VALUES (1095, 'Ing. Seguridad Industrial', 524);
INSERT INTO `opciones` VALUES (1096, 'F. Ciencias de la Ingenieria', 529);
INSERT INTO `opciones` VALUES (1097, 'F. Ciencias Empresariales', 529);
INSERT INTO `opciones` VALUES (1098, 'F. Ciencias Ambientales', 529);
INSERT INTO `opciones` VALUES (1099, 'F. Ciencias Agrarias', 529);
INSERT INTO `opciones` VALUES (1100, 'F. Ciencias Pecuarias', 529);
INSERT INTO `opciones` VALUES (1101, 'Ud. Estudios a Distancia', 529);
INSERT INTO `opciones` VALUES (1102, 'Si', 530);
INSERT INTO `opciones` VALUES (1103, 'No', 530);
INSERT INTO `opciones` VALUES (1104, 'Años', 531);
INSERT INTO `opciones` VALUES (1105, 'Meses', 531);
INSERT INTO `opciones` VALUES (1106, '1. En muy alto grado', 532);
INSERT INTO `opciones` VALUES (1107, '2', 532);
INSERT INTO `opciones` VALUES (1108, '3', 532);
INSERT INTO `opciones` VALUES (1109, '4', 532);
INSERT INTO `opciones` VALUES (1110, '5. De ningún modo', 532);
INSERT INTO `opciones` VALUES (1111, '6. No aplica, sin trabajo', 532);
INSERT INTO `opciones` VALUES (1112, 'Trabaja', 533);
INSERT INTO `opciones` VALUES (1113, 'Estudia', 533);
INSERT INTO `opciones` VALUES (1114, 'Ambas', 533);
INSERT INTO `opciones` VALUES (1115, 'Ni estudia Ni trabaja', 533);
INSERT INTO `opciones` VALUES (1116, 'Antes de graduar', 534);
INSERT INTO `opciones` VALUES (1117, 'Menos de 6 meses luego de graduar', 534);
INSERT INTO `opciones` VALUES (1118, 'Entre 6 meses y un año luego de graduar', 534);
INSERT INTO `opciones` VALUES (1119, 'Más de un año luego de graduar', 534);
INSERT INTO `opciones` VALUES (1120, 'Apliqué para un anuncio de vacante', 535);
INSERT INTO `opciones` VALUES (1121, 'Contacté empleadores sin saber si había una vacante', 535);
INSERT INTO `opciones` VALUES (1122, 'Publiqué mi oferta de servicios', 535);
INSERT INTO `opciones` VALUES (1123, 'Fui contactado por un empleador', 535);
INSERT INTO `opciones` VALUES (1124, 'Contacté una agencia pública de empleo', 535);
INSERT INTO `opciones` VALUES (1125, 'Contacté una agencia comercial de empleo', 535);
INSERT INTO `opciones` VALUES (1126, 'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior', 535);
INSERT INTO `opciones` VALUES (1127, 'Solicité la ayuda del personal docente de la institución de educación superior', 535);
INSERT INTO `opciones` VALUES (1128, 'Establecí contactos mientras trabajaba durante mis estudios', 535);
INSERT INTO `opciones` VALUES (1129, 'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)', 535);
INSERT INTO `opciones` VALUES (1130, 'Empecé mi propio negocio/ autoempleo', 535);
INSERT INTO `opciones` VALUES (1131, 'Ser de universidad de prestigio', 536);
INSERT INTO `opciones` VALUES (1132, 'Experiencia laboral en la especialidad', 536);
INSERT INTO `opciones` VALUES (1133, 'Expediente académico – Notas - Calificaciones', 536);
INSERT INTO `opciones` VALUES (1134, 'Tener título profesional en el área de trabajo', 536);
INSERT INTO `opciones` VALUES (1135, 'Aprobar examen', 536);
INSERT INTO `opciones` VALUES (1136, 'Experiencia en el extranjero', 536);
INSERT INTO `opciones` VALUES (1137, 'Conocimiento de idiomas extranjeros', 536);
INSERT INTO `opciones` VALUES (1138, 'Conocimientos de informática', 536);
INSERT INTO `opciones` VALUES (1139, 'Habilidades personales', 536);
INSERT INTO `opciones` VALUES (1140, 'Entrevista personal', 536);
INSERT INTO `opciones` VALUES (1141, 'Por tener convenio con la UTEQ', 536);
INSERT INTO `opciones` VALUES (1142, 'Recomendaciones/referencias de terceras personas', 536);
INSERT INTO `opciones` VALUES (1143, 'País:', 538);
INSERT INTO `opciones` VALUES (1144, 'Provincia:', 538);
INSERT INTO `opciones` VALUES (1145, 'Cantón:', 538);
INSERT INTO `opciones` VALUES (1146, 'Menos de un año', 543);
INSERT INTO `opciones` VALUES (1147, 'Un año', 543);
INSERT INTO `opciones` VALUES (1148, 'Dos años', 543);
INSERT INTO `opciones` VALUES (1149, 'Tres años ', 543);
INSERT INTO `opciones` VALUES (1150, 'Más de tres años', 543);
INSERT INTO `opciones` VALUES (1151, 'Menos de un año', 544);
INSERT INTO `opciones` VALUES (1152, 'Un año', 544);
INSERT INTO `opciones` VALUES (1153, 'Dos años', 544);
INSERT INTO `opciones` VALUES (1154, 'Tres años', 544);
INSERT INTO `opciones` VALUES (1155, 'Más de tres años', 544);
INSERT INTO `opciones` VALUES (1156, 'Técnico', 545);
INSERT INTO `opciones` VALUES (1157, 'Jefe de área', 545);
INSERT INTO `opciones` VALUES (1158, 'Supervisor ', 545);
INSERT INTO `opciones` VALUES (1159, 'Funcionario ', 545);
INSERT INTO `opciones` VALUES (1160, 'Directivo', 545);
INSERT INTO `opciones` VALUES (1161, 'Empresario', 545);
INSERT INTO `opciones` VALUES (1162, 'Nombramiento', 546);
INSERT INTO `opciones` VALUES (1163, 'Contrato ', 546);
INSERT INTO `opciones` VALUES (1164, 'Eventual', 546);
INSERT INTO `opciones` VALUES (1165, '0%', 547);
INSERT INTO `opciones` VALUES (1166, '1-20%', 547);
INSERT INTO `opciones` VALUES (1167, '21-40%', 547);
INSERT INTO `opciones` VALUES (1168, '41-60%', 547);
INSERT INTO `opciones` VALUES (1169, '61-80%', 547);
INSERT INTO `opciones` VALUES (1170, '81-100%', 547);
INSERT INTO `opciones` VALUES (1171, 'Propia', 548);
INSERT INTO `opciones` VALUES (1172, 'Pública ', 548);
INSERT INTO `opciones` VALUES (1173, 'Privada', 548);
INSERT INTO `opciones` VALUES (1174, 'Social-ONG', 548);
INSERT INTO `opciones` VALUES (1175, 'Microempresa (1-30 Personas) ', 549);
INSERT INTO `opciones` VALUES (1176, 'Pequeña (31-100 Personas) ', 549);
INSERT INTO `opciones` VALUES (1177, 'Mediana (101-500 Personas) ', 549);
INSERT INTO `opciones` VALUES (1178, 'Grande (más de 500 Personas) ', 549);
INSERT INTO `opciones` VALUES (1179, 'Agroindustrial', 550);
INSERT INTO `opciones` VALUES (1180, 'Agrícola', 550);
INSERT INTO `opciones` VALUES (1181, 'Pecuario', 550);
INSERT INTO `opciones` VALUES (1182, 'Pesquero ', 550);
INSERT INTO `opciones` VALUES (1183, 'Minero', 550);
INSERT INTO `opciones` VALUES (1184, 'Forestal', 550);
INSERT INTO `opciones` VALUES (1185, 'Industrial ', 550);
INSERT INTO `opciones` VALUES (1186, 'Construcción ', 550);
INSERT INTO `opciones` VALUES (1187, 'Petrolero ', 550);
INSERT INTO `opciones` VALUES (1188, 'Educativo', 550);
INSERT INTO `opciones` VALUES (1189, 'Turismo', 550);
INSERT INTO `opciones` VALUES (1190, 'Comercio', 550);
INSERT INTO `opciones` VALUES (1191, 'Jurídico', 550);
INSERT INTO `opciones` VALUES (1192, 'Informático', 550);
INSERT INTO `opciones` VALUES (1193, 'Finanzas ', 550);
INSERT INTO `opciones` VALUES (1194, 'De 354 a 500 USD	', 551);
INSERT INTO `opciones` VALUES (1195, 'De 501 a 700 USD', 551);
INSERT INTO `opciones` VALUES (1196, 'De 701 a 900 USD', 551);
INSERT INTO `opciones` VALUES (1197, 'De 901 a 1200 USD', 551);
INSERT INTO `opciones` VALUES (1198, 'De 1201 a 1500 USD', 551);
INSERT INTO `opciones` VALUES (1199, 'De 1501 a 2000 USD', 551);
INSERT INTO `opciones` VALUES (1200, 'De 2001 a 3000 USD', 551);
INSERT INTO `opciones` VALUES (1201, 'De 3001 a 5000 USD', 551);
INSERT INTO `opciones` VALUES (1202, 'Mayor a 5000 USD', 551);
INSERT INTO `opciones` VALUES (1203, 'Tengo un empleo regular / Yo soy trabajador por cuenta propia', 552);
INSERT INTO `opciones` VALUES (1204, 'Tengo trabajos ocasionales relacionados con mi estudio', 552);
INSERT INTO `opciones` VALUES (1205, 'Tengo trabajos ocasionales NO relacionados con mi estudio', 552);
INSERT INTO `opciones` VALUES (1206, 'Tengo más de un trabajo', 552);
INSERT INTO `opciones` VALUES (1207, 'Actualmente estoy haciendo servicio militar o civil.', 552);
INSERT INTO `opciones` VALUES (1208, 'Capacidad de abstracción, análisis y síntesis', 553);
INSERT INTO `opciones` VALUES (1209, 'Capacidad de aplicar los conocimientos en la práctica', 553);
INSERT INTO `opciones` VALUES (1210, 'Capacidad para organizar y planificar el tiempo', 553);
INSERT INTO `opciones` VALUES (1211, 'Conocimientos sobre el área de estudio y la profesión', 553);
INSERT INTO `opciones` VALUES (1212, 'Responsabilidad social y compromiso ciudadano', 553);
INSERT INTO `opciones` VALUES (1213, 'Capacidad de comunicación oral  y escrita', 553);
INSERT INTO `opciones` VALUES (1214, 'Capacidad de comunicación en un segundo idioma', 553);
INSERT INTO `opciones` VALUES (1215, 'Habilidades en el uso de las tecnologías de la información y de la comunicación', 553);
INSERT INTO `opciones` VALUES (1216, 'Capacidad de investigación', 553);
INSERT INTO `opciones` VALUES (1217, 'Capacidad de aprender y actualizarse permanentemente', 553);
INSERT INTO `opciones` VALUES (1218, 'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas', 553);
INSERT INTO `opciones` VALUES (1219, 'Capacidad crítica y autocrítica', 553);
INSERT INTO `opciones` VALUES (1220, 'Capacidad para actuar en nuevas situaciones', 553);
INSERT INTO `opciones` VALUES (1221, 'Capacidad para identificar, plantear y resolver problemas', 553);
INSERT INTO `opciones` VALUES (1222, 'Capacidad para tomar decisiones', 553);
INSERT INTO `opciones` VALUES (1223, 'Capacidad de trabajo en equipo', 553);
INSERT INTO `opciones` VALUES (1224, 'Habilidades interpersonales', 553);
INSERT INTO `opciones` VALUES (1225, 'Capacidad de motivar y conducir hacia metas comunes', 553);
INSERT INTO `opciones` VALUES (1226, 'Compromiso con la preservación del medio ambiente', 553);
INSERT INTO `opciones` VALUES (1227, 'Capacidad creativa', 553);
INSERT INTO `opciones` VALUES (1228, 'Compromiso con su medio socio-cultural', 553);
INSERT INTO `opciones` VALUES (1229, 'Valoración y respecto por la diversidad y multiculturalidad', 553);
INSERT INTO `opciones` VALUES (1230, 'Habilidad para trabajar en contextos internacionales', 553);
INSERT INTO `opciones` VALUES (1231, 'Habilidad para trabajar en forma autónoma', 553);
INSERT INTO `opciones` VALUES (1232, 'Capacidad para formular y gestionar proyectos', 553);
INSERT INTO `opciones` VALUES (1233, 'Compromiso ético', 553);
INSERT INTO `opciones` VALUES (1234, 'Compromiso con la calidad', 553);
INSERT INTO `opciones` VALUES (1235, '1. Peor de lo que me esperaba', 554);
INSERT INTO `opciones` VALUES (1236, '2.', 554);
INSERT INTO `opciones` VALUES (1237, '3.', 554);
INSERT INTO `opciones` VALUES (1238, '4.', 554);
INSERT INTO `opciones` VALUES (1239, '5. Mucho mejor de lo que me esperaba', 554);
INSERT INTO `opciones` VALUES (1240, '0. No he tenido ninguna expectativa', 554);
INSERT INTO `opciones` VALUES (1241, '1. Nada en absoluto', 555);
INSERT INTO `opciones` VALUES (1242, '2.', 555);
INSERT INTO `opciones` VALUES (1243, '3.', 555);
INSERT INTO `opciones` VALUES (1244, '4.', 555);
INSERT INTO `opciones` VALUES (1245, '5. En un grado muy alto', 555);
INSERT INTO `opciones` VALUES (1246, 'No aplicable, considero que mi trabajo se corresponde con mis estudios', 556);
INSERT INTO `opciones` VALUES (1247, 'Todavía no he encontrado un trabajo más apropiado', 556);
INSERT INTO `opciones` VALUES (1248, 'Haciendo este trabajo tengo mejores perspectivas profesionales. ', 556);
INSERT INTO `opciones` VALUES (1249, 'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ', 556);
INSERT INTO `opciones` VALUES (1250, 'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ', 556);
INSERT INTO `opciones` VALUES (1251, 'Consigo ingresos más altos con mi trabajo actual. ', 556);
INSERT INTO `opciones` VALUES (1252, 'Mi trabajo actual me ofrece seguridad. ', 556);
INSERT INTO `opciones` VALUES (1253, 'Mi trabajo actual es interesante. ', 556);
INSERT INTO `opciones` VALUES (1254, 'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ', 556);
INSERT INTO `opciones` VALUES (1255, 'Mi trabajo actual me permite trabajar en la localidad que prefiero.', 556);
INSERT INTO `opciones` VALUES (1256, 'Mi trabajo actual me permite atender las obligaciones familiares.', 556);
INSERT INTO `opciones` VALUES (1257, 'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.', 556);
INSERT INTO `opciones` VALUES (1258, 'Muy satisfecho', 557);
INSERT INTO `opciones` VALUES (1259, 'Satisfecho', 557);
INSERT INTO `opciones` VALUES (1260, 'Poco satisfecho', 557);
INSERT INTO `opciones` VALUES (1261, 'No satisfecho', 557);
INSERT INTO `opciones` VALUES (1262, 'Excelente', 559);
INSERT INTO `opciones` VALUES (1263, 'Muy buenos', 559);
INSERT INTO `opciones` VALUES (1264, 'Buenos', 559);
INSERT INTO `opciones` VALUES (1265, 'Regulares', 559);
INSERT INTO `opciones` VALUES (1266, 'Deficientes', 559);
INSERT INTO `opciones` VALUES (1267, 'Excelente', 560);
INSERT INTO `opciones` VALUES (1268, 'Muy buenos', 560);
INSERT INTO `opciones` VALUES (1269, 'Buenos', 560);
INSERT INTO `opciones` VALUES (1270, 'Regulares', 560);
INSERT INTO `opciones` VALUES (1271, 'Deficientes', 560);
INSERT INTO `opciones` VALUES (1272, 'Excelentes', 561);
INSERT INTO `opciones` VALUES (1273, 'Muy buenos', 561);
INSERT INTO `opciones` VALUES (1274, 'Buenos', 561);
INSERT INTO `opciones` VALUES (1275, 'Regulares', 561);
INSERT INTO `opciones` VALUES (1276, 'Deficientes', 561);
INSERT INTO `opciones` VALUES (1277, 'Constantemente', 562);
INSERT INTO `opciones` VALUES (1278, 'Rara vez', 562);
INSERT INTO `opciones` VALUES (1279, 'Nunca ', 562);
INSERT INTO `opciones` VALUES (1280, '1. Nada apropiado', 566);
INSERT INTO `opciones` VALUES (1281, '2.', 566);
INSERT INTO `opciones` VALUES (1282, '3.', 566);
INSERT INTO `opciones` VALUES (1283, '4.', 566);
INSERT INTO `opciones` VALUES (1284, '5. Completamente apropiado', 566);
INSERT INTO `opciones` VALUES (1285, 'Constantemente', 568);
INSERT INTO `opciones` VALUES (1286, 'Rara vez', 568);
INSERT INTO `opciones` VALUES (1287, 'Nunca', 568);
INSERT INTO `opciones` VALUES (1288, 'Si', 569);
INSERT INTO `opciones` VALUES (1289, 'No', 569);
INSERT INTO `opciones` VALUES (1290, 'Conferencia académica', 570);
INSERT INTO `opciones` VALUES (1291, 'Revista no indexada', 570);
INSERT INTO `opciones` VALUES (1292, 'Informe técnico', 570);
INSERT INTO `opciones` VALUES (1293, 'Revista indexada (latindex, scielo, isi/jcr, scopus)', 570);
INSERT INTO `opciones` VALUES (1294, 'Si', 571);
INSERT INTO `opciones` VALUES (1295, 'No', 571);
INSERT INTO `opciones` VALUES (1296, '1 mod', 572);
INSERT INTO `opciones` VALUES (1297, '2 mod', 572);
INSERT INTO `opciones` VALUES (1298, '[{\"field\":\"nombres\",\"title\":\"nombres\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"apellidos\",\"title\":\"apellidos\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"estado civil\",\"title\":\"estado civil\",\"tipo\":\"select\",\"sortable\":false,\"data_source\":[{\"value\":0,\"text\":\"soltero\"},{\"value\":1,\"text\":\"casado\"},{\"value\":2,\"text\":\"viudo\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"}]', 573);
INSERT INTO `opciones` VALUES (1299, '[{\"field\":\"titulo\",\"title\":\"titulo\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"año\",\"title\":\"año\",\"tipo\":\"select\",\"sortable\":false,\"data_source\":[{\"value\":0,\"text\":\"2017\"},{\"value\":1,\"text\":\"2016\"},{\"value\":2,\"text\":\"2015\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"culmino\",\"title\":\"culmino\",\"tipo\":\"check\",\"sortable\":false,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"carrera\",\"title\":\"carrera\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 574);
INSERT INTO `opciones` VALUES (1300, '[{\"field\":\"a\",\"title\":\"a\",\"sortable\":false,\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"cbo\",\"title\":\"cbo\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"a\"},{\"value\":1,\"text\":\"b\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"c\",\"title\":\"c\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"}]', 575);
INSERT INTO `opciones` VALUES (1301, '[{\"field\":\"input\",\"title\":\"input\",\"sortable\":false,\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"cbo\",\"title\":\"cbo\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"a\"},{\"value\":1,\"text\":\"b\"},{\"value\":2,\"text\":\"c\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"cbk\",\"title\":\"cbk\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"cbk2\",\"title\":\"cbk2\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"cbo2\",\"title\":\"cbo2\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"z\"},{\"value\":1,\"text\":\"x\"},{\"value\":2,\"text\":\"y\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"}]', 576);
INSERT INTO `opciones` VALUES (1304, '[{\"field\":\"a\",\"title\":\"a\",\"sortable\":false,\"tipo\":\"1\",\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"z\",\"title\":\"z\",\"sortable\":false,\"tipo\":\"1\",\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 577);
INSERT INTO `opciones` VALUES (1305, '[{\"field\":\"nombres\",\"title\":\"nombres\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"apellidos\",\"title\":\"apellidos\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"estado civil\",\"title\":\"estado civil\",\"tipo\":\"select\",\"sortable\":false,\"data_source\":[{\"value\":0,\"text\":\"soltero\"},{\"value\":1,\"text\":\"casado\"},{\"value\":2,\"text\":\"viudo\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"}]', 578);
INSERT INTO `opciones` VALUES (1306, '[{\"field\":\"titulo\",\"title\":\"titulo\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"año\",\"title\":\"año\",\"tipo\":\"select\",\"sortable\":false,\"data_source\":[{\"value\":0,\"text\":\"2017\"},{\"value\":1,\"text\":\"2016\"},{\"value\":2,\"text\":\"2015\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"culmino\",\"title\":\"culmino\",\"tipo\":\"check\",\"sortable\":false,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"carrera\",\"title\":\"carrera\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 579);
INSERT INTO `opciones` VALUES (1307, '[{\"field\":\"a\",\"title\":\"a\",\"sortable\":false,\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"cbo\",\"title\":\"cbo\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"a\"},{\"value\":1,\"text\":\"b\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"c\",\"title\":\"c\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"}]', 580);
INSERT INTO `opciones` VALUES (1308, '[{\"field\":\"input\",\"title\":\"input\",\"sortable\":false,\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"cbo\",\"title\":\"cbo\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"a\"},{\"value\":1,\"text\":\"b\"},{\"value\":2,\"text\":\"c\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"cbk\",\"title\":\"cbk\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"cbk2\",\"title\":\"cbk2\",\"sortable\":false,\"excel\":true,\"formatter\":\"cbk_format\",\"events\":\"cbk_action\"},{\"field\":\"cbo2\",\"title\":\"cbo2\",\"sortable\":false,\"excel\":true,\"data_source\":[{\"value\":0,\"text\":\"z\"},{\"value\":1,\"text\":\"x\"},{\"value\":2,\"text\":\"y\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"}]', 581);
INSERT INTO `opciones` VALUES (1309, '[{\"field\":\"a\",\"title\":\"a\",\"sortable\":false,\"tipo\":\"1\",\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"z\",\"title\":\"z\",\"sortable\":false,\"tipo\":\"1\",\"excel\":true,\"formatter\":\"input_format\",\"events\":\"input_action\"}]', 582);
INSERT INTO `opciones` VALUES (1339, '[{\"field\":\"cb1\",\"title\":\"cb1\",\"sortable\":false,\"tipo\":\"2\",\"excel\":true,\"columna_dominante\":false,\"data_source\":[{\"value\":0,\"text\":\"a\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"},{\"field\":\"cb2\",\"title\":\"cb2\",\"sortable\":false,\"tipo\":\"2\",\"excel\":true,\"columna_dominante\":true,\"data_source\":[{\"value\":0,\"text\":\"x\"},{\"value\":1,\"text\":\"y\"},{\"value\":2,\"text\":\"z\"}],\"formatter\":\"select_format\",\"events\":\"cbo_action\"}]', 583);
INSERT INTO `opciones` VALUES (1340, 'IMultiple 1', 585);
INSERT INTO `opciones` VALUES (1341, 'IMultiple 2', 585);

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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pregunta_categoria_idx`(`categoria_id`) USING BTREE,
  INDEX `fk_preguntas_Encuestas1_idx`(`Encuestas_id`) USING BTREE,
  CONSTRAINT `fk_preguntas_encuestas_1` FOREIGN KEY (`Encuestas_id`) REFERENCES `encuestas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pregunta_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 586 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of preguntas
-- ----------------------------
INSERT INTO `preguntas` VALUES (24, 'Nombres:', 1, 6, '1', 2, 1, '1');
INSERT INTO `preguntas` VALUES (25, 'Apellidos:', 1, 6, '1', 3, 1, '1');
INSERT INTO `preguntas` VALUES (26, 'Cédula de Identidad', 1, 6, '1', 1, 1, '1');
INSERT INTO `preguntas` VALUES (27, 'Fecha de Nacimiento', 1, 6, '1', 4, 1, '1');
INSERT INTO `preguntas` VALUES (29, 'Estado Civil', 4, 6, '1', 5, 1, '1');
INSERT INTO `preguntas` VALUES (30, 'País de nacimiento ', 1, 6, '1', 6, 1, '1');
INSERT INTO `preguntas` VALUES (31, 'Dirección Domiciliaria', 2, 6, '1', 7, 1, '1');
INSERT INTO `preguntas` VALUES (32, 'Teléfonos', 2, 6, '1', 8, 1, '1');
INSERT INTO `preguntas` VALUES (33, 'Correo(s) Electrónico(s)', 1, 6, '1', 9, 1, '1');
INSERT INTO `preguntas` VALUES (34, 'Genero', 4, 6, '1', 10, 1, '1');
INSERT INTO `preguntas` VALUES (35, '¿Cuenta con sus padres vivos?', 3, 1, '1', 1, 1, '1');
INSERT INTO `preguntas` VALUES (36, '¿Con quién  vive actualmente? ', 3, 1, '1', 2, 1, '1');
INSERT INTO `preguntas` VALUES (37, 'Nivel de formación del padre', 4, 1, '1', 3, 1, '1');
INSERT INTO `preguntas` VALUES (38, 'Nivel de formación de la madre', 4, 1, '1', 4, 1, '1');
INSERT INTO `preguntas` VALUES (39, '¿Tiene hermanos? ', 4, 1, '1', 5, 1, '1');
INSERT INTO `preguntas` VALUES (40, '¿Cuántos hermanos tiene?', 1, 1, '1', 6, 1, '1');
INSERT INTO `preguntas` VALUES (41, '¿Cuántos miembros conforman su hogar?', 1, 1, '1', 7, 1, '1');
INSERT INTO `preguntas` VALUES (42, 'Total de ingresos mensuales en el hogar', 1, 1, '1', 8, 1, '1');
INSERT INTO `preguntas` VALUES (43, '¿Qué tipo de colegio? ', 4, 2, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (44, 'Nombre del colegio donde se graduó:', 1, 2, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (45, '¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar', 5, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (46, '¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:', 6, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (47, '¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?', 7, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (48, 'Describa sus experiencias laborales más relevantes antes de su trabajo actual.', 8, 4, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (49, 'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo', 9, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (51, '¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila', 10, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (52, '¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila', 11, 3, '2', 0, 1, '1');
INSERT INTO `preguntas` VALUES (53, 'Principal ocupación del padre', 4, 1, '1', 9, 1, '1');
INSERT INTO `preguntas` VALUES (54, 'Principal ocupación de la madre', 4, 1, '1', 10, 1, '1');
INSERT INTO `preguntas` VALUES (55, '¿Cómo fue el financiamiento de sus estudios de grado?', 3, 1, '1', 11, 1, '1');
INSERT INTO `preguntas` VALUES (56, 'Indique los Egresos Familiares Mensuales', 1, 1, '1', 12, 1, '1');
INSERT INTO `preguntas` VALUES (57, 'La vivienda que dispone es', 4, 1, '1', 13, 1, '1');
INSERT INTO `preguntas` VALUES (58, '¿Cuenta con los servicios básicos?', 3, 1, '1', 14, 1, '1');
INSERT INTO `preguntas` VALUES (59, '¿Tiene alguna capacidad especial?', 4, 1, '1', 15, 1, '1');
INSERT INTO `preguntas` VALUES (60, 'En caso de tener capacidad especial, ¿De qué tipo es?', 3, 1, '1', 16, 1, '1');
INSERT INTO `preguntas` VALUES (61, '¿Recibe asistencia médica?', 4, 1, '1', 17, 1, '1');
INSERT INTO `preguntas` VALUES (62, 'Indique el tipo de asistencia médica', 3, 1, '1', 18, 1, '1');
INSERT INTO `preguntas` VALUES (63, 'Título obtenido en:', 4, 2, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (64, 'Calificación de grado del Bachillerato', 1, 2, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (65, '¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)', 1, 2, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (66, 'Título obtenido (UTEQ)', 4, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (67, 'Año en el que ingresó (UTEQ)', 1, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (68, 'Año en el que se incorporó (UTEQ)', 1, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (69, 'Promedio de graduación', 1, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (70, 'Pertenece a algún Colegio de Profesionales, nombre del Colegio', 1, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (71, 'Facultad', 4, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (72, '¿Estudió la carrera universitaria que eligió en primera opción?', 4, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (73, '¿Cuánto tiempo estudió en la UTEQ para obtener el título?', 2, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (74, 'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?', 4, 3, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (75, 'Actividad que desempeña actualmente.', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (76, '¿Qué tiempo transcurrió para obtener su primer empleo? ', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (77, '¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.', 3, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (78, '¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más', 3, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (79, 'Nombre de la Empresa:', 1, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (80, 'Lugar de trabajo (provincia, cantón, parroquia, etc.):', 2, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (81, 'Dirección de la Empresa: ', 1, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (82, 'Teléfono: ', 1, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (83, 'Email:', 1, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (84, 'Cargo que desempeña:  ', 1, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (87, 'Tiempo que lleva en la empresa: ', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (88, 'Tiempo que lleva en el cargo:', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (90, 'Nivel jerárquico', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (91, 'Condición de Trabajo', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (92, 'Relación del trabajo con su área de formación', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (93, 'Tipo de la empresa', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (94, 'Tamaño de la empresa u organización', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (95, 'Sector Económico de la Empresa u Organización', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (96, 'Señale en la siguiente escala su ingreso salarial mensual actual', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (97, 'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (98, 'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo', 3, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (99, '¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (100, '¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?', 4, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (101, 'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple', 3, 4, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (102, '¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (103, '¿Por qué?', 1, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (104, '¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (105, 'La bibliografía y el material sugerido por los docentes fue: ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (106, 'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (107, '¿Con qué frecuencia visita usted la UTEQ? ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (108, '¿Qué áreas reforzarías de tu plan de estudios?', 1, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (109, '¿Qué asignaturas considera que deben eliminarse del plan de estudios?', 1, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (110, '¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?', 1, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (111, '¿Hasta qué punto su ocupación se corresponde con su nivel de educación?', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (112, '¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?', 12, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (113, '¿Ha realizado trabajos de investigación científica hasta presente fecha? ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (114, '¿Ha publicado su investigación científica? ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (115, 'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ', 2, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (116, 'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ', 4, 5, '1', 0, 1, '1');
INSERT INTO `preguntas` VALUES (120, '_prueba mod1', 3, 6, '0', 0, 1, '1');
INSERT INTO `preguntas` VALUES (121, 'Nombre:', 1, 6, '1', NULL, 2, '1');
INSERT INTO `preguntas` VALUES (122, 'Direccion:', 1, 6, '1', NULL, 2, '1');
INSERT INTO `preguntas` VALUES (123, 'dir', 1, 6, '1', NULL, 2, '1');
INSERT INTO `preguntas` VALUES (124, 'ninguna', 1, 6, '1', NULL, 2, '1');
INSERT INTO `preguntas` VALUES (303, 'Nombres:', 1, 6, '1', 2, 3, '1');
INSERT INTO `preguntas` VALUES (304, 'Apellidos:', 1, 6, '1', 3, 3, '1');
INSERT INTO `preguntas` VALUES (305, 'Cédula de Identidad', 1, 6, '1', 1, 3, '1');
INSERT INTO `preguntas` VALUES (306, 'Fecha de Nacimiento', 1, 6, '1', 4, 3, '1');
INSERT INTO `preguntas` VALUES (307, 'Estado Civil', 4, 6, '1', 5, 3, '1');
INSERT INTO `preguntas` VALUES (308, 'País de nacimiento ', 1, 6, '1', 6, 3, '1');
INSERT INTO `preguntas` VALUES (309, 'Dirección Domiciliaria', 2, 6, '1', 7, 3, '1');
INSERT INTO `preguntas` VALUES (310, 'Teléfonos', 2, 6, '1', 8, 3, '1');
INSERT INTO `preguntas` VALUES (311, 'Correo(s) Electrónico(s)', 1, 6, '1', 9, 3, '1');
INSERT INTO `preguntas` VALUES (312, 'Genero', 4, 6, '1', 10, 3, '1');
INSERT INTO `preguntas` VALUES (313, '¿Cuenta con sus padres vivos?', 3, 1, '1', 1, 3, '1');
INSERT INTO `preguntas` VALUES (314, '¿Con quién  vive actualmente? ', 3, 1, '1', 2, 3, '1');
INSERT INTO `preguntas` VALUES (315, 'Nivel de formación del padre', 4, 1, '1', 3, 3, '1');
INSERT INTO `preguntas` VALUES (316, 'Nivel de formación de la madre', 4, 1, '1', 4, 3, '1');
INSERT INTO `preguntas` VALUES (317, '¿Tiene hermanos? ', 4, 1, '1', 5, 3, '1');
INSERT INTO `preguntas` VALUES (318, '¿Cuántos hermanos tiene?', 1, 1, '1', 6, 3, '1');
INSERT INTO `preguntas` VALUES (319, '¿Cuántos miembros conforman su hogar?', 1, 1, '1', 7, 3, '1');
INSERT INTO `preguntas` VALUES (320, 'Total de ingresos mensuales en el hogar', 1, 1, '1', 8, 3, '1');
INSERT INTO `preguntas` VALUES (321, '¿Qué tipo de colegio? ', 4, 2, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (322, 'Nombre del colegio donde se graduó:', 1, 2, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (323, '¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar', 5, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (324, '¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:', 6, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (325, '¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?', 7, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (326, 'Describa sus experiencias laborales más relevantes antes de su trabajo actual.', 8, 4, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (327, 'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo', 9, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (328, '¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila', 10, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (329, '¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila', 11, 3, '2', 0, 3, '1');
INSERT INTO `preguntas` VALUES (330, 'Principal ocupación del padre', 4, 1, '1', 9, 3, '1');
INSERT INTO `preguntas` VALUES (331, 'Principal ocupación de la madre', 4, 1, '1', 10, 3, '1');
INSERT INTO `preguntas` VALUES (332, '¿Cómo fue el financiamiento de sus estudios de grado?', 3, 1, '1', 11, 3, '1');
INSERT INTO `preguntas` VALUES (333, 'Indique los Egresos Familiares Mensuales', 1, 1, '1', 12, 3, '1');
INSERT INTO `preguntas` VALUES (334, 'La vivienda que dispone es', 4, 1, '1', 13, 3, '1');
INSERT INTO `preguntas` VALUES (335, '¿Cuenta con los servicios básicos?', 3, 1, '1', 14, 3, '1');
INSERT INTO `preguntas` VALUES (336, '¿Tiene alguna capacidad especial?', 4, 1, '1', 15, 3, '1');
INSERT INTO `preguntas` VALUES (337, 'En caso de tener capacidad especial, ¿De qué tipo es?', 3, 1, '1', 16, 3, '1');
INSERT INTO `preguntas` VALUES (338, '¿Recibe asistencia médica?', 4, 1, '1', 17, 3, '1');
INSERT INTO `preguntas` VALUES (339, 'Indique el tipo de asistencia médica', 3, 1, '1', 18, 3, '1');
INSERT INTO `preguntas` VALUES (340, 'Título obtenido en:', 4, 2, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (341, 'Calificación de grado del Bachillerato', 1, 2, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (342, '¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)', 1, 2, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (343, 'Título obtenido (UTEQ)', 4, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (344, 'Año en el que ingresó (UTEQ)', 1, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (345, 'Año en el que se incorporó (UTEQ)', 1, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (346, 'Promedio de graduación', 1, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (347, 'Pertenece a algún Colegio de Profesionales, nombre del Colegio', 1, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (348, 'Facultad', 4, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (349, '¿Estudió la carrera universitaria que eligió en primera opción?', 4, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (350, '¿Cuánto tiempo estudió en la UTEQ para obtener el título?', 2, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (351, 'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?', 4, 3, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (352, 'Actividad que desempeña actualmente.', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (353, '¿Qué tiempo transcurrió para obtener su primer empleo? ', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (354, '¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.', 3, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (355, '¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más', 3, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (356, 'Nombre de la Empresa:', 1, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (357, 'Lugar de trabajo (provincia, cantón, parroquia, etc.):', 2, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (358, 'Dirección de la Empresa: ', 1, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (359, 'Teléfono: ', 1, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (360, 'Email:', 1, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (361, 'Cargo que desempeña:  ', 1, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (362, 'Tiempo que lleva en la empresa: ', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (363, 'Tiempo que lleva en el cargo:', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (364, 'Nivel jerárquico', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (365, 'Condición de Trabajo', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (366, 'Relación del trabajo con su área de formación', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (367, 'Tipo de la empresa', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (368, 'Tamaño de la empresa u organización', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (369, 'Sector Económico de la Empresa u Organización', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (370, 'Señale en la siguiente escala su ingreso salarial mensual actual', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (371, 'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (372, 'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo', 3, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (373, '¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (374, '¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?', 4, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (375, 'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple', 3, 4, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (376, '¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (377, '¿Por qué?', 1, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (378, '¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (379, 'La bibliografía y el material sugerido por los docentes fue: ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (380, 'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (381, '¿Con qué frecuencia visita usted la UTEQ? ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (382, '¿Qué áreas reforzarías de tu plan de estudios?', 1, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (383, '¿Qué asignaturas considera que deben eliminarse del plan de estudios?', 1, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (384, '¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?', 1, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (385, '¿Hasta qué punto su ocupación se corresponde con su nivel de educación?', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (386, '¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?', 12, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (387, '¿Ha realizado trabajos de investigación científica hasta presente fecha? ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (388, '¿Ha publicado su investigación científica? ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (389, 'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ', 2, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (390, 'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ', 4, 5, '1', 0, 3, '1');
INSERT INTO `preguntas` VALUES (391, '_prueba mod1', 3, 6, '0', 0, 3, '1');
INSERT INTO `preguntas` VALUES (392, 'Nombres:', 1, 6, '1', 2, 2, '1');
INSERT INTO `preguntas` VALUES (393, 'Apellidos:', 1, 6, '1', 3, 2, '1');
INSERT INTO `preguntas` VALUES (394, 'Cédula de Identidad', 1, 6, '1', 1, 2, '1');
INSERT INTO `preguntas` VALUES (395, 'Fecha de Nacimiento', 1, 6, '1', 4, 2, '1');
INSERT INTO `preguntas` VALUES (396, 'Estado Civil', 4, 6, '1', 5, 2, '1');
INSERT INTO `preguntas` VALUES (397, 'País de nacimiento ', 1, 6, '1', 6, 2, '1');
INSERT INTO `preguntas` VALUES (398, 'Dirección Domiciliaria', 2, 6, '1', 7, 2, '1');
INSERT INTO `preguntas` VALUES (399, 'Teléfonos', 2, 6, '1', 8, 2, '1');
INSERT INTO `preguntas` VALUES (400, 'Correo(s) Electrónico(s)', 1, 6, '1', 9, 2, '1');
INSERT INTO `preguntas` VALUES (401, 'Genero', 4, 6, '1', 10, 2, '1');
INSERT INTO `preguntas` VALUES (402, '¿Cuenta con sus padres vivos?', 3, 1, '1', 1, 2, '1');
INSERT INTO `preguntas` VALUES (403, '¿Con quién  vive actualmente? ', 3, 1, '1', 2, 2, '1');
INSERT INTO `preguntas` VALUES (404, 'Nivel de formación del padre', 4, 1, '1', 3, 2, '1');
INSERT INTO `preguntas` VALUES (405, 'Nivel de formación de la madre', 4, 1, '1', 4, 2, '1');
INSERT INTO `preguntas` VALUES (406, '¿Tiene hermanos? ', 4, 1, '1', 5, 2, '1');
INSERT INTO `preguntas` VALUES (407, '¿Cuántos hermanos tiene?', 1, 1, '1', 6, 2, '1');
INSERT INTO `preguntas` VALUES (408, '¿Cuántos miembros conforman su hogar?', 1, 1, '1', 7, 2, '1');
INSERT INTO `preguntas` VALUES (409, 'Total de ingresos mensuales en el hogar', 1, 1, '1', 8, 2, '1');
INSERT INTO `preguntas` VALUES (410, '¿Qué tipo de colegio? ', 4, 2, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (411, 'Nombre del colegio donde se graduó:', 1, 2, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (412, '¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar', 5, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (413, '¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:', 6, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (414, '¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?', 7, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (415, 'Describa sus experiencias laborales más relevantes antes de su trabajo actual.', 8, 4, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (416, 'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo', 9, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (417, '¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila', 10, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (418, '¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila', 11, 3, '2', 0, 2, '1');
INSERT INTO `preguntas` VALUES (419, 'Principal ocupación del padre', 4, 1, '1', 9, 2, '1');
INSERT INTO `preguntas` VALUES (420, 'Principal ocupación de la madre', 4, 1, '1', 10, 2, '1');
INSERT INTO `preguntas` VALUES (421, '¿Cómo fue el financiamiento de sus estudios de grado?', 3, 1, '1', 11, 2, '1');
INSERT INTO `preguntas` VALUES (422, 'Indique los Egresos Familiares Mensuales', 1, 1, '1', 12, 2, '1');
INSERT INTO `preguntas` VALUES (423, 'La vivienda que dispone es', 4, 1, '1', 13, 2, '1');
INSERT INTO `preguntas` VALUES (424, '¿Cuenta con los servicios básicos?', 3, 1, '1', 14, 2, '1');
INSERT INTO `preguntas` VALUES (425, '¿Tiene alguna capacidad especial?', 4, 1, '1', 15, 2, '1');
INSERT INTO `preguntas` VALUES (426, 'En caso de tener capacidad especial, ¿De qué tipo es?', 3, 1, '1', 16, 2, '1');
INSERT INTO `preguntas` VALUES (427, '¿Recibe asistencia médica?', 4, 1, '1', 17, 2, '1');
INSERT INTO `preguntas` VALUES (428, 'Indique el tipo de asistencia médica', 3, 1, '1', 18, 2, '1');
INSERT INTO `preguntas` VALUES (429, 'Título obtenido en:', 4, 2, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (430, 'Calificación de grado del Bachillerato', 1, 2, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (431, '¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)', 1, 2, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (432, 'Título obtenido (UTEQ)', 4, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (433, 'Año en el que ingresó (UTEQ)', 1, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (434, 'Año en el que se incorporó (UTEQ)', 1, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (435, 'Promedio de graduación', 1, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (436, 'Pertenece a algún Colegio de Profesionales, nombre del Colegio', 1, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (437, 'Facultad', 4, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (438, '¿Estudió la carrera universitaria que eligió en primera opción?', 4, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (439, '¿Cuánto tiempo estudió en la UTEQ para obtener el título?', 2, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (440, 'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?', 4, 3, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (441, 'Actividad que desempeña actualmente.', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (442, '¿Qué tiempo transcurrió para obtener su primer empleo? ', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (443, '¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.', 3, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (444, '¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más', 3, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (445, 'Nombre de la Empresa:', 1, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (446, 'Lugar de trabajo (provincia, cantón, parroquia, etc.):', 2, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (447, 'Dirección de la Empresa: ', 1, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (448, 'Teléfono: ', 1, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (449, 'Email:', 1, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (450, 'Cargo que desempeña:  ', 1, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (451, 'Tiempo que lleva en la empresa: ', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (452, 'Tiempo que lleva en el cargo:', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (453, 'Nivel jerárquico', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (454, 'Condición de Trabajo', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (455, 'Relación del trabajo con su área de formación', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (456, 'Tipo de la empresa', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (457, 'Tamaño de la empresa u organización', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (458, 'Sector Económico de la Empresa u Organización', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (459, 'Señale en la siguiente escala su ingreso salarial mensual actual', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (460, 'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (461, 'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo', 3, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (462, '¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (463, '¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?', 4, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (464, 'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple', 3, 4, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (465, '¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (466, '¿Por qué?', 1, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (467, '¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (468, 'La bibliografía y el material sugerido por los docentes fue: ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (469, 'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (470, '¿Con qué frecuencia visita usted la UTEQ? ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (471, '¿Qué áreas reforzarías de tu plan de estudios?', 1, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (472, '¿Qué asignaturas considera que deben eliminarse del plan de estudios?', 1, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (473, '¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?', 1, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (474, '¿Hasta qué punto su ocupación se corresponde con su nivel de educación?', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (475, '¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?', 12, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (476, '¿Ha realizado trabajos de investigación científica hasta presente fecha? ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (477, '¿Ha publicado su investigación científica? ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (478, 'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ', 2, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (479, 'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ', 4, 5, '1', 0, 2, '1');
INSERT INTO `preguntas` VALUES (480, '_prueba mod1', 3, 6, '0', 0, 2, '1');
INSERT INTO `preguntas` VALUES (481, 'q', 5, 6, '0', 0, 4, '1');
INSERT INTO `preguntas` VALUES (482, 'casual', 1, 6, '1', 0, 4, '1');
INSERT INTO `preguntas` VALUES (483, 'Prueba tabla', 5, 6, '1', 0, 4, '1');
INSERT INTO `preguntas` VALUES (484, 'Nombres:', 1, 6, '1', 2, 10, '1');
INSERT INTO `preguntas` VALUES (485, 'Apellidos:', 1, 6, '1', 3, 10, '1');
INSERT INTO `preguntas` VALUES (486, 'Cédula de Identidad', 1, 6, '1', 1, 10, '1');
INSERT INTO `preguntas` VALUES (487, 'Fecha de Nacimiento', 1, 6, '1', 4, 10, '1');
INSERT INTO `preguntas` VALUES (488, 'Estado Civil', 4, 6, '1', 5, 10, '1');
INSERT INTO `preguntas` VALUES (489, 'País de nacimiento ', 1, 6, '1', 6, 10, '1');
INSERT INTO `preguntas` VALUES (490, 'Dirección Domiciliaria', 2, 6, '1', 7, 10, '1');
INSERT INTO `preguntas` VALUES (491, 'Teléfonos', 2, 6, '1', 8, 10, '1');
INSERT INTO `preguntas` VALUES (492, 'Correo(s) Electrónico(s)', 1, 6, '1', 9, 10, '1');
INSERT INTO `preguntas` VALUES (493, 'Genero', 4, 6, '1', 10, 10, '1');
INSERT INTO `preguntas` VALUES (494, '¿Cuenta con sus padres vivos?', 3, 1, '1', 1, 10, '1');
INSERT INTO `preguntas` VALUES (495, '¿Con quién  vive actualmente? ', 3, 1, '1', 2, 10, '1');
INSERT INTO `preguntas` VALUES (496, 'Nivel de formación del padre', 4, 1, '1', 3, 10, '1');
INSERT INTO `preguntas` VALUES (497, 'Nivel de formación de la madre', 4, 1, '1', 4, 10, '1');
INSERT INTO `preguntas` VALUES (498, '¿Tiene hermanos? ', 4, 1, '1', 5, 10, '1');
INSERT INTO `preguntas` VALUES (499, '¿Cuántos hermanos tiene?', 1, 1, '1', 6, 10, '1');
INSERT INTO `preguntas` VALUES (500, '¿Cuántos miembros conforman su hogar?', 1, 1, '1', 7, 10, '1');
INSERT INTO `preguntas` VALUES (501, 'Total de ingresos mensuales en el hogar', 1, 1, '1', 8, 10, '1');
INSERT INTO `preguntas` VALUES (502, '¿Qué tipo de colegio? ', 4, 2, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (503, 'Nombre del colegio donde se graduó:', 1, 2, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (504, '¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar', 5, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (505, '¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:', 6, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (506, '¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?', 7, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (507, 'Describa sus experiencias laborales más relevantes antes de su trabajo actual.', 8, 4, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (508, 'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo', 9, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (509, '¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila', 10, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (510, '¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila', 11, 3, '2', 0, 10, '1');
INSERT INTO `preguntas` VALUES (511, 'Principal ocupación del padre', 4, 1, '1', 9, 10, '1');
INSERT INTO `preguntas` VALUES (512, 'Principal ocupación de la madre', 4, 1, '1', 10, 10, '1');
INSERT INTO `preguntas` VALUES (513, '¿Cómo fue el financiamiento de sus estudios de grado?', 3, 1, '1', 11, 10, '1');
INSERT INTO `preguntas` VALUES (514, 'Indique los Egresos Familiares Mensuales', 1, 1, '1', 12, 10, '1');
INSERT INTO `preguntas` VALUES (515, 'La vivienda que dispone es', 4, 1, '1', 13, 10, '1');
INSERT INTO `preguntas` VALUES (516, '¿Cuenta con los servicios básicos?', 3, 1, '1', 14, 10, '1');
INSERT INTO `preguntas` VALUES (517, '¿Tiene alguna capacidad especial?', 4, 1, '1', 15, 10, '1');
INSERT INTO `preguntas` VALUES (518, 'En caso de tener capacidad especial, ¿De qué tipo es?', 3, 1, '1', 16, 10, '1');
INSERT INTO `preguntas` VALUES (519, '¿Recibe asistencia médica?', 4, 1, '1', 17, 10, '1');
INSERT INTO `preguntas` VALUES (520, 'Indique el tipo de asistencia médica', 3, 1, '1', 18, 10, '1');
INSERT INTO `preguntas` VALUES (521, 'Título obtenido en:', 4, 2, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (522, 'Calificación de grado del Bachillerato', 1, 2, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (523, '¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)', 1, 2, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (524, 'Título obtenido (UTEQ)', 4, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (525, 'Año en el que ingresó (UTEQ)', 1, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (526, 'Año en el que se incorporó (UTEQ)', 1, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (527, 'Promedio de graduación', 1, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (528, 'Pertenece a algún Colegio de Profesionales, nombre del Colegio', 1, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (529, 'Facultad', 4, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (530, '¿Estudió la carrera universitaria que eligió en primera opción?', 4, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (531, '¿Cuánto tiempo estudió en la UTEQ para obtener el título?', 2, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (532, 'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?', 4, 3, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (533, 'Actividad que desempeña actualmente.', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (534, '¿Qué tiempo transcurrió para obtener su primer empleo? ', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (535, '¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.', 3, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (536, '¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más', 3, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (537, 'Nombre de la Empresa:', 1, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (538, 'Lugar de trabajo (provincia, cantón, parroquia, etc.):', 2, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (539, 'Dirección de la Empresa: ', 1, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (540, 'Teléfono: ', 1, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (541, 'Email:', 1, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (542, 'Cargo que desempeña:  ', 1, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (543, 'Tiempo que lleva en la empresa: ', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (544, 'Tiempo que lleva en el cargo:', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (545, 'Nivel jerárquico', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (546, 'Condición de Trabajo', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (547, 'Relación del trabajo con su área de formación', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (548, 'Tipo de la empresa', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (549, 'Tamaño de la empresa u organización', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (550, 'Sector Económico de la Empresa u Organización', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (551, 'Señale en la siguiente escala su ingreso salarial mensual actual', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (552, 'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (553, 'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo', 3, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (554, '¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (555, '¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?', 4, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (556, 'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple', 3, 4, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (557, '¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (558, '¿Por qué?', 1, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (559, '¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (560, 'La bibliografía y el material sugerido por los docentes fue: ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (561, 'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (562, '¿Con qué frecuencia visita usted la UTEQ? ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (563, '¿Qué áreas reforzarías de tu plan de estudios?', 1, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (564, '¿Qué asignaturas considera que deben eliminarse del plan de estudios?', 1, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (565, '¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?', 1, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (566, '¿Hasta qué punto su ocupación se corresponde con su nivel de educación?', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (567, '¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?', 12, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (568, '¿Ha realizado trabajos de investigación científica hasta presente fecha? ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (569, '¿Ha publicado su investigación científica? ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (570, 'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ', 2, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (571, 'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ', 4, 5, '1', 0, 10, '1');
INSERT INTO `preguntas` VALUES (572, '_prueba mod1', 3, 6, '0', 0, 10, '1');
INSERT INTO `preguntas` VALUES (573, 'tabla1', 5, 6, '1', 0, 11, '1');
INSERT INTO `preguntas` VALUES (574, 'tabla 2', 5, 1, '1', 0, 11, '1');
INSERT INTO `preguntas` VALUES (575, 'tabla new', 5, 6, '0', 0, 11, '1');
INSERT INTO `preguntas` VALUES (576, 'tb new', 5, 1, '0', 0, 11, '1');
INSERT INTO `preguntas` VALUES (577, 'tb new 1', 5, 6, '1', 0, 11, '1');
INSERT INTO `preguntas` VALUES (578, 'tabla1', 5, 6, '1', 0, 12, '1');
INSERT INTO `preguntas` VALUES (579, 'tabla 2', 5, 1, '1', 0, 12, '1');
INSERT INTO `preguntas` VALUES (580, 'tabla new', 5, 6, '0', 0, 12, '1');
INSERT INTO `preguntas` VALUES (581, 'tb new', 5, 1, '0', 0, 12, '1');
INSERT INTO `preguntas` VALUES (582, 'tb new 1', 5, 6, '1', 0, 12, '1');
INSERT INTO `preguntas` VALUES (583, 'Test cambio tipo', 5, 6, '1', 0, 13, '1');
INSERT INTO `preguntas` VALUES (584, 'Test Ingreso Simple', 1, 6, '1', 0, 13, '1');
INSERT INTO `preguntas` VALUES (585, 'Test Ingreso Multiple', 2, 6, '1', 0, 13, '1');

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
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of preguntas_respuestas
-- ----------------------------
INSERT INTO `preguntas_respuestas` VALUES (30, '', 9, 494);
INSERT INTO `preguntas_respuestas` VALUES (31, '', 9, 495);
INSERT INTO `preguntas_respuestas` VALUES (32, '', 9, 513);
INSERT INTO `preguntas_respuestas` VALUES (33, '', 9, 516);
INSERT INTO `preguntas_respuestas` VALUES (34, '', 9, 518);
INSERT INTO `preguntas_respuestas` VALUES (35, '', 9, 520);
INSERT INTO `preguntas_respuestas` VALUES (36, '978', 9, 488);
INSERT INTO `preguntas_respuestas` VALUES (37, '989', 9, 493);
INSERT INTO `preguntas_respuestas` VALUES (38, '999', 9, 496);
INSERT INTO `preguntas_respuestas` VALUES (39, '1007', 9, 497);
INSERT INTO `preguntas_respuestas` VALUES (40, '1015', 9, 498);
INSERT INTO `preguntas_respuestas` VALUES (41, '1020', 9, 511);
INSERT INTO `preguntas_respuestas` VALUES (42, '1039', 9, 512);
INSERT INTO `preguntas_respuestas` VALUES (43, '1062', 9, 515);
INSERT INTO `preguntas_respuestas` VALUES (44, '1074', 9, 517);
INSERT INTO `preguntas_respuestas` VALUES (45, '1081', 9, 519);
INSERT INTO `preguntas_respuestas` VALUES (46, '1017', 9, 502);
INSERT INTO `preguntas_respuestas` VALUES (47, '1086', 9, 521);
INSERT INTO `preguntas_respuestas` VALUES (48, '', 9, 484);
INSERT INTO `preguntas_respuestas` VALUES (49, '', 9, 485);
INSERT INTO `preguntas_respuestas` VALUES (50, '', 9, 486);
INSERT INTO `preguntas_respuestas` VALUES (51, '', 9, 487);
INSERT INTO `preguntas_respuestas` VALUES (52, '', 9, 489);
INSERT INTO `preguntas_respuestas` VALUES (53, '', 9, 492);
INSERT INTO `preguntas_respuestas` VALUES (54, '', 9, 499);
INSERT INTO `preguntas_respuestas` VALUES (55, '', 9, 500);
INSERT INTO `preguntas_respuestas` VALUES (56, '', 9, 501);
INSERT INTO `preguntas_respuestas` VALUES (57, '', 9, 514);
INSERT INTO `preguntas_respuestas` VALUES (58, '', 9, 503);
INSERT INTO `preguntas_respuestas` VALUES (59, '', 9, 522);
INSERT INTO `preguntas_respuestas` VALUES (60, '', 9, 523);
INSERT INTO `preguntas_respuestas` VALUES (61, '', 9, 490);
INSERT INTO `preguntas_respuestas` VALUES (62, '', 9, 491);
INSERT INTO `preguntas_respuestas` VALUES (63, '[{\"nombres\":\"a\",\"apellidos\":\"a\",\"estado civil\":\"1\",\"id\":0},{\"nombres\":\"b\",\"apellidos\":\"b\",\"estado civil\":\"2\"}]', 8, 573);
INSERT INTO `preguntas_respuestas` VALUES (64, '[]', 8, 577);
INSERT INTO `preguntas_respuestas` VALUES (65, '[]', 8, 574);
INSERT INTO `preguntas_respuestas` VALUES (77, '[{\"cb1\":\"0\",\"cb2\":\"1\",\"id\":0},{\"cb2\":\"2\",\"id\":1}]', 12, 583);
INSERT INTO `preguntas_respuestas` VALUES (78, '', 12, 584);
INSERT INTO `preguntas_respuestas` VALUES (79, '', 12, 585);

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of respuestas
-- ----------------------------
INSERT INTO `respuestas` VALUES (1, 'kbsg', 48, 0);
INSERT INTO `respuestas` VALUES (2, '', 49, 0);
INSERT INTO `respuestas` VALUES (3, '', 50, 0);
INSERT INTO `respuestas` VALUES (4, '', 51, 0);
INSERT INTO `respuestas` VALUES (5, '', 52, 0);
INSERT INTO `respuestas` VALUES (6, '', 53, 0);
INSERT INTO `respuestas` VALUES (7, '', 54, 0);
INSERT INTO `respuestas` VALUES (8, '', 55, 0);
INSERT INTO `respuestas` VALUES (9, '', 56, 0);
INSERT INTO `respuestas` VALUES (10, '', 57, 0);
INSERT INTO `respuestas` VALUES (11, '', 58, 0);
INSERT INTO `respuestas` VALUES (12, '', 59, 0);
INSERT INTO `respuestas` VALUES (13, '', 60, 0);
INSERT INTO `respuestas` VALUES (14, '', 61, 984);
INSERT INTO `respuestas` VALUES (15, '', 61, 985);
INSERT INTO `respuestas` VALUES (16, '', 61, 986);
INSERT INTO `respuestas` VALUES (17, '', 62, 987);
INSERT INTO `respuestas` VALUES (18, '', 62, 988);
INSERT INTO `respuestas` VALUES (28, 'Ingreso Simple', 78, 0);
INSERT INTO `respuestas` VALUES (29, 'Multiple01', 79, 1340);
INSERT INTO `respuestas` VALUES (30, 'Multiple02', 79, 1341);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of titulo
-- ----------------------------
INSERT INTO `titulo` VALUES (6, 3, 2, 6, '2017-10-10', '2017-10-16', 1, 1);
INSERT INTO `titulo` VALUES (7, 8, 9, 72, '2017-02-10', '2017-10-10', 4, 2);

-- ----------------------------
-- View structure for viewencuesta
-- ----------------------------
DROP VIEW IF EXISTS `viewencuesta`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewencuesta` AS select `e`.`id` AS `id`,`e`.`nombre` AS `nombre`,`e`.`fecha` AS `fecha`,`e`.`carrera_id` AS `carrera`,`e`.`estado` AS `estado`,count(`p`.`id`) AS `total_preguntas` from ((`encuestas` `e` join `carreras` `c` on((`c`.`id` = `e`.`carrera_id`))) left join `preguntas` `p` on(((`p`.`Encuestas_id` = `e`.`id`) and (`p`.`estado` = '1')))) group by `e`.`id`;

-- ----------------------------
-- View structure for viewfilecarrera
-- ----------------------------
DROP VIEW IF EXISTS `viewfilecarrera`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewfilecarrera` AS select `est`.`id` AS `codigoEstudiante`,`est`.`cedula` AS `cedula`,`est`.`nombres` AS `Estudiante`,`f`.`nombre` AS `Facultad`,`c`.`nombre` AS `Carrera`,`c_e`.`id` AS `encuestas`,`c_e`.`estado` AS `estado` from (((((`carreras_encuesta` `c_e` join `encuestas` `e` on((`e`.`id` = `c_e`.`Encuestas_id`))) join `carreras` `c` on((`c`.`id` = `e`.`carrera_id`))) join `facultad` `f` on((`f`.`id` = `c`.`Facultad_id`))) join `titulo` `t` on((`t`.`id` = `c_e`.`Titulo_id`))) join `estudiante` `est` on((`est`.`id` = `t`.`Estudiante_id`)));

-- ----------------------------
-- View structure for viewpreguntaencuestascarrera
-- ----------------------------
DROP VIEW IF EXISTS `viewpreguntaencuestascarrera`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `viewpreguntaencuestascarrera` AS select `p`.`id` AS `id`,`p`.`enunciado` AS `enunciado`,`p`.`tipo` AS `tipo`,`p_r`.`encuesta_carreras_id` AS `encuesta_carreras_id`,`cat`.`order_` AS `catOrder`,`p`.`order_by` AS `pregOrder` from ((`preguntas_respuestas` `p_r` join `preguntas` `p` on(((`p`.`id` = `p_r`.`pregunta_id`) and (`p`.`estado_excel` = 1)))) join `categoria` `cat` on((`cat`.`id` = `p`.`categoria_id`)));

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
