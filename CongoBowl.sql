-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: congobowl
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `contenu` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `auteur_id` int NOT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `statut` varchar(10) NOT NULL DEFAULT 'brouillon',
  `categorie_id` int NOT NULL,
  `prix` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `auteur_id` (`auteur_id`),
  KEY `categorie_id` (`categorie_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE,
  CONSTRAINT `article_chk_1` CHECK ((`statut` in (_utf8mb4'brouillon',_utf8mb4'publie')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (2,'Poulet Mayo','poulet-mayo','poulet + mayo = miam','images/poulet-mayo.jpg',1,'2025-01-17 11:05:10','2025-01-17 11:05:10','publie',2,NULL),(3,'Pastel','pastel','pastel + thon = miam','images/Pastel.png',1,'2025-01-19 21:22:52','2025-01-19 21:22:52','publie',3,NULL),(4,'Mikate','mikate','Mikate = miam','images/mikate.png',1,'2025-01-19 21:22:52','2025-01-19 21:22:52','publie',4,NULL),(5,'Bowl Poulet','bowl-poulet','Bowl + poulet = miam','images/bowlpoulet.png',1,'2025-01-19 21:22:52','2025-01-19 21:22:52','publie',5,NULL),(6,'Bowl Agneau','bowl-agneau','Bowl + Agneau = miam','images/bowlagneau.png',1,'2025-01-19 21:22:52','2025-01-19 21:22:52','publie',6,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlescomandes`
--

DROP TABLE IF EXISTS `articlescomandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articlescomandes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `commande_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_id` (`article_id`),
  KEY `commande_id` (`commande_id`),
  CONSTRAINT `articlescomandes_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `articlescomandes_ibfk_2` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlescomandes`
--

LOCK TABLES `articlescomandes` WRITE;
/*!40000 ALTER TABLE `articlescomandes` DISABLE KEYS */;
INSERT INTO `articlescomandes` VALUES (1,2,1),(2,6,1);
/*!40000 ALTER TABLE `articlescomandes` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add utilisateur',7,'add_utilisateur'),(26,'Can change utilisateur',7,'change_utilisateur'),(27,'Can delete utilisateur',7,'delete_utilisateur'),(28,'Can view utilisateur',7,'view_utilisateur');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (2,'Viande de Poulet','viande-de-poulet','Poulet pris en cgarge par nos meilleurs fermiers'),(3,'Pastel','Thon','Délicieux beignets farcis de une garniture savoureuse à base de thon'),(4,'Mikate','Mikate','Délicieux beignets'),(5,'Bowl Poulet','Bowl-Poulet','Délicieux bowl composé de riz, madesu(haricot rouge),poulet'),(6,'Bowl Agneau ','Bowl-Agneau','Délicieux bowl composé de riz, madesu(haricot rouge),Agneau');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `statut` varchar(20) NOT NULL DEFAULT 'non paye',
  `utilisateur_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk` (`utilisateur_id`),
  CONSTRAINT `fk` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `commande_chk_1` CHECK ((`statut` in (_utf8mb4'non paye',_utf8mb4'en livraison',_utf8mb4'livre')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'non paye',1);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
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
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'CongoBowl','utilisateur'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-23 23:41:30.861013'),(2,'auth','0001_initial','2024-11-23 23:41:32.036390'),(3,'admin','0001_initial','2024-11-23 23:41:32.254924'),(4,'admin','0002_logentry_remove_auto_add','2024-11-23 23:41:32.267970'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-23 23:41:32.283723'),(6,'contenttypes','0002_remove_content_type_name','2024-11-23 23:41:32.417988'),(7,'auth','0002_alter_permission_name_max_length','2024-11-23 23:41:32.524289'),(8,'auth','0003_alter_user_email_max_length','2024-11-23 23:41:32.563061'),(9,'auth','0004_alter_user_username_opts','2024-11-23 23:41:32.577295'),(10,'auth','0005_alter_user_last_login_null','2024-11-23 23:41:32.686715'),(11,'auth','0006_require_contenttypes_0002','2024-11-23 23:41:32.692312'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-23 23:41:32.703983'),(13,'auth','0008_alter_user_username_max_length','2024-11-23 23:41:32.792049'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-23 23:41:32.902027'),(15,'auth','0010_alter_group_name_max_length','2024-11-23 23:41:32.931510'),(16,'auth','0011_update_proxy_permissions','2024-11-23 23:41:32.949228'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-23 23:41:33.088719'),(18,'sessions','0001_initial','2024-11-23 23:41:33.153332');
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
INSERT INTO `django_session` VALUES ('4cukw7jeyfblc35j5rh75x23s3my8ija','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tZEtb:0URgFMXEsHQ9Jum3MMj_OcenzNgQqEs78YLphOtnO9Q','2025-01-18 20:54:15.460550'),('5opqkak9zhnztl87fqsdm64tcc4indzf','.eJxdzb0OgjAYheF7adhkKGARSVyMqKi4YPhbmiqfsSpS-doEY7x3WfWM7zOcNzFa3iUKDabjCsHULQmJIPYPNK3mNXAlEGFgdbzVZ5fjRbjMt4IJHWY13TJzmZfn8Y6yJMXpPG3Z1or2QeSoTd8Hz3w1WhdQ7ct87JVqMT2so3NQFeUy3iTXJotmf6-yJqFjE4lcGH2Bh5anAYaoOwM24QiIsn1w6JXsXiT0fEo_X0kwRsA:1tYjyq:43FdF9KWGAoDAeZRj2hyG6V4SFOtion9LPUHAxWCgc8','2025-01-17 11:53:36.571883'),('6dlv1wqxxsiolob4sxkjqyuigny7jo9o','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tYlga:cxO12HYrZjT3F9ZPmdF2tOrGspRvSvIUSri9MNyj71w','2025-01-17 13:42:52.917762'),('a1js32lk23r41tjugywuj1t70iuaon8e','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tZZUX:KfSnXw06vnQoJGbGTrYth-0bJser26K68z9hWF8InQI','2025-01-19 18:53:45.048628'),('f8hu8lmqzk0rnmw5toyiy3f56g0wnxvz','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tZaYb:tY5Oh41DSHX0bUboptUHwiYAbIKyZ1lIgZG7-twOMA0','2025-01-19 20:02:01.878711'),('ho31yq1oucy0n623oovb4mmyfb8pp4al','.eJyrViotyczJLE4sSS0tii8oTi1NyVeyUkosKlHSQZHKzS-JT0mNL0gsLk4FKihIyk5JM4ovzkg0MjVTsTA3AAKVKrMcTyf_9OxKr8qUpEAf80gLv3BDQ5UA0yzPfIt0o9DEyMDCgjLXkvwAzyiDjMok45BKb5-wXCO3IL_MnGLT0khHWzRbM1OUrMxqAcbbOKg:1tJK04:0BXtiBlZnZmk6Eg212i5HRR2tbbKLMsFRCZoqG9i9Cs','2024-12-19 22:07:08.529333'),('hvj48wwi3offpwyohod72nvi45vlssfe','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tZd0L:C4HnIxrKInML_63llYBc4X1ywDkotfGrZqIt_zjUSp0','2025-01-19 22:38:49.638729'),('jl6bbqeunbjomy9avhf27w7to782jbfv','.eJxVyTEKgDAMBdC7_LlDRXDoZUKxAQPSliYBRby7XV3fe-Amp2g29kFd2UtDQkb4hRSkJUCUstvB1WSfMdGGcwApq0qrxFeXcSOtW4zvByxLIWY:1tYmfG:RLVMH0nI3lKF96XjJVfAzHxBVjOpRj3ZeSUB6jHfc70','2025-01-17 14:45:34.207948'),('sirzj12mvsyd5ocy41ds1tutpetasqyc','e30:1tGciO:Ioc5EL9vBT1FTXl14UIe3_jTia1T9s4VNOMCKk9xLZo','2024-12-12 11:29:44.119860');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  `date_inscription` datetime DEFAULT CURRENT_TIMESTAMP,
  `droits_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'aa','a','a@mail.fr','a','pbkdf2_sha256$870000$1f7Hf3nIClVm88zxRrlAfG$O91aeh+jYGNP5B/w3Q86ywjP+Mzz9+6LPfCknswkCbI=','2024-12-26 21:41:43',0),(2,'a','a','99@mail.fr','b','pbkdf2_sha256$870000$cW0hXCiP7w7E5321IrQVrI$J3KybRk0kS54uymuZ5ukuT09W8HcZ8kFjfHincUJXE8=','2024-12-26 21:58:34',0),(3,'a','a','a@gmail.com','z','pbkdf2_sha256$870000$mrFV253WWIL05MSs9BSo5K$EN8E1pJxx8qWG+HXeZNYW43YpD9THEf8ZXYFIJMjmVE=','2025-01-17 10:22:37',0);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-19 23:13:47
