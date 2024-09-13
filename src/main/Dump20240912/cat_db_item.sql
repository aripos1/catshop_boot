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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `no` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT NULL,
  `each_price` int DEFAULT NULL,
  `taste` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `options_no` int DEFAULT NULL,
  `receipt_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `options_no` (`options_no`),
  KEY `receipt_no` (`receipt_no`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`options_no`) REFERENCES `options` (`no`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`receipt_no`) REFERENCES `receipt` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,25000,'참치맛',1,2),(2,1,25000,'참치맛',1,3),(3,1,25000,'참치맛',1,4),(4,1,25000,'참치맛',1,5),(5,2,25000,'참치맛',1,5),(6,1,25000,'참치맛',1,6),(7,3,25000,'연어맛',2,7),(8,3,30000,'연어맛',4,8),(9,1,26000,'우럭맛',14,9);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
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
