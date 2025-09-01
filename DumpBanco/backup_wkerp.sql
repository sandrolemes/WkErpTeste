-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: wkerp
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codcli` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codcli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Silva','São Paulo','SP'),(2,'Carlos Ferreira','Rio de Janeiro','RJ'),(3,'Mariana Oliveira','Belo Horizonte','MG'),(4,'Rafael Costa','Curitiba','PR'),(5,'Bianca Santos','Porto Alegre','RS'),(6,'João Pereira','Salvador','BA'),(7,'Gabriela Mendes','Florianópolis','SC'),(8,'Fernando Lima','Manaus','AM'),(9,'Isabela Souza','Recife','PE'),(10,'Gustavo Martins','Goiânia','GO'),(11,'Pedro Alves','Fortaleza','CE'),(12,'Juliana Gomes','Natal','RN'),(13,'Felipe Ribeiro','Vitória','ES'),(14,'Camila Nunes','Brasília','DF'),(15,'Thiago Rocha','Belém','PA'),(16,'Larissa Barros','Campo Grande','MS'),(17,'Diego Fernandes','Aracaju','SE'),(18,'Vanessa Almeida','João Pessoa','PB'),(19,'Lucas Teixeira','Maceió','AL'),(20,'Patrícia Carvalho','Cuiabá','MT'),(21,'Ana Pereira','Goiânia','GO'),(22,'Carlos Silva','São Paulo','SP'),(23,'Fernanda Souza','Rio de Janeiro','RJ'),(24,'Ricardo Oliveira','Belo Horizonte','MG'),(25,'Juliana Santos','Curitiba','PR'),(26,'Marcelo Lima','Porto Alegre','RS'),(27,'Patrícia Costa','Salvador','BA'),(28,'Roberto Almeida','Fortaleza','CE'),(29,'Vanessa Martins','Recife','PE'),(30,'Eduardo Rocha','Brasília','DF'),(31,'Mariana Ferreira','Manaus','AM'),(32,'Lucas Carvalho','Belém','PA'),(33,'Sabrina Gomes','Natal','RN'),(34,'Thiago Mendes','Campinas','SP'),(35,'Beatriz Araújo','Florianópolis','SC');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidoscab`
--

DROP TABLE IF EXISTS `pedidoscab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidoscab` (
  `numped` bigint NOT NULL AUTO_INCREMENT,
  `dataemissao` datetime NOT NULL,
  `codcli` bigint NOT NULL,
  `valortotal` double(12,2) DEFAULT NULL,
  PRIMARY KEY (`numped`),
  KEY `pedidocab_clientes_FK` (`codcli`),
  CONSTRAINT `pedidocab_clientes_FK` FOREIGN KEY (`codcli`) REFERENCES `clientes` (`codcli`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidoscab`
--

LOCK TABLES `pedidoscab` WRITE;
/*!40000 ALTER TABLE `pedidoscab` DISABLE KEYS */;
INSERT INTO `pedidoscab` VALUES (1,'2025-05-06 10:00:00',21,1029.79),(2,'2025-05-15 11:00:00',22,2588.79),(3,'2025-06-02 12:00:00',23,4098.90),(4,'2025-06-18 13:00:00',24,2447.90),(5,'2025-06-26 14:00:00',25,1194.70),(6,'2025-07-08 15:00:00',26,2299.80),(7,'2025-07-17 16:00:00',27,1464.60),(8,'2025-08-05 17:00:00',28,4199.60),(9,'2025-08-11 18:00:00',29,1259.70),(11,'2025-09-01 10:00:00',1,7199.79),(12,'2025-09-01 11:00:00',4,10098.78),(13,'2025-09-01 12:00:00',6,5399.79),(14,'2025-09-01 13:00:00',7,12899.88),(15,'2025-09-01 14:00:00',9,4749.78),(16,'2025-09-01 15:00:00',10,3899.99),(17,'2025-09-01 16:00:00',12,6199.78),(18,'2025-09-01 17:00:00',14,10499.87),(19,'2025-09-01 18:00:00',17,2099.79),(20,'2025-09-01 19:00:00',19,8399.77);
/*!40000 ALTER TABLE `pedidoscab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidositens`
--

DROP TABLE IF EXISTS `pedidositens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidositens` (
  `numped` bigint NOT NULL,
  `numpeditem` bigint NOT NULL AUTO_INCREMENT,
  `codprod` varchar(100) NOT NULL,
  `quantidade` double(12,6) DEFAULT NULL,
  `valorunit` double(12,2) DEFAULT NULL,
  `valortotal` double(12,2) DEFAULT NULL,
  PRIMARY KEY (`numpeditem`),
  KEY `pedidositens_produtos_FK` (`codprod`),
  KEY `pedidositens_pedidoscab_FK` (`numped`),
  CONSTRAINT `pedidositens_pedidoscab_FK` FOREIGN KEY (`numped`) REFERENCES `pedidoscab` (`numped`),
  CONSTRAINT `pedidositens_produtos_FK` FOREIGN KEY (`codprod`) REFERENCES `produtos` (`codprod`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidositens`
--

LOCK TABLES `pedidositens` WRITE;
/*!40000 ALTER TABLE `pedidositens` DISABLE KEYS */;
INSERT INTO `pedidositens` VALUES (1,14,'A121',2.000000,79.90,159.80),(1,15,'B122',1.000000,250.00,250.00),(1,16,'C123',1.000000,229.99,229.99),(1,17,'M128',2.000000,69.00,138.00),(1,18,'BN31',1.000000,49.00,49.00),(2,19,'P124',1.000000,1499.00,1499.00),(2,20,'F126',2.000000,199.90,399.80),(2,21,'S127',1.000000,899.00,899.00),(2,22,'OC34',1.000000,95.00,95.00),(3,23,'N125',1.000000,3299.00,3299.00),(3,24,'CX32',1.000000,799.90,799.90),(4,25,'TV37',1.000000,2599.00,2599.00),(4,26,'TN38',1.000000,219.90,219.90),(4,27,'TB40',1.000000,999.00,999.00),(4,28,'JJ35',1.000000,179.00,179.00),(4,29,'ML36',1.000000,250.00,250.00),(5,30,'A121',3.000000,79.90,239.70),(5,31,'B129',1.000000,955.00,955.00),(6,32,'C123',2.000000,229.99,459.98),(6,33,'F126',1.000000,199.90,199.90),(6,34,'OC34',1.000000,639.92,639.92),(7,35,'BN31',2.000000,49.00,98.00),(7,36,'M128',1.000000,69.00,69.00),(7,37,'S127',1.000000,899.00,899.00),(7,38,'CX32',1.000000,398.60,398.60),(8,39,'TV37',1.000000,2599.00,2599.00),(8,40,'TN38',2.000000,219.90,439.80),(8,41,'TB40',1.000000,999.00,999.00),(8,42,'A121',1.000000,79.90,79.90),(8,43,'B122',1.000000,250.00,250.00),(8,44,'C123',1.000000,229.99,229.99),(8,45,'ML36',1.000000,402.91,402.91),(9,46,'TN38',1.000000,219.90,219.90),(9,47,'OC34',1.000000,1039.80,1039.80),(11,53,'101',1.000000,3499.90,3499.90),(11,54,'104',2.000000,399.95,799.90),(11,55,'111',1.000000,349.99,349.99),(11,56,'120',1.000000,649.00,649.00),(12,57,'102',1.000000,4599.99,4599.99),(12,58,'103',1.000000,2799.90,2799.90),(12,59,'105',1.000000,3999.00,3999.00),(12,60,'119',1.000000,299.89,299.89),(13,61,'106',1.000000,2999.90,2999.90),(13,62,'113',1.000000,3399.89,3399.89),(14,63,'107',1.000000,499.99,499.99),(14,64,'108',1.000000,3899.99,3899.99),(14,65,'110',1.000000,6999.00,6999.00),(14,66,'116',1.000000,599.90,599.90),(14,67,'115',1.000000,299.00,299.00),(15,68,'109',1.000000,499.90,499.90),(15,69,'118',3.000000,1199.96,3599.88),(16,70,'101',1.000000,3499.90,3499.90),(16,71,'114',1.000000,3899.99,3899.99),(17,72,'102',1.000000,4599.99,4599.99),(17,73,'107',1.000000,499.99,499.99),(17,74,'117',1.000000,1099.80,1099.80),(18,75,'103',1.000000,2799.90,2799.90),(18,76,'105',1.000000,3999.00,3999.00),(18,77,'110',1.000000,6999.00,6999.00),(18,78,'116',1.000000,599.90,599.90),(18,79,'120',1.000000,649.00,649.00),(18,80,'119',1.000000,299.00,299.00),(19,81,'111',1.000000,349.99,349.99),(19,82,'112',1.000000,299.80,299.80),(20,83,'108',1.000000,3899.99,3899.99),(20,84,'109',1.000000,499.90,499.90),(20,85,'113',2.000000,699.95,1399.90),(20,86,'114',1.000000,2999.99,2999.99),(20,87,'115',1.000000,1099.99,1099.99);
/*!40000 ALTER TABLE `pedidositens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `codprod` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `precovenda` double(12,2) DEFAULT NULL,
  PRIMARY KEY (`codprod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES ('101','Smartphone Samsung Galaxy S21',3499.90),('102','Notebook Dell Inspiron 15',4599.99),('103','Smart TV LG 50\" 4K',2799.90),('104','Fone de Ouvido JBL Bluetooth',399.90),('105','Geladeira Brastemp Frost Free 400L',3999.99),('106','Máquina de Lavar Samsung 11Kg',2999.90),('107','Micro-ondas Electrolux 20L',499.99),('108','Notebook Acer Aspire 5',3899.99),('109','Cafeteira Nespresso Essenza Mini',499.90),('110','Smartphone Apple iPhone 14',6999.00),('111','Mouse Gamer Logitech G502',349.99),('112','Teclado Mecânico Redragon Kumara',299.90),('113','Caixa de Som JBL Flip 5',699.90),('114','Ar Condicionado Split LG Dual Inverter',2999.99),('115','Monitor Samsung 24\" Full HD',1099.90),('116','Headset Gamer HyperX Cloud II',599.99),('117','Câmera GoPro Hero 11 Black',2899.90),('118','Smartwatch Xiaomi Mi Watch',1199.90),('119','Ventilador de Mesa Arno Turbo',299.90),('120','Kindle Paperwhite 8GB',649.90),('A121','Camiseta Polo Masculina',79.90),('B122','Calça Jeans Feminina',159.50),('B129','Bolsa de Couro Feminina',249.99),('BN31','Boné Aba Curva',49.90),('C123','Tênis Esportivo Running',229.99),('CM33','Câmera Digital Compacta',1199.00),('CX32','Caixa de Som Bluetooth',349.00),('F126','Fone de Ouvido Bluetooth',199.90),('JJ35','Jaqueta Jeans Azul',179.00),('M128','Sandália Feminina Rasteira',69.90),('ML36','Blusa de Moletom Canguru',149.90),('N125','Notebook 15.6\" i5',3299.00),('OC34','Óculos de Sol Unissex',119.90),('P124','Smartphone 128GB',1499.00),('R130','Relógio Digital Masculino',189.50),('S127','Smartwatch Pro Series',899.00),('SJ39','Saia Jeans Curta',99.00),('TB40','Tablet 10” 64GB',999.00),('TN38','Tênis Casual Feminino',219.90),('TV37','TV LED 50” 4K',2599.00);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-01 14:49:41
