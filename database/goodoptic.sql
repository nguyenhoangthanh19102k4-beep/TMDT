-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
-- Host: localhost
-- Generation Time: May 23, 2025 at 12:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- --------------------------------------------------------------

--
-- Table structure for table `admins` (bảng quản trị viên)

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `type` enum('Admin','Staff') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Staff',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins` (bảng quản trị viên)
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone`, `address`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Quan Ly', 'Admin@gmail.com', '2025-05-23 05:02:40', '$2y$10$MBM9nS/9orDmzyMpcE4l/.lI29uPc3fCfN6zXbKyq8hjhfI6.ovLq', '123456123456123456123456', '0909090909', 'TP.HCM', 'Active', 'Admin', NULL, NULL),
(2, 'Nhan Vien', 'Staff@gmail.com', '2025-05-23 05:02:40', '$2y$10$twqgSrPUL9uFScxhn8MRYOcsZpKOwueT34qtAYBupvAyNqIdoZj82', '123456123456123456123456', '0909090909', 'TP.HCM', 'Active', 'Staff', NULL, NULL);

--
-- Indexes for table `admins` (bảng quản trị viên)
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- --------------------------------------------------------------
--
-- Table structure for table `categories` (bảng danh mục sản phẩm)
--
CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Dumping data for table `categories` (bảng danh mục sản phẩm)
--
INSERT INTO `categories` (`category_id`, `category_name`, `slug`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Kính Râm', 'kinh-ram', 'Active', NULL, NULL),
(2, 'Tròng Kính', 'trong-kinh', 'Active', NULL, NULL),
(3, 'Kính Cận', 'kinh-can', 'Active', NULL, NULL);
--
-- Indexes for table `categories` (bảng danh mục sản phẩm)
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);
--
-- AUTO_INCREMENT for table `categories` (bảng danh mục sản phẩm)
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
-- --------------------------------------------------------------
--
-- Table structure for table `target` (bảng đối tượng)
--
CREATE TABLE `targets` (
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `target_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target` (bảng đối tượng)
--

INSERT INTO `targets` (`target_id`, `target_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Trẻ em', 'tre-em', 'Active', NULL, NULL),
(2, 'Người lớn', 'nguoi-lon', 'Active', NULL, NULL);

--
-- Indexes for table `target` (bảng đối tượng)
--
ALTER TABLE `targets`
  ADD PRIMARY KEY (`target_id`),
  ADD UNIQUE KEY `target_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for table `target` (bảng đối tượng)
--
ALTER TABLE `targets`
  MODIFY `target_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

-- --------------------------------------------------------

--
-- Table structure for table `UV` (bảng UV)
--
CREATE TABLE `UV` (
  `uv_id` bigint(20) UNSIGNED NOT NULL,
  `uv_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UV` (bảng UV)
--

INSERT INTO `UV` (`uv_id`, `uv_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'UV 400', 'uv-400', 'Active', NULL, NULL),
(2, 'UV 380', 'uv-380', 'Active', NULL, NULL),
(3, 'UV 100%', 'uv-100%', 'Active', NULL, NULL),
(4, 'UV A/B', 'uv-a-b', 'Active', NULL, NULL);

--
-- Indexes for table `UV` (bảng UV)
--
ALTER TABLE `UV`
  ADD PRIMARY KEY (`uv_id`),
  ADD UNIQUE KEY `UV_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for table `UV` (bảng UV)
--
ALTER TABLE `UV`
  MODIFY `uv_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------------

--
-- Table structure for table `Material` (bảng chất liệu)
--
CREATE TABLE `Material` (
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Material` (bảng chất liệu)
--

INSERT INTO `Material` (`material_id`, `material_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nhựa cứng', 'nhua-cung', 'Active', NULL, NULL),
(2, 'Nhựa dẻo', 'nhua-deo', 'Active', NULL, NULL),
(3, 'Kim loại', 'kim-loai', 'Active', NULL, NULL);
--
-- Indexes for table `Material` (bảng chất liệu)
--
ALTER TABLE `Material`
  ADD PRIMARY KEY (`material_id`),
  ADD UNIQUE KEY `Material_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for table `Material` (bảng chất liệu)
--
ALTER TABLE `Material`
  MODIFY `material_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------------


--
-- Table structure for table `brands` (bảng thương hiệu)
--

CREATE TABLE `brands` (
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands` (bảng thương hiệu)
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Armani', 'armani', 'Active', NOW(), NOW()),
(2, 'Oakley', 'oakley', 'Active', NOW(), NOW()),
(3, 'FLEXI', 'flexi', 'Active', NOW(), NOW()),
(4, 'JIIA', 'jiia', 'Active', NOW(), NOW()),
(5, 'Chemi', 'chemi', 'Active', NOW(), NOW()),
(6, 'Essilor', 'essilor', 'Active', NOW(), NOW()),
(7, 'Sigo', 'sigo', 'Active', NOW(), NOW()),
(8, 'Elements', 'elements', 'Active', NOW(), NOW()),
(9, 'GO', 'go', 'Active', NOW(), NOW());

--
-- Indexes for table `brands` (bảng thương hiệu)
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for table `brands` (bảng thương hiệu)
--

ALTER TABLE `brands`
  MODIFY `brand_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

-- --------------------------------------------------------------


--
-- Table structure for table `Refractive` (bảng khúc xạ)
--

CREATE TABLE `Refractive` (
  `refractive_id` bigint(20) UNSIGNED NOT NULL,
  `refractive_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Refractive` (bảng khúc xạ)
--

INSERT INTO `Refractive` (`refractive_id`, `refractive_name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cận thị', 'can-thi', 'Active', NOW(), NOW()),
(2, 'Viễn thị', 'vien-thi', 'Active', NOW(), NOW()),
(3, 'Loạn thị', 'loan-thi', 'Inactive', NOW(), NOW()),
(4, 'Lão thị', 'lao-thi', 'Active', NOW(), NOW()),
(5, 'Khúc xạ hỗn hợp', 'khuc-xa-hon-hop', 'Inactive', NOW(), NOW()),
(6, 'Mắt bình thường', 'mat-binh-thuong', 'Active', NOW(), NOW());

--
-- Indexes for table `Refractive` (bảng khúc xạ)
--
ALTER TABLE `Refractive`
  ADD PRIMARY KEY (`refractive_id`),
  ADD UNIQUE KEY `Refractive_slug_unique` (`slug`);

--
-- AUTO_INCREMENT for table `Refractive` (bảng khúc xạ)
--

ALTER TABLE `Refractive`
  MODIFY `refractive_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
-- --------------------------------------------------------------

--
-- Table structure for table `customers` (bảng khách hàng)
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers` (bảng khách hàng)
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `email`, `phone`, `address`) VALUES
(1, 'Nguyen Van A', 'Abc@gmail.com', '0909090909', 'TP.HCM'),
(2, 'Nguyen Van B', 'Adasd@gmail.com', '09090432429', 'TP.HCM'),
(3, 'Nguyen Van C', 'Asza@gmail.com', '0123123123', 'TP.HCM'),
(4, 'Nguyen Van D', 'Aszsda@gmail.com', '01434553123', 'TP.HCM');
--
-- Indexes for table `customers` (bảng khách hàng)
--

ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- AUTO_INCREMENT for table `customers` (bảng khách hàng)
--

ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


--
-- Table structure for table `products` (bảng sản phẩm)
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` tinyint(3) UNSIGNED NOT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `disscounted_price` double NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `target_id` bigint(20) UNSIGNED NOT NULL,
  `UV_id` bigint(20) UNSIGNED NOT NULL,
  `Refractive_id` bigint(20) UNSIGNED NOT NULL,
  `Material_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products` (bảng sản phẩm)
--
INSERT INTO `products` (`product_id`, `product_name`, `slug`, `description`, `stock`, `unit`, `disscounted_price`, `price`, `images`, `category_id`, `brand_id`, `target_id`, `UV_id`, `Refractive_id`, `Material_id`, `status`, `created_at`, `updated_at`) VALUES
(1, "Kính mát GO 14034", "kinh-mat-GO-14034", "Kính mát với độ chống UV cao", 20, "cái", 792000.0, 900000.0, "https://product.hstatic.net/200000897239/product/yc_14034_c1__2__8d897a77a5064769af072b106a612bd6_large.jpg", 1, 9, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(2, "Kính mát GO 14037", "kinh-mat-GO-14037", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 792000.0, 950000.0, "https://product.hstatic.net/200000897239/product/yc_14037_c4__2__49a965e6a0ea4009988c96dfb4692f5e_large.jpg", 1, 9, 1, 2, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(3, "Kính mát GO 21100", "kinh-mat-GO-21100", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 792000.0, 800000.0, "https://product.hstatic.net/200000897239/product/yc_21100_c4__2__d25e882563974e1e97f8d1de92223bb7_large.jpg", 1, 9, 1, 2, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(4, "Kính mát GO 21131", "kinh-mat-GO-21131", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 792000.0, 810000.0, "https://product.hstatic.net/200000897239/product/yc_21131_c1__2__f0b8e45347a84880b9cf84c540950784_large.jpg", 1, 9, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(5, "Kính mát GO 30018", "kinh-mat-GO-30018", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 792000.0, 830000.0, "https://product.hstatic.net/200000897239/product/yc_30018_c1__2__c551ca86341643ec911d87cfa35ce254_large.jpg", 1, 9, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(6, "Kính mát GO 35002", "kinh-mat-GO-35002", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 780000.0, 800000.0, "https://product.hstatic.net/200000897239/product/yc_35002_c4__2__b863adada2a34a109e5a8f82f3381d69_large.jpg", 1, 9, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(7, "Kính mát GO COSMO", "kinh-mat-GO-cosmo", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 950000.0, 1200000.0, "https://product.hstatic.net/200000897239/product/cosmo_c1__2__e50786172d624993a79880a946f694e6_large.jpg", 1, 9, 1, 3, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(8, "Kính mát GO MONTA", "kinh-mat-GO-monta", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 960000.0, 1200000.0, "https://product.hstatic.net/200000897239/product/monta_c1__2__54c5a10ac2ef4baa8f72bf153b9c784d_large.jpg", 1, 9, 1, 3, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(9, "Kính mát GO SONIC", "kinh-mat-GO-sonic", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 1062000.0, 1450000.0, "https://product.hstatic.net/200000897239/product/sonic_c1__2__7de95854694b47e4a62b323bb0db3108_large.jpg", 1, 9, 1, 4, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(10, "Kính mát GO JENI", "kinh-mat-GO-jeni", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 800000.0, 1300000.0, "https://product.hstatic.net/200000897239/product/jeni_c4__2__52f18b02a67f4ac6a7c0ee79fb2d9d9b_large.jpg", 1, 9, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(11, "Kính mát GO MIKO", "kinh-mat-GO-miko", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 870000.0, 1370000.0, "https://product.hstatic.net/200000897239/product/miko_c3__2__e06cbc20eef744ce9c3567c8fd0ab4e6_large.jpg", 1, 9, 1, 2, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(12, "Kính mát GO ELIO", "kinh-mat-GO-elio", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 1062000.0, 1423000.0, "https://product.hstatic.net/200000897239/product/elio_c4__2__1b81d88258c84027a706076ccfeffd7b_large.jpg", 1, 9, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(13, "Kính mát GO MAIKA", "kinh-mat-GO-maika", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 2000000.0, 190630.0, "https://product.hstatic.net/200000897239/product/maika_c3__2__5c2a9e937e1a44178f0da8c54f35952d_large.jpg", 1, 9, 1, 4, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(14, "Kính mát GO LUCA", "kinh-mat-GO-luca", "Kính mát thời trang với khả năng chống tia UV, thiết kế hiện đại, phù hợp đi ngoài trời.", 20, "cái", 900000.0, 1062000.0, "https://product.hstatic.net/200000897239/product/luca_c1__2__058d6dae52d645f580e19a75a1a31ae1_large.jpg", 1, 9, 1, 4, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(15, "Tròng kính bơi có độ cận loạn hạn chế bám nước", "trong-kinh-boi-co-đo-can-loan-han-che-bam-nuoc", "Tròng kính dùng khi bơi, có độ cận phù hợp và hạn chế bám nước.", 20, "cái", 540000.0, 600000.0, "https://product.hstatic.net/200000897239/product/trong-kinh-boi-trong-suot_3f1e1d84a2a84f00a253e5fb979d552c_large.jpg", 2, 8, 1, 1, 5, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(16, "Tròng kính đổi màu Essilor Transitions Gen8 Style Colour", "trong-kinh-doi-mau-essilor-transitions-gen8-style-colour", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 4380000.0, 4380000.0, "https://product.hstatic.net/200000897239/product/essilor-transitions-gen-8-style-colour_e39c4439a8584ab4ba27b8677e36ac47_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(17, "Tròng kính TOG Duralens Excelite 1.56", "trong-kinh-tog-duralens-excelite-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 220000.0, 280000.0, "https://product.hstatic.net/200000897239/product/tog-excelite-1.56_7a1ec5a32f8249788f4a8b41e69c280a_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(18, "Tròng kính Velocity 1.56", "trong-kinh-velocity-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 220000.0, 260000.0, "https://product.hstatic.net/200000897239/product/velocity-1.56_cc4a8331641b486fa9e2988e8c2eb867_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(19, "Tròng kính Chemi U2 1.56", "trong-kinh-chemi-u2-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 330000.0, 400000.0, "https://product.hstatic.net/200000897239/product/chemi-u2-1.56_97c5c6561c9e43b6af81605bed3effbb_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(20, "Tròng kính chống ánh sáng xanh Elements Blue UV Cut", "trong-kinh-chong-anh-sang-xanh-elements-blue-uv-cut", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 480000.0, 500000.0, "https://product.hstatic.net/200000897239/product/elements-blueuv-cut-1.56_d3d1ee67362e414dacdea920c98bc8e3_large.jpg", 2, 8, 1, 4, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(21, "Tròng kính chống ánh sáng xanh Chemi U6 1.56", "trong-kinh-chong-anh-sang-xanh-chemi-u6-156", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 480000.0, 600000.0, "https://product.hstatic.net/200000897239/product/chemi-u6-1.56_49e13d4495fd4300ad21c6bfbf56124b_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(22, "Tròng kính đổi màu TOG VV 1.56 - Xám Khói", "trong-kinh-doi-mau-tog-vv-156---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 580000.0, 700000.0, "https://product.hstatic.net/200000897239/product/tog-vv-1.56_8e4147e995c747ffb6ee9a8db3c7f5e7_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(23, "Tròng kính đổi màu Hoga 1.56", "trong-kinh-doi-mau-hoga-156", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 520000.0, 580000.0, "https://product.hstatic.net/200000897239/product/hoga-1.56_5b6f8425c504402394381e164fd5a75f_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(24, "Tròng kính chống chói đèn xe Elements Night AR 1.56", "trong-kinh-chong-choi-den-xe-elements-night-ar-156", "Giảm độ chói và lóa khi lái xe ban đêm, nâng cao an toàn và tầm nhìn.", 20, "cái", 730000.0, 780000.0, "https://product.hstatic.net/200000897239/product/elements-night-ar-1.56_d593e2054aa44f65b4e2e69eb217cc79_large.jpg", 2, 8, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(25, "Tròng kính Chemi U2 1.60", "trong-kinh-chemi-u2-160", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 570000.0, 600000.0, "https://product.hstatic.net/200000897239/product/chemi-u2-1.60_ff6657abf2ef44ad894ccbfe201a4075_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(26, "Tròng kính đổi màu Rocky Trendy 1.56", "trong-kinh-doi-mau-rocky-trendy-156", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 600000.0, 688000.0, "https://product.hstatic.net/200000897239/product/rocky-trendy-1.56-nau-tra_b1b2e33288e24aa0b1b900f94ab630f2_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(27, "Tròng kính siêu mỏng Chemi U1 1.67", "trong-kinh-sieu-mong-chemi-u1-167", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 700000.0, 750000.0, "https://product.hstatic.net/200000897239/product/chemi-u1-1.67_e8f95956f8854a71bee14e98d71a2add_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(29, "Tròng kính đổi màu Viscare SunActive 1.56", "trong-kinh-doi-mau-viscare-sunactive-156", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 770000.0, 780000.0, "https://product.hstatic.net/200000897239/product/vis-care-1.56_ebc5c2b7d0234af88af3140c292a1d4d_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(30, "Tròng kính đổi màu Rocky 1.56 - Xám Khói", "trong-kinh-doi-mau-rocky-156---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 758000.0, 798000.0, "https://product.hstatic.net/200000897239/product/rocky-1.56_430a962853d9450bac3e6881550dfabc_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(31, "Tròng kính Panther HC", "trong-kinh-panther-hc", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 900000.0, 1000000.0, "https://product.hstatic.net/200000897239/product/panther-hc-1.56_2887fb31e3c64072bb60aea85db66a1d_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(33, "Tròng kính siêu mỏng chống ánh sáng xanh Hanmi 1.74", "trong-kinh-sieu-mong-chong-anh-sang-xanh-hanmi-174", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 3200000.0, 3600000.0, "https://product.hstatic.net/200000897239/product/hanmi-c3-1.74-as_ba8c7afec84f430dab95ce8391d3b8c1_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(34, "Tròng kính Exfash Digital Lens 1.56", "trong-kinh-exfash-digital-lens-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 480000.0, 500000.0, "https://product.hstatic.net/200000897239/product/exfash-1.56_27915aa905294bde9e71f93400088def_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(35, "Tròng kính nhuộm màu Essilor Suntints Stock 1.60", "trong-kinh-nhuon-mau-essilor-suntints-stock-160", "Tròng kính thời trang với lớp phủ nhuộm màu độc đáo, mang lại phong cách nổi bật và bảo vệ mắt.", 20, "cái", 1280000.0, 1300000.0, "https://product.hstatic.net/200000897239/product/essilor-suntint-1.60_1c3ade7824a44f3c8d2118ebdf98af67_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(36, "Tròng kính nhuộm màu Essilor Suntints Stock 1.56", "trong-kinh-nhuon-mau-essilor-suntints-stock-156", "Tròng kính thời trang với lớp phủ nhuộm màu độc đáo, mang lại phong cách nổi bật và bảo vệ mắt.", 20, "cái", 1000000.0, 1080000.0, "https://product.hstatic.net/200000897239/product/essilor-suntint-156_a8adde0af8654c6286246be57cf6b124_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(37, "Tròng kính kiểm soát tiến triển cận thị Essilor Stellest 1.59", "trong-kinh-kiem-soat-tien-trien-can-thi-essilor-stellest-159", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 6480000.0, 6600000.0, "https://product.hstatic.net/200000897239/product/essilor-stellest-1.59-as_d82dcfe07c4a4314bdb152889d992db8_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(38, "Tròng kính Essilor EasyPro 1.56", "trong-kinh-essilor-easypro-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 860000.0, 868000.0, "https://product.hstatic.net/200000897239/product/essilor-crizal-easypro-1.56_c7b8617e0ad4431688e68af483a95a00_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(39, "Tròng kính chống ánh sáng xanh Essilor Crizal Rock 1.67", "trong-kinh-chong-anh-sang-xanh-essilor-crizal-rock-167", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 3880000.0, 3980000.0, "https://product.hstatic.net/200000897239/product/essilor-crizal-rock-blueuv-capture-1.67_28986623a56d4641b4fbfd76e6998d39_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(40, "Tròng kính chống ánh sáng xanh Essilor Crizal Rock 1.60", "trong-kinh-chong-anh-sang-xanh-essilor-crizal-rock-160", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 2100000.0, 2280000.0, "https://product.hstatic.net/200000897239/product/essilor-crizal-rock-blueuv-capture-1.60_8b525598d4d647e3a1b8ccc1a793ad4a_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(41, "Tròng kính chống ánh sáng xanh Essilor Crizal Rock 1.56", "trong-kinh-chong-anh-sang-xanh-essilor-crizal-rock-156", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 1298000.0, 1308000.0, "https://product.hstatic.net/200000897239/product/essilor-crizal-rock-blueuv-capture-1.56_8523d85142d74c718e6f703c2a1a6437_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(42, "Tròng kính đổi màu Essilor Transition Gen8 1.60", "trong-kinh-doi-mau-essilor-transition-gen8-160", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 5880000.0, 6000000.0, "https://product.hstatic.net/200000897239/product/essilor-transition-gen8-1.60_6b439a5c57734915a62d8405d1cfb099_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(43, "Tròng kính đổi màu Essilor Transition Gen8 1.50 Xtractive", "trong-kinh-doi-mau-essilor-transition-gen8-150-xtractive", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 4380000.0, 4500000.0, "https://product.hstatic.net/200000897239/product/essilor-transitions-xtractive-new-generation_efc0d0cc477a4661b702857fa5b2c990_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(44, "Tròng kính đổi màu Essilor Transitions Gen S", "trong-kinh-doi-mau-essilor-transitions-gen-s", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 3840000.0, 3890000.0, "https://product.hstatic.net/200000897239/product/essilor-transition-gen-s_c27a252497594eabbefde0762a4d51c1_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(45, "Tròng kính đổi màu Essilor Transition Gen8 1.56 - Xám khói", "trong-kinh-doi-mau-essilor-transition-gen8-156---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 3780000.0, 3880000.0, "https://product.hstatic.net/200000897239/product/essilor-transition-gen8-1.56_d411b64468924419b209d5057fffae60_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(46, "Tròng kính đổi màu Essilor Transition Classic 1.60 - Xám Khói", "trong-kinh-doi-mau-essilor-transition-classic-160---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 3080000.0, 3180000.0, "https://product.hstatic.net/200000897239/product/essilor-transition-classic-1.60_ca3cb6acc52e491b8411c65996eeb791_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(47, "Tròng kính đổi màu Essilor Transition Classic 1.56", "trong-kinh-doi-mau-essilor-transition-classic-156", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 2000000.0, 2080000.0, "https://product.hstatic.net/200000897239/product/essilor-transition-classic-1.56_f8b6f1b3b87b422f8d0169a5ee70a6ae_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(48, "Tròng kính chống phản quang Essilor Sapphire", "trong-kinh-chong-phan-quang-essilor-sapphire", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 2980000.0, 3000000.0, "https://product.hstatic.net/200000897239/product/essilor-crizal-sapphire-hr-blue-uv-capture-1.59-1.67_1ce79576d72e48cf89bd40bd3c0bcddd_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(49, "Tròng kính chống mỏi mắt Essilor Eyezen Start Stock 1.60", "trong-kinh-chong-moi-mat-essilor-eyezen-start-stock-160", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 2800000.0, 2980000.0, "https://product.hstatic.net/200000897239/product/essilor-eyezen-start-stock-1.60_0b3dfffc9018405b8ec113d453490d0c_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(50, "Tròng kính chống mỏi mắt Essilor Eyezen Start Stock 1.56", "trong-kinh-chong-moi-mat-essilor-eyezen-start-stock-156", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 1600000.0, 1780000.0, "https://product.hstatic.net/200000897239/product/essilor-eyezen-start-stock-1.56_a538e64d1fed4f4ea0915a72ff8a4620_large.jpg", 2, 6, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(51, "Tròng kính chống chói đèn xe Elements Night AR 1.67", "trong-kinh-chong-choi-den-xe-elements-night-ar-167", "Giảm độ chói và lóa khi lái xe ban đêm, nâng cao an toàn và tầm nhìn.", 20, "cái", 1680000.0, 1700000.0, "https://product.hstatic.net/200000897239/product/elements-night-ar-1.67_c5edcd31508f4bcd93e7dd3e7c704c8c_large.jpg", 2, 8, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(52, "Tròng kính chống chói đèn xe Elements Night AR 1.60", "trong-kinh-chong-choi-den-xe-elements-night-ar-160", "Giảm độ chói và lóa khi lái xe ban đêm, nâng cao an toàn và tầm nhìn.", 20, "cái", 1180000.0, 1300000.0, "https://product.hstatic.net/200000897239/product/elements-night-ar-1.60_a694fcc386754a83b323109eebfa1503_large.jpg", 2, 8, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(54, "Tròng kính đổi màu Elements Photo - Xám Khói", "trong-kinh-doi-mau-elements-photo---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 1180000.0, 1200000.0, "https://product.hstatic.net/200000897239/product/elements-blueuv-cut-photo-grey-1.56-1.60-1.67_d1842a10255b410186e6279b17acd48b_large.jpg", 2, 8, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(56, "Tròng kính siêu mỏng chống ánh sáng xanh Chemi U6 1.74", "trong-kinh-sieu-mong-chong-anh-sang-xanh-chemi-u6-174", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 3000000.0, 3150000.0, "https://product.hstatic.net/200000897239/product/chemi-u6-1.74_abe7f9ad057d4da59ef35c9f97e09c68_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(58, "Tròng kính siêu mỏng chống ánh sáng xanh Chemi U6 1.67", "trong-kinh-sieu-mong-chong-anh-sang-xanh-chemi-u6-167", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 1360000.0, 1400000.0, "https://product.hstatic.net/200000897239/product/chemi-u6-1.67_7dcac334c2db4d6fa4d44d952ad0acd0_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(60, "Tròng kính đổi màu chống ánh sáng xanh Chemi PhotoBlue 1.67 - Xám Khói", "trong-kinh-doi-mau-chong-anh-sang-xanh-chemi-photoblue-167---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 2400000.0, 2400000.0, "https://product.hstatic.net/200000897239/product/chemi-photoblue-1.67_36b969de6c6445f4addcd1fb760c7984_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(61, "Tròng kính đổi màu chống ánh sáng xanh Chemi PhotoBlue 1.60 - Xám Khói", "trong-kinh-doi-mau-chong-anh-sang-xanh-chemi-photoblue-160---xam-khoi", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 1480000.0, 1480000.0, "https://product.hstatic.net/200000897239/product/chemi-photoblue-1.60_d16aad8ff2224eaa9ffd6c95a491e4da_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(62, "Tròng kính đổi màu Chemi U2 1.56", "trong-kinh-doi-mau-chemi-u2-156", "Tròng kính đổi màu thông minh, tự điều chỉnh màu sắc theo ánh sáng môi trường, bảo vệ mắt hiệu quả.", 20, "cái", 828000.0, 830000.0, "https://product.hstatic.net/200000897239/product/chemi-photogray-1.56_fd258f9c44d24bd79b750635784e1224_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(63, "Tròng kính chống chói đèn xe Chemi XDrive 1.60", "trong-kinh-chong-choi-den-xe-chemi-xdrive-160", "Giảm độ chói và lóa khi lái xe ban đêm, nâng cao an toàn và tầm nhìn.", 20, "cái", 850000.0, 900000.0, "https://product.hstatic.net/200000897239/product/chemi-x-drive-1.60_1b4bd879577f433399d5b5c968bfd8b5_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(64, "Tròng kính chống ánh sáng xanh Chemi U6 1.60", "trong-kinh-chong-anh-sang-xanh-chemi-u6-160", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 840000.0, 850000.0, "https://product.hstatic.net/200000897239/product/chemi-u6-1.60_3710b6d26f114c8584f1503e84040845_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(65, "Tròng kính chống ánh sáng xanh Chemi U6 1.56", "trong-kinh-chong-anh-sang-xanh-chemi-u6-156", "Tròng kính chuyên dụng giúp lọc ánh sáng xanh từ thiết bị điện tử, giảm mỏi mắt khi dùng lâu.", 20, "cái", 420000.0, 480000.0, "https://product.hstatic.net/200000897239/product/chemi-u6-1.56_49e13d4495fd4300ad21c6bfbf56124b_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(66, "Tròng kính siêu mỏng Chemi U2 1.74", "trong-kinh-sieu-mong-chemi-u2-174", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 2268000.0, 2300000.0, "https://product.hstatic.net/200000897239/product/chemi-u2-1.74_3d937056ec2e48a499f958ba132f9c1f_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(67, "Tròng kính siêu mỏng Chemi U2 1.67", "trong-kinh-sieu-mong-chemi-u2-167", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 1180000.0, 1100000.0, "https://product.hstatic.net/200000897239/product/chemi-u2-1.67_d1538bfe5e274a0881b22428ecf722a4_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(70, "Đa tròng Chemi A-one", "da-trong-chemi-a-one", "Tròng kính đa tròng hỗ trợ nhìn rõ ở mọi khoảng cách, phù hợp cho người có vấn đề về thị lực lão hoá.", 20, "cái", 750000.0, 800000.0, "https://product.hstatic.net/200000897239/product/chemi-a-one-1.60_acbe44c7c1c14a06870624a02dbc6e67_large.jpg", 2, 5, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(71, "Tròng kính siêu mỏng phẳng 2 mặt Sigo 1.90", "trong-kinh-sieu-mong-phang-2-mat-sigo-190", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 16500000.0, 16500000.0, "https://product.hstatic.net/200000897239/product/sigo-1.90-das_ecaa4c78ecd84d38b8f7459fb46d308f_large.jpg", 2, 7, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(72, "Tròng kính siêu mỏng phẳng 2 mặt Sigo 1.80", "trong-kinh-sieu-mong-phang-2-mat-sigo-180", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 13600000.0, 13600000.0, "https://product.hstatic.net/200000897239/product/sigo-1.80-das_e15d0a468c9e4cfcbff9de5479d298a1_large.jpg", 2, 7, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(73, "Tròng kính siêu mỏng phẳng 2 mặt Sigo 1.74", "trong-kinh-sieu-mong-phang-2-mat-sigo-174", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 10400000.0, 10400000.0, "https://product.hstatic.net/200000897239/product/sigo-1.74-das_0eba8a88fafa46188e7a2d86388298c9_large.jpg", 2, 7, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(74, "Tròng kính siêu mỏng đổi màu Asahi 1.74", "trong-kinh-sieu-mong-doi-mau-asahi-174", "Tròng kính mỏng nhẹ, thiết kế tối ưu cho độ cận cao, thẩm mỹ và thoải mái.", 20, "cái", 8900000.0, 9000000.0, "https://product.hstatic.net/200000897239/product/asahi-lite-1.74-das_e083720cb3f44535b882a8c8a75f3252_large.jpg", 2, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(75, "Gọng kính Armani Exchange 3125U", "gong-kinh-armani-exchange-3125u", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 2484000.0, 2485000.0, "https://product.hstatic.net/200000897239/product/0ax3125u__2__ca1af755f2bc442bad9d3be571252027_large.jpg", 3, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(76, "Gọng kính Armani Exchange 3118U", "gong-kinh-armani-exchange-3118u", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 2480000.0, 2484000.0, "https://product.hstatic.net/200000897239/product/0ax3118u__2__969292c4c56d409c84ebb73668eacbb3_large.jpg", 3, 1, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(77, "Gọng kính Armani Exchange 1068", "gong-kinh-armani-exchange-1068", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 2471000.0, 2484000.0, "https://product.hstatic.net/200000897239/product/0ax1068__2__72a5627104094434abc2a3efd72f7ccd_large.jpg", 3, 1, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(78, "Gọng kính OAKLEY 8062D", "gong-kinh-oakley-8062d", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 4194000.0, 4195000.0, "https://product.hstatic.net/200000897239/product/0ox8062d__2__023fc23a8770460c8ec484c080c84af9_large.jpg", 3, 2, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(79, "Gọng kính FLEXI FX5343", "gong-kinh-flexi-fx5343", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 612000.0, 620000.0, "https://product.hstatic.net/200000897239/product/fx5343_c3__2__9cf9e30cb8c0416791491e9e9d4571e6_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(80, "Gọng kính FLEXI FX5267", "gong-kinh-flexi-fx5267", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 750000.0, 756000.0, "https://product.hstatic.net/200000897239/product/fx5267_c7__2__485511555fb34b68b696d413a24ae2c4_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(81, "Gọng kính FLEXI FX5266", "gong-kinh-flexi-fx5266", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 523000.0, "https://product.hstatic.net/200000897239/product/fx5266_c60__2__8b164d2fbb81455dac9f83dbb25f42c2_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(82, "Gọng kính FLEXI FX5265-C5", "gong-kinh-flexi-fx5265-c5", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 510000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5265_c5__2__b45c01ad5c9d4265809773037e9ace4e_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(83, "Gọng kính FLEXI FX5265-C2", "gong-kinh-flexi-fx5265-c2", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 530000.0, 570000.0, "https://product.hstatic.net/200000897239/product/fx5265_c2__2__636553258a0e411f85b9f48cb4e3e8f3_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(84, "Gọng kính FLEXI FX5265-C1", "gong-kinh-flexi-fx5265-c1", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 523000.0, 534000.0, "https://product.hstatic.net/200000897239/product/fx5265_c1__2__66fc7ebfce3e47f194f3da53105c56eb_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(85, "Gọng kính FLEXI FX5264", "gong-kinh-flexi-fx5264", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 526000.0, "https://product.hstatic.net/200000897239/product/fx5264_c2__2__7aa1b43384b44ebeb8e593a037e9ce1a_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(86, "Gọng kính FLEXI FX5263", "gong-kinh-flexi-fx5263", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 882000.0, 887000.0, "https://product.hstatic.net/200000897239/product/fx5263_c1__2__76d5fc99fa2e49b488a477ff8bb0e063_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(87, "Gọng kính FLEXI FX5262", "gong-kinh-flexi-fx5262", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 564000.0, "https://product.hstatic.net/200000897239/product/fx5262_c1__2__275a43859db044e799424135ca006ddf_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(88, "Gọng kính FLEXI FX5261", "gong-kinh-flexi-fx5261", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 550000.0, 584000.0, "https://product.hstatic.net/200000897239/product/fx5261_c4__2__42b3705279d44b05973914127a47930e_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(89, "Gọng kính FLEXI FX5370", "gong-kinh-flexi-fx5370", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 530000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5370_c5__2__e09b7e7082e949ccb56a79119ac40d14_large.jpg", 3, 3, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(90, "Gọng kính FLEXI FX5369", "gong-kinh-flexi-fx5369", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 510000.0, 529000.0, "https://product.hstatic.net/200000897239/product/fx5369_c4__2__bd4869a412854696b467b151c6de18c9_large.jpg", 3, 3, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(91, "Gọng kính FLEXI FX5368", "gong-kinh-flexi-fx5368", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 500000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5368_c2__2__d7ded0058eb54957898ebbfa305aa86b_large.jpg", 3, 3, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(92, "Gọng kính FLEXI FX5361", "gong-kinh-flexi-fx5361", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 612000.0, 690000.0, "https://product.hstatic.net/200000897239/product/fx5361_c2__2__d26c322da2d84090a7c836050b9be39d_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(93, "Gọng kính FLEXI FX5360", "gong-kinh-flexi-fx5360", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 620000.0, 700000.0, "https://product.hstatic.net/200000897239/product/fx5360_c5__2__0bb30de81c4846e6a8271fb50caf4953_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(94, "Gọng kính FLEXI FX5359", "gong-kinh-flexi-fx5359", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5359_c12__2__a5bb8e1b68fe4dcea46f91749a94c5ee_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(95, "Gọng kính FLEXI FX5357", "gong-kinh-flexi-fx5357", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5357_c3__2__af617fc2957b487880f5c65f4ae9ef6e_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(96, "Gọng kính FLEXI FX5356", "gong-kinh-flexi-fx5356", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5356_c3__2__8115199fb6394c7d991aedecb74f65e8_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(97, "Gọng kính FLEXI FX5355", "gong-kinh-flexi-fx5355", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5355_c2__2__de58c76bffe24ad9b4a7492272cfe2cf_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(98, "Gọng kính FLEXI FX5354", "gong-kinh-flexi-fx5354", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5354_c1__2__49c32835cd30415385c9205d7769c5d2_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(99, "Gọng kính FLEXI FX5353", "gong-kinh-flexi-fx5353", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5353_c8__2__62c2e9cbd8124effaf9341390fd286e6_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(100, "Gọng kính FLEXI FX5352", "gong-kinh-flexi-fx5352", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5352_c2__2__9e1aef3c03694d7691428b7481a17ca4_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(101, "Gọng kính FLEXI FX5351", "gong-kinh-flexi-fx5351", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5351_c1__2__51d92764e25e41909b8ca9b3f429d89f_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(102, "Gọng kính FLEXI FX5348", "gong-kinh-flexi-fx5348", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5348_c5__2__72bb0cdebf9549c0940c1c0547e3ae93_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(103, "Gọng kính FLEXI FX5347", "gong-kinh-flexi-fx5347", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5347_c6__2__c26f4616ef174dc69a111828ff88007c_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(104, "Gọng kính FLEXI FX5346", "gong-kinh-flexi-fx5346", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 520000.0, "https://product.hstatic.net/200000897239/product/fx5346_c2__2__8433324d53344f4a988279305a22b66b_large.jpg", 3, 3, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(105, "Gọng kính FLEXI FX5345", "gong-kinh-flexi-fx5345", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 521000.0, 545000.0, "https://product.hstatic.net/200000897239/product/fx5345_c3__2__d5c58efa64c4405fb1a3b73772f0e686_large.jpg", 3, 3, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(106, "Gọng kính FLEXI FX5344", "gong-kinh-flexi-fx5344", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 520000.0, 523000.0, "https://product.hstatic.net/200000897239/product/fx5344_c6__2__0490aa1c22094fac872468e752d8a759_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(107, "Gọng kính FLEXI FX5342", "gong-kinh-flexi-fx5342", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 612000.0, 657000.0, "https://product.hstatic.net/200000897239/product/fx5342_c2__2__2b5e17a8faf8410981ce9a880e38d5ed_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(108, "Gọng kính FLEXI FX5233B", "gong-kinh-flexi-fx5233b", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 774000.0, 774000.0, "https://product.hstatic.net/200000897239/product/fx5233b_c1__2__90228cd59c5649e79c973d8d7b5cf66a_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(109, "Gọng kính FLEXI FX5235B", "gong-kinh-flexi-fx5235b", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 882000.0, 882000.0, "https://product.hstatic.net/200000897239/product/fx5235b_c1__2__23d06537c663488885b7bef62555fe48_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(110, "Gọng kính FLEXI FX5234B", "gong-kinh-flexi-fx5234b", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 882000.0, 882000.0, "https://product.hstatic.net/200000897239/product/fx5234b_c2__2__177b73b5594f47a9b422285a33e10fea_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(111, "Gọng kính FLEXI FX5246P", "gong-kinh-flexi-fx5246p", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 340000.0, 340000.0, "https://product.hstatic.net/200000897239/product/fx5246p_c2__2__9ffe633d97ca49b1b247bbfd0633a708_large.jpg", 3, 3, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(115, "Gọng kính FLEXI FX5232B", "gong-kinh-flexi-fx5232b", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 774000.0, 774000.0, "https://product.hstatic.net/200000897239/product/fx5232b_c2__2__40a87b2f556a4c089813be51b062b63f_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(116, "Gọng kính FLEXI FX5231B", "gong-kinh-flexi-fx5231b", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 774000.0, 774000.0, "https://product.hstatic.net/200000897239/product/fx5231b_c1__2__7ef62cf72d634e78b290fb3de80afc0b_large.jpg", 3, 3, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(117, "Gọng kính GO VERA", "gong-kinh-GO-vera", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 684000.0, 684000.0, "https://product.hstatic.net/200000897239/product/vera_c2__2__acb7a4f25c1940e39abb7beb6d9e47ab_large.jpg", 3, 9, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(122, "Gọng kính GO GAVIN", "gong-kinh-GO-gavin", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 558000.0, 558000.0, "https://product.hstatic.net/200000897239/product/gavin_c2__2__fefa99b5094746d2ab637272571589d1_large.jpg", 3, 9, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(124, "Gọng kính GO CODY", "gong-kinh-GO-cody", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 558000.0, 558000.0, "https://product.hstatic.net/200000897239/product/cody_c2__2__0da6a0f7c83f425083ad2675b3de7ea9_large.jpg", 3, 9, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(125, "Gọng kính THE JIIA 6227", "gong-kinh-the-jiia-6227", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 4380000.0, 4370000.0, "https://product.hstatic.net/200000897239/product/n6227colo1__2__6efaa958b88448ad961994baaa37fbf1_large.jpg", 3, 4, 1, 1, 1, 3, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(133, "Gọng kính Oakley 8188D", "gong-kinh-oakley-8188d", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 4460000.0, 4464000.0, "https://product.hstatic.net/200000897239/product/8188-8188_c6d91cbdef6143fcac2241162e34d117_large.jpg", 3, 2, 1, 1, 1, 1, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03"),
(134, "Gọng kính Oakley 8187", "gong-kinh-oakley-8187", "Sản phẩm chất lượng cao, thiết kế tối ưu cho người sử dụng.", 20, "cái", 4700000.0, 4734000.0, "https://product.hstatic.net/200000897239/product/8187-0155_2e850d8050234d59b95054aff7f515f1_large.jpg", 3, 2, 1, 1, 1, 2, "Active", "2025-06-20 00:32:03", "2025-06-20 00:32:03");
--
-- Indexes for table `products` (bảng sản phẩm)
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_target_id_foreign` (`target_id`),
  ADD KEY `products_UV_id_foreign` (`UV_id`);
--
-- AUTO_INCREMENT for table `products` (bảng sản phẩm)
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
--
-- Constraints for table `products` (bảng sản phẩm)
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_target_id_foreign` FOREIGN KEY (`target_id`) REFERENCES `targets` (`target_id`),
  ADD CONSTRAINT `products_UV_id_foreign` FOREIGN KEY (`UV_id`) REFERENCES `UV` (`uv_id`),
  ADD CONSTRAINT `products_Refractive_id_foreign` FOREIGN KEY (`Refractive_id`) REFERENCES `Refractive` (`refractive_id`),
  ADD CONSTRAINT `products_Material_id_foreign` FOREIGN KEY (`Material_id`) REFERENCES `Material` (`material_id`),
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
-- --------------------------------------------------------

-- -----------------------------------------------------
-- Table structure for table `promotions` (Bảng quản lý mã giảm giá)
-- -----------------------------------------------------

CREATE TABLE `promotions` (
  `promotion_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MaGiamGia',
  `discount_percentage` double NOT NULL DEFAULT 0 COMMENT 'phanTram',
  `max_discount_value` double NOT NULL DEFAULT 0 COMMENT 'giaTriToiDa',
  `expiry_date` date NOT NULL COMMENT 'ngayHetHan',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promotion_id`),
  UNIQUE KEY `promotions_code_unique` (`promotion_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Dumping data mẫu cho table `promotions`
-- -----------------------------------------------------

INSERT INTO `promotions` (`promotion_code`, `discount_percentage`, `max_discount_value`, `expiry_date`) VALUES
('GIAM20', 20.0, 50000, '2025-12-31'),
('SUMMER2025', 10.0, 100000, '2025-08-30'),
('WELCOME', 50.0, 20000, '2026-01-01');

-- -----------------------------------------------------

--
-- Table structure for table `orders` (bảng đơn hàng)
-- 

CREATE TABLE `orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Đang xử lý','Đã xác nhận','Đang giao hàng','Đã giao hàng','Đã hủy') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Đang xử lý',
  `promotion_id` bigint(20) UNSIGNED NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders` (bảng đơn hàng)
--
INSERT INTO `orders` (`order_id`, `customer_id`, `customer_name`, `address`, `phone`, `email`, `pay_method`, `status`, `promotion_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nguyen Van A', 'TP.HCM', '0909090909', 'Abc@gmail.com', 'Chuyển khoản', 'Đã hủy', NULL, '2025-05-23 05:02:40', NOW()),
(2, 2, 'Nguyen Van B', 'TP.HCM', '09090432429', 'Adasd@gmail.com', 'Tiền mặt', 'Đang xử lý', 1, '2025-05-23 05:02:40', NOW()),
(3, 3, 'Nguyen Van C', 'TP.HCM', '0123123123', 'Asza@gmail.com', 'Chuyển khoản', 'Đã giao hàng', 2, '2025-05-23 05:02:40', NOW()),
(4, 4, 'Nguyen Van D', 'TP.HCM', '01434553123', 'Aszsda@gmail.com', 'Chuyển khoản', 'Đang giao hàng', NULL, '2025-05-23 05:02:40', NOW());
--
-- Indexes for table `orders` (bảng đơn hàng)
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);
--
-- AUTO_INCREMENT for table `orders` (bảng đơn hàng)
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for table `orders` (bảng đơn hàng)

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

ALTER TABLE `orders` 
ADD CONSTRAINT `fk_order_promotion` 
FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`);
-- --------------------------------------------------------

--
-- Table structure for table `orders_details` (bảng chi tiết đơn hàng)
--


CREATE TABLE `order_details` (
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` tinyint(4) NOT NULL,
  `total` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details` (bảng chi tiết đơn hàng)
--


INSERT INTO `order_details` (`order_details_id`, `order_id`, `product_id`, `price`, `quantity`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 280000, 1, 280000, NOW(), NOW()),
(2, 2, 14, 1062000, 1, 1062000, NOW(), NOW()),
(3, 3, 18, 260000, 1, 260000, NOW(), NOW()),
(4, 4, 21, 600000, 1, 600000, NOW(), NOW());

--
-- Indexes for table `order_details` (bảng chi tiết đơn hàng)
--

ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for table `order_details` (bảng chi tiết đơn hàng)
--

ALTER TABLE `order_details`
  MODIFY `order_details_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for table `order_details` (bảng chi tiết đơn hàng)
--

ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

-- --------------------------------------------------------
--
-- Table structure for table `cart` (bảng giỏ hàng)
--
CREATE TABLE `cart` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` int(11) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Indexes for table `cart`--
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`);
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;