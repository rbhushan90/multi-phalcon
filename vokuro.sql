-- phpMyAdmin SQL Dump
-- version 4.1.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2014 at 03:08 PM
-- Server version: 5.5.36-MariaDB
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vokuro`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transfer`
--

CREATE TABLE IF NOT EXISTS `account_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `recipientAccount` varchar(25) NOT NULL,
  `transferAccount` varchar(25) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains product categories, e.g., dairy, meats, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `comments` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `created_at` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `comments`, `created_at`) VALUES
(1, 'chien', 'hodacchein@gmail', 'cccccccccc', 1388999017),
(2, 'fc', 'fcduythien@gmail.com', 'sdfd', 2013),
(3, 'chien', 'hodacchein@gmail.com', NULL, NULL),
(5, 'chien', 'hodacchein@gmail.com', NULL, NULL),
(6, 'chien', 'hodacchein@gmail.com', NULL, NULL),
(7, 'chien', 'hodacchein@gmail', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_confirmations`
--

CREATE TABLE IF NOT EXISTS `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` char(32) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `confirmed` char(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `email_confirmations`
--

INSERT INTO `email_confirmations` (`id`, `usersId`, `code`, `createdAt`, `modifiedAt`, `confirmed`) VALUES
(1, 14, 'FK9AlsO6RRsiqmux0PI9EKfzHoFRR2a7', 1366990529, 1366992523, 'Y'),
(2, 15, 'nOLpYKwCFqPYm8fXZ6osjkKUKNaVahp', 1367473328, 1367505447, 'Y'),
(3, 16, 'xMb8ZxTpJv2E3FPKod6OYJ7kDbw9hOLJ', 1367509740, 1367509761, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE IF NOT EXISTS `failed_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned DEFAULT NULL,
  `ipAddress` char(15) NOT NULL,
  `attempted` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `failed_logins`
--

INSERT INTO `failed_logins` (`id`, `usersId`, `ipAddress`, `attempted`) VALUES
(1, 2, '::1', 1366995290),
(2, 2, '::1', 1366995304),
(3, 2, '::1', 1366995309),
(4, 0, '::1', 1366995331),
(5, 2, '::1', 1366995342),
(6, 14, '::1', 1366995687),
(7, 14, '::1', 1366995825),
(8, 14, '::1', 1366996310),
(9, 2, '::1', 1366996324),
(10, 2, '127.0.0.1', 1367000208),
(11, 14, '127.0.0.1', 1367012708),
(12, 2, '::1', 1367014700),
(13, 14, '::1', 1367014714),
(14, 14, '::1', 1367014724),
(15, 14, '::1', 1367014830),
(16, 14, '::1', 1367014843),
(17, 2, '::1', 1367014916),
(18, 2, '::1', 1367014926),
(19, 2, '::1', 1367015303),
(20, 14, '::1', 1367015786),
(21, 2, '127.0.0.1', 1367099996),
(22, 0, '127.0.0.1', 1380900593),
(23, 1, '127.0.0.1', 1380909311),
(24, 0, '127.0.0.1', 1381119065),
(25, 0, '127.0.0.1', 1381119073),
(26, 2, '127.0.0.1', 1381215566),
(27, 2, '127.0.0.1', 1381242211),
(28, 0, '127.0.0.1', 1381464997),
(29, 0, '127.0.0.1', 1381465005),
(30, 0, '127.0.0.1', 1381465020),
(31, 0, '127.0.0.1', 1381466598),
(32, 1, '127.0.0.1', 1381480185),
(33, 2, '127.0.0.1', 1381480307),
(34, 2, '127.0.0.1', 1381480319),
(35, 1, '127.0.0.1', 1381480656),
(36, 2, '127.0.0.1', 1381482232),
(37, 1, '127.0.0.1', 1381484997),
(38, 1, '127.0.0.1', 1381502665),
(39, 0, '127.0.0.1', 1381506277),
(40, 0, '127.0.0.1', 1381506288),
(41, 2, '127.0.0.1', 1381626673),
(42, 2, '127.0.0.1', 1381626685),
(43, 1, '127.0.0.1', 1381676620),
(44, 0, '127.0.0.1', 1382325790),
(45, 0, '127.0.0.1', 1384420961),
(46, 6, '127.0.0.1', 1384440292),
(47, 6, '127.0.0.1', 1384535898),
(48, 6, '127.0.0.1', 1384535904),
(49, 4, '127.0.0.1', 1384537197),
(50, 4, '127.0.0.1', 1384537199),
(51, 4, '127.0.0.1', 1384537204),
(52, 0, '127.0.0.1', 1384572122),
(53, 4, '127.0.0.1', 1384669686),
(54, 0, '127.0.0.1', 1385092384),
(55, 0, '127.0.0.1', 1385092395),
(56, 6, '127.0.0.1', 1385631479);

-- --------------------------------------------------------

--
-- Table structure for table `password_changes`
--

CREATE TABLE IF NOT EXISTS `password_changes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `password_changes`
--

INSERT INTO `password_changes` (`id`, `usersId`, `ipAddress`, `userAgent`, `createdAt`) VALUES
(1, 2, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.31 ', 1367014804),
(2, 2, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.31 ', 1367014986),
(3, 15, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.31 ', 1367505457),
(4, 2, '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.31 ', 1367511911);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profilesId` int(10) unsigned NOT NULL,
  `resource` varchar(16) NOT NULL,
  `action` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`profilesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT=' users access resource' AUTO_INCREMENT=224 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `profilesId`, `resource`, `action`) VALUES
(90, 3, 'users', 'index'),
(91, 3, 'users', 'search'),
(92, 3, 'profiles', 'index'),
(93, 3, 'profiles', 'search'),
(117, 2, 'users', 'index'),
(118, 2, 'users', 'search'),
(119, 2, 'users', 'edit'),
(120, 2, 'users', 'create'),
(121, 2, 'profiles', 'index'),
(122, 2, 'profiles', 'search'),
(123, 1, 'users', 'index'),
(124, 1, 'users', 'search'),
(125, 1, 'users', 'edit'),
(126, 1, 'users', 'create'),
(127, 1, 'users', 'delete'),
(128, 1, 'users', 'changePassword'),
(129, 1, 'users', 'deleteMuti'),
(130, 1, 'profiles', 'index'),
(131, 1, 'profiles', 'search'),
(132, 1, 'profiles', 'edit'),
(133, 1, 'profiles', 'create'),
(134, 1, 'profiles', 'delete'),
(135, 1, 'permissions', 'index'),
(162, 8, 'users', 'index'),
(163, 8, 'users', 'search'),
(164, 8, 'users', 'edit'),
(165, 8, 'users', 'create'),
(166, 8, 'users', 'delete'),
(167, 8, 'users', 'changePassword'),
(168, 8, 'users', 'deleteMuti'),
(169, 8, 'profiles', 'index'),
(170, 8, 'profiles', 'search'),
(171, 8, 'profiles', 'edit'),
(172, 8, 'profiles', 'create'),
(173, 8, 'profiles', 'delete'),
(174, 8, 'permissions', 'index'),
(210, 4, 'users', 'index'),
(211, 4, 'users', 'search'),
(212, 4, 'users', 'edit'),
(213, 4, 'users', 'create'),
(214, 4, 'users', 'delete'),
(215, 4, 'users', 'changePassword'),
(216, 4, 'users', 'deleteMuti'),
(217, 4, 'users', 'transfer'),
(218, 4, 'profiles', 'index'),
(219, 4, 'profiles', 'search'),
(220, 4, 'profiles', 'edit'),
(221, 4, 'profiles', 'create'),
(222, 4, 'profiles', 'delete'),
(223, 4, 'permissions', 'index');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `categories` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(25) NOT NULL,
  `commentAuthor` varchar(40) NOT NULL,
  `email` varchar(245) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` tinytext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `categoryId` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains product details' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `active` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active` (`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='defined permision' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `active`) VALUES
(1, 'Administrators', 'Y'),
(2, 'Users', 'Y'),
(3, 'Read-Only', 'Y'),
(4, 'UsersOrder', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `remember_tokens`
--

CREATE TABLE IF NOT EXISTS `remember_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `token` char(32) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `remember_tokens`
--

INSERT INTO `remember_tokens` (`id`, `usersId`, `token`, `userAgent`, `createdAt`) VALUES
(13, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1382585381),
(14, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1382585407),
(15, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1382690968),
(16, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1382889248),
(17, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1382952171),
(18, 4, '5d7fb1ba2548c436f6e027510ac97a5f', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0', 1383272218),
(19, 4, '67003aee13f6b78a1214022540cb07e2', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384157621),
(20, 6, '7d82c314f74f854ead29da0d543f6e16', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384420934),
(21, 6, '7d82c314f74f854ead29da0d543f6e16', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384440470),
(22, 6, '7d82c314f74f854ead29da0d543f6e16', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384440472),
(23, 6, '7d82c314f74f854ead29da0d543f6e16', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384440529),
(24, 6, '7d82c314f74f854ead29da0d543f6e16', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384440553),
(25, 4, '6f3c92440758fca43897fe286a45edcc', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384505645),
(26, 4, '6f3c92440758fca43897fe286a45edcc', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384505906),
(27, 6, '7d2db41b922f78b150006b0dd06057db', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384854557),
(28, 6, '7d2db41b922f78b150006b0dd06057db', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384880415),
(29, 6, '7d2db41b922f78b150006b0dd06057db', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0', 1384880466);

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE IF NOT EXISTS `reset_passwords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `code` varchar(48) NOT NULL,
  `createdAt` int(10) unsigned NOT NULL,
  `modifiedAt` int(10) unsigned DEFAULT NULL,
  `reset` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `success_logins`
--

CREATE TABLE IF NOT EXISTS `success_logins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usersId` int(10) unsigned NOT NULL,
  `ipAddress` char(15) NOT NULL,
  `userAgent` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersId` (`usersId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- Dumping data for table `success_logins`
--

INSERT INTO `success_logins` (`id`, `usersId`, `ipAddress`, `userAgent`) VALUES
(1, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(2, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(3, 2, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(4, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(5, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0'),
(6, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0'),
(7, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(8, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(9, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(10, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(11, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(12, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(13, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(14, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(15, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(16, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(17, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(18, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(19, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(20, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(21, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(22, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(23, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(24, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(25, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(26, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(27, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(28, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(29, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(30, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(31, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(32, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(33, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(34, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(35, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(36, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(37, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(38, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(39, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(40, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(41, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(42, 2, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(43, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(44, 1, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(45, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(46, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(47, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(48, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(49, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(50, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(51, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(52, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(53, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(54, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0'),
(55, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(56, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(57, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(58, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(59, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(60, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(61, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:27.0) Gecko/20100101 Firefox/27.0'),
(62, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(63, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(64, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(65, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(66, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(67, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(68, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(69, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(70, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(71, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(72, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(73, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(74, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:24.0) Gecko/20100101 Firefox/24.0'),
(75, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(76, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(77, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(78, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(79, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(80, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(81, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(82, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(83, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(84, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(85, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(86, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(87, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(88, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(89, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(90, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(91, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(92, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(93, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(94, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(95, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(96, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(97, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(98, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(99, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(100, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(101, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(102, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(103, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(104, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(105, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(106, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(107, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(108, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(109, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(110, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(111, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(112, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(113, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(114, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(115, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(116, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(117, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(118, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(119, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(120, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(121, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(122, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(123, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(124, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(125, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(126, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(127, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(128, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(129, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(130, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(131, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(132, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(133, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(134, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(135, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(136, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(137, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(138, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(139, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(140, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(141, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(142, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(143, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(144, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(145, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(146, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(147, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(148, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(149, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(150, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(151, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(152, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(153, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(154, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(155, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(156, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(157, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(158, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(159, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(160, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(161, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(162, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(163, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(164, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(165, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(166, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(167, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(168, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(169, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(170, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(171, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(172, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(173, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(174, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(175, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(176, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(177, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(178, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(179, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(180, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(181, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(182, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(183, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(184, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(185, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(186, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.114 Safari/537.36'),
(187, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(188, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(189, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(190, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(191, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(192, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(193, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(194, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(195, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(196, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(197, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(198, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(199, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(200, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(201, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(202, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(203, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(204, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(205, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(206, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(207, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(208, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(209, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(210, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(211, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:25.0) Gecko/20100101 Firefox/25.0'),
(212, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:27.0) Gecko/20100101 Firefox/27.0'),
(213, 6, '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0'),
(214, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0'),
(215, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0'),
(216, 4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` char(60) NOT NULL,
  `mustChangePassword` char(1) DEFAULT NULL,
  `profilesId` int(10) unsigned NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `sex` enum('Nam','Nữ','Chưa Biết') NOT NULL,
  `birthday` date NOT NULL,
  `cardId` int(15) NOT NULL,
  `creditCard` varchar(25) NOT NULL,
  `phone` int(15) NOT NULL,
  `balance` decimal(20,2) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `cityRegion` varchar(25) NOT NULL,
  `banned` char(1) NOT NULL,
  `suspended` char(1) NOT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profilesId` (`profilesId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `mustChangePassword`, `profilesId`, `fullName`, `sex`, `birthday`, `cardId`, `creditCard`, `phone`, `balance`, `address`, `cityRegion`, `banned`, `suspended`, `active`) VALUES
(2, 'pdt', 'pdt@gmal.com', '$2a$08$StQVu2CYTwcY5k2iy1HQ5O3d5Tlne8ykTzt4ICOjCyFqnwbs6hTqK', 'Y', 2, '', 'Nam', '0000-00-00', 0, '0', 0, '0.00', '', '', 'N', 'N', 'Y'),
(4, 'admin', 'admin@gmail.com', '$2a$08$X0DBRJdOTtY9KzC0P6nnk.ni4QYHQxJrhilBs3wABv97E69wDi4Ve', 'N', 1, '', 'Nam', '0000-00-00', 0, '0', 0, '0.00', '', '', 'N', 'N', 'Y'),
(6, 'duythien', 'fcduythien@gmail.com', '$2a$08$jOiTt8yCC6F6EAMHSXPciewB8zvaHh8IrUlN1ENNkOnZHjNRjF.yC', 'N', 4, 'Tran', 'Nam', '0000-00-00', 1234567890, '0000-1111-2222-3333', 909340777, NULL, NULL, 'HÆ°ng YÃªn', 'N', 'N', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `users_order`
--

CREATE TABLE IF NOT EXISTS `users_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,2) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmation_number` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='maintains user order details' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users_order`
--

INSERT INTO `users_order` (`id`, `amount`, `date_created`, `confirmation_number`, `users_id`) VALUES
(1, '1000.00', '2013-11-14 08:22:29', 0, 0),
(2, '999999999999999999.99', '2013-11-14 08:47:20', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
