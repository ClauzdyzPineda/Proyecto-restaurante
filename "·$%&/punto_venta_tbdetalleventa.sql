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
-- Table structure for table `tbdetalleventa`
--

DROP TABLE IF EXISTS `tbdetalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdetalleventa` (
  `id_detalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `id_platillo` int(11) DEFAULT NULL,
  `id_bebida` int(11) DEFAULT NULL,
  `id_complemento` int(11) DEFAULT NULL,
  `precio_orden` decimal(18,2) DEFAULT '0.00',
  `id_venta` int(11) NOT NULL,
  PRIMARY KEY (`id_detalleVenta`),
  KEY `fk_bebida_dv` (`id_bebida`),
  KEY `fk_complemento_dv` (`id_complemento`),
  KEY `fk_platillo_dv` (`id_platillo`),
  KEY `fk_venta_dv` (`id_venta`),
  CONSTRAINT `fk_venta_dv` FOREIGN KEY (`id_venta`) REFERENCES `tbventa` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bebida_dv` FOREIGN KEY (`id_bebida`) REFERENCES `tbbebida` (`id_bebida`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_complemento_dv` FOREIGN KEY (`id_complemento`) REFERENCES `tbcomplemento` (`id_complemento`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_platillo_dv` FOREIGN KEY (`id_platillo`) REFERENCES `tbplatillo` (`id_platillo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdetalleventa`
--

LOCK TABLES `tbdetalleventa` WRITE;
/*!40000 ALTER TABLE `tbdetalleventa` DISABLE KEYS */;
INSERT INTO `tbdetalleventa` VALUES (66,2,4,11,6.60,21),(67,3,4,11,6.60,21),(68,4,4,11,10.00,22),(69,5,1,1,10.00,22),(70,2,4,11,6.60,28),(71,2,4,11,6.60,28),(72,2,4,11,6.60,25),(74,3,1,1,2.00,29),(75,2,4,11,6.60,2),(76,4,1,1,2.50,2),(77,2,1,1,2.00,25),(78,2,1,1,2.00,25),(79,4,1,1,2.50,30),(80,2,4,11,6.60,31),(81,4,1,1,2.50,32),(82,4,1,1,2.50,33),(83,1,4,1,0.60,34),(84,2,1,1,2.00,35),(85,5,1,1,1.25,36),(86,3,1,1,2.00,32),(88,2,1,1,2.00,38),(89,5,1,1,1.25,39),(90,3,1,1,2.00,40);
/*!40000 ALTER TABLE `tbdetalleventa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updtInventory AFTER INSERT ON tbdetalleventa
FOR EACH ROW
BEGIN	
    
    IF new.id_complemento > 1 THEN
		set @id := (select id_referencia from tbcomplemento where id_complemento = new.id_complemento);
		update tbproducto  set existencias = (existencias - 1) where id_producto = @id;
        END IF;
	
    IF NEW.id_bebida > 1 THEN
		set @id := (select id_referencia from tbbebida where id_bebida = new.id_bebida);
		update tbproducto  set existencias = (existencias - 1) where id_producto = @id;
        END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 21:51:27
