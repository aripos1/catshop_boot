-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: cat_db
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `shopping`
--

DROP TABLE IF EXISTS `shopping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping` (
  `no` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `pick_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  `options_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `options_no` (`options_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`options_no`) REFERENCES `options` (`no`),
  CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`user_no`) REFERENCES `user` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping`
--

LOCK TABLES `shopping` WRITE;
/*!40000 ALTER TABLE `shopping` DISABLE KEYS */;
INSERT INTO `shopping` VALUES (2,1,'2024-09-11 11:48:46.562',6,1),(3,2,'2024-09-11 12:38:42.68',6,1),(7,3,'2024-09-11 15:32:24.204',8,4),(8,1,'2024-09-12 00:45:30.023',7,14);
/*!40000 ALTER TABLE `shopping` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 18:03:59
