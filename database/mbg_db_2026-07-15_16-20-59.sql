-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mbg_db
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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `status` enum('draft','published') DEFAULT 'draft',
  `is_featured` tinyint(1) DEFAULT '0',
  `views` int unsigned DEFAULT '0',
  `reading_time` int unsigned DEFAULT '1',
  `author_id` bigint unsigned DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `category` (`category`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `published_at` (`published_at`),
  KEY `fk_articles_category` (`category_id`),
  CONSTRAINT `fk_articles_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,6,'Nasib MBG','nasib-mbg','articles/01KXJH0CFT6QA32X44X6KW8855.jpg','tentang nasib mbg kedepan','<p>Nasib mbg menjadi perihatin</p>',NULL,'published',0,1,1,NULL,'2026-07-15 16:16:18','2026-07-15 02:16:28','2026-07-15 02:16:28');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiaries`
--

DROP TABLE IF EXISTS `beneficiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiaries`
--

LOCK TABLES `beneficiaries` WRITE;
/*!40000 ALTER TABLE `beneficiaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiary_categories`
--

DROP TABLE IF EXISTS `beneficiary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiary_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiary_categories`
--

LOCK TABLES `beneficiary_categories` WRITE;
/*!40000 ALTER TABLE `beneficiary_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `description` text,
  `icon` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT 'primary',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (5,'Kesehatan','kesehatan','tentang kesehatan','kesehatan','#a6d2ff',1,'2026-07-13 02:22:40','2026-07-13 02:22:40'),(6,'mbg','mbg','tentang mbg','mbg','#36f01f',1,'2026-07-15 02:12:35','2026-07-15 02:12:35'),(7,'Gizi','gizi','tentang gizi','gizi','#19d1cc',1,'2026-07-15 02:17:25','2026-07-15 02:17:25');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmation_photos`
--

DROP TABLE IF EXISTS `confirmation_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmation_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmation_photos`
--

LOCK TABLES `confirmation_photos` WRITE;
/*!40000 ALTER TABLE `confirmation_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmation_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmations`
--

DROP TABLE IF EXISTS `confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `confirmations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmations`
--

LOCK TABLES `confirmations` WRITE;
/*!40000 ALTER TABLE `confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributions`
--

DROP TABLE IF EXISTS `distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2026_06_19_035544_create_sppgs_table',1),(6,'2026_06_19_035551_create_beneficiaries_table',1),(7,'2026_06_19_035558_create_beneficiary_categories_table',1),(8,'2026_06_19_035603_create_menus_table',1),(9,'2026_06_19_035608_create_distributions_table',1),(10,'2026_06_19_035613_create_confirmations_table',1),(11,'2026_06_19_035619_create_confirmation_photos_table',1),(12,'2026_06_19_035623_create_feedback_table',1),(13,'2026_06_19_081712_create_reviews_table',2),(14,'2026_07_13_070235_create_profiles_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'mbg-token','516c78f0f600b5342be6db9fd5ded02e6c5796af22405c496327935924ae4677','[\"*\"]',NULL,NULL,'2026-06-18 23:39:14','2026-06-18 23:39:14'),(2,'App\\Models\\User',1,'mbg-token','83d9bb53e25b57e8ee38b05c6969d78c79d0a4a3a617994eef212a81129106d3','[\"*\"]',NULL,NULL,'2026-06-18 23:39:33','2026-06-18 23:39:33'),(3,'App\\Models\\User',2,'mbg-token','b71cc7f21807d57bae8d8e43274371c2f9742cc8fe71c1479f32a7194483ce05','[\"*\"]',NULL,NULL,'2026-07-12 21:43:23','2026-07-12 21:43:23'),(4,'App\\Models\\User',2,'mbg-token','b396d188751f6bf3b0d43b6c6cb5dc8dabf76280513564a943540be7374cb410','[\"*\"]',NULL,NULL,'2026-07-12 23:37:26','2026-07-12 23:37:26'),(5,'App\\Models\\User',2,'mbg-token','f4262ece0537f967580db147d0911787bc0f7501836efa1103f816f431b6806b','[\"*\"]',NULL,NULL,'2026-07-12 23:38:07','2026-07-12 23:38:07'),(6,'App\\Models\\User',9,'mbg-mobile','473208eebdab700a6b837f4f63cde9ecf10af79a033663982a7a925ceb611bd0','[\"*\"]',NULL,NULL,'2026-07-13 00:43:45','2026-07-13 00:43:45'),(7,'App\\Models\\User',9,'mbg-mobile','5b59b9f3d47b7d1519fbe654ad913b555c85ee7c278a29bee432f3025849f726','[\"*\"]',NULL,NULL,'2026-07-13 00:43:51','2026-07-13 00:43:51'),(8,'App\\Models\\User',9,'mbg-mobile','083491ee57c709996d4eb3bab7951d072c71e4f87cc6f4e6b15ac78cc20275ce','[\"*\"]',NULL,NULL,'2026-07-13 00:44:17','2026-07-13 00:44:17'),(9,'App\\Models\\User',9,'mbg-mobile','5b1e3560258942eafdd9c5b6443e57b53f71b0aac9e87c2b32442723d4145b58','[\"*\"]',NULL,NULL,'2026-07-13 00:46:25','2026-07-13 00:46:25'),(10,'App\\Models\\User',9,'mbg-mobile','980604d49bb494d404331bd7b413cdb967d2d570391314e5f48605822d50b6a7','[\"*\"]',NULL,NULL,'2026-07-13 00:53:47','2026-07-13 00:53:47'),(11,'App\\Models\\User',9,'mbg-mobile','2b6d48456c84f939793665d4d17a67bdf51421109a970dc8a7928bee2a0bd476','[\"*\"]',NULL,NULL,'2026-07-13 01:10:02','2026-07-13 01:10:02'),(12,'App\\Models\\User',9,'mbg-mobile','5a1a368e6b9299c58cd5e605eda8b04dd5edc797942bde2bd0e466a459a5795a','[\"*\"]',NULL,NULL,'2026-07-13 01:12:12','2026-07-13 01:12:12'),(13,'App\\Models\\User',9,'mbg-mobile','e3e50f33d834cf8f30ff67ed11b90a6fe7f774454908567b65b820f8e825546a','[\"*\"]',NULL,NULL,'2026-07-13 01:12:56','2026-07-13 01:12:56'),(14,'App\\Models\\User',9,'mbg-mobile','37d6a37cad313d454e41d163c159b90566004e627c72823affe84a60b29da840','[\"*\"]',NULL,NULL,'2026-07-13 01:36:29','2026-07-13 01:36:29'),(15,'App\\Models\\User',9,'mbg-mobile','3648b9eb04b6620f57f9af692920411fb9c183d6c2158d5010a4255213c3ec7c','[\"*\"]',NULL,NULL,'2026-07-13 01:56:00','2026-07-13 01:56:00'),(16,'App\\Models\\User',9,'mbg-mobile','0cb8f3a944126636d5b92dfe9f222516cb576297be02569a077d22caf34b9843','[\"*\"]',NULL,NULL,'2026-07-14 20:01:45','2026-07-14 20:01:45'),(17,'App\\Models\\User',9,'mbg-mobile','4ef7a4b3bf6cbb0e8c2a564d2c7b129acde4fffe520e258d1732aee96c1211e9','[\"*\"]',NULL,NULL,'2026-07-14 20:04:07','2026-07-14 20:04:07'),(18,'App\\Models\\User',9,'mbg-mobile','d6e5c48244d29ad431a62be9be48aa6e1903b8bcb69b3654ac5d0abc7df10001','[\"*\"]',NULL,NULL,'2026-07-14 20:58:24','2026-07-14 20:58:24'),(19,'App\\Models\\User',9,'mbg-mobile','95a1410beb1aa208cd082a6aad418842b65e5817c6025e533f5812afe709509b','[\"*\"]',NULL,NULL,'2026-07-15 00:27:34','2026-07-15 00:27:34'),(20,'App\\Models\\User',9,'mbg-mobile','9ba2bc4e475b5d5e8b515deb5901a17e79fc8b276580078896c054eda49a6dda','[\"*\"]',NULL,NULL,'2026-07-15 00:54:14','2026-07-15 00:54:14'),(21,'App\\Models\\User',9,'mbg-mobile','149867b0360b1c579b3854120571b564ca4daaaa007272ac0cab43da73e5b9d7','[\"*\"]',NULL,NULL,'2026-07-15 01:05:26','2026-07-15 01:05:26'),(22,'App\\Models\\User',9,'mbg-mobile','ebb9448158f2079d113b51bb9829b72335041c4a6a246e05898ffa4a8354a23c','[\"*\"]','2026-07-15 01:18:27',NULL,'2026-07-15 01:17:43','2026-07-15 01:18:27'),(23,'App\\Models\\User',9,'mbg-mobile','ea8a77dc07d9e3e91f230c2eef6342bb1a7fe627c485c9dc3b6e98ea2b1e3d3b','[\"*\"]','2026-07-15 01:35:44',NULL,'2026-07-15 01:18:57','2026-07-15 01:35:44'),(24,'App\\Models\\User',9,'mbg-mobile','db4f9895d52a27aa8b9e8273ae2bc1184b1e92a73768cc8e8ac56f6622e68016','[\"*\"]','2026-07-15 02:05:42',NULL,'2026-07-15 01:39:38','2026-07-15 02:05:42'),(25,'App\\Models\\User',9,'mbg-mobile','79728e794fb930e4864e9a79d9110d5deded878338cd5a21e7d4b529d49aa626','[\"*\"]','2026-07-15 02:13:23',NULL,'2026-07-15 02:06:05','2026-07-15 02:13:23'),(26,'App\\Models\\User',9,'mbg-mobile','c08d9728f5303379f348780b2da18e09ce244c672f55652d13395abcc60c1c8f','[\"*\"]',NULL,NULL,'2026-07-15 02:07:27','2026-07-15 02:07:27'),(27,'App\\Models\\User',9,'mbg-mobile','25f8272f0c20412db1cec7c1b5fc8833018abf3c678ebc58f88c3350a0aa1fbf','[\"*\"]',NULL,NULL,'2026-07-15 02:07:41','2026-07-15 02:07:41');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_type` enum('pregnant','toddler_parent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_nik_unique` (`nik`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (2,9,'Tarub','2026-07-15','female','pregnant','333333','profile/ZmQR99GfNp52x8djLksZQajICXg8j8n2QUhJXBnp.jpg','2026-07-13 00:29:24','2026-07-15 02:13:23');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppgs`
--

DROP TABLE IF EXISTS `sppgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sppgs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppgs`
--

LOCK TABLES `sppgs` WRITE;
/*!40000 ALTER TABLE `sppgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sppgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super_admin','admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Super Admin','superadmin@example.com','08123456789','$2y$12$7b2xKYiU.zZXMeqiVtur0.1fwPCNwC8QCXCiaNMEU8yFzj6ph9urm','super_admin','active','2026-06-24 23:38:27','2026-06-25 01:11:13'),(4,'admin','admin@example.com',NULL,'$2y$12$lWiAG4qY2sAIJUbQiNpwqufgK0Y.uu0DB3JyUPmwzSCZzMpmvap5C','admin','inactive','2026-06-25 00:14:06','2026-06-25 00:14:06'),(5,'Vita','vita@example.com',NULL,'$2y$12$850iVarqv9ErnbQA.81VtuPIT0JmfatP5ekx.7LseNrNj03L6Rcfm','user','inactive','2026-06-25 00:15:09','2026-06-25 00:15:09'),(9,'Vita Dhea','vitadhea@example.com','082123456789','$2y$12$SXE0oC3Iyk.paFCQoRXA/.RpyL.XgoYi4uOA1uiYJJanH2d3NXpnq','user','active','2026-07-13 00:29:24','2026-07-15 01:21:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mbg_db'
--

--
-- Dumping routines for database 'mbg_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-15 16:20:59
