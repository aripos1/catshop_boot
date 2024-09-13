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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `content` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_no` int DEFAULT NULL,
  `goods_no` int DEFAULT NULL,
  `item_no` int DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'박지민','2024-09-11','저희집 유찬이가 정말 잘먹습니다',2,6,NULL),(2,'용찬우','2024-09-11','정말 맛있어요',6,6,NULL),(3,'황덕룡','2024-09-11','맛있어 보여서 제가 다 뺏어먹었습니다',4,6,NULL),(4,'김유찬','2024-09-11','미쯔보다 맛있어요',2,7,NULL),(5,'용찬우','2024-09-11','3번째 구매입니다',6,6,NULL),(6,'용찬우','2024-09-11','댕 맛있어요 내가 먹어봄',6,1,NULL),(7,'박지민','2024-09-12','너무 좋습니다^^',8,2,NULL);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
