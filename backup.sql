/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: webservices
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--
create database webservices;

use webservices;

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `contatti` varchar(30) NOT NULL,
  `azienda` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES
(1,'Gavino Piras','gavino@email.com','Agricola Sarda'),
(2,'Francesca Mura','francesca@email.com','SardiniaWeb'),
(3,'Antonio Cossu','antonio@email.com','Artigianato Nuorese'),
(4,'Maria Dessì','maria@email.com','Sarda Consulting'),
(5,'Salvatore Fadda','salvatore@email.com','Cannonau Import'),
(6,'Elisa Lai','elisa@email.com','Turismo Sardegna'),
(7,'Giuseppe Meloni','giuseppe@email.com','EdilSardegna'),
(8,'Federica Oppo','federica@email.com','Moda Sarda'),
(9,'Paolo Serra','paolo@email.com','Ristorante La Barbagia'),
(10,'Claudia Sanna','claudia@email.com','TechNuraghe'),
(11,'Gavino Piras','gavino@email.com','Agricola Sarda'),
(12,'Francesca Mura','francesca@email.com','SardiniaWeb'),
(13,'Antonio Cossu','antonio@email.com','Artigianato Nuorese'),
(14,'Maria Dessì','maria@email.com','Sarda Consulting'),
(15,'Salvatore Fadda','salvatore@email.com','Cannonau Import'),
(16,'Elisa Lai','elisa@email.com','Turismo Sardegna'),
(17,'Giuseppe Meloni','giuseppe@email.com','EdilSardegna'),
(18,'Federica Oppo','federica@email.com','Moda Sarda'),
(19,'Paolo Serra','paolo@email.com','Ristorante La Barbagia'),
(20,'Claudia Sanna','claudia@email.com','TechNuraghe');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulenza`
--

DROP TABLE IF EXISTS `consulenza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulenza` (
  `id_consulenza` int(11) NOT NULL AUTO_INCREMENT,
  `data_creazione` date DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `id_stato_consulenza` smallint(6) NOT NULL,
  `id_cliente` smallint(6) NOT NULL,
  PRIMARY KEY (`id_consulenza`),
  KEY `id_stato_consulenza` (`id_stato_consulenza`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `consulenza_ibfk_1` FOREIGN KEY (`id_stato_consulenza`) REFERENCES `stato` (`id_stato_consulenza`),
  CONSTRAINT `consulenza_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`data_creazione` >= '2025-01-01')
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulenza`
--

LOCK TABLES `consulenza` WRITE;
/*!40000 ALTER TABLE `consulenza` DISABLE KEYS */;
INSERT INTO `consulenza` VALUES
(11,'2025-03-10','Aggiornare policy di sicurezza informatica per GDPR',1,1),
(12,'2025-04-15',NULL,2,2),
(13,'2025-05-02','Implementare nuovo sistema di analisi dati con AI',3,3),
(14,'2025-06-01',NULL,1,4),
(15,'2025-07-20',NULL,2,5),
(16,'2025-08-05','Integrare gestione social media con CRM aziendale',3,6),
(17,'2025-09-12',NULL,1,7),
(18,'2025-10-25','Formazione avanzata su strategie di cyber security',2,8),
(19,'2025-11-10',NULL,3,9),
(20,'2025-12-05',NULL,1,10);
/*!40000 ALTER TABLE `consulenza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto`
--

DROP TABLE IF EXISTS `contratto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto` (
  `id_contratto` smallint(6) NOT NULL AUTO_INCREMENT,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `id_servizio` smallint(6) DEFAULT NULL,
  `id_consulenza` int(11) NOT NULL,
  PRIMARY KEY (`id_contratto`),
  KEY `id_consulenza` (`id_consulenza`),
  KEY `id_servizio` (`id_servizio`),
  CONSTRAINT `contratto_ibfk_1` FOREIGN KEY (`id_consulenza`) REFERENCES `consulenza` (`id_consulenza`),
  CONSTRAINT `contratto_ibfk_2` FOREIGN KEY (`id_servizio`) REFERENCES `servizio` (`id_servizio`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`data_inizio` >= '2025-01-01')
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto`
--

LOCK TABLES `contratto` WRITE;
/*!40000 ALTER TABLE `contratto` DISABLE KEYS */;
INSERT INTO `contratto` VALUES
(71,'2025-03-15','2026-03-15',1,11),
(72,'2025-04-20','2026-04-20',2,12),
(73,'2025-05-10','2026-05-10',3,13),
(74,'2025-06-25','2026-06-25',4,14),
(75,'2025-07-30','2026-07-30',5,15),
(76,'2025-08-15','2026-08-15',6,16),
(77,'2025-09-10','2026-09-10',7,17),
(78,'2025-10-05','2026-10-05',8,18),
(79,'2025-11-20','2026-11-20',9,19),
(80,'2025-12-12','2026-12-12',10,20);
/*!40000 ALTER TABLE `contratto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fattura`
--

DROP TABLE IF EXISTS `fattura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fattura` (
  `id_fattura` smallint(6) NOT NULL AUTO_INCREMENT,
  `importo` decimal(10,2) DEFAULT NULL,
  `data_emissione` date NOT NULL,
  `id_consulenza` int(11) DEFAULT NULL,
  `id_contratto` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_fattura`),
  KEY `id_consulenza` (`id_consulenza`),
  KEY `id_contratto` (`id_contratto`),
  CONSTRAINT `fattura_ibfk_1` FOREIGN KEY (`id_consulenza`) REFERENCES `consulenza` (`id_consulenza`),
  CONSTRAINT `fattura_ibfk_2` FOREIGN KEY (`id_contratto`) REFERENCES `contratto` (`id_contratto`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`data_emissione` >= '2025-01-01')
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fattura`
--

LOCK TABLES `fattura` WRITE;
/*!40000 ALTER TABLE `fattura` DISABLE KEYS */;
INSERT INTO `fattura` VALUES
(21,400.00,'2025-03-20',11,71),
(22,900.50,'2025-04-25',12,72),
(23,750.75,'2025-05-20',13,73),
(24,1050.00,'2025-06-30',14,74),
(25,550.00,'2025-07-10',15,75),
(26,875.25,'2025-08-18',16,76),
(27,1350.00,'2025-09-28',17,77),
(28,680.80,'2025-10-22',18,78),
(29,480.00,'2025-11-07',19,79),
(30,1500.00,'2025-12-15',20,80),
(31,400.00,'2025-03-20',NULL,71),
(32,900.50,'2025-04-25',12,NULL),
(33,750.75,'2025-05-20',NULL,73),
(34,1050.00,'2025-06-30',14,NULL),
(35,550.00,'2025-07-10',NULL,75),
(36,875.25,'2025-08-18',16,NULL),
(37,1350.00,'2025-09-28',NULL,77),
(38,680.80,'2025-10-22',18,NULL),
(39,480.00,'2025-11-07',NULL,79),
(40,1500.00,'2025-12-15',20,NULL);
/*!40000 ALTER TABLE `fattura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalita_pagamento`
--

DROP TABLE IF EXISTS `modalita_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalita_pagamento` (
  `id_modalita` smallint(6) NOT NULL,
  `tipo_pagamento` varchar(9) NOT NULL,
  PRIMARY KEY (`id_modalita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalita_pagamento`
--

LOCK TABLES `modalita_pagamento` WRITE;
/*!40000 ALTER TABLE `modalita_pagamento` DISABLE KEYS */;
INSERT INTO `modalita_pagamento` VALUES
(1,'Contanti'),
(2,'PayPal'),
(3,'Bonifico');
/*!40000 ALTER TABLE `modalita_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` smallint(6) NOT NULL AUTO_INCREMENT,
  `data_pagamento` date NOT NULL,
  `importo_pagato` decimal(6,2) NOT NULL,
  `id_fattura` smallint(6) NOT NULL,
  `id_modalita` smallint(6) NOT NULL,
  `id_saldo` smallint(6) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `id_fattura` (`id_fattura`),
  KEY `id_modalita` (`id_modalita`),
  KEY `id_saldo` (`id_saldo`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`id_fattura`) REFERENCES `fattura` (`id_fattura`),
  CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`id_modalita`) REFERENCES `modalita_pagamento` (`id_modalita`),
  CONSTRAINT `pagamento_ibfk_3` FOREIGN KEY (`id_saldo`) REFERENCES `saldo` (`id_saldo`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`data_pagamento` >= '2005-01-01')
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES
(41,'2025-03-22',400.00,21,1,1),
(42,'2025-04-30',900.50,22,2,1),
(43,'2025-05-25',750.75,23,3,2),
(44,'2025-07-05',1050.00,24,1,1),
(45,'2025-07-15',550.00,25,2,1),
(46,'2025-08-22',875.25,26,3,1),
(47,'2025-09-30',1350.00,27,1,2),
(48,'2025-10-27',680.80,28,2,1),
(49,'2025-11-15',480.00,29,3,2),
(50,'2025-12-18',1500.00,30,1,1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saldo`
--

DROP TABLE IF EXISTS `saldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `saldo` (
  `id_saldo` smallint(6) NOT NULL,
  `descrizione` varchar(9) NOT NULL,
  PRIMARY KEY (`id_saldo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saldo`
--

LOCK TABLES `saldo` WRITE;
/*!40000 ALTER TABLE `saldo` DISABLE KEYS */;
INSERT INTO `saldo` VALUES
(1,'Pagato'),
(2,'Sospeso');
/*!40000 ALTER TABLE `saldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servizio`
--

DROP TABLE IF EXISTS `servizio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `servizio` (
  `id_servizio` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id_servizio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servizio`
--

LOCK TABLES `servizio` WRITE;
/*!40000 ALTER TABLE `servizio` DISABLE KEYS */;
INSERT INTO `servizio` VALUES
(1,'Sicurezza informatica'),
(2,'Analisi dati'),
(3,'Ottimizzazione SEO'),
(4,'Gestione social media'),
(5,'Consulenza finanziaria'),
(6,'Sviluppo software'),
(7,'Strategia marketing'),
(8,'Gestione IT'),
(9,'Supporto legale'),
(10,'Formazione aziendale');
/*!40000 ALTER TABLE `servizio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stato`
--

DROP TABLE IF EXISTS `stato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stato` (
  `id_stato_consulenza` smallint(6) NOT NULL,
  `stato` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_stato_consulenza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stato`
--

LOCK TABLES `stato` WRITE;
/*!40000 ALTER TABLE `stato` DISABLE KEYS */;
INSERT INTO `stato` VALUES
(1,'In corso'),
(2,'Scaduta'),
(3,'Annullata');
/*!40000 ALTER TABLE `stato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 23:57:51
