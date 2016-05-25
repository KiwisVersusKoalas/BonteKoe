-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 25 mei 2016 om 14:37
-- Serverversie: 10.1.10-MariaDB
-- PHP-versie: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bontekoe`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rest_klant`
--

CREATE TABLE `rest_klant` (
  `ID` int(5) NOT NULL COMMENT 'User key/ID',
  `Naam` varchar(255) NOT NULL COMMENT 'Naam of said user',
  `Email` varchar(255) NOT NULL COMMENT 'Email of said user',
  `Datum` int(11) NOT NULL COMMENT 'Date of reservation',
  `Time` int(4) NOT NULL COMMENT 'Time of reservation ',
  `Nummer` int(3) NOT NULL COMMENT 'A Foreign key (RET_TAFEL)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User table';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rest_tafel`
--

CREATE TABLE `rest_tafel` (
  `Tafelnummer` int(3) NOT NULL COMMENT 'Het tafel nummer van een tafel'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `rest_tafel`
--

INSERT INTO `rest_tafel` (`Tafelnummer`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `rest_klant`
--
ALTER TABLE `rest_klant`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Time` (`Time`),
  ADD KEY `ID` (`ID`),
  ADD KEY `ID_2` (`ID`),
  ADD KEY `ID_3` (`ID`),
  ADD KEY `Nummer` (`Nummer`),
  ADD KEY `Nummer_2` (`Nummer`),
  ADD KEY `Time_2` (`Time`);

--
-- Indexen voor tabel `rest_tafel`
--
ALTER TABLE `rest_tafel`
  ADD PRIMARY KEY (`Tafelnummer`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `rest_klant`
--
ALTER TABLE `rest_klant`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT COMMENT 'User key/ID';
--
-- AUTO_INCREMENT voor een tabel `rest_tafel`
--
ALTER TABLE `rest_tafel`
  MODIFY `Tafelnummer` int(3) NOT NULL AUTO_INCREMENT COMMENT 'Het tafel nummer van een tafel', AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
