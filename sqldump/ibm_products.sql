-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ibm
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Male Clothing','Men\'s Casual Shirt','Comfortable and stylish casual shirt for men.',29.99),(2,'Female Clothing','Women\'s Summer Dress','Light and breezy summer dress for women.',39.99),(3,'Shoes','Running Shoes','High-performance running shoes for active individuals.',59.99),(4,'Male Clothing','Men\'s Jeans','Classic and durable jeans for men.',49.99),(5,'Female Clothing','Women\'s Blouse','Elegant blouse for a professional or casual look.',34.99),(6,'Shoes','Casual Sneakers','Stylish and comfortable sneakers for everyday wear.',44.99),(7,'Male Clothing','Men\'s Polo Shirt','Versatile and comfortable polo shirt for men.',24.99),(8,'Female Clothing','Women\'s Skirt','Trendy skirt for a fashionable and chic style.',29.99),(9,'Shoes','Formal Leather Shoes','Classic formal shoes made with genuine leather.',69.99),(10,'Male Clothing','Men\'s Hoodie','Warm and cozy hoodie for a relaxed and casual look.',39.99),(11,'Female Clothing','Women\'s Winter Coat','Stylish winter coat to keep you warm in cold weather.',79.99),(12,'Shoes','Hiking Boots','Durable hiking boots for outdoor adventures.',79.99),(13,'Accessories','Sunglasses','Trendy sunglasses for a cool and stylish appearance.',19.99),(14,'Accessories','Leather Belt','Classic leather belt to complement your outfit.',14.99),(15,'Accessories','Fashion Watch','Stylish wristwatch for a touch of elegance.',49.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-13 14:30:47
