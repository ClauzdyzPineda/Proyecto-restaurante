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
-- Table structure for table `tbplatillo`
--

DROP TABLE IF EXISTS `tbplatillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbplatillo` (
  `id_platillo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_platillo` varchar(60) DEFAULT NULL,
  `precio_platillo` decimal(18,2) DEFAULT NULL,
  `costo_platillo` decimal(18,2) DEFAULT NULL,
  `id_subCategoria` int(11) NOT NULL,
  PRIMARY KEY (`id_platillo`),
  KEY `fk_subCat_platillo` (`id_subCategoria`),
  CONSTRAINT `fk_subCat_platillo` FOREIGN KEY (`id_subCategoria`) REFERENCES `tbscaplatillo` (`id_subCategoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbplatillo`
--

LOCK TABLES `tbplatillo` WRITE;
/*!40000 ALTER TABLE `tbplatillo` DISABLE KEYS */;
INSERT INTO `tbplatillo` VALUES (1,'Ninguno',0.00,0.00,1),(2,'Pollo a la plancha',2.00,2.00,1),(3,'Pollo asado',2.00,0.00,1),(4,'Lasagña',2.50,2.00,1),(5,'Pollo encebollado',1.25,1.00,1);
/*!40000 ALTER TABLE `tbplatillo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:40
