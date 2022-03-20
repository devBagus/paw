-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18 Okt 2019 pada 10.16
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customerdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(64) COLLATE latin1_bin NOT NULL,
  `password` varchar(64) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('Amira', '5de772715ff750859d6efa965201bb4ccd059ed04740dd867d257007269a3f3b'),
('Bagus', 'e2323f6f8ab9d1e81132bc6d0569cbde92eb4dc1acde2d0588248d0126d9eda1'),
('admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `firstname` varchar(45) COLLATE latin1_bin NOT NULL,
  `address` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `balance` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customerID`, `firstname`, `address`, `balance`) VALUES
(1, 'Almira', 'Jl. Mawar No. 123, Surabaya', '4500000'),
(2, 'Ninda', 'Jl. Mawar No. 21, Surabaya', '1200000'),
(5, 'Citra', 'Jl. Cendana No. 17, Surabaya', '0'),
(6, 'Sasri', 'Jl. Anggrek No. 20, Surabaya', '0'),
(8, 'Rini', 'Jl. Telang No. 11, Surabaya', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
