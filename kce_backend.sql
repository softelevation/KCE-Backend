-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2022 at 07:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kce_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(111) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'All', '2022-07-26 11:53:35', '2022-07-26 11:53:35'),
(2, 'America11', '2022-07-26 11:53:35', '2022-07-26 11:53:35'),
(3, 'Europe', '2022-07-26 11:55:22', '2022-07-26 11:55:22'),
(4, 'Asia', '2022-07-26 11:55:22', '2022-07-26 11:55:22'),
(5, 'Osenia', '2022-07-26 11:56:38', '2022-07-26 11:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(111) NOT NULL,
  `image` varchar(111) NOT NULL,
  `description` text NOT NULL,
  `rating` int(11) NOT NULL,
  `distance` varchar(111) NOT NULL,
  `location` varchar(255) NOT NULL,
  `country` varchar(111) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `category_id`, `title`, `image`, `description`, `rating`, `distance`, `location`, `country`, `createdAt`, `updatedAt`) VALUES
(1, 2, 'Road bicycle racing', 'experiences/download.jpg', 'Road bicycle racing is the cycle sport discipline of road cycling, held primarily on paved roads. Road racing is the most popular professional form of bicycle racing, in terms of numbers of competitors, events and spectators.', 5, '100', 'HonorHealth Scottsdale Shea Park Center.', 'italy', '2022-07-26 12:09:26', '2022-07-26 12:09:26'),
(2, 2, 'Road bicycle 1', 'experiences/download1.jpg', 'Road bicycle racing is the cycle sport discipline of road cycling, held primarily on paved roads. Road racing is the most popular professional form of bicycle racing, in terms of numbers of competitors, events and spectators.', 3, '20', 'HonorHealth Scottsdale Shea Park Center.', 'uk', '2022-07-26 12:09:26', '2022-07-26 12:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'aman', 'tyagi', 'aman@kce.com', '$2a$08$RUtivm.2rxYN5oVgBRtBc.4t6L./5otFl0teRiomk.on21GMsoYY6', '2022-07-26 05:42:57', '2022-07-26 05:42:57'),
(2, 'aman', 'tyagi', 'aman1@kce.com', '$2a$08$3/dEql5X7ItHBdkyL38O0efRfoyy/LBRyx2Yv90e/o3/N1rMskdAO', '2022-07-26 05:43:37', '2022-07-26 05:43:37'),
(3, 'aman', 'tyagi', 'aman2@kce.com', '$2a$08$vw8/rihLGic6gK4QrjE3jej/6H4asXwvspxSg44ut3YiWLYth/QaS', '2022-07-26 10:46:07', '2022-07-26 10:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('2022-07-26 05:43:37', '2022-07-26 05:43:37', 1, 2),
('2022-07-26 10:46:07', '2022-07-26 10:46:07', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `experience_id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `experience_id`, `createdAt`, `updatedAt`) VALUES
(4, 2, 0, '2022-07-28 11:19:08', '2022-07-28 11:19:08'),
(5, 2, 0, '2022-07-28 11:19:08', '2022-07-28 11:19:08'),
(6, 2, 0, '2022-07-28 11:19:08', '2022-07-28 11:19:08'),
(7, 2, 0, '2022-07-28 11:19:08', '2022-07-28 11:19:08'),
(8, 2, 0, '2022-07-28 11:19:08', '2022-07-28 11:19:08'),
(9, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(10, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(11, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(12, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(13, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(14, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(15, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(16, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(17, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(18, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(19, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(20, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(21, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(22, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(23, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(24, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(25, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(26, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(27, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(28, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(29, 2, 0, '2022-07-29 10:16:58', '2022-07-29 10:16:58'),
(30, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(31, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(32, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(33, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(34, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(35, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(36, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(37, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(38, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(39, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(40, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(41, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(42, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(43, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(44, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(45, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(46, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(47, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(48, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(49, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(50, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(51, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(52, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(53, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(54, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(55, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(56, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(57, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(58, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(59, 2, 0, '2022-07-29 10:16:59', '2022-07-29 10:16:59'),
(60, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(61, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(62, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(63, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(64, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(65, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(66, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(67, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(68, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(69, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(70, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(71, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(72, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(73, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(74, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(75, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(76, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(77, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(78, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(79, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(80, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(81, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(82, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(83, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(84, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(85, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(86, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(87, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(88, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(89, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(90, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(91, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(92, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(93, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(94, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(95, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(96, 2, 0, '2022-07-29 10:17:00', '2022-07-29 10:17:00'),
(97, 2, 0, '2022-07-29 10:17:01', '2022-07-29 10:17:01'),
(98, 2, 0, '2022-07-29 10:17:01', '2022-07-29 10:17:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
