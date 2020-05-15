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
-- Table structure for table `tbbebida`
--

DROP TABLE IF EXISTS `tbbebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbbebida` (
  `id_bebida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_bebida` varchar(50) NOT NULL,
  `id_tipoBebida` int(11) DEFAULT '1',
  `precio_bebida` decimal(18,2) DEFAULT '0.00',
  `id_referencia` int(11) NOT NULL,
  PRIMARY KEY (`id_bebida`),
  KEY `fk_tipoBebida_bebida` (`id_tipoBebida`),
  CONSTRAINT `fk_tipoBebida_bebida` FOREIGN KEY (`id_tipoBebida`) REFERENCES `tbtipobebida` (`id_tipoBebida`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbbebida`
--

LOCK TABLES `tbbebida` WRITE;
/*!40000 ALTER TABLE `tbbebida` DISABLE KEYS */;
INSERT INTO `tbbebida` VALUES (1,'Ninguno',1,0.00,0),(4,'Coca-Cola',1,0.60,7);
/*!40000 ALTER TABLE `tbbebida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:14
