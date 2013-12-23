CREATE DATABASE  IF NOT EXISTS `app_shop_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `app_shop_development`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: app_shop_development
-- ------------------------------------------------------
-- Server version	5.6.14

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
-- Table structure for table `meta_data_fields`
--

DROP TABLE IF EXISTS `meta_data_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data_fields` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_num` int(11) DEFAULT NULL,
  `lock_version` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_indexed` tinyint(1) NOT NULL DEFAULT '0',
  `field_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `by_obj_field` (`obj_id`,`field_name`),
  UNIQUE KEY `by_obj_num` (`obj_id`,`field_num`),
  KEY `by_org` (`org_id`),
  CONSTRAINT `fk_field_obj` FOREIGN KEY (`obj_id`) REFERENCES `meta_data` (`obj_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data_fields`
--

LOCK TABLES `meta_data_fields` WRITE;
/*!40000 ALTER TABLE `meta_data_fields` DISABLE KEYS */;
INSERT INTO `meta_data_fields` VALUES (1001,1001,100,'code',1,0,NULL,NULL,0,0,12),(1002,1002,100,'title',1,0,NULL,NULL,0,0,1),(1003,1002,100,'sub_title',2,0,NULL,NULL,0,0,1),(1004,1002,100,'image_url',3,0,NULL,NULL,0,0,1),(1005,1002,100,'description',4,0,NULL,NULL,0,0,1),(1006,1002,100,'info_product',5,0,NULL,NULL,0,0,12),(1007,1002,100,'info_price',6,0,NULL,NULL,0,0,12),(1008,1003,100,'code',1,0,NULL,NULL,0,0,1),(1009,1004,100,'code',1,0,NULL,NULL,0,0,1),(1010,1003,100,'image_url',4,0,NULL,NULL,0,0,1),(1011,1003,100,'group_num',5,0,NULL,NULL,0,0,2),(1012,1003,100,'group_title',6,0,NULL,NULL,0,0,1),(1013,1004,100,'image_url',4,0,NULL,NULL,0,0,1),(1014,1004,100,'group_num',5,0,NULL,NULL,0,0,2),(1015,1004,100,'group_title',6,0,NULL,NULL,0,0,1),(1016,1005,100,'code',1,0,NULL,NULL,0,0,1),(1017,1005,100,'image_url',4,0,NULL,NULL,0,0,1),(1018,1005,100,'group_num',5,0,NULL,NULL,0,0,2),(1019,1005,100,'group_title',6,0,NULL,NULL,0,0,1),(1020,1006,100,'code',1,0,NULL,NULL,0,0,1),(1021,1006,100,'image_url',4,0,NULL,NULL,0,0,1),(1022,1006,100,'group_num',5,0,NULL,NULL,0,0,1),(1023,1006,100,'group_title',6,0,NULL,NULL,0,0,2),(1024,1003,100,'title',2,0,NULL,NULL,0,0,1),(1025,1004,100,'title',2,0,NULL,NULL,0,0,1),(1026,1005,100,'title',2,0,NULL,NULL,0,0,1),(1027,1006,100,'title',2,0,NULL,NULL,0,0,1),(1028,1006,100,'type_group',3,0,NULL,NULL,0,0,1),(1029,1005,100,'type_group',3,0,NULL,NULL,0,0,1),(1030,1004,100,'type_group',3,0,NULL,NULL,0,0,1),(1031,1003,100,'type_group',3,0,NULL,NULL,0,0,1),(1032,1007,100,'axe_h',1,0,NULL,NULL,0,0,1),(1033,1007,100,'axe_w',2,0,NULL,NULL,0,0,1),(1034,1007,100,'data',3,0,NULL,NULL,0,0,1),(1035,1007,100,'type',4,0,NULL,NULL,0,1,1),(1036,1007,100,'matiere',5,0,NULL,NULL,0,1,1);
/*!40000 ALTER TABLE `meta_data_fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-23 23:56:28
