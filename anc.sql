-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 24, 2019 at 08:53 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anc`
--

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pertanyaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `pertanyaan`, `jawaban`, `created_at`, `updated_at`) VALUES
(1, 'tanya 1', 'jawab 1', NULL, NULL),
(2, 'tanya 2', 'jawab 2', NULL, NULL),
(3, 'tanya 3', 'jawab 3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`id`, `user_id`, `judul`, `konten`, `foto`, `created_at`, `updated_at`) VALUES
(1, 2, 'Tes forum', 'konten forum', NULL, '2019-10-01 17:00:00', NULL),
(2, 2, 'Tes lagi', 'konten lagi', NULL, '2019-10-19 17:00:00', NULL),
(3, 2, 'tes ketiga', 'konten ketiga', NULL, '2019-10-19 17:00:00', NULL),
(4, 10, 'sayang', 'syaang kamu', NULL, '2019-10-23 13:07:27', '2019-10-23 13:07:27'),
(5, 10, 'ada nih', 'woy', NULL, '2019-10-23 13:47:58', '2019-10-23 13:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `forum_responses`
--

CREATE TABLE `forum_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `respon` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forum_responses`
--

INSERT INTO `forum_responses` (`id`, `forum_id`, `user_id`, `respon`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'respon forum 2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_09_003614_rename_email_to_user_number', 1),
(4, '2019_09_06_102859_remove_unncessary_columns_from_users', 2),
(5, '2019_10_19_223407_add_extra_fields_to_user', 3),
(6, '2019_10_20_090534_create_serba_serbi_table', 4),
(7, '2019_10_20_090548_create_forum_table', 4),
(8, '2019_10_20_090602_create_faq_table', 4),
(9, '2019_10_20_090939_create_forum_responses_table', 4),
(10, '2019_10_20_113045_add_photo_to_users', 5),
(11, '2019_10_21_161541_add_tanggal_lahir_to_user', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serba_serbi`
--

CREATE TABLE `serba_serbi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `serba_serbi`
--

INSERT INTO `serba_serbi` (`id`, `judul`, `konten`, `created_at`, `updated_at`) VALUES
(2, 'Tes Baru', '<p>oi woi</p>\r\n\r\n<p><img alt=\"\" src=\"http://127.0.0.1:8000/images/Untitled-1_1571540041.jpg\" style=\"height:169px; width:300px\" /></p>', '2019-10-20 02:54:08', '2019-10-20 02:54:08'),
(3, 'Tambah lagi', 'a', '2019-10-20 02:54:37', '2019-10-20 02:54:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `awal_hamil` date DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `tipe`, `awal_hamil`, `photo`, `tanggal_lahir`) VALUES
(1, 'Administrator', 'admin', '$2y$10$b/NkcOe.uOWN.aEgc16l5.vrBALeTCRt20mnLlhYYIxGmQfQUldsW', '4', NULL, NULL, NULL),
(2, 'Yulia', 'yulia', '$2y$10$b/NkcOe.uOWN.aEgc16l5.vrBALeTCRt20mnLlhYYIxGmQfQUldsW', '1', '2019-10-20', NULL, NULL),
(7, 'joni', 'joni', '$2y$10$SjchB61xJsg5B6NOOcW//uCHa9O4.3Hgit5Zxuzz3B0L8WiBbeatK', '2', NULL, NULL, NULL),
(10, 'Masku', 'hei', '$2y$10$K3QKI/jbfPK9DyRyh6SVJeLv3e5pHG.Usoyp93hxJDaoRy94D9gZG', '1', '2019-09-18', NULL, '2019-10-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_responses`
--
ALTER TABLE `forum_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `serba_serbi`
--
ALTER TABLE `serba_serbi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forum_responses`
--
ALTER TABLE `forum_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `serba_serbi`
--
ALTER TABLE `serba_serbi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
