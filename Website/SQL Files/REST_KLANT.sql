-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 23 mei 2016 om 14:32
-- Serverversie: 5.5.46-0ubuntu0.14.04.2
-- PHP-versie: 5.6.14-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `scotchbox`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `REST_KLANT`
--

CREATE TABLE IF NOT EXISTS `REST_KLANT` (
  `ID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'User key/ID',
  `Naam` varchar(255) NOT NULL COMMENT 'Naam of said user',
  `Email` varchar(255) NOT NULL COMMENT 'Email of said user',
  `Datum` date NOT NULL COMMENT 'Date of reservation',
  `Time` int(4) NOT NULL COMMENT 'Time of reservation ',
  `Nummer` int(3) NOT NULL COMMENT 'A Foreign key (RET_TAFEL)',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Time` (`Time`),
  KEY `ID` (`ID`),
  KEY `ID_2` (`ID`),
  KEY `ID_3` (`ID`),
  KEY `Nummer` (`Nummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User table' AUTO_INCREMENT=1 ;

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `REST_KLANT`
--
ALTER TABLE `REST_KLANT`
  ADD CONSTRAINT `REST_KLANT_ibfk_1` FOREIGN KEY (`Nummer`) REFERENCES `REST_TAFEL` (`Tafelnummer`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
