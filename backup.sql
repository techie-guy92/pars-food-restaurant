-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: pars_food
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add کاربر',6,'add_customuser'),(22,'Can change کاربر',6,'change_customuser'),(23,'Can delete کاربر',6,'delete_customuser'),(24,'Can view کاربر',6,'view_customuser'),(25,'Can add تکمیلی کاربر',7,'add_userprofile'),(26,'Can change تکمیلی کاربر',7,'change_userprofile'),(27,'Can delete تکمیلی کاربر',7,'delete_userprofile'),(28,'Can view تکمیلی کاربر',7,'view_userprofile'),(29,'Can add Token',8,'add_token'),(30,'Can change Token',8,'change_token'),(31,'Can delete Token',8,'delete_token'),(32,'Can view Token',8,'view_token'),(33,'Can add Token',9,'add_tokenproxy'),(34,'Can change Token',9,'change_tokenproxy'),(35,'Can delete Token',9,'delete_tokenproxy'),(36,'Can view Token',9,'view_tokenproxy'),(37,'Can add Discount',10,'add_discount'),(38,'Can change Discount',10,'change_discount'),(39,'Can delete Discount',10,'delete_discount'),(40,'Can view Discount',10,'view_discount'),(41,'Can add Category',11,'add_foodcategory'),(42,'Can change Category',11,'change_foodcategory'),(43,'Can delete Category',11,'delete_foodcategory'),(44,'Can view Category',11,'view_foodcategory'),(45,'Can add Food',12,'add_food'),(46,'Can change Food',12,'change_food'),(47,'Can delete Food',12,'delete_food'),(48,'Can view Food',12,'view_food'),(49,'Can add Gallery',13,'add_gallery'),(50,'Can change Gallery',13,'change_gallery'),(51,'Can delete Gallery',13,'delete_gallery'),(52,'Can view Gallery',13,'view_gallery'),(53,'Can add Order',14,'add_order'),(54,'Can change Order',14,'change_order'),(55,'Can delete Order',14,'delete_order'),(56,'Can view Order',14,'view_order'),(57,'Can add OrderItem',15,'add_orderitem'),(58,'Can change OrderItem',15,'change_orderitem'),(59,'Can delete OrderItem',15,'delete_orderitem'),(60,'Can view OrderItem',15,'view_orderitem'),(61,'Can add Reservation',16,'add_reservation'),(62,'Can change Reservation',16,'change_reservation'),(63,'Can delete Reservation',16,'delete_reservation'),(64,'Can view Reservation',16,'view_reservation'),(65,'Can add Review',17,'add_review'),(66,'Can change Review',17,'change_review'),(67,'Can delete Review',17,'delete_review'),(68,'Can view Review',17,'view_review'),(69,'Can add holiday',18,'add_holiday'),(70,'Can change holiday',18,'change_holiday'),(71,'Can delete holiday',18,'delete_holiday'),(72,'Can view holiday',18,'view_holiday'),(73,'Can add Customer',19,'add_inpersoncustomer'),(74,'Can change Customer',19,'change_inpersoncustomer'),(75,'Can delete Customer',19,'delete_inpersoncustomer'),(76,'Can view Customer',19,'view_inpersoncustomer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('4bde26d14100a3cbfd1ddc07335f9e9aae3c8894','2024-08-28 06:56:29.680050',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-06 07:41:47.720171','3','Sahar Ghenaati',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',6,1),(2,'2024-08-06 11:54:09.245340','3','Sahar Ghenaati',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(3,'2024-08-06 11:54:14.016621','3','Sahar Ghenaati',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(4,'2024-08-07 12:08:20.324761','4','rana farhadi',1,'[{\"added\": {}}]',6,1),(5,'2024-08-07 12:09:30.947363','5','hirad haghparast',1,'[{\"added\": {}}]',6,1),(6,'2024-08-07 12:10:40.127287','6','sobhan saadat',1,'[{\"added\": {}}]',6,3),(7,'2024-08-07 12:24:24.086626','4','rana farhadi',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',6,1),(8,'2024-08-07 12:25:22.234894','4','rana farhadi',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(9,'2024-08-07 12:25:31.179626','3','Sahar Ghenaati',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(10,'2024-08-08 06:29:30.604611','7','roham younesi',1,'[{\"added\": {}}]',6,1),(11,'2024-08-08 07:24:52.031829','8','sara aghda',1,'[{\"added\": {}}]',6,1),(12,'2024-08-08 07:28:29.717506','9','ghasem rezaei',1,'[{\"added\": {}}]',6,3),(13,'2024-08-08 11:48:11.105092','8','sara aghdasi',2,'[{\"changed\": {\"fields\": [\"Last Nmae\"]}}]',6,1),(14,'2024-08-08 12:48:23.057122','10','sahar dashti',1,'[{\"added\": {}}]',6,1),(15,'2024-08-08 12:51:09.138200','11','hoda ramezani',1,'[{\"added\": {}}]',6,1),(16,'2024-08-08 12:55:11.893295','12','Mahor Soroush',1,'[{\"added\": {}}]',6,1),(17,'2024-08-08 12:56:08.249085','8','sara aghdasi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(18,'2024-08-08 12:56:08.254418','10','sahar dashti',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(19,'2024-08-08 12:56:08.260930','4','rana farhadi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(20,'2024-08-08 12:56:08.266010','11','hoda ramezani',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(21,'2024-08-08 12:56:08.271009','12','Mahor Soroush',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(22,'2024-08-08 12:56:08.278129','7','roham younesi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(23,'2024-08-08 12:57:51.235270','12','Mahor Soroush',2,'[{\"changed\": {\"fields\": [\"Being Active\"]}}]',6,1),(24,'2024-08-08 12:57:51.238932','7','roham younesi',2,'[{\"changed\": {\"fields\": [\"Being Active\"]}}]',6,1),(25,'2024-08-08 12:57:59.990399','12','Mahor Soroush',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(26,'2024-08-08 12:58:10.839211','7','roham younesi',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(27,'2024-08-08 12:58:28.696474','11','hoda ramezani',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(28,'2024-08-08 12:58:51.552252','4','rana farhadi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(29,'2024-08-08 12:59:01.040300','10','sahar dashti',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(30,'2024-08-08 12:59:14.692039','8','sara aghdasi',2,'[{\"changed\": {\"fields\": [\"User Type\"]}}]',6,1),(31,'2024-08-08 13:03:20.711966','13','Rosha Rahmani',1,'[{\"added\": {}}]',6,1),(32,'2024-08-08 13:03:39.200908','13','Rosha Rahmani',2,'[{\"changed\": {\"fields\": [\"User Type\", \"Being Admin\"]}}]',6,1),(33,'2024-08-09 05:59:08.567855','8','sara aghdasi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(34,'2024-08-09 05:59:14.405790','8','sara aghdasi',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(35,'2024-08-09 06:06:53.541379','14','Ahmad Alizadeh',1,'[{\"added\": {}}]',6,1),(36,'2024-08-09 06:07:16.722427','14','Ahmad Alizadeh',2,'[{\"changed\": {\"fields\": [\"Being Admin\"]}}]',6,1),(37,'2024-08-31 09:42:52.975853','2','Reservation by Rima Ramezani at Pars Food',1,'[{\"added\": {}}]',16,1),(38,'2024-08-31 09:43:46.713657','2','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(39,'2024-08-31 09:45:09.069432','2','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"Number Of Tables\"]}}]',16,1),(40,'2024-08-31 11:20:24.061755','3','Reservation by Mahor Soroush at Pars Food',1,'[{\"added\": {}}]',16,1),(41,'2024-08-31 11:20:32.147515','3','Reservation by Mahor Soroush at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(42,'2024-08-31 11:29:16.478047','4','Reservation by sobhan saadat at Pars Food',1,'[{\"added\": {}}]',16,1),(43,'2024-08-31 11:36:01.782508','1','appetizer',1,'[{\"added\": {}}]',11,1),(44,'2024-08-31 11:36:40.231548','2','main-course',1,'[{\"added\": {}}]',11,1),(45,'2024-08-31 11:37:11.002392','3','dessert',1,'[{\"added\": {}}]',11,1),(46,'2024-08-31 11:56:58.819588','4','salad',1,'[{\"added\": {}}]',11,1),(47,'2024-08-31 11:59:08.162829','5','sandwich',1,'[{\"added\": {}}]',11,1),(48,'2024-08-31 11:59:42.197126','6','pizza',1,'[{\"added\": {}}]',11,1),(49,'2024-08-31 12:01:49.766119','7','fried_food',1,'[{\"added\": {}}]',11,1),(50,'2024-08-31 12:07:02.512797','8','seafood',1,'[{\"added\": {}}]',11,1),(51,'2024-08-31 12:08:32.070743','9','persian-food',1,'[{\"added\": {}}]',11,1),(52,'2024-08-31 12:11:26.637314','10','drinks',1,'[{\"added\": {}}]',11,1),(53,'2024-08-31 12:17:14.297115','1','سالاد شیرازی 15000',1,'[{\"added\": {}}]',12,1),(54,'2024-08-31 12:20:02.074852','2','سالاد سزار 170000',1,'[{\"added\": {}}]',12,1),(55,'2024-08-31 12:25:38.838256','3','آب معدنی 20000',1,'[{\"added\": {}}]',12,1),(56,'2024-08-31 12:26:12.471308','4','کوکا کولا 30000',1,'[{\"added\": {}}]',12,1),(57,'2024-08-31 12:27:02.823846','5','فانتا 25000',1,'[{\"added\": {}}]',12,1),(58,'2024-08-31 12:30:17.157795','6','چلو کباب کوبیده 220000',1,'[{\"added\": {}}]',12,1),(59,'2024-08-31 12:30:49.784116','7','جوجه کباب 190000',1,'[{\"added\": {}}]',12,1),(60,'2024-08-31 12:31:48.839329','8','چلو برگ 300000',1,'[{\"added\": {}}]',12,1),(61,'2024-08-31 12:32:29.189985','9','چلو کباب وزیری 200000',1,'[{\"added\": {}}]',12,1),(62,'2024-08-31 12:33:33.693546','10','ژامبون مرغ تنوری 170000',1,'[{\"added\": {}}]',12,1),(63,'2024-08-31 12:34:13.441331','11','هات داگ مخصوص 180000',1,'[{\"added\": {}}]',12,1),(64,'2024-08-31 12:34:51.260370','12','همبرگر 130000',1,'[{\"added\": {}}]',12,1),(65,'2024-08-31 12:35:27.748328','13','چیز برگر 200000',1,'[{\"added\": {}}]',12,1),(66,'2024-08-31 12:36:07.856607','14','پیتزا فیله مرغ 270000',1,'[{\"added\": {}}]',12,1),(67,'2024-08-31 12:36:37.167616','15','پیتزا پنجره ای مخصوص 290000',1,'[{\"added\": {}}]',12,1),(68,'2024-08-31 12:37:18.516512','16','پیتزا پپرونی 260000',1,'[{\"added\": {}}]',12,1),(69,'2024-08-31 12:37:59.042665','17','پیتزا اسنیک 310000',1,'[{\"added\": {}}]',12,1),(70,'2024-08-31 12:38:41.461175','18','پیتزا مارگاریتا 160000',1,'[{\"added\": {}}]',12,1),(71,'2024-08-31 12:40:37.475121','19','فیله استریپس سوخاری چهار تیکه 270000',1,'[{\"added\": {}}]',12,1),(72,'2024-08-31 12:41:10.356140','20','فیله استریپس سوخاری شش تیکه 330000',1,'[{\"added\": {}}]',12,1),(73,'2024-08-31 12:41:50.646227','21','سوشی 410000',1,'[{\"added\": {}}]',12,1),(74,'2024-08-31 12:42:22.050749','22','چلو ماهی سالمون 320000',1,'[{\"added\": {}}]',12,1),(75,'2024-08-31 13:09:41.528317','1','0gS3cMsdbP 10 False 2024-08-31 16:38:46+03:30 2024-09-01 00:00:00+03:30',1,'[{\"added\": {}}]',10,1),(76,'2024-08-31 13:10:21.919314','2','yuXbqhSbUk 25 False 2024-08-31 16:40:11+03:30 2024-09-30 00:00:00+03:30',1,'[{\"added\": {}}]',10,1),(77,'2024-08-31 13:13:30.032542','3','gn4s4QzXgL 15 False 2024-08-31 16:43:17+03:30 2024-10-01 00:00:00+03:30',1,'[{\"added\": {}}]',10,1),(78,'2024-08-31 13:39:31.283025','5','Reservation by hoda ramezani at Pars Food',1,'[{\"added\": {}}]',16,1),(79,'2024-08-31 13:39:36.374320','5','Reservation by hoda ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(80,'2024-08-31 13:52:52.140532','4','Reservation by sobhan saadat at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(81,'2024-09-01 06:18:04.219850','6','Reservation by ghasem rezaei at Pars Food',1,'[{\"added\": {}}]',16,1),(82,'2024-09-01 06:19:07.043489','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(83,'2024-09-01 06:26:55.094319','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(84,'2024-09-01 06:28:34.132070','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(85,'2024-09-01 06:36:09.490416','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(86,'2024-09-01 06:39:04.082255','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(87,'2024-09-01 10:00:23.177585','7','Reservation by Ahmad Alizadeh at Pars Food',1,'[{\"added\": {}}]',16,1),(88,'2024-09-01 10:02:08.335379','8','Reservation by rana farhadi at Pars Food',1,'[{\"added\": {}}]',16,1),(89,'2024-09-01 10:02:37.110860','8','Reservation by rana farhadi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Number Of People\", \"Number Of Tables\", \"End Date\"]}}]',16,1),(90,'2024-09-01 10:05:22.608798','1','Holiday on 2024-09-02',1,'[{\"added\": {}}]',18,1),(91,'2024-09-01 10:06:37.430648','2','Holiday on 2024-09-04',1,'[{\"added\": {}}]',18,1),(92,'2024-09-01 12:21:20.482608','10','Reservation by sahar dashti at Pars Food',1,'[{\"added\": {}}]',16,1),(93,'2024-09-01 12:27:26.557162','10','Reservation by sahar dashti at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(94,'2024-09-01 12:28:08.290430','8','Reservation by rana farhadi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(95,'2024-09-01 12:28:57.635668','7','Reservation by Ahmad Alizadeh at Pars Food',2,'[]',16,1),(96,'2024-09-01 12:29:13.326851','2','Reservation by Rima Ramezani at Pars Food',2,'[]',16,1),(97,'2024-09-01 12:29:17.096047','3','Reservation by Mahor Soroush at Pars Food',2,'[]',16,1),(98,'2024-09-01 12:29:20.929382','4','Reservation by sobhan saadat at Pars Food',2,'[]',16,1),(99,'2024-09-01 12:29:24.239044','4','Reservation by sobhan saadat at Pars Food',2,'[]',16,1),(100,'2024-09-01 12:29:29.725357','5','Reservation by hoda ramezani at Pars Food',2,'[]',16,1),(101,'2024-09-01 12:29:33.503791','6','Reservation by ghasem rezaei at Pars Food',2,'[]',16,1),(102,'2024-09-01 12:29:41.739068','8','Reservation by rana farhadi at Pars Food',2,'[]',16,1),(103,'2024-09-01 12:29:45.473823','7','Reservation by Ahmad Alizadeh at Pars Food',2,'[]',16,1),(104,'2024-09-01 13:00:46.168696','7','Reservation by Ahmad Alizadeh at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(105,'2024-09-01 13:06:07.393659','6','Reservation by ghasem rezaei at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(106,'2024-09-01 13:06:18.334476','10','Reservation by sahar dashti at Pars Food',2,'[]',16,1),(107,'2024-09-01 13:06:27.350267','8','Reservation by rana farhadi at Pars Food',2,'[]',16,1),(108,'2024-09-01 13:06:36.050104','2','Reservation by Rima Ramezani at Pars Food',2,'[]',16,1),(109,'2024-09-01 13:06:44.979452','3','Reservation by Mahor Soroush at Pars Food',2,'[]',16,1),(110,'2024-09-01 13:06:53.354996','4','Reservation by sobhan saadat at Pars Food',2,'[]',16,1),(111,'2024-09-01 13:07:01.861082','4','Reservation by sobhan saadat at Pars Food',2,'[]',16,1),(112,'2024-09-01 13:07:10.559467','5','Reservation by hoda ramezani at Pars Food',2,'[]',16,1),(113,'2024-09-01 13:07:47.572493','11','Reservation by sahar dashti at Pars Food',1,'[{\"added\": {}}]',16,1),(114,'2024-09-01 13:08:38.168734','6','Reservation by ghasem rezaei at Pars Food',3,'',16,1),(115,'2024-09-01 13:08:38.188455','7','Reservation by Ahmad Alizadeh at Pars Food',3,'',16,1),(116,'2024-09-01 13:08:38.194466','8','Reservation by rana farhadi at Pars Food',3,'',16,1),(117,'2024-09-01 13:08:47.122447','11','Reservation by sahar dashti at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(118,'2024-09-01 13:09:16.932325','11','Reservation by sahar dashti at Pars Food',2,'[]',16,1),(119,'2024-09-01 13:18:28.861591','12','Reservation by Rima Ramezani at Pars Food',1,'[{\"added\": {}}]',16,1),(120,'2024-09-01 13:18:49.359351','12','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(121,'2024-09-01 13:19:20.259862','12','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(122,'2024-09-01 13:20:06.782481','12','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(123,'2024-09-01 13:21:01.927208','12','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(124,'2024-09-01 13:47:34.608551','13','Reservation by sara aghdasi at Pars Food',1,'[{\"added\": {}}]',16,1),(125,'2024-09-01 14:16:18.472053','14','Reservation by Hoda Mardani at Pars Food',1,'[{\"added\": {}}]',16,1),(126,'2024-09-01 14:17:25.553938','15','Reservation by roham younesi at Pars Food',1,'[{\"added\": {}}]',16,1),(127,'2024-09-01 14:44:19.871635','12','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(128,'2024-09-01 14:44:33.158986','13','Reservation by sara aghdasi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(129,'2024-09-01 14:45:19.386479','11','Reservation by sahar dashti at Pars Food',3,'',16,1),(130,'2024-09-01 14:45:19.406305','12','Reservation by Rima Ramezani at Pars Food',3,'',16,1),(131,'2024-09-01 14:45:19.417054','13','Reservation by sara aghdasi at Pars Food',3,'',16,1),(132,'2024-09-01 14:45:19.422032','14','Reservation by Hoda Mardani at Pars Food',3,'',16,1),(133,'2024-09-01 14:45:19.426982','15','Reservation by roham younesi at Pars Food',3,'',16,1),(134,'2024-09-01 14:45:38.798027','2','Reservation by Rima Ramezani at Pars Food',3,'',16,1),(135,'2024-09-01 14:45:38.817194','3','Reservation by Mahor Soroush at Pars Food',3,'',16,1),(136,'2024-09-01 14:45:38.822184','4','Reservation by sobhan saadat at Pars Food',3,'',16,1),(137,'2024-09-01 14:45:38.832494','5','Reservation by hoda ramezani at Pars Food',3,'',16,1),(138,'2024-09-01 14:45:38.838062','10','Reservation by sahar dashti at Pars Food',3,'',16,1),(139,'2024-09-01 14:49:29.245297','16','Reservation by sara aghdasi at Pars Food',1,'[{\"added\": {}}]',16,1),(140,'2024-09-01 14:49:47.523077','16','Reservation by sara aghdasi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(141,'2024-09-01 14:50:36.877855','17','Reservation by Sosha Parsa at Pars Food',1,'[{\"added\": {}}]',16,1),(142,'2024-09-01 14:50:47.035822','17','Reservation by Sosha Parsa at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(143,'2024-09-01 14:53:00.435359','18','Reservation by rana farhadi at Pars Food',1,'[{\"added\": {}}]',16,1),(144,'2024-09-01 14:53:14.574818','18','Reservation by rana farhadi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(145,'2024-09-02 07:02:50.442832','19','Reservation by ghasem rezaei at Pars Food',1,'[{\"added\": {}}]',16,1),(146,'2024-09-02 07:04:14.460889','19','Reservation by ghasem rezaei at Pars Food',3,'',16,1),(147,'2024-09-02 07:12:27.682968','20','Reservation by sara aghdasi at Pars Food',1,'[{\"added\": {}}]',16,1),(148,'2024-09-02 07:35:06.535199','21','Reservation by sahar dashti at Pars Food',1,'[{\"added\": {}}]',16,1),(149,'2024-09-02 07:44:26.866173','21','Reservation by sahar dashti at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(150,'2024-09-02 07:44:49.810988','21','Reservation by sahar dashti at Pars Food',2,'[{\"changed\": {\"fields\": [\"End Date\"]}}]',16,1),(151,'2024-09-02 07:45:18.336285','20','Reservation by sara aghdasi at Pars Food',3,'',16,1),(152,'2024-09-02 07:45:18.356800','21','Reservation by sahar dashti at Pars Food',3,'',16,1),(153,'2024-09-02 07:46:11.528211','22','Reservation by Rima Ramezani at Pars Food',1,'[{\"added\": {}}]',16,1),(154,'2024-09-02 07:46:48.256433','23','Reservation by Sahar Ghenaati at Pars Food',1,'[{\"added\": {}}]',16,1),(155,'2024-09-02 07:50:15.812113','23','Reservation by Sahar Ghenaati at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(156,'2024-09-02 08:35:45.136923','24','Reservation by Sosha Parsa at Pars Food',1,'[{\"added\": {}}]',16,1),(157,'2024-09-02 08:40:02.111737','25','Reservation by Soheil Daliri at Pars Food',1,'[{\"added\": {}}]',16,1),(158,'2024-09-02 08:40:35.952971','25','Reservation by Soheil Daliri at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(159,'2024-09-02 08:45:32.995876','26','Reservation by sahar dashti at Pars Food',1,'[{\"added\": {}}]',16,1),(160,'2024-09-02 08:46:16.196730','26','Reservation by sahar dashti at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(161,'2024-09-02 08:46:53.837110','26','Reservation by sahar dashti at Pars Food',2,'[]',16,1),(162,'2024-09-02 09:20:08.787245','27','Reservation by sara aghdasi at Pars Food',1,'[{\"added\": {}}]',16,1),(163,'2024-09-02 09:27:28.167991','22','Reservation by Rima Ramezani at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(164,'2024-09-02 09:27:36.828877','24','Reservation by Sosha Parsa at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(165,'2024-09-02 09:27:43.375874','27','Reservation by sara aghdasi at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(166,'2024-09-03 11:40:15.506015','29','Reservation by Ahmad Alizadeh at Pars Food',1,'[{\"added\": {}}]',16,1),(167,'2024-09-03 11:40:34.384910','29','Reservation by Ahmad Alizadeh at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(168,'2024-09-03 11:44:49.190259','30','Reservation by Soheil Daliri at Pars Food',1,'[{\"added\": {}}]',16,1),(169,'2024-09-03 11:45:07.069224','22','Reservation by Rima Ramezani at Pars Food',3,'',16,1),(170,'2024-09-03 11:45:07.074566','23','Reservation by Sahar Ghenaati at Pars Food',3,'',16,1),(171,'2024-09-03 11:45:07.082637','24','Reservation by Sosha Parsa at Pars Food',3,'',16,1),(172,'2024-09-03 11:45:07.087351','25','Reservation by Soheil Daliri at Pars Food',3,'',16,1),(173,'2024-09-03 11:45:07.094185','26','Reservation by sahar dashti at Pars Food',3,'',16,1),(174,'2024-09-03 11:45:07.100086','27','Reservation by sara aghdasi at Pars Food',3,'',16,1),(175,'2024-09-03 11:45:11.353822','30','Reservation by Soheil Daliri at Pars Food',2,'[{\"changed\": {\"fields\": [\"Being Approved\"]}}]',16,1),(176,'2024-09-04 10:22:20.484344','1','Order 1 by hirad haghparast (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a\\t\\t270000 x 3\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631\\t\\t130000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627\\t\\t30000 x 5\"}}]',14,1),(177,'2024-09-04 10:30:27.267697','2','Order 2 by Ahmad Alizadeh (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631\\t\\t130000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u062c\\u0648\\u062c\\u0647 \\u06a9\\u0628\\u0627\\u0628\\t\\t190000 x 3\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627\\t\\t30000 x 6\"}}]',14,1),(178,'2024-09-04 10:39:07.534285','3','Order 3 by Rima Ramezani (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9\\t\\t310000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a\\t\\t270000 x 3\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627\\t\\t25000 x 3\"}}]',14,1),(179,'2024-09-04 10:42:32.321967','4','Order 4 by sobhan saadat (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631\\t\\t130000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9\\t\\t310000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627\\t\\t30000 x 3\"}}]',14,1),(180,'2024-09-04 13:58:57.256505','1','Sahar Manafi',1,'[{\"added\": {}}]',19,1),(181,'2024-09-04 14:00:12.264930','2','Mansour Hadfmand',1,'[{\"added\": {}}]',19,1),(182,'2024-09-04 14:00:44.839056','5','Order 5 by Mansour Hadfmand (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631\\t\\t130000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a\\t\\t270000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627\\t\\t30000 x 3\"}}]',14,1),(183,'2024-09-04 14:03:18.797953','4','Order 4 (In-Person)',3,'',14,1),(184,'2024-09-04 14:03:18.807427','3','Order 3 (In-Person)',3,'',14,1),(185,'2024-09-04 14:03:18.813011','2','Order 2 (In-Person)',3,'',14,1),(186,'2024-09-04 14:03:18.817773','1','Order 1 (In-Person)',3,'',14,1),(187,'2024-09-04 16:42:08.297954','15','کوکا کولا - 30000 x 3',3,'',15,1),(188,'2024-09-04 16:42:08.304678','14','پیتزا فیله مرغ - 270000 x 1',3,'',15,1),(189,'2024-09-04 16:42:08.311681','13','همبرگر - 130000 x 2',3,'',15,1),(190,'2024-09-04 16:42:28.550962','5','Order 5 by Mansour Hadfmand (In-Person)',3,'',14,1),(191,'2024-09-04 16:46:21.886197','6','Order 6 by Mansour Hadfmand (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a - 270000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u06a9\\u0628\\u0627\\u0628 \\u06a9\\u0648\\u0628\\u06cc\\u062f\\u0647 - 220000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 - 30000 x 3\"}}]',14,1),(192,'2024-09-06 07:56:17.121275','7','Order 7 by Mansour Hadfmand (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af - 300000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 - 310000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 - 25000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 - 30000 x 1\"}}]',14,1),(193,'2024-09-06 08:06:37.754879','8','Order 8 by hirad haghparast (Online)',2,'[{\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af - 300000 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 - 25000 x 1\"}}]',14,1),(194,'2024-09-08 06:20:29.403750','3','Milad Mohammadi',1,'[{\"added\": {}}]',19,1),(195,'2024-09-08 06:21:13.866408','9','Order 9 by Milad Mohammadi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 - 310000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u062c\\u0648\\u062c\\u0647 \\u06a9\\u0628\\u0627\\u0628 - 190000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af - 300000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0633\\u0627\\u0644\\u0627\\u062f \\u0634\\u06cc\\u0631\\u0627\\u0632\\u06cc - 15000 x 3\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 - 25000 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 - 30000 x 2\"}}]',14,1),(196,'2024-09-08 08:30:40.479768','10','Order 10 by Sahar Manafi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 x 1\"}}]',14,1),(197,'2024-09-08 08:32:51.509278','4','Hamed Gholami',1,'[{\"added\": {}}]',19,1),(198,'2024-09-08 08:32:53.030862','11','Order 11 by Hamed Gholami (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u06cc\\u0632 \\u0628\\u0631\\u06af\\u0631 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 x 1\"}}]',14,1),(199,'2024-09-08 08:56:34.633449','5','Ahad Saravi',1,'[{\"added\": {}}]',19,1),(200,'2024-09-08 08:57:05.707308','15','Order 15 by Ahad Saravi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u06cc\\u0632 \\u0628\\u0631\\u06af\\u0631 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0627\\u062a \\u062f\\u0627\\u06af \\u0645\\u062e\\u0635\\u0648\\u0635 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0622\\u0628 \\u0645\\u0639\\u062f\\u0646\\u06cc x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 x 2\"}}]',14,1),(201,'2024-09-08 12:42:48.965315','6','Afsaneh Shamshad',1,'[{\"added\": {}}]',19,1),(202,'2024-09-08 12:44:28.819767','16','Order 16 by Afsaneh Shamshad (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631 x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u06a9\\u0628\\u0627\\u0628 \\u0648\\u0632\\u06cc\\u0631\\u06cc x 3\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 x 6\"}}]',14,1),(203,'2024-09-08 12:46:42.315547','3','Holiday on 2024-09-12',1,'[{\"added\": {}}]',18,1),(204,'2024-09-08 12:49:15.401492','31','Reservation by sara aghdasi at Pars Food',1,'[{\"added\": {}}]',16,1),(205,'2024-09-12 05:48:36.164744','37','Order 37 by Hamed Gholami (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u06cc\\u0644\\u0647 \\u0627\\u0633\\u062a\\u0631\\u06cc\\u067e\\u0633 \\u0633\\u0648\\u062e\\u0627\\u0631\\u06cc \\u0686\\u0647\\u0627\\u0631 \\u062a\\u06cc\\u06a9\\u0647 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631 x 1\"}}]',14,1),(206,'2024-09-12 05:49:03.465640','26','Order 26 by Soheil Daliri (Online)',3,'',14,1),(207,'2024-09-12 05:49:03.474182','27','Order 27 by Soheil Daliri (Online)',3,'',14,1),(208,'2024-09-12 05:49:03.479488','28','Order 28 by Soheil Daliri (Online)',3,'',14,1),(209,'2024-09-12 05:49:03.483534','29','Order 29 by Soheil Daliri (Online)',3,'',14,1),(210,'2024-09-12 05:49:03.491751','30','Order 30 by Soheil Daliri (Online)',3,'',14,1),(211,'2024-09-12 05:49:03.497632','31','Order 31 by Soheil Daliri (Online)',3,'',14,1),(212,'2024-09-12 05:49:03.502904','32','Order 32 by Soheil Daliri (Online)',3,'',14,1),(213,'2024-09-12 05:49:03.515260','33','Order 33 by Soheil Daliri (Online)',3,'',14,1),(214,'2024-09-12 05:49:03.521757','34','Order 34 by Soheil Daliri (Online)',3,'',14,1),(215,'2024-09-12 05:49:03.528468','35','Order 35 by Soheil Daliri (Online)',3,'',14,1),(216,'2024-09-12 05:49:56.767737','38','Order 38 by Mansour Hadfmand (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af x 2\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 x 2\"}}]',14,1),(217,'2024-09-12 05:51:33.409000','39','Order 39 by Hamed Gholami (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u067e\\u067e\\u0631\\u0648\\u0646\\u06cc x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u06a9\\u0648\\u06a9\\u0627 \\u06a9\\u0648\\u0644\\u0627 x 1\"}}]',14,1),(218,'2024-09-12 06:18:19.210827','45','Order 45 by Hamed Gholami (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 x 2\"}}]',14,1),(219,'2024-09-12 06:18:33.037830','40','Order 40 by Soheil Daliri (Online)',3,'',14,1),(220,'2024-09-12 06:18:33.045834','41','Order 41 by Soheil Daliri (Online)',3,'',14,1),(221,'2024-09-12 06:18:33.051839','42','Order 42 by Soheil Daliri (Online)',3,'',14,1),(222,'2024-09-12 06:18:33.060729','43','Order 43 by Soheil Daliri (Online)',3,'',14,1),(223,'2024-09-12 06:18:33.065985','44','Order 44 by Soheil Daliri (Online)',3,'',14,1),(224,'2024-09-12 06:21:07.647677','46','Order 46 by Hamed Gholami (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u06cc\\u0644\\u0647 \\u0627\\u0633\\u062a\\u0631\\u06cc\\u067e\\u0633 \\u0633\\u0648\\u062e\\u0627\\u0631\\u06cc \\u0686\\u0647\\u0627\\u0631 \\u062a\\u06cc\\u06a9\\u0647 x 1\"}}]',14,1),(225,'2024-09-12 06:21:29.598361','47','Order 47 by Milad Mohammadi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0641\\u06cc\\u0644\\u0647 \\u0645\\u0631\\u063a x 1\"}}]',14,1),(226,'2024-09-12 06:22:04.247691','48','Order 48 by Afsaneh Shamshad (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0686\\u0644\\u0648 \\u0628\\u0631\\u06af x 1\"}}]',14,1),(227,'2024-09-12 06:23:32.922725','49','Order 49 by Ahad Saravi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0633\\u0627\\u0644\\u0627\\u062f \\u0633\\u0632\\u0627\\u0631 x 1\"}}]',14,1),(228,'2024-09-15 14:45:37.666744','50','Order 50 by Soheil Daliri (Online)',3,'',14,1),(229,'2024-09-15 14:45:37.673169','51','Order 51 by Soheil Daliri (Online)',3,'',14,1),(230,'2024-09-15 14:45:37.678212','52','Order 52 by Soheil Daliri (Online)',3,'',14,1),(231,'2024-09-15 14:45:37.683227','58','Order 58 by Soheil Daliri (Online)',3,'',14,1),(232,'2024-09-15 14:45:37.688509','59','Order 59 by Soheil Daliri (Online)',3,'',14,1),(233,'2024-09-15 14:45:37.693645','61','Order 61 by Soheil Daliri (Online)',3,'',14,1),(234,'2024-09-15 14:45:37.698644','62','Order 62 by Soheil Daliri (Online)',3,'',14,1),(235,'2024-09-15 14:45:37.703645','63','Order 63 by Soheil Daliri (Online)',3,'',14,1),(236,'2024-09-15 14:45:37.707819','64','Order 64 by Soheil Daliri (Online)',3,'',14,1),(237,'2024-09-15 14:45:37.712455','65','Order 65 by Soheil Daliri (Online)',3,'',14,1),(238,'2024-09-15 14:45:37.717495','66','Order 66 by Soheil Daliri (Online)',3,'',14,1),(239,'2024-09-15 14:46:10.827709','109','Order 109 by Ahad Saravi (In-Person)',1,'[{\"added\": {}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u067e\\u06cc\\u062a\\u0632\\u0627 \\u0627\\u0633\\u0646\\u06cc\\u06a9 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0647\\u0645\\u0628\\u0631\\u06af\\u0631 x 1\"}}, {\"added\": {\"name\": \"Order Item\", \"object\": \"\\u0641\\u0627\\u0646\\u062a\\u0627 x 1\"}}]',14,1),(240,'2024-09-16 05:51:57.241849','1','0gS3cMsdbP has 10 off, from 2024-08-31 13:08:46+00:00 to 2024-08-31 20:30:00+00:00',2,'[{\"changed\": {\"fields\": [\"Being Active\"]}}]',10,1),(241,'2024-09-16 05:51:57.253018','2','yuXbqhSbUk has 25 off, from 2024-08-31 13:10:11+00:00 to 2024-09-29 20:30:00+00:00',2,'[{\"changed\": {\"fields\": [\"Being Active\"]}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'authtoken','token'),(9,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(10,'main','discount'),(12,'main','food'),(11,'main','foodcategory'),(13,'main','gallery'),(18,'main','holiday'),(14,'main','order'),(15,'main','orderitem'),(16,'main','reservation'),(17,'main','review'),(5,'sessions','session'),(6,'users','customuser'),(19,'users','inpersoncustomer'),(7,'users','userprofile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-05 16:27:58.036782'),(2,'contenttypes','0002_remove_content_type_name','2024-08-05 16:27:58.181186'),(3,'auth','0001_initial','2024-08-05 16:27:58.498861'),(4,'auth','0002_alter_permission_name_max_length','2024-08-05 16:27:58.583803'),(5,'auth','0003_alter_user_email_max_length','2024-08-05 16:27:58.594109'),(6,'auth','0004_alter_user_username_opts','2024-08-05 16:27:58.608672'),(7,'auth','0005_alter_user_last_login_null','2024-08-05 16:27:58.626214'),(8,'auth','0006_require_contenttypes_0002','2024-08-05 16:27:58.632213'),(9,'auth','0007_alter_validators_add_error_messages','2024-08-05 16:27:58.647478'),(10,'auth','0008_alter_user_username_max_length','2024-08-05 16:27:58.662271'),(11,'auth','0009_alter_user_last_name_max_length','2024-08-05 16:27:58.679185'),(12,'auth','0010_alter_group_name_max_length','2024-08-05 16:27:58.712685'),(13,'auth','0011_update_proxy_permissions','2024-08-05 16:27:58.728788'),(14,'auth','0012_alter_user_first_name_max_length','2024-08-05 16:27:58.751521'),(15,'users','0001_initial','2024-08-05 16:27:59.188267'),(16,'admin','0001_initial','2024-08-05 16:27:59.364769'),(17,'admin','0002_logentry_remove_auto_add','2024-08-05 16:27:59.379055'),(18,'admin','0003_logentry_add_action_flag_choices','2024-08-05 16:27:59.400963'),(19,'authtoken','0001_initial','2024-08-05 16:27:59.507876'),(20,'authtoken','0002_auto_20160226_1747','2024-08-05 16:27:59.574630'),(21,'authtoken','0003_tokenproxy','2024-08-05 16:27:59.581624'),(22,'authtoken','0004_alter_tokenproxy_options','2024-08-05 16:27:59.595170'),(23,'sessions','0001_initial','2024-08-05 16:27:59.666219'),(24,'users','0002_alter_customuser_activation_code_and_more','2024-08-06 06:53:51.937726'),(25,'users','0003_alter_customuser_options_alter_userprofile_options_and_more','2024-08-06 12:13:19.228893'),(26,'users','0004_alter_customuser_user_type','2024-08-07 06:24:50.612499'),(27,'users','0005_alter_customuser_user_type','2024-08-07 07:17:56.974407'),(28,'users','0006_alter_userprofile_gender','2024-08-08 11:58:11.026553'),(29,'main','0001_initial','2024-08-31 08:39:12.719083'),(30,'users','0007_alter_customuser_activation_code_and_more','2024-08-31 08:39:13.067082'),(31,'main','0002_alter_order_payment_method_and_more','2024-08-31 09:20:44.886956'),(32,'main','0003_alter_orderitem_options_and_more','2024-08-31 11:24:55.933699'),(33,'main','0004_holiday_reservation_order_status_reservation_price','2024-09-01 09:15:50.893480'),(34,'main','0005_alter_holiday_options_alter_order_payment_method_and_more','2024-09-04 07:12:22.864705'),(35,'main','0006_alter_orderitem_price','2024-09-04 09:29:27.408355'),(36,'main','0007_alter_order_created_at_alter_order_total_amount','2024-09-04 10:21:31.915947'),(37,'users','0008_inpersoncustomer','2024-09-04 13:38:14.237199'),(38,'main','0008_remove_order_user_order_in_person_customer_and_more','2024-09-04 13:38:14.584099'),(39,'main','0009_remove_orderitem_price_orderitem_grand_total_and_more','2024-09-04 16:40:02.174403'),(40,'users','0009_alter_inpersoncustomer_phone','2024-09-04 16:40:02.185404'),(41,'main','0010_alter_discount_code_alter_discount_percentage_and_more','2024-09-16 05:39:29.748781'),(42,'main','0011_order_discount_amount','2024-09-16 07:08:18.951347');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('16jxnjt0t5se2nk2bij3k708txcecnak','.eJxVjMsOwiAUBf-FtSHlDS7d9xvIBS5SNZCUdmX8d2nShW5n5pw38bBvxe8dV78kciWCXH5ZgPjEeoj0gHpvNLa6rUugR0JP2-ncEr5uZ_t3UKCXsTaOJXAyCOuitEazqJELPsjErQSGLGIGQA2jcJCU00yErLPikzRGkc8X0Zc3Vw:1siqnt:V-HwSj4TjSLoZ1QaDiVBDS70wH-ewy6eMW6XFCeKNHU','2024-09-10 07:39:49.707737'),('1neuuhaeltu0ucxj3wshiegx46egbfmq','.eJxVjMsOwiAUBf-FtSHlDS7d9xvIBS5SNZCUdmX8d2nShW5n5pw38bBvxe8dV78kciWCXH5ZgPjEeoj0gHpvNLa6rUugR0JP2-ncEr5uZ_t3UKCXsTaOJXAyCOuitEazqJELPsjErQSGLGIGQA2jcJCU00yErLPikzRGkc8X0Zc3Vw:1sbEkh:juZRHq8kQ6lU1Grb4CTInnPgiQVaLYxlL-hbHpy6AQI','2024-08-20 07:37:03.096140'),('by6t3q7tmjzar9en25dq7eu7qol6idky','.eJxVjDsOwjAQBe_iGlnr39qmpOcM1jre4ABypDipEHeHSCmgfTPzXiLRtta0dV7SVMRZKHH63TIND247KHdqt1kOc1uXKctdkQft8joXfl4O9--gUq_fGuwYDFpmm40rhrXCyJ4CB0blgYpXESx4RDTamuwslIijj0hOcwbx_gDBNTa_:1sbEAv:8MlXuw1QGPKKxI4tfht-2MT6VedrslquaFifmbkaCt8','2024-08-20 07:00:05.980410'),('gleynkc0iadgu8wxu8mfjva40m23etut','.eJxVjDsOwjAQBe_iGlnr39qmpOcM1jre4ABypDipEHeHSCmgfTPzXiLRtta0dV7SVMRZKHH63TIND247KHdqt1kOc1uXKctdkQft8joXfl4O9--gUq_fGuwYDFpmm40rhrXCyJ4CB0blgYpXESx4RDTamuwslIijj0hOcwbx_gDBNTa_:1so1LJ:Bq0pfPeT8nikdw4ykqt2pZEN31sK4IISLucUOm78GlM','2024-09-24 13:55:41.266462'),('rm8yxezl35ertu1i8cz9v2nb958ha8n2','.eJxVjDsOwjAQBe_iGlnr39qmpOcM1jre4ABypDipEHeHSCmgfTPzXiLRtta0dV7SVMRZKHH63TIND247KHdqt1kOc1uXKctdkQft8joXfl4O9--gUq_fGuwYDFpmm40rhrXCyJ4CB0blgYpXESx4RDTamuwslIijj0hOcwbx_gDBNTa_:1siqlc:pokgdGQefymcpJ1KlOeO-CImqeRB92wnAeqUQDWH0sI','2024-09-10 07:37:28.822837');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_discount`
--

DROP TABLE IF EXISTS `main_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `percentage` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `expiry_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `main_discou_code_6ace07_idx` (`code`),
  KEY `main_discou_is_acti_2d2847_idx` (`is_active`),
  KEY `main_discou_start_d_515b67_idx` (`start_date`),
  KEY `main_discou_expiry__7c9851_idx` (`expiry_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_discount`
--

LOCK TABLES `main_discount` WRITE;
/*!40000 ALTER TABLE `main_discount` DISABLE KEYS */;
INSERT INTO `main_discount` VALUES (1,'0gS3cMsdbP',10,1,'2024-08-31 13:08:46.000000','2024-08-31 20:30:00.000000'),(2,'yuXbqhSbUk',25,1,'2024-08-31 13:10:11.000000','2024-09-29 20:30:00.000000'),(3,'gn4s4QzXgL',15,0,'2024-08-31 13:13:17.000000','2024-09-30 20:30:00.000000');
/*!40000 ALTER TABLE `main_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_food`
--

DROP TABLE IF EXISTS `main_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_food` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `food` varchar(100) NOT NULL,
  `price` int unsigned NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `ingredient` longtext,
  `is_active` tinyint(1) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `main_food_food_72515a_idx` (`food`),
  KEY `main_food_categor_7adc01_idx` (`category_id`),
  KEY `main_food_price_416d07_idx` (`price`),
  KEY `main_food_slug_3a62d9_idx` (`slug`),
  CONSTRAINT `main_food_category_id_a8f58e4e_fk_main_foodcategory_id` FOREIGN KEY (`category_id`) REFERENCES `main_foodcategory` (`id`),
  CONSTRAINT `main_food_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_food`
--

LOCK TABLES `main_food` WRITE;
/*!40000 ALTER TABLE `main_food` DISABLE KEYS */;
INSERT INTO `main_food` VALUES (1,'سالاد شیرازی',15000,'salad-shirazi','',1,'images/foods/salad/38725b28-df7b-485b-939d-556d9d13d936.png','2024-08-31 12:17:14.294115','2024-08-31 12:17:14.294115',4),(2,'سالاد سزار',170000,'salad-sezar','',1,'images/foods/salad/01023684-2940-43ce-816f-30af2dfd8963.png','2024-08-31 12:20:02.072651','2024-08-31 12:20:02.072651',4),(3,'آب معدنی',20000,'mineral-water','',1,'images/foods/drinks/b6682a8b-3efb-4e33-8de7-26a766a14102.png','2024-08-31 12:25:38.834185','2024-08-31 12:25:38.834185',10),(4,'کوکا کولا',30000,'coca-cola','',1,'images/foods/drinks/eb36a754-6797-4d38-ad69-c43b37601ee8.png','2024-08-31 12:26:12.465472','2024-08-31 12:26:12.466773',10),(5,'فانتا',25000,'fanta','',1,'images/foods/drinks/d85bb627-1f2f-490a-a7c9-73e8b7716ddf.png','2024-08-31 12:27:02.821792','2024-08-31 12:27:02.821792',10),(6,'چلو کباب کوبیده',220000,'kebab',NULL,1,'images/foods/persian-food/61d1428a-c963-4107-b738-3e44953b7d0d.png','2024-08-31 12:30:17.149282','2024-08-31 12:30:17.150281',9),(7,'جوجه کباب',190000,'chiken-kebab',NULL,1,'images/foods/persian-food/ae4468dd-41e2-40f0-ad7d-185f363f419f.png','2024-08-31 12:30:49.780114','2024-08-31 12:30:49.780114',9),(8,'چلو برگ',300000,'barg-kebab',NULL,1,'images/foods/persian-food/ee0d936e-0246-44b5-a0ec-c624d7e0e17c.png','2024-08-31 12:31:48.836116','2024-08-31 12:31:48.836116',9),(9,'چلو کباب وزیری',200000,'vaziri-kebab',NULL,1,'images/foods/persian-food/e85c1090-7b97-4f04-b8b0-16838ba3391d.png','2024-08-31 12:32:29.188280','2024-08-31 12:32:29.188280',9),(10,'ژامبون مرغ تنوری',170000,'coldcuts',NULL,1,'images/foods/sandwich/c16dabe6-fb1c-4ffc-94e3-4c9477bbf016.png','2024-08-31 12:33:33.691546','2024-08-31 12:33:33.691546',5),(11,'هات داگ مخصوص',180000,'hotdog',NULL,1,'images/foods/sandwich/da333595-8103-4cee-8863-2d49ca0ed36b.png','2024-08-31 12:34:13.438331','2024-08-31 12:34:13.438331',5),(12,'همبرگر',130000,'hamburger',NULL,1,'images/foods/sandwich/1764db3b-4666-467c-853e-06f01cd266e1.png','2024-08-31 12:34:51.257355','2024-08-31 12:34:51.257355',5),(13,'چیز برگر',200000,'cheeseburger',NULL,1,'images/foods/sandwich/b697ad8a-05ae-4341-ae1e-fb5563523501.png','2024-08-31 12:35:27.741514','2024-08-31 12:35:27.741514',5),(14,'پیتزا فیله مرغ',270000,'pizza-chiken',NULL,1,'images/foods/pizza/696f649c-0118-4a2d-acf3-ffe6f01af5c8.png','2024-08-31 12:36:07.854607','2024-08-31 12:36:07.854607',6),(15,'پیتزا پنجره ای مخصوص',290000,'pizza-special',NULL,1,'images/foods/pizza/efea4997-a724-4877-b148-04d60e3a8e89.png','2024-08-31 12:36:37.164583','2024-08-31 12:36:37.165584',6),(16,'پیتزا پپرونی',260000,'pizza-pepperoni',NULL,1,'images/foods/pizza/0bd1d276-c26a-4d42-81e6-ff1c25b7002e.png','2024-08-31 12:37:18.514502','2024-08-31 12:37:18.514502',6),(17,'پیتزا اسنیک',310000,'pizza-steak',NULL,1,'images/foods/pizza/28f8394e-4977-42a6-8f64-bab5bf121ad3.png','2024-08-31 12:37:59.037344','2024-08-31 12:37:59.037479',6),(18,'پیتزا مارگاریتا',160000,'pizza-margarita',NULL,1,'images/foods/pizza/b31c5b8f-613b-4006-a55e-acbbba1ed37f.png','2024-08-31 12:38:41.458103','2024-08-31 12:38:41.458103',6),(19,'فیله استریپس سوخاری چهار تیکه',270000,'fried-chiken-4',NULL,1,'images/foods/fried_food/59d3c3f8-a907-4997-aa5a-2b0fe4a7131d.png','2024-08-31 12:40:37.473002','2024-08-31 12:40:37.473002',7),(20,'فیله استریپس سوخاری شش تیکه',330000,'fried-chiken-6',NULL,1,'images/foods/fried_food/87731a35-64bc-4eab-bda4-74a35cf0a20a.png','2024-08-31 12:41:10.354132','2024-08-31 12:41:10.354132',7),(21,'سوشی',410000,'sushi',NULL,1,'images/foods/seafood/1e70fc22-d721-429b-8a46-6ac926867429.png','2024-08-31 12:41:50.642375','2024-08-31 12:41:50.642375',8),(22,'چلو ماهی سالمون',320000,'salmon',NULL,1,'images/foods/seafood/1dcf49db-2518-4ef1-8e3b-1346012607c3.png','2024-08-31 12:42:22.048897','2024-08-31 12:42:22.049442',8);
/*!40000 ALTER TABLE `main_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_foodcategory`
--

DROP TABLE IF EXISTS `main_foodcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_foodcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `main_foodca_categor_5d4ef1_idx` (`category`),
  KEY `main_foodca_parent__ab3820_idx` (`parent_id`),
  KEY `main_foodca_slug_71ba76_idx` (`slug`),
  CONSTRAINT `main_foodcategory_parent_id_349df411_fk_main_foodcategory_id` FOREIGN KEY (`parent_id`) REFERENCES `main_foodcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_foodcategory`
--

LOCK TABLES `main_foodcategory` WRITE;
/*!40000 ALTER TABLE `main_foodcategory` DISABLE KEYS */;
INSERT INTO `main_foodcategory` VALUES (1,'پیش غذا','appetizer','images/categories/پیش غذا/a066c583-ba7d-45a6-bd8a-048fdd0e0f20.jfif',NULL),(2,'غذای اصلی','main-course','images/categories/غذای اصلی/0146cce8-de75-4f9b-b8ea-34404b00236a.jfif',NULL),(3,'دسر','dessert','images/categories/دسر/fe4c1cc2-28a8-4f15-a5ae-67f8701f977c.png',NULL),(4,'سالاد','salad','images/categories/سالاد/3dfde964-fe74-4cb4-9bca-31da11e1af11.webp',1),(5,'ساندویچ','sandwich','images/categories/ساندویچ/ddf459f9-adf9-47af-9a60-27cfbeb4d9e0.png',2),(6,'پیتزا','pizza','images/categories/پیتزا/4aab710a-445d-4973-ab04-1039617de4c4.webp',2),(7,'سوخاری','fried_food','images/categories/سوخاری/057b9faf-4332-4ffe-bdef-7a3c73d897b7.jfif',2),(8,'غذای دریایی','seafood','images/categories/غذای دریایی/052f228c-36b1-4d72-8540-74cf6f901eed.png',2),(9,'غذای ایرانی','persian-food','images/categories/غذای ایرانی/de84885b-347a-4a78-a38f-61823fc476f1.jfif',2),(10,'نوشیدنی','drinks','images/categories/نوشیدنی/994fb933-8d9b-47a0-b82a-7abe6437cb89.png',NULL);
/*!40000 ALTER TABLE `main_foodcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_gallery`
--

DROP TABLE IF EXISTS `main_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_gallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `gallery_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_gallery_gallery_id_e2e91eff_fk_main_food_id` (`gallery_id`),
  CONSTRAINT `main_gallery_gallery_id_e2e91eff_fk_main_food_id` FOREIGN KEY (`gallery_id`) REFERENCES `main_food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_gallery`
--

LOCK TABLES `main_gallery` WRITE;
/*!40000 ALTER TABLE `main_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_holiday`
--

DROP TABLE IF EXISTS `main_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_holiday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_holiday`
--

LOCK TABLES `main_holiday` WRITE;
/*!40000 ALTER TABLE `main_holiday` DISABLE KEYS */;
INSERT INTO `main_holiday` VALUES (1,'2024-09-02','prophet Muhammad martyrdom'),(2,'2024-09-04','Imam Reza martyrdom'),(3,'2024-09-12','Imam Hassan Askari martyrdom');
/*!40000 ALTER TABLE `main_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_order`
--

DROP TABLE IF EXISTS `main_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_type` varchar(10) NOT NULL,
  `payment_method` varchar(15) NOT NULL,
  `payment_status` varchar(10) NOT NULL,
  `total_amount` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `in_person_customer_id` bigint DEFAULT NULL,
  `online_customer_id` bigint DEFAULT NULL,
  `discount_amount` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_order_in_person_customer_i_d1a8643b_fk_users_inp` (`in_person_customer_id`),
  KEY `main_order_online_customer_id_849c1db7_fk_users_customuser_id` (`online_customer_id`),
  KEY `main_order_order_t_015705_idx` (`order_type`),
  KEY `main_order_payment_e2f9fd_idx` (`payment_method`),
  KEY `main_order_payment_940ff1_idx` (`payment_status`),
  KEY `main_order_created_a818a5_idx` (`created_at`),
  CONSTRAINT `main_order_in_person_customer_i_d1a8643b_fk_users_inp` FOREIGN KEY (`in_person_customer_id`) REFERENCES `users_inpersoncustomer` (`id`),
  CONSTRAINT `main_order_online_customer_id_849c1db7_fk_users_customuser_id` FOREIGN KEY (`online_customer_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `main_order_chk_1` CHECK ((`total_amount` >= 0)),
  CONSTRAINT `main_order_chk_2` CHECK ((`discount_amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_order`
--

LOCK TABLES `main_order` WRITE;
/*!40000 ALTER TABLE `main_order` DISABLE KEYS */;
INSERT INTO `main_order` VALUES (6,'in_person','cash','completed',850000,'2024-09-04 16:46:21.852169',2,NULL,0),(7,'in_person','cash','completed',1000000,'2024-09-06 07:56:17.062520',2,NULL,0),(8,'online','online','completed',625000,'2024-09-05 07:56:17.062520',NULL,5,0),(9,'in_person','cash','completed',930000,'2024-09-08 06:21:13.777796',3,NULL,0),(10,'in_person','cash','completed',335000,'2024-09-08 08:30:40.453403',1,NULL,0),(11,'in_person','credit_card','completed',360000,'2024-09-08 08:32:53.002320',4,NULL,0),(15,'in_person','credit_card','completed',630000,'2024-09-08 08:57:05.638011',5,NULL,0),(16,'in_person','credit_card','completed',1350000,'2024-09-08 12:44:28.750766',6,NULL,0),(37,'in_person','credit_card','completed',400000,'2024-09-12 05:48:36.080643',4,NULL,0),(38,'in_person','credit_card','completed',650000,'2024-09-12 05:49:56.708108',2,NULL,0),(39,'in_person','cash','completed',290000,'2024-09-12 05:51:33.348563',4,NULL,0),(45,'in_person','credit_card','completed',620000,'2024-09-12 06:18:19.145766',4,NULL,0),(46,'in_person','cash','completed',270000,'2024-09-12 06:21:07.625171',4,NULL,0),(47,'in_person','credit_card','completed',270000,'2024-09-12 06:21:29.570322',3,NULL,0),(48,'in_person','cash','completed',300000,'2024-09-12 06:22:04.218780',6,NULL,0),(49,'in_person','credit_card','completed',480000,'2024-09-12 06:23:32.877792',5,NULL,0),(103,'online','online','completed',255000,'2024-09-15 14:12:00.360542',NULL,1,0),(104,'online','online','completed',580000,'2024-09-15 14:14:44.962936',NULL,1,0),(105,'online','online','completed',580000,'2024-09-15 14:26:25.699255',NULL,1,0),(106,'online','online','completed',580000,'2024-09-15 14:28:03.465252',NULL,1,0),(107,'online','online','completed',250000,'2024-09-15 14:30:29.526034',NULL,1,0),(108,'online','online','completed',250000,'2024-09-15 14:32:30.764582',NULL,1,0),(109,'in_person','cash','completed',465000,'2024-09-15 14:46:10.799877',5,NULL,0),(110,'online','online','completed',225000,'2024-09-16 05:54:26.415613',NULL,1,0),(111,'online','online','completed',250000,'2024-09-16 05:55:30.699329',NULL,1,0),(112,'online','online','completed',225000,'2024-09-16 06:02:23.713799',NULL,1,0),(113,'online','online','completed',415000,'2024-09-16 06:08:02.680989',NULL,1,0),(114,'online','online','completed',311250,'2024-09-16 06:15:27.475185',NULL,1,0),(115,'online','online','completed',311250,'2024-09-16 06:32:46.378051',NULL,1,0),(116,'online','online','completed',311250,'2024-09-16 06:39:49.402608',NULL,1,0),(117,'online','online','completed',415000,'2024-09-16 06:45:18.718625',NULL,1,0),(118,'online','online','completed',311250,'2024-09-16 06:46:43.057331',NULL,1,0),(121,'online','online','completed',311250,'2024-09-16 07:13:34.804294',NULL,1,103750),(122,'online','online','completed',311250,'2024-09-16 07:17:30.191409',NULL,1,103750),(123,'online','online','completed',311250,'2024-09-16 07:18:19.655894',NULL,1,103750),(124,'online','online','completed',311250,'2024-09-16 07:19:40.586652',NULL,1,103750),(125,'online','online','completed',415000,'2024-09-16 07:20:04.829597',NULL,1,0),(136,'online','online','completed',311250,'2024-09-16 09:03:41.593732',NULL,1,103750),(137,'online','online','completed',311250,'2024-09-16 09:05:09.998693',NULL,1,103750),(138,'online','online','completed',311250,'2024-09-16 10:00:06.611876',NULL,1,103750);
/*!40000 ALTER TABLE `main_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_orderitem`
--

DROP TABLE IF EXISTS `main_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL,
  `food_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `grand_total` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_orderi_food_id_30bc99_idx` (`food_id`),
  KEY `main_orderi_order_i_fcf220_idx` (`order_id`),
  CONSTRAINT `main_orderitem_food_id_f650b677_fk_main_food_id` FOREIGN KEY (`food_id`) REFERENCES `main_food` (`id`),
  CONSTRAINT `main_orderitem_order_id_72ea9725_fk_main_order_id` FOREIGN KEY (`order_id`) REFERENCES `main_order` (`id`),
  CONSTRAINT `main_orderitem_chk_1` CHECK ((`quantity` >= 0)),
  CONSTRAINT `main_orderitem_chk_2` CHECK ((`grand_total` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_orderitem`
--

LOCK TABLES `main_orderitem` WRITE;
/*!40000 ALTER TABLE `main_orderitem` DISABLE KEYS */;
INSERT INTO `main_orderitem` VALUES (16,2,14,6,540000),(17,1,6,6,220000),(18,3,4,6,90000),(19,1,8,7,300000),(20,2,17,7,620000),(21,2,5,7,50000),(22,1,4,7,30000),(23,2,8,8,600000),(24,1,5,8,25000),(25,1,17,9,310000),(26,1,7,9,190000),(27,1,8,9,300000),(28,3,1,9,45000),(29,1,5,9,25000),(30,2,4,9,60000),(31,1,17,10,310000),(32,1,5,10,25000),(33,1,13,11,200000),(34,1,12,11,130000),(35,1,4,11,30000),(37,1,13,15,200000),(38,2,11,15,360000),(39,1,3,15,20000),(40,2,5,15,50000),(41,2,12,16,260000),(42,1,17,16,310000),(43,3,9,16,600000),(44,6,4,16,180000),(45,1,19,37,270000),(46,1,12,37,130000),(47,2,8,38,600000),(48,2,5,38,50000),(49,1,16,39,260000),(50,1,4,39,30000),(51,1,14,45,270000),(52,1,8,45,300000),(53,2,5,45,50000),(54,1,19,46,270000),(55,1,14,47,270000),(56,1,8,48,300000),(57,1,17,49,310000),(58,1,2,49,170000),(59,2,4,103,60000),(60,1,5,103,25000),(61,1,10,103,170000),(62,2,7,104,380000),(63,1,9,104,200000),(64,2,7,105,380000),(65,1,9,105,200000),(66,2,7,106,380000),(67,1,9,106,200000),(68,1,10,107,170000),(69,4,3,107,80000),(70,1,10,108,170000),(71,4,3,108,80000),(72,1,17,109,310000),(73,1,12,109,130000),(74,1,5,109,25000),(75,1,10,110,170000),(76,4,3,110,80000),(77,1,10,111,170000),(78,4,3,111,80000),(79,1,10,112,170000),(80,4,3,112,80000),(81,3,5,113,75000),(82,2,2,113,340000),(83,3,5,114,75000),(84,2,2,114,340000),(85,3,5,115,75000),(86,2,2,115,340000),(87,3,5,116,75000),(88,2,2,116,340000),(89,3,5,117,75000),(90,2,2,117,340000),(91,3,5,118,75000),(92,2,2,118,340000),(97,3,5,121,75000),(98,2,2,121,340000),(99,3,5,122,75000),(100,2,2,122,340000),(101,3,5,123,75000),(102,2,2,123,340000),(103,3,5,124,75000),(104,2,2,124,340000),(105,3,5,125,75000),(106,2,2,125,340000),(127,3,5,136,75000),(128,2,2,136,340000),(129,3,5,137,75000),(130,2,2,137,340000),(131,3,5,138,75000),(132,2,2,138,340000);
/*!40000 ALTER TABLE `main_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_reservation`
--

DROP TABLE IF EXISTS `main_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_reservation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_of_people` int NOT NULL,
  `number_of_tables` int NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `reservation_date` datetime(6) NOT NULL,
  `description` longtext,
  `is_approved` tinyint(1) NOT NULL,
  `approved_date` datetime(6) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `order_status` varchar(10) NOT NULL,
  `price` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_reserv_user_id_3227e1_idx` (`user_id`),
  KEY `main_reserv_start_d_efb48e_idx` (`start_date`),
  KEY `main_reserv_end_dat_b005c0_idx` (`end_date`),
  KEY `main_reserv_number__6f02f8_idx` (`number_of_tables`),
  KEY `main_reserv_is_appr_90c495_idx` (`is_approved`),
  KEY `main_reserv_order_s_7b647f_idx` (`order_status`),
  CONSTRAINT `main_reservation_user_id_968659fe_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `main_reservation_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_reservation`
--

LOCK TABLES `main_reservation` WRITE;
/*!40000 ALTER TABLE `main_reservation` DISABLE KEYS */;
INSERT INTO `main_reservation` VALUES (16,2,1,'2024-09-01 16:49:18.000000','2024-09-01 17:49:24.000000','2024-09-01 14:49:29.240922','',1,'2024-09-01 14:49:45.293131',8,'approved',50083),(17,7,2,'2024-09-01 15:00:13.000000','2024-09-01 17:50:30.000000','2024-09-01 14:50:36.873397','',1,'2024-09-01 14:50:44.842341',2,'approved',283805),(18,21,9,'2024-09-01 15:30:00.000000','2024-09-01 20:00:00.000000','2024-09-01 14:53:00.427516','',1,'2024-09-01 14:53:11.698066',4,'approved',2025000),(29,2,1,'2024-09-03 12:40:00.000000','2024-09-03 15:40:05.000000','2024-09-03 11:40:15.490869','',1,'2024-09-03 11:40:34.361168',14,'approved',150069),(30,2,1,'2024-09-03 13:30:00.000000','2024-09-03 18:30:00.000000','2024-09-03 11:44:49.170906','',1,'2024-09-03 11:45:11.317206',1,'approved',250000),(31,7,2,'2024-09-08 13:30:00.000000','2024-09-08 19:00:00.000000','2024-09-08 12:49:15.371916','',0,NULL,8,'pending',550000),(32,6,2,'2024-09-10 16:00:00.000000','2024-09-10 19:00:00.000000','2024-09-10 14:18:57.336459',NULL,0,NULL,1,'pending',300000);
/*!40000 ALTER TABLE `main_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_review`
--

DROP TABLE IF EXISTS `main_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `review` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `food_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_review_admin_id_e96d72d6_fk_users_customuser_id` (`admin_id`),
  KEY `main_review_food_id_ec154c51_fk_main_food_id` (`food_id`),
  KEY `main_review_parent_id_076181c3_fk_main_review_id` (`parent_id`),
  KEY `main_review_user_id_ee71ed52_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `main_review_admin_id_e96d72d6_fk_users_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `main_review_food_id_ec154c51_fk_main_food_id` FOREIGN KEY (`food_id`) REFERENCES `main_food` (`id`),
  CONSTRAINT `main_review_parent_id_076181c3_fk_main_review_id` FOREIGN KEY (`parent_id`) REFERENCES `main_review` (`id`),
  CONSTRAINT `main_review_user_id_ee71ed52_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_review`
--

LOCK TABLES `main_review` WRITE;
/*!40000 ALTER TABLE `main_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES (1,'pbkdf2_sha256$720000$0tGZkiH2iU2JXRFegDiKTo$Te/J42WkX2nkVZAurIRIR2qjTZCt9Ga1PLYrrTuDrmg=','2024-09-10 13:55:41.249211','Soheil','Daliri','soheil.dalirii@gmail.com','',1,1,1,'backend','2024-08-06 06:54:50.835731'),(2,'pbkdf2_sha256$720000$D54j4x7BDe18JUNYc0axlF$kJCMc2oiRjfbFKlPunSnmWTMur3VeAcTp2w4n5+Izas=',NULL,'Sosha','Parsa','sosha@gmail.com','',1,1,1,'backend','2024-08-06 06:57:41.924426'),(3,'pbkdf2_sha256$720000$5tfabVl4x2KSbeyl09NXss$EQAFWEVcT1jC7MZ96+2StAWqGaD4OZfNWdPeQ+lR0V8=','2024-08-27 07:39:49.698210','Sahar','Ghenaati','sahar@gmail.com','',1,1,0,'admin','2024-08-06 06:58:50.868994'),(4,'pbkdf2_sha256$720000$1OWVoCQY1cA4gYug7o2AX8$MK/BdzDIGPZ68WjlQKH0o6+dLmgYU8Wl8qrShVmadis=',NULL,'rana','farhadi','rana@gmail.com','',1,1,0,'admin','2024-08-07 12:08:20.270954'),(5,'pbkdf2_sha256$720000$VtJ6TVBMVhTKgiHlsqFtEJ$64126Jjl4RPD4CgxOyWVrEEGU+3p/38Tlzl9R1Ng3gY=',NULL,'hirad','haghparast','hirad@gmail.com','',1,0,0,'client','2024-08-07 12:09:30.910042'),(6,'pbkdf2_sha256$720000$keOsBguB66jEeVOnIFZLud$YGYQHok7+tzJHkVoEEG9u46ffn9wnI2hDJCeLYpV8HI=',NULL,'sobhan','saadat','sobhan@gmail.com','',1,0,0,'client','2024-08-07 12:10:40.124847'),(7,'pbkdf2_sha256$720000$2eHDLq3PxWUfwZawBPSZMS$kOV0rw5aPiTVRE1Y5Nsha9wS4mbsinzWtPaijUwlJI0=',NULL,'roham','younesi','roham@gmail.com','',0,0,0,'client','2024-08-08 06:29:30.537803'),(8,'pbkdf2_sha256$720000$SxlfCC1yrsHLtADArKjH9M$6KtQD3lyaSIQhxbPYckxhz5H1PXWnoMhyHaa7dQP/uQ=',NULL,'sara','aghdasi','sara.aghdasi@gmail.com','',1,0,0,'client','2024-08-08 07:24:51.980598'),(9,'pbkdf2_sha256$720000$Jv3DCCbL0VdqwYFGZApceQ$bkfNox+YVB2RQWMyVT0R+41XIEdDSFox4izjYzdPDC0=',NULL,'ghasem','rezaei','ghasem@gmail.com','',1,0,0,'client','2024-08-08 07:28:29.715814'),(10,'pbkdf2_sha256$720000$TrzlEJvKKk6WXtqT0ZB5st$z1kpN5p+SB6OnV7G8QRjjxaSNcZvUpt6jUJadNa70oU=',NULL,'sahar','dashti','sahar_dash@gmail.com','',1,0,0,'client','2024-08-08 12:48:22.993158'),(11,'pbkdf2_sha256$720000$DjOgrGNE5Ucxz0gn4sVhxq$5jyogL480pBHnCaoVDFgjmxdDVji+swEA0Zt2wS37A8=',NULL,'hoda','ramezani','hoda@gmail.com','',1,0,0,'client','2024-08-08 12:51:09.094913'),(12,'pbkdf2_sha256$720000$jinnLbFvvgMmjQ0UinAicw$FofddLmGa5Atlk47U0xkVJ5VczTQMV9hFT/7CL6Ma5A=',NULL,'Mahor','Soroush','mahor@gmail.com','',0,0,0,'client','2024-08-08 12:55:11.852016'),(13,'pbkdf2_sha256$720000$usEjNDsFGpcEmm3RWueQPq$YQbB8rkKQ0bHWN3PkxAyU/QY7fYaSDpPxIMZQIexVVw=',NULL,'Rosha','Rahmani','rosha@gmail.com','',1,0,0,'client','2024-08-08 13:03:20.672136'),(14,'pbkdf2_sha256$720000$B3WvtsbbJZrXUpN9HlLE2T$vVVvbD3Xyx9Fj5rnxBVVlytlBkhoxg7suduBrzcRu14=',NULL,'Ahmad','Alizadeh','ahmad@gmail.com','',1,0,0,'client','2024-08-09 06:06:53.463488'),(15,'pbkdf2_sha256$720000$gCC8ePujSCG3n80sAVntby$zJNwdm/NC1gBTdUZ3DPloCjcPcvgJmrW01ER8sthJt0=',NULL,'Hoda','Mardani','hodaMardani@gmail.com','',0,0,0,'client','2024-08-27 15:27:58.771906');
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
INSERT INTO `users_customuser_user_permissions` VALUES (1,3,21),(2,3,22),(3,3,23),(4,3,24),(5,3,25),(6,3,26),(7,3,27),(8,3,28),(9,4,21),(10,4,22),(11,4,23),(12,4,24),(13,4,25),(14,4,26),(15,4,27),(16,4,28);
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_inpersoncustomer`
--

DROP TABLE IF EXISTS `users_inpersoncustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_inpersoncustomer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_inpersoncustomer`
--

LOCK TABLES `users_inpersoncustomer` WRITE;
/*!40000 ALTER TABLE `users_inpersoncustomer` DISABLE KEYS */;
INSERT INTO `users_inpersoncustomer` VALUES (1,'Sahar','Manafi','09128282123','2024-09-04 13:58:57.254319'),(2,'Mansour','Hadfmand','09357164239','2024-09-04 14:00:12.263206'),(3,'Milad','Mohammadi','09386123452','2024-09-08 06:20:29.398995'),(4,'Hamed','Gholami','09124567212','2024-09-08 08:32:51.507279'),(5,'Ahad','Saravi','09128121620','2024-09-08 08:56:34.631679'),(6,'Afsaneh','Shamshad','09355122581','2024-09-08 12:42:48.963315');
/*!40000 ALTER TABLE `users_inpersoncustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `bio` longtext,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_userprofile_user_id_87251ef1_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'09123469239','male','full-stack developer','','2024-08-28 08:50:17.037538',1);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-19 18:08:51
