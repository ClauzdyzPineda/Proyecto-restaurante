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
-- Table structure for table `tbproducto`
--

DROP TABLE IF EXISTS `tbproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbproducto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT 'None',
  `unidad_medida` varchar(5) NOT NULL DEFAULT 'None',
  `stock_min` int(11) NOT NULL DEFAULT '50',
  `existencias` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL DEFAULT '999',
  `costo_unitario` decimal(18,2) NOT NULL,
  `estado` enum('Stock','Pdt.Ingreso','SinStock') DEFAULT 'Stock',
  `tipo` enum('A','B','C','D','E','F') NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbproducto`
--

LOCK TABLES `tbproducto` WRITE;
/*!40000 ALTER TABLE `tbproducto` DISABLE KEYS */;
INSERT INTO `tbproducto` VALUES (1,'NONE','Ingresado para que funcione la consulta','null',0,0,1,0.00,'Stock','A'),(2,'NONE','Ingresado para que funcione la consulta','null',0,1,1,0.00,'Stock','B'),(3,'NONE','Ingresado para que funcione la consulta','null',0,1,1,0.00,'Stock','C'),(4,'NONE','Ingresado para que funcione la consulta','null',0,-12,1,0.00,'Stock','D'),(5,'NONE','Ingresado para que funcione la consulta','null',0,-21,1,0.00,'Stock','E'),(6,'NONE','Ingresado para que funcione la consulta','null',0,1,1,0.00,'Stock','F'),(8,'Tres leches','Pastel, como poster','cm',99,-20,200,4.00,'Pdt.Ingreso','C'),(9,'Arroz','arroz','lb',50,-22,200,1.00,'Pdt.Ingreso','A'),(11,'Lapices','aaa','nan',10,10,100,0.25,'Pdt.Ingreso','D'),(12,'Lapicerosxd','asda','nan',1,10,100,1.00,'Pdt.Ingreso','D');
/*!40000 ALTER TABLE `tbproducto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insBebCom after insert on tbproducto
for each row
BEGIN
	IF (new.tipo = 'B') THEN
		insert into tbbebida (nombre_bebida, id_tipoBebida, precio_bebida, id_referencia)
        values (new.nombre_producto, 1, new.costo_unitario, new.id_producto);
		END if;	
        
	IF (new.tipo = 'C') then
		insert into tbcomplemento (nombre_complemento, id_tipoCom, precio_complemento, id_referencia)
        values (new.nombre_producto, 1, new.costo_unitario, new.id_producto);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER updBebCom after update on tbproducto
for each row
BEGIN
	IF (new.tipo = 'B') THEN
		set @idref := (select id_bebida from tbbebida where id_referencia = new.id_producto);
		update tbbebida set nombre_bebida = new.nombre_producto, precio_bebida = new.costo_unitario 
        where id_bebida = @idref;   
		END if;	
        
	IF (new.tipo = 'C') then
		set @idref := (select id_complemento from tbcomplemento where id_referencia = new.id_producto);
		update tbcomplemento set nombre_complemento = new.nombre_producto, precio_complemento = new.costo_unitario 
        where id_complemento = @idref;
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

-- Dump completed on 2020-05-14 21:51:41
