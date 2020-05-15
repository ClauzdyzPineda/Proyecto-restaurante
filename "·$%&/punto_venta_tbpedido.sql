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
-- Table structure for table `tbpedido`
--

DROP TABLE IF EXISTS `tbpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbpedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cant_producto` int(11) NOT NULL,
  `valor_estimado` decimal(18,2) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentarios` varchar(100) DEFAULT 'None',
  `estado` varchar(50) DEFAULT 'En Curso',
  `id_usuario` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_sucursal_pedido_idx` (`id_sucursal`),
  KEY `fk_producto_pedido` (`id_producto`),
  KEY `fk_proveedor_pedido` (`id_proveedor`),
  KEY `fk_usuario_pedido` (`id_usuario`),
  CONSTRAINT `fk_producto_pedido` FOREIGN KEY (`id_producto`) REFERENCES `tbproducto` (`id_producto`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_proveedor_pedido` FOREIGN KEY (`id_proveedor`) REFERENCES `tbproveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sucursal_pedido` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_pedido` FOREIGN KEY (`id_usuario`) REFERENCES `tbusuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpedido`
--

LOCK TABLES `tbpedido` WRITE;
/*!40000 ALTER TABLE `tbpedido` DISABLE KEYS */;
INSERT INTO `tbpedido` VALUES (1,1,1,11,0.00,'2020-03-19 18:40:07','sad','Recibido',1,1),(2,3,5,100,0.00,'2020-03-20 18:43:09','saasd','Recibido',2,2),(3,4,4,200,0.00,'2020-03-20 20:13:14','xxxx','En Curso',2,2),(4,4,4,100,100.00,'2020-03-30 01:49:06','asd','Recibido',1,1),(5,1,4,200,200.00,'2020-03-30 03:55:02','asd','Recibido',1,1),(9,1,9,100,0.00,'2020-05-13 16:58:35','producto de prueba','En curso',2,2),(11,1,12,10,10.00,'2020-05-13 17:27:51','ejemplooo','En curso',2,2),(12,1,8,10,40.00,'2020-05-13 17:42:08','ewdeee','En curso',2,2);
/*!40000 ALTER TABLE `tbpedido` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger status_producto after insert on tbpedido
for each row
BEGIN
		UPDATE tbproducto set estado = 'Pdt.Ingreso' where id_producto = new.id_producto;
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

-- Dump completed on 2020-05-14 21:51:20
