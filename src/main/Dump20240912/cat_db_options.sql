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
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `no` int NOT NULL AUTO_INCREMENT,
  `taste` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `goods_no` int DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `goods_no` (`goods_no`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`goods_no`) REFERENCES `goods` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'참치맛',1),(2,'연어맛',1),(3,'고등어맛',1),(4,'연어맛',2),(5,'갈치맛',2),(6,'붕어맛',2),(7,'전어맛',3),(8,'꽁치맛',3),(9,'오징어맛',3),(10,'멸치맛',4),(11,'한치맛',4),(12,'개복치맛',4),(13,'광어맛',5),(14,'우럭맛',5),(15,'무럭맛',5),(16,'연어맛',7),(17,'참치맛',7),(18,'연어맛',21),(19,'참치맛',21),(20,'test1',39),(21,'test2',39),(22,'test3',39),(23,'test1',40),(24,'test2',40),(25,'test3',40);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
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
