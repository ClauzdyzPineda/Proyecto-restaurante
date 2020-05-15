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
-- Table structure for table `tbsucursal`
--

DROP TABLE IF EXISTS `tbsucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbsucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipoSucursal` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `dir` varchar(300) DEFAULT NULL,
  `tel` varchar(15) NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `capital_inicial` decimal(18,2) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `fk_tipoSucursal_sucursal` (`id_tipoSucursal`),
  CONSTRAINT `fk_tipoSucursal_sucursal` FOREIGN KEY (`id_tipoSucursal`) REFERENCES `tbtiposucursal` (`id_tipoSucursal`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbsucursal`
--

LOCK TABLES `tbsucursal` WRITE;
/*!40000 ALTER TABLE `tbsucursal` DISABLE KEYS */;
INSERT INTO `tbsucursal` VALUES (1,1,'Suc 1','xx','1111-1111','2020-03-12',2000.00),(2,1,'Suc 2','edita','1111-1111','2020-01-27',2000.00),(3,2,'Suc 3','asd','5415-6465','2020-01-27',2000.00);
/*!40000 ALTER TABLE `tbsucursal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:22
