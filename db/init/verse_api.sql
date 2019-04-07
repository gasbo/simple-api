-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 04, 2019 at 11:01 AM
-- Server version: 5.7.25
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verse_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `id` int(10) UNSIGNED NOT NULL,
  `fromUserId` int(10) UNSIGNED NOT NULL,
  `toUserId` int(10) UNSIGNED NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PENDING','ACCEPTED','REJECTED','DELETED', '') COLLATE utf8_unicode_ci NOT NULL,
  `addedTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PENDING','ACCEPTED','REJECTED','DELETED', '') COLLATE utf8_unicode_ci NOT NULL,
  `addedTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(10) UNSIGNED NOT NULL,
  `userId` int(10) UNSIGNED NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PENDING','ACCEPTED','REJECTED','DELETED', '') COLLATE utf8_unicode_ci NOT NULL,
  `addedTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `addedTs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `status`, `addedTs`) VALUES
(1, 'Alice', 'Allen', 'ACTIVE', '2019-04-04 10:55:56'),
(2, 'Bob', 'Brown', 'ACTIVE', '2019-04-04 10:56:10'),
(3, 'Eve', 'Evans', 'ACTIVE', '2019-04-05 11:56:10');

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`id`, `fromUserId`, `toUserId`, `amount`, `description`, `status`, `addedTs`) VALUES
(1, 1, 2, 3.25, 'Keychain', 'ACCEPTED', '2019-04-04 10:55:56'),
(2, 2, 1, 2.33, 'Keychain2', 'ACCEPTED', '2019-04-04 10:56:10'),
(3, 1, 3, 15, 'description', 'ACCEPTED', '2019-04-05 11:56:10'),
(4, 1, 3, 1, 'test', 'ACCEPTED', '2019-04-05 11:56:10');
--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `userId`, `amount`, `description`, `status`, `addedTs`) VALUES
(1, 3, 12.25, 'Bob Payment', 'ACCEPTED', '2019-04-04 10:55:56'),
(2, 2, 35, '---', 'ACCEPTED', '2019-04-04 10:55:56');

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `userId`, `amount`, `description`, `status`, `addedTs`) VALUES
(1, 1, 20, 'First Deposit', 'ACCEPTED', '2019-04-04 10:55:56'),
(2, 1, 20, '2nd Deposit', 'ACCEPTED', '2019-04-04 10:55:56'),
(3, 2, 50, '1st Deposit', 'ACCEPTED', '2019-04-04 10:55:56');
--
-- Indexes for table `transfers`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fromUserId` (`fromUserId`),
  ADD KEY `toUserId` (`toUserId`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
