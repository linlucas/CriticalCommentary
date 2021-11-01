-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2021 at 08:44 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movieapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `name`, `nationality`) VALUES
(1, 'Brad Pitt', 'American'),
(2, 'Edward Norton', 'American'),
(3, 'Cho Yeo-jeong', 'Korean'),
(4, 'Park So-dam', 'Korean'),
(5, 'Leonardo DiCaprio', 'American'),
(6, 'Joseph Gordon-Levitt', 'American'),
(7, 'John David Washington', 'American'),
(8, 'Robert Pattinson', 'British');

-- --------------------------------------------------------

--
-- Stand-in structure for view `avg_rating`
-- (See below for the actual view)
--
CREATE TABLE `avg_rating` (
`movie_id` int(11)
,`avg` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Table structure for table `box_office`
--

CREATE TABLE `box_office` (
  `movie_id` int(11) NOT NULL,
  `gross_profit` int(11) NOT NULL,
  `weeks_in_theater` int(11) NOT NULL,
  `age_rating` varchar(10) NOT NULL,
  `budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `box_office`
--

INSERT INTO `box_office` (`movie_id`, `gross_profit`, `weeks_in_theater`, `age_rating`, `budget`) VALUES
(1, 45150, 5, 'PG', 21000),
(2, 1938047, 23, 'R', 21000),
(3, 1324, 3, 'R', 21343252),
(4, 1251, 1243, 'NC-17', 1234325);

-- --------------------------------------------------------

--
-- Table structure for table `critics`
--

CREATE TABLE `critics` (
  `critic_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `critics`
--

INSERT INTO `critics` (`critic_id`, `name`) VALUES
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd'),
(5, 'e'),
(6, 'f'),
(7, 'g'),
(8, 'h'),
(9, 'i'),
(10, 'j');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `coutnry_of_origin` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `trailer_link` varchar(255) NOT NULL,
  `poster_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `name`, `genre`, `release_year`, `coutnry_of_origin`, `language`, `director`, `trailer_link`, `poster_link`) VALUES
(1, 'Fight Club', 'Drama', 1999, 'America', 'English', 'David Fincher', 'https://www.youtube.com/watch?v=SUXWAEX2jlg', 'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_.jpg'),
(2, 'Parasite', 'Drama', 2019, 'Korea', 'Korean', 'Bong Joon-ho', 'https://www.youtube.com/watch?v=5xH0HfJHsaY&t=4s', 'https://assets.mubicdn.net/images/notebook/post_images/29832/images-w1400.jpg?1579570864'),
(3, 'Tenet', 'sci-fi', 2020, 'America', 'English', 'Christopher Nolan', 'https://www.youtube.com/watch?v=AZGcmvrTX9M', 'https://m.media-amazon.com/images/M/MV5BYzg0NGM2NjAtNmIxOC00MDJmLTg5ZmYtYzM0MTE4NWE2NzlhXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg'),
(4, 'Inception', 'action', 2010, 'America', 'English', 'Christopher Nolan', 'https://www.youtube.com/watch?v=YoHD9XEInc0', 'https://static.displate.com/857x1200/displate/2020-04-27/c033648ac36509e3690684ca6a60ddaa_c4c6e9073230ebc514dd9e4fc0633de7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `parental_advisory`
--

CREATE TABLE `parental_advisory` (
  `movie_id` int(11) NOT NULL,
  `violence` varchar(10) NOT NULL,
  `sex_nudity` varchar(10) NOT NULL,
  `drug_alcohol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parental_advisory`
--

INSERT INTO `parental_advisory` (`movie_id`, `violence`, `sex_nudity`, `drug_alcohol`) VALUES
(1, 'Severe', 'Severe', 'Severe'),
(2, 'Severe', 'Severe', 'Severe'),
(3, 'Severe', 'Moderate', 'Mild'),
(4, 'Moderate', 'Mild', 'Severe');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `critic_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`critic_id`, `movie_id`, `rating`) VALUES
(1, 1, 9),
(2, 1, 8),
(3, 1, 7),
(4, 2, 9),
(5, 2, 8),
(6, 2, 7),
(7, 4, 3),
(8, 4, 2),
(9, 3, 7),
(10, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `starring`
--

CREATE TABLE `starring` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `starring`
--

INSERT INTO `starring` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 7),
(3, 8),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Structure for view `avg_rating`
--
DROP TABLE IF EXISTS `avg_rating`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `avg_rating`  AS SELECT `ratings`.`movie_id` AS `movie_id`, avg(`ratings`.`rating`) AS `avg` FROM `ratings` GROUP BY `ratings`.`movie_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- Indexes for table `box_office`
--
ALTER TABLE `box_office`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `critics`
--
ALTER TABLE `critics`
  ADD PRIMARY KEY (`critic_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `parental_advisory`
--
ALTER TABLE `parental_advisory`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`critic_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `critic_id` (`critic_id`);

--
-- Indexes for table `starring`
--
ALTER TABLE `starring`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `actor_id_2` (`actor_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `box_office`
--
ALTER TABLE `box_office`
  ADD CONSTRAINT `box_office_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parental_advisory`
--
ALTER TABLE `parental_advisory`
  ADD CONSTRAINT `parental_advisory_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`critic_id`) REFERENCES `critics` (`critic_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `starring`
--
ALTER TABLE `starring`
  ADD CONSTRAINT `starring_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `starring_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
