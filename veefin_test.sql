-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20230110.d1e616d68c
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2023 at 09:01 AM
-- Server version: 8.0.25
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `veefin_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_02_060739_create_users_verify_table', 2),
(7, '2023_08_02_070501_add_socialite_column_to_users_table', 3),
(8, '2023_08_02_074806_create_permission_tables', 4),
(9, '2023_08_02_075047_create_products_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(2, 'role-create', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(3, 'role-edit', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(4, 'role-delete', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(5, 'product-list', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(6, 'product-create', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(7, 'product-edit', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(8, 'product-delete', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(9, 'user-list', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(10, 'user-create', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(11, 'user-edit', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16'),
(12, 'user-delete', 'web', '2023-08-02 03:26:16', '2023-08-02 03:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `detail`, `created_at`, `updated_at`) VALUES
(1, 'ad', 'ssdad', '2023-08-02 03:14:46', '2023-08-02 03:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2023-08-02 03:26:18', '2023-08-02 03:26:18'),
(2, 'admin', 'web', '2023-08-02 03:26:18', '2023-08-02 03:26:18'),
(3, 'user', 'web', '2023-08-02 03:26:19', '2023-08-02 03:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(5, 3),
(6, 3),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_email_verified`, `facebook_id`, `google_id`) VALUES
(4, 'tejal', 'tejal1@yopmail.com', NULL, '$2y$10$cGC12x4azFf9ZYb5XIyTK.use/HC8baO9xUBO85EselbUrD2NitpG', NULL, '2023-08-02 03:06:05', '2023-08-02 03:06:22', 1, NULL, NULL),
(5, 'Super Admin', 'superadmin@yopmail.com', NULL, '$2y$10$0LAZNMB/KZExGb9nITe54uJWOgq.gM6ZGRzaUH9mPPIqQLSvHvMdS', NULL, '2023-08-02 03:26:18', '2023-08-02 03:26:18', 0, NULL, NULL),
(6, 'Admin', 'admin@yopmail.com', NULL, '$2y$10$u0.bysk1d.MPy6ztSnyYK.G0xRqW0IBb2OjVBnXNOVOcPOtvNNAMG', NULL, '2023-08-02 03:26:18', '2023-08-02 03:26:18', 0, NULL, NULL),
(7, 'user', 'user@yopmail.com', NULL, '$2y$10$gj/9IMWw1FAKRPPaL04jo.kpZTVcj.vqnyh8li4sVNR/ymkc9Be.m', NULL, '2023-08-02 03:26:19', '2023-08-02 03:26:19', 0, NULL, NULL),
(8, 'tejal', 'tejal@yopmail.com', NULL, '$2y$10$H0H7w7mpZ2ZXdCM5pS6gR.X7Vla2DUyqsSe2Nc4868/z9V3FrMKby', NULL, '2023-08-02 03:26:50', '2023-08-02 03:27:05', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_verify`
--

CREATE TABLE `users_verify` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_verify`
--

INSERT INTO `users_verify` (`id`, `user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 4, 'SmbEtHvH8RTtAK18lNBHplgyq2ykJH8wpcxI7gW74U8Bn1GsL2IDiF0AnPfyIBGr', '2023-08-02 00:54:56', '2023-08-02 00:54:56'),
(2, 5, 'DQajKHVa5f2XOrykTHDcIMXuler8k5lpOoPf1kbzoz85DCvzjNCY5M2iKhwqfQLi', '2023-08-02 00:55:35', '2023-08-02 00:55:35'),
(3, 6, '64oL8aQ3bDV52CmP1oWQPOn3fHMIMOoNh0t2TNaliwVL7Qd440t0WjxEKD2KnnYZ', '2023-08-02 00:56:03', '2023-08-02 00:56:03'),
(4, 7, '098lG5JegHI1hc1UhB3xPxJoc4XXdheMEeKhaBL3XBBUudpRBLGmlbTN90g3JdqO', '2023-08-02 00:59:06', '2023-08-02 00:59:06'),
(5, 8, 'Qt4BqzN1b9YKNnAR5cYTZOuiAlFvuzpGqCOUqw6fLsxfFeVaqcI9pAGms2vlEf3w', '2023-08-02 00:59:38', '2023-08-02 00:59:38'),
(6, 9, '1IndmmgEsKUUN40FDdiBPpnoBvQ7ML6Nu5lihHWKB6jzGGw5yXRQE8hF4XWmACkD', '2023-08-02 01:00:03', '2023-08-02 01:00:03'),
(7, 11, 'IrtnjsFTKCFeNXYqDvjI6WHAeJSo4trlFMaSNV1wicXwS5PxZOnSXU12hUCPVVzu', '2023-08-02 01:26:16', '2023-08-02 01:26:16'),
(8, 12, 'HH1eQ7wYHcgVqexGV5w4l9mqIqHlo0Wvz8YS2lndYy1njUnysBiMDoo6L4CkSsGC', '2023-08-02 01:53:02', '2023-08-02 01:53:02'),
(9, 12, 'vLnJitGdyN26GHTGSqSdpwhybrTCE8GLlGOK4n0lh9tjR9qvsEkqoWaTlLO9Bg4L', '2023-08-02 01:53:06', '2023-08-02 01:53:06'),
(10, 4, '560UniUsRh6LISrh6yJZDU02WKU4VEFX1YuvxibUhhcZVbGBept4LMJ10WGXCr3z', '2023-08-02 03:06:05', '2023-08-02 03:06:05'),
(11, 4, 'eD6Do5mcijMIiyBff1wHb0haLdTcE2DRKJN4taCJGMX8O8XS2QGSInNObbTDrjTR', '2023-08-02 03:06:10', '2023-08-02 03:06:10'),
(12, 1, 'shfZs30Ldra8LFEcsgewpZx409aNrW0Klj5sBWG8hCaVqTKajtwDMLrSKSYcJJkK', '2023-08-02 03:15:13', '2023-08-02 03:15:13'),
(13, 8, 'v8wn5eyuvxWYvOT1iqLbDSGHbNZNUkOyYv2fhzODxWueqWeLL8g2nZq3SBhYIsd5', '2023-08-02 03:26:50', '2023-08-02 03:26:50'),
(14, 8, 'VwFFtCK1VzHvSER7N8Hbb41DYgeAOWm0POZUEL9WzGTRckFUZBIt8wCKJGL3csbN', '2023-08-02 03:26:54', '2023-08-02 03:26:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_verify`
--
ALTER TABLE `users_verify`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_verify`
--
ALTER TABLE `users_verify`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
