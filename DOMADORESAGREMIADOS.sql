-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: domadoresagremiados
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudades` (
  `ciudad` varchar(45) NOT NULL,
  `id_gremio` varchar(13) NOT NULL,
  PRIMARY KEY (`ciudad`,`id_gremio`),
  KEY `fk_ciudades_gremios1_idx` (`id_gremio`),
  CONSTRAINT `fk_ciudades_gremios1` FOREIGN KEY (`id_gremio`) REFERENCES `gremios` (`cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES ('Córdoba','30-11111111-1'),('Río Gallegos','30-11111111-1'),('Resistencia','30-33333333-3'),('Isla Grande de Tierra del Fuego','30-55555555-5'),('Buenos Aires','30-66666666-6');
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `domadores_cuil` varchar(45) NOT NULL,
  `id_gremio` varchar(13) NOT NULL,
  `id_mision` varchar(9) NOT NULL,
  `f_aceptacion` varchar(45) DEFAULT NULL,
  `f_cumplimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`domadores_cuil`,`id_gremio`,`id_mision`),
  KEY `fk_mis_idx` (`id_gremio`,`id_mision`),
  CONSTRAINT `fk_mis` FOREIGN KEY (`id_gremio`, `id_mision`) REFERENCES `misiones` (`id_gremio`, `idmision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
INSERT INTO `contratos` VALUES ('56-8885363-6','30-66666666-6','002','2022-03-02','2022-03-05'),('56-8885363-6','30-66666666-6','005','2022-03-02',NULL),('56-8885363-6','30-66666666-6','006','2022-03-02',NULL),('56-88884363-7','30-66666666-6','007','2022-03-02','2022-03-05'),('77-77777777-7','30-11111111-1','001','2022-03-02','2022-03-05'),('88-88888888-8','30-33333333-3','001','2022-03-02','2022-03-05');
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domadores`
--

DROP TABLE IF EXISTS `domadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domadores` (
  `cuil` varchar(45) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `nombre_y_apellido` varchar(45) DEFAULT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `id_gremio` varchar(13) NOT NULL DEFAULT '##-########-#',
  PRIMARY KEY (`id_gremio`,`cuil`),
  KEY `fk_domadores_gremios1_idx` (`id_gremio`),
  KEY `fk_contrato_idx` (`cuil`),
  CONSTRAINT `fk_domadores_gremios1` FOREIGN KEY (`id_gremio`) REFERENCES `gremios` (`cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domadores`
--

LOCK TABLES `domadores` WRITE;
/*!40000 ALTER TABLE `domadores` DISABLE KEYS */;
INSERT INTO `domadores` VALUES ('56-88828362-7','88828362','Winki Pedia','2000-09-13','30-11111111-1'),('99-99999999-9','99999999','Jhon Wick','1998-02-02','30-11111111-1'),('44-44444444-4','44444444','Jhon Peter','1888-11-13','30-22222222-2'),('56-88898362-6','88898362','Claudio Bustamante','1998-12-06','30-22222222-2'),('77-77777777-7','77777777','Laura Lorca','1978-02-02','30-22222222-2'),('55-55555555-5','55555555','Ana Liz','1898-01-28','30-33333333-3'),('66-66666666-6','66666666','Alejo Quik','1908-01-02','30-33333333-3'),('88-88888888-8','8888888','Homer Zapata','1907-09-02','30-33333333-3'),('56-88885363-6','88885363','Luz Perez','1994-05-22','30-55555555-5'),('56-88887362-5','88887362','Kiara Lana','1996-07-18','30-55555555-5'),('56-88884363-7','88884363','Rodolfo Hac','1981-11-25','30-66666666-6'),('56-88888363-5','88888363','Wilfred Roldan','1995-03-15','30-66666666-6');
/*!40000 ALTER TABLE `domadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domadores_equipo`
--

DROP TABLE IF EXISTS `domadores_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domadores_equipo` (
  `nombre_equipo` varchar(30) NOT NULL,
  `cuil_domador` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre_equipo`,`cuil_domador`),
  KEY `fk_domador_idx` (`cuil_domador`),
  CONSTRAINT `fk_equipo` FOREIGN KEY (`nombre_equipo`) REFERENCES `equipos` (`nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domadores_equipo`
--

LOCK TABLES `domadores_equipo` WRITE;
/*!40000 ALTER TABLE `domadores_equipo` DISABLE KEYS */;
INSERT INTO `domadores_equipo` VALUES ('Los Llaneros solitarios','44-44444444-4'),('Las Chicas Superpoderosas','55-55555555-5'),('Las Chicas Superpoderosas','77-77777777-7'),('Los Llaneros solitarios','88-88888888-8');
/*!40000 ALTER TABLE `domadores_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `nombre_equipo` varchar(30) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_desbande` date DEFAULT NULL,
  PRIMARY KEY (`nombre_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
INSERT INTO `equipos` VALUES ('Las Chicas Superpoderosas','2300-01-01','2301-01-01'),('Los Llaneros solitarios','1308-01-01','1388-01-01'),('Platero y yo','1308-01-01','1388-01-01'),('Sin Equipo','1888-01-15','1888-01-15');
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gremios`
--

DROP TABLE IF EXISTS `gremios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gremios` (
  `cuit` varchar(13) NOT NULL DEFAULT '##-########-#',
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gremios`
--

LOCK TABLES `gremios` WRITE;
/*!40000 ALTER TABLE `gremios` DISABLE KEYS */;
INSERT INTO `gremios` VALUES ('30-11111111-1','ABC'),('30-22222222-2','IJK'),('30-33333333-3','XYZ'),('30-55555555-5','DDITF'),('30-66666666-6','UDCPBA');
/*!40000 ALTER TABLE `gremios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misiones`
--

DROP TABLE IF EXISTS `misiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misiones` (
  `id_gremio` varchar(13) NOT NULL,
  `idmision` varchar(9) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `recompensa` decimal(10,2) DEFAULT NULL,
  `desc_copete` mediumtext,
  `desc_cuerpo` mediumtext,
  PRIMARY KEY (`idmision`,`id_gremio`),
  KEY `fk_misiones_gremios1_idx` (`id_gremio`),
  CONSTRAINT `fk_misiones_gremios1` FOREIGN KEY (`id_gremio`) REFERENCES `gremios` (`cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misiones`
--

LOCK TABLES `misiones` WRITE;
/*!40000 ALTER TABLE `misiones` DISABLE KEYS */;
INSERT INTO `misiones` VALUES ('30-11111111-1','001','Rescatar al principe','2022-02-15','2022-04-18',50000000.00,'Rescatar principe','El gil no sabe nadar'),('30-33333333-3','001','Bajar al Chupacabras','2022-02-15','2022-04-18',40000000.00,'El chupacabras está haciendo destrozos en el parque','Encontrar al Chupacabras y liberar en el desierto'),('30-55555555-5','001','Lentes para el ciclope','2022-02-15','2022-04-18',25000000.00,'No ve bien','Encontrar al ciclope miope y llevarlo al oftalmólogo'),('30-66666666-6','001','KRAKEN1','2022-02-15','2022-04-18',32000000.00,'KRAKEN1','El kraken1'),('30-33333333-3','002','Buscar al Kraken','2022-02-15','2022-04-18',30000000.00,'Kraken Padre busca a su hijo','busqueda del kraken perdido'),('30-55555555-5','002','Peineta para Quimera','2022-02-15','2022-04-18',28900000.00,'Quimera pelo largo','Debido a su pelo Quimera está chocando con las casas conseguir peineta'),('30-66666666-6','002','KRAKEN2','2022-02-15','2022-04-18',25000552.02,'KRAKEN2','El kraken2'),('30-66666666-6','003','KRAKEN3','2022-02-15','2022-04-18',25000552.03,'KRAKEN3','El kraken3'),('30-66666666-6','004','KRAKEN4','2022-02-15','2022-04-18',25000552.04,'KRAKEN4','El kraken4'),('30-66666666-6','005','KRAKEN5','2022-02-15','2022-04-18',25000552.05,'KRAKEN5','El kraken5'),('30-66666666-6','006','KRAKEN6','2022-02-15','2022-04-18',26565400.05,'KRAKEN6','El kraken6'),('30-66666666-6','007','KRAKEN7','2022-02-15','2022-04-18',28800888.00,'KRAKEN7','El kraken7'),('30-66666666-6','008','KRAKEN8','2022-02-15','2022-04-18',25000552.08,'KRAKEN8','El kraken8'),('30-66666666-6','009','KRAKEN9','2022-02-15','2022-04-18',25000552.09,'KRAKEN9','El kraken9'),('30-66666666-6','010','KRAKEN10','2022-02-15','2022-04-18',25000552.10,'KRAKEN10','El kraken10'),('30-66666666-6','011','KRAKEN11','2022-02-15','2022-04-18',25000552.11,'KRAKEN11','El kraken11');
/*!40000 ALTER TABLE `misiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monstruo_mision`
--

DROP TABLE IF EXISTS `monstruo_mision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monstruo_mision` (
  `id_monstruo` varchar(45) NOT NULL,
  `id_gremio` varchar(13) NOT NULL,
  `id_mision` varchar(9) NOT NULL,
  PRIMARY KEY (`id_monstruo`,`id_gremio`,`id_mision`),
  KEY `fk_misiones_has_registro_monstruos_registro_monstruos1_idx` (`id_monstruo`),
  KEY `fk_misiones_has_registro_monstruos_misiones1_idx` (`id_mision`,`id_gremio`),
  CONSTRAINT `fk_misiones_has_registro_monstruos_misiones1` FOREIGN KEY (`id_mision`, `id_gremio`) REFERENCES `misiones` (`idmision`, `id_gremio`),
  CONSTRAINT `fk_misiones_has_registro_monstruos_registro_monstruos1` FOREIGN KEY (`id_monstruo`) REFERENCES `monstruos` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monstruo_mision`
--

LOCK TABLES `monstruo_mision` WRITE;
/*!40000 ALTER TABLE `monstruo_mision` DISABLE KEYS */;
INSERT INTO `monstruo_mision` VALUES ('Chupi-chups','30-33333333-3','001'),('Kraken smith1','30-66666666-6','001'),('Kraken smith2','30-66666666-6','002'),('Kraken smith3','30-66666666-6','003'),('Kraken smith4','30-66666666-6','004'),('Kraken smith5','30-66666666-6','005'),('Kraken smith6','30-66666666-6','006'),('Kraken smith7','30-66666666-6','007'),('Kraken smith8','30-66666666-6','008'),('Kraken smith9','30-66666666-6','009'),('Kraken smith10','30-66666666-6','010'),('Kraken smith11','30-66666666-6','011');
/*!40000 ALTER TABLE `monstruo_mision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monstruos`
--

DROP TABLE IF EXISTS `monstruos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monstruos` (
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `energia_interior` int DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monstruos`
--

LOCK TABLES `monstruos` WRITE;
/*!40000 ALTER TABLE `monstruos` DISABLE KEYS */;
INSERT INTO `monstruos` VALUES ('Chupi-chups','Chupacabras',39839),('Kraken smith1','Kraken',45000),('Kraken smith10','Kraken',45000),('Kraken smith11','Kraken',45000),('Kraken smith2','Kraken',45000),('Kraken smith3','Kraken',45000),('Kraken smith4','Kraken',45000),('Kraken smith5','Kraken',45000),('Kraken smith6','Kraken',45000),('Kraken smith7','Kraken',45000),('Kraken smith8','Kraken',45000),('Kraken smith9','Kraken',45000);
/*!40000 ALTER TABLE `monstruos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento` (
  `sequidor_cuil` varchar(45) NOT NULL,
  `seguido_cuil` varchar(45) NOT NULL,
  `seguimientoproblema` tinyint DEFAULT NULL,
  PRIMARY KEY (`sequidor_cuil`,`seguido_cuil`),
  KEY `fk_domadores_has_domadores_domadores2_idx` (`seguido_cuil`) /*!80000 INVISIBLE */,
  KEY `fk_domadores_has_domadores_domadores1_idx` (`sequidor_cuil`),
  CONSTRAINT `fk_domadores_has_domadores_domadores1` FOREIGN KEY (`sequidor_cuil`) REFERENCES `domadores` (`cuil`),
  CONSTRAINT `fk_domadores_has_domadores_domadores2` FOREIGN KEY (`seguido_cuil`) REFERENCES `domadores` (`cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
INSERT INTO `seguimiento` VALUES ('44-44444444-4','55-55555555-5',1),('55-55555555-5','44-44444444-4',1),('77-77777777-7','55-55555555-5',0);
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-07 10:48:00
