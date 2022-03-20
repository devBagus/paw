-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Nov 2019 pada 10.40
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `all_class`
--

CREATE TABLE `all_class` (
  `id_class` char(3) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_class` varchar(30) DEFAULT NULL,
  `detail_class` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `all_class`
--

INSERT INTO `all_class` (`id_class`, `nip`, `nama_class`, `detail_class`) VALUES
('101', '195709271111', 'Basis Data', 'Masuk pukul 09.00 WIB dengan maksimal keterlambatan 10 menit'),
('102', '195811101111', 'Analisa Perancangan Perangkat ', 'Masuk pukul 10.00 WIB dan tidak ada toleransi keterlambatan'),
('103', '195709271111', 'Pemrograman Desktop', 'Masuk pukul 09.00 WIB dengan maksimal keterlambatan 10 menit'),
('104', '195709271111', 'Penambangan Data', 'Masuk pukul 09.00 WIB dengan maksimal keterlambatan 10 menit'),
('105', '196405111111', 'Komputasi Numerik', 'Ruangan di 203 dengan maksimal keterlambatan 10 menit'),
('106', '196405111111', 'Pengolahan Citra', 'Ruangan di 203 dengan maksimal keterlambatan 10 menit'),
('107', '196307021111', 'Grafika Komputer', 'Maksimal keterlambatan 15 menit'),
('108', '196307021111', 'Statistika', 'Maksimal keterlambatan 15 menit'),
('109', '195811101111', 'Interaksi Manusia dan Komputer', 'Masuk pukul 10.00 WIB dan tidak ada toleransi keterlambatan'),
('110', '195811101111', 'Strategi Algoritma', 'Masuk pukul 10.00 WIB dan tidak ada toleransi keterlambatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id_materi` char(3) NOT NULL,
  `id_class` char(3) NOT NULL,
  `nama_materi` text,
  `detail_materi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id_materi`, `id_class`, `nama_materi`, `detail_materi`) VALUES
('100', '102', 'coba.txt', 'Silahkan dibuka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student`
--

CREATE TABLE `student` (
  `nim` char(12) NOT NULL,
  `nama_student` varchar(30) DEFAULT NULL,
  `alamat_email` varchar(30) DEFAULT NULL,
  `nomer_hp` char(12) DEFAULT NULL,
  `password_student` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `student`
--

INSERT INTO `student` (`nim`, `nama_student`, `alamat_email`, `nomer_hp`, `password_student`) VALUES
('170411100005', 'Yongki Eka Salfitra', 'yongki@gmail.com', '89703401907', 'b48fc05014de8278f937f4445679b4e30127b96f83e4369c2c64c668adbc2898'),
('170411100031', 'Rini Azlinda', 'rini@gmail.com', '83143099400', 'f5c096565eab1d3407cc42d77ef62bcd0583f353c8d234af371bd31055e2a376'),
('170411100034', 'Moh. Irsad', 'irsad@gmail.com', '85678654345', '8b4d4aee748862fbcdf219214b5c20d1460d44eca0c404d9a8f3c197f5b96d81'),
('170411100045', 'Bagus Fajariyanto', 'bagus@gmail.com', '82330227050', '9d91b3fbd52eece8c452599232b0f58fa0b545101ca0e6855ca816d03a71f472'),
('170411100048', 'Fitri Suwandari', 'fitri@gmail.com', '81256786509', '95db16f1919c9c4073644b8670c3d9e24e25d9b9fbd1d469070612aff545cf8b'),
('170411100051', 'Musfirotummamlu\'ah', 'musfirotumm@gmail.com', '81330290475', '19f2f8bb9f912c2809f66b0da45c3dfd006885c6647979f43136fb8713474df2'),
('170411100090', 'Dani Hartanto', 'dani@gmail.com', '81343088400', '04803f46a5fc0884d2fd87d7ba0d82005309342aa128bf1b82aa907504965ba6'),
('170411100118', 'Nurma Ulfa Yuana', 'ayu@gmail.com', '83190876545', '613ddde3dd177fd1c47cc3cd095d72c386d1c7cc7e6a3ceb40437b78401317d7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_class`
--

CREATE TABLE `student_class` (
  `id_class` char(3) NOT NULL,
  `nim` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `student_class`
--

INSERT INTO `student_class` (`id_class`, `nim`) VALUES
('101', '170411100005'),
('101', '170411100031'),
('101', '170411100034'),
('102', '170411100031'),
('102', '170411100051'),
('102', '170411100090'),
('103', '170411100034'),
('103', '170411100045'),
('104', '170411100048'),
('104', '170411100051'),
('105', '170411100045'),
('105', '170411100048'),
('106', '170411100034'),
('106', '170411100051'),
('107', '170411100005'),
('107', '170411100045'),
('107', '170411100090'),
('108', '170411100031'),
('108', '170411100090'),
('108', '170411100118'),
('109', '170411100048'),
('109', '170411100118'),
('110', '170411100005'),
('110', '170411100118');

-- --------------------------------------------------------

--
-- Struktur dari tabel `teacher`
--

CREATE TABLE `teacher` (
  `nip` char(12) NOT NULL,
  `nama_teacher` varchar(40) DEFAULT NULL,
  `password_teacher` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `teacher`
--

INSERT INTO `teacher` (`nip`, `nama_teacher`, `password_teacher`) VALUES
('195709271111', 'MULA\'AB, S.Si., M.Kom', '5e09ffde75b9a00d634893cbdbcf27b001b56a57842d975b9b7abf16067001bd'),
('195811101111', 'DONI ABDUL FATAH, S.KOM M.KOM', '852bb1ba88972f3536e5f6f5e12fdf0cd0513168ff62b3df8355483af8d01555'),
('196307021111', 'ACH. KHOZAIMI, S.Kom., M.Kom', '3726e225469984d388c76e58308f57bd59aa8337fe111a5e175e83949dc9c749'),
('196405111111', 'ROSIDA VIVIN NAHARI, S.Kom,.MT', '437efda831755d87ad1cb15947eae71b12fdfe7a804afb5b403f12d3f9bc2e3a');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `all_class`
--
ALTER TABLE `all_class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `FK_MEMILIKI` (`nip`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `FK_MENGUPLOUD` (`id_class`);

--
-- Indeks untuk tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id_class`,`nim`),
  ADD KEY `FK_STUDENT_CLASS` (`nim`),
  ADD KEY `FK_STUDENT_CLASS2` (`id_class`);

--
-- Indeks untuk tabel `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`nip`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `all_class`
--
ALTER TABLE `all_class`
  ADD CONSTRAINT `FK_MEMILIKI` FOREIGN KEY (`nip`) REFERENCES `teacher` (`nip`);

--
-- Ketidakleluasaan untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `FK_MENGUPLOUD` FOREIGN KEY (`id_class`) REFERENCES `all_class` (`id_class`);

--
-- Ketidakleluasaan untuk tabel `student_class`
--
ALTER TABLE `student_class`
  ADD CONSTRAINT `FK_STUDENT_CLASS` FOREIGN KEY (`nim`) REFERENCES `student` (`nim`),
  ADD CONSTRAINT `FK_STUDENT_CLASS2` FOREIGN KEY (`id_class`) REFERENCES `all_class` (`id_class`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
