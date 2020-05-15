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
-- Table structure for table `tbmovimiento`
--

DROP TABLE IF EXISTS `tbmovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbmovimiento` (
  `id_movimiento` int(11) NOT NULL AUTO_INCREMENT,
  `monto` decimal(18,2) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_externo` int(11) NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `fk_sucursal_movs` (`id_sucursal`),
  CONSTRAINT `fk_sucursal_movs` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbmovimiento`
--

LOCK TABLES `tbmovimiento` WRITE;
/*!40000 ALTER TABLE `tbmovimiento` DISABLE KEYS */;
INSERT INTO `tbmovimiento` VALUES (46,500.00,500,1,'2020-04-08 23:38:31',1,1),(66,100.00,1,0,'2020-05-10 16:51:57',1,21),(67,100.00,1,0,'2020-05-10 16:51:57',1,22),(68,100.00,1,0,'2020-05-10 16:51:57',1,23),(69,1.00,1,0,'2020-05-13 00:08:54',2,24),(70,10.60,1,0,'2020-05-12 19:47:05',1,25),(71,9.10,1,0,'2020-05-13 00:08:38',1,2),(73,100.00,1,0,'2020-05-14 20:55:52',3,28),(74,2.00,1,0,'2020-05-14 20:55:51',3,29),(75,2.50,1,0,'2020-05-14 20:55:52',3,30),(76,6.60,1,0,'2020-05-14 23:01:20',3,31),(77,4.50,1,0,'2020-05-15 00:38:11',3,32),(78,2.50,1,0,'2020-05-15 00:26:19',3,33),(79,0.60,1,0,'2020-05-15 00:28:29',3,34),(80,2.00,1,0,'2020-05-15 00:37:00',3,35),(81,1.25,1,0,'2020-05-15 00:37:35',3,36),(83,2.00,1,0,'2020-05-15 00:47:32',3,38),(84,1.25,1,0,'2020-05-15 00:52:16',3,39),(85,2.00,1,0,'2020-05-15 01:01:09',3,40);
/*!40000 ALTER TABLE `tbmovimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:32
