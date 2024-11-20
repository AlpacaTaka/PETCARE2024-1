-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: basededatostele
-- ------------------------------------------------------
-- Server version	8.0.33
-- -----------------------------------------------------
-- Schema basededatostele
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `basededatostele` ;

-- -----------------------------------------------------
-- Schema basededatostele
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `basededatostele` DEFAULT CHARACTER SET utf8mb3 ;
USE `basededatostele` ;

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
-- Table structure for table `admin_credenciales`
--

DROP TABLE IF EXISTS `admin_credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_credenciales` (
  `idadmin_credenciales` int NOT NULL AUTO_INCREMENT,
  `correoElectronico` varchar(150) NOT NULL,
  `contrasenia` varchar(150) NOT NULL,
  `adminID` int unsigned NOT NULL,
  PRIMARY KEY (`idadmin_credenciales`,`adminID`),
  UNIQUE KEY `correoElectronico_UNIQUE` (`correoElectronico`),
  KEY `fk_admin_credenciales_administrador1_idx` (`adminID`),
  CONSTRAINT `fk_admin_credenciales_administrador1` FOREIGN KEY (`adminID`) REFERENCES `administrador` (`administradorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_credenciales`
--

LOCK TABLES `admin_credenciales` WRITE;
/*!40000 ALTER TABLE `admin_credenciales` DISABLE KEYS */;
INSERT INTO `admin_credenciales` VALUES (1,'admin1@admin.com','ebcfc99aa881883fd9a06b78b50b140df65f2794470e444d57470345dacdb536',4);
/*!40000 ALTER TABLE `admin_credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `administradorID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(100) NOT NULL,
  PRIMARY KEY (`administradorID`),
  UNIQUE KEY `NombreUsuario_UNIQUE` (`nombreUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (4,'admin1@admin.com');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albergue`
--

DROP TABLE IF EXISTS `albergue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albergue` (
  `albergueID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreAlbergue` varchar(80) NOT NULL,
  `nombreEncargado` varchar(50) NOT NULL,
  `apellidoEncargado` varchar(70) NOT NULL,
  `espaciosDisponibles` int NOT NULL,
  `fechaCreacion` date NOT NULL,
  `correoElectronico` varchar(150) NOT NULL,
  `cantidadAnimales` int unsigned NOT NULL,
  `urlFacebook` varchar(255) DEFAULT NULL,
  `urlInstagram` varchar(255) DEFAULT NULL,
  `direccion` text NOT NULL,
  `distritoID` int unsigned NOT NULL,
  `puntoAcopioDonaciones` text NOT NULL,
  `direccionDonaciones` text NOT NULL,
  `nombreContactoDonaciones` varchar(80) NOT NULL,
  `numeroContactoDonaciones` char(9) NOT NULL,
  `numeroYape` char(9) DEFAULT NULL,
  `numeroPlin` char(9) DEFAULT NULL,
  `codigoQR` varchar(255) NOT NULL,
  `aprobado` tinyint DEFAULT NULL,
  `fotoID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL DEFAULT '1',
  `fechaRegistrado` date NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`albergueID`),
  UNIQUE KEY `CorreoElectrónico_UNIQUE` (`correoElectronico`),
  UNIQUE KEY `CódigoQR_UNIQUE` (`codigoQR`),
  UNIQUE KEY `URL_Facebook_UNIQUE` (`urlFacebook`),
  UNIQUE KEY `URLInstagram_UNIQUE` (`urlInstagram`),
  KEY `fk_Albergue_Distrito1_idx` (`distritoID`),
  KEY `fk_Albergue_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_Albergue_Distrito1` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_Albergue_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albergue`
--

LOCK TABLES `albergue` WRITE;
/*!40000 ALTER TABLE `albergue` DISABLE KEYS */;
INSERT INTO `albergue` VALUES (6,'Refugio Norte','Juan','Perez',50,'2022-01-01','refugionorte@mail.com',30,'facebook.com/refugionorte','instagram.com/refugionorte','Calle Norte 123',1,'Calle Norte 456','Calle Norte 789','Maria Lopez','987654321','123456789','987654321','QR1',1,30,0,'2024-11-01','Albergue dedicado a animales del norte.'),(7,'Amigos de Patas','Luis','Torres',60,'2021-05-15','amigospatas@mail.com',40,'facebook.com/amigospatas','instagram.com/amigospatas','Avenida Primavera 789',2,'Avenida Primavera 123','Calle Sur 456','Carlos Ramirez','912345678','123456780','987654320','QR2',1,30,0,'2024-11-02','Un hogar temporal para animales.'),(8,'Huellitas Felices','Ana','Lopez',45,'2020-03-10','huellitasfelices@mail.com',25,'facebook.com/huellitasfelices','instagram.com/huellitasfelices','Calle Sol 123',3,'Calle Sol 456','Calle Sol 789','Luis Vargas','923456789','123456781','987654321','QR3',0,30,0,'2024-11-03','Albergue en el centro de la ciudad.'),(9,'Esperanza Animal','Sofia','Gomez',70,'2019-07-25','esperanzaanimal@mail.com',50,'facebook.com/esperanzaanimal','instagram.com/esperanzaanimal','Jr. Los Álamos 321',4,'Jr. Los Álamos 456','Jr. Los Álamos 789','Carmen Diaz','934567890','123456782','987654322','QR4',1,30,0,'2024-11-04','Albergue con un gran corazón.'),(10,'Patas y Manos','Diego','Fernandez',35,'2023-01-10','patasymanos@mail.com',20,'facebook.com/patasymanos','instagram.com/patasymanos','Calle Luna 456',5,'Calle Luna 789','Calle Luna 321','Jose Perez','945678901','123456783','987654323','QR5',0,30,0,'2024-11-05','Un espacio donde la ayuda nunca falta.');
/*!40000 ALTER TABLE `albergue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albergue_credenciales`
--

DROP TABLE IF EXISTS `albergue_credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albergue_credenciales` (
  `idalbergue_credenciales` int NOT NULL AUTO_INCREMENT,
  `correoElectronico` varchar(150) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `albergueID` int unsigned NOT NULL,
  `requiere_cambio_clave` tinyint DEFAULT '0',
  `token_recuperacion` varchar(255) DEFAULT NULL,
  `fecha_expiracion_token` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idalbergue_credenciales`,`albergueID`),
  UNIQUE KEY `correoElectronico_UNIQUE` (`correoElectronico`),
  KEY `fk_albergue_credenciales_albergue1_idx` (`albergueID`),
  CONSTRAINT `fk_albergue_credenciales_albergue1` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albergue_credenciales`
--

LOCK TABLES `albergue_credenciales` WRITE;
/*!40000 ALTER TABLE `albergue_credenciales` DISABLE KEYS */;
INSERT INTO `albergue_credenciales` VALUES (1,'refugionorte@mail.com','5375ffb951b303b5cef7b5660c6e491783e9e39a5dc450354b43973b02d393f1',6,1,NULL,NULL),(2,'amigospatas@mail.com','5375ffb951b303b5cef7b5660c6e491783e9e39a5dc450354b43973b02d393f1',7,1,NULL,NULL),(3,'huellitasfelices@mail.com','5375ffb951b303b5cef7b5660c6e491783e9e39a5dc450354b43973b02d393f1',8,1,NULL,NULL),(4,'esperanzaanimal@mail.com','5375ffb951b303b5cef7b5660c6e491783e9e39a5dc450354b43973b02d393f1',9,1,NULL,NULL),(5,'patasymanos@mail.com','5375ffb951b303b5cef7b5660c6e491783e9e39a5dc450354b43973b02d393f1',10,1,NULL,NULL);
/*!40000 ALTER TABLE `albergue_credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idComentarios` int unsigned NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(250) NOT NULL,
  `coordinadorID` int unsigned NOT NULL,
  `publicacionMascotaPerdidaID` int unsigned NOT NULL,
  `fechaComentario` date NOT NULL,
  PRIMARY KEY (`idComentarios`),
  KEY `fk_Comentarios_CoordinadorZona1_idx` (`coordinadorID`),
  KEY `fk_Comentarios_PublicacionMascotaPerdida1_idx` (`publicacionMascotaPerdidaID`),
  CONSTRAINT `fk_Comentarios_CoordinadorZona1` FOREIGN KEY (`coordinadorID`) REFERENCES `coordinadorzona` (`coordinadorID`),
  CONSTRAINT `fk_Comentarios_PublicacionMascotaPerdida1` FOREIGN KEY (`publicacionMascotaPerdidaID`) REFERENCES `publicacionmascotaperdida` (`publicacionMascotaPerdidaID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (12,'Vi al perro cerca del parque',6,16,'2024-11-02'),(13,'El gato fue visto en un techo cerca del mercado',7,17,'2024-11-03'),(14,'Un vecino mencionó haber visto al perro en la calle sur',8,18,'2024-11-04'),(15,'El ave fue encontrada cerca del árbol central',9,19,'2024-11-05'),(16,'El conejo fue visto saltando en un jardín cercano',10,20,'2024-11-06');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinador_credenciales`
--

DROP TABLE IF EXISTS `coordinador_credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinador_credenciales` (
  `idcoordinador_credenciales` int NOT NULL AUTO_INCREMENT,
  `correoElectronico` varchar(155) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `requiere_cambio_clave` tinyint DEFAULT '0',
  `token_recuperacion` varchar(255) DEFAULT NULL,
  `fecha_expiracion_token` timestamp(6) NULL DEFAULT NULL,
  `coordinadorID` int unsigned NOT NULL,
  PRIMARY KEY (`idcoordinador_credenciales`,`coordinadorID`),
  UNIQUE KEY `correoElectronico_UNIQUE` (`correoElectronico`),
  KEY `fk_coordinador_credenciales_coordinadorzona1_idx` (`coordinadorID`),
  CONSTRAINT `fk_coordinador_credenciales_coordinadorzona1` FOREIGN KEY (`coordinadorID`) REFERENCES `coordinadorzona` (`coordinadorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinador_credenciales`
--

LOCK TABLES `coordinador_credenciales` WRITE;
/*!40000 ALTER TABLE `coordinador_credenciales` DISABLE KEYS */;
INSERT INTO `coordinador_credenciales` VALUES (1,'juan@correo.com','1ec0c087bb9340326247f9536ac7932e98b593cc23315de8643f1bd082a83db4',1,NULL,NULL,6),(2,'ana@correo.com','1e57b56ccbe3e9361f3cac36c09b7de1b5e336baf1b364d1e02528cd42786d4c',1,NULL,NULL,7),(3,'rick@correo.com','d8cc2b22febbd53a8ae0d1a76b2ee480f61f2c4e8890023a86eb843c45220fb8',1,NULL,NULL,8),(4,'yaco@correo.com','28646c8f904a27e538d861277b890d8ad546bf8eed5c20eda9e4bcd673bd7ff4',1,NULL,NULL,9),(5,'morty@correo.com','7a97993b9fcf3e664273e0d9de4924a5bae47682eaa98d3d28c4e21330a790a2',1,NULL,NULL,10);
/*!40000 ALTER TABLE `coordinador_credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinadorzona`
--

DROP TABLE IF EXISTS `coordinadorzona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coordinadorzona` (
  `coordinadorID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `dni` char(8) NOT NULL,
  `correoElectronico` varchar(150) NOT NULL,
  `celular` char(9) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `activo` tinyint NOT NULL,
  `zonaID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`coordinadorID`),
  UNIQUE KEY `DNI_UNIQUE` (`dni`),
  UNIQUE KEY `CorreoElectrónico_UNIQUE` (`correoElectronico`),
  UNIQUE KEY `Teléfono_UNIQUE` (`celular`),
  KEY `fk_CoordinadorZona_Fotos1_idx` (`fotoID`),
  KEY `fk_CoordinadorZona_Zona1_idx` (`zonaID`),
  CONSTRAINT `fk_CoordinadorZona_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_CoordinadorZona_Zona1` FOREIGN KEY (`zonaID`) REFERENCES `zona` (`zonaID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinadorzona`
--

LOCK TABLES `coordinadorzona` WRITE;
/*!40000 ALTER TABLE `coordinadorzona` DISABLE KEYS */;
INSERT INTO `coordinadorzona` VALUES (6,'Juan','Perez','12345678','juan@correo.com','987654321','1985-01-01',30,1,1,0),(7,'Ana','Lopez','17654321','ana@correo.com','912345672','1990-05-15',32,1,2,0),(8,'Rick','Sanchez','92345678','rick@correo.com','987654323','1985-01-01',33,1,3,0),(9,'Yaco','Pastorius','27654321','yaco@correo.com','912345674','1990-05-15',31,1,4,0),(10,'Morty','Sanchez','37654321','morty@correo.com','912345675','1990-05-15',32,0,3,1);
/*!40000 ALTER TABLE `coordinadorzona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denunciamaltrato`
--

DROP TABLE IF EXISTS `denunciamaltrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `denunciamaltrato` (
  `denunciaID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `tamanio` enum('Pequenio','Mediano','Grande') NOT NULL,
  `especie` varchar(45) NOT NULL,
  `raza` varchar(45) NOT NULL,
  `tipoMaltrato` varchar(50) NOT NULL,
  `nombreApellidoMaltratador` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `realizoDenuncia` tinyint NOT NULL,
  `eliminado` tinyint NOT NULL,
  `fechaFormulario` date NOT NULL,
  PRIMARY KEY (`denunciaID`),
  KEY `fk_DenunciaMaltrato_Usuario1_idx` (`usuarioID`),
  KEY `fk_denunciamaltrato_fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_denunciamaltrato_fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_DenunciaMaltrato_Usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denunciamaltrato`
--

LOCK TABLES `denunciamaltrato` WRITE;
/*!40000 ALTER TABLE `denunciamaltrato` DISABLE KEYS */;
INSERT INTO `denunciamaltrato` VALUES (18,7,'Grande','Perro','Labrador','Maltrato físico','Luis Gomez','Calle Norte 123',35,1,0,'2024-11-01'),(19,8,'Pequenio','Gato','Siames','Abandono','Maria Torres','Avenida Primavera 456',35,1,0,'2024-11-02'),(20,9,'Mediano','Perro','Beagle','Falta de alimento','Juan Perez','Calle Sol 789',35,1,0,'2024-11-03'),(21,10,'Grande','Perro','Golden Retriever','Maltrato físico',NULL,'Calle Luna 321',35,0,0,'2024-11-04'),(22,11,'Pequenio','Ave','Perico','Encerrado en jaula pequeña','Sofia Lopez','Jr. Los Álamos 321',35,1,0,'2024-11-05');
/*!40000 ALTER TABLE `denunciamaltrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distrito`
--

DROP TABLE IF EXISTS `distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distrito` (
  `distritoID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreDistrito` varchar(45) NOT NULL,
  `zonaID` int unsigned NOT NULL,
  PRIMARY KEY (`distritoID`),
  KEY `fk_Distrito_Zona1_idx` (`zonaID`),
  CONSTRAINT `fk_Distrito_Zona1` FOREIGN KEY (`zonaID`) REFERENCES `zona` (`zonaID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distrito`
--

LOCK TABLES `distrito` WRITE;
/*!40000 ALTER TABLE `distrito` DISABLE KEYS */;
INSERT INTO `distrito` VALUES (1,'Ancón',3),(2,'Santa Rosa',3),(3,'Carabayllo',3),(4,'Comas',3),(5,'Los Olivos',3),(6,'San Martín de Porres',3),(7,'Independencia',3),(8,'San Juan de Miraflores',4),(9,'Villa María del Triunfo',4),(10,'Villa El Salvador',4),(11,'Pachacámac',4),(12,'Lurín',4),(13,'Punta Hermosa',4),(14,'Punta Negra',4),(15,'San Bartolo',4),(16,'Santa María del Mar',4),(17,'Pucusana',4),(18,'San Juan de Lurigancho',1),(19,'Lurigancho-Chosica',1),(20,'Ate',1),(21,'El Agustino',1),(22,'Santa Anita',1),(23,'La Molina',1),(24,'Cieneguilla',1),(25,'Rímac',2),(26,'Cercado de Lima',2),(27,'Breña',2),(28,'Pueblo Libre',2),(29,'Magdalena',2),(30,'Jesús María',2),(31,'La Victoria',2),(32,'Lince',2),(33,'San Isidro',2),(34,'San Miguel',2),(35,'Surquillo',2),(36,'San Borja',2),(37,'Santiago de Surco',2),(38,'Barranco',2),(39,'Chorrillos',2),(40,'San Luis',2),(41,'Miraflores',2);
/*!40000 ALTER TABLE `distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donacionsuministros`
--

DROP TABLE IF EXISTS `donacionsuministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donacionsuministros` (
  `donacionSuministrosID` int unsigned NOT NULL AUTO_INCREMENT,
  `tituloAvisoDonacion` varchar(45) NOT NULL,
  `correoElectronicoDonacion` varchar(75) NOT NULL,
  `tipoSuministro` enum('Alimenticios','Higiene','Confort','Medica') NOT NULL,
  `nombreSuministro` varchar(60) NOT NULL,
  `cantidadDonacionesTotales` int unsigned NOT NULL,
  `marcaSuministro` varchar(50) DEFAULT NULL,
  `distritoID` int unsigned NOT NULL,
  `albergueID` int unsigned NOT NULL,
  `fechaInicioRecepcion` date NOT NULL,
  `fechaFinRecepcion` date NOT NULL,
  `horaInicioRecepcion` time NOT NULL,
  `horaFinRecepcion` time NOT NULL,
  `mensajeParaDonantes` varchar(200) DEFAULT NULL,
  `fotoID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL,
  `eventoAlbergueID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`donacionSuministrosID`),
  KEY `fk_Donacion_Albergue1_idx` (`albergueID`),
  KEY `fk_donacion_fotos1_idx` (`fotoID`),
  KEY `fk_donacionsuministros_distrito1_idx` (`distritoID`),
  KEY `fk_donacionsuministros_eventobenefico1_idx` (`eventoAlbergueID`),
  CONSTRAINT `fk_Donacion_Albergue10` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`),
  CONSTRAINT `fk_donacion_fotos10` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_donacionsuministros_distrito1` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_donacionsuministros_eventobenefico1` FOREIGN KEY (`eventoAlbergueID`) REFERENCES `eventobenefico` (`eventoAlbergueID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donacionsuministros`
--

LOCK TABLES `donacionsuministros` WRITE;
/*!40000 ALTER TABLE `donacionsuministros` DISABLE KEYS */;
INSERT INTO `donacionsuministros` VALUES (6,'Donación de alimentos','donaciones@mail.com','Alimenticios','Croquetas',100,'DogChow',1,6,'2024-11-01','2024-11-30','09:00:00','18:00:00','Gracias por su apoyo',30,0,NULL),(7,'Donación de medicinas','medicinas@mail.com','Medica','Antibióticos',50,'Pfizer',2,7,'2024-11-05','2024-11-25','10:00:00','17:00:00','Ayuda médica para los refugios',31,0,NULL),(8,'Donación de higiene','higiene@mail.com','Higiene','Shampoo para mascotas',30,'PetCare',3,8,'2024-11-10','2024-11-20','08:00:00','15:00:00','Gracias por su colaboración',30,0,NULL),(9,'Donación de mantas','mantas@mail.com','Confort','Mantas térmicas',25,'ComfortPet',4,9,'2024-11-15','2024-11-30','09:30:00','16:30:00','Ayuda para el invierno',30,0,NULL),(10,'Donación de juguetes','juguetes@mail.com','Confort','Pelotas y mordedores',60,'PetFun',5,10,'2024-11-20','2024-11-25','10:00:00','18:00:00','Gracias por brindar felicidad',30,0,NULL);
/*!40000 ALTER TABLE `donacionsuministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventobenefico`
--

DROP TABLE IF EXISTS `eventobenefico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventobenefico` (
  `eventoAlbergueID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipoDonacion` enum('Suministros','Monetario') NOT NULL,
  `detalleMonetario` int unsigned DEFAULT NULL,
  `detalleSuministro` varchar(60) DEFAULT NULL,
  `distritoID` int unsigned NOT NULL,
  `fechaEvento` date NOT NULL,
  `lugarID` int unsigned NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `razonEvento` varchar(200) NOT NULL,
  `descripcionEvento` varchar(300) NOT NULL,
  `invitados` varchar(120) DEFAULT NULL,
  `fotoID` int unsigned NOT NULL,
  `albergueID` int unsigned NOT NULL,
  `aprobado` tinyint DEFAULT NULL,
  `eliminado` tinyint NOT NULL,
  PRIMARY KEY (`eventoAlbergueID`),
  KEY `fk_EventoBeneficoAlbergue_Albergue1_idx` (`albergueID`),
  KEY `fk_EventoBenefico_LugarEvento1_idx` (`lugarID`),
  KEY `fk_eventobenefico_fotos1_idx` (`fotoID`),
  KEY `fk_eventobenefico_distrito1_idx` (`distritoID`),
  CONSTRAINT `fk_eventobenefico_distrito1` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_eventobenefico_fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_EventoBenefico_LugarEvento1` FOREIGN KEY (`lugarID`) REFERENCES `lugarevento` (`lugarID`),
  CONSTRAINT `fk_EventoBeneficoAlbergue_Albergue1` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventobenefico`
--

LOCK TABLES `eventobenefico` WRITE;
/*!40000 ALTER TABLE `eventobenefico` DISABLE KEYS */;
INSERT INTO `eventobenefico` VALUES (16,'Adopción de Mascotas','Suministros',NULL,'Alimento para perros',1,'2024-12-01',17,'10:00:00','18:00:00','Fomentar la adopción','Evento de adopción','Todos',30,6,1,0),(17,'Colecta de Alimentos','Suministros',NULL,'Croquetas y latas de comida',2,'2024-12-10',18,'09:00:00','17:00:00','Ayudar a refugios locales','Recolección de alimentos para animales','Organizaciones locales',30,7,1,0),(18,'Taller de Cuidado Animal','Monetario',150,NULL,3,'2024-11-20',19,'14:00:00','18:00:00','Educar sobre el cuidado animal','Capacitación para voluntarios','Veterinarios y expertos',30,9,1,0),(19,'Jornada de Vacunación','Suministros',NULL,'Vacunas y medicamentos',4,'2024-11-15',20,'08:00:00','12:00:00','Proteger la salud de los animales','Campaña de vacunación gratuita','Todos los asistentes',30,6,1,0),(20,'Feria de Adopción','Monetario',200,NULL,5,'2024-12-05',21,'11:00:00','16:00:00','Promover la adopción responsable','Exposición de mascotas en adopción','Público en general',30,8,0,0);
/*!40000 ALTER TABLE `eventobenefico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `fotoID` int unsigned NOT NULL AUTO_INCREMENT,
  `rutaFoto` varchar(700) NOT NULL,
  PRIMARY KEY (`fotoID`),
  UNIQUE KEY `RutaFoto_UNIQUE` (`rutaFoto`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
INSERT INTO `fotos` VALUES (30,'ruta1.jpg'),(39,'ruta10.jpg'),(40,'ruta11.jpg'),(41,'ruta12.jpg'),(42,'ruta13.jpg'),(43,'ruta14.jpg'),(44,'ruta15.jpg'),(45,'ruta16.jpg'),(46,'ruta17.jpg'),(47,'ruta18.jpg'),(48,'ruta19.jpg'),(31,'ruta2.jpg'),(49,'ruta20.jpg'),(50,'ruta21.jpg'),(51,'ruta22.jpg'),(52,'ruta23.jpg'),(53,'ruta24.jpg'),(54,'ruta25.jpg'),(55,'ruta26.jpg'),(56,'ruta27.jpg'),(57,'ruta28.jpg'),(58,'ruta29.jpg'),(32,'ruta3.jpg'),(33,'ruta4.jpg'),(34,'ruta5.jpg'),(35,'ruta6.jpg'),(36,'ruta7.jpg'),(37,'ruta8.jpg'),(38,'ruta9.jpg');
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcionevento`
--

DROP TABLE IF EXISTS `inscripcionevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcionevento` (
  `inscripcionID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `eventoID` int unsigned NOT NULL,
  `entregoSuministro` tinyint DEFAULT NULL,
  PRIMARY KEY (`inscripcionID`),
  KEY `fk_InscripcionEvento_Usuario1_idx` (`usuarioID`),
  KEY `fk_InscripcionEvento_EventoBeneficoAlbergue1_idx` (`eventoID`),
  CONSTRAINT `fk_InscripcionEvento_EventoBeneficoAlbergue1` FOREIGN KEY (`eventoID`) REFERENCES `eventobenefico` (`eventoAlbergueID`),
  CONSTRAINT `fk_InscripcionEvento_Usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcionevento`
--

LOCK TABLES `inscripcionevento` WRITE;
/*!40000 ALTER TABLE `inscripcionevento` DISABLE KEYS */;
INSERT INTO `inscripcionevento` VALUES (6,7,16,1),(7,8,17,0),(8,7,18,1),(9,8,19,0),(10,9,20,1);
/*!40000 ALTER TABLE `inscripcionevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugarevento`
--

DROP TABLE IF EXISTS `lugarevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugarevento` (
  `lugarID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreLugar` varchar(60) NOT NULL,
  `direccionLugar` text NOT NULL,
  `aforoMax` int unsigned NOT NULL,
  `administradorID` int unsigned NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL,
  PRIMARY KEY (`lugarID`),
  KEY `fk_LugarEvento_Administrador1_idx` (`administradorID`),
  KEY `fk_LugarEvento_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_LugarEvento_Administrador1` FOREIGN KEY (`administradorID`) REFERENCES `administrador` (`administradorID`),
  CONSTRAINT `fk_LugarEvento_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugarevento`
--

LOCK TABLES `lugarevento` WRITE;
/*!40000 ALTER TABLE `lugarevento` DISABLE KEYS */;
INSERT INTO `lugarevento` VALUES (17,'Estadio Central','Av. Principal 123',300,4,30,0),(18,'Parque Norte','Calle Norte 456',500,4,30,0),(19,'Centro Comunitario','Jr. Sur 789',200,4,30,0),(20,'Auditorio Municipal','Avenida Primavera 123',150,4,30,0),(21,'Sala de Eventos Luna','Calle Luna 456',100,4,30,0),(22,'Pabellón Sur','Calle Sur 789',250,4,30,0),(23,'Cancha Deportiva Norte','Jr. Los Álamos 321',250,4,30,0),(24,'Plaza Central','Av. Principal 789',350,4,30,0);
/*!40000 ALTER TABLE `lugarevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotasadopcion`
--

DROP TABLE IF EXISTS `mascotasadopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotasadopcion` (
  `idAdopcion` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreMascota` varchar(45) NOT NULL,
  `especieMascota` varchar(45) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `distritoID` int unsigned NOT NULL,
  `direccionHallazgo` text NOT NULL,
  `edadAprox` int NOT NULL,
  `sexo` enum('Macho','Hembra') NOT NULL,
  `descripcionGeneral` text NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `seEncuentraTemporal` tinyint NOT NULL,
  `condicionesAdopcion` text NOT NULL,
  `albergueID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idAdopcion`),
  KEY `fk_MascotasAdopcion_Albergue1_idx` (`albergueID`),
  KEY `fk_mascotasadopcion_fotos1_idx` (`fotoID`),
  KEY `fk_mascotasadopcion_distrito1_idx` (`distritoID`),
  CONSTRAINT `fk_MascotasAdopcion_Albergue1` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`),
  CONSTRAINT `fk_mascotasadopcion_distrito1` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_mascotasadopcion_fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotasadopcion`
--

LOCK TABLES `mascotasadopcion` WRITE;
/*!40000 ALTER TABLE `mascotasadopcion` DISABLE KEYS */;
INSERT INTO `mascotasadopcion` VALUES (6,'Max','Perro','Golden Retriever',2,'Calle Sur 123',5,'Macho','Perro amigable',30,1,'Necesita jardín grande',6,0),(7,'Luna','Gato','Siames',3,'Calle Luna 456',3,'Hembra','Gata cariñosa y tranquila',30,0,'Ideal para apartamentos',7,0),(8,'Rocky','Perro','Labrador',1,'Avenida Primavera 789',4,'Macho','Juguetón y obediente',30,1,'Requiere espacio para correr',8,0),(9,'Bella','Perro','Beagle',4,'Calle Norte 321',2,'Hembra','Muy sociable con niños',30,0,'Perfecta para familias',9,0),(10,'Perry','Ave','Perico',5,'Jr. Los Álamos 321',1,'Macho','Plumaje colorido y activo',30,0,'Necesita jaula amplia',10,0);
/*!40000 ALTER TABLE `mascotasadopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotastemporal`
--

DROP TABLE IF EXISTS `mascotastemporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotastemporal` (
  `mascotaTemporalID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreMascotaTemporal` varchar(60) NOT NULL,
  `especie` varchar(50) NOT NULL,
  `raza` varchar(50) NOT NULL,
  `tamanio` varchar(45) NOT NULL,
  `peso` int NOT NULL,
  `edad` int NOT NULL,
  `sexo` enum('Macho','Hembra') NOT NULL,
  `poseeDiscapacidad` tinyint NOT NULL,
  `descripcionDiscapacidad` varchar(100) DEFAULT NULL,
  `fotoID` int unsigned NOT NULL,
  `albergueID` int unsigned NOT NULL,
  PRIMARY KEY (`mascotaTemporalID`),
  KEY `fk_MascotasTemporal_Albergue1_idx` (`albergueID`),
  KEY `fk_MascotasTemporal_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_MascotasTemporal_Albergue1` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`),
  CONSTRAINT `fk_MascotasTemporal_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotastemporal`
--

LOCK TABLES `mascotastemporal` WRITE;
/*!40000 ALTER TABLE `mascotastemporal` DISABLE KEYS */;
INSERT INTO `mascotastemporal` VALUES (7,'Bobby','Perro','Beagle','Mediano',12,3,'Macho',0,NULL,30,6),(8,'Lola','Gato','Siames','Pequeño',4,2,'Hembra',0,NULL,30,7),(9,'Rocky','Perro','Labrador','Grande',25,5,'Macho',1,'Cojea de una pata trasera',30,8),(10,'Coco','Conejo','Enano','Pequeño',2,1,'Hembra',0,NULL,30,9),(11,'Pico','Ave','Canario','Pequeño',0,1,'Macho',1,'Ala derecha herida',30,9),(12,'Max','Perro','Golden Retriever','Grande',30,6,'Macho',0,NULL,30,10);
/*!40000 ALTER TABLE `mascotastemporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacionmascotaavistada`
--

DROP TABLE IF EXISTS `publicacionmascotaavistada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacionmascotaavistada` (
  `publicacionMascotaAvistadaID` int unsigned NOT NULL AUTO_INCREMENT,
  `direccionAvistamiento` text NOT NULL,
  `distritoID` int unsigned NOT NULL,
  `descripcionMascotaAvistada` varchar(200) NOT NULL,
  `publicacionMascotaPerdidaID` int unsigned NOT NULL,
  `fechaFormulario` date NOT NULL,
  PRIMARY KEY (`publicacionMascotaAvistadaID`),
  KEY `fk_publicacionmascotaavistada_publicacionmascotaperdida1_idx` (`publicacionMascotaPerdidaID`),
  KEY `fk_publicacionmascotaavistada_distrito1_idx` (`distritoID`),
  CONSTRAINT `fk_publicacionmascotaavistada_distrito1` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_publicacionmascotaavistada_publicacionmascotaperdida1` FOREIGN KEY (`publicacionMascotaPerdidaID`) REFERENCES `publicacionmascotaperdida` (`publicacionMascotaPerdidaID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacionmascotaavistada`
--

LOCK TABLES `publicacionmascotaavistada` WRITE;
/*!40000 ALTER TABLE `publicacionmascotaavistada` DISABLE KEYS */;
INSERT INTO `publicacionmascotaavistada` VALUES (13,'Parque Central',1,'Perro negro con collar rojo',16,'2024-11-01'),(14,'Mercado Principal',2,'Gato blanco con manchas negras',17,'2024-11-02'),(15,'Avenida Primavera',3,'Perro marrón de tamaño mediano',18,'2024-11-03'),(16,'Calle Sol',4,'Ave pequeña con plumas verdes',19,'2024-11-04'),(17,'Plaza Norte',5,'Conejo blanco con orejas largas',20,'2024-11-05');
/*!40000 ALTER TABLE `publicacionmascotaavistada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacionmascotaperdida`
--

DROP TABLE IF EXISTS `publicacionmascotaperdida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacionmascotaperdida` (
  `publicacionMascotaPerdidaID` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `nombreMascota` varchar(45) NOT NULL,
  `distintivo` varchar(30) NOT NULL,
  `edadMascota` int unsigned NOT NULL,
  `tamanio` enum('Pequeño','Mediano','Grande') NOT NULL,
  `especie` varchar(45) NOT NULL,
  `raza` varchar(30) NOT NULL,
  `descripcionAdicional` text,
  `lugarPerdida` text NOT NULL,
  `fechaPerdida` date NOT NULL,
  `horaPerdida` time NOT NULL,
  `nombreContacto` varchar(50) NOT NULL,
  `telefonoContacto` char(9) NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `aniadirRecompensa` tinyint unsigned NOT NULL,
  `montoRecompensa` int DEFAULT NULL,
  `usuarioID` int unsigned NOT NULL,
  `aprobadoCoordinador` tinyint DEFAULT NULL,
  `mascotaEncontrada` tinyint NOT NULL,
  `fechaFormulario` date NOT NULL,
  PRIMARY KEY (`publicacionMascotaPerdidaID`),
  KEY `fk_PublicacionMascotaPerdida_Usuario1_idx` (`usuarioID`),
  KEY `fk_PublicacionMascotaPerdida_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_PublicacionMascotaPerdida_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_PublicacionMascotaPerdida_Usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacionmascotaperdida`
--

LOCK TABLES `publicacionmascotaperdida` WRITE;
/*!40000 ALTER TABLE `publicacionmascotaperdida` DISABLE KEYS */;
INSERT INTO `publicacionmascotaperdida` VALUES (16,'Perro extraviado en el parque central','Firulais','Collar rojo',3,'Mediano','Perro','Labrador','Se escapó corriendo','Parque Central','2024-10-30','14:00:00','Carlos Perez','987654321',30,1,100,7,0,0,'2024-11-01'),(17,'Gato perdido cerca del mercado principal','Michi','Mancha negra en la pata',2,'Pequeño','Gato','Siames','Es tímido con los extraños','Mercado Principal','2024-10-29','16:30:00','Maria Gomez','912345678',30,0,NULL,8,0,0,'2024-11-02'),(18,'Perrito marrón visto en el parque sur','Max','Orejas caídas',4,'Grande','Perro','Golden Retriever','Amigable y juguetón','Parque Sur','2024-10-28','18:00:00','Luis Torres','923456789',30,1,150,9,1,0,'2024-11-03'),(19,'Ave perdida en el centro comunitario','Pico','Plumas verdes brillantes',1,'Pequeño','Ave','Perico','Se escapó de su jaula','Centro Comunitario','2024-10-27','10:00:00','Ana Lopez','934567890',30,0,NULL,10,0,0,'2024-11-04'),(20,'Conejo blanco extraviado cerca de la avenida luna','Snow','Orejas largas',3,'Pequeño','Mamífero','Enano','Saltaba hacia la avenida','Avenida Luna','2024-10-26','11:30:00','Diego Fernandez','945678901',30,1,110,11,0,0,'2024-11-05');
/*!40000 ALTER TABLE `publicacionmascotaperdida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudtemporal`
--

DROP TABLE IF EXISTS `solicitudtemporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudtemporal` (
  `solicitudID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `edad` int unsigned NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `celular` char(9) NOT NULL,
  `cantidadCuartos` int unsigned NOT NULL,
  `metrajeVivienda` int unsigned NOT NULL,
  `tieneHijos` tinyint NOT NULL,
  `viveSolo` tinyint NOT NULL,
  `trabajaRemoto` tinyint NOT NULL,
  `tieneMascotas` tinyint NOT NULL,
  `cantidadMascota` int unsigned DEFAULT NULL,
  `nombrePersonaReferencia` varchar(50) NOT NULL,
  `numeroContactoPR` char(9) NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `tiempoTemporal` int unsigned NOT NULL,
  `inicioTemporal` date NOT NULL,
  `finTemporal` date NOT NULL,
  `aprobadoCoordinador` tinyint DEFAULT NULL,
  `desactivadoAdministrador` tinyint NOT NULL,
  `comentarioCoordinador` text,
  `numeroRechazosConsecutivos` int NOT NULL,
  `fechaFormulario` date NOT NULL,
  PRIMARY KEY (`solicitudID`),
  UNIQUE KEY `Celular_UNIQUE` (`celular`),
  UNIQUE KEY `NúmeroContactoPR_UNIQUE` (`numeroContactoPR`),
  KEY `fk_SolicitudTemporal_Usuario1_idx` (`usuarioID`),
  KEY `fk_SolicitudTemporal_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_SolicitudTemporal_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`),
  CONSTRAINT `fk_SolicitudTemporal_Usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudtemporal`
--

LOCK TABLES `solicitudtemporal` WRITE;
/*!40000 ALTER TABLE `solicitudtemporal` DISABLE KEYS */;
INSERT INTO `solicitudtemporal` VALUES (16,7,30,'Masculino','987654321',3,80,1,0,1,1,1,'Maria Lopez','912345678',30,3,'2024-11-01','2024-12-01',1,0,NULL,0,'2024-10-25'),(17,8,28,'Femenino','912345678',2,60,0,1,0,0,NULL,'Carlos Perez','987654321',30,6,'2024-11-05','2024-12-05',NULL,0,NULL,1,'2024-10-26'),(18,9,45,'Masculino','965874123',4,120,0,0,1,1,2,'Ana Torres','987123654',30,4,'2024-11-10','2024-12-10',1,0,'Espacio adecuado para cuidado',0,'2024-10-27'),(19,10,32,'Femenino','985741236',2,75,1,1,1,0,NULL,'Luis Ramirez','921458732',30,5,'2024-11-15','2024-12-15',NULL,0,'Disponibilidad limitada',1,'2024-10-28'),(20,11,29,'Femenino','912365478',3,100,0,0,0,1,1,'Sofia Gomez','987456321',30,2,'2024-11-20','2024-12-20',1,0,NULL,0,'2024-10-29');
/*!40000 ALTER TABLE `solicitudtemporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuarioID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(70) NOT NULL,
  `dni` char(8) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correoElectronico` varchar(150) NOT NULL,
  `activo` tinyint NOT NULL,
  `distritoID` int unsigned NOT NULL,
  `fotoID` int unsigned NOT NULL,
  `eliminado` tinyint unsigned NOT NULL DEFAULT '1',
  `fechaRegistrado` date NOT NULL,
  PRIMARY KEY (`usuarioID`),
  UNIQUE KEY `DNI_UNIQUE` (`dni`),
  UNIQUE KEY `Correo_Electrónico_UNIQUE` (`correoElectronico`),
  KEY `fk_Usuario_Distrito_idx` (`distritoID`),
  KEY `fk_Usuario_Fotos1_idx` (`fotoID`),
  CONSTRAINT `fk_Usuario_Distrito` FOREIGN KEY (`distritoID`) REFERENCES `distrito` (`distritoID`),
  CONSTRAINT `fk_Usuario_Fotos1` FOREIGN KEY (`fotoID`) REFERENCES `fotos` (`fotoID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (7,'Carlos','Ramirez','12312312','Calle Luna 123','carlos@mail.com',1,1,30,0,'2024-11-01'),(8,'María','Gomez','32132132','Calle Sol 456','maria@mail.com',1,2,30,0,'2024-11-02'),(9,'Juan','Perez','45678901','Avenida Primavera 456','juanperez@mail.com',1,3,30,0,'2024-11-03'),(10,'Ana','Lopez','78912345','Calle Pinos 789','analopez@mail.com',1,4,30,0,'2024-11-04'),(11,'Luis','Torres','32165498','Jr. Los Álamos 321','luistorres@mail.com',1,5,30,0,'2024-11-05');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_credenciales`
--

DROP TABLE IF EXISTS `usuario_credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_credenciales` (
  `idusuario_credenciales` int NOT NULL AUTO_INCREMENT,
  `correoElectronico` varchar(150) NOT NULL,
  `contrasenia` varchar(150) NOT NULL,
  `usuarioID` int unsigned NOT NULL,
  `requiere_cambio_clave` tinyint DEFAULT '0',
  `token_recuperacion` varchar(255) DEFAULT NULL,
  `fecha_expiracion_token` timestamp(6) NULL DEFAULT NULL,
  PRIMARY KEY (`idusuario_credenciales`,`usuarioID`),
  UNIQUE KEY `correoElectronico_UNIQUE` (`correoElectronico`),
  KEY `fk_usuario_credenciales_usuario1_idx` (`usuarioID`),
  CONSTRAINT `fk_usuario_credenciales_usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_credenciales`
--

LOCK TABLES `usuario_credenciales` WRITE;
/*!40000 ALTER TABLE `usuario_credenciales` DISABLE KEYS */;
INSERT INTO `usuario_credenciales` VALUES (1,'carlos@mail.com','12654c024a4c0926329753cf79d4bb95d617c17684066809cf453b2084a4d5bc',7,1,NULL,NULL),(2,'maria@mail.com','12654c024a4c0926329753cf79d4bb95d617c17684066809cf453b2084a4d5bc',8,1,NULL,NULL),(3,'juanperez@mail.com','12654c024a4c0926329753cf79d4bb95d617c17684066809cf453b2084a4d5bc',9,1,NULL,NULL),(4,'analopez@mail.com','12654c024a4c0926329753cf79d4bb95d617c17684066809cf453b2084a4d5bc',10,1,NULL,NULL),(5,'luistorres@mail.com','12654c024a4c0926329753cf79d4bb95d617c17684066809cf453b2084a4d5bc',11,1,NULL,NULL);
/*!40000 ALTER TABLE `usuario_credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarioadopcion`
--

DROP TABLE IF EXISTS `usuarioadopcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarioadopcion` (
  `usuarioAdopcionID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `idAdopcion` int unsigned NOT NULL,
  `aprobado` tinyint unsigned DEFAULT NULL,
  `fechaAdoptado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuarioAdopcionID`),
  KEY `fk_usuarioadopcion_usuario1_idx` (`usuarioID`),
  KEY `fk_usuarioadopcion_mascotasadopcion1_idx` (`idAdopcion`),
  CONSTRAINT `fk_usuarioadopcion_mascotasadopcion1` FOREIGN KEY (`idAdopcion`) REFERENCES `mascotasadopcion` (`idAdopcion`),
  CONSTRAINT `fk_usuarioadopcion_usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarioadopcion`
--

LOCK TABLES `usuarioadopcion` WRITE;
/*!40000 ALTER TABLE `usuarioadopcion` DISABLE KEYS */;
INSERT INTO `usuarioadopcion` VALUES (6,7,6,1,'2024-11-01'),(7,8,7,0,NULL),(8,9,8,1,'2024-11-03'),(9,10,9,1,'2024-11-05'),(10,11,10,0,NULL);
/*!40000 ALTER TABLE `usuarioadopcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariodonacionmonetaria`
--

DROP TABLE IF EXISTS `usuariodonacionmonetaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariodonacionmonetaria` (
  `usuarioDonacionMonetariaID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `albergueID` int unsigned NOT NULL,
  `cantidadMonetaria` int NOT NULL,
  `eventoAlbergueID` int unsigned DEFAULT NULL,
  `donacionSuministrosID` int unsigned DEFAULT NULL,
  `fechaDonacionMonetaria` varchar(45) NOT NULL,
  PRIMARY KEY (`usuarioDonacionMonetariaID`),
  KEY `fk_usuariodonacionmonetaria_usuario1_idx` (`usuarioID`),
  KEY `fk_usuariodonacionmonetaria_albergue1_idx` (`albergueID`),
  KEY `fk_usuariodonacionmonetaria_eventobenefico1_idx` (`eventoAlbergueID`),
  KEY `fk_usuariodonacionmonetaria_donacionsuministros1_idx` (`donacionSuministrosID`),
  CONSTRAINT `fk_usuariodonacionmonetaria_albergue1` FOREIGN KEY (`albergueID`) REFERENCES `albergue` (`albergueID`),
  CONSTRAINT `fk_usuariodonacionmonetaria_donacionsuministros1` FOREIGN KEY (`donacionSuministrosID`) REFERENCES `donacionsuministros` (`donacionSuministrosID`),
  CONSTRAINT `fk_usuariodonacionmonetaria_eventobenefico1` FOREIGN KEY (`eventoAlbergueID`) REFERENCES `eventobenefico` (`eventoAlbergueID`),
  CONSTRAINT `fk_usuariodonacionmonetaria_usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariodonacionmonetaria`
--

LOCK TABLES `usuariodonacionmonetaria` WRITE;
/*!40000 ALTER TABLE `usuariodonacionmonetaria` DISABLE KEYS */;
INSERT INTO `usuariodonacionmonetaria` VALUES (15,7,6,100,NULL,NULL,'2024-11-01'),(16,8,7,200,16,NULL,'2024-11-02'),(17,9,8,150,19,NULL,'2024-11-03'),(18,10,9,300,NULL,6,'2024-11-04');
/*!40000 ALTER TABLE `usuariodonacionmonetaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariodonacionsuministros`
--

DROP TABLE IF EXISTS `usuariodonacionsuministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariodonacionsuministros` (
  `usuarioDonacionSuministrosID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `donacionSuministrosID` int unsigned NOT NULL,
  `cantidadSuministro` int unsigned NOT NULL,
  `fechaDonacion` date NOT NULL,
  PRIMARY KEY (`usuarioDonacionSuministrosID`),
  KEY `fk_usuariodonacionsuministros_usuario1_idx` (`usuarioID`),
  KEY `fk_usuariodonacionsuministros_donacionsuministros1_idx` (`donacionSuministrosID`),
  CONSTRAINT `fk_usuariodonacionsuministros_donacionsuministros1` FOREIGN KEY (`donacionSuministrosID`) REFERENCES `donacionsuministros` (`donacionSuministrosID`),
  CONSTRAINT `fk_usuariodonacionsuministros_usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariodonacionsuministros`
--

LOCK TABLES `usuariodonacionsuministros` WRITE;
/*!40000 ALTER TABLE `usuariodonacionsuministros` DISABLE KEYS */;
INSERT INTO `usuariodonacionsuministros` VALUES (6,7,6,10,'2024-11-01'),(7,8,7,5,'2024-11-02'),(8,9,8,8,'2024-11-03'),(9,10,9,15,'2024-11-04'),(10,11,10,12,'2024-11-05');
/*!40000 ALTER TABLE `usuariodonacionsuministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuariomascotatemporal`
--

DROP TABLE IF EXISTS `usuariomascotatemporal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuariomascotatemporal` (
  `usuarioMascotaTemporalID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuarioID` int unsigned NOT NULL,
  `mascotaTemporalID` int unsigned NOT NULL,
  `terminoTiempoTemporal` tinyint unsigned NOT NULL,
  `fechaAceptoTemporal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuarioMascotaTemporalID`),
  KEY `fk_usuariomascota temporal_usuario1_idx` (`usuarioID`),
  KEY `fk_usuariomascota temporal_mascotastemporal1_idx` (`mascotaTemporalID`),
  CONSTRAINT `fk_usuariomascota temporal_mascotastemporal1` FOREIGN KEY (`mascotaTemporalID`) REFERENCES `mascotastemporal` (`mascotaTemporalID`),
  CONSTRAINT `fk_usuariomascota temporal_usuario1` FOREIGN KEY (`usuarioID`) REFERENCES `usuario` (`usuarioID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuariomascotatemporal`
--

LOCK TABLES `usuariomascotatemporal` WRITE;
/*!40000 ALTER TABLE `usuariomascotatemporal` DISABLE KEYS */;
INSERT INTO `usuariomascotatemporal` VALUES (6,7,7,1,'2024-11-01'),(7,8,8,0,'2024-11-02'),(8,9,9,0,'2024-11-03'),(9,10,10,1,'2024-11-04'),(10,11,11,0,'2024-11-05');
/*!40000 ALTER TABLE `usuariomascotatemporal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `zonaID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombreZona` enum('Norte','Sur','Este','Oeste') NOT NULL,
  PRIMARY KEY (`zonaID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'Norte'),(2,'Sur'),(3,'Este'),(4,'Oeste');
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 11:41:10
