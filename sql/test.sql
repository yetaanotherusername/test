-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 03, 2015 at 05:58 PM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `title`) VALUES
(1, 'First album'),
(2, 'Second album');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`) VALUES
(1, 'plamen'),
(2, 'nobody');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE IF NOT EXISTS `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `album_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- RELATIONS FOR TABLE `pictures`:
--   `author_id`
--       `authors` -> `id`
--   `album_id`
--       `albums` -> `id`
--

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`id`, `title`, `album_id`, `author_id`, `link`, `thumbnail`) VALUES
(1, 'policier', 1, 1, '5966d63ed6f3dc965740f921d907ee16.jpg', '5966d63ed6f3dc965740f921d907ee16_th.jpg'),
(2, 'German vehicle', 1, 1, 'ee5213c034436ab547aad60916c8cbe2.jpg', 'ee5213c034436ab547aad60916c8cbe2_th.jpg'),
(3, 'Cute elephant', 1, 1, '5e847254a2e723866d01c61be4a70616.jpg', '5e847254a2e723866d01c61be4a70616_th.jpg'),
(4, 'Scary bear', 1, 1, '5a2ffacb96e1e70b779e7dabd63862dc.jpg', '5a2ffacb96e1e70b779e7dabd63862dc_th.jpg'),
(5, 'Bud & Terrence', 1, 1, 'ab81ec2c36fa284ceb20ab98f02d61e4.jpg', 'ab81ec2c36fa284ceb20ab98f02d61e4_th.jpg'),
(6, 'abs benefits', 1, 1, '1f28b09cf762a4566f0903884d77da3f.jpg', '1f28b09cf762a4566f0903884d77da3f_th.jpg'),
(7, 'mr. Tiger', 1, 1, '3d8be206201dec71eb9957b3f016edba.jpg', '3d8be206201dec71eb9957b3f016edba_th.jpg'),
(8, 'funny giraffe', 1, 1, 'b0c877339d1a7915ce163df5b1b29cab.jpg', 'b0c877339d1a7915ce163df5b1b29cab_th.jpg'),
(9, 'bear''s.. back', 1, 1, '21988ce4287af3cdf6ae40002182efaf.jpg', '21988ce4287af3cdf6ae40002182efaf_th.jpg'),
(10, 'Incoming...', 2, 2, '5d5bcb644b69f71f06119b8eedfeddb2.jpg', '5d5bcb644b69f71f06119b8eedfeddb2_th.jpg'),
(11, 'Lazy bear', 2, 2, '29777adddec92cf4f2527003c8b64212.jpg', '29777adddec92cf4f2527003c8b64212_th.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `pictures_authors` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `pictures_albums` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
