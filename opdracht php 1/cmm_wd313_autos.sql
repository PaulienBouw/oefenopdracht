-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Gegenereerd op: 10 jul 2018 om 21:35
-- Serverversie: 5.6.34-log
-- PHP-versie: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmm_wd313_autos`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `autos`
--

CREATE TABLE `autos` (
  `id` int(11) UNSIGNED NOT NULL,
  `merk_id` int(11) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `kleur` varchar(100) DEFAULT NULL,
  `brandstof` varchar(100) DEFAULT NULL,
  `zitplaatsen` int(2) DEFAULT NULL,
  `prijs` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `autos`
--

INSERT INTO `autos` (`id`, `merk_id`, `title`, `type`, `kleur`, `brandstof`, `zitplaatsen`, `prijs`) VALUES
(1, 6, 'Eerste versie', 'Model 3', 'zwart', 'electra', 5, 590000),
(2, 2, 'Lekker offroad', 'XC70', 'grijs', 'diesel', 5, 49000),
(3, 2, 'Gezin', 'V70', 'wit', 'Hybrid', 5, 59000),
(4, 3, 'Luxe', '5', 'blauw', 'Hybrid', 5, 79000),
(5, 5, 'First Sight', 'C8 Preliator', 'blauw', 'Hybrid', 2, 129000),
(6, 3, 'Instap model', '1', 'roze', 'Benzine', 4, 15000),
(7, 1, 'Het begin', '600', 'Geel', 'benzine', 4, 5000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `landen`
--

CREATE TABLE `landen` (
  `id` int(11) UNSIGNED NOT NULL,
  `land_id` int(11) UNSIGNED DEFAULT NULL,
  `land` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `landen`
--

INSERT INTO `landen` (`id`, `land_id`, `land`) VALUES
(1, 1, 'Nederland'),
(2, 2, 'Zweden'),
(3, 3, 'Duitsland'),
(4, 4, 'Nederland'),
(5, 5, 'Nederland'),
(6, 6, 'Amerika');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `merken`
--

CREATE TABLE `merken` (
  `id` int(11) UNSIGNED NOT NULL,
  `naam` varchar(255) DEFAULT NULL,
  `land` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `merken`
--

INSERT INTO `merken` (`id`, `naam`, `land`) VALUES
(1, 'Daf', 'Nederland'),
(2, 'Volvo', 'Zweden'),
(3, 'BMW', 'Duitsland'),
(4, 'Burton', 'Nederland'),
(5, 'Spyker', 'Nederland'),
(6, 'Tesla', 'Amerika');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merk_id` (`merk_id`);

--
-- Indexen voor tabel `landen`
--
ALTER TABLE `landen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `merk_id` (`land_id`);

--
-- Indexen voor tabel `merken`
--
ALTER TABLE `merken`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `autos`
--
ALTER TABLE `autos`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT voor een tabel `landen`
--
ALTER TABLE `landen`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `merken`
--
ALTER TABLE `merken`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`merk_id`) REFERENCES `merken` (`id`);

--
-- Beperkingen voor tabel `landen`
--
ALTER TABLE `landen`
  ADD CONSTRAINT `landen_ibfk_1` FOREIGN KEY (`land_id`) REFERENCES `merken` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
