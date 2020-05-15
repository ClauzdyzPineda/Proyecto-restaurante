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
-- Table structure for table `tbventa`
--

DROP TABLE IF EXISTS `tbventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbventa` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(80) NOT NULL,
  `dui_carnet` varchar(20) DEFAULT 'No Otorgado',
  `tel` varchar(15) DEFAULT 'No Otorgado',
  `tipo_pago` enum('TC','TD','E','CH') NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `venta_total` decimal(18,2) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_sucursal_venta` (`id_sucursal`),
  KEY `fk_usuario_venta` (`id_usuario`),
  CONSTRAINT `fk_sucursal_venta` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_venta` FOREIGN KEY (`id_usuario`) REFERENCES `tbusuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbventa`
--

LOCK TABLES `tbventa` WRITE;
/*!40000 ALTER TABLE `tbventa` DISABLE KEYS */;
INSERT INTO `tbventa` VALUES (2,'EDUARDOOO','No Otorgada','','TD','2020-04-08 23:04:53',1.00,2,2),(21,'gerxd','','','E','2020-05-08 23:04:53',100.00,1,1),(22,'gg','No Otorgada','','E','2020-05-08 23:04:53',100.00,1,1),(23,'1','No Otorgada','No Otorgado','E','2020-05-08 23:04:53',100.00,1,1),(24,'EDUARDOOO','No Otorgada','No Otorgado','E','2020-05-08 23:04:53',1.00,2,2),(25,'Fernando Barraza','No Otorgada','','E','2020-04-08 23:04:53',10.60,2,2),(28,'fer','No Otorgado','No Otorgado','E','2020-04-28 02:35:02',100.00,3,3),(29,'fer','1111111','+(503)7457-3133','E','2020-05-14 18:55:32',2.00,3,3),(30,'XDXD','No Otorgado','No Otorgado','E','2020-05-14 19:59:06',2.50,3,3),(31,'ventaaa','No Otorgado','No Otorgado','E','2020-05-14 23:01:20',6.60,3,3),(32,'PRUEBAAA','No Otorgado','No Otorgado','TC','2020-05-14 23:52:00',4.50,3,3),(33,'fef','No Otorgado','No Otorgado','E','2020-05-15 00:26:19',2.50,3,3),(34,'asdas','No Otorgado','No Otorgado','E','2020-05-15 00:28:29',0.60,3,3),(35,'ararar','No Otorgado','No Otorgado','E','2020-05-15 00:37:00',2.00,3,3),(36,'pruebaaa','No Otorgado','No Otorgado','E','2020-05-15 00:37:35',1.25,3,3),(38,'dsdssdsdsdsds','No Otorgado','No Otorgado','E','2020-05-15 00:47:32',2.00,3,3),(39,'emely','No Otorgado','No Otorgado','E','2020-05-15 00:52:16',1.25,3,3),(40,'FEF','No Otorgado','No Otorgado','TC','2020-05-15 01:01:09',2.00,3,3);
/*!40000 ALTER TABLE `tbventa` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger InsMovsType0 after insert on tbventa
for each row
	insert into tbmovimiento (monto,cantidad,tipo,fecha,id_sucursal, id_externo)
    values (new.venta_total, 1, 0, new.fecha_hora, new.id_sucursal, new.id_venta) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updaVentMovs after update on tbventa
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = new.id_venta and tipo = 0);
	update tbmovimiento set monto = new.venta_total, id_sucursal = new.id_sucursal  where id_movimiento = @id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delVentMov after delete on tbVenta
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = old.id_venta and tipo = 0);
    delete from tbmovimiento where id_movimiento = @id;
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

-- Dump completed on 2020-05-14 21:51:43
