-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2019 at 11:16 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_10_195213_create_roles_table', 1),
(9, '2019_08_11_022509_create_role_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('115707c93fa9b80f3228ba7a69f16f4b5749f6c29b978bb610c8cbd440fbeaa44916e8af7611218e', 23, 1, 'MyApp', '[]', 0, '2019-08-14 12:07:10', '2019-08-14 12:07:10', '2020-08-14 18:07:10'),
('2b7a85b3eeb35413395c9760b8edaba69f2b373e656a64c3666567b20e209c3ec8ac02a1683e1333', 67, 1, 'MyApp', '[]', 0, '2019-08-14 12:45:15', '2019-08-14 12:45:15', '2020-08-14 18:45:15'),
('2fc46f5988bbb2b63b6288c7af91ac8f20749e1549145487382c554913ed75996fdf5736fec9c682', 1, 3, 'MyApp', '[]', 0, '2019-08-16 03:03:47', '2019-08-16 03:03:47', '2020-08-16 09:03:47'),
('305ee96955a8816717ff7e29094cee7e40dbc32255e273bcdf9c82ab481d0592a6e95723f45ff2b1', 15, 1, 'MyApp', '[]', 0, '2019-08-14 11:25:08', '2019-08-14 11:25:08', '2020-08-14 17:25:08'),
('3c4546e04daf211aee3e0ed74526a9c7e2f02f9405ad22b071584fa413de6f00614244f60d2e057f', 1, 1, 'MyApp', '[]', 0, '2019-08-15 01:28:52', '2019-08-15 01:28:52', '2020-08-15 07:28:52'),
('67171d70a7d6f78890f2f79398c12b8a9a6324b377091cb2e73ccd5a544c3b68df488915ecfe3f81', 21, 1, 'MyApp', '[]', 0, '2019-08-14 11:52:39', '2019-08-14 11:52:39', '2020-08-14 17:52:39'),
('721667a90c70ff3f4acce6903f7e8196156e61eef7422ac1c71fbfe1d300f964eefc21f44d85cc11', 29, 1, 'MyApp', '[]', 0, '2019-08-14 12:38:15', '2019-08-14 12:38:15', '2020-08-14 18:38:15'),
('775186a06c0a01cd9f612fc73cb26a7e95a4f156f6ec25439c4350513f2ed097c20a463c90c2cd1b', 4, 1, 'MyApp', '[]', 0, '2019-08-11 01:10:42', '2019-08-11 01:10:42', '2020-08-11 07:10:42'),
('960e06681a4f114e1133e9478cdf8bf844630645380f79f4244836edc1a3aa368d78ace61bb2d8a6', 1, 1, 'MyApp', '[]', 0, '2019-08-15 10:57:00', '2019-08-15 10:57:00', '2020-08-15 16:57:00'),
('c4dfdd0da3893927883ff933535f2faf4f2484fc0374048e9f0ec7c26e2390dfcbebf0bad8c0bb2f', 28, 1, 'MyApp', '[]', 0, '2019-08-14 12:35:41', '2019-08-14 12:35:41', '2020-08-14 18:35:41'),
('d14a3a4f5b8f87e2fa5a284113fa72bf8b5dd46c5364604bc87e153a123767248ddcd09ad6f9b64d', 27, 1, 'MyApp', '[]', 0, '2019-08-14 12:34:20', '2019-08-14 12:34:20', '2020-08-14 18:34:20'),
('d1cd1ea497acfdf545539c4405d3ef2f361a77118502fb3da097567b3cf3ae64720e7285dcba7fb3', 25, 1, 'MyApp', '[]', 0, '2019-08-14 12:11:09', '2019-08-14 12:11:09', '2020-08-14 18:11:09'),
('e1d2da1332f1e7a6deabba939b9f040550480c15f63bbd7b31d4b71ae8b4f52815a0761d896d0fb6', 26, 1, 'MyApp', '[]', 0, '2019-08-14 12:32:41', '2019-08-14 12:32:41', '2020-08-14 18:32:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '8PenAJKEzJIdnJQQJX8I6UxUWnpOrpLsg7HN8Cux', 'http://localhost', 1, 0, 0, '2019-08-10 20:31:11', '2019-08-10 20:31:11'),
(2, NULL, 'Laravel Password Grant Client', 'xjd9FwjzlH3V8wra46ctVYE3povJ7Pp1gebcCLEG', 'http://localhost', 0, 1, 0, '2019-08-10 20:31:11', '2019-08-10 20:31:11'),
(3, NULL, 'Laravel Personal Access Client', 'CV5dV9U9XppxFPNCKcFGnI2NAIKQyY8hDYbCnL0A', 'http://localhost', 1, 0, 0, '2019-08-16 03:03:21', '2019-08-16 03:03:21'),
(4, NULL, 'Laravel Password Grant Client', '1DxRbG04IajzMWG1SUb8GoHrINHu4DU1O2WvZHcr', 'http://localhost', 0, 1, 0, '2019-08-16 03:03:21', '2019-08-16 03:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-08-10 20:31:11', '2019-08-10 20:31:11'),
(2, 3, '2019-08-16 03:03:21', '2019-08-16 03:03:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2019-08-10 20:37:19', '2019-08-10 20:37:19'),
(2, 'User', '2019-08-10 20:37:33', '2019-08-10 20:37:33'),
(3, 'Super Admin', '2019-08-10 20:37:49', '2019-08-10 20:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(15, 2),
(23, 2),
(25, 2),
(27, 1),
(29, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Fahad', 'fahad@gmail.com', '$2y$10$pNYLD1iR9QihPrAAnfSIguu5qqOXCVJtMFzIiIk5g318NULbds7Tm', '2019-08-10 20:33:42', '2019-08-10 20:33:42'),
(2, 'Nihal', 'nihal@gmail.com', '$2y$10$mMhsdgMMKuw13q0gyJ.lMOMrFcYVXo33itu4mGBzoz7JhxpTAuRnO', '2019-08-10 20:34:03', '2019-08-16 03:10:23'),
(15, 'new 10', 'new10@test.com', '$2y$10$wCcDoeI/M0OJrDZJ/mTQP.2XeINnT7HEtJax1k/ygjztJ3WPiidJK', '2019-08-14 11:25:07', '2019-08-14 12:47:10'),
(23, 'test', 'test@test.com', '$2y$10$.KrEWjQ.YwNEMJBRziJgH.EPF.eDQRZGwGdb5Ar26qFgbfFT0shZi', '2019-08-14 12:07:10', '2019-08-14 12:07:10'),
(25, 'test1', 'test1@test.com', '$2y$10$5GnXOJZM/Ghm2svvcMN9zeUyIgI2rjw1siri9.cdxH2Du1t2.NW5K', '2019-08-14 12:11:08', '2019-08-14 12:11:08'),
(27, 'new', 'new1@test.com', '$2y$10$erYIN9Tcc./ZgDgGBXFESuraTMbjlFrDr6afG1jsrZfKy94fT4jtq', '2019-08-14 12:34:20', '2019-08-14 12:34:20'),
(29, 'new test', 'new@test.com', '$2y$10$RvgDFZHzhwsNEMf8I.qN6usgs8Xp9qRJbnpM7TFShpN0N6NI4ba7m', '2019-08-14 12:38:15', '2019-08-14 12:38:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
