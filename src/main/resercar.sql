CREATE DATABASE  IF NOT EXISTS `resercarbd` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resercarbd`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: resercarbd
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acciones` (
  `accionesID` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estadoacc` bit(1) NOT NULL,
  PRIMARY KEY (`accionesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `catalogoID` int NOT NULL AUTO_INCREMENT,
  `tiposervicioID` int DEFAULT NULL,
  `foto` binary(1) DEFAULT NULL,
  `estadocat` bit(1) NOT NULL,
  PRIMARY KEY (`catalogoID`),
  KEY `fk_catalogo_tipo_servicio1_idx` (`tiposervicioID`),
  CONSTRAINT `fk_catalogo_tipo_servicio1` FOREIGN KEY (`tiposervicioID`) REFERENCES `tipo_servicio` (`tiposervicioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `clienteID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipodocumento` varchar(50) DEFAULT NULL,
  `numerodocumento` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `foto` binary(1) DEFAULT NULL,
  `estadocliente` bit(1) NOT NULL,
  PRIMARY KEY (`clienteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_tipo_servicio`
--

DROP TABLE IF EXISTS `detalle_tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_tipo_servicio` (
  `tiposervicioID` int NOT NULL,
  `accionesID` int NOT NULL,
  KEY `fk_acciones_has_tipo_servicio_tipo_servicio1_idx` (`tiposervicioID`),
  KEY `fk_acciones_has_tipo_servicio_acciones1_idx` (`accionesID`),
  CONSTRAINT `fk_acciones_has_tipo_servicio_acciones1` FOREIGN KEY (`accionesID`) REFERENCES `acciones` (`accionesID`),
  CONSTRAINT `fk_acciones_has_tipo_servicio_tipo_servicio1` FOREIGN KEY (`tiposervicioID`) REFERENCES `tipo_servicio` (`tiposervicioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_tipo_servicio`
--

LOCK TABLES `detalle_tipo_servicio` WRITE;
/*!40000 ALTER TABLE `detalle_tipo_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `marcaID` int NOT NULL AUTO_INCREMENT,
  `marcainfo` varchar(45) NOT NULL,
  `tipodevehiculo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`marcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `modeloID` int NOT NULL AUTO_INCREMENT,
  `modeloinfo` varchar(45) NOT NULL,
  `marcaID` int DEFAULT NULL,
  PRIMARY KEY (`modeloID`),
  KEY `fk_modelo_marca1_idx` (`marcaID`),
  CONSTRAINT `fk_modelo_marca1` FOREIGN KEY (`marcaID`) REFERENCES `marca` (`marcaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion`
--

DROP TABLE IF EXISTS `programacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programacion` (
  `programacionID` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `horaprogramada` varchar(45) DEFAULT NULL,
  `sedeID` int DEFAULT NULL,
  PRIMARY KEY (`programacionID`),
  KEY `fk_programacion_sede1_idx` (`sedeID`),
  CONSTRAINT `fk_programacion_sede1` FOREIGN KEY (`sedeID`) REFERENCES `sede` (`sedeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion`
--

LOCK TABLES `programacion` WRITE;
/*!40000 ALTER TABLE `programacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `programacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `reservaID` int NOT NULL AUTO_INCREMENT,
  `clienteID` int NOT NULL,
  `catalogoID` int NOT NULL,
  `programacionID` int NOT NULL,
  `vehiculoID` int NOT NULL,
  PRIMARY KEY (`reservaID`),
  KEY `fk_reserva_vehiculo1_idx` (`vehiculoID`),
  KEY `fk_reserva_cliente1_idx` (`clienteID`),
  KEY `fk_reserva_programacion1_idx` (`programacionID`),
  KEY `fk_reserva_catalogo1_idx` (`catalogoID`),
  CONSTRAINT `fk_reserva_catalogo1` FOREIGN KEY (`catalogoID`) REFERENCES `catalogo` (`catalogoID`),
  CONSTRAINT `fk_reserva_cliente1` FOREIGN KEY (`clienteID`) REFERENCES `cliente` (`clienteID`),
  CONSTRAINT `fk_reserva_programacion1` FOREIGN KEY (`programacionID`) REFERENCES `programacion` (`programacionID`),
  CONSTRAINT `fk_reserva_vehiculo1` FOREIGN KEY (`vehiculoID`) REFERENCES `vehiculo` (`vehiculoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `nomrol` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMIN'),(2,'USER');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `sedeID` int NOT NULL AUTO_INCREMENT,
  `nombresede` varchar(100) NOT NULL,
  `sedeinfo` varchar(100) DEFAULT NULL,
  `sedecol` varchar(45) DEFAULT NULL,
  `lunes` tinyint(1) DEFAULT NULL,
  `martes` tinyint(1) DEFAULT NULL,
  `miercoles` tinyint(1) DEFAULT NULL,
  `jueves` tinyint(1) DEFAULT NULL,
  `viernes` tinyint(1) DEFAULT NULL,
  `sabado` tinyint(1) DEFAULT NULL,
  `domingo` tinyint(1) DEFAULT NULL,
  `horaabierto` time DEFAULT NULL,
  `horacierre` time DEFAULT NULL,
  `estadosede` bit(1) NOT NULL,
  PRIMARY KEY (`sedeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES (2,'san juan de miraflores',' Av. Andrés A. Cáceres, Mzna ',NULL,1,0,1,0,1,0,0,'16:37:00','20:41:00',_binary '');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_realizado`
--

DROP TABLE IF EXISTS `servicio_realizado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_realizado` (
  `serviciorealizadoID` int NOT NULL AUTO_INCREMENT,
  `calificacion` int DEFAULT NULL,
  `comentario` varchar(500) DEFAULT NULL,
  `reservaID` int DEFAULT NULL,
  PRIMARY KEY (`serviciorealizadoID`),
  KEY `fk_servicio_realizado_reserva1_idx` (`reservaID`),
  CONSTRAINT `fk_servicio_realizado_reserva1` FOREIGN KEY (`reservaID`) REFERENCES `reserva` (`reservaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_realizado`
--

LOCK TABLES `servicio_realizado` WRITE;
/*!40000 ALTER TABLE `servicio_realizado` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio_realizado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `tiposervicioID` int NOT NULL AUTO_INCREMENT,
  `descripciontps` varchar(100) NOT NULL,
  `tipovehiculo` varchar(45) NOT NULL,
  `estadotps` bit(1) NOT NULL,
  PRIMARY KEY (`tiposervicioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajador`
--

DROP TABLE IF EXISTS `trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajador` (
  `trabajadorID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `tipodocumento` varchar(50) DEFAULT NULL,
  `numerodocumento` int DEFAULT NULL,
  `sedeID` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `fechacontratacion` date DEFAULT NULL,
  `foto` binary(1) DEFAULT NULL,
  `estadotrab` bit(1) NOT NULL,
  PRIMARY KEY (`trabajadorID`),
  KEY `fk_trabajador_sede1_idx` (`sedeID`),
  CONSTRAINT `fk_trabajador_sede1` FOREIGN KEY (`sedeID`) REFERENCES `sede` (`sedeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajador`
--

LOCK TABLES `trabajador` WRITE;
/*!40000 ALTER TABLE `trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nomusuario` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','nayeli@g','$2a$06$f8HdpmAl6FsuHs7z0cA5B.GD93hsivos6D1.x0qN5rCU2yuZtXcX6','nayeli','ramirez',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `idusuario` int NOT NULL,
  `idrol` int NOT NULL,
  PRIMARY KEY (`idusuario`,`idrol`),
  KEY `fk_usuario_has_rol_rol1_idx` (`idrol`),
  KEY `fk_usuario_has_rol_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_usuario_has_rol_rol1` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fk_usuario_has_rol_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `vehiculoID` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(45) NOT NULL,
  PRIMARY KEY (`vehiculoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-01 16:05:25
