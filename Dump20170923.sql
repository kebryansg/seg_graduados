-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: seg_graduados_mod
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Facultad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Carreras_Facultad1_idx` (`Facultad_id`),
  CONSTRAINT `fk_Carreras_Facultad1` FOREIGN KEY (`Facultad_id`) REFERENCES `facultad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `order_` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'CONDICIÓN SOCIO-ECONÓMICA',2),(2,'INFORMACIÓN SOBRE EL BACHILLERATO',3),(3,'INFORMACIÓN DE LOS ESTUDIOS',4),(4,'INFORMACIÓN LABORAL',5),(5,'SATISFACCIÓN CON LA FORMACION Y ATENCION OFRECIDA POR LA UNIVERSIDAD',6),(6,'DATOS PERSONALES',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_titulo`
--

DROP TABLE IF EXISTS `encuesta_titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta_titulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acceso` longtext,
  `fecha` date DEFAULT NULL,
  `Encuestas_id` int(11) NOT NULL,
  `Titulo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encuesta_titulo_Encuestas1_idx` (`Encuestas_id`),
  KEY `fk_encuesta_titulo_Titulo1_idx` (`Titulo_id`),
  CONSTRAINT `fk_encuesta_titulo_Encuestas1` FOREIGN KEY (`Encuestas_id`) REFERENCES `encuestas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_encuesta_titulo_Titulo1` FOREIGN KEY (`Titulo_id`) REFERENCES `titulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_titulo`
--

LOCK TABLES `encuesta_titulo` WRITE;
/*!40000 ALTER TABLE `encuesta_titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuestas`
--

DROP TABLE IF EXISTS `encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuestas`
--

LOCK TABLES `encuestas` WRITE;
/*!40000 ALTER TABLE `encuestas` DISABLE KEYS */;
INSERT INTO `encuestas` VALUES (1,'Encuesta 2015','2017-09-15','1'),(2,'Encuesta 2016','2017-09-15','1'),(3,'Encuesta 2017','2017-09-15','1'),(4,'Encuesta 2014','2017-09-23','1'),(5,'Encuesta 2013','2017-09-17','1'),(6,'Encuesta 2012','2017-09-17','1'),(7,'Encuesta 2011','2017-09-17','1'),(8,'Encuesta 2010','2017-09-17','1');
/*!40000 ALTER TABLE `encuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `cedula` char(10) DEFAULT NULL,
  `nombres` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` longtext,
  `preguntas_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opciones_preguntas_idx` (`preguntas_id`),
  CONSTRAINT `fk_opciones_preguntas` FOREIGN KEY (`preguntas_id`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (16,'Soltero',29),(17,'Viudo',29),(18,'Unión libre',29),(19,'Casado',29),(20,'Divorciado',29),(21,'Separado',29),(22,'Provincia',31),(23,'Cantón',31),(24,'Sector',31),(25,'Convencional(es)',32),(26,'Celular(es)',32),(27,'Masculino',34),(28,'Femenino',34),(29,'Padre',35),(30,'Madre',35),(31,'Padres',36),(32,'Tíos',36),(33,'Hermanos',36),(34,'Abuelos',36),(35,'Otros Parientes',36),(36,'Independiente',36),(37,'Primaria',37),(38,'Secundaria',37),(39,'Superior Universitaria culminada',37),(40,'Superior Universitaria no culminada',37),(41,'Posgrado',37),(42,'Centro de alfabetización',37),(43,'No sabe, no vive el padre',37),(44,'Ninguna',37),(45,'Primaria',38),(46,'Secundaria',38),(47,'Superior Universitaria culminada',38),(48,'Superior Universitaria no culminada',38),(49,'Posgrado',38),(50,'Centro de alfabetización',38),(51,'No sabe, no vive con la madre',38),(52,'Ninguna',38),(53,'Si',39),(54,'No',39),(55,'Fiscal',43),(56,'Fiscomisional',43),(57,'Particular',43),(58,'Agricultor',53),(59,'Dependiente del gobierno',53),(60,'Funcionario público',53),(61,'Dependientes del comercio, vendedores o similares',53),(62,'Empresario',53),(63,'Arquitectos, ingenieros y profesionales similares',53),(64,'Profesionales de la salud',53),(65,'Profesionales de la agropecuaria',53),(66,'Profesionales del Derecho',53),(67,'Profesor(a) de primaria',53),(68,'Profesor(a) de secundaria',53),(69,'Profesor(a) de Universidad',53),(70,'Otros profesionales de enseñanza',53),(71,'Legislador',53),(72,'Director y jefe ejecutivo',53),(73,'Gerente del departamento',53),(74,'Empleado de oficina',53),(75,'Fuerzas Armadas y Policía',53),(76,'Otra',53),(77,'Agricultor',54),(78,'Dependiente del gobierno',54),(79,'Funcionario público',54),(80,'Dependientes del comercio, vendedores o similares',54),(81,'Empresario',54),(82,'Arquitectos, ingenieros y profesionales similares',54),(83,'Profesionales de la salud',54),(84,'Profesionales de la agropecuaria',54),(85,'Profesionales del Derecho',54),(86,'Profesor(a) de primaria',54),(87,'Profesor(a) de secundaria',54),(88,'Profesor(a) de Universidad',54),(89,'Otros profesionales de enseñanza',54),(90,'Legislador',54),(91,'Director y jefe ejecutivo',54),(92,'Gerente del departamento',54),(93,'Empleado de oficina',54),(94,'Fuerzas Armadas y Policía',54),(95,'Otra',54),(96,'Sueldo propio',55),(97,'Crédito',55),(98,'Beca',55),(99,'Otro Padres',55),(100,'Propia',57),(101,'Familiar',57),(102,'Prestada',57),(103,'Arrendada',57),(104,'Hipotecada',57),(105,'Otro',57),(106,'Agua potable',58),(107,'Energía eléctrica',58),(108,'Recolección de basura',58),(109,'Agua entubada',58),(110,'Alcantarillado',58),(111,'Teléfono',58),(112,'Si',59),(113,'No',59),(114,'Auditiva',60),(115,'Física',60),(116,'Intelectual',60),(117,'Visual',60),(118,'Multidiscapacidad',60),(119,'Si',61),(120,'No',61),(121,'Pública',62),(122,'Privada',62),(123,'Universitaria',62),(124,'Ciencias',63),(125,'Polivalente',63),(126,'Técnico',63),(127,'Artes',63),(128,'Otro',63),(129,'Si',72),(130,'No',72),(131,'Años',73),(132,'Meses',73),(133,'1. En muy alto grado',74),(134,'2',74),(135,'3',74),(136,'4',74),(137,'5. De ningún modo',74),(138,'6. No aplica, sin trabajo',74),(139,'Trabaja',75),(140,'Estudia',75),(141,'Ambas',75),(142,'Ni estudia Ni trabaja',75),(143,'Antes de graduar',76),(144,'Menos de 6 meses luego de graduar',76),(145,'Entre 6 meses y un año luego de graduar',76),(146,'Más de un año luego de graduar',76),(147,'Apliqué para un anuncio de vacante',77),(148,'Contacté empleadores sin saber si había una vacante',77),(149,'Publiqué mi oferta de servicios',77),(150,'Fui contactado por un empleador',77),(151,'Contacté una agencia pública de empleo',77),(152,'Contacté una agencia comercial de empleo',77),(153,'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior',77),(154,'Solicité la ayuda del personal docente de la institución de educación superior',77),(155,'Establecí contactos mientras trabajaba durante mis estudios',77),(156,'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)',77),(157,'Empecé mi propio negocio/ autoempleo',77),(158,'Ser de universidad de prestigio',78),(159,'Experiencia laboral en la especialidad',78),(160,'Expediente académico – Notas - Calificaciones',78),(161,'Tener título profesional en el área de trabajo',78),(162,'Aprobar examen',78),(163,'Experiencia en el extranjero',78),(164,'Conocimiento de idiomas extranjeros',78),(165,'Conocimientos de informática',78),(166,'Habilidades personales',78),(167,'Entrevista personal',78),(168,'Por tener convenio con la UTEQ',78),(169,'Recomendaciones/referencias de terceras personas',78),(170,'País:',80),(171,'Provincia:',80),(172,'Cantón:',80),(173,'Menos de un año',87),(174,'Un año',87),(175,'Dos años',87),(176,'Tres años ',87),(177,'Más de tres años',87),(178,'Menos de un año',88),(179,'Un año',88),(180,'Dos años',88),(181,'Tres años',88),(182,'Más de tres años',88),(183,'Técnico',90),(184,'Jefe de área',90),(185,'Supervisor ',90),(186,'Funcionario ',90),(187,'Directivo',90),(188,'Empresario',90),(189,'Nombramiento',91),(190,'Contrato ',91),(191,'Eventual',91),(192,'0%',92),(193,'1-20%',92),(194,'21-40%',92),(195,'41-60%',92),(196,'61-80%',92),(197,'81-100%',92),(198,'Propia',93),(199,'Pública ',93),(200,'Privada',93),(201,'Social-ONG',93),(202,'Microempresa (1-30 Personas) ',94),(203,'Pequeña (31-100 Personas) ',94),(204,'Mediana (101-500 Personas) ',94),(205,'Grande (más de 500 Personas) ',94),(206,'Agroindustrial',95),(207,'Agrícola',95),(208,'Pecuario',95),(209,'Pesquero ',95),(210,'Minero',95),(211,'Forestal',95),(212,'Industrial ',95),(213,'Construcción ',95),(214,'Petrolero ',95),(215,'Educativo',95),(216,'Turismo',95),(217,'Comercio',95),(218,'Jurídico',95),(219,'Informático',95),(220,'Finanzas ',95),(221,'De 354 a 500 USD	',96),(222,'De 501 a 700 USD',96),(223,'De 701 a 900 USD',96),(224,'De 901 a 1200 USD',96),(225,'De 1201 a 1500 USD',96),(226,'De 1501 a 2000 USD',96),(227,'De 2001 a 3000 USD',96),(228,'De 3001 a 5000 USD',96),(229,'Mayor a 5000 USD',96),(230,'Tengo un empleo regular / Yo soy trabajador por cuenta propia',97),(231,'Tengo trabajos ocasionales relacionados con mi estudio',97),(232,'Tengo trabajos ocasionales NO relacionados con mi estudio',97),(233,'Tengo más de un trabajo',97),(234,'Actualmente estoy haciendo servicio militar o civil.',97),(235,'Capacidad de abstracción, análisis y síntesis',98),(236,'Capacidad de aplicar los conocimientos en la práctica',98),(237,'Capacidad para organizar y planificar el tiempo',98),(238,'Conocimientos sobre el área de estudio y la profesión',98),(239,'Responsabilidad social y compromiso ciudadano',98),(240,'Capacidad de comunicación oral  y escrita',98),(241,'Capacidad de comunicación en un segundo idioma',98),(242,'Habilidades en el uso de las tecnologías de la información y de la comunicación',98),(243,'Capacidad de investigación',98),(244,'Capacidad de aprender y actualizarse permanentemente',98),(245,'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas',98),(246,'Capacidad crítica y autocrítica',98),(247,'Capacidad para actuar en nuevas situaciones',98),(248,'Capacidad para identificar, plantear y resolver problemas',98),(249,'Capacidad para tomar decisiones',98),(250,'Capacidad de trabajo en equipo',98),(251,'Habilidades interpersonales',98),(252,'Capacidad de motivar y conducir hacia metas comunes',98),(253,'Compromiso con la preservación del medio ambiente',98),(254,'Capacidad creativa',98),(255,'Compromiso con su medio socio-cultural',98),(256,'Valoración y respecto por la diversidad y multiculturalidad',98),(257,'Habilidad para trabajar en contextos internacionales',98),(258,'Habilidad para trabajar en forma autónoma',98),(259,'Capacidad para formular y gestionar proyectos',98),(260,'Compromiso ético',98),(261,'Compromiso con la calidad',98),(262,'1. Peor de lo que me esperaba',99),(263,'2.',99),(264,'3.',99),(265,'4.',99),(266,'5. Mucho mejor de lo que me esperaba',99),(267,'0. No he tenido ninguna expectativa',99),(268,'1. Nada en absoluto',100),(269,'2.',100),(270,'3.',100),(271,'4.',100),(272,'5. En un grado muy alto',100),(273,'No aplicable, considero que mi trabajo se corresponde con mis estudios',101),(274,'Todavía no he encontrado un trabajo más apropiado',101),(275,'Haciendo este trabajo tengo mejores perspectivas profesionales. ',101),(276,'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ',101),(277,'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ',101),(278,'Consigo ingresos más altos con mi trabajo actual. ',101),(279,'Mi trabajo actual me ofrece seguridad. ',101),(280,'Mi trabajo actual es interesante. ',101),(281,'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ',101),(282,'Mi trabajo actual me permite trabajar en la localidad que prefiero.',101),(283,'Mi trabajo actual me permite atender las obligaciones familiares.',101),(284,'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.',101),(285,'Muy satisfecho',102),(286,'Satisfecho',102),(287,'Poco satisfecho',102),(288,'No satisfecho',102),(289,'Excelente',104),(290,'Muy buenos',104),(291,'Buenos',104),(292,'Regulares',104),(293,'Deficientes',104),(294,'Excelente',105),(295,'Muy buenos',105),(296,'Buenos',105),(297,'Regulares',105),(298,'Deficientes',105),(299,'Excelentes',106),(300,'Muy buenos',106),(301,'Buenos',106),(302,'Regulares',106),(303,'Deficientes',106),(304,'Constantemente',107),(305,'Rara vez',107),(306,'Nunca ',107),(307,'1. Nada apropiado',111),(308,'2.',111),(309,'3.',111),(310,'4.',111),(311,'5. Completamente apropiado',111),(312,'Constantemente',113),(313,'Rara vez',113),(314,'Nunca',113),(315,'Si',114),(316,'No',114),(317,'Conferencia académica',115),(318,'Revista no indexada',115),(319,'Informe técnico',115),(320,'Revista indexada (latindex, scielo, isi/jcr, scopus)',115),(321,'Si',116),(322,'No',116),(323,'1 mod',120),(324,'2 mod',120),(325,'Ing. Sistemas',66),(326,'Ing. Diseño Grafico',66),(327,'Ing. Agroindustrial',66),(328,'Ing. Telematica',66),(329,'Ing. Seguridad Industrial',66),(330,'F. Ciencias de la Ingenieria',71),(331,'F. Ciencias Empresariales',71),(332,'F. Ciencias Ambientales',71),(333,'F. Ciencias Agrarias',71),(334,'F. Ciencias Pecuarias',71),(335,'Ud. Estudios a Distancia',71),(336,'Soltero',307),(337,'Viudo',307),(338,'Unión libre',307),(339,'Casado',307),(340,'Divorciado',307),(341,'Separado',307),(342,'Provincia',309),(343,'Cantón',309),(344,'Sector',309),(345,'Convencional(es)',310),(346,'Celular(es)',310),(347,'Masculino',312),(348,'Femenino',312),(349,'Padre',313),(350,'Madre',313),(351,'Padres',314),(352,'Tíos',314),(353,'Hermanos',314),(354,'Abuelos',314),(355,'Otros Parientes',314),(356,'Independiente',314),(357,'Primaria',315),(358,'Secundaria',315),(359,'Superior Universitaria culminada',315),(360,'Superior Universitaria no culminada',315),(361,'Posgrado',315),(362,'Centro de alfabetización',315),(363,'No sabe, no vive el padre',315),(364,'Ninguna',315),(365,'Primaria',316),(366,'Secundaria',316),(367,'Superior Universitaria culminada',316),(368,'Superior Universitaria no culminada',316),(369,'Posgrado',316),(370,'Centro de alfabetización',316),(371,'No sabe, no vive con la madre',316),(372,'Ninguna',316),(373,'Si',317),(374,'No',317),(375,'Fiscal',321),(376,'Fiscomisional',321),(377,'Particular',321),(378,'Agricultor',330),(379,'Dependiente del gobierno',330),(380,'Funcionario público',330),(381,'Dependientes del comercio, vendedores o similares',330),(382,'Empresario',330),(383,'Arquitectos, ingenieros y profesionales similares',330),(384,'Profesionales de la salud',330),(385,'Profesionales de la agropecuaria',330),(386,'Profesionales del Derecho',330),(387,'Profesor(a) de primaria',330),(388,'Profesor(a) de secundaria',330),(389,'Profesor(a) de Universidad',330),(390,'Otros profesionales de enseñanza',330),(391,'Legislador',330),(392,'Director y jefe ejecutivo',330),(393,'Gerente del departamento',330),(394,'Empleado de oficina',330),(395,'Fuerzas Armadas y Policía',330),(396,'Otra',330),(397,'Agricultor',331),(398,'Dependiente del gobierno',331),(399,'Funcionario público',331),(400,'Dependientes del comercio, vendedores o similares',331),(401,'Empresario',331),(402,'Arquitectos, ingenieros y profesionales similares',331),(403,'Profesionales de la salud',331),(404,'Profesionales de la agropecuaria',331),(405,'Profesionales del Derecho',331),(406,'Profesor(a) de primaria',331),(407,'Profesor(a) de secundaria',331),(408,'Profesor(a) de Universidad',331),(409,'Otros profesionales de enseñanza',331),(410,'Legislador',331),(411,'Director y jefe ejecutivo',331),(412,'Gerente del departamento',331),(413,'Empleado de oficina',331),(414,'Fuerzas Armadas y Policía',331),(415,'Otra',331),(416,'Sueldo propio',332),(417,'Crédito',332),(418,'Beca',332),(419,'Otro Padres',332),(420,'Propia',334),(421,'Familiar',334),(422,'Prestada',334),(423,'Arrendada',334),(424,'Hipotecada',334),(425,'Otro',334),(426,'Agua potable',335),(427,'Energía eléctrica',335),(428,'Recolección de basura',335),(429,'Agua entubada',335),(430,'Alcantarillado',335),(431,'Teléfono',335),(432,'Si',336),(433,'No',336),(434,'Auditiva',337),(435,'Física',337),(436,'Intelectual',337),(437,'Visual',337),(438,'Multidiscapacidad',337),(439,'Si',338),(440,'No',338),(441,'Pública',339),(442,'Privada',339),(443,'Universitaria',339),(444,'Ciencias',340),(445,'Polivalente',340),(446,'Técnico',340),(447,'Artes',340),(448,'Otro',340),(449,'Ing. Sistemas',343),(450,'Ing. Diseño Grafico',343),(451,'Ing. Agroindustrial',343),(452,'Ing. Telematica',343),(453,'Ing. Seguridad Industrial',343),(454,'F. Ciencias de la Ingenieria',348),(455,'F. Ciencias Empresariales',348),(456,'F. Ciencias Ambientales',348),(457,'F. Ciencias Agrarias',348),(458,'F. Ciencias Pecuarias',348),(459,'Ud. Estudios a Distancia',348),(460,'Si',349),(461,'No',349),(462,'Años',350),(463,'Meses',350),(464,'1. En muy alto grado',351),(465,'2',351),(466,'3',351),(467,'4',351),(468,'5. De ningún modo',351),(469,'6. No aplica, sin trabajo',351),(470,'Trabaja',352),(471,'Estudia',352),(472,'Ambas',352),(473,'Ni estudia Ni trabaja',352),(474,'Antes de graduar',353),(475,'Menos de 6 meses luego de graduar',353),(476,'Entre 6 meses y un año luego de graduar',353),(477,'Más de un año luego de graduar',353),(478,'Apliqué para un anuncio de vacante',354),(479,'Contacté empleadores sin saber si había una vacante',354),(480,'Publiqué mi oferta de servicios',354),(481,'Fui contactado por un empleador',354),(482,'Contacté una agencia pública de empleo',354),(483,'Contacté una agencia comercial de empleo',354),(484,'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior',354),(485,'Solicité la ayuda del personal docente de la institución de educación superior',354),(486,'Establecí contactos mientras trabajaba durante mis estudios',354),(487,'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)',354),(488,'Empecé mi propio negocio/ autoempleo',354),(489,'Ser de universidad de prestigio',355),(490,'Experiencia laboral en la especialidad',355),(491,'Expediente académico – Notas - Calificaciones',355),(492,'Tener título profesional en el área de trabajo',355),(493,'Aprobar examen',355),(494,'Experiencia en el extranjero',355),(495,'Conocimiento de idiomas extranjeros',355),(496,'Conocimientos de informática',355),(497,'Habilidades personales',355),(498,'Entrevista personal',355),(499,'Por tener convenio con la UTEQ',355),(500,'Recomendaciones/referencias de terceras personas',355),(501,'País:',357),(502,'Provincia:',357),(503,'Cantón:',357),(504,'Menos de un año',362),(505,'Un año',362),(506,'Dos años',362),(507,'Tres años ',362),(508,'Más de tres años',362),(509,'Menos de un año',363),(510,'Un año',363),(511,'Dos años',363),(512,'Tres años',363),(513,'Más de tres años',363),(514,'Técnico',364),(515,'Jefe de área',364),(516,'Supervisor ',364),(517,'Funcionario ',364),(518,'Directivo',364),(519,'Empresario',364),(520,'Nombramiento',365),(521,'Contrato ',365),(522,'Eventual',365),(523,'0%',366),(524,'1-20%',366),(525,'21-40%',366),(526,'41-60%',366),(527,'61-80%',366),(528,'81-100%',366),(529,'Propia',367),(530,'Pública ',367),(531,'Privada',367),(532,'Social-ONG',367),(533,'Microempresa (1-30 Personas) ',368),(534,'Pequeña (31-100 Personas) ',368),(535,'Mediana (101-500 Personas) ',368),(536,'Grande (más de 500 Personas) ',368),(537,'Agroindustrial',369),(538,'Agrícola',369),(539,'Pecuario',369),(540,'Pesquero ',369),(541,'Minero',369),(542,'Forestal',369),(543,'Industrial ',369),(544,'Construcción ',369),(545,'Petrolero ',369),(546,'Educativo',369),(547,'Turismo',369),(548,'Comercio',369),(549,'Jurídico',369),(550,'Informático',369),(551,'Finanzas ',369),(552,'De 354 a 500 USD	',370),(553,'De 501 a 700 USD',370),(554,'De 701 a 900 USD',370),(555,'De 901 a 1200 USD',370),(556,'De 1201 a 1500 USD',370),(557,'De 1501 a 2000 USD',370),(558,'De 2001 a 3000 USD',370),(559,'De 3001 a 5000 USD',370),(560,'Mayor a 5000 USD',370),(561,'Tengo un empleo regular / Yo soy trabajador por cuenta propia',371),(562,'Tengo trabajos ocasionales relacionados con mi estudio',371),(563,'Tengo trabajos ocasionales NO relacionados con mi estudio',371),(564,'Tengo más de un trabajo',371),(565,'Actualmente estoy haciendo servicio militar o civil.',371),(566,'Capacidad de abstracción, análisis y síntesis',372),(567,'Capacidad de aplicar los conocimientos en la práctica',372),(568,'Capacidad para organizar y planificar el tiempo',372),(569,'Conocimientos sobre el área de estudio y la profesión',372),(570,'Responsabilidad social y compromiso ciudadano',372),(571,'Capacidad de comunicación oral  y escrita',372),(572,'Capacidad de comunicación en un segundo idioma',372),(573,'Habilidades en el uso de las tecnologías de la información y de la comunicación',372),(574,'Capacidad de investigación',372),(575,'Capacidad de aprender y actualizarse permanentemente',372),(576,'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas',372),(577,'Capacidad crítica y autocrítica',372),(578,'Capacidad para actuar en nuevas situaciones',372),(579,'Capacidad para identificar, plantear y resolver problemas',372),(580,'Capacidad para tomar decisiones',372),(581,'Capacidad de trabajo en equipo',372),(582,'Habilidades interpersonales',372),(583,'Capacidad de motivar y conducir hacia metas comunes',372),(584,'Compromiso con la preservación del medio ambiente',372),(585,'Capacidad creativa',372),(586,'Compromiso con su medio socio-cultural',372),(587,'Valoración y respecto por la diversidad y multiculturalidad',372),(588,'Habilidad para trabajar en contextos internacionales',372),(589,'Habilidad para trabajar en forma autónoma',372),(590,'Capacidad para formular y gestionar proyectos',372),(591,'Compromiso ético',372),(592,'Compromiso con la calidad',372),(593,'1. Peor de lo que me esperaba',373),(594,'2.',373),(595,'3.',373),(596,'4.',373),(597,'5. Mucho mejor de lo que me esperaba',373),(598,'0. No he tenido ninguna expectativa',373),(599,'1. Nada en absoluto',374),(600,'2.',374),(601,'3.',374),(602,'4.',374),(603,'5. En un grado muy alto',374),(604,'No aplicable, considero que mi trabajo se corresponde con mis estudios',375),(605,'Todavía no he encontrado un trabajo más apropiado',375),(606,'Haciendo este trabajo tengo mejores perspectivas profesionales. ',375),(607,'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ',375),(608,'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ',375),(609,'Consigo ingresos más altos con mi trabajo actual. ',375),(610,'Mi trabajo actual me ofrece seguridad. ',375),(611,'Mi trabajo actual es interesante. ',375),(612,'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ',375),(613,'Mi trabajo actual me permite trabajar en la localidad que prefiero.',375),(614,'Mi trabajo actual me permite atender las obligaciones familiares.',375),(615,'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.',375),(616,'Muy satisfecho',376),(617,'Satisfecho',376),(618,'Poco satisfecho',376),(619,'No satisfecho',376),(620,'Excelente',378),(621,'Muy buenos',378),(622,'Buenos',378),(623,'Regulares',378),(624,'Deficientes',378),(625,'Excelente',379),(626,'Muy buenos',379),(627,'Buenos',379),(628,'Regulares',379),(629,'Deficientes',379),(630,'Excelentes',380),(631,'Muy buenos',380),(632,'Buenos',380),(633,'Regulares',380),(634,'Deficientes',380),(635,'Constantemente',381),(636,'Rara vez',381),(637,'Nunca ',381),(638,'1. Nada apropiado',385),(639,'2.',385),(640,'3.',385),(641,'4.',385),(642,'5. Completamente apropiado',385),(643,'Constantemente',387),(644,'Rara vez',387),(645,'Nunca',387),(646,'Si',388),(647,'No',388),(648,'Conferencia académica',389),(649,'Revista no indexada',389),(650,'Informe técnico',389),(651,'Revista indexada (latindex, scielo, isi/jcr, scopus)',389),(652,'Si',390),(653,'No',390),(654,'1 mod',391),(655,'2 mod',391),(656,'Soltero',396),(657,'Viudo',396),(658,'Unión libre',396),(659,'Casado',396),(660,'Divorciado',396),(661,'Separado',396),(662,'Provincia',398),(663,'Cantón',398),(664,'Sector',398),(665,'Convencional(es)',399),(666,'Celular(es)',399),(667,'Masculino',401),(668,'Femenino',401),(669,'Padre',402),(670,'Madre',402),(671,'Padres',403),(672,'Tíos',403),(673,'Hermanos',403),(674,'Abuelos',403),(675,'Otros Parientes',403),(676,'Independiente',403),(677,'Primaria',404),(678,'Secundaria',404),(679,'Superior Universitaria culminada',404),(680,'Superior Universitaria no culminada',404),(681,'Posgrado',404),(682,'Centro de alfabetización',404),(683,'No sabe, no vive el padre',404),(684,'Ninguna',404),(685,'Primaria',405),(686,'Secundaria',405),(687,'Superior Universitaria culminada',405),(688,'Superior Universitaria no culminada',405),(689,'Posgrado',405),(690,'Centro de alfabetización',405),(691,'No sabe, no vive con la madre',405),(692,'Ninguna',405),(693,'Si',406),(694,'No',406),(695,'Fiscal',410),(696,'Fiscomisional',410),(697,'Particular',410),(698,'Agricultor',419),(699,'Dependiente del gobierno',419),(700,'Funcionario público',419),(701,'Dependientes del comercio, vendedores o similares',419),(702,'Empresario',419),(703,'Arquitectos, ingenieros y profesionales similares',419),(704,'Profesionales de la salud',419),(705,'Profesionales de la agropecuaria',419),(706,'Profesionales del Derecho',419),(707,'Profesor(a) de primaria',419),(708,'Profesor(a) de secundaria',419),(709,'Profesor(a) de Universidad',419),(710,'Otros profesionales de enseñanza',419),(711,'Legislador',419),(712,'Director y jefe ejecutivo',419),(713,'Gerente del departamento',419),(714,'Empleado de oficina',419),(715,'Fuerzas Armadas y Policía',419),(716,'Otra',419),(717,'Agricultor',420),(718,'Dependiente del gobierno',420),(719,'Funcionario público',420),(720,'Dependientes del comercio, vendedores o similares',420),(721,'Empresario',420),(722,'Arquitectos, ingenieros y profesionales similares',420),(723,'Profesionales de la salud',420),(724,'Profesionales de la agropecuaria',420),(725,'Profesionales del Derecho',420),(726,'Profesor(a) de primaria',420),(727,'Profesor(a) de secundaria',420),(728,'Profesor(a) de Universidad',420),(729,'Otros profesionales de enseñanza',420),(730,'Legislador',420),(731,'Director y jefe ejecutivo',420),(732,'Gerente del departamento',420),(733,'Empleado de oficina',420),(734,'Fuerzas Armadas y Policía',420),(735,'Otra',420),(736,'Sueldo propio',421),(737,'Crédito',421),(738,'Beca',421),(739,'Otro Padres',421),(740,'Propia',423),(741,'Familiar',423),(742,'Prestada',423),(743,'Arrendada',423),(744,'Hipotecada',423),(745,'Otro',423),(746,'Agua potable',424),(747,'Energía eléctrica',424),(748,'Recolección de basura',424),(749,'Agua entubada',424),(750,'Alcantarillado',424),(751,'Teléfono',424),(752,'Si',425),(753,'No',425),(754,'Auditiva',426),(755,'Física',426),(756,'Intelectual',426),(757,'Visual',426),(758,'Multidiscapacidad',426),(759,'Si',427),(760,'No',427),(761,'Pública',428),(762,'Privada',428),(763,'Universitaria',428),(764,'Ciencias',429),(765,'Polivalente',429),(766,'Técnico',429),(767,'Artes',429),(768,'Otro',429),(769,'Ing. Sistemas',432),(770,'Ing. Diseño Grafico',432),(771,'Ing. Agroindustrial',432),(772,'Ing. Telematica',432),(773,'Ing. Seguridad Industrial',432),(774,'F. Ciencias de la Ingenieria',437),(775,'F. Ciencias Empresariales',437),(776,'F. Ciencias Ambientales',437),(777,'F. Ciencias Agrarias',437),(778,'F. Ciencias Pecuarias',437),(779,'Ud. Estudios a Distancia',437),(780,'Si',438),(781,'No',438),(782,'Años',439),(783,'Meses',439),(784,'1. En muy alto grado',440),(785,'2',440),(786,'3',440),(787,'4',440),(788,'5. De ningún modo',440),(789,'6. No aplica, sin trabajo',440),(790,'Trabaja',441),(791,'Estudia',441),(792,'Ambas',441),(793,'Ni estudia Ni trabaja',441),(794,'Antes de graduar',442),(795,'Menos de 6 meses luego de graduar',442),(796,'Entre 6 meses y un año luego de graduar',442),(797,'Más de un año luego de graduar',442),(798,'Apliqué para un anuncio de vacante',443),(799,'Contacté empleadores sin saber si había una vacante',443),(800,'Publiqué mi oferta de servicios',443),(801,'Fui contactado por un empleador',443),(802,'Contacté una agencia pública de empleo',443),(803,'Contacté una agencia comercial de empleo',443),(804,'Solicité la ayuda de una oficina de colocaciones de mi institución de educación superior',443),(805,'Solicité la ayuda del personal docente de la institución de educación superior',443),(806,'Establecí contactos mientras trabajaba durante mis estudios',443),(807,'Utilicé otros contactos/ relaciones personales (ej. padres, parientes, amigos)',443),(808,'Empecé mi propio negocio/ autoempleo',443),(809,'Ser de universidad de prestigio',444),(810,'Experiencia laboral en la especialidad',444),(811,'Expediente académico – Notas - Calificaciones',444),(812,'Tener título profesional en el área de trabajo',444),(813,'Aprobar examen',444),(814,'Experiencia en el extranjero',444),(815,'Conocimiento de idiomas extranjeros',444),(816,'Conocimientos de informática',444),(817,'Habilidades personales',444),(818,'Entrevista personal',444),(819,'Por tener convenio con la UTEQ',444),(820,'Recomendaciones/referencias de terceras personas',444),(821,'País:',446),(822,'Provincia:',446),(823,'Cantón:',446),(824,'Menos de un año',451),(825,'Un año',451),(826,'Dos años',451),(827,'Tres años ',451),(828,'Más de tres años',451),(829,'Menos de un año',452),(830,'Un año',452),(831,'Dos años',452),(832,'Tres años',452),(833,'Más de tres años',452),(834,'Técnico',453),(835,'Jefe de área',453),(836,'Supervisor ',453),(837,'Funcionario ',453),(838,'Directivo',453),(839,'Empresario',453),(840,'Nombramiento',454),(841,'Contrato ',454),(842,'Eventual',454),(843,'0%',455),(844,'1-20%',455),(845,'21-40%',455),(846,'41-60%',455),(847,'61-80%',455),(848,'81-100%',455),(849,'Propia',456),(850,'Pública ',456),(851,'Privada',456),(852,'Social-ONG',456),(853,'Microempresa (1-30 Personas) ',457),(854,'Pequeña (31-100 Personas) ',457),(855,'Mediana (101-500 Personas) ',457),(856,'Grande (más de 500 Personas) ',457),(857,'Agroindustrial',458),(858,'Agrícola',458),(859,'Pecuario',458),(860,'Pesquero ',458),(861,'Minero',458),(862,'Forestal',458),(863,'Industrial ',458),(864,'Construcción ',458),(865,'Petrolero ',458),(866,'Educativo',458),(867,'Turismo',458),(868,'Comercio',458),(869,'Jurídico',458),(870,'Informático',458),(871,'Finanzas ',458),(872,'De 354 a 500 USD	',459),(873,'De 501 a 700 USD',459),(874,'De 701 a 900 USD',459),(875,'De 901 a 1200 USD',459),(876,'De 1201 a 1500 USD',459),(877,'De 1501 a 2000 USD',459),(878,'De 2001 a 3000 USD',459),(879,'De 3001 a 5000 USD',459),(880,'Mayor a 5000 USD',459),(881,'Tengo un empleo regular / Yo soy trabajador por cuenta propia',460),(882,'Tengo trabajos ocasionales relacionados con mi estudio',460),(883,'Tengo trabajos ocasionales NO relacionados con mi estudio',460),(884,'Tengo más de un trabajo',460),(885,'Actualmente estoy haciendo servicio militar o civil.',460),(886,'Capacidad de abstracción, análisis y síntesis',461),(887,'Capacidad de aplicar los conocimientos en la práctica',461),(888,'Capacidad para organizar y planificar el tiempo',461),(889,'Conocimientos sobre el área de estudio y la profesión',461),(890,'Responsabilidad social y compromiso ciudadano',461),(891,'Capacidad de comunicación oral  y escrita',461),(892,'Capacidad de comunicación en un segundo idioma',461),(893,'Habilidades en el uso de las tecnologías de la información y de la comunicación',461),(894,'Capacidad de investigación',461),(895,'Capacidad de aprender y actualizarse permanentemente',461),(896,'Habilidades para buscar, procesar y analizar información procedente de fuentes diversas',461),(897,'Capacidad crítica y autocrítica',461),(898,'Capacidad para actuar en nuevas situaciones',461),(899,'Capacidad para identificar, plantear y resolver problemas',461),(900,'Capacidad para tomar decisiones',461),(901,'Capacidad de trabajo en equipo',461),(902,'Habilidades interpersonales',461),(903,'Capacidad de motivar y conducir hacia metas comunes',461),(904,'Compromiso con la preservación del medio ambiente',461),(905,'Capacidad creativa',461),(906,'Compromiso con su medio socio-cultural',461),(907,'Valoración y respecto por la diversidad y multiculturalidad',461),(908,'Habilidad para trabajar en contextos internacionales',461),(909,'Habilidad para trabajar en forma autónoma',461),(910,'Capacidad para formular y gestionar proyectos',461),(911,'Compromiso ético',461),(912,'Compromiso con la calidad',461),(913,'1. Peor de lo que me esperaba',462),(914,'2.',462),(915,'3.',462),(916,'4.',462),(917,'5. Mucho mejor de lo que me esperaba',462),(918,'0. No he tenido ninguna expectativa',462),(919,'1. Nada en absoluto',463),(920,'2.',463),(921,'3.',463),(922,'4.',463),(923,'5. En un grado muy alto',463),(924,'No aplicable, considero que mi trabajo se corresponde con mis estudios',464),(925,'Todavía no he encontrado un trabajo más apropiado',464),(926,'Haciendo este trabajo tengo mejores perspectivas profesionales. ',464),(927,'Prefiero un trabajo que no esté estrechamente relacionado con mis estudios  ',464),(928,'Fui ascendido a una categoría que estaba menos relacionada con mis estudios que mi categoría anterior ',464),(929,'Consigo ingresos más altos con mi trabajo actual. ',464),(930,'Mi trabajo actual me ofrece seguridad. ',464),(931,'Mi trabajo actual es interesante. ',464),(932,'Mi trabajo actual proporciona la oportunidad de jornada parcial/horarios flexibles. ',464),(933,'Mi trabajo actual me permite trabajar en la localidad que prefiero.',464),(934,'Mi trabajo actual me permite atender las obligaciones familiares.',464),(935,'Al principio de la carrera profesional era previsible tener un trabajo apenas ligado a mis estudios.',464),(936,'Muy satisfecho',465),(937,'Satisfecho',465),(938,'Poco satisfecho',465),(939,'No satisfecho',465),(940,'Excelente',467),(941,'Muy buenos',467),(942,'Buenos',467),(943,'Regulares',467),(944,'Deficientes',467),(945,'Excelente',468),(946,'Muy buenos',468),(947,'Buenos',468),(948,'Regulares',468),(949,'Deficientes',468),(950,'Excelentes',469),(951,'Muy buenos',469),(952,'Buenos',469),(953,'Regulares',469),(954,'Deficientes',469),(955,'Constantemente',470),(956,'Rara vez',470),(957,'Nunca ',470),(958,'1. Nada apropiado',474),(959,'2.',474),(960,'3.',474),(961,'4.',474),(962,'5. Completamente apropiado',474),(963,'Constantemente',476),(964,'Rara vez',476),(965,'Nunca',476),(966,'Si',477),(967,'No',477),(968,'Conferencia académica',478),(969,'Revista no indexada',478),(970,'Informe técnico',478),(971,'Revista indexada (latindex, scielo, isi/jcr, scopus)',478),(972,'Si',479),(973,'No',479),(974,'1 mod',480),(975,'2 mod',480),(976,'[{\"field\":\"a\",\"title\":\"a\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"},{\"field\":\"b\",\"title\":\"b\",\"tipo\":\"input\",\"sortable\":false,\"formatter\":\"input_format\",\"events\":\"input_action\"}]',481);
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enunciado` longtext,
  `tipo` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  `order_by` int(11) DEFAULT NULL,
  `Encuestas_id` int(11) NOT NULL,
  `estado_excel` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pregunta_categoria_idx` (`categoria_id`),
  KEY `fk_preguntas_Encuestas1_idx` (`Encuestas_id`),
  CONSTRAINT `fk_preguntas_Encuestas1` FOREIGN KEY (`Encuestas_id`) REFERENCES `encuestas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pregunta_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (24,'Nombres:',1,6,'1',2,1,'1'),(25,'Apellidos:',1,6,'1',3,1,'1'),(26,'Cédula de Identidad',1,6,'1',1,1,'1'),(27,'Fecha de Nacimiento',1,6,'1',4,1,'1'),(29,'Estado Civil',4,6,'1',5,1,'1'),(30,'País de nacimiento ',1,6,'1',6,1,'1'),(31,'Dirección Domiciliaria',2,6,'1',7,1,'1'),(32,'Teléfonos',2,6,'1',8,1,'1'),(33,'Correo(s) Electrónico(s)',1,6,'1',9,1,'1'),(34,'Genero',4,6,'1',10,1,'1'),(35,'¿Cuenta con sus padres vivos?',3,1,'1',1,1,'1'),(36,'¿Con quién  vive actualmente? ',3,1,'1',2,1,'1'),(37,'Nivel de formación del padre',4,1,'1',3,1,'1'),(38,'Nivel de formación de la madre',4,1,'1',4,1,'1'),(39,'¿Tiene hermanos? ',4,1,'1',5,1,'1'),(40,'¿Cuántos hermanos tiene?',1,1,'1',6,1,'1'),(41,'¿Cuántos miembros conforman su hogar?',1,1,'1',7,1,'1'),(42,'Total de ingresos mensuales en el hogar',1,1,'1',8,1,'1'),(43,'¿Qué tipo de colegio? ',4,2,'1',0,1,'1'),(44,'Nombre del colegio donde se graduó:',1,2,'1',0,1,'1'),(45,'¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar',5,3,'2',0,1,'1'),(46,'¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:',6,3,'2',0,1,'1'),(47,'¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?',7,3,'2',0,1,'1'),(48,'Describa sus experiencias laborales más relevantes antes de su trabajo actual.',8,4,'2',0,1,'1'),(49,'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo',9,3,'2',0,1,'1'),(51,'¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila',10,3,'2',0,1,'1'),(52,'¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila',11,3,'2',0,1,'1'),(53,'Principal ocupación del padre',4,1,'1',9,1,'1'),(54,'Principal ocupación de la madre',4,1,'1',10,1,'1'),(55,'¿Cómo fue el financiamiento de sus estudios de grado?',3,1,'1',11,1,'1'),(56,'Indique los Egresos Familiares Mensuales',1,1,'1',12,1,'1'),(57,'La vivienda que dispone es',4,1,'1',13,1,'1'),(58,'¿Cuenta con los servicios básicos?',3,1,'1',14,1,'1'),(59,'¿Tiene alguna capacidad especial?',4,1,'1',15,1,'1'),(60,'En caso de tener capacidad especial, ¿De qué tipo es?',3,1,'1',16,1,'1'),(61,'¿Recibe asistencia médica?',4,1,'1',17,1,'1'),(62,'Indique el tipo de asistencia médica',3,1,'1',18,1,'1'),(63,'Título obtenido en:',4,2,'1',0,1,'1'),(64,'Calificación de grado del Bachillerato',1,2,'1',0,1,'1'),(65,'¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)',1,2,'1',0,1,'1'),(66,'Título obtenido (UTEQ)',4,3,'1',0,1,'1'),(67,'Año en el que ingresó (UTEQ)',1,3,'1',0,1,'1'),(68,'Año en el que se incorporó (UTEQ)',1,3,'1',0,1,'1'),(69,'Promedio de graduación',1,3,'1',0,1,'1'),(70,'Pertenece a algún Colegio de Profesionales, nombre del Colegio',1,3,'1',0,1,'1'),(71,'Facultad',4,3,'1',0,1,'1'),(72,'¿Estudió la carrera universitaria que eligió en primera opción?',4,3,'1',0,1,'1'),(73,'¿Cuánto tiempo estudió en la UTEQ para obtener el título?',2,3,'1',0,1,'1'),(74,'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?',4,3,'1',0,1,'1'),(75,'Actividad que desempeña actualmente.',4,4,'1',0,1,'1'),(76,'¿Qué tiempo transcurrió para obtener su primer empleo? ',4,4,'1',0,1,'1'),(77,'¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.',3,4,'1',0,1,'1'),(78,'¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más',3,4,'1',0,1,'1'),(79,'Nombre de la Empresa:',1,4,'1',0,1,'1'),(80,'Lugar de trabajo (provincia, cantón, parroquia, etc.):',2,4,'1',0,1,'1'),(81,'Dirección de la Empresa: ',1,4,'1',0,1,'1'),(82,'Teléfono: ',1,4,'1',0,1,'1'),(83,'Email:',1,4,'1',0,1,'1'),(84,'Cargo que desempeña:  ',1,4,'1',0,1,'1'),(87,'Tiempo que lleva en la empresa: ',4,4,'1',0,1,'1'),(88,'Tiempo que lleva en el cargo:',4,4,'1',0,1,'1'),(90,'Nivel jerárquico',4,4,'1',0,1,'1'),(91,'Condición de Trabajo',4,4,'1',0,1,'1'),(92,'Relación del trabajo con su área de formación',4,4,'1',0,1,'1'),(93,'Tipo de la empresa',4,4,'1',0,1,'1'),(94,'Tamaño de la empresa u organización',4,4,'1',0,1,'1'),(95,'Sector Económico de la Empresa u Organización',4,4,'1',0,1,'1'),(96,'Señale en la siguiente escala su ingreso salarial mensual actual',4,4,'1',0,1,'1'),(97,'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?',4,4,'1',0,1,'1'),(98,'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo',3,4,'1',0,1,'1'),(99,'¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ',4,4,'1',0,1,'1'),(100,'¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?',4,4,'1',0,1,'1'),(101,'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple',3,4,'1',0,1,'1'),(102,'¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?',4,5,'1',0,1,'1'),(103,'¿Por qué?',1,5,'1',0,1,'1'),(104,'¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ',4,5,'1',0,1,'1'),(105,'La bibliografía y el material sugerido por los docentes fue: ',4,5,'1',0,1,'1'),(106,'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron',4,5,'1',0,1,'1'),(107,'¿Con qué frecuencia visita usted la UTEQ? ',4,5,'1',0,1,'1'),(108,'¿Qué áreas reforzarías de tu plan de estudios?',1,5,'1',0,1,'1'),(109,'¿Qué asignaturas considera que deben eliminarse del plan de estudios?',1,5,'1',0,1,'1'),(110,'¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?',1,5,'1',0,1,'1'),(111,'¿Hasta qué punto su ocupación se corresponde con su nivel de educación?',4,5,'1',0,1,'1'),(112,'¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?',12,5,'1',0,1,'1'),(113,'¿Ha realizado trabajos de investigación científica hasta presente fecha? ',4,5,'1',0,1,'1'),(114,'¿Ha publicado su investigación científica? ',4,5,'1',0,1,'1'),(115,'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ',2,5,'1',0,1,'1'),(116,'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ',4,5,'1',0,1,'1'),(120,'_prueba mod1',3,6,'0',0,1,'1'),(121,'Nombre:',1,6,'1',NULL,2,'1'),(122,'Direccion:',1,6,'1',NULL,2,'1'),(123,'dir',1,6,'1',NULL,2,'1'),(124,'ninguna',1,6,'1',NULL,2,'1'),(303,'Nombres:',1,6,'1',2,3,'1'),(304,'Apellidos:',1,6,'1',3,3,'1'),(305,'Cédula de Identidad',1,6,'1',1,3,'1'),(306,'Fecha de Nacimiento',1,6,'1',4,3,'1'),(307,'Estado Civil',4,6,'1',5,3,'1'),(308,'País de nacimiento ',1,6,'1',6,3,'1'),(309,'Dirección Domiciliaria',2,6,'1',7,3,'1'),(310,'Teléfonos',2,6,'1',8,3,'1'),(311,'Correo(s) Electrónico(s)',1,6,'1',9,3,'1'),(312,'Genero',4,6,'1',10,3,'1'),(313,'¿Cuenta con sus padres vivos?',3,1,'1',1,3,'1'),(314,'¿Con quién  vive actualmente? ',3,1,'1',2,3,'1'),(315,'Nivel de formación del padre',4,1,'1',3,3,'1'),(316,'Nivel de formación de la madre',4,1,'1',4,3,'1'),(317,'¿Tiene hermanos? ',4,1,'1',5,3,'1'),(318,'¿Cuántos hermanos tiene?',1,1,'1',6,3,'1'),(319,'¿Cuántos miembros conforman su hogar?',1,1,'1',7,3,'1'),(320,'Total de ingresos mensuales en el hogar',1,1,'1',8,3,'1'),(321,'¿Qué tipo de colegio? ',4,2,'1',0,3,'1'),(322,'Nombre del colegio donde se graduó:',1,2,'1',0,3,'1'),(323,'¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar',5,3,'2',0,3,'1'),(324,'¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:',6,3,'2',0,3,'1'),(325,'¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?',7,3,'2',0,3,'1'),(326,'Describa sus experiencias laborales más relevantes antes de su trabajo actual.',8,4,'2',0,3,'1'),(327,'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo',9,3,'2',0,3,'1'),(328,'¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila',10,3,'2',0,3,'1'),(329,'¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila',11,3,'2',0,3,'1'),(330,'Principal ocupación del padre',4,1,'1',9,3,'1'),(331,'Principal ocupación de la madre',4,1,'1',10,3,'1'),(332,'¿Cómo fue el financiamiento de sus estudios de grado?',3,1,'1',11,3,'1'),(333,'Indique los Egresos Familiares Mensuales',1,1,'1',12,3,'1'),(334,'La vivienda que dispone es',4,1,'1',13,3,'1'),(335,'¿Cuenta con los servicios básicos?',3,1,'1',14,3,'1'),(336,'¿Tiene alguna capacidad especial?',4,1,'1',15,3,'1'),(337,'En caso de tener capacidad especial, ¿De qué tipo es?',3,1,'1',16,3,'1'),(338,'¿Recibe asistencia médica?',4,1,'1',17,3,'1'),(339,'Indique el tipo de asistencia médica',3,1,'1',18,3,'1'),(340,'Título obtenido en:',4,2,'1',0,3,'1'),(341,'Calificación de grado del Bachillerato',1,2,'1',0,3,'1'),(342,'¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)',1,2,'1',0,3,'1'),(343,'Título obtenido (UTEQ)',4,3,'1',0,3,'1'),(344,'Año en el que ingresó (UTEQ)',1,3,'1',0,3,'1'),(345,'Año en el que se incorporó (UTEQ)',1,3,'1',0,3,'1'),(346,'Promedio de graduación',1,3,'1',0,3,'1'),(347,'Pertenece a algún Colegio de Profesionales, nombre del Colegio',1,3,'1',0,3,'1'),(348,'Facultad',4,3,'1',0,3,'1'),(349,'¿Estudió la carrera universitaria que eligió en primera opción?',4,3,'1',0,3,'1'),(350,'¿Cuánto tiempo estudió en la UTEQ para obtener el título?',2,3,'1',0,3,'1'),(351,'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?',4,3,'1',0,3,'1'),(352,'Actividad que desempeña actualmente.',4,4,'1',0,3,'1'),(353,'¿Qué tiempo transcurrió para obtener su primer empleo? ',4,4,'1',0,3,'1'),(354,'¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.',3,4,'1',0,3,'1'),(355,'¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más',3,4,'1',0,3,'1'),(356,'Nombre de la Empresa:',1,4,'1',0,3,'1'),(357,'Lugar de trabajo (provincia, cantón, parroquia, etc.):',2,4,'1',0,3,'1'),(358,'Dirección de la Empresa: ',1,4,'1',0,3,'1'),(359,'Teléfono: ',1,4,'1',0,3,'1'),(360,'Email:',1,4,'1',0,3,'1'),(361,'Cargo que desempeña:  ',1,4,'1',0,3,'1'),(362,'Tiempo que lleva en la empresa: ',4,4,'1',0,3,'1'),(363,'Tiempo que lleva en el cargo:',4,4,'1',0,3,'1'),(364,'Nivel jerárquico',4,4,'1',0,3,'1'),(365,'Condición de Trabajo',4,4,'1',0,3,'1'),(366,'Relación del trabajo con su área de formación',4,4,'1',0,3,'1'),(367,'Tipo de la empresa',4,4,'1',0,3,'1'),(368,'Tamaño de la empresa u organización',4,4,'1',0,3,'1'),(369,'Sector Económico de la Empresa u Organización',4,4,'1',0,3,'1'),(370,'Señale en la siguiente escala su ingreso salarial mensual actual',4,4,'1',0,3,'1'),(371,'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?',4,4,'1',0,3,'1'),(372,'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo',3,4,'1',0,3,'1'),(373,'¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ',4,4,'1',0,3,'1'),(374,'¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?',4,4,'1',0,3,'1'),(375,'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple',3,4,'1',0,3,'1'),(376,'¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?',4,5,'1',0,3,'1'),(377,'¿Por qué?',1,5,'1',0,3,'1'),(378,'¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ',4,5,'1',0,3,'1'),(379,'La bibliografía y el material sugerido por los docentes fue: ',4,5,'1',0,3,'1'),(380,'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron',4,5,'1',0,3,'1'),(381,'¿Con qué frecuencia visita usted la UTEQ? ',4,5,'1',0,3,'1'),(382,'¿Qué áreas reforzarías de tu plan de estudios?',1,5,'1',0,3,'1'),(383,'¿Qué asignaturas considera que deben eliminarse del plan de estudios?',1,5,'1',0,3,'1'),(384,'¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?',1,5,'1',0,3,'1'),(385,'¿Hasta qué punto su ocupación se corresponde con su nivel de educación?',4,5,'1',0,3,'1'),(386,'¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?',12,5,'1',0,3,'1'),(387,'¿Ha realizado trabajos de investigación científica hasta presente fecha? ',4,5,'1',0,3,'1'),(388,'¿Ha publicado su investigación científica? ',4,5,'1',0,3,'1'),(389,'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ',2,5,'1',0,3,'1'),(390,'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ',4,5,'1',0,3,'1'),(391,'_prueba mod1',3,6,'0',0,3,'1'),(392,'Nombres:',1,6,'1',2,2,'1'),(393,'Apellidos:',1,6,'1',3,2,'1'),(394,'Cédula de Identidad',1,6,'1',1,2,'1'),(395,'Fecha de Nacimiento',1,6,'1',4,2,'1'),(396,'Estado Civil',4,6,'1',5,2,'1'),(397,'País de nacimiento ',1,6,'1',6,2,'1'),(398,'Dirección Domiciliaria',2,6,'1',7,2,'1'),(399,'Teléfonos',2,6,'1',8,2,'1'),(400,'Correo(s) Electrónico(s)',1,6,'1',9,2,'1'),(401,'Genero',4,6,'1',10,2,'1'),(402,'¿Cuenta con sus padres vivos?',3,1,'1',1,2,'1'),(403,'¿Con quién  vive actualmente? ',3,1,'1',2,2,'1'),(404,'Nivel de formación del padre',4,1,'1',3,2,'1'),(405,'Nivel de formación de la madre',4,1,'1',4,2,'1'),(406,'¿Tiene hermanos? ',4,1,'1',5,2,'1'),(407,'¿Cuántos hermanos tiene?',1,1,'1',6,2,'1'),(408,'¿Cuántos miembros conforman su hogar?',1,1,'1',7,2,'1'),(409,'Total de ingresos mensuales en el hogar',1,1,'1',8,2,'1'),(410,'¿Qué tipo de colegio? ',4,2,'1',0,2,'1'),(411,'Nombre del colegio donde se graduó:',1,2,'1',0,2,'1'),(412,'¿Cuántas horas por semana dedicó en promedio durante sus estudios a cada una de las siguientes actividades? Estimar',5,3,'2',0,2,'1'),(413,'¿Cuántos meses transcurridos entre el ingreso a la Universidad y la graduación, pasó predominantemente en?:',6,3,'2',0,2,'1'),(414,'¿Qué conocimientos sobre informática poseía en el momento que se graduó y actualmente?',7,3,'2',0,2,'1'),(415,'Describa sus experiencias laborales más relevantes antes de su trabajo actual.',8,4,'2',0,2,'1'),(416,'Después de la graduación, ¿emprendió otros estudios/formación adicional (cursos de posgrado, cursos, seminarios, cursos no completados, etc.) relacionados con su profesión? Excluya los que NO considere que están relacionados con su trabajo',9,3,'2',0,2,'1'),(417,'¿Cómo califica su nivel de competencia en un idioma extranjero en el momento de egresar de la Universidad?  Responda con respeto a cualquier idioma en la lista y marque el tipo de competencia en cada fila. Respuesta múltiple posible en cada fila',10,3,'2',0,2,'1'),(418,'¿Cómo califica su nivel de competencia de un  idioma extranjero actualmente?  Responda respeto a cualquier idioma en la lista. Respuesta múltiple posible en cada fila',11,3,'2',0,2,'1'),(419,'Principal ocupación del padre',4,1,'1',9,2,'1'),(420,'Principal ocupación de la madre',4,1,'1',10,2,'1'),(421,'¿Cómo fue el financiamiento de sus estudios de grado?',3,1,'1',11,2,'1'),(422,'Indique los Egresos Familiares Mensuales',1,1,'1',12,2,'1'),(423,'La vivienda que dispone es',4,1,'1',13,2,'1'),(424,'¿Cuenta con los servicios básicos?',3,1,'1',14,2,'1'),(425,'¿Tiene alguna capacidad especial?',4,1,'1',15,2,'1'),(426,'En caso de tener capacidad especial, ¿De qué tipo es?',3,1,'1',16,2,'1'),(427,'¿Recibe asistencia médica?',4,1,'1',17,2,'1'),(428,'Indique el tipo de asistencia médica',3,1,'1',18,2,'1'),(429,'Título obtenido en:',4,2,'1',0,2,'1'),(430,'Calificación de grado del Bachillerato',1,2,'1',0,2,'1'),(431,'¿Cuántos años de escolaridad (secundaria) pasó en total hasta adquirir la calificación de ingreso a la educación superior? (incluir años de clases repetitivas)',1,2,'1',0,2,'1'),(432,'Título obtenido (UTEQ)',4,3,'1',0,2,'1'),(433,'Año en el que ingresó (UTEQ)',1,3,'1',0,2,'1'),(434,'Año en el que se incorporó (UTEQ)',1,3,'1',0,2,'1'),(435,'Promedio de graduación',1,3,'1',0,2,'1'),(436,'Pertenece a algún Colegio de Profesionales, nombre del Colegio',1,3,'1',0,2,'1'),(437,'Facultad',4,3,'1',0,2,'1'),(438,'¿Estudió la carrera universitaria que eligió en primera opción?',4,3,'1',0,2,'1'),(439,'¿Cuánto tiempo estudió en la UTEQ para obtener el título?',2,3,'1',0,2,'1'),(440,'Si trabajó durante la carrera que estudió, ¿hasta qué punto sus experiencias de trabajo (empleo) se relacionaron con el contenido de sus estudios?',4,3,'1',0,2,'1'),(441,'Actividad que desempeña actualmente.',4,4,'1',0,2,'1'),(442,'¿Qué tiempo transcurrió para obtener su primer empleo? ',4,4,'1',0,2,'1'),(443,'¿Cómo trató de encontrar su primer empleo después de la graduación? Múltiples respuestas son posibles.',3,4,'1',0,2,'1'),(444,'¿Cuáles fueron los requisitos de la empresa o del primer empleador para contratarlo? Seleccionar 1 o más',3,4,'1',0,2,'1'),(445,'Nombre de la Empresa:',1,4,'1',0,2,'1'),(446,'Lugar de trabajo (provincia, cantón, parroquia, etc.):',2,4,'1',0,2,'1'),(447,'Dirección de la Empresa: ',1,4,'1',0,2,'1'),(448,'Teléfono: ',1,4,'1',0,2,'1'),(449,'Email:',1,4,'1',0,2,'1'),(450,'Cargo que desempeña:  ',1,4,'1',0,2,'1'),(451,'Tiempo que lleva en la empresa: ',4,4,'1',0,2,'1'),(452,'Tiempo que lleva en el cargo:',4,4,'1',0,2,'1'),(453,'Nivel jerárquico',4,4,'1',0,2,'1'),(454,'Condición de Trabajo',4,4,'1',0,2,'1'),(455,'Relación del trabajo con su área de formación',4,4,'1',0,2,'1'),(456,'Tipo de la empresa',4,4,'1',0,2,'1'),(457,'Tamaño de la empresa u organización',4,4,'1',0,2,'1'),(458,'Sector Económico de la Empresa u Organización',4,4,'1',0,2,'1'),(459,'Señale en la siguiente escala su ingreso salarial mensual actual',4,4,'1',0,2,'1'),(460,'Si usted trabaja actualmente o trabaja por cuenta propia: ¿Cómo describiría su situación profesional actual?',4,4,'1',0,2,'1'),(461,'Señale por lo menos cinco competencias genéricas que usted considera más importantes en su trabajo',3,4,'1',0,2,'1'),(462,'¿Teniendo en cuenta todos los aspectos, hasta qué punto su actual situación laboral coincide con las expectativas que tenía cuando empezó sus estudios universitarios? ',4,4,'1',0,2,'1'),(463,'¿Hasta qué punto utiliza los conocimientos y habilidades que adquirió durante sus estudios universitarios?',4,4,'1',0,2,'1'),(464,'Si considera su trabajo como escasamente apropiado y no relacionado con su educación: ¿por qué lo aceptó? Posible respuesta  múltiple',3,4,'1',0,2,'1'),(465,'¿Está satisfecho con los conocimientos adquiridos durante sus estudios en la UTEQ?',4,5,'1',0,2,'1'),(466,'¿Por qué?',1,5,'1',0,2,'1'),(467,'¿Cómo calificaría la utilidad de las prácticas pre profesionales (pasantías) para su desarrollo profesional y laboral? ',4,5,'1',0,2,'1'),(468,'La bibliografía y el material sugerido por los docentes fue: ',4,5,'1',0,2,'1'),(469,'Considera que los contenidos de las asignaturas, vistas a lo largo de la carrera, resultaron',4,5,'1',0,2,'1'),(470,'¿Con qué frecuencia visita usted la UTEQ? ',4,5,'1',0,2,'1'),(471,'¿Qué áreas reforzarías de tu plan de estudios?',1,5,'1',0,2,'1'),(472,'¿Qué asignaturas considera que deben eliminarse del plan de estudios?',1,5,'1',0,2,'1'),(473,'¿Cuáles son las asignaturas que han contribuido al desarrollo profesional?',1,5,'1',0,2,'1'),(474,'¿Hasta qué punto su ocupación se corresponde con su nivel de educación?',4,5,'1',0,2,'1'),(475,'¿Cómo valoraría las facilidades y condiciones de estudio que experimentó durante el curso de los estudios de los cuales se graduó?',12,5,'1',0,2,'1'),(476,'¿Ha realizado trabajos de investigación científica hasta presente fecha? ',4,5,'1',0,2,'1'),(477,'¿Ha publicado su investigación científica? ',4,5,'1',0,2,'1'),(478,'Seleccione el tipo de foro en el que ha publicado sus investigaciones (sólo si respondió SI en la pregunta previa).  ',2,5,'1',0,2,'1'),(479,'Ha generado alguna patente o producto reconocido por el instituto de propiedad intelectual.  ',4,5,'1',0,2,'1'),(480,'_prueba mod1',3,6,'0',0,2,'1'),(481,'q',5,6,'1',0,4,'1');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas_respuestas`
--

DROP TABLE IF EXISTS `preguntas_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preguntas_respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` longtext,
  `encuesta_titulo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_preguntas_respuestas_encuesta_titulo1_idx` (`encuesta_titulo_id`),
  CONSTRAINT `fk_preguntas_respuestas_encuesta_titulo1` FOREIGN KEY (`encuesta_titulo_id`) REFERENCES `encuesta_titulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas_respuestas`
--

LOCK TABLES `preguntas_respuestas` WRITE;
/*!40000 ALTER TABLE `preguntas_respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `preguntas_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta` longtext,
  `preguntas_respuestas_id` int(11) DEFAULT NULL,
  `opciones_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_preguntas_respuestas_id_idx` (`preguntas_respuestas_id`),
  CONSTRAINT `ref_preguntas_respuestas_id` FOREIGN KEY (`preguntas_respuestas_id`) REFERENCES `preguntas_respuestas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestas`
--

LOCK TABLES `respuestas` WRITE;
/*!40000 ALTER TABLE `respuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `id` int(11) NOT NULL,
  `nota titulacion` float DEFAULT NULL,
  `nota pensum` float DEFAULT NULL,
  `promedio` float DEFAULT NULL,
  `periodo_inicio` date DEFAULT NULL,
  `periodo_fin` date DEFAULT NULL,
  `Estudiante_id` int(11) NOT NULL,
  `Carreras_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Titulo_Estudiante1_idx` (`Estudiante_id`),
  KEY `fk_Titulo_Carreras1_idx` (`Carreras_id`),
  CONSTRAINT `fk_Titulo_Carreras1` FOREIGN KEY (`Carreras_id`) REFERENCES `carreras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Titulo_Estudiante1` FOREIGN KEY (`Estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewencuesta`
--

DROP TABLE IF EXISTS `viewencuesta`;
/*!50001 DROP VIEW IF EXISTS `viewencuesta`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewencuesta` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `fecha`,
 1 AS `estado`,
 1 AS `total_preguntas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'seg_graduados_mod'
--

--
-- Final view structure for view `viewencuesta`
--

/*!50001 DROP VIEW IF EXISTS `viewencuesta`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewencuesta` AS select sql_calc_found_rows `e`.`id` AS `id`,`e`.`nombre` AS `nombre`,`e`.`fecha` AS `fecha`,`e`.`estado` AS `estado`,count(`p`.`id`) AS `total_preguntas` from (`encuestas` `e` left join `preguntas` `p` on((`e`.`id` = `p`.`Encuestas_id`))) where (`e`.`estado` = '1') group by `e`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-23  8:08:11
