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
-- Table structure for table `tbestados`
--

DROP TABLE IF EXISTS `tbestados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbestados` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `ventas` decimal(18,2) NOT NULL DEFAULT '0.00',
  `inv_inicial` decimal(18,2) NOT NULL DEFAULT '0.00',
  `compras` decimal(18,2) NOT NULL DEFAULT '0.00',
  `gst_compras` decimal(18,2) NOT NULL DEFAULT '0.00',
  `dev_compras` decimal(18,2) NOT NULL DEFAULT '0.00',
  `inv_final` decimal(18,2) NOT NULL DEFAULT '0.00',
  `g_ventas` decimal(18,2) NOT NULL DEFAULT '0.00',
  `g_adm` decimal(18,2) NOT NULL DEFAULT '0.00',
  `g_financ` decimal(18,2) NOT NULL DEFAULT '0.00',
  `isr` decimal(18,2) NOT NULL DEFAULT '0.00',
  `reserva` decimal(18,2) NOT NULL DEFAULT '0.00',
  `utilidad` decimal(18,2) NOT NULL DEFAULT '0.00',
  `inicio` timestamp NULL DEFAULT NULL,
  `cierre` timestamp NULL DEFAULT NULL,
  `comentario` varchar(200) NOT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estado`),
  KEY `fk_sucursal_estados` (`id_sucursal`),
  KEY `fk_usuario_estado` (`id_usuario`),
  CONSTRAINT `fk_sucursal_estados` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_estado` FOREIGN KEY (`id_usuario`) REFERENCES `tbusuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbestados`
--

LOCK TABLES `tbestados` WRITE;
/*!40000 ALTER TABLE `tbestados` DISABLE KEYS */;
INSERT INTO `tbestados` VALUES (10,310.00,300.00,500.00,10.00,300.00,350.00,10.00,10.00,0.00,32.50,0.00,97.50,'2020-05-01 06:00:00','2020-05-31 06:00:00','editadaaaaa',2,2),(11,900.00,300.00,500.00,10.00,200.00,350.00,10.00,1.00,10.00,143.92,43.33,431.75,'2020-05-01 06:00:00','2020-05-31 06:00:00','xdxd',1,1),(17,900.00,300.00,500.00,1.00,1.00,350.00,1.00,1.00,1.00,103.93,31.29,311.78,'2020-05-01 06:00:00','2020-06-01 05:59:59','xdxdxd',1,1);
/*!40000 ALTER TABLE `tbestados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:30
