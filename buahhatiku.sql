-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2025 at 12:59 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buahhatiku`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(39, 'Anak', 'anak.png', 'Anak', '2025-01-13 03:58:28', '2025-01-13 03:58:28'),
(40, 'Ibu', 'ibu.png', 'ibu', '2025-01-13 03:58:43', '2025-01-13 03:58:43'),
(41, 'Kecantikan', 'kecantikan.png', 'kecantikan', '2025-01-13 03:59:04', '2025-01-13 03:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `payment_proofs`
--

CREATE TABLE `payment_proofs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `payment_proof_file` varchar(255) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_proofs`
--

INSERT INTO `payment_proofs` (`id`, `user_id`, `product_id`, `payment_proof_file`, `total_price`, `status`, `created_at`, `updated_at`, `quantity`) VALUES
(13, 9, 11, '678bc65d8746a1.34549478.png', 69500, 'approved', '2025-01-18 15:18:53', '2025-01-18 15:19:17', 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `category_id`, `price`, `stock`, `description`, `created_at`, `updated_at`) VALUES
(11, 'Bedak', 'download.jpg', 39, '12000.00', 17, 'Bedak Untuk Anak', '2025-01-13 04:18:21', '2025-01-18 22:55:06'),
(12, 'Susu Ibu hamil', 'f225ca7df8ac44535b41765e5c998880.jpg', 40, '30000.00', 10, 'Susu Ibu Hamil', '2025-01-13 04:18:51', '2025-01-18 14:52:42'),
(13, 'Skincare', '01845b06-afda-4078-a381-62bc504f163b.jpg', 41, '50000.00', 8, 'skincare bagus', '2025-01-13 04:19:17', '2025-01-18 14:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `full_name`, `address`, `phone_number`, `role`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@example.com', '$2y$10$tNDa5hXON7yUmjiLK1Q5Xe9Swu2zfu0b7ziSQRl1Q5NqiBydLApAS', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:26:17', '2025-01-12 16:42:12'),
(4, 'admin', 'admin@example.com', 'Admin123', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:29:17', '2025-01-12 13:29:17'),
(5, 'admin', 'admin@gmail.com', 'Admin123', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:34:19', '2025-01-12 13:34:19'),
(6, 'ibra', 'ibrazaki053@gmail.com', '$2y$10$Uww0bvgGjwpzbJTiU8A8luhR2WRe7ceEU4VzSr1UwmEEmzbW.fA0q', 'IBRA ZAKI RIDWAN', NULL, NULL, 'user', '2025-01-12 14:19:40', '2025-01-12 14:19:40'),
(7, 'thanksyou', 'alip@gmail.com', 'ardhi123', 'alip bakery', NULL, NULL, 'user', '2025-01-12 14:23:52', '2025-01-12 14:23:52'),
(8, 'qwe', 'asd@gmail.com', '123', 'asdfghjkl', 'jl.asdfghjkl', '12345435435435435', 'admin', '2025-01-12 16:41:04', '2025-01-12 16:44:50'),
(9, '123', '123@gmail.com', '123', 'Test', 'Jl Haji Jali Tangerang', '081314946095', 'user', '2025-01-13 05:07:01', '2025-01-13 10:14:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `payment_proofs`
--
ALTER TABLE `payment_proofs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payment_proofs`
--
ALTER TABLE `payment_proofs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
