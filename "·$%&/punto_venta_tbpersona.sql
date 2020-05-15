CREATE DATABASE  IF NOT EXISTS `punto_venta` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `punto_venta`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: punto_venta
-- ------------------------------------------------------
-- Server version	5.5.53-log

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
-- Table structure for table `tbpersona`
--

DROP TABLE IF EXISTS `tbpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbpersona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `dui` varchar(10) DEFAULT NULL,
  `nit` varchar(17) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `dir` varchar(300) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `genero` enum('M','F','N/A') NOT NULL,
  `salario_asignado` decimal(18,2) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `fk_cargo_persona` (`id_cargo`),
  KEY `fk_sucursal_persona` (`id_sucursal`),
  CONSTRAINT `fk_cargo_persona` FOREIGN KEY (`id_cargo`) REFERENCES `tbcargo` (`id_cargo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sucursal_persona` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpersona`
--

LOCK TABLES `tbpersona` WRITE;
/*!40000 ALTER TABLE `tbpersona` DISABLE KEYS */;
INSERT INTO `tbpersona` VALUES (1,'Fernando xd','Barraza','06033872-2','1111-11111-145-5',20,'7457-3133','URB NUEVO LOURDES SDA 9 BIS BLOCK 77 CASA #34','fernando.jba.2000@gmail.com','M',500.00,1,1),(2,'Fernando asd','Barraza','06033872-2','0260-262662-626-2',19,'2626-2626','URB NUEVO LOURDES SDA 9 BIS BLOCK 77 CASA #34','fernando.jba.2000@gmail.com','M',500.00,1,2),(3,'Emely ','Solorzano','06033558-8','1121-111111-555-5',18,'7135-8789','asdsdsdsdds','emely@gmail.com','F',350.00,2,3);
/*!40000 ALTER TABLE `tbpersona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:33
