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
-- Table structure for table `tbdetalleproducto`
--

DROP TABLE IF EXISTS `tbdetalleproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbdetalleproducto` (
  `id_detalleProd` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `unidades_recibidas` int(11) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentarios` varchar(100) DEFAULT 'None',
  `valor_en_inv` decimal(18,2) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalleProd`),
  KEY `fk_producto_detalle_prod` (`id_producto`),
  KEY `fk_proveedor_detalle_prod` (`id_proveedor`),
  KEY `fk_sucursal_detalle_prod` (`id_sucursal`),
  KEY `fk_usuario_detalle_prod` (`id_usuario`),
  CONSTRAINT `fk_producto_detalle_prod` FOREIGN KEY (`id_producto`) REFERENCES `tbproducto` (`id_producto`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_proveedor_detalle_prod` FOREIGN KEY (`id_proveedor`) REFERENCES `tbproveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sucursal_detalle_prod` FOREIGN KEY (`id_sucursal`) REFERENCES `tbsucursal` (`id_sucursal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_detalle_prod` FOREIGN KEY (`id_usuario`) REFERENCES `tbusuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdetalleproducto`
--

LOCK TABLES `tbdetalleproducto` WRITE;
/*!40000 ALTER TABLE `tbdetalleproducto` DISABLE KEYS */;
INSERT INTO `tbdetalleproducto` VALUES (1,1,4,500,'2020-05-08 23:04:53','xd',500.00,1,1),(5,1,8,12,'2020-05-13 22:01:13','swas',48.00,2,2),(7,1,11,41,'2020-05-14 00:32:11','fd',10.25,2,2);
/*!40000 ALTER TABLE `tbdetalleproducto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger multi_typ1_state after insert on tbdetalleproducto
FOR EACH ROW
BEGIN

	IF (new.id_proveedor > 1) THEN
		insert into tbmovimiento (monto,cantidad,tipo,fecha,id_sucursal, id_externo)
		values (new.unidades_recibidas, new.valor_en_inv,1, new.fecha_hora, new.id_sucursal, new.id_detalleProd);
		
		set @lastID :=  (select max(id_pedido) as id  from tbpedido where id_producto = new.id_producto
		order by max(id_pedido) desc  limit 1);
		
		UPDATE tbpedido set estado = 'Recibido' where id_producto = new.id_producto 
		and id_pedido = @lastID;
			
		UPDATE tbproducto set existencias = (existencias + new.unidades_recibidas), estado = 'Stock'  where id_producto = new.id_producto;
    END IF;
	
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger updaDetPro after update on tbdetalleproducto
for each row
BEGIN 
	set @id := (select id_movimiento from tbmovimiento where id_externo = new.id_detalleProd and tipo = 1);
    update tbmovimiento set monto = new.valor_en_inv, cantidad = new.unidades_recibidas where id_movimiento = @id;    
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger delDetPro after delete on tbdetalleproducto
for each row
BEGIN
	set @id := (select id_movimiento from tbmovimiento where id_externo = old.id_detalleProd and tipo = 1);
	delete from tbmovimiento where id_movimiento = @id;
    
    update tbproducto set existencias = (existencias - old.unidades_recibidas) where id_producto = old.id_producto;
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

-- Dump completed on 2020-05-14 21:51:17
