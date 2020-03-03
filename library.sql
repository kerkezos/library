-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 04 Μαρ 2020 στις 00:21:57
-- Έκδοση διακομιστή: 10.4.6-MariaDB
-- Έκδοση PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `library`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `authors`
--

CREATE TABLE `authors` (
  `authorid` int(10) NOT NULL,
  `authorname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `authors`
--

INSERT INTO `authors` (`authorid`, `authorname`) VALUES
(1, 'kerkezos'),
(3, 'kazis'),
(4, 'xouvardas'),
(6, 'zarkali'),
(18, 'velimaxiti'),
(20, 'xalari');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `books`
--

CREATE TABLE `books` (
  `bookid` int(10) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `authorid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `books`
--

INSERT INTO `books` (`bookid`, `bookname`, `authorid`) VALUES
(2, 'xouva1', 4),
(3, 'xouva2', 4),
(4, 'zarka1', 6),
(5, 'zarka5', 6),
(13, 'kaziro', 3),
(16, 'timer', 18),
(38, 'kerkezeiko', 1),
(66, 'kaziriiio', 3),
(67, 'zarkilliko', 6),
(69, 'xalareiko', 20);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `fantasy`
--

CREATE TABLE `fantasy` (
  `tagid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `fantasy`
--

INSERT INTO `fantasy` (`tagid`, `bookid`) VALUES
(9, 66),
(10, 67),
(12, 69);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `horror`
--

CREATE TABLE `horror` (
  `tagid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `horror`
--

INSERT INTO `horror` (`tagid`, `bookid`) VALUES
(2, 66);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `romance`
--

CREATE TABLE `romance` (
  `tagid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `romance`
--

INSERT INTO `romance` (`tagid`, `bookid`) VALUES
(20, 66),
(21, 67);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `sciencefiction`
--

CREATE TABLE `sciencefiction` (
  `tagid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Άδειασμα δεδομένων του πίνακα `sciencefiction`
--

INSERT INTO `sciencefiction` (`tagid`, `bookid`) VALUES
(1, 66),
(2, 67);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorid`);

--
-- Ευρετήρια για πίνακα `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `authorid` (`authorid`);

--
-- Ευρετήρια για πίνακα `fantasy`
--
ALTER TABLE `fantasy`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `bookid` (`bookid`);

--
-- Ευρετήρια για πίνακα `horror`
--
ALTER TABLE `horror`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `bookid` (`bookid`);

--
-- Ευρετήρια για πίνακα `romance`
--
ALTER TABLE `romance`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `romance_ibfk_1` (`bookid`);

--
-- Ευρετήρια για πίνακα `sciencefiction`
--
ALTER TABLE `sciencefiction`
  ADD PRIMARY KEY (`tagid`),
  ADD KEY `bookid` (`bookid`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `authors`
--
ALTER TABLE `authors`
  MODIFY `authorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT για πίνακα `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT για πίνακα `fantasy`
--
ALTER TABLE `fantasy`
  MODIFY `tagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT για πίνακα `horror`
--
ALTER TABLE `horror`
  MODIFY `tagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT για πίνακα `romance`
--
ALTER TABLE `romance`
  MODIFY `tagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT για πίνακα `sciencefiction`
--
ALTER TABLE `sciencefiction`
  MODIFY `tagid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `authors` (`authorid`);

--
-- Περιορισμοί για πίνακα `fantasy`
--
ALTER TABLE `fantasy`
  ADD CONSTRAINT `fantasy_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Περιορισμοί για πίνακα `horror`
--
ALTER TABLE `horror`
  ADD CONSTRAINT `horror_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Περιορισμοί για πίνακα `romance`
--
ALTER TABLE `romance`
  ADD CONSTRAINT `romance_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);

--
-- Περιορισμοί για πίνακα `sciencefiction`
--
ALTER TABLE `sciencefiction`
  ADD CONSTRAINT `sciencefiction_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`bookid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
