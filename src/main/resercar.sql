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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Toyota','auto'),(2,'Toyota','camioneta'),(3,'Toyota','minivan'),(4,'Toyota','van'),(5,'Toyota','motocicleta'),(6,'Ford','auto'),(7,'Ford','camioneta'),(8,'Ford','minivan'),(9,'Ford','van'),(10,'Ford','motocicleta'),(11,'Honda','auto'),(12,'Honda','camioneta'),(13,'Honda','minivan'),(14,'Honda','van'),(15,'Honda','motocicleta'),(16,'Chevrolet','auto'),(17,'Chevrolet','camioneta'),(18,'Chevrolet','minivan'),(19,'Chevrolet','van'),(20,'Chevrolet','motocicleta'),(21,'Nissan','auto'),(22,'Nissan','camioneta'),(23,'Nissan','minivan'),(24,'Nissan','van'),(25,'Nissan','motocicleta'),(26,'BMW','auto'),(27,'BMW','camioneta'),(28,'BMW','minivan'),(29,'BMW','van'),(30,'BMW','motocicleta'),(31,'Mercedes-Benz','auto'),(32,'Mercedes-Benz','camioneta'),(33,'Mercedes-Benz','minivan'),(34,'Mercedes-Benz','van'),(35,'Mercedes-Benz','motocicleta'),(36,'Audi','auto'),(37,'Audi','camioneta'),(38,'Audi','minivan'),(39,'Audi','van'),(40,'Audi','motocicleta');
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
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Corolla',1),(2,'Camry',1),(3,'Prius',1),(4,'Avalon',1),(5,'Yaris',1),(6,'86',1),(7,'Supra',1),(8,'Mirai',1),(9,'C-HR',1),(10,'Celica',1),(11,'Hilux',2),(12,'Tacoma',2),(13,'Tundra',2),(14,'4Runner',2),(15,'Land Cruiser',2),(16,'Sequoia',2),(17,'FJ Cruiser',2),(18,'Fortuner',2),(19,'RAV4',2),(20,'Highlander',2),(21,'Sienna',3),(22,'Alphard',3),(23,'Estima',3),(24,'Vellfire',3),(25,'Noah',3),(26,'Voxy',3),(27,'Esquire',3),(28,'Hiace',3),(29,'Granvia',3),(30,'Previa',3),(31,'Hiace Van',4),(32,'Liteace',4),(33,'Townace',4),(34,'Dyna',4),(35,'Coaster',4),(36,'Quick Delivery',4),(37,'Regius Ace',4),(38,'Touring Hiace',4),(39,'Probox',4),(40,'Succeed',4),(41,'Motomachi',5),(42,'Yamaha',5),(43,'Kawasaki',5),(44,'Honda',5),(45,'Suzuki',5),(46,'Harley-Davidson',5),(47,'Ducati',5),(48,'BMW Motorrad',5),(49,'Triumph',5),(50,'Aprilia',5),(51,'Focus',6),(52,'Fiesta',6),(53,'Fusion',6),(54,'Mustang',6),(55,'Taurus',6),(56,'Mondeo',6),(57,'Ka',6),(58,'Galaxy',6),(59,'Escort',6),(60,'Puma',6),(61,'Ranger',7),(62,'F-150',7),(63,'F-250',7),(64,'F-350',7),(65,'F-450',7),(66,'Bronco',7),(67,'Explorer',7),(68,'Expedition',7),(69,'Everest',7),(70,'Escape',7),(71,'Galaxy',8),(72,'S-Max',8),(73,'Tourneo Custom',8),(74,'Transit Connect',8),(75,'Transit Custom',8),(76,'Transit Courier',8),(77,'Freestar',8),(78,'Windstar',8),(79,'Aerostar',8),(80,'Econoline',8),(81,'Transit',9),(82,'E-Series',9),(83,'Transit Connect',9),(84,'Tourneo Custom',9),(85,'Transit Custom',9),(86,'Econovan',9),(87,'Courier',9),(88,'Club Wagon',9),(89,'SuperVan',9),(90,'Parcel Van',9),(91,'Thunderbird',10),(92,'Rocket',10),(93,'Daytona',10),(94,'Speed Triple',10),(95,'Street Triple',10),(96,'Tiger',10),(97,'Bonneville',10),(98,'Scrambler',10),(99,'Trophy',10),(100,'Sprint',10),(101,'Civic',11),(102,'Accord',11),(103,'Fit',11),(104,'City',11),(105,'Insight',11),(106,'CR-Z',11),(107,'Jazz',11),(108,'Legend',11),(109,'Crosstour',11),(110,'Brio',11),(111,'CR-V',12),(112,'HR-V',12),(113,'Passport',12),(114,'Pilot',12),(115,'Element',12),(116,'Ridgeline',12),(117,'MDX',12),(118,'RDX',12),(119,'UR-V',12),(120,'XR-V',12),(121,'Odyssey',13),(122,'Stepwgn',13),(123,'Elysion',13),(124,'Freed',13),(125,'Mobilio',13),(126,'S-MX',13),(127,'Spike',13),(128,'FR-V',13),(129,'Stream',13),(130,'Shuttle',13),(131,'Acty',14),(132,'Vamos',14),(133,'Hobio',14),(134,'Street',14),(135,'TN-V',14),(136,'Partner',14),(137,'Domani',14),(138,'Lagreat',14),(139,'Pilot',14),(140,'Edix',14),(141,'CBR',15),(142,'Gold Wing',15),(143,'Rebel',15),(144,'Africa Twin',15),(145,'Shadow',15),(146,'Fireblade',15),(147,'Interceptor',15),(148,'NC750X',15),(149,'Forza',15),(150,'Super Cub',15),(151,'Spark',16),(152,'Aveo',16),(153,'Sonic',16),(154,'Cruze',16),(155,'Malibu',16),(156,'Impala',16),(157,'Camaro',16),(158,'Corvette',16),(159,'Bolt',16),(160,'Volt',16),(161,'Colorado',17),(162,'Silverado',17),(163,'Avalanche',17),(164,'Blazer',17),(165,'Trailblazer',17),(166,'Tahoe',17),(167,'Suburban',17),(168,'Traverse',17),(169,'Equinox',17),(170,'Trax',17),(171,'Orlando',18),(172,'Uplander',18),(173,'Venture',18),(174,'Lumina APV',18),(175,'Trans Sport',18),(176,'Sintra',18),(177,'Astro',18),(178,'Safari',18),(179,'Express',18),(180,'Corsica',18),(181,'Express Van',19),(182,'Chevy Van',19),(183,'G-Series',19),(184,'Beauville',19),(185,'Sportvan',19),(186,'Step-Van',19),(187,'Handi-Van',19),(188,'P-Series',19),(189,'Van',19),(190,'Nomad',19),(191,'Falcon',20),(192,'Condor',20),(193,'Apache',20),(194,'Bison',20),(195,'Cheetah',20),(196,'Cougar',20),(197,'Mustang',20),(198,'Panther',20),(199,'Tiger',20),(200,'Wildcat',20),(201,'Micra',21),(202,'Sunny',21),(203,'Almera',21),(204,'Sentra',21),(205,'Altima',21),(206,'Maxima',21),(207,'Leaf',21),(208,'370Z',21),(209,'GT-R',21),(210,'Versa',21),(211,'Frontier',22),(212,'Navara',22),(213,'Titan',22),(214,'X-Trail',22),(215,'Pathfinder',22),(216,'Murano',22),(217,'Armada',22),(218,'Patrol',22),(219,'Terrano',22),(220,'Qashqai',22),(221,'Serena',23),(222,'Elgrand',23),(223,'NV200',23),(224,'NV350',23),(225,'Hommy',23),(226,'Vanette',23),(227,'Caravan',23),(228,'Prairie',23),(229,'Largo',23),(230,'Rogue',23),(231,'Urvan',24),(232,'Clipper',24),(233,'Caravan',24),(234,'AD',24),(235,'Vanette',24),(236,'Atlas',24),(237,'NV350',24),(238,'Cabstar',24),(239,'Interstar',24),(240,'Primastar',24),(241,'Grom',25),(242,'Monkey',25),(243,'Cub',25),(244,'Africa Twin',25),(245,'Navi',25),(246,'XR150',25),(247,'Rebel 500',25),(248,'CBR500R',25),(249,'Shadow Phantom',25),(250,'Gold Wing',25),(251,'3 Series',26),(252,'5 Series',26),(253,'7 Series',26),(254,'X1',26),(255,'X3',26),(256,'X5',26),(257,'Z4',26),(258,'i3',26),(259,'i8',26),(260,'M3',26),(261,'X6',27),(262,'X7',27),(263,'X4',27),(264,'X2',27),(265,'iX3',27),(266,'X5 M',27),(267,'X6 M',27),(268,'X3 M',27),(269,'X1 M',27),(270,'X7 M',27),(271,'2 Series',28),(272,'Active Tourer',28),(273,'Gran Tourer',28),(274,'Touring',28),(275,'Sports Wagon',28),(276,'Gran Coupe',28),(277,'Compact',28),(278,'Compact Active Tourer',28),(279,'Compact Gran Tourer',28),(280,'Compact Touring',28),(281,'iX',29),(282,'2 Series Active Tourer',29),(283,'2 Series Gran Tourer',29),(284,'Vario',29),(285,'Cargo',29),(286,'Delivery',29),(287,'Passenger',29),(288,'Sprinter',29),(289,'Transporter',29),(290,'Combi',29),(291,'S 1000 RR',30),(292,'R 1250 GS',30),(293,'K 1600 B',30),(294,'G 310 R',30),(295,'F 850 GS',30),(296,'C 400 X',30),(297,'R 18',30),(298,'R nineT',30),(299,'S 1000 XR',30),(300,'K 1600 GT',30),(301,'A-Class',31),(302,'C-Class',31),(303,'E-Class',31),(304,'S-Class',31),(305,'CLA',31),(306,'CLS',31),(307,'GLA',31),(308,'GLC',31),(309,'GLE',31),(310,'GLS',31),(311,'X-Class',32),(312,'G-Class',32),(313,'GLK',32),(314,'GL',32),(315,'G Wagon',32),(316,'EQC',32),(317,'GLB',32),(318,'GLE Coupe',32),(319,'G 63 AMG',32),(320,'GLA Coupe',32),(321,'V-Class',33),(322,'Vito',33),(323,'Citan',33),(324,'Sprinter',33),(325,'Marco Polo',33),(326,'Valente',33),(327,'EQV',33),(328,'Vaneo',33),(329,'Vario',33),(330,'MB100',33),(331,'Sprinter Van',34),(332,'Vito Van',34),(333,'Citan Van',34),(334,'V-Class Van',34),(335,'Vario Van',34),(336,'Valente Van',34),(337,'EQV Van',34),(338,'MB100 Van',34),(339,'L319',34),(340,'T1',34),(341,'AMG',35),(342,'Silver Arrow',35),(343,'Black Series',35),(344,'Brabus',35),(345,'SLS',35),(346,'Evo',35),(347,'Roadster',35),(348,'Speedster',35),(349,'Stealth',35),(350,'Sprint',35),(351,'A3',36),(352,'A4',36),(353,'A5',36),(354,'A6',36),(355,'A7',36),(356,'A8',36),(357,'Q2',36),(358,'Q3',36),(359,'Q5',36),(360,'Q7',36),(361,'Q8',37),(362,'e-tron',37),(363,'SQ5',37),(364,'RS Q3',37),(365,'RS Q8',37),(366,'Q4',37),(367,'Q5 Sportback',37),(368,'Q7 e-tron',37),(369,'Q8 e-tron',37),(370,'Q6 e-tron',37),(371,'Q5L',38),(372,'Q7L',38),(373,'A6 Allroad',38),(374,'A4 Allroad',38),(375,'RS6 Avant',38),(376,'S6 Avant',38),(377,'RS4 Avant',38),(378,'A3 Sportback',38),(379,'A1 Sportback',38),(380,'A6 Avant',38),(381,'Transporter',39),(382,'Cargo Van',39),(383,'Passenger Van',39),(384,'Delivery Van',39),(385,'Sprinter Van',39),(386,'Transporter T6',39),(387,'Transporter T5',39),(388,'Transporter T4',39),(389,'Multivan',39),(390,'California',39),(391,'TT',40),(392,'R8',40),(393,'RS5',40),(394,'RS6',40),(395,'RS7',40),(396,'S3',40),(397,'S4',40),(398,'S5',40),(399,'S6',40),(400,'S7',40);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
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

-- Dump completed on 2024-08-02 16:38:26
