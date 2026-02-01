-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table system_demo1.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.cache: ~0 rows (approximately)
DELETE FROM `cache`;

-- Dumping structure for table system_demo1.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table system_demo1.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Dumping data for table system_demo1.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table system_demo1.guards
CREATE TABLE IF NOT EXISTS `guards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.guards: ~0 rows (approximately)
DELETE FROM `guards`;

-- Dumping structure for table system_demo1.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table system_demo1.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table system_demo1.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `logs_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` bigint unsigned DEFAULT NULL,
  `owner_id` bigint unsigned DEFAULT NULL,
  `rfid_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detection_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detected_plate_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`logs_id`),
  KEY `logs_vehicle_id_foreign` (`vehicle_id`),
  KEY `logs_owner_id_foreign` (`owner_id`),
  CONSTRAINT `logs_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `vehicle_owner` (`owner_id`) ON DELETE CASCADE,
  CONSTRAINT `logs_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.logs: ~112 rows (approximately)
DELETE FROM `logs`;
INSERT INTO `logs` (`logs_id`, `vehicle_id`, `owner_id`, `rfid_code`, `detection_method`, `detected_plate_number`, `vehicle_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '12345', 'RFID', NULL, 'Motorcycle', '2025-12-08 03:57:15', '2025-12-08 03:57:15'),
	(2, NULL, NULL, NULL, 'PLATE', '1868HX', 'Motorcycle', '2025-12-09 06:39:54', '2025-12-09 06:39:54'),
	(3, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:04:26', '2025-12-16 07:04:26'),
	(4, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:05:02', '2025-12-16 07:05:02'),
	(5, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:05:14', '2025-12-16 07:05:14'),
	(6, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:06:47', '2025-12-16 07:06:47'),
	(7, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:15', '2025-12-16 07:18:15'),
	(8, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:24', '2025-12-16 07:18:24'),
	(9, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:31', '2025-12-16 07:18:31'),
	(10, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:37', '2025-12-16 07:18:37'),
	(11, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:42', '2025-12-16 07:18:42'),
	(12, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:45', '2025-12-16 07:18:45'),
	(13, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:47', '2025-12-16 07:18:47'),
	(14, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:49', '2025-12-16 07:18:49'),
	(15, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:50', '2025-12-16 07:18:50'),
	(17, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-16 07:18:53', '2025-12-16 07:18:53'),
	(18, NULL, NULL, NULL, 'PLATE', '7252HNM', 'Motorcycle', '2025-12-17 09:23:19', '2025-12-17 09:23:19'),
	(19, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-17 02:41:33', '2025-12-17 02:41:33'),
	(20, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-17 15:00:43', '2025-12-17 15:00:43'),
	(21, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-17 15:18:00', '2025-12-17 15:18:00'),
	(22, 3, 1, '0008586119', 'RFID', NULL, 'Car', '2025-12-17 15:18:17', '2025-12-17 15:18:17'),
	(23, NULL, 1, '0008586119', 'RFID', NULL, NULL, '2025-12-17 15:20:11', '2025-12-17 15:20:11'),
	(24, NULL, NULL, NULL, 'PLATE', 'HAA1873', 'Truck', '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(25, NULL, NULL, NULL, 'PLATE', 'MAA187', 'Truck', '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(26, NULL, NULL, NULL, 'PLATE', 'HAA1874', 'Car', '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(27, NULL, NULL, NULL, 'PLATE', 'HAA1879', 'Truck', '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(28, NULL, NULL, NULL, 'PLATE', 'HAA1875', 'Car', '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(29, NULL, NULL, NULL, 'PLATE', 'MAA1879', 'Truck', '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(30, NULL, NULL, NULL, 'PLATE', 'MAA1873', 'Car', '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(31, NULL, NULL, NULL, 'PLATE', 'MAN1873', 'Car', '2025-12-17 23:11:42', '2025-12-17 23:11:42'),
	(32, NULL, NULL, NULL, 'PLATE', 'JAA1874', 'Truck', '2025-12-17 23:11:43', '2025-12-17 23:11:43'),
	(33, NULL, NULL, NULL, 'PLATE', 'IHA1879', 'Car', '2025-12-17 23:11:44', '2025-12-17 23:11:44'),
	(34, NULL, NULL, NULL, 'PLATE', 'MAI879', 'Car', '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(35, NULL, NULL, NULL, 'PLATE', 'IHA1874', 'Car', '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(36, NULL, NULL, NULL, 'PLATE', 'IAA1875', 'Car', '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(37, NULL, NULL, NULL, 'PLATE', 'IAI874', 'Car', '2025-12-17 23:11:48', '2025-12-17 23:11:48'),
	(38, NULL, NULL, NULL, 'PLATE', 'IAA1873', 'Car', '2025-12-17 23:11:48', '2025-12-17 23:11:48'),
	(39, NULL, NULL, NULL, 'PLATE', 'HAA1075', 'Truck', '2025-12-17 23:11:49', '2025-12-17 23:11:49'),
	(40, NULL, NULL, NULL, 'PLATE', 'HAA1874', 'Car', '2025-12-17 23:11:50', '2025-12-17 23:11:50'),
	(41, NULL, NULL, NULL, 'PLATE', 'HAA1873', 'Car', '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(42, NULL, NULL, NULL, 'PLATE', 'HAA1875', 'Truck', '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(43, NULL, NULL, NULL, 'PLATE', 'IHA162', 'Truck', '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(44, NULL, NULL, NULL, 'PLATE', '109MNA', 'Car', '2025-12-17 23:11:56', '2025-12-17 23:11:56'),
	(45, NULL, NULL, NULL, 'PLATE', 'MAI674', 'Truck', '2025-12-17 23:11:56', '2025-12-17 23:11:56'),
	(46, NULL, NULL, NULL, 'PLATE', 'MAA1675', 'Car', '2025-12-17 23:11:58', '2025-12-17 23:11:58'),
	(47, NULL, NULL, NULL, 'PLATE', 'MAA1875', 'Car', '2025-12-17 23:11:59', '2025-12-17 23:11:59'),
	(48, NULL, NULL, NULL, 'PLATE', 'MAA1873', 'Truck', '2025-12-17 23:11:59', '2025-12-17 23:11:59'),
	(49, NULL, NULL, NULL, 'PLATE', 'MAA1073', 'Truck', '2025-12-17 23:12:00', '2025-12-17 23:12:00'),
	(50, NULL, NULL, NULL, 'PLATE', 'MAA1075', 'Truck', '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(51, NULL, NULL, NULL, 'PLATE', 'HAA1073', 'Car', '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(52, NULL, NULL, NULL, 'PLATE', 'AAI873', 'Car', '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(53, NULL, NULL, NULL, 'PLATE', 'IAA1873', 'Car', '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(54, NULL, NULL, NULL, 'PLATE', 'HAA1673', 'Truck', '2025-12-17 23:12:02', '2025-12-17 23:12:02'),
	(55, NULL, NULL, NULL, 'PLATE', 'MAA187', 'Truck', '2025-12-17 23:12:03', '2025-12-17 23:12:03'),
	(56, NULL, NULL, NULL, 'PLATE', 'HAA1879', 'Car', '2025-12-17 23:12:03', '2025-12-17 23:12:03'),
	(57, NULL, NULL, NULL, 'PLATE', 'HAA1875', 'Truck', '2025-12-17 23:12:04', '2025-12-17 23:12:04'),
	(58, NULL, NULL, NULL, 'PLATE', 'HHA1875', 'Car', '2025-12-17 23:12:04', '2025-12-17 23:12:04'),
	(59, NULL, NULL, NULL, 'PLATE', 'MAA1874', 'Car', '2025-12-17 23:12:05', '2025-12-17 23:12:05'),
	(60, NULL, NULL, NULL, 'PLATE', 'HAA1874', 'Truck', '2025-12-17 23:12:05', '2025-12-17 23:12:05'),
	(61, NULL, NULL, NULL, 'PLATE', 'IIA1878', 'Car', '2025-12-17 23:12:06', '2025-12-17 23:12:06'),
	(62, NULL, NULL, NULL, 'PLATE', 'HAA1873', 'Truck', '2025-12-17 23:12:06', '2025-12-17 23:12:06'),
	(63, NULL, NULL, NULL, 'PLATE', 'MAA1873', 'Truck', '2025-12-17 23:12:10', '2025-12-17 23:12:10'),
	(64, NULL, NULL, NULL, 'PLATE', 'HAI873', 'Car', '2025-12-17 23:12:12', '2025-12-17 23:12:12'),
	(65, NULL, NULL, NULL, 'PLATE', 'JAA1873', 'Car', '2025-12-17 23:12:12', '2025-12-17 23:12:12'),
	(66, NULL, NULL, NULL, 'PLATE', 'IAA1871', 'Car', '2025-12-17 23:12:13', '2025-12-17 23:12:13'),
	(67, NULL, NULL, NULL, 'PLATE', 'HAA107', 'Car', '2025-12-17 23:12:14', '2025-12-17 23:12:14'),
	(68, NULL, NULL, NULL, 'PLATE', 'MAA187', 'Car', '2025-12-17 23:12:16', '2025-12-17 23:12:16'),
	(69, NULL, NULL, NULL, 'PLATE', 'HAA1873', 'Truck', '2025-12-17 23:12:17', '2025-12-17 23:12:17'),
	(70, NULL, NULL, NULL, 'PLATE', 'MAA1875', 'Truck', '2025-12-17 23:12:17', '2025-12-17 23:12:17'),
	(71, NULL, NULL, NULL, 'PLATE', 'HAA1875', 'Car', '2025-12-17 23:12:18', '2025-12-17 23:12:18'),
	(72, NULL, NULL, NULL, 'PLATE', 'HAA1874', 'Truck', '2025-12-17 23:12:19', '2025-12-17 23:12:19'),
	(73, NULL, NULL, NULL, 'PLATE', 'HAA187', 'Truck', '2025-12-17 23:12:20', '2025-12-17 23:12:20'),
	(74, NULL, NULL, NULL, 'PLATE', 'KIK1675', 'Car', '2025-12-17 23:12:23', '2025-12-17 23:12:23'),
	(75, NULL, NULL, NULL, 'PLATE', 'KIN1675', 'Car', '2025-12-17 23:12:24', '2025-12-17 23:12:24'),
	(76, NULL, NULL, NULL, 'PLATE', 'HAA1572', 'Car', '2025-12-17 23:12:25', '2025-12-17 23:12:25'),
	(77, NULL, NULL, NULL, 'PLATE', 'HQA107', 'Bus', '2025-12-17 23:12:39', '2025-12-17 23:12:39'),
	(78, NULL, NULL, NULL, 'PLATE', 'IAA107', 'Bus', '2025-12-17 23:12:41', '2025-12-17 23:12:41'),
	(79, NULL, NULL, NULL, 'PLATE', 'IHA187', 'Car', '2025-12-17 23:12:41', '2025-12-17 23:12:41'),
	(80, NULL, NULL, NULL, 'PLATE', 'MAP187', 'Car', '2025-12-17 23:12:42', '2025-12-17 23:12:42'),
	(81, NULL, NULL, NULL, 'PLATE', 'IAA187', 'Car', '2025-12-17 23:12:42', '2025-12-17 23:12:42'),
	(82, NULL, NULL, NULL, 'PLATE', 'MAA1873', 'Car', '2025-12-17 23:12:43', '2025-12-17 23:12:43'),
	(83, NULL, NULL, NULL, 'PLATE', 'IAA1873', 'Car', '2025-12-17 23:12:48', '2025-12-17 23:12:48'),
	(84, NULL, NULL, NULL, 'PLATE', 'IHA1873', 'Car', '2025-12-17 23:12:49', '2025-12-17 23:12:49'),
	(85, NULL, NULL, NULL, 'PLATE', 'IAA1874', 'Car', '2025-12-17 23:12:52', '2025-12-17 23:12:52'),
	(86, NULL, NULL, NULL, 'PLATE', 'IAA1074', 'Car', '2025-12-17 23:12:52', '2025-12-17 23:12:52'),
	(87, NULL, NULL, NULL, 'PLATE', 'MAA1873', 'Car', '2025-12-17 23:12:54', '2025-12-17 23:12:54'),
	(88, NULL, NULL, NULL, 'PLATE', 'MAA1879', 'Car', '2025-12-17 23:12:55', '2025-12-17 23:12:55'),
	(89, NULL, NULL, NULL, 'PLATE', 'IHA1875', 'Car', '2025-12-17 23:12:55', '2025-12-17 23:12:55'),
	(90, NULL, NULL, NULL, 'PLATE', 'HAA1875', 'Car', '2025-12-17 23:12:56', '2025-12-17 23:12:56'),
	(91, NULL, NULL, NULL, 'PLATE', 'HIA1873', 'Car', '2025-12-17 23:12:56', '2025-12-17 23:12:56'),
	(92, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-18 02:29:51', '2025-12-18 02:29:51'),
	(93, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2025-12-18 02:30:04', '2025-12-18 02:30:04'),
	(94, NULL, NULL, NULL, 'PLATE', 'BN7344', 'Car', '2025-12-18 02:45:10', '2025-12-18 02:45:10'),
	(95, 9, 1, NULL, 'PLATE', 'DBN7343', 'Car', '2025-12-18 02:45:12', '2026-01-22 13:59:49'),
	(96, NULL, NULL, NULL, 'PLATE', 'BN7343', 'Car', '2025-12-18 02:45:30', '2025-12-18 02:45:30'),
	(97, 9, 1, NULL, 'PLATE', 'DBN7343', 'Car', '2025-12-18 02:45:33', '2026-01-22 13:59:49'),
	(98, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 05:58:32', '2026-01-22 05:58:32'),
	(99, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 05:59:20', '2026-01-22 05:59:20'),
	(100, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:06:04', '2026-01-22 06:06:04'),
	(101, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:06:14', '2026-01-22 06:06:14'),
	(102, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:07:03', '2026-01-22 06:07:03'),
	(103, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:20:11', '2026-01-22 06:20:11'),
	(104, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:20:20', '2026-01-22 06:20:20'),
	(105, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:56:00', '2026-01-22 06:56:00'),
	(106, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:56:27', '2026-01-22 06:56:27'),
	(107, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 06:56:34', '2026-01-22 06:56:34'),
	(108, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:24:39', '2026-01-22 07:24:39'),
	(109, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:25:07', '2026-01-22 07:25:07'),
	(110, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:36:21', '2026-01-22 07:36:21'),
	(111, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:37:47', '2026-01-22 07:37:47'),
	(112, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:37:57', '2026-01-22 07:37:57'),
	(113, 1, 1, '0008586119', 'RFID', NULL, 'Motorcycle', '2026-01-22 07:38:07', '2026-01-22 07:38:07');

-- Dumping structure for table system_demo1.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.migrations: ~9 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_09_12_060257_create_guards_table', 1),
	(5, '2025_09_15_032334_create_vehicle_owner_table', 1),
	(6, '2025_09_15_032609_create_vehicles_table', 1),
	(7, '2025_09_22_035307_create_logs_table', 1),
	(8, '2025_09_22_035449_create_time_log_table', 1),
	(9, '2025_11_27_053233_create_reports_table', 1);

-- Dumping structure for table system_demo1.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table system_demo1.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `reports_user_id_foreign` (`user_id`),
  CONSTRAINT `reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.reports: ~3 rows (approximately)
DELETE FROM `reports`;
INSERT INTO `reports` (`report_id`, `plate_number`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, '1868HX', 2, '2025-12-16 06:55:18', '2025-12-16 06:55:18'),
	(2, 'HAA1875', 2, '2025-12-17 23:31:37', '2025-12-17 23:31:37'),
	(3, 'DBN7343', 2, '2025-12-18 02:45:20', '2025-12-18 02:45:20');

-- Dumping structure for table system_demo1.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.sessions: ~3 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('26JQEujWIA8Zd9xyPrFBNgaSuwGimknbrQksZyoF', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSTJGWmpLTGNzRHI3dG5FV2tSN2U3bmV0VnRBdG9pdXZGd2NEYmRwaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC92ZWhpY2xlLWRldGVjdGlvbi9saXZlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1769094230),
	('8tJO7TTEZV8eKrON0eqaBesre8jH8GAtSCjRxrp4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODhoaDhITTJMTGhaREhpNGJGNzAwbXpQQWlGM3l5QlpWUzMzS3lwSiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1769096217),
	('YtZ95Sep4LrwDrOtIOKgcUssMxzmMtpgDX4jq5X3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU21vSW9wZVFESGJjSWowcUI3dlFPWkxEemJHaEFDUlVoU2o3MXNiSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1769087511);

-- Dumping structure for table system_demo1.time_log
CREATE TABLE IF NOT EXISTS `time_log` (
  `time_log_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `logs_id` bigint unsigned NOT NULL,
  `time_in` timestamp NOT NULL,
  `time_out` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`time_log_id`),
  KEY `time_log_logs_id_foreign` (`logs_id`),
  CONSTRAINT `time_log_logs_id_foreign` FOREIGN KEY (`logs_id`) REFERENCES `logs` (`logs_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.time_log: ~112 rows (approximately)
DELETE FROM `time_log`;
INSERT INTO `time_log` (`time_log_id`, `logs_id`, `time_in`, `time_out`, `created_at`, `updated_at`) VALUES
	(1, 1, '2025-12-08 03:57:15', '2025-12-08 03:57:42', '2025-12-08 03:57:15', '2025-12-08 03:57:42'),
	(2, 2, '2025-12-09 06:39:54', NULL, '2025-12-09 06:39:54', '2025-12-09 06:39:54'),
	(3, 3, '2025-12-16 07:04:26', '2025-12-16 07:04:45', '2025-12-16 07:04:26', '2025-12-16 07:04:45'),
	(4, 4, '2025-12-16 07:05:02', '2025-12-16 07:05:06', '2025-12-16 07:05:02', '2025-12-16 07:05:06'),
	(5, 5, '2025-12-16 07:05:14', '2025-12-16 07:05:17', '2025-12-16 07:05:14', '2025-12-16 07:05:17'),
	(6, 6, '2025-12-16 07:06:47', '2025-12-16 07:06:52', '2025-12-16 07:06:47', '2025-12-16 07:06:52'),
	(7, 7, '2025-12-16 07:18:15', '2025-12-16 07:18:19', '2025-12-16 07:18:15', '2025-12-16 07:18:19'),
	(8, 8, '2025-12-16 07:18:24', '2025-12-16 07:18:28', '2025-12-16 07:18:24', '2025-12-16 07:18:28'),
	(9, 9, '2025-12-16 07:18:31', '2025-12-16 07:18:34', '2025-12-16 07:18:31', '2025-12-16 07:18:34'),
	(10, 10, '2025-12-16 07:18:37', '2025-12-16 07:18:40', '2025-12-16 07:18:37', '2025-12-16 07:18:40'),
	(11, 11, '2025-12-16 07:18:42', '2025-12-16 07:18:44', '2025-12-16 07:18:42', '2025-12-16 07:18:44'),
	(12, 12, '2025-12-16 07:18:45', '2025-12-16 07:18:46', '2025-12-16 07:18:45', '2025-12-16 07:18:46'),
	(13, 13, '2025-12-16 07:18:47', '2025-12-16 07:18:48', '2025-12-16 07:18:47', '2025-12-16 07:18:48'),
	(14, 14, '2025-12-16 07:18:49', '2025-12-16 07:18:49', '2025-12-16 07:18:49', '2025-12-16 07:18:49'),
	(15, 15, '2025-12-16 07:18:50', '2025-12-16 07:18:51', '2025-12-16 07:18:50', '2025-12-16 07:18:51'),
	(17, 17, '2025-12-16 07:18:53', '2025-12-17 02:41:22', '2025-12-16 07:18:53', '2025-12-17 02:41:22'),
	(18, 18, '2025-12-17 09:23:19', NULL, '2025-12-17 09:23:19', '2025-12-17 09:23:19'),
	(19, 19, '2025-12-17 02:41:33', '2025-12-17 02:41:40', '2025-12-17 02:41:33', '2025-12-17 02:41:40'),
	(20, 20, '2025-12-17 15:00:43', '2025-12-17 15:00:50', '2025-12-17 15:00:43', '2025-12-17 15:00:50'),
	(21, 21, '2025-12-17 15:18:00', '2025-12-17 15:18:08', '2025-12-17 15:18:00', '2025-12-17 15:18:08'),
	(22, 22, '2025-12-17 15:18:17', '2025-12-17 15:18:23', '2025-12-17 15:18:17', '2025-12-17 15:18:23'),
	(23, 23, '2025-12-17 15:20:11', '2025-12-17 15:20:17', '2025-12-17 15:20:11', '2025-12-17 15:20:17'),
	(24, 24, '2025-12-17 23:11:39', NULL, '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(25, 25, '2025-12-17 23:11:39', NULL, '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(26, 26, '2025-12-17 23:11:39', NULL, '2025-12-17 23:11:39', '2025-12-17 23:11:39'),
	(27, 27, '2025-12-17 23:11:40', NULL, '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(28, 28, '2025-12-17 23:11:40', NULL, '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(29, 29, '2025-12-17 23:11:40', NULL, '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(30, 30, '2025-12-17 23:11:40', NULL, '2025-12-17 23:11:40', '2025-12-17 23:11:40'),
	(31, 31, '2025-12-17 23:11:42', NULL, '2025-12-17 23:11:42', '2025-12-17 23:11:42'),
	(32, 32, '2025-12-17 23:11:43', NULL, '2025-12-17 23:11:43', '2025-12-17 23:11:43'),
	(33, 33, '2025-12-17 23:11:44', NULL, '2025-12-17 23:11:44', '2025-12-17 23:11:44'),
	(34, 34, '2025-12-17 23:11:45', NULL, '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(35, 35, '2025-12-17 23:11:45', NULL, '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(36, 36, '2025-12-17 23:11:45', NULL, '2025-12-17 23:11:45', '2025-12-17 23:11:45'),
	(37, 37, '2025-12-17 23:11:48', NULL, '2025-12-17 23:11:48', '2025-12-17 23:11:48'),
	(38, 38, '2025-12-17 23:11:48', NULL, '2025-12-17 23:11:48', '2025-12-17 23:11:48'),
	(39, 39, '2025-12-17 23:11:49', NULL, '2025-12-17 23:11:49', '2025-12-17 23:11:49'),
	(40, 40, '2025-12-17 23:11:50', NULL, '2025-12-17 23:11:50', '2025-12-17 23:11:50'),
	(41, 41, '2025-12-17 23:11:51', NULL, '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(42, 42, '2025-12-17 23:11:51', NULL, '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(43, 43, '2025-12-17 23:11:51', NULL, '2025-12-17 23:11:51', '2025-12-17 23:11:51'),
	(44, 44, '2025-12-17 23:11:56', NULL, '2025-12-17 23:11:56', '2025-12-17 23:11:56'),
	(45, 45, '2025-12-17 23:11:56', NULL, '2025-12-17 23:11:56', '2025-12-17 23:11:56'),
	(46, 46, '2025-12-17 23:11:58', NULL, '2025-12-17 23:11:58', '2025-12-17 23:11:58'),
	(47, 47, '2025-12-17 23:11:59', NULL, '2025-12-17 23:11:59', '2025-12-17 23:11:59'),
	(48, 48, '2025-12-17 23:11:59', NULL, '2025-12-17 23:11:59', '2025-12-17 23:11:59'),
	(49, 49, '2025-12-17 23:12:00', NULL, '2025-12-17 23:12:00', '2025-12-17 23:12:00'),
	(50, 50, '2025-12-17 23:12:01', NULL, '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(51, 51, '2025-12-17 23:12:01', NULL, '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(52, 52, '2025-12-17 23:12:01', NULL, '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(53, 53, '2025-12-17 23:12:01', NULL, '2025-12-17 23:12:01', '2025-12-17 23:12:01'),
	(54, 54, '2025-12-17 23:12:02', NULL, '2025-12-17 23:12:02', '2025-12-17 23:12:02'),
	(55, 55, '2025-12-17 23:12:03', NULL, '2025-12-17 23:12:03', '2025-12-17 23:12:03'),
	(56, 56, '2025-12-17 23:12:03', NULL, '2025-12-17 23:12:03', '2025-12-17 23:12:03'),
	(57, 57, '2025-12-17 23:12:04', NULL, '2025-12-17 23:12:04', '2025-12-17 23:12:04'),
	(58, 58, '2025-12-17 23:12:04', NULL, '2025-12-17 23:12:04', '2025-12-17 23:12:04'),
	(59, 59, '2025-12-17 23:12:05', NULL, '2025-12-17 23:12:05', '2025-12-17 23:12:05'),
	(60, 60, '2025-12-17 23:12:05', NULL, '2025-12-17 23:12:05', '2025-12-17 23:12:05'),
	(61, 61, '2025-12-17 23:12:06', NULL, '2025-12-17 23:12:06', '2025-12-17 23:12:06'),
	(62, 62, '2025-12-17 23:12:06', NULL, '2025-12-17 23:12:06', '2025-12-17 23:12:06'),
	(63, 63, '2025-12-17 23:12:10', NULL, '2025-12-17 23:12:10', '2025-12-17 23:12:10'),
	(64, 64, '2025-12-17 23:12:12', NULL, '2025-12-17 23:12:12', '2025-12-17 23:12:12'),
	(65, 65, '2025-12-17 23:12:12', NULL, '2025-12-17 23:12:12', '2025-12-17 23:12:12'),
	(66, 66, '2025-12-17 23:12:13', NULL, '2025-12-17 23:12:13', '2025-12-17 23:12:13'),
	(67, 67, '2025-12-17 23:12:14', NULL, '2025-12-17 23:12:14', '2025-12-17 23:12:14'),
	(68, 68, '2025-12-17 23:12:16', NULL, '2025-12-17 23:12:16', '2025-12-17 23:12:16'),
	(69, 69, '2025-12-17 23:12:17', NULL, '2025-12-17 23:12:17', '2025-12-17 23:12:17'),
	(70, 70, '2025-12-17 23:12:17', NULL, '2025-12-17 23:12:17', '2025-12-17 23:12:17'),
	(71, 71, '2025-12-17 23:12:18', NULL, '2025-12-17 23:12:18', '2025-12-17 23:12:18'),
	(72, 72, '2025-12-17 23:12:19', NULL, '2025-12-17 23:12:19', '2025-12-17 23:12:19'),
	(73, 73, '2025-12-17 23:12:20', NULL, '2025-12-17 23:12:20', '2025-12-17 23:12:20'),
	(74, 74, '2025-12-17 23:12:23', NULL, '2025-12-17 23:12:23', '2025-12-17 23:12:23'),
	(75, 75, '2025-12-17 23:12:24', NULL, '2025-12-17 23:12:24', '2025-12-17 23:12:24'),
	(76, 76, '2025-12-17 23:12:25', NULL, '2025-12-17 23:12:25', '2025-12-17 23:12:25'),
	(77, 77, '2025-12-17 23:12:39', NULL, '2025-12-17 23:12:39', '2025-12-17 23:12:39'),
	(78, 78, '2025-12-17 23:12:41', NULL, '2025-12-17 23:12:41', '2025-12-17 23:12:41'),
	(79, 79, '2025-12-17 23:12:41', NULL, '2025-12-17 23:12:41', '2025-12-17 23:12:41'),
	(80, 80, '2025-12-17 23:12:42', NULL, '2025-12-17 23:12:42', '2025-12-17 23:12:42'),
	(81, 81, '2025-12-17 23:12:42', NULL, '2025-12-17 23:12:42', '2025-12-17 23:12:42'),
	(82, 82, '2025-12-17 23:12:43', NULL, '2025-12-17 23:12:43', '2025-12-17 23:12:43'),
	(83, 83, '2025-12-17 23:12:48', NULL, '2025-12-17 23:12:48', '2025-12-17 23:12:48'),
	(84, 84, '2025-12-17 23:12:49', NULL, '2025-12-17 23:12:49', '2025-12-17 23:12:49'),
	(85, 85, '2025-12-17 23:12:52', NULL, '2025-12-17 23:12:52', '2025-12-17 23:12:52'),
	(86, 86, '2025-12-17 23:12:52', NULL, '2025-12-17 23:12:52', '2025-12-17 23:12:52'),
	(87, 87, '2025-12-17 23:12:54', NULL, '2025-12-17 23:12:54', '2025-12-17 23:12:54'),
	(88, 88, '2025-12-17 23:12:55', NULL, '2025-12-17 23:12:55', '2025-12-17 23:12:55'),
	(89, 89, '2025-12-17 23:12:55', NULL, '2025-12-17 23:12:55', '2025-12-17 23:12:55'),
	(90, 90, '2025-12-17 23:12:56', NULL, '2025-12-17 23:12:56', '2025-12-17 23:12:56'),
	(91, 91, '2025-12-17 23:12:56', NULL, '2025-12-17 23:12:56', '2025-12-17 23:12:56'),
	(92, 92, '2025-12-18 02:29:51', '2025-12-18 02:29:56', '2025-12-18 02:29:51', '2025-12-18 02:29:56'),
	(93, 93, '2025-12-18 02:30:04', '2025-12-18 02:30:08', '2025-12-18 02:30:04', '2025-12-18 02:30:08'),
	(94, 94, '2025-12-18 02:45:10', NULL, '2025-12-18 02:45:10', '2025-12-18 02:45:10'),
	(95, 95, '2025-12-18 02:45:12', NULL, '2025-12-18 02:45:12', '2025-12-18 02:45:12'),
	(96, 96, '2025-12-18 02:45:30', NULL, '2025-12-18 02:45:30', '2025-12-18 02:45:30'),
	(97, 97, '2025-12-18 02:45:33', NULL, '2025-12-18 02:45:33', '2025-12-18 02:45:33'),
	(98, 98, '2026-01-22 05:58:33', '2026-01-22 05:58:37', '2026-01-22 05:58:33', '2026-01-22 05:58:37'),
	(99, 99, '2026-01-22 05:59:20', '2026-01-22 05:59:24', '2026-01-22 05:59:20', '2026-01-22 05:59:24'),
	(100, 100, '2026-01-22 06:06:04', '2026-01-22 06:06:09', '2026-01-22 06:06:04', '2026-01-22 06:06:09'),
	(101, 101, '2026-01-22 06:06:14', '2026-01-22 06:06:19', '2026-01-22 06:06:14', '2026-01-22 06:06:19'),
	(102, 102, '2026-01-22 06:07:03', '2026-01-22 06:20:06', '2026-01-22 06:07:03', '2026-01-22 06:20:06'),
	(103, 103, '2026-01-22 06:20:11', '2026-01-22 06:20:16', '2026-01-22 06:20:11', '2026-01-22 06:20:16'),
	(104, 104, '2026-01-22 06:20:20', '2026-01-22 06:20:23', '2026-01-22 06:20:20', '2026-01-22 06:20:23'),
	(105, 105, '2026-01-22 06:56:00', '2026-01-22 06:56:22', '2026-01-22 06:56:00', '2026-01-22 06:56:22'),
	(106, 106, '2026-01-22 06:56:27', '2026-01-22 06:56:31', '2026-01-22 06:56:27', '2026-01-22 06:56:31'),
	(107, 107, '2026-01-22 06:56:34', '2026-01-22 06:56:43', '2026-01-22 06:56:34', '2026-01-22 06:56:43'),
	(108, 108, '2026-01-22 07:24:39', '2026-01-22 07:24:45', '2026-01-22 07:24:39', '2026-01-22 07:24:45'),
	(109, 109, '2026-01-22 07:25:07', '2026-01-22 07:25:13', '2026-01-22 07:25:07', '2026-01-22 07:25:13'),
	(110, 110, '2026-01-22 07:36:21', '2026-01-22 07:36:26', '2026-01-22 07:36:21', '2026-01-22 07:36:26'),
	(111, 111, '2026-01-22 07:37:47', '2026-01-22 07:37:50', '2026-01-22 07:37:47', '2026-01-22 07:37:50'),
	(112, 112, '2026-01-22 07:37:57', '2026-01-22 07:38:01', '2026-01-22 07:37:57', '2026-01-22 07:38:01'),
	(113, 113, '2026-01-22 07:38:07', '2026-01-22 07:38:10', '2026-01-22 07:38:07', '2026-01-22 07:38:10');

-- Dumping structure for table system_demo1.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','guard') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'guard',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.users: ~4 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Admin', 'admin@gmail.com', '$2y$12$m.yuZDqwTYjZ3KCirwoFb.xwyMN9DMIXeXuXSeqFpjlC5jDk4czZ.', 'admin', '', NULL, '2025-12-08 03:56:00', '2025-12-08 03:56:00'),
	(2, 'Guard', 'guard@gmail.com', '$2y$12$9sFw9teOxE844oZSCqHT1O2aOxnMfh2h052GBG8a.QAEEIEljTyJ.', 'guard', '', NULL, '2025-12-08 03:56:00', '2025-12-08 03:56:00'),
	(3, 'admin errol', 'adminerrol@gmail.com', '$2y$12$dnHPevXqnA6VM6ZfgXMnYeIpsXhvPDCWkNbv06L27T7uOrE6puUya', 'admin', NULL, NULL, '2025-12-13 20:07:05', '2025-12-13 20:07:05'),
	(4, 'CHRISTINE', 'nnoobking03@gmail.com', '$2y$12$rmvPCIft11oLXVdaIMhlzuQju4OGE0yFIxwfegxlzSgqnrWhdczfy', 'guard', NULL, NULL, '2026-01-22 14:26:43', '2026-01-22 14:26:43');

-- Dumping structure for table system_demo1.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `vehicle_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint unsigned NOT NULL,
  `plate_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `vehicles_owner_id_foreign` (`owner_id`),
  CONSTRAINT `vehicles_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `vehicle_owner` (`owner_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.vehicles: ~4 rows (approximately)
DELETE FROM `vehicles`;
INSERT INTO `vehicles` (`vehicle_id`, `owner_id`, `plate_number`, `vehicle_type`, `created_at`, `updated_at`) VALUES
	(1, 1, 'ABC1245', 'Motorcycle', '2025-12-08 03:57:07', '2025-12-16 23:48:31'),
	(3, 1, '7252HNM', 'Car', '2025-12-17 03:15:17', '2025-12-17 15:01:22'),
	(8, 6, 'HAA1875', 'Car', '2025-12-18 02:39:45', '2025-12-18 02:39:45'),
	(9, 1, 'DBN7343', 'Car', '2026-01-22 13:59:49', '2026-01-22 13:59:49');

-- Dumping structure for table system_demo1.vehicle_owner
CREATE TABLE IF NOT EXISTS `vehicle_owner` (
  `owner_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_owner` enum('student','employee') COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfid_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`owner_id`),
  UNIQUE KEY `vehicle_owner_rfid_code_unique` (`rfid_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table system_demo1.vehicle_owner: ~3 rows (approximately)
DELETE FROM `vehicle_owner`;
INSERT INTO `vehicle_owner` (`owner_id`, `f_name`, `l_name`, `address`, `contact_number`, `school_year`, `type_of_owner`, `valid_id`, `rfid_code`, `created_at`, `updated_at`) VALUES
	(1, 'MIRANDA', 'ERROL', 'Zone 3, Liwayway, MacArthur, Leyte', '09700362354', '1', 'student', '3432424', '0008586119', '2025-12-08 03:56:55', '2025-12-16 07:03:33'),
	(5, 'HDDD', 'hegdrhdsdrhd', 'gdrhdsgdrh', '3422432', NULL, 'student', 'national id', '111111', '2025-12-17 03:19:31', '2026-01-22 14:25:23'),
	(6, 'arias', 'arias', 'abuyog', '11111111111', NULL, 'employee', 'national id', '0008471152', '2025-12-18 02:37:21', '2025-12-18 02:37:21');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
