-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2020 at 07:06 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitterlike`
--
CREATE DATABASE IF NOT EXISTS `twitterlike` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `twitterlike`;

-- --------------------------------------------------------

--
-- Table structure for table `Reply`
--

CREATE TABLE `Reply` (
  `replyId` int(11) NOT NULL,
  `tweetId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `retweetId` int(11) NOT NULL,
  `replyDate` date NOT NULL,
  `content` text NOT NULL,
  `countLikes` int(11) NOT NULL,
  `countRetweet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Retweet`
--

CREATE TABLE `Retweet` (
  `retweetId` int(11) NOT NULL,
  `tweetId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `retweetDate` date NOT NULL,
  `content` text NOT NULL,
  `url` int(11) NOT NULL,
  `countLikes` int(11) NOT NULL,
  `countRetweet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Tweet`
--

CREATE TABLE `Tweet` (
  `tweetId` int(11) NOT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `userPseudo` varchar(30) DEFAULT NULL,
  `tweetDate` date DEFAULT NULL,
  `content` text,
  `url` varchar(100) DEFAULT NULL,
  `countLikes` int(11) DEFAULT NULL,
  `countRetweet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Tweet`
--

INSERT INTO `Tweet` (`tweetId`, `userName`, `userPseudo`, `tweetDate`, `content`, `url`, `countLikes`, `countRetweet`) VALUES
(47, 'Buffy', 'Slayer', NULL, ' Je killall les démons', NULL, 0, 0),
(48, 'Philippa Georgiou', 'ISS_Shenzhou', NULL, 'Quand on te cherche on te trouve hehe', NULL, 0, 0),
(49, 'Verlec Nim', 'Aama', NULL, ' Hello les simploniens!', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userTable`
--

CREATE TABLE `userTable` (
  `userId` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `userPseudo` varchar(30) NOT NULL,
  `userPassword` varchar(30) NOT NULL,
  `userEmailAdress` varchar(30) NOT NULL,
  `userPicture` blob COMMENT 'stockage des images de profil'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userTable`
--

INSERT INTO `userTable` (`userId`, `userName`, `userPseudo`, `userPassword`, `userEmailAdress`, `userPicture`) VALUES
(3, 'Buffy', 'Slayer', 'vampire', 'buffy@slayer.com', ''),
(4, 'Titus', 'titi', 'lulu', 'titus@titi.com', NULL),
(5, 'Philippa Georgiou', 'ISS_Shenzhou', 'enterprise', 'cptgeorgiou@startfleet.com', NULL),
(6, 'Verlec Nim', 'Aama', 'onaji', 'verloc@nim.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Reply`
--
ALTER TABLE `Reply`
  ADD PRIMARY KEY (`replyId`),
  ADD KEY `tweetId` (`tweetId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `retweetId` (`retweetId`);

--
-- Indexes for table `Retweet`
--
ALTER TABLE `Retweet`
  ADD PRIMARY KEY (`retweetId`),
  ADD KEY `tweetId` (`tweetId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `Tweet`
--
ALTER TABLE `Tweet`
  ADD PRIMARY KEY (`tweetId`);

--
-- Indexes for table `userTable`
--
ALTER TABLE `userTable`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Reply`
--
ALTER TABLE `Reply`
  MODIFY `replyId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Retweet`
--
ALTER TABLE `Retweet`
  MODIFY `retweetId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Tweet`
--
ALTER TABLE `Tweet`
  MODIFY `tweetId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `userTable`
--
ALTER TABLE `userTable`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Reply`
--
ALTER TABLE `Reply`
  ADD CONSTRAINT `Reply_ibfk_1` FOREIGN KEY (`tweetId`) REFERENCES `Tweet` (`tweetId`),
  ADD CONSTRAINT `Reply_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `userTable` (`userId`),
  ADD CONSTRAINT `Reply_ibfk_3` FOREIGN KEY (`retweetId`) REFERENCES `Retweet` (`retweetId`);

--
-- Constraints for table `Retweet`
--
ALTER TABLE `Retweet`
  ADD CONSTRAINT `Retweet_ibfk_1` FOREIGN KEY (`tweetId`) REFERENCES `Tweet` (`tweetId`),
  ADD CONSTRAINT `Retweet_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `userTable` (`userId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
