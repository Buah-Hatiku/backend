-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 04:04 PM
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
(29, '', 'mia.jpg', NULL, '2025-01-11 09:56:57', '2025-01-12 10:35:14'),
(36, 'asdf', 'cv.jpeg', 'asdf', '2025-01-11 12:37:14', '2025-01-12 10:43:03'),
(38, 'asd', 'MASBREW.jpg', 'asd', '2025-01-12 04:52:48', '2025-01-12 04:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 'test', 'Terjadi kesalahan saat mengunggah gambar.', 'afafa', '2025-01-11 08:20:05', '2025-01-11 08:20:05'),
(2, 'padet', 'uploads/c.jpg', 'tes update', '2025-01-11 08:21:43', '2025-01-11 08:37:19'),
(3, 'test', 'uploads/c.jpg', 'aafa', '2025-01-11 08:21:55', '2025-01-11 08:21:55'),
(4, 'test', 'File sudah ada.', 'aafa', '2025-01-11 08:23:11', '2025-01-11 08:23:11'),
(5, 'Bokep', 'File sudah ada.', '123', '2025-01-11 09:47:39', '2025-01-11 09:47:39'),
(6, 'Bokep', 'File sudah ada.', '123', '2025-01-11 09:47:42', '2025-01-11 09:47:42'),
(7, 'Bokep1', 'File sudah ada.', 'AAA', '2025-01-11 09:47:51', '2025-01-11 09:47:51');

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
  `quantity` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `category_id`, `price`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
(8, 'KERa sakti', 'Justalk_night.jpg', 29, '9000.00', 1, '12345', '2025-01-11 10:42:03', '2025-01-11 10:42:03'),
(9, 'ter banget terakhir', '94a5e934b3d643f13f0227a91ec86996.gif', 29, '123.00', 1, '1231313', '2025-01-11 10:49:29', '2025-01-11 10:49:29'),
(10, 'ter banget terakhir', 'qw.gif', 29, '123.00', 1, '123', '2025-01-11 10:51:14', '2025-01-11 10:51:14');

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
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `status` enum('semua','menunggu persetujuan','diproses','selesai','dibatalkan') DEFAULT 'semua',
  `payment_proof` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
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
(2, 'admin', 'admin@example.com', '$2y$10$E9dF94oZUMmNfHaxBxC06eg6G9eAOYBtI5Ht09BlDOoSryR9DS9yG', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:26:17', '2025-01-12 13:26:17'),
(4, 'admin', 'admin@example.com', 'Admin123', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:29:17', '2025-01-12 13:29:17'),
(5, 'admin', 'admin@gmail.com', 'Admin123', 'Administrator', 'Jl. Contoh No. 123, Jakarta', '08123456789', 'admin', '2025-01-12 13:34:19', '2025-01-12 13:34:19'),
(6, 'ibra', 'ibrazaki053@gmail.com', '$2y$10$Uww0bvgGjwpzbJTiU8A8luhR2WRe7ceEU4VzSr1UwmEEmzbW.fA0q', 'IBRA ZAKI RIDWAN', NULL, NULL, 'user', '2025-01-12 14:19:40', '2025-01-12 14:19:40'),
(7, 'thanksyou', 'alip@gmail.com', 'ardhi123', 'alip bakery', NULL, NULL, 'user', '2025-01-12 14:23:52', '2025-01-12 14:23:52');

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
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
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
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
