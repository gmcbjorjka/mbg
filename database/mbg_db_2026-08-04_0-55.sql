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
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `published_at` (`published_at`),
  KEY `fk_articles_category` (`category_id`),
  CONSTRAINT `fk_articles_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (2,6,'Nasib MBG Kian Memprihatinkan','nasib-mbg-kian-memprihatinkan','articles/01KYFFW1ZT3ZRXT81X0G6JGSEK.jpg','tentang nasib mbg kedepan','<h1>Nasib MBG Semakin Memprihatinkan</h1><p>Program Makan Bergizi Gratis (MBG) diharapkan menjadi salah satu langkah strategis untuk meningkatkan kualitas gizi masyarakat, khususnya anak-anak sekolah. Program ini membawa harapan besar dalam upaya menekan angka stunting, meningkatkan kesehatan, serta mendukung proses belajar melalui pemenuhan kebutuhan gizi yang lebih baik.</p><p>Namun, dalam pelaksanaannya, berbagai tantangan mulai menjadi perhatian. Di sejumlah daerah, muncul laporan mengenai keterlambatan distribusi makanan, keterbatasan sarana pendukung, hingga kendala koordinasi antar pihak yang terlibat. Kondisi tersebut menyebabkan sebagian penerima manfaat belum dapat merasakan layanan secara optimal.</p><p>Selain itu, aspek pengawasan kualitas makanan juga menjadi hal yang penting. Menu yang disajikan perlu memenuhi standar gizi, diproses secara higienis, dan didistribusikan tepat waktu agar manfaat program benar-benar dirasakan oleh para penerima. Evaluasi yang berkelanjutan menjadi kunci agar setiap kendala dapat segera diperbaiki.</p><p>Di sisi lain, keberhasilan MBG juga sangat bergantung pada sinergi antara pemerintah, penyedia makanan, sekolah, tenaga kesehatan, dan masyarakat. Transparansi dalam pengelolaan anggaran serta keterbukaan informasi mengenai pelaksanaan program dapat meningkatkan kepercayaan publik sekaligus mendorong partisipasi berbagai pihak dalam mengawasi jalannya program.</p><p>Harapan masyarakat tentu sederhana: program yang dirancang untuk meningkatkan kualitas gizi anak bangsa dapat berjalan sesuai tujuan. Setiap tantangan yang muncul seharusnya menjadi bahan evaluasi untuk memperkuat sistem, bukan mengurangi komitmen dalam memberikan layanan terbaik kepada penerima manfaat.</p><p>Pada akhirnya, keberhasilan Program Makan Bergizi Gratis tidak hanya diukur dari banyaknya makanan yang dibagikan, tetapi juga dari kualitas pelaksanaannya, pemerataan manfaat, serta dampaknya terhadap kesehatan dan masa depan generasi Indonesia. Dengan evaluasi dan perbaikan yang berkesinambungan, MBG diharapkan mampu menjadi program yang efektif, tepat sasaran, dan memberi manfaat nyata bagi masyarakat.</p><p><br></p>','published',0,8,1,NULL,'2026-07-15 16:16:18','2026-07-15 02:16:28','2026-07-31 22:53:12'),(3,5,'Pentingnya Menjaga Kesehatan Ibu Hamil untuk Masa Depan Ibu dan Buah Hati','pentingnya-menjaga-kesehatan-ibu-hamil-untuk-masa-depan-ibu-dan-buah-hati','articles/01KYFFQ34SPFP214NVA33PAW9C.jpg','artikel tentang ibu hamil','<h2>Pendahuluan</h2><p>Kehamilan merupakan masa yang sangat penting dalam kehidupan seorang perempuan. Selama kurang lebih sembilan bulan, tubuh ibu mengalami berbagai perubahan untuk mendukung pertumbuhan dan perkembangan janin. Oleh karena itu, menjaga kesehatan ibu hamil menjadi hal yang sangat penting agar ibu tetap sehat, proses kehamilan berjalan lancar, serta bayi dapat lahir dalam kondisi sehat dan optimal.</p><h2>Mengapa Kesehatan Ibu Hamil Sangat Penting?</h2><p>Kesehatan ibu hamil tidak hanya berpengaruh pada kondisi ibu, tetapi juga menentukan tumbuh kembang janin di dalam kandungan. Ibu yang mendapatkan asupan gizi yang cukup, rutin memeriksakan kehamilan, serta menerapkan pola hidup sehat memiliki peluang lebih besar untuk melahirkan bayi dengan berat badan normal dan kondisi kesehatan yang baik.</p><p>Sebaliknya, jika kesehatan ibu tidak terjaga, risiko terjadinya berbagai komplikasi seperti anemia, hipertensi dalam kehamilan, diabetes gestasional, persalinan prematur, hingga bayi lahir dengan berat badan rendah dapat meningkat.</p><h2>Cara Menjaga Kesehatan Selama Kehamilan</h2><h3>1. Mengonsumsi Makanan Bergizi Seimbang</h3><p>Ibu hamil membutuhkan nutrisi yang lebih banyak dibandingkan sebelum hamil. Konsumsilah makanan yang mengandung:</p><ul><li>Karbohidrat sebagai sumber energi.</li><li>Protein untuk pertumbuhan janin.</li><li>Sayur dan buah yang kaya vitamin serta mineral.</li><li>Susu atau produk olahan susu sebagai sumber kalsium.</li><li>Makanan yang mengandung zat besi dan asam folat untuk mencegah anemia dan mendukung perkembangan otak janin.</li></ul><p>Hindari makanan mentah, makanan tinggi gula, serta makanan yang mengandung bahan pengawet berlebihan.</p><h3>2. Rutin Melakukan Pemeriksaan Kehamilan (ANC)</h3><p>Pemeriksaan antenatal care (ANC) secara rutin membantu tenaga kesehatan memantau kondisi ibu dan janin. Melalui pemeriksaan ini, berbagai masalah kesehatan dapat dideteksi lebih awal sehingga dapat segera ditangani.</p><p>Pemeriksaan biasanya meliputi:</p><ul><li>Pengukuran tekanan darah.</li><li>Pemeriksaan berat badan.</li><li>Pemeriksaan denyut jantung janin.</li><li>Pemeriksaan laboratorium jika diperlukan.</li><li>Konsultasi mengenai perkembangan kehamilan.</li></ul><h3>3. Mengonsumsi Vitamin Sesuai Anjuran</h3><p>Dokter atau bidan biasanya memberikan suplemen seperti:</p><ul><li>Asam folat.</li><li>Tablet tambah darah (zat besi).</li><li>Kalsium.</li><li>Vitamin D apabila diperlukan.</li></ul><p>Vitamin ini berperan penting dalam mendukung pertumbuhan janin sekaligus menjaga kesehatan ibu.</p><h3>4. Berolahraga Ringan</h3><p>Aktivitas fisik ringan seperti berjalan kaki, yoga khusus ibu hamil, atau senam hamil dapat membantu:</p><ul><li>Melancarkan sirkulasi darah.</li><li>Mengurangi nyeri punggung.</li><li>Menjaga berat badan tetap ideal.</li><li>Mempermudah proses persalinan.</li></ul><p>Lakukan olahraga sesuai rekomendasi tenaga kesehatan.</p><h3>5. Istirahat yang Cukup</h3><p>Tubuh ibu hamil memerlukan waktu istirahat yang lebih banyak. Tidur selama 7–9 jam setiap malam dan beristirahat saat merasa lelah dapat membantu menjaga stamina dan kesehatan selama kehamilan.</p><h3>6. Menjaga Kesehatan Mental</h3><p>Perubahan hormon dapat memengaruhi suasana hati ibu hamil. Dukungan dari suami, keluarga, maupun lingkungan sekitar sangat penting untuk menjaga kesehatan mental. Jika merasa cemas atau stres berkepanjangan, jangan ragu berkonsultasi dengan tenaga kesehatan.</p><h3>7. Menghindari Kebiasaan Berisiko</h3><p>Ibu hamil sebaiknya menghindari:</p><ul><li>Merokok.</li><li>Mengonsumsi minuman beralkohol.</li><li>Menggunakan narkoba.</li><li>Mengonsumsi obat tanpa anjuran dokter.</li><li>Paparan asap rokok dan bahan kimia berbahaya.</li></ul><p>Kebiasaan tersebut dapat meningkatkan risiko gangguan perkembangan janin.</p><h2>Tanda Bahaya yang Perlu Diwaspadai</h2><p>Segera periksakan diri ke fasilitas kesehatan apabila mengalami:</p><ul><li>Perdarahan dari jalan lahir.</li><li>Nyeri perut hebat.</li><li>Demam tinggi.</li><li>Air ketuban keluar sebelum waktunya.</li><li>Gerakan janin berkurang.</li><li>Sakit kepala berat disertai pandangan kabur dan pembengkakan.</li></ul><p>Penanganan yang cepat dapat mencegah komplikasi yang lebih serius.</p><h2>Peran Keluarga dalam Mendukung Kehamilan</h2><p>Menjaga kesehatan ibu hamil bukan hanya tanggung jawab ibu, tetapi juga keluarga. Suami dan anggota keluarga dapat memberikan dukungan dengan:</p><ul><li>Mengingatkan jadwal pemeriksaan kehamilan.</li><li>Membantu menyiapkan makanan bergizi.</li><li>Memberikan dukungan emosional.</li><li>Membantu pekerjaan rumah agar ibu tidak terlalu lelah.</li><li>Menemani saat kontrol ke fasilitas kesehatan.</li></ul><p>Dukungan keluarga yang baik dapat membuat ibu merasa lebih nyaman dan percaya diri selama menjalani kehamilan.</p><h2>Kesimpulan</h2><p>Menjaga kesehatan ibu hamil merupakan investasi penting bagi kesehatan ibu dan masa depan anak. Pola makan bergizi, pemeriksaan kehamilan secara rutin, olahraga ringan, istirahat yang cukup, serta dukungan keluarga menjadi kunci utama untuk menciptakan kehamilan yang sehat. Dengan perhatian dan perawatan yang tepat, risiko komplikasi dapat diminimalkan sehingga ibu dapat menjalani kehamilan dengan nyaman dan bayi memiliki kesempatan tumbuh serta lahir dalam kondisi terbaik.</p><p><br></p>','published',0,9,1,2,'2026-07-16 08:07:49','2026-07-15 18:07:53','2026-07-26 08:35:00');
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
  `distribution_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `rating` tinyint DEFAULT NULL,
  `kritik` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `status` enum('menunggu','diterima','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'menunggu',
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_confirmation_user` (`user_id`),
  CONSTRAINT `fk_confirmation_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmations`
--

LOCK TABLES `confirmations` WRITE;
/*!40000 ALTER TABLE `confirmations` DISABLE KEYS */;
INSERT INTO `confirmations` VALUES (2,3,9,5,'aaaa','confirmations/YNUXokBYrFJ19KEd0lBC0bhAZBg3nvEkRZgQgpfX.jpg',0.00000000,0.00000000,'2026-07-20 03:52:48','diterima',NULL,'2026-07-19 20:52:48','2026-07-19 20:52:48'),(3,5,9,5,'test','confirmations/qPSiPLUUG07cSsdrXLoxjg1Mb9gk6fjMkVknbWjz.jpg',37.42199830,-122.08400000,'2026-07-22 04:33:02','diterima',NULL,'2026-07-21 21:33:02','2026-07-21 21:33:02'),(4,6,12,5,'enakkk','confirmations/zZ6mRwjQ6hEqrKoFDRZo3n1m7HAVjklYATrBezHr.jpg',-6.90751960,109.14798620,'2026-07-26 15:36:32','diterima',NULL,'2026-07-26 08:36:32','2026-07-26 08:36:32');
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
  `schedule_id` bigint unsigned DEFAULT NULL,
  `menu_id` bigint unsigned DEFAULT NULL,
  `jumlah_dikirim` int DEFAULT '0',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'persiapan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_distributions_schedule_id` (`schedule_id`),
  KEY `idx_distributions_menu_id` (`menu_id`),
  CONSTRAINT `fk_distributions_menu` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_distributions_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
INSERT INTO `distributions` VALUES (3,5,4,3000,'Paket 3000 MBG Ibu Hamil','dikirim','2026-07-16 20:41:38','2026-07-16 20:47:26'),(4,6,5,100,NULL,'dikirim','2026-07-17 02:08:46','2026-07-17 02:10:56'),(5,7,6,100,'Menuju Posyandu melati','dikirim','2026-07-21 20:37:28','2026-07-21 20:39:52'),(6,9,7,20,'posyandu melati','dikirim','2026-07-26 08:17:05','2026-07-26 08:23:26');
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
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `mbg_menu_benefits`
--

DROP TABLE IF EXISTS `mbg_menu_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbg_menu_benefits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mbg_menu_benefits_menu_id_foreign` (`menu_id`),
  CONSTRAINT `mbg_menu_benefits_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbg_menu_benefits`
--

LOCK TABLES `mbg_menu_benefits` WRITE;
/*!40000 ALTER TABLE `mbg_menu_benefits` DISABLE KEYS */;
INSERT INTO `mbg_menu_benefits` VALUES (8,4,'Ayam sebagai sumber protein',1,'2026-07-16 20:43:59','2026-07-16 20:43:59'),(9,4,'Nasi sebagai sumber karbohidrat',2,'2026-07-16 20:44:09','2026-07-16 20:44:09'),(10,4,'Jeruk sebagi sumber vitamin C',3,'2026-07-16 20:44:20','2026-07-16 20:44:20'),(11,5,'Ayam Sebagi sumber protein',1,'2026-07-17 02:10:41','2026-07-17 02:10:41'),(12,6,'Ayam sebagai sumber protein',1,'2026-07-21 20:39:27','2026-07-21 20:39:27'),(13,7,'Ayam sebagi sumber protein',1,'2026-07-26 08:22:04','2026-07-26 08:22:04'),(14,7,'Nasi Kuning sebagai sumber karbohidrat',2,'2026-07-26 08:22:21','2026-07-26 08:22:42'),(15,7,'Pisang sebagai sumber vitamin',3,'2026-07-26 08:22:30','2026-07-26 08:22:54');
/*!40000 ALTER TABLE `mbg_menu_benefits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbg_menu_items`
--

DROP TABLE IF EXISTS `mbg_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbg_menu_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mbg_menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `mbg_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbg_menu_items`
--

LOCK TABLES `mbg_menu_items` WRITE;
/*!40000 ALTER TABLE `mbg_menu_items` DISABLE KEYS */;
INSERT INTO `mbg_menu_items` VALUES (9,4,'Ayam Katsu','protein',1,'2026-07-16 20:42:33','2026-07-16 20:42:33'),(10,4,'Tempe','protein',2,'2026-07-16 20:42:45','2026-07-16 20:42:45'),(11,4,'Jeruk','buah',3,'2026-07-16 20:42:52','2026-07-16 20:42:52'),(12,4,'Nasi','karbohidrat',4,'2026-07-16 20:43:00','2026-07-16 20:43:00'),(13,5,'Ayam Katsu','protein',1,'2026-07-17 02:09:49','2026-07-17 02:09:49'),(14,5,'Jeruk','buah',2,'2026-07-17 02:09:57','2026-07-17 02:09:57'),(15,6,'Ayam Kecap','protein',1,'2026-07-21 20:38:00','2026-07-21 20:38:00'),(16,6,'Apel','buah',2,'2026-07-21 20:38:09','2026-07-21 20:38:09'),(17,6,'Nasi','karbohidrat',3,'2026-07-21 20:38:16','2026-07-21 20:38:16'),(18,7,'Nasi Kuning','karbohidrat',1,'2026-07-26 08:19:01','2026-07-26 08:19:01'),(19,7,'Ayam','protein',2,'2026-07-26 08:19:13','2026-07-26 08:19:13'),(20,7,'Sayuran','sayuran',3,'2026-07-26 08:19:22','2026-07-26 08:19:22'),(21,7,'Pisang','buah',4,'2026-07-26 08:19:35','2026-07-26 08:19:35'),(22,7,'Telor','protein',5,'2026-07-26 08:19:54','2026-07-26 08:19:54'),(23,7,'Susu ','minuman',6,'2026-07-26 08:20:06','2026-07-26 08:20:18');
/*!40000 ALTER TABLE `mbg_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbg_menu_nutritions`
--

DROP TABLE IF EXISTS `mbg_menu_nutritions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbg_menu_nutritions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mbg_menu_nutritions_menu_id_foreign` (`menu_id`),
  CONSTRAINT `mbg_menu_nutritions_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbg_menu_nutritions`
--

LOCK TABLES `mbg_menu_nutritions` WRITE;
/*!40000 ALTER TABLE `mbg_menu_nutritions` DISABLE KEYS */;
INSERT INTO `mbg_menu_nutritions` VALUES (8,4,'Kalori','550 kkal',1,'2026-07-16 20:43:21','2026-07-16 20:43:21'),(9,4,'Vitamin A','550 kkal',2,'2026-07-16 20:43:27','2026-07-16 20:43:27'),(10,4,'Protein','550 kkal',3,'2026-07-16 20:43:34','2026-07-16 20:43:34'),(11,5,'Protein','550 kkal',1,'2026-07-17 02:10:14','2026-07-17 02:10:14'),(12,5,'Kalori','550 kkal',2,'2026-07-17 02:10:25','2026-07-17 02:10:25'),(13,6,'Kalori','550 kkal',1,'2026-07-21 20:39:02','2026-07-21 20:39:02'),(14,6,'Protein','550 kkal',2,'2026-07-21 20:39:11','2026-07-21 20:39:11'),(15,7,'Protein','550 kkal',1,'2026-07-26 08:20:46','2026-07-26 08:21:35'),(16,7,'Karbohidrat','200 kkal',2,'2026-07-26 08:21:05','2026-07-26 08:21:05');
/*!40000 ALTER TABLE `mbg_menu_nutritions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mbg_menus`
--

DROP TABLE IF EXISTS `mbg_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mbg_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` bigint unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menu Hari Ini',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mbg_menus_schedule_id` (`schedule_id`),
  CONSTRAINT `fk_mbg_menus_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mbg_menus`
--

LOCK TABLES `mbg_menus` WRITE;
/*!40000 ALTER TABLE `mbg_menus` DISABLE KEYS */;
INSERT INTO `mbg_menus` VALUES (4,5,'2026-07-20','Menu Hari Ini','menus/01KXQ2P25C83PXDXKP1EY3QM9R.jpg','Menu sehat dengan gizi seimbang',1,'2026-07-16 20:41:38','2026-07-16 20:42:21'),(5,6,'2026-07-17','Menu Hari Ini','menus/01KXQND5WHQN9Y8YB3ZHDZF9J3.jpg','Menu Sehat',1,'2026-07-17 02:08:46','2026-07-17 02:09:33'),(6,7,'2026-07-22','Menu Hari Ini','menus/01KY3YF6J532EHFNTCNV1S9X72.jpg','Menu Sehat untuk balita dan ibu hamil',1,'2026-07-21 20:37:28','2026-07-21 20:38:50'),(7,9,'2026-07-26','Menu Hari Ini','menus/01KYFG3FK9F7JANNPN3F1Z6CX3.jpg','Menu Sehat dengan kandungan gizi seimbang',1,'2026-07-26 08:17:05','2026-07-26 08:18:39');
/*!40000 ALTER TABLE `mbg_menus` ENABLE KEYS */;
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2026_06_19_035544_create_sppgs_table',1),(6,'2026_06_19_035551_create_beneficiaries_table',1),(7,'2026_06_19_035558_create_beneficiary_categories_table',1),(8,'2026_06_19_035603_create_menus_table',1),(9,'2026_06_19_035608_create_distributions_table',1),(10,'2026_06_19_035613_create_confirmations_table',1),(11,'2026_06_19_035619_create_confirmation_photos_table',1),(12,'2026_06_19_035623_create_feedback_table',1),(13,'2026_06_19_081712_create_reviews_table',2),(14,'2026_07_13_070235_create_profiles_table',3),(15,'2026_07_16_030017_create_mbg_menus_table',4),(16,'2026_07_16_030056_create_mbg_menu_items_table',5),(17,'2026_07_16_030125_create_mbg_menu_nutritions_table',6),(18,'2026_07_16_030207_create_mbg_menu_benefits_table',7),(19,'2026_07_16_060325_create_schedules_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_otps`
--

DROP TABLE IF EXISTS `password_reset_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_otps` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `attempt` int DEFAULT '0',
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contact` (`contact`),
  KEY `idx_reset_token` (`reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_otps`
--

LOCK TABLES `password_reset_otps` WRITE;
/*!40000 ALTER TABLE `password_reset_otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_otps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'mbg-token','516c78f0f600b5342be6db9fd5ded02e6c5796af22405c496327935924ae4677','[\"*\"]',NULL,NULL,'2026-06-18 23:39:14','2026-06-18 23:39:14'),(2,'App\\Models\\User',1,'mbg-token','83d9bb53e25b57e8ee38b05c6969d78c79d0a4a3a617994eef212a81129106d3','[\"*\"]',NULL,NULL,'2026-06-18 23:39:33','2026-06-18 23:39:33'),(3,'App\\Models\\User',2,'mbg-token','b71cc7f21807d57bae8d8e43274371c2f9742cc8fe71c1479f32a7194483ce05','[\"*\"]',NULL,NULL,'2026-07-12 21:43:23','2026-07-12 21:43:23'),(4,'App\\Models\\User',2,'mbg-token','b396d188751f6bf3b0d43b6c6cb5dc8dabf76280513564a943540be7374cb410','[\"*\"]',NULL,NULL,'2026-07-12 23:37:26','2026-07-12 23:37:26'),(5,'App\\Models\\User',2,'mbg-token','f4262ece0537f967580db147d0911787bc0f7501836efa1103f816f431b6806b','[\"*\"]',NULL,NULL,'2026-07-12 23:38:07','2026-07-12 23:38:07'),(33,'App\\Models\\User',9,'mbg-mobile','18a2bd7c1905c05bbb7093f4ae34a3c6c267d9778a1c54cdfc250858c0f9478a','[\"*\"]','2026-07-22 00:20:39',NULL,'2026-07-21 23:31:14','2026-07-22 00:20:39'),(34,'App\\Models\\User',11,'mbg-mobile','3d2507cec085c324ced4db071fc559e3675c3cefccbf3284fd940c68718604f6','[\"*\"]','2026-07-22 00:27:15',NULL,'2026-07-22 00:25:16','2026-07-22 00:27:15'),(35,'App\\Models\\User',11,'mbg-mobile','a82bd70b9c88f7c6ccc33745049da6ebc9df44d32c285e2f9cab503f4681b1c6','[\"*\"]','2026-07-22 01:16:00',NULL,'2026-07-22 01:15:57','2026-07-22 01:16:00'),(36,'App\\Models\\User',12,'mbg-mobile','1475cdbc6a5dbe81dbeb595d0f2ed431537ec15f1629593e2c87a486cc5f7994','[\"*\"]','2026-07-31 22:54:18',NULL,'2026-07-26 08:25:31','2026-07-31 22:54:18'),(37,'App\\Models\\User',9,'mbg-mobile','d311a152b39841f29496f481fec9950ed115e53eb19ec1ba27d5fd926c3ff62a','[\"*\"]','2026-07-31 22:55:03',NULL,'2026-07-31 22:54:57','2026-07-31 22:55:03'),(38,'App\\Models\\User',9,'mbg-mobile','145365f491ec4ebe2502f7c13db00fab52cd0da128ba92e3f4550185728f2302','[\"*\"]','2026-07-31 23:27:45',NULL,'2026-07-31 23:23:10','2026-07-31 23:27:45'),(39,'App\\Models\\User',9,'mbg-mobile','611570eabbe5dd2ed84704c04ec13c77af01370f539125727cdaf7d4ce59bb2c','[\"*\"]','2026-07-31 23:38:55',NULL,'2026-07-31 23:35:39','2026-07-31 23:38:55'),(40,'App\\Models\\User',9,'mbg-mobile','086a94a566241fb90204381ac5462f8f2523cc67f84db54ac03b00b224d5985d','[\"*\"]','2026-08-03 04:57:37',NULL,'2026-07-31 23:43:02','2026-08-03 04:57:37');
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
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_type` enum('pregnant','toddler_parent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_nik_unique` (`nik`),
  KEY `profiles_user_id_foreign` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (2,9,'Tarub','2026-07-15','female','pregnant','333333','profile/ZmQR99GfNp52x8djLksZQajICXg8j8n2QUhJXBnp.jpg',NULL,NULL,NULL,'2026-07-01','2026-07-13 00:29:24','2026-08-03 06:36:41'),(3,10,'Tarub',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-07-15 18:31:32','2026-07-15 18:31:32'),(4,5,NULL,NULL,NULL,'pregnant',NULL,NULL,NULL,NULL,NULL,NULL,'2026-07-15 18:43:40','2026-08-03 06:06:48'),(5,11,'Tegal','1994-07-01','female','toddler_parent','3328120200500001',NULL,'Ridho','male','332812081207612004','2026-02-10','2026-07-22 00:23:24','2026-08-03 06:37:50'),(6,12,'Tarub','2026-07-07','female','toddler_parent','3328120019400001','profile/KkTUqF6g914v80HWcVuOqhwbyvYg4mRjvQApy2Ls.jpg','Syifa','female','332812081207612005','2026-04-14','2026-07-26 08:24:55','2026-08-03 10:02:26');
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
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('mbg','posyandu') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (5,'mbg','2026-07-20','Pembagian MBG Hari Ini','10:00:00','12:00:00','Posyandu Melati','Desa Tarub','schedules/01KXQ2MR1H6KD0F4KTSF82CTKH.jpg','Pegian MBG untuk Ibu Hamil',1,'2026-07-16 20:41:38','2026-07-16 20:41:38'),(6,'mbg','2026-07-17','Pembagian MBG Hari Ini','16:07:00','17:08:00','Posyandu Melati','Desa Tarub','schedules/01KXQNBQY0A5A1TM001J1JQ2S7.jpg','Pembagian MBG Ibu Hamil',1,'2026-07-17 02:08:46','2026-07-17 02:08:46'),(7,'mbg','2026-07-22','Pembagian MBG Posyandu Melati','10:00:00','11:00:00','Posyandu Melati','Desa Tarub','schedules/01KY3YCPSB17P1WMV5C8R85ZEQ.jpg','Pembagian MBG di Posyandu Melati',1,'2026-07-21 20:37:28','2026-07-21 20:37:28'),(8,'posyandu','2026-07-23','Pembagian MBG Posyandu Melati','09:00:00','10:00:00','Posyandu Melati','Desa Tarub','schedules/01KY46M5FPE8PAMQ0EBJYS23PS.jpg','Imunisasi',1,'2026-07-21 23:01:21','2026-07-21 23:01:21'),(9,'mbg','2026-07-26','Pembagian MBG Posyandu Melati','10:00:00','12:00:00','Posyandu Melati','Desa Tarub Kecamatan Tarub','schedules/01KYFG0KD0N3EQEG8MJ3CA6M2S.jpg','Pembagian MBG di Posyandu',1,'2026-07-26 08:17:05','2026-07-26 08:17:05');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sppgs`
--

DROP TABLE IF EXISTS `sppgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sppgs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `posyandu_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sppgs`
--

LOCK TABLES `sppgs` WRITE;
/*!40000 ALTER TABLE `sppgs` DISABLE KEYS */;
INSERT INTO `sppgs` VALUES (1,'SATUAN PELAYANAN PEMENUHAN GIZI MARGADANA 01','JL. Abdul Syukur RT:05 RW013, Kel. Margadana, Kec. Margadana, Kota Tegal','Mawar Sumur Panggang','2026-08-03 05:46:36','2026-08-03 05:46:36');
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super_admin','admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Super Admin','superadmin@example.com','08123456789','$2y$12$7b2xKYiU.zZXMeqiVtur0.1fwPCNwC8QCXCiaNMEU8yFzj6ph9urm','super_admin','active','2026-06-24 23:38:27','2026-06-25 01:11:13'),(4,'admin','admin@example.com',NULL,'$2y$12$lWiAG4qY2sAIJUbQiNpwqufgK0Y.uu0DB3JyUPmwzSCZzMpmvap5C','admin','inactive','2026-06-25 00:14:06','2026-06-25 00:14:06'),(5,'Vita','vita@example.com',NULL,'$2y$12$850iVarqv9ErnbQA.81VtuPIT0JmfatP5ekx.7LseNrNj03L6Rcfm','user','active','2026-06-25 00:15:09','2026-07-15 18:43:41'),(9,'Vita Dhea','vitadhea@example.com','082123456789','$2y$12$xv0Vqtd8S9nSqisD/fc9yeFsGztNxocpvt/45r66r7oLYcIlLUwHC','user','active','2026-07-13 00:29:24','2026-07-21 23:30:51'),(10,'Andi','admin2@example.com','0856974521','$2y$12$seq5fFBOPcRjYWjrcgLcN.SAGUMBlMeor9Yp0hz6ZeX8yXE8Ouy6C','admin','active','2026-07-15 18:31:32','2026-07-15 18:31:32'),(11,'Putri','putri@gmail.com','08123456788','$2y$12$AP1v/cFPBUOO/YCWmmuOrupyrGW/zyKS/peLRqvfBcVfPYHKENESC','user','active','2026-07-22 00:23:24','2026-07-22 01:15:40'),(12,'Putri','putri2@gmail.com','08212345678','$2y$12$5GflBtrXwPSaYVpB1Ab7ZOE083tHKmBMDo1.ULjWCPH9lQbOetrE6','user','active','2026-07-26 08:24:55','2026-07-26 08:34:17');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-04  0:55:46
