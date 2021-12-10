# ************************************************************
# Sequel Ace SQL dump
# Version 20016
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 8.0.27)
# Database: exe04
# Generation Time: 2021-12-10 06:12:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorys_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `content`, `slug`, `active`, `created_at`, `updated_at`)
VALUES
	(1,'Dành Cho Nam',0,'Danh mục cha','<pre>\r\nDanh mục 1</pre>',NULL,1,'2021-12-10 04:17:38','2021-12-10 05:08:05'),
	(2,'Phụ Kiện Đồng Hồ',5,'con đồng hồ Nam','<p>con đồng hồ Nam</p>',NULL,1,'2021-12-10 04:17:47','2021-12-10 04:42:20'),
	(3,'Phụ Kiện Đồng Hồ Nữ',6,'con Phụ Kiện Đồng Hồ Nữ','<p>con Phụ Kiện Đồng Hồ Nữ</p>',NULL,1,'2021-12-10 04:18:01','2021-12-10 04:42:41'),
	(4,'Dành Cho Nữ',0,'Danh mục cha','<p>Danh mục 1.2</p>',NULL,1,'2021-12-10 04:25:03','2021-12-10 05:07:57'),
	(5,'Đồng Hồ Nam',1,'con Quần Áo Nam','<p>con Quần &Aacute;o Nam</p>',NULL,1,'2021-12-10 04:26:28','2021-12-10 04:41:19'),
	(6,'Đồng Hồ Nữ',4,'con Đồng Hồ Nữ','<p>con Đồng Hồ Nữ</p>',NULL,1,'2021-12-10 04:27:39','2021-12-10 04:41:42');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

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



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2019_08_19_000000_create_failed_jobs_table',1),
	(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
	(5,'2021_12_09_143028_create_products_table',2),
	(6,'2021_12_09_143114_create_categorys_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table personal_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` int DEFAULT NULL,
  `price` int NOT NULL,
  `active` int DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `description`, `content`, `category_id`, `price`, `active`, `created_at`, `updated_at`, `thumb`)
VALUES
	(2,'Đồng hồ nam 1','Đồng hồ','<p>Đồng hồ</p>',5,1000,1,'2021-12-10 04:29:48','2021-12-10 04:59:19','1n4aYxcIj3.jpg'),
	(5,'Đồng hồ nam 2','Đồng hồ nam 2','<p>Đồng hồ nữ</p>',5,9000,1,'2021-12-10 04:33:59','2021-12-10 04:59:31','Z7hjCufR0G.jpg'),
	(6,'Đồng hồ nữ 2','123','<p>123</p>',6,700,1,'2021-12-10 05:01:56','2021-12-10 05:01:56','s7xmEacFYK.jpg'),
	(7,'đồng hồ nữ 3','123','<p>123</p>',6,9000,1,'2021-12-10 05:02:14','2021-12-10 05:02:14','kWRUaZOCjf.jpg'),
	(8,'áo nữ 1','áo nữ 1','<p>&aacute;o nữ 1</p>',4,9000,1,'2021-12-10 05:03:31','2021-12-10 05:03:31','Ccy4WBSgcT.webp'),
	(9,'Áo nữ 2','áo nữ 2','<p>&Aacute;o nữ 2</p>',4,286,1,'2021-12-10 05:04:07','2021-12-10 05:04:07','v4thZDXGkj.jpg'),
	(10,'Áo nam 1','áo nam','<p>&aacute;o nam</p>',1,7001,1,'2021-12-10 05:05:40','2021-12-10 05:05:40','mraMykuPi8.png'),
	(11,'Áo nam 2','áo nam 2','<p>123123</p>',1,2861,1,'2021-12-10 05:06:07','2021-12-10 05:06:07','Pou1qN3hT6.png'),
	(12,'Đồng hồ nữ 3','Đồng hồ nữ 3','<p>Đồng hồ nữ 3</p>',6,100,1,'2021-12-10 05:07:03','2021-12-10 05:07:03','6ytlli70MH.jpg'),
	(13,'Đồng hồ nữ 4','Đồng hồ nữ 4','<p>Đồng hồ nữ 4</p>',6,122,1,'2021-12-10 05:07:32','2021-12-10 05:07:32','fPOLPvheMy.jpg');

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Delta Swift III','hainguyen@gmail.com','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BAomVFeDPp','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(2,'Phoebe Littel','kerluke.theodora@example.net','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4EabMJsW94','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(3,'Krista Schmeler','terence51@example.com','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','VC9cDoI4iQ','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(4,'Prof. Dejuan Mitchell','wdach@example.org','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ECOCARhdad','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(5,'Keaton Jones','shea91@example.com','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','l7oy2pu6hg','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(6,'Mr. Janick Romaguera','qkunze@example.com','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','jbi2pqofkT','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(7,'Samantha Corkery','xcartwright@example.net','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','obxcUr9pCp','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(8,'Alanna Lubowitz','maggio.orval@example.net','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','GzfRQPY2o6','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(9,'Mateo Daniel','aliyah.rempel@example.org','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5VlZdBwUQM','2021-12-09 14:54:29','2021-12-09 14:54:29'),
	(10,'Flossie Johnston III','marlen.schowalter@example.net','2021-12-09 14:54:29','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','FAffAUW53I','2021-12-09 14:54:29','2021-12-09 14:54:29');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
