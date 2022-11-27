-- MySQL dump 10.13  Distrib 8.0.30, for macos11.6 (arm64)
--
-- Host: localhost    Database: tours
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Lviv','49.83766974226121,24.034463539353638'),(2,'Warsaw','52.228769138945914,21.033036289280723');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (33);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer`
--

DROP TABLE IF EXISTS `layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layer` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `points` mediumblob,
  `text` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKidr1jdxseuc4iugvhov5j071r` (`city_id`),
  CONSTRAINT `FKidr1jdxseuc4iugvhov5j071r` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer`
--

LOCK TABLES `layer` WRITE;
/*!40000 ALTER TABLE `layer` DISABLE KEYS */;
INSERT INTO `layer` VALUES (7,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'http://localhost:8081/files-uploader/file/image/fce9d0bd-3866-4258-981a-14b278b1054d','Jews Quarter Layer','1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000',_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0t\0%49.844600322177186,24.026835766207444t\0#49.844683345650594,24.0284665492885t\0$49.84443427480265,24.032007065188157t\0#49.84408834094054,24.03342327154802t\0#49.843880779435054,24.0344103244655t\0#49.84073957319539,24.03569778479265t\0$49.84070581431054,24.034281578432786t\0#49.84102409582259,24.03417429007219t\0#49.84080268281862,24.03320869482683t\0$49.84055359197713,24.032049980532395t\0$49.84132853704744,24.031620827090013t\0\"49.84120399314171,24.0309341815822t\0$49.84304444264368,24.030075874697435t\0$49.84280920112392,24.027586784731614t\0%49.844600322177186,24.026835766207444','<p>This quarter was belong to jews</p>\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://localhost:8081/files-uploader/file/image/c44b4f0a-7bf4-41f8-ae0d-66938dbbfa8d\" alt=\"\" width=\"400\" height=\"599\"></p>\n<p>&nbsp;</p>',1),(10,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'http://localhost:8081/files-uploader/file/image/251ef3a0-e487-49cc-baa8-fa8699422268','Old town','1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000',_binary '¬\í\0ur\0[Ljava.lang.String;­\ÒV\ç\é{G\0\0xp\0\0\0	t\0$49.845627056158555,24.02639497026166t\0%49.843855892377086,24.034291393601503t\0$49.83876343503131,24.036694652878847t\0#49.83278464849433,24.03738129838666t\0#49.83123447205904,24.03532136186322t\0#49.8336704412919,24.028798229539003t\0#49.83832058730421,24.02364838823041t\0$49.84319168922898,24.020215160691347t\0$49.845627056158555,24.02639497026166','<p>Test</p>',1);
/*!40000 ALTER TABLE `layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer_tours`
--

DROP TABLE IF EXISTS `layer_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layer_tours` (
  `layer_id` int NOT NULL,
  `tours_id` int NOT NULL,
  UNIQUE KEY `UK_jvho656skf2x31f2mkiswyhbt` (`tours_id`),
  KEY `FK6dvsh1ptt9vjyiy3qqn4vueo1` (`layer_id`),
  CONSTRAINT `FK6dvsh1ptt9vjyiy3qqn4vueo1` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKcyumcxn34a9x8rc0249erohrk` FOREIGN KEY (`tours_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer_tours`
--

LOCK TABLES `layer_tours` WRITE;
/*!40000 ALTER TABLE `layer_tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `layer_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layers_tags`
--

DROP TABLE IF EXISTS `layers_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layers_tags` (
  `layer_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`layer_id`,`tag_id`),
  KEY `FKbf8birdeht3xsy4swu7adb8ro` (`tag_id`),
  CONSTRAINT `FKbf8birdeht3xsy4swu7adb8ro` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `FKnjg4yk7ktyfiugqbr938s2k3j` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layers_tags`
--

LOCK TABLES `layers_tags` WRITE;
/*!40000 ALTER TABLE `layers_tags` DISABLE KEYS */;
INSERT INTO `layers_tags` VALUES (7,3),(10,3),(7,4),(10,4),(7,5),(7,6),(10,8);
/*!40000 ALTER TABLE `layers_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `layer_id` int DEFAULT NULL,
  `tour_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr2gdhhu8rhyrvslukhtfbg8v5` (`city_id`),
  KEY `FKjxa4afqvbsksim68w7m2vrlbb` (`layer_id`),
  KEY `FKs8m2flc1idrb01230h1thvptp` (`tour_id`),
  CONSTRAINT `FKjxa4afqvbsksim68w7m2vrlbb` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKr2gdhhu8rhyrvslukhtfbg8v5` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FKs8m2flc1idrb01230h1thvptp` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (12,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'http://localhost:8081/files-uploader/file/image/a9b1ffe0-142a-4ff6-8564-c206bea8630c','Post for Jews Stories Tour no. 1',0,'1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','49.85603117478882,24.035588251248534','<p>Not sample but test message 2</p>\n<p><img style=\"float: right;\" src=\"http://localhost:8081/files-uploader/file/image/f29e5a93-5f94-4897-81e1-12f0ea145408\" alt=\"\" width=\"275\" height=\"183\"></p>',NULL,1,7,11),(13,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Jews Stories Tour no. 2',1,'1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','49.85425455659,24.032764434814453','Sample text here!',NULL,1,7,11),(14,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Jews Stories Tour no. 3',2,'1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','49.851075821578654,24.02992342580908','Sample text here!',NULL,1,7,11),(15,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Jews Stories Tour no. 4',3,'1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','49.848640729160685,24.027520166531737','Sample text here!',NULL,1,7,11),(16,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Jews Stories Tour no. 5',4,'1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','49.84598412478413,24.02915094961279','Sample text here!',NULL,1,7,11),(19,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 1',0,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.843185694111845,24.022808074951172','Sample text here!',NULL,1,10,18),(20,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 2',1,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.844397591016254,24.02558131086732','Sample text here!',NULL,1,10,18),(21,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 3',2,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.844660499295394,24.02686877119447','Sample text here!',NULL,1,10,18),(22,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 4',3,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84464666205317,24.029508064865123','Sample text here!',NULL,1,10,18),(23,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 5',4,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84387177016851,24.029679726242076','Sample text here!',NULL,1,10,18),(24,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 6',5,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84381642027288,24.030902813552867','Sample text here!',NULL,1,10,18),(25,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 7',6,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84312454123066,24.030881355880748','Sample text here!',NULL,1,10,18),(26,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 8',7,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84302767737458,24.03006596434022','Sample text here!',NULL,1,10,18),(27,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 9',8,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84216239568421,24.030495117782603','Sample text here!',NULL,1,10,18),(28,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 10',9,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84250764390133,24.032249450683594','Sample text here!',NULL,1,10,18),(29,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 11',10,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84156573884968,24.032683800338756','Sample text here!',NULL,1,10,18),(30,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 12',11,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84117826976817,24.030967186569224','Sample text here!',NULL,1,10,18),(31,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'/assets/empty-post.jpeg','Post for Middle ages tour no. 13',12,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.8418840147008,24.02933640348817','Sample text here!',NULL,1,10,18),(32,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,NULL,'http://localhost:8081/files-uploader/file/image/08099a6f-edcc-4a61-9870-91194dba2980','Post for Middle ages tour no. 14',13,'1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','49.84376595082281,24.028392265914928','<p>Sample text here!</p>',NULL,1,10,18);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_tags`
--

DROP TABLE IF EXISTS `locations_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_tags` (
  `location_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`location_id`,`tag_id`),
  KEY `FKtdnn0jyb53jixkem0vhsonden` (`tag_id`),
  CONSTRAINT `FK4ujg7x8hoeucjuj5ruyh5i084` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKtdnn0jyb53jixkem0vhsonden` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_tags`
--

LOCK TABLES `locations_tags` WRITE;
/*!40000 ALTER TABLE `locations_tags` DISABLE KEYS */;
INSERT INTO `locations_tags` VALUES (19,3),(20,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3),(30,3),(31,3),(32,3),(12,4),(19,4),(20,4),(21,4),(22,4),(23,4),(24,4),(25,4),(26,4),(27,4),(28,4),(29,4),(30,4),(31,4),(32,4),(32,5),(12,6),(13,6),(14,6),(15,6),(16,6);
/*!40000 ALTER TABLE `locations_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1wdpsed5kna2y38hnbgrnhi5b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (6,'Jews'),(4,'Middle Ages'),(8,'Old Town'),(3,'Ukraine'),(5,'XIX century');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `layer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpy38sq4e84fouj3ixh3t6pkhs` (`city_id`),
  KEY `FK3k1ku3q7wcsbh9orxqs2vpr0k` (`layer_id`),
  CONSTRAINT `FK3k1ku3q7wcsbh9orxqs2vpr0k` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKpy38sq4e84fouj3ixh3t6pkhs` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (11,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,130,NULL,'http://localhost:8081/files-uploader/file/image/f29e5a93-5f94-4897-81e1-12f0ea145408','Jews Stories Tour','1940-10-17 14:31:32.319000','1300-11-09 14:29:18.436000','<p style=\"text-align: center;\"><strong>Cool tour</strong></p>\n<p style=\"text-align: center;\"><strong><img src=\"http://localhost:8081/files-uploader/file/image/a9b1ffe0-142a-4ff6-8564-c206bea8630c\" alt=\"\" width=\"100\" height=\"70\"></strong></p>',NULL,1,7),(18,NULL,'405e98f2-785e-45b7-b8ec-722b12116205',NULL,NULL,200,NULL,'http://localhost:8081/files-uploader/file/image/82dd5eaf-59c9-4e45-a2b1-2b3c68b6b327','Middle ages tour','1600-10-17 14:40:15.339000','1300-11-09 14:40:12.118000','<p>Old town tour</p>',NULL,1,10);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_locations`
--

DROP TABLE IF EXISTS `tour_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_locations` (
  `tour_id` int NOT NULL,
  `locations_id` int NOT NULL,
  UNIQUE KEY `UK_esg04snnosykya5bc4ocx33mv` (`locations_id`),
  KEY `FKmq7ddlq4jy4nu36me2qpobxkp` (`tour_id`),
  CONSTRAINT `FK876x0thfod30ip67dhro4qhqw` FOREIGN KEY (`locations_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKmq7ddlq4jy4nu36me2qpobxkp` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_locations`
--

LOCK TABLES `tour_locations` WRITE;
/*!40000 ALTER TABLE `tour_locations` DISABLE KEYS */;
INSERT INTO `tour_locations` VALUES (11,12),(11,13),(11,14),(11,15),(11,16),(18,19),(18,20),(18,21),(18,22),(18,23),(18,24),(18,25),(18,26),(18,27),(18,28),(18,29),(18,30),(18,31),(18,32);
/*!40000 ALTER TABLE `tour_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_tags`
--

DROP TABLE IF EXISTS `tours_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours_tags` (
  `tour_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`tour_id`,`tag_id`),
  KEY `FK40hqhk3exyuufvmraypdcet73` (`tag_id`),
  CONSTRAINT `FK1kmioisse1ggqaffe0slt1jde` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`),
  CONSTRAINT `FK40hqhk3exyuufvmraypdcet73` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_tags`
--

LOCK TABLES `tours_tags` WRITE;
/*!40000 ALTER TABLE `tours_tags` DISABLE KEYS */;
INSERT INTO `tours_tags` VALUES (18,3),(11,4),(18,4),(11,6);
/*!40000 ALTER TABLE `tours_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 14:40:31
