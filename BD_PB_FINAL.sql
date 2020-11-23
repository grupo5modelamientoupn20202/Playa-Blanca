CREATE DATABASE  IF NOT EXISTS `grupo5_moanso` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grupo5_moanso`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: grupo5_moanso
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobante` (
  `cod_comp` varchar(25) NOT NULL,
  `cod_pedido` int DEFAULT NULL,
  `dni_asesor` int DEFAULT NULL,
  `cliente` varchar(45) DEFAULT NULL,
  `distrito` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `tot_paga` decimal(10,2) DEFAULT NULL,
  `pago` decimal(10,2) DEFAULT NULL,
  `cambio` decimal(10,2) DEFAULT NULL,
  `fyh` datetime DEFAULT NULL,
  PRIMARY KEY (`cod_comp`),
  KEY `cod_pedido_idx` (`cod_pedido`),
  KEY `dni_asesor_idx` (`dni_asesor`),
  CONSTRAINT `cod_pedido` FOREIGN KEY (`cod_pedido`) REFERENCES `pedido` (`cod_ped`),
  CONSTRAINT `dni_asesor` FOREIGN KEY (`dni_asesor`) REFERENCES `empleado` (`DNI_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES ('Y520-00000005',5,12345677,'Stefano','Callao','Av. 123',66.80,70.00,3.20,'2020-11-06 20:12:45'),('Y520-00000006',6,74851093,'Gonzalo Samuel Martinez Figuera','Surco','Av. Los Pines 1092',142.00,200.00,58.00,'2020-11-23 07:08:02');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dt_pedido`
--

DROP TABLE IF EXISTS `dt_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_pedido` (
  `cod_ped` int NOT NULL,
  `Cod_pro` int NOT NULL,
  `cantidad` int NOT NULL,
  KEY `cod_ped_idx` (`cod_ped`),
  KEY `Cod_pro_idx` (`Cod_pro`),
  CONSTRAINT `cod_ped` FOREIGN KEY (`cod_ped`) REFERENCES `pedido` (`cod_ped`),
  CONSTRAINT `Cod_pro` FOREIGN KEY (`Cod_pro`) REFERENCES `producto` (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dt_pedido`
--

LOCK TABLES `dt_pedido` WRITE;
/*!40000 ALTER TABLE `dt_pedido` DISABLE KEYS */;
INSERT INTO `dt_pedido` VALUES (1,2,3),(1,9,1),(1,4,2),(1,1,1),(2,11,4),(3,7,2),(3,9,2),(3,10,1),(4,11,4),(4,9,2),(5,11,4),(5,9,2),(5,7,1),(6,1,3),(6,5,3),(6,7,2);
/*!40000 ALTER TABLE `dt_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `DNI_Empleado` int NOT NULL,
  `TipoEmp` int NOT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `contraseña` varchar(20) NOT NULL,
  `Habilitado` char(1) NOT NULL,
  PRIMARY KEY (`DNI_Empleado`),
  KEY `TipoEmp_idx` (`TipoEmp`),
  CONSTRAINT `TipoEmp` FOREIGN KEY (`TipoEmp`) REFERENCES `tipo_empleado` (`Tipo_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (19283746,3,'Sandro Alex','Miranda Sanchez','Av. Domino 1090','912000345','sandrito12345@hotmail.com','1234567','1'),(20004000,4,'Jose Carlos','Tirado Machaca','Jr. Los Punos 1023','987654321','jc1000@hotmail.com','1234567890','1'),(74851093,2,'Franz Albert','Acuña Trujillo','Av. La Alborada 1093','934061031','franz_hbk@hotmail.com','12345','1'),(90807060,1,'Stefano Ralf','Tamayo Espinoza','Av. Morales Duarez 1092','987500123','stefano2000@hotmail.com','123','1');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `cod_ped` int NOT NULL,
  `DNI_Empleado` int NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `fecha` datetime NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_ped`),
  KEY `DNI_Empleado_idx` (`DNI_Empleado`),
  CONSTRAINT `DNI_Empleado` FOREIGN KEY (`DNI_Empleado`) REFERENCES `empleado` (`DNI_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,12345677,81.50,'2020-11-03 13:15:51','Realizado'),(2,12345677,28.80,'2020-11-03 21:51:36','Realizado'),(3,12345677,68.00,'2020-11-06 19:37:23','Realizado'),(4,12345677,46.80,'2020-11-06 20:09:45','Realizado'),(5,12345677,66.80,'2020-11-06 20:12:18','Realizado'),(6,74851093,142.00,'2020-11-23 07:07:07','Entregado');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Cod_Pro` int NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Precio` decimal(6,2) NOT NULL,
  `descuento` decimal(6,2) NOT NULL,
  `Habilitado` char(1) NOT NULL,
  PRIMARY KEY (`Cod_Pro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Ceviches','Ceviche',20.00,16.00,'1'),(2,'Bebidas','Gaseosa 3L',15.00,13.50,'1'),(3,'Postres','Suspiro a la limeña',20.00,18.00,'1'),(4,'Entradas','Sopa casera',10.00,8.00,'1'),(5,'Entradas','Sopa de pollo',20.00,18.00,'1'),(6,'Postres','Arroz con leche',2.00,2.00,'1'),(7,'Ceviches','Mixto',20.00,20.00,'1'),(8,'Ceviches','Ceviche de conchas negras',50.00,45.00,'1'),(9,'Postres','Helado',10.00,9.00,'1'),(10,'Bebidas','Guarana 2.5L',10.00,10.00,'1'),(11,'Bebidas','Wild Fresh Apple 650ml',8.00,7.20,'1');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_empleado` (
  `Tipo_Emp` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Tipo_Emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'Administrador'),(2,'Asesor de ventas'),(3,'Chef'),(4,'Repartidor');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-23  7:24:32
