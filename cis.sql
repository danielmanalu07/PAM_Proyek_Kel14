-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2023 at 12:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cis`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'baakitdel', 'baak@gmail.com', '$2y$12$OikVuleZzKiz/9niP30rPuKsONrShZXeGHG2O2F91yFQqaEi2eiqi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking_ruangans`
--

CREATE TABLE `booking_ruangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `ruangan_id` bigint(20) UNSIGNED NOT NULL,
  `RencanaMulai` datetime NOT NULL,
  `RencanaBerakhir` datetime NOT NULL,
  `Keperluan` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_ruangans`
--

INSERT INTO `booking_ruangans` (`id`, `mahasiswa_id`, `ruangan_id`, `RencanaMulai`, `RencanaBerakhir`, `Keperluan`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2023-12-18 12:32:00', '2023-12-18 12:32:00', 'raoat', 1, '2023-12-16 22:34:05', '2023-12-17 02:13:09'),
(2, 3, 1, '2023-12-18 12:32:00', '2023-12-18 12:32:00', 'Bebas', 2, '2023-12-16 22:35:11', '2023-12-17 02:13:20'),
(3, 1, 1, '2023-12-18 12:41:00', '2023-12-18 12:41:00', 'sjwjw', 1, '2023-12-16 22:41:46', '2023-12-17 02:18:25'),
(4, 1, 1, '2023-12-18 12:41:00', '2023-12-18 12:41:00', 'fggc', 0, '2023-12-16 22:43:34', '2023-12-16 22:43:34'),
(5, 1, 1, '2023-12-17 12:45:00', '2023-12-17 12:45:00', 'uwjw', 0, '2023-12-16 22:45:41', '2023-12-16 22:45:41'),
(6, 1, 1, '2023-12-19 12:48:00', '2023-12-19 12:48:00', 'hehe', 0, '2023-12-16 22:55:30', '2023-12-16 22:55:30'),
(7, 1, 6, '2023-12-17 14:00:00', '2023-12-17 15:00:00', 'hejj', 0, '2023-12-16 23:06:30', '2023-12-16 23:06:30'),
(8, 1, 7, '2023-12-19 14:07:00', '2023-12-19 15:07:00', 'hwuwh', 0, '2023-12-16 23:07:24', '2023-12-16 23:07:24'),
(9, 3, 6, '2023-12-18 01:15:00', '2023-12-18 01:15:00', 'uwiuw', 0, '2023-12-16 23:12:28', '2023-12-16 23:12:28'),
(10, 3, 6, '2023-12-17 17:15:00', '2023-12-17 17:15:00', 'hwiiw', 0, '2023-12-16 23:13:34', '2023-12-16 23:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `izin_bermalams`
--

CREATE TABLE `izin_bermalams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `RencanaBerangkat` datetime NOT NULL,
  `RencanaKembali` datetime NOT NULL,
  `Keperluan` text NOT NULL,
  `Tujuan` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `izin_bermalams`
--

INSERT INTO `izin_bermalams` (`id`, `mahasiswa_id`, `RencanaBerangkat`, `RencanaKembali`, `Keperluan`, `Tujuan`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-15 17:04:00', '2023-12-17 20:00:00', 'jumpai bang vlen', 'labersa', 2, '2023-12-14 07:04:32', '2023-12-14 07:23:39'),
(2, 3, '2023-12-15 18:08:00', '2023-12-17 21:08:00', 'bdhdbxb', 'tjshbs', 0, '2023-12-14 07:09:01', '2023-12-14 07:09:01'),
(3, 3, '2023-12-22 18:09:00', '2023-12-24 19:09:00', 'yevdb', 'ushebs', 0, '2023-12-14 07:09:33', '2023-12-14 07:09:33');

-- --------------------------------------------------------

--
-- Table structure for table `izin_keluars`
--

CREATE TABLE `izin_keluars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `RencanaBerangkat` datetime NOT NULL,
  `RencanaKembali` datetime NOT NULL,
  `Keperluan` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `izin_keluars`
--

INSERT INTO `izin_keluars` (`id`, `mahasiswa_id`, `RencanaBerangkat`, `RencanaKembali`, `Keperluan`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-13 10:28:41', '2023-12-14 10:28:41', 'Ok', 1, NULL, '2023-12-14 03:05:31'),
(2, 1, '2023-12-10 00:00:00', '2023-12-11 00:00:00', 'IzinKeluar', 2, '2023-12-13 02:31:34', '2023-12-14 03:05:39'),
(3, 1, '2023-12-15 00:00:00', '2023-12-16 00:00:00', 'dhgss', 1, '2023-12-13 23:42:13', '2023-12-14 03:08:47'),
(4, 1, '2023-12-17 00:00:00', '2023-12-18 00:00:00', 'c ha a', 0, '2023-12-13 23:43:50', '2023-12-13 23:43:50'),
(5, 1, '2023-12-15 00:00:00', '2023-12-16 00:00:00', 'djsjjj', 2, '2023-12-13 23:48:46', '2023-12-14 03:11:12'),
(6, 3, '2023-12-15 00:00:00', '2023-12-16 00:00:00', '3uejek', 1, '2023-12-13 23:59:06', '2023-12-14 03:11:16'),
(7, 3, '2023-12-15 19:15:00', '2023-12-15 19:30:00', 'opet', 2, '2023-12-14 00:13:20', '2023-12-14 03:09:43'),
(8, 3, '2023-12-15 03:12:00', '2023-12-15 04:12:00', 'ghvubjvucrx', 2, '2023-12-14 03:12:19', '2023-12-14 06:31:43'),
(9, 1, '2023-12-15 17:07:00', '2023-12-17 20:59:00', 'contoh', 0, '2023-12-14 07:03:10', '2023-12-14 07:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `kaos`
--

CREATE TABLE `kaos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `NamaBarang` varchar(255) NOT NULL,
  `Gambar` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kaos`
--

INSERT INTO `kaos` (`id`, `NamaBarang`, `Gambar`, `size`, `Harga`, `Deskripsi`, `created_at`, `updated_at`) VALUES
(10, 'Kaos Del', '1703309923_image.png', 'L', 100000, 'Kaos Berkerah', '2023-12-22 22:38:43', '2023-12-22 22:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswas`
--

CREATE TABLE `mahasiswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ktp` varchar(255) NOT NULL,
  `nim` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswas`
--

INSERT INTO `mahasiswas` (`id`, `ktp`, `nim`, `nohp`, `nama`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, '1202012908040002', '11322031', '085762649422', 'Daniel Manalu', 'example@gmail.com', '$2y$12$CVMbOoUjCPi52Ih6/nnPl.hdcnMBz1RZ8j5NmAVM.sYViBeRcBCZi', '2023-12-13 02:14:43', '2023-12-13 02:14:43'),
(2, '0121826281398272', '11S22042', '081283767286', 'kristina marbun', 'kristinamarbun63gmail@gmail.com', '$2y$12$eSVyFPJPclxVw6Pm.o3e4e/SPJe7VPb/f2fDTBHZ9oO52E8Kqhp/K', '2023-12-13 03:31:58', '2023-12-13 03:31:58'),
(3, '1202012908040004', '113322039', '085762649423', 'Pani', 'daman@gmail.com', '$2y$12$c6HfzPq.ZpFqJ5.DFP4XAe2dg8B5hIMkb4iShegshPr3IdBABZMyK', '2023-12-13 03:34:24', '2023-12-13 03:34:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_12_130205_create_mahasiswas_table', 1),
(6, '2023_12_13_080407_create_izin_keluars_table', 1),
(7, '2023_12_14_072734_create_admins_table', 2),
(8, '2023_12_14_132036_create_izin_bermalams_table', 3),
(9, '2023_12_14_155741_create_surats_table', 4),
(10, '2023_12_14_160435_drop_table_name', 5),
(11, '2023_12_14_160546_drop_table_surats', 6),
(12, '2023_12_14_160641_create_surats_table', 7),
(13, '2023_12_14_163529_add__tujuan_to_surats', 8),
(14, '2023_12_14_163623_add__tujuan_to_surats', 9),
(15, '2023_12_14_163738_drop_table_surats', 10),
(16, '2023_12_14_163909_create_table_surats', 11),
(17, '2023_12_15_021735_drop_table_ruangans', 12),
(18, '2023_12_15_021943_create_table_ruangans', 13),
(19, '2023_12_15_022116_drop_table_ruangans', 14),
(20, '2023_12_15_022217_drop_table_table_ruangans', 15),
(21, '2023_12_15_022300_create_ruangans_table', 16),
(22, '2023_12_16_133835_create_booking_ruangans_table', 17),
(23, '2023_12_17_142621_create_kaos_table', 18),
(24, '2023_12_21_130143_drop_table_kaos', 19),
(25, '2023_12_21_130428_create_kaos_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Mahasiswa', 1, 'cis', '9a2b5e90af385ec3b7338717d1f01500d940929727505794f489a1ba283eb226', '[\"*\"]', NULL, NULL, '2023-12-13 02:14:43', '2023-12-13 02:14:43'),
(2, 'App\\Models\\Mahasiswa', 1, 'cis', '9a04076efd682b76cc840ccfd4e05d79c925396d0922431650b126494892ef40', '[\"*\"]', '2023-12-13 02:16:35', NULL, '2023-12-13 02:14:55', '2023-12-13 02:16:35'),
(3, 'App\\Models\\Mahasiswa', 1, 'cis', '59b594ed72632c4b7ebc68fd00442d38c86fd62f9f95a36936089ac56cf28f99', '[\"*\"]', '2023-12-13 02:31:49', NULL, '2023-12-13 02:19:04', '2023-12-13 02:31:49'),
(4, 'App\\Models\\Mahasiswa', 1, 'cis', 'e3edaf43fb3cde33063106160860e4f1092e2495a99f3c5d2fad59b147a995f8', '[\"*\"]', '2023-12-13 02:21:12', NULL, '2023-12-13 02:21:12', '2023-12-13 02:21:12'),
(5, 'App\\Models\\Mahasiswa', 1, 'cis', 'f565851ac1bd91c4a80fecdf39d2b5dd1f45a6a41a1d6560c62c23af9b7c5ab5', '[\"*\"]', '2023-12-13 02:51:43', NULL, '2023-12-13 02:51:42', '2023-12-13 02:51:43'),
(6, 'App\\Models\\Mahasiswa', 1, 'cis', '356cfb345f37bf3ced49bfa08d69971b2926400b4b5351bc05fa28d79a350a01', '[\"*\"]', '2023-12-13 03:07:19', NULL, '2023-12-13 03:04:48', '2023-12-13 03:07:19'),
(7, 'App\\Models\\Mahasiswa', 1, 'cis', 'dfdc0e63153813e8011d1cf9ddd0126956f3765e9d37e157b0e76d6a55d588dd', '[\"*\"]', '2023-12-13 03:10:18', NULL, '2023-12-13 03:10:15', '2023-12-13 03:10:18'),
(8, 'App\\Models\\Mahasiswa', 1, 'cis', '0ef2df1b5b33b18e36972f0a2e4d2fa353deb4888e2a63e46940b56da2d3e46a', '[\"*\"]', '2023-12-13 03:14:48', NULL, '2023-12-13 03:12:03', '2023-12-13 03:14:48'),
(9, 'App\\Models\\Mahasiswa', 1, 'cis', '7a79d0eedd97b16650461bdccee36dea887c016cf15892a39b9c33c83ca2b676', '[\"*\"]', '2023-12-13 03:15:35', NULL, '2023-12-13 03:15:11', '2023-12-13 03:15:35'),
(10, 'App\\Models\\Mahasiswa', 1, 'cis', 'eb75f461107a6268d04c98ea4de54c0b5a3418a2b63aa331d2ed1f3d3c9babdb', '[\"*\"]', '2023-12-13 03:30:02', NULL, '2023-12-13 03:21:36', '2023-12-13 03:30:02'),
(11, 'App\\Models\\Mahasiswa', 2, 'cis', '7bfd2a209c1bd06099fbd7b038db62a9d6ab8637bff80d9920170fc533f8ed14', '[\"*\"]', NULL, NULL, '2023-12-13 03:31:58', '2023-12-13 03:31:58'),
(12, 'App\\Models\\Mahasiswa', 3, 'cis', 'f68c01cca6b11faf5f7a76c69e4448db48fa59b8d44bfed75f3ec13da29a6191', '[\"*\"]', NULL, NULL, '2023-12-13 03:34:24', '2023-12-13 03:34:24'),
(13, 'App\\Models\\Mahasiswa', 3, 'cis', '4a7e83433074f60070e6072d128f3f9db31d251290607366718edf61d82b2421', '[\"*\"]', '2023-12-13 03:34:37', NULL, '2023-12-13 03:34:36', '2023-12-13 03:34:37'),
(14, 'App\\Models\\Mahasiswa', 3, 'cis', 'fc3bc72f89f9ab4dcc25e90e831850474e26e25268e691b0ddf99b41a2123fbf', '[\"*\"]', '2023-12-13 09:49:34', NULL, '2023-12-13 03:40:54', '2023-12-13 09:49:34'),
(15, 'App\\Models\\Mahasiswa', 1, 'cis', '3927981bb9001fa6bcf21c2888c211bd34990a5e92f5caf427b4372c7e4395a8', '[\"*\"]', '2023-12-13 03:43:01', NULL, '2023-12-13 03:42:32', '2023-12-13 03:43:01'),
(16, 'App\\Models\\Mahasiswa', 3, 'cis', '55474a3fced022009f26fa59d112f8c8955cfd90d6315b92c45a19098733cba2', '[\"*\"]', '2023-12-13 03:43:18', NULL, '2023-12-13 03:43:17', '2023-12-13 03:43:18'),
(17, 'App\\Models\\Mahasiswa', 3, 'cis', 'ab6d6b805666b7633e96e99a62eb29c6d047289eacaf93b5aa9908df414f4467', '[\"*\"]', '2023-12-13 03:55:46', NULL, '2023-12-13 03:55:45', '2023-12-13 03:55:46'),
(18, 'App\\Models\\Mahasiswa', 3, 'cis', 'c5a54f8cde6595aa38b3870556aef8bd0811c694bc34a5304b3f2eaca5ebb7ab', '[\"*\"]', '2023-12-13 04:01:09', NULL, '2023-12-13 04:00:39', '2023-12-13 04:01:09'),
(19, 'App\\Models\\Mahasiswa', 3, 'cis', '7dac843547ccff6e82ff29de6a2ddec043ae81717783da574c94c5c4f25d1525', '[\"*\"]', '2023-12-13 04:01:37', NULL, '2023-12-13 04:01:36', '2023-12-13 04:01:37'),
(20, 'App\\Models\\Mahasiswa', 1, 'cis', 'fa3c3c8a579ee033bfa98aa04a33a5964bf88667c78cecb09906cf626ae642f6', '[\"*\"]', '2023-12-13 04:01:55', NULL, '2023-12-13 04:01:54', '2023-12-13 04:01:55'),
(21, 'App\\Models\\Mahasiswa', 1, 'cis', '41d4908854887261cc61f54945d836e2456a3a93b02080341c9df1a09fe28900', '[\"*\"]', '2023-12-13 09:12:27', NULL, '2023-12-13 09:12:26', '2023-12-13 09:12:27'),
(22, 'App\\Models\\Mahasiswa', 3, 'cis', 'c081fa7ed8e176a8cc25a57e48e87a8eefdd5c221a9066c2a0da7270706bf59f', '[\"*\"]', '2023-12-13 09:24:24', NULL, '2023-12-13 09:13:15', '2023-12-13 09:24:24'),
(23, 'App\\Models\\Mahasiswa', 3, 'cis', '81672cf84daf52f55061fd18abbf08d067c185a73fad586a00ca1eb7e069775c', '[\"*\"]', '2023-12-13 09:26:28', NULL, '2023-12-13 09:26:25', '2023-12-13 09:26:28'),
(24, 'App\\Models\\Mahasiswa', 3, 'cis', '979adb6a99fb9554788b1f4bccba47112d259971894126301051d994a4d6e062', '[\"*\"]', '2023-12-13 09:27:35', NULL, '2023-12-13 09:27:33', '2023-12-13 09:27:35'),
(25, 'App\\Models\\Mahasiswa', 3, 'cis', '7e1acb32a0a30c7e1037328a08709bea347d41aa376259115f47bc8186eb5b2f', '[\"*\"]', '2023-12-13 09:28:46', NULL, '2023-12-13 09:28:46', '2023-12-13 09:28:46'),
(26, 'App\\Models\\Mahasiswa', 3, 'cis', '5cf7de039e85c060190b609624da84a3304b13eddea8f659a0d20286832f0768', '[\"*\"]', '2023-12-13 09:29:24', NULL, '2023-12-13 09:29:22', '2023-12-13 09:29:24'),
(27, 'App\\Models\\Mahasiswa', 3, 'cis', '4cb71ef7654561aa0b00df93182c543510887fc61721839e2353d330b4646149', '[\"*\"]', '2023-12-13 09:31:55', NULL, '2023-12-13 09:31:04', '2023-12-13 09:31:55'),
(28, 'App\\Models\\Mahasiswa', 3, 'cis', '1a5beff7bbcfac830a91563946dc4e56b8ec3883bcfe00cbc48ad09c50dda8f1', '[\"*\"]', '2023-12-13 09:34:05', NULL, '2023-12-13 09:34:04', '2023-12-13 09:34:05'),
(29, 'App\\Models\\Mahasiswa', 3, 'cis', 'b10d98555b766165cbb2f94da27162a960c8ca534503a64cea767a8fe9a1ed20', '[\"*\"]', '2023-12-13 09:36:39', NULL, '2023-12-13 09:36:38', '2023-12-13 09:36:39'),
(30, 'App\\Models\\Mahasiswa', 3, 'cis', 'c598e9d861a769cfc9c6da62a43382ba3d7e656f790564b5c07543220f8ed66c', '[\"*\"]', '2023-12-13 09:38:10', NULL, '2023-12-13 09:38:09', '2023-12-13 09:38:10'),
(31, 'App\\Models\\Mahasiswa', 3, 'cis', '5edd0f472d473e3c923b7ee74fa4d58e822957f35191fc2bb884a7607cda84b9', '[\"*\"]', '2023-12-13 09:38:59', NULL, '2023-12-13 09:38:39', '2023-12-13 09:38:59'),
(32, 'App\\Models\\Mahasiswa', 3, 'cis', '11d6bff94797cb6114531667b45e50be424b7f44365f1f0434c0d50852c261fa', '[\"*\"]', '2023-12-13 09:43:22', NULL, '2023-12-13 09:43:21', '2023-12-13 09:43:22'),
(33, 'App\\Models\\Mahasiswa', 3, 'cis', 'b2655d3b6a05ec0f5856aa85fa06d057c13798b857cae24945d428e260a44417', '[\"*\"]', '2023-12-13 10:00:40', NULL, '2023-12-13 10:00:39', '2023-12-13 10:00:40'),
(34, 'App\\Models\\Mahasiswa', 3, 'cis', '458a8f882157bd7a16c83e5fef4d6e097f784300375985e713a4a5f698c64bc3', '[\"*\"]', '2023-12-13 10:02:03', NULL, '2023-12-13 10:02:02', '2023-12-13 10:02:03'),
(35, 'App\\Models\\Mahasiswa', 3, 'cis', '8e54481d27789c98d4ffdca9b16c492d9918c090eec361a51e00a77fdd196212', '[\"*\"]', '2023-12-13 10:03:09', NULL, '2023-12-13 10:03:08', '2023-12-13 10:03:09'),
(36, 'App\\Models\\Mahasiswa', 3, 'cis', '4b9a63f6fba6903b8978fd737985214b44121b86f2ef6b3165de7874bf45df69', '[\"*\"]', '2023-12-13 10:05:04', NULL, '2023-12-13 10:03:56', '2023-12-13 10:05:04'),
(37, 'App\\Models\\Mahasiswa', 3, 'cis', '97b6b38747094823b3ef0b3f59be94a693b7891d1a2e23e641404e24010bc2ac', '[\"*\"]', '2023-12-13 10:09:29', NULL, '2023-12-13 10:06:41', '2023-12-13 10:09:29'),
(38, 'App\\Models\\Mahasiswa', 1, 'cis', 'e599537e50b8668a3506c5cb5b6d8c1f2c8f90d412ed974ee1d78c9fcec3c3b5', '[\"*\"]', '2023-12-13 20:05:15', NULL, '2023-12-13 20:05:12', '2023-12-13 20:05:15'),
(39, 'App\\Models\\Mahasiswa', 3, 'cis', 'a1d9a3b9482254ab5ef953b1c9e3d146d955ba8ead3887c551b36224fbd0d383', '[\"*\"]', '2023-12-13 20:05:30', NULL, '2023-12-13 20:05:29', '2023-12-13 20:05:30'),
(40, 'App\\Models\\Mahasiswa', 3, 'cis', '8041dad804af68fee99596c3e0c3f154573cec9a6de4e64b2bbe200d52ac3e46', '[\"*\"]', '2023-12-13 20:23:39', NULL, '2023-12-13 20:23:38', '2023-12-13 20:23:39'),
(41, 'App\\Models\\Mahasiswa', 1, 'cis', 'b22d9decd3d2a07d71a619fe0c168a47b56331c8c8dfc04015af6d9114f536ce', '[\"*\"]', '2023-12-13 20:29:07', NULL, '2023-12-13 20:24:20', '2023-12-13 20:29:07'),
(42, 'App\\Models\\Mahasiswa', 3, 'cis', '1fac44cac7bcbb4ec7ef68f139939bfa443e9a80d8498166ca22709c7a4ff835', '[\"*\"]', '2023-12-13 20:48:30', NULL, '2023-12-13 20:48:28', '2023-12-13 20:48:30'),
(43, 'App\\Models\\Mahasiswa', 3, 'cis', '2783a6bf665a6c4dfa3a4b59532b2ddabee759c50bad32cbe16fc0a70e211a0d', '[\"*\"]', '2023-12-13 20:55:32', NULL, '2023-12-13 20:55:31', '2023-12-13 20:55:32'),
(44, 'App\\Models\\Mahasiswa', 3, 'cis', '3879b8196674d155bddb3b4cd32b6ca3f17ae43d0e16281bbb312b09f56879b5', '[\"*\"]', '2023-12-13 20:57:10', NULL, '2023-12-13 20:57:09', '2023-12-13 20:57:10'),
(45, 'App\\Models\\Mahasiswa', 3, 'cis', 'b773f57f6f05a050dd55a06f1b50d90357933d459d9eff39071fc9264ff5477a', '[\"*\"]', '2023-12-13 20:59:45', NULL, '2023-12-13 20:59:45', '2023-12-13 20:59:45'),
(46, 'App\\Models\\Mahasiswa', 3, 'cis', 'da2abae83cd90754ba50d829f95a806d48dcf874a6a66afb870a571dfd441beb', '[\"*\"]', '2023-12-13 21:00:37', NULL, '2023-12-13 21:00:37', '2023-12-13 21:00:37'),
(47, 'App\\Models\\Mahasiswa', 3, 'cis', '5e917948f22154a53f882262a2ff362f443f67919dfbcbfa9ba04df7d6aeac37', '[\"*\"]', '2023-12-13 21:02:02', NULL, '2023-12-13 21:01:23', '2023-12-13 21:02:02'),
(48, 'App\\Models\\Mahasiswa', 1, 'cis', '4369cc213cc30915e077bb0d3c2cc809e81d39f58ecde6b936ad7d02d2cc8111', '[\"*\"]', '2023-12-13 21:11:31', NULL, '2023-12-13 21:11:31', '2023-12-13 21:11:31'),
(49, 'App\\Models\\Mahasiswa', 3, 'cis', '072e49b1c1c8462fdb67817916955940ecbcdb2d9dd03499828fb531ea9c1012', '[\"*\"]', '2023-12-13 21:16:04', NULL, '2023-12-13 21:13:22', '2023-12-13 21:16:04'),
(50, 'App\\Models\\Mahasiswa', 3, 'cis', '449e67e5f2c49da0e58421ad1fadde83ef170788c2072df6547f3b31b39948b0', '[\"*\"]', '2023-12-13 21:24:13', NULL, '2023-12-13 21:24:13', '2023-12-13 21:24:13'),
(51, 'App\\Models\\Mahasiswa', 3, 'cis', '9bd01ad25318a8d675f491add501b70fe9f506ca74f1c0ccc70584e020a32dce', '[\"*\"]', '2023-12-13 21:25:47', NULL, '2023-12-13 21:25:28', '2023-12-13 21:25:47'),
(52, 'App\\Models\\Mahasiswa', 1, 'cis', 'ebc41f6eff0dac2d37f47cb5857be8cc2d91d244bcb725f6ebe34dbd815670e1', '[\"*\"]', '2023-12-13 21:26:13', NULL, '2023-12-13 21:26:12', '2023-12-13 21:26:13'),
(53, 'App\\Models\\Mahasiswa', 3, 'cis', '21da5e8e5451e0dd7e173ff8bd647f4fa3319934eaf87fb82faa090cf0bdcc80', '[\"*\"]', '2023-12-13 21:27:06', NULL, '2023-12-13 21:27:04', '2023-12-13 21:27:06'),
(54, 'App\\Models\\Mahasiswa', 1, 'cis', '77f1e91b176a02860a7372cf19980dc7b8c43b0f3b13b9b07e03ee0d00d71e0d', '[\"*\"]', '2023-12-13 21:28:51', NULL, '2023-12-13 21:27:29', '2023-12-13 21:28:51'),
(55, 'App\\Models\\Mahasiswa', 3, 'cis', 'c00d58eb9e63aedc3251233ad0ccf8db14759c442d2aca881114e8ae2bba9605', '[\"*\"]', '2023-12-13 21:46:38', NULL, '2023-12-13 21:31:48', '2023-12-13 21:46:38'),
(56, 'App\\Models\\Mahasiswa', 1, 'cis', 'b3426273082e3e654cc3c4e7af05f1f79d01faef405e32848ef98a2853fa9a05', '[\"*\"]', '2023-12-13 23:43:51', NULL, '2023-12-13 23:34:10', '2023-12-13 23:43:51'),
(57, 'App\\Models\\Mahasiswa', 1, 'cis', '3893a4009694dd94d7144a71ee57d37abf0aa46a9eaeb817e61ab167d8082eab', '[\"*\"]', '2023-12-13 23:46:14', NULL, '2023-12-13 23:46:13', '2023-12-13 23:46:14'),
(58, 'App\\Models\\Mahasiswa', 3, 'cis', 'c4f2860a332baf7331ee6aff52377b9177ecb51cb89aa44682a26da3906b87e0', '[\"*\"]', '2023-12-13 23:47:33', NULL, '2023-12-13 23:46:33', '2023-12-13 23:47:33'),
(59, 'App\\Models\\Mahasiswa', 1, 'cis', '565fc4832893928973945f298b45843559d22b1ee686ee53d74c01735cf6d8cc', '[\"*\"]', '2023-12-13 23:47:52', NULL, '2023-12-13 23:47:47', '2023-12-13 23:47:52'),
(60, 'App\\Models\\Mahasiswa', 1, 'cis', 'cc448911e296bf6c2ec75db7c7f6a4ac5144dea285579c6c32b0998b17fb9b6a', '[\"*\"]', '2023-12-13 23:58:24', NULL, '2023-12-13 23:48:29', '2023-12-13 23:58:24'),
(61, 'App\\Models\\Mahasiswa', 3, 'cis', '82380734eacedf1539096a2340df3f6ed1805eb673a0e3b7065807990fbb7589', '[\"*\"]', '2023-12-14 00:03:46', NULL, '2023-12-13 23:58:54', '2023-12-14 00:03:46'),
(62, 'App\\Models\\Mahasiswa', 3, 'cis', '7f128755246552fa995cea8eff05fd173c960bd6475c5939a288006a0e0f219a', '[\"*\"]', '2023-12-14 00:13:44', NULL, '2023-12-14 00:10:19', '2023-12-14 00:13:44'),
(63, 'App\\Models\\admins', 1, 'cis', '1a5bc8a4006e27fbacc57636406ea4b2b8f679ad93ac5f850e55ae325668c5e2', '[\"*\"]', '2023-12-16 03:48:39', NULL, '2023-12-14 00:44:51', '2023-12-16 03:48:39'),
(64, 'App\\Models\\admins', 1, 'cis', 'e8e1ca693861d89bd5ea0d4ed154bff4a347a68bf5f69b26c96a21c9501f4a43', '[\"*\"]', NULL, NULL, '2023-12-14 00:46:46', '2023-12-14 00:46:46'),
(65, 'App\\Models\\admins', 1, 'cis', '98624ba08f78dca40a73064c8644e593da0e6723a6655a1bf1c48825e4dee983', '[\"*\"]', NULL, NULL, '2023-12-14 00:49:06', '2023-12-14 00:49:06'),
(66, 'App\\Models\\admins', 1, 'cis', 'b830cce3522c87c0988abfda18f6df80e857c4b81794fa1b8964bb21cd065c66', '[\"*\"]', '2023-12-14 01:08:36', NULL, '2023-12-14 01:08:35', '2023-12-14 01:08:36'),
(67, 'App\\Models\\admins', 1, 'cis', '0594d5e06d1eee412a01785422298ab141842789aa88317b58f1d345e1dcd8dc', '[\"*\"]', '2023-12-14 01:11:20', NULL, '2023-12-14 01:11:20', '2023-12-14 01:11:20'),
(68, 'App\\Models\\admins', 1, 'cis', '639a1ba9a1a5f9e732241aee4f5f15228ac86ea2e4e798cf8675a59bd24529a7', '[\"*\"]', '2023-12-14 01:12:19', NULL, '2023-12-14 01:12:18', '2023-12-14 01:12:19'),
(69, 'App\\Models\\admins', 1, 'cis', 'ae2b27907d7c48220b2f1f4dfd70462c36dccf9dedf76a2035b91a36975cb381', '[\"*\"]', '2023-12-14 02:48:44', NULL, '2023-12-14 01:12:54', '2023-12-14 02:48:44'),
(70, 'App\\Models\\admins', 1, 'cis', '4f1ec7513bbcd51e27f6399611aaaf160973b7069740afb2f2e1a70ff0f637ce', '[\"*\"]', '2023-12-14 02:56:44', NULL, '2023-12-14 02:56:33', '2023-12-14 02:56:44'),
(71, 'App\\Models\\admins', 1, 'cis', 'abb183fe1423a42cadd015d0d8e00112b6ed6e9b88962a64e78b389fd60c2816', '[\"*\"]', '2023-12-14 03:05:47', NULL, '2023-12-14 02:58:16', '2023-12-14 03:05:47'),
(72, 'App\\Models\\Mahasiswa', 1, 'cis', '48fb3e8ccc1bf2a8bb228cb7be7712d121a84a70df383389f1c70b229d8c45ce', '[\"*\"]', '2023-12-14 03:06:35', NULL, '2023-12-14 03:06:29', '2023-12-14 03:06:35'),
(73, 'App\\Models\\admins', 1, 'cis', '246fadd1f5f038504de7b281ca6ba300090a343783ef75d7224498f5017721c1', '[\"*\"]', '2023-12-14 03:11:18', NULL, '2023-12-14 03:08:38', '2023-12-14 03:11:18'),
(74, 'App\\Models\\Mahasiswa', 3, 'cis', '9c1b1b2f7d9efcb1c55481349302d66e792af2faa9ee9e8a20ef6c9691417bb4', '[\"*\"]', '2023-12-14 03:12:37', NULL, '2023-12-14 03:11:58', '2023-12-14 03:12:37'),
(75, 'App\\Models\\Mahasiswa', 1, 'cis', '4651a604fb00de68cbb418a0636af13cd96f5b7c9923e1b540c48fd70647b39b', '[\"*\"]', '2023-12-14 03:22:31', NULL, '2023-12-14 03:22:30', '2023-12-14 03:22:31'),
(76, 'App\\Models\\admins', 1, 'cis', '4bc3e202c4c582a187c00703a49c435eb8ce898f58bef3fa965c23ba8ebbbc8d', '[\"*\"]', '2023-12-14 06:32:34', NULL, '2023-12-14 06:31:32', '2023-12-14 06:32:34'),
(77, 'App\\Models\\Mahasiswa', 1, 'cis', '595e2df3af248aded027fa4904ec4defb06dcef67ca6ac7fb5b61c27cd02fb86', '[\"*\"]', '2023-12-14 07:04:50', NULL, '2023-12-14 06:35:29', '2023-12-14 07:04:50'),
(78, 'App\\Models\\Mahasiswa', 3, 'cis', '0bd6f26c98b73dc5c35654a6dae1c802cffda70287000d9e1fb0437d0ac3190e', '[\"*\"]', '2023-12-14 07:09:57', NULL, '2023-12-14 07:05:07', '2023-12-14 07:09:57'),
(79, 'App\\Models\\admins', 1, 'cis', '04da19b397c873cba470d7b50b3e0f7e6c4697f1b9c732d6d54cd4d0ed5725af', '[\"*\"]', '2023-12-14 07:21:05', NULL, '2023-12-14 07:10:32', '2023-12-14 07:21:05'),
(80, 'App\\Models\\admins', 1, 'cis', 'fd99239cd992b0a944a9f8265d5c94d2d0e39d4f1a5df54aa9a4e9cdd936a8d4', '[\"*\"]', '2023-12-14 07:35:32', NULL, '2023-12-14 07:22:03', '2023-12-14 07:35:32'),
(81, 'App\\Models\\admins', 1, 'cis', '0ebba10c67c44c6b38dc7fa8ec86edb51b0feaa74cc34fa9f5b6c48c87e9bd38', '[\"*\"]', '2023-12-14 07:41:10', NULL, '2023-12-14 07:41:07', '2023-12-14 07:41:10'),
(82, 'App\\Models\\admins', 1, 'cis', '8f381a9d30d04f0e73b3197353bd435e701bfb8fa7e99ce94a55b791cc6a97bb', '[\"*\"]', '2023-12-14 07:41:53', NULL, '2023-12-14 07:41:49', '2023-12-14 07:41:53'),
(83, 'App\\Models\\admins', 1, 'cis', '8682344feb2cdad4b84f1102636956e1848be1ef6327b36601c0a408241181df', '[\"*\"]', '2023-12-14 07:46:53', NULL, '2023-12-14 07:45:25', '2023-12-14 07:46:53'),
(84, 'App\\Models\\admins', 1, 'cis', 'd2623e610e42c3ae542193db78e2691d6e952845e4eca855c085dfa5ba242f77', '[\"*\"]', '2023-12-14 07:53:49', NULL, '2023-12-14 07:53:46', '2023-12-14 07:53:49'),
(85, 'App\\Models\\admins', 1, 'cis', '9119dc8b29f526160046b39cd4ee4dcc9a7acaa76e0f5c9f70bc65dd7cc358dc', '[\"*\"]', '2023-12-14 08:02:25', NULL, '2023-12-14 07:58:26', '2023-12-14 08:02:25'),
(86, 'App\\Models\\Mahasiswa', 3, 'cis', '53ce2bbf0c8052f76d95d3ea27dc3e837583a6a6d8fa682244779113a0330a04', '[\"*\"]', '2023-12-14 08:02:58', NULL, '2023-12-14 08:02:57', '2023-12-14 08:02:58'),
(87, 'App\\Models\\Mahasiswa', 1, 'cis', '1b415fc88811b5b6690f343b18bf5cbab4d38ff957fc48ae9b674e4f943680e4', '[\"*\"]', '2023-12-14 09:46:38', NULL, '2023-12-14 09:07:18', '2023-12-14 09:46:38'),
(88, 'App\\Models\\admins', 1, 'cis', 'f415a47b9fbfa6475fb26500272283e67a855134dc7f38094743700e7e98c53f', '[\"*\"]', '2023-12-14 09:55:40', NULL, '2023-12-14 09:47:02', '2023-12-14 09:55:40'),
(89, 'App\\Models\\admins', 1, 'cis', 'db153addbfd748380039f45c3cd6c64765a67ebc68bdf5ead12a5a4595f97dd9', '[\"*\"]', '2023-12-14 09:56:58', NULL, '2023-12-14 09:56:41', '2023-12-14 09:56:58'),
(90, 'App\\Models\\admins', 1, 'cis', 'd4946e38f6eaf3b69b66f16754af2e9defefe6ffa9675fd5f899ce4f41b434cf', '[\"*\"]', '2023-12-14 18:48:55', NULL, '2023-12-14 18:48:54', '2023-12-14 18:48:55'),
(91, 'App\\Models\\Mahasiswa', 1, 'cis', 'f41a7678e841960c719f0f4071b4159bd0d5d54e2fe5355d84c1b5b1462f0a3b', '[\"*\"]', '2023-12-14 19:34:58', NULL, '2023-12-14 19:32:38', '2023-12-14 19:34:58'),
(92, 'App\\Models\\admins', 1, 'cis', 'cfbcc3b95abd5dfa7a032343b32c86cbc8cb332def1ff072104dfdc329a9d563', '[\"*\"]', '2023-12-14 20:16:51', NULL, '2023-12-14 20:16:51', '2023-12-14 20:16:51'),
(93, 'App\\Models\\admins', 1, 'cis', '02401d4ee7aea9a3663f81fba6323d038b8bb58b9fe9348ec0bbc99cb1148ebd', '[\"*\"]', '2023-12-14 21:05:47', NULL, '2023-12-14 20:27:43', '2023-12-14 21:05:47'),
(94, 'App\\Models\\admins', 1, 'cis', '8e8c5724acd3d0f5d4570594e97fbdce6d3be55a328a9bf3cbe8574630b2e1ce', '[\"*\"]', '2023-12-14 21:49:54', NULL, '2023-12-14 21:06:07', '2023-12-14 21:49:54'),
(95, 'App\\Models\\admins', 1, 'cis', '196b75106cc644e60cc2148daafb4d65a8dec110bfed05db0aad50af600d6d13', '[\"*\"]', '2023-12-14 21:51:53', NULL, '2023-12-14 21:50:35', '2023-12-14 21:51:53'),
(96, 'App\\Models\\admins', 1, 'cis', '3bcd931c1eab039db716d85e621c9bf04f4df15ec814f0e2f2dac84f5790c9d7', '[\"*\"]', '2023-12-16 02:55:52', NULL, '2023-12-16 02:26:05', '2023-12-16 02:55:52'),
(97, 'App\\Models\\admins', 1, 'cis', '7b07f1f746423a497323122978ab9f23c518266ce8ec79697adff55f7978aa40', '[\"*\"]', '2023-12-16 03:05:45', NULL, '2023-12-16 03:03:40', '2023-12-16 03:05:45'),
(98, 'App\\Models\\admins', 1, 'cis', '5051676adb80c791121aa288cd4c2ef4647a142fd8d16249154538eb5b92d522', '[\"*\"]', '2023-12-16 03:14:12', NULL, '2023-12-16 03:06:56', '2023-12-16 03:14:12'),
(99, 'App\\Models\\admins', 1, 'cis', '32f4c53a7c045a386211b6230264b9a025140fa7979d948947e400bc10fe3169', '[\"*\"]', '2023-12-16 03:18:20', NULL, '2023-12-16 03:16:21', '2023-12-16 03:18:20'),
(100, 'App\\Models\\admins', 1, 'cis', '2306438f60ba4e101b907cd5bb96b7444a90627c21555ca73575b599fcd2fbfd', '[\"*\"]', '2023-12-16 03:22:22', NULL, '2023-12-16 03:19:02', '2023-12-16 03:22:22'),
(101, 'App\\Models\\admins', 1, 'cis', '70ae925c68d56694bdd3f474833b78ccfdc2dd619047e6b7282cf33f99bd5207', '[\"*\"]', '2023-12-16 03:23:59', NULL, '2023-12-16 03:23:54', '2023-12-16 03:23:59'),
(102, 'App\\Models\\admins', 1, 'cis', 'c5dc23916e61cffa029a105f6f4a8938bf4f6078d715429f10c75c594bc4176a', '[\"*\"]', '2023-12-16 03:24:41', NULL, '2023-12-16 03:24:32', '2023-12-16 03:24:41'),
(103, 'App\\Models\\admins', 1, 'cis', 'e6361864db1b2973119c0204f5d332d324d09900c2f951658e73abd7d2e67ee8', '[\"*\"]', '2023-12-16 03:27:05', NULL, '2023-12-16 03:26:59', '2023-12-16 03:27:05'),
(104, 'App\\Models\\admins', 1, 'cis', '81bf2558b96e612b981ce23c6cac9b4f2e41009071554979691f62b2b869c94a', '[\"*\"]', '2023-12-16 03:34:50', NULL, '2023-12-16 03:28:19', '2023-12-16 03:34:50'),
(105, 'App\\Models\\admins', 1, 'cis', '18fa55099ba99b425e2c45254f86706d54042a860ac8b982964cec888005694e', '[\"*\"]', '2023-12-16 03:35:45', NULL, '2023-12-16 03:35:40', '2023-12-16 03:35:45'),
(106, 'App\\Models\\admins', 1, 'cis', '0fbb744e663cd8f13e5ed1105d39f5e5bb87a935fb2662e902851389922454a0', '[\"*\"]', '2023-12-16 03:37:52', NULL, '2023-12-16 03:37:47', '2023-12-16 03:37:52'),
(107, 'App\\Models\\admins', 1, 'cis', 'c26b2c7629c3b163f47e89b29c40a85482ce7abfe8d13c00cb0a64c91ba197fa', '[\"*\"]', '2023-12-16 03:38:48', NULL, '2023-12-16 03:38:44', '2023-12-16 03:38:48'),
(108, 'App\\Models\\admins', 1, 'cis', 'e6b94abf3f016a7f0626d94afeae8f08a91f06dab22fa8602ab1541d571c55aa', '[\"*\"]', '2023-12-16 03:56:35', NULL, '2023-12-16 03:49:32', '2023-12-16 03:56:35'),
(109, 'App\\Models\\admins', 1, 'cis', '054369eec2f1a9a16a4558430e76aa34d1b43105948c78e885063a087f1e9e10', '[\"*\"]', '2023-12-16 06:27:17', NULL, '2023-12-16 06:16:38', '2023-12-16 06:27:17'),
(110, 'App\\Models\\Mahasiswa', 1, 'cis', 'c371eff14682bd8798cbc43cfc5940705e31fdc11fef976d0a82c329089c1e35', '[\"*\"]', '2023-12-16 06:31:20', NULL, '2023-12-16 06:27:46', '2023-12-16 06:31:20'),
(111, 'App\\Models\\Mahasiswa', 3, 'cis', '0ab65a9605fee990887fd78c5462f9cf379a05ed002f13119b8cd293b2f9a008', '[\"*\"]', '2023-12-16 20:14:28', NULL, '2023-12-16 20:14:28', '2023-12-16 20:14:28'),
(112, 'App\\Models\\Mahasiswa', 3, 'cis', '5eae55d41b854bd00ce424f37e1773ce7e8ef33b83e19a113debd1b1385f3091', '[\"*\"]', '2023-12-16 21:37:05', NULL, '2023-12-16 21:36:45', '2023-12-16 21:37:05'),
(113, 'App\\Models\\Mahasiswa', 3, 'cis', '98e248b5e6a369123bf020e3192fda8c61e6c754c5699017b320cb82fe1c5a68', '[\"*\"]', '2023-12-16 22:35:16', NULL, '2023-12-16 21:37:36', '2023-12-16 22:35:16'),
(114, 'App\\Models\\Mahasiswa', 1, 'cis', 'cd976b403321ff3884505c40850fd8b902e2ded6ecf6c4071f61522fe6b585c3', '[\"*\"]', '2023-12-16 22:44:08', NULL, '2023-12-16 22:39:02', '2023-12-16 22:44:08'),
(115, 'App\\Models\\admins', 1, 'cis', '29abf901545f512799872c6ba50dbc95a453c264ede88d6e4c1f3cac9a317a98', '[\"*\"]', '2023-12-16 22:44:35', NULL, '2023-12-16 22:44:28', '2023-12-16 22:44:35'),
(116, 'App\\Models\\Mahasiswa', 1, 'cis', '567da30b6b2db1d1b80d65f92e40d3b1898c935595f5365f2530434cea51e6cd', '[\"*\"]', '2023-12-16 23:10:04', NULL, '2023-12-16 22:44:56', '2023-12-16 23:10:04'),
(117, 'App\\Models\\Mahasiswa', 3, 'cis', '875f9c4c151e522fb51cb8bfc183603880175d6b3495bca4a8583347c7258113', '[\"*\"]', '2023-12-16 23:13:38', NULL, '2023-12-16 23:10:21', '2023-12-16 23:13:38'),
(118, 'App\\Models\\Mahasiswa', 1, 'cis', 'cf28fbf9ddb11252d2fe3bf173185aeec2022aa9050b4ca82784d82b6a2ce822', '[\"*\"]', '2023-12-16 23:15:22', NULL, '2023-12-16 23:13:51', '2023-12-16 23:15:22'),
(119, 'App\\Models\\admins', 1, 'cis', 'a4e8909951501382518aa69175d169a22462ce8a01ef9f4366ccae6f2e791c1a', '[\"*\"]', '2023-12-16 23:15:45', NULL, '2023-12-16 23:15:38', '2023-12-16 23:15:45'),
(120, 'App\\Models\\admins', 1, 'cis', 'd4f6b0a2407643ee32eb1a44e8fa5556f3df9edd0b2c14463a775e95b629d8c4', '[\"*\"]', '2023-12-17 02:18:31', NULL, '2023-12-17 01:42:14', '2023-12-17 02:18:31'),
(121, 'App\\Models\\Mahasiswa', 3, 'cis', '7388fe400798bd3ad7e104660b2800644581fe124ef529bc6b302fbfcfbc0d47', '[\"*\"]', '2023-12-17 02:19:56', NULL, '2023-12-17 02:19:10', '2023-12-17 02:19:56'),
(122, 'App\\Models\\Mahasiswa', 1, 'cis', '42c8ad93faa0627689f62a3850350e5f4711628c858f8637ccf70d93fea453ec', '[\"*\"]', '2023-12-17 02:29:41', NULL, '2023-12-17 02:23:25', '2023-12-17 02:29:41'),
(123, 'App\\Models\\Mahasiswa', 1, 'cis', '54d20bda9d993efdb9b0c1c67bfc336c0cf6bee546fd09205ba484a77e70107e', '[\"*\"]', '2023-12-17 03:39:40', NULL, '2023-12-17 03:32:10', '2023-12-17 03:39:40'),
(124, 'App\\Models\\admins', 1, 'cis', '67482f45a24be2e652f88ec5a802c490fe8ce665e8af9dd3bafa34dfb38be99a', '[\"*\"]', '2023-12-17 08:06:22', NULL, '2023-12-17 07:24:51', '2023-12-17 08:06:22'),
(125, 'App\\Models\\admins', 1, 'cis', 'a304a47438da459ef9c278ba25cb53c7ab9b7f0ecb42844b7b4353a5b3461d5b', '[\"*\"]', '2023-12-17 08:22:57', NULL, '2023-12-17 08:11:07', '2023-12-17 08:22:57'),
(126, 'App\\Models\\admins', 1, 'cis', '20ec03cc695b7147b94930c8b2f47aed04a0e24165631e38854de0c0605a8d4b', '[\"*\"]', '2023-12-22 03:57:09', NULL, '2023-12-17 08:13:05', '2023-12-22 03:57:09'),
(127, 'App\\Models\\admins', 1, 'cis', 'da36ee677b9cae744f93a882ecf8bf53c4f9d4c8a83efd7f7719eea8103a6eaf', '[\"*\"]', '2023-12-17 08:26:14', NULL, '2023-12-17 08:26:12', '2023-12-17 08:26:14'),
(128, 'App\\Models\\admins', 1, 'cis', '896bd663f8019c79ada153a84f622f5683c7487bf66b6329cb19a5ec69c24612', '[\"*\"]', '2023-12-17 08:27:13', NULL, '2023-12-17 08:27:13', '2023-12-17 08:27:13'),
(129, 'App\\Models\\admins', 1, 'cis', 'f2592609402d1f8f53759f31c4a090f1c91034a4e6c080d69b5dc36d01e878a8', '[\"*\"]', '2023-12-17 08:48:18', NULL, '2023-12-17 08:28:57', '2023-12-17 08:48:18'),
(130, 'App\\Models\\admins', 1, 'cis', 'bca03ea902647fc93501762bb0cb6bbefcb9d2abc5cab39a5e9db5b08a299df0', '[\"*\"]', '2023-12-17 18:01:16', NULL, '2023-12-17 17:57:38', '2023-12-17 18:01:16'),
(131, 'App\\Models\\admins', 1, 'cis', '80cc52a20307ccf4fe862cab4aa713ae6427332ae1e3e0e7635c08dadc1f5eae', '[\"*\"]', '2023-12-17 18:48:53', NULL, '2023-12-17 18:02:16', '2023-12-17 18:48:53'),
(132, 'App\\Models\\admins', 1, 'cis', 'b3d37f6ed7041c96453038164d4afc021bd1291a9fa4e0f460191b6ecc534dbd', '[\"*\"]', '2023-12-17 21:48:19', NULL, '2023-12-17 21:12:20', '2023-12-17 21:48:19'),
(133, 'App\\Models\\admins', 1, 'cis', '70b15a1667b74f30278ce768d8bf2ce154e295c6d01fa22cb6aad0b82f8697be', '[\"*\"]', '2023-12-20 01:09:05', NULL, '2023-12-20 00:41:50', '2023-12-20 01:09:05'),
(134, 'App\\Models\\admins', 1, 'cis', '6f6cc010c8cb0bd8279984081035903e2d5623963fbc646a91ee31e7aaaa719b', '[\"*\"]', '2023-12-21 06:54:27', NULL, '2023-12-21 05:53:43', '2023-12-21 06:54:27'),
(135, 'App\\Models\\admins', 1, 'cis', '624b4098a809ac66ef16f3574e04ecd4edf1afd7d426c2bca853ac50c931589e', '[\"*\"]', '2023-12-21 20:44:29', NULL, '2023-12-21 20:02:02', '2023-12-21 20:44:29'),
(136, 'App\\Models\\admins', 1, 'cis', '43bdd4e0290525968f4408aaea6803df15a3a9ba08c8a698f1f70f7a76dc0a45', '[\"*\"]', '2023-12-21 20:49:13', NULL, '2023-12-21 20:45:52', '2023-12-21 20:49:13'),
(137, 'App\\Models\\admins', 1, 'cis', '388dea0759776b84418915b531269494f3b90cb796a17fcf01f75bb678f9796c', '[\"*\"]', '2023-12-21 23:29:09', NULL, '2023-12-21 22:51:39', '2023-12-21 23:29:09'),
(138, 'App\\Models\\admins', 1, 'cis', '69a262557d10759d92f436c63794d60256bf304da973632123a634dafb22c354', '[\"*\"]', '2023-12-22 02:39:59', NULL, '2023-12-22 02:19:08', '2023-12-22 02:39:59'),
(139, 'App\\Models\\admins', 1, 'cis', '59534521c995b3757861b5e5b624ac191e15ba470bbf5e25df1412284b39713b', '[\"*\"]', '2023-12-22 02:52:50', NULL, '2023-12-22 02:40:36', '2023-12-22 02:52:50'),
(140, 'App\\Models\\admins', 1, 'cis', 'baaf826f9404ec5a6f852c1b7de6fd3ba8c4740b63b9aea5edf7170daf1ff691', '[\"*\"]', '2023-12-22 02:59:02', NULL, '2023-12-22 02:56:03', '2023-12-22 02:59:02'),
(141, 'App\\Models\\admins', 1, 'cis', '938d65f18a1d8557d1b6d6be923e00642f2ef6cac9d3fc552e8eeae9f299f946', '[\"*\"]', NULL, NULL, '2023-12-22 03:30:04', '2023-12-22 03:30:04'),
(142, 'App\\Models\\admins', 1, 'cis', 'cc351020d8532085135258723e0e248e880911033791a02e2261e0fdc559e002', '[\"*\"]', '2023-12-22 03:47:46', NULL, '2023-12-22 03:34:51', '2023-12-22 03:47:46'),
(143, 'App\\Models\\admins', 1, 'cis', 'e935e25bf482bc3aebe1f9055eeac1109994ad8478bbb516b9934e387504efdb', '[\"*\"]', '2023-12-22 03:59:56', NULL, '2023-12-22 03:49:37', '2023-12-22 03:59:56'),
(144, 'App\\Models\\admins', 1, 'cis', '3057eb95be4fb1d2f9f0accfe25841a5c8cd616241548a309c3ce938b0c133e3', '[\"*\"]', '2023-12-22 08:54:26', NULL, '2023-12-22 08:04:37', '2023-12-22 08:54:26'),
(145, 'App\\Models\\admins', 1, 'cis', '76b950ba6bcc5b3536c682084c098489ae5e3e4c95abb41d6876ef9f2d10626c', '[\"*\"]', '2023-12-22 09:12:36', NULL, '2023-12-22 09:03:58', '2023-12-22 09:12:36'),
(146, 'App\\Models\\admins', 1, 'cis', '1e07d792aaec11ffbf314c8083b8c6b9c5ea84847c18db012a6668f2a9db5b4e', '[\"*\"]', '2023-12-22 09:18:01', NULL, '2023-12-22 09:14:03', '2023-12-22 09:18:01'),
(147, 'App\\Models\\admins', 1, 'cis', 'da1676dd56f07a90ac81d7ec866697fb8ed9cdcc8390212e799652117dbd68dd', '[\"*\"]', '2023-12-22 09:32:58', NULL, '2023-12-22 09:23:03', '2023-12-22 09:32:58'),
(148, 'App\\Models\\admins', 1, 'cis', '402b351c9bc835d081e20e39fcb16e7668fd5a1376bb7d93788328958b0a16ef', '[\"*\"]', '2023-12-22 10:00:33', NULL, '2023-12-22 09:34:04', '2023-12-22 10:00:33'),
(149, 'App\\Models\\admins', 1, 'cis', '704b4f9ce458535fa15e6d6b085ee11b81941e3591d3c9c61c0f5f880ebda166', '[\"*\"]', '2023-12-22 22:29:42', NULL, '2023-12-22 22:17:00', '2023-12-22 22:29:42'),
(150, 'App\\Models\\admins', 1, 'cis', '402aaeb8db85737066c3ab9c3cd4b56aca6ee56ca4b4499e1d493d963cd243d7', '[\"*\"]', '2023-12-22 22:31:11', NULL, '2023-12-22 22:30:47', '2023-12-22 22:31:11'),
(151, 'App\\Models\\admins', 1, 'cis', '97fac6d99a50bdc7483c5462a15ef8cccf3cdc72f4cba4caeaf24872a6df3dee', '[\"*\"]', '2023-12-22 22:34:24', NULL, '2023-12-22 22:32:27', '2023-12-22 22:34:24'),
(152, 'App\\Models\\admins', 1, 'cis', 'ffb98829c5e00d2c7231e03009617345a1b7fa059c559444d780cf591d641d60', '[\"*\"]', '2023-12-22 22:38:43', NULL, '2023-12-22 22:34:43', '2023-12-22 22:38:43'),
(153, 'App\\Models\\admins', 1, 'cis', '9b0edcd16612094d2f17d49708b6908887b1b151ebd9ba6a16cd9690d5c39a0a', '[\"*\"]', '2023-12-22 22:41:00', NULL, '2023-12-22 22:39:11', '2023-12-22 22:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `ruangans`
--

CREATE TABLE `ruangans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Ruangan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruangans`
--

INSERT INTO `ruangans` (`id`, `Ruangan`, `created_at`, `updated_at`) VALUES
(1, 'GD512', '2023-12-14 21:04:53', '2023-12-16 03:48:39'),
(2, 'GD513', '2023-12-14 21:13:25', '2023-12-16 03:56:35'),
(6, 'GD514', '2023-12-16 06:18:14', '2023-12-16 06:18:14'),
(7, 'GD515', '2023-12-16 06:25:48', '2023-12-16 22:44:33');

-- --------------------------------------------------------

--
-- Table structure for table `surats`
--

CREATE TABLE `surats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mahasiswa_id` bigint(20) UNSIGNED NOT NULL,
  `Tujuan` varchar(255) NOT NULL,
  `TanggalPengambilan` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surats`
--

INSERT INTO `surats` (`id`, `mahasiswa_id`, `Tujuan`, `TanggalPengambilan`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jejekn', '2023-12-15 13:50:00', 2, '2023-12-14 09:46:30', '2023-12-17 02:17:58'),
(2, 3, 'balige', '2023-12-20 05:28:00', 0, '2023-12-17 02:19:51', '2023-12-17 02:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_ruangans`
--
ALTER TABLE `booking_ruangans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_ruangans_mahasiswa_id_foreign` (`mahasiswa_id`),
  ADD KEY `booking_ruangans_ruangan_id_foreign` (`ruangan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `izin_bermalams`
--
ALTER TABLE `izin_bermalams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `izin_bermalams_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indexes for table `izin_keluars`
--
ALTER TABLE `izin_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `izin_keluars_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indexes for table `kaos`
--
ALTER TABLE `kaos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mahasiswas_ktp_unique` (`ktp`),
  ADD UNIQUE KEY `mahasiswas_nim_unique` (`nim`),
  ADD UNIQUE KEY `mahasiswas_nohp_unique` (`nohp`),
  ADD UNIQUE KEY `mahasiswas_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ruangans`
--
ALTER TABLE `ruangans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surats`
--
ALTER TABLE `surats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surats_mahasiswa_id_foreign` (`mahasiswa_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_ruangans`
--
ALTER TABLE `booking_ruangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `izin_bermalams`
--
ALTER TABLE `izin_bermalams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `izin_keluars`
--
ALTER TABLE `izin_keluars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kaos`
--
ALTER TABLE `kaos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `mahasiswas`
--
ALTER TABLE `mahasiswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `ruangans`
--
ALTER TABLE `ruangans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `surats`
--
ALTER TABLE `surats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_ruangans`
--
ALTER TABLE `booking_ruangans`
  ADD CONSTRAINT `booking_ruangans_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`),
  ADD CONSTRAINT `booking_ruangans_ruangan_id_foreign` FOREIGN KEY (`ruangan_id`) REFERENCES `ruangans` (`id`);

--
-- Constraints for table `izin_bermalams`
--
ALTER TABLE `izin_bermalams`
  ADD CONSTRAINT `izin_bermalams_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`);

--
-- Constraints for table `izin_keluars`
--
ALTER TABLE `izin_keluars`
  ADD CONSTRAINT `izin_keluars_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`);

--
-- Constraints for table `surats`
--
ALTER TABLE `surats`
  ADD CONSTRAINT `surats_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
