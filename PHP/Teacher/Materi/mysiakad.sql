-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18 Okt 2019 pada 10.15
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysiakad`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `filter` ()  BEGIN
	SELECT programstudi.KodeProg, programstudi.NamaProg
    FROM programstudi
    WHERE programstudi.NamaProg LIKE '%Teknik%';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mhs` (IN `nama` CHAR(10))  BEGIN
	SELECT programstudi.KodeProg, programstudi.NamaProg, COUNT(mahasiswa.NimMhs)
    FROM programstudi, mahasiswa
    WHERE mahasiswa.KodeProgramStudiMhs = (
    	SELECT programstudi.KodeProg
        WHERE programstudi.NamaProg LIKE nama
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prog` ()  BEGIN
	SELECT programstudi.KodeProg, programstudi.NamaProg
    FROM programstudi;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `teknik` (IN `nama` CHAR(10))  BEGIN
	SELECT programstudi.KodeProg, programstudi.NamaProg
    FROM programstudi
    WHERE programstudi.NamaProg LIKE nama;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `KodeAgama` char(1) NOT NULL,
  `NamaAgama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Agama';

--
-- Dumping data untuk tabel `agama`
--

INSERT INTO `agama` (`KodeAgama`, `NamaAgama`) VALUES
('1', 'Islam'),
('2', 'Kristen Protestan'),
('3', 'Katolik'),
('4', 'Hindhu'),
('6', 'Kongfutsu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `NipDosen` char(18) NOT NULL,
  `NamaDosen` varchar(40) NOT NULL,
  `AlamatDosen` varchar(40) NOT NULL,
  `KodeKelDosen` char(9) NOT NULL,
  `KodeTempatLahirDosen` char(5) NOT NULL,
  `TanggalLahirDosen` date NOT NULL,
  `KodeProgramStudiDosen` char(4) NOT NULL,
  `TahunMasukDosen` char(4) NOT NULL,
  `AgamaDosen` char(1) NOT NULL,
  `JeniskelDosen` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Dosen';

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`NipDosen`, `NamaDosen`, `AlamatDosen`, `KodeKelDosen`, `KodeTempatLahirDosen`, `TanggalLahirDosen`, `KodeProgramStudiDosen`, `TahunMasukDosen`, `AgamaDosen`, `JeniskelDosen`) VALUES
('197101052006021023', 'Dr. Bambang, S.T., M.Kom ', 'Jl A yani 746 ', '351510104', '35031', '1980-01-05', '0101', '2007', '1', '1'),
('197101092006021012', 'Muhammad Kautsar Sophan, S.T., M.T.', 'Jl Magersari 33 ', '351510104', '35031', '1971-01-08', '0101', '2007', '1', '1'),
('197201042006021011', 'Dr. Iwan K, S.T., M.T.', 'Jl Letjen S 76 ', '351510104', '35031', '1972-01-04', '0101', '2007', '1', '1'),
('197301062006041043', 'Dr. Haris N, S.T., M.Kom ', 'Jl Sudirman A 176 ', '351510104', '35031', '1973-01-06', '0101', '2007', '1', '1'),
('197406102008121002', 'Dr. Arif Muntasa, S.SI., M.T.', 'GTCK Jl Dahlia E 24', '351510101', '35015', '1969-11-18', '0101', '2002', '1', '1'),
('197606102008121011', 'Fransescus Caverius A', 'Jl Kemangi 45 RT 5 Rw 2', '351510102', '35054', '1976-06-01', '0201', '2008', '2', '1'),
('198101092006041003', 'Achmad Jauhari, S.T., M.Kom ', 'Jl Letjen S 76 ', '351510104', '35031', '1980-10-25', '0101', '2007', '1', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `KodeFak` char(2) NOT NULL,
  `NamaFak` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Fakultas';

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`KodeFak`, `NamaFak`) VALUES
('01', 'Fakultas Pertanian'),
('02', 'Fakultas Hukum'),
('03', 'Fakultas Ekonomi'),
('04', 'Fakultas Teknik'),
('05', 'Fakultas Ilmu-Ilmu Keislaman'),
('06', 'Fakultas Ilmu Sosial dan Budaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jeniskelamin`
--

CREATE TABLE `jeniskelamin` (
  `KodeJenisKelamin` char(1) NOT NULL,
  `NamaJenisKelamin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Jenis Kelamin';

--
-- Dumping data untuk tabel `jeniskelamin`
--

INSERT INTO `jeniskelamin` (`KodeJenisKelamin`, `NamaJenisKelamin`) VALUES
('1', 'Laki-Laki'),
('2', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kabupaten`
--

CREATE TABLE `kabupaten` (
  `KodeProp` char(2) NOT NULL,
  `KodeKab` char(5) NOT NULL,
  `NamaKab` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Berisi Data Kabupaten';

--
-- Dumping data untuk tabel `kabupaten`
--

INSERT INTO `kabupaten` (`KodeProp`, `KodeKab`, `NamaKab`) VALUES
('35', '35015', 'Kab. Pacitan'),
('35', '35023', 'Kab. Ponorogo'),
('35', '35031', 'Kab. Trenggalek'),
('35', '35046', 'Kab. Tulungagung'),
('35', '35054', 'Kab. Blitar'),
('35', '35062', 'Kab. Kediri'),
('35', '35077', 'Kab. Malang'),
('35', '35085', 'Kab. Lumajang'),
('35', '35151', 'Kab. Sidoarjo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `KodeKab` char(5) NOT NULL,
  `KodeKec` char(7) NOT NULL,
  `NamaKec` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Kecamatan';

--
-- Dumping data untuk tabel `kecamatan`
--

INSERT INTO `kecamatan` (`KodeKab`, `KodeKec`, `NamaKec`) VALUES
('35151', '3515101', 'Kec. Taman'),
('35151', '3515102', 'Kec. Buduran'),
('35151', '3515103', 'Kec. Waru'),
('35151', '3515104', 'Kec. Gedangan'),
('35151', '3515105', 'Kec. Krian'),
('35151', '3515106', 'Kec. Tarik'),
('35151', '3515107', 'Kec. Wonoayu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelurahan`
--

CREATE TABLE `kelurahan` (
  `KodeKec` char(7) NOT NULL,
  `KodeKel` char(9) NOT NULL,
  `NamaKel` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Kelurahan';

--
-- Dumping data untuk tabel `kelurahan`
--

INSERT INTO `kelurahan` (`KodeKec`, `KodeKel`, `NamaKel`) VALUES
('3515101', '351510101', 'Desa Bohar'),
('3515101', '351510102', 'Desa Wage'),
('3515101', '351510103', 'Desa Bungurasih'),
('3515101', '351510104', 'Desa Krembangan'),
('3515101', '351510105', 'Desa Bebekan'),
('3515101', '351510106', 'Desa Kedungturi'),
('3515101', '351510107', 'Desa Kletek');

-- --------------------------------------------------------

--
-- Struktur dari tabel `khs`
--

CREATE TABLE `khs` (
  `KodeMk` char(6) NOT NULL,
  `NimMhs` char(12) NOT NULL,
  `NipDosen` char(18) NOT NULL,
  `TahunAjaran` char(8) NOT NULL,
  `KodeSemester` char(1) NOT NULL DEFAULT '',
  `NilaiTugas` float DEFAULT '0',
  `NilaiUts` float DEFAULT '0',
  `NilaiUas` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Kartu Hasil Studi';

--
-- Dumping data untuk tabel `khs`
--

INSERT INTO `khs` (`KodeMk`, `NimMhs`, `NipDosen`, `TahunAjaran`, `KodeSemester`, `NilaiTugas`, `NilaiUts`, `NilaiUas`) VALUES
('1IF001', '130411100001', '197406102008121002', '20152016', '1', 34.3714, 56.3598, 78.685),
('1IF001', '130411100002', '197406102008121002', '20152016', '1', 74.3457, 35.6733, 55.3296),
('1IF001', '130411100003', '197406102008121002', '20152016', '1', 69.6279, 82.1506, 51.8696),
('1IF001', '130411100004', '197406102008121002', '20152016', '1', 62.896, 58.8712, 55.6679),
('1IF001', '130411100005', '197406102008121002', '20152016', '1', 51.7259, 91.6257, 52.9509),
('1IF001', '130411100006', '197406102008121002', '20152016', '1', 89.8773, 90.534, 83.0382),
('1IF001', '130411100007', '197406102008121002', '20152016', '1', 43.5888, 68.8293, 63.3803),
('1IF001', '130411100008', '197406102008121002', '20152016', '1', 60.4133, 61.926, 78.3898),
('1IF001', '130411100009', '197406102008121002', '20152016', '1', 56.171, 95.6856, 59.9152),
('1IF001', '130411100010', '197406102008121002', '20152016', '1', 62.5191, 82.8501, 76.6931),
('1IF001', '130411100011', '197406102008121002', '20152016', '1', 84.9153, 44.4973, 67.7406),
('1IF001', '130411100012', '197406102008121002', '20152016', '1', 55.211, 72.8331, 98.5327),
('1IF001', '130411100013', '197406102008121002', '20152016', '1', 74.1642, 75.2227, 53.621),
('1IF001', '130411100014', '197406102008121002', '20152016', '1', 92.4367, 51.3208, 79.2938),
('1IF001', '130411100015', '197406102008121002', '20152016', '1', 42.5067, 74.652, 95.7399),
('1IF001', '130411100016', '197406102008121002', '20152016', '1', 54.7435, 36.4977, 68.2579),
('1IF001', '130411100017', '197406102008121002', '20152016', '1', 31.7965, 54.209, 75.6554),
('1IF001', '130411100018', '197406102008121002', '20152016', '1', 65.65, 51.284, 59.4697),
('1IF001', '130411100019', '197406102008121002', '20152016', '1', 93.4966, 39.074, 64.88),
('1IF001', '130411100020', '197406102008121002', '20152016', '1', 57.1781, 41.2505, 34.7183),
('1IF001', '140411100008', '197406102008121002', '20152016', '1', 49.8401, 45.0455, 75.707),
('1IF001', '140411100010', '197406102008121002', '20152016', '1', 43.3988, 89.8727, 69.1674),
('1IF002', '130411100001', '197406102008121002', '20152016', '1', 76.2187, 73.5914, 89.3008),
('1IF002', '130411100002', '197406102008121002', '20152016', '1', 75.7299, 60.747, 76.5452),
('1IF002', '130411100003', '197406102008121002', '20152016', '1', 50.4853, 72.7906, 62.4974),
('1IF002', '130411100004', '197406102008121002', '20152016', '1', 44.1151, 83.0833, 83.0713),
('1IF002', '130411100005', '197406102008121002', '20152016', '1', 66.1063, 81.3179, 58.2706),
('1IF002', '130411100006', '197406102008121002', '20152016', '1', 97.3992, 62.184, 68.7226),
('1IF002', '130411100007', '197406102008121002', '20152016', '1', 57.061, 79.1374, 74.5038),
('1IF002', '130411100008', '197406102008121002', '20152016', '1', 35.107, 52.0233, 54.7958),
('1IF002', '130411100009', '197406102008121002', '20152016', '1', 67.9089, 75.1572, 72.0593),
('1IF002', '130411100010', '197406102008121002', '20152016', '1', 84.8249, 57.9464, 85.2575),
('1IF002', '130411100011', '197406102008121002', '20152016', '1', 52.4481, 56.4679, 74.9955),
('1IF002', '130411100012', '197406102008121002', '20152016', '1', 55.5737, 52.8821, 97.6895),
('1IF002', '130411100013', '197406102008121002', '20152016', '1', 79.8009, 55.9361, 90.2776),
('1IF002', '130411100014', '197406102008121002', '20152016', '1', 33.5799, 97.0667, 84.5936),
('1IF002', '130411100015', '197406102008121002', '20152016', '1', 31.768, 55.0592, 79.9922),
('1IF002', '130411100016', '197406102008121002', '20152016', '1', 34.7835, 83.9406, 65.3526),
('1IF002', '130411100017', '197406102008121002', '20152016', '1', 74.9413, 78.6486, 68.4189),
('1IF002', '130411100018', '197406102008121002', '20152016', '1', 56.149, 75.4882, 58.994),
('1IF002', '130411100019', '197406102008121002', '20152016', '1', 68.5053, 65.5444, 72.2063),
('1IF002', '130411100020', '197406102008121002', '20152016', '1', 64.3984, 55.3731, 83.6702),
('1IF002', '140411100008', '197406102008121002', '20152016', '1', 52.2317, 60.1478, 94.0439),
('1IF002', '140411100010', '197406102008121002', '20152016', '1', 39.7762, 66.7492, 64.4176),
('1IF003', '130411100001', '197406102008121002', '20152016', '1', 71.8404, 65.9492, 64.225),
('1IF003', '130411100002', '197406102008121002', '20152016', '1', 73.2771, 73.7107, 98.7222),
('1IF003', '130411100003', '197406102008121002', '20152016', '1', 72.4788, 66.2276, 63.7016),
('1IF003', '130411100004', '197406102008121002', '20152016', '1', 69.8253, 58.0216, 30.6319),
('1IF003', '130411100005', '197406102008121002', '20152016', '1', 79.0948, 53.5784, 80.6077),
('1IF003', '130411100006', '197406102008121002', '20152016', '1', 92.3033, 69.6935, 71.5576),
('1IF003', '130411100007', '197406102008121002', '20152016', '1', 48.7073, 78.8637, 48.1966),
('1IF003', '130411100008', '197406102008121002', '20152016', '1', 54.392, 77.37, 73.6741),
('1IF003', '130411100009', '197406102008121002', '20152016', '1', 36.2604, 60.28, 92.6186),
('1IF003', '130411100010', '197406102008121002', '20152016', '1', 82.253, 33.4091, 70.2864),
('1IF003', '130411100011', '197406102008121002', '20152016', '1', 51.2048, 45.165, 72.2103),
('1IF003', '130411100012', '197406102008121002', '20152016', '1', 75.5566, 61.1522, 79.091),
('1IF003', '130411100013', '197406102008121002', '20152016', '1', 61.9987, 72.7202, 77.6052),
('1IF003', '130411100014', '197406102008121002', '20152016', '1', 69.8652, 66.5103, 72.9558),
('1IF003', '130411100015', '197406102008121002', '20152016', '1', 65.2483, 57.3739, 91.1246),
('1IF003', '130411100016', '197406102008121002', '20152016', '1', 83.5015, 44.1337, 70.1641),
('1IF003', '130411100017', '197406102008121002', '20152016', '1', 68.4195, 81.6051, 52.7668),
('1IF003', '130411100018', '197406102008121002', '20152016', '1', 69.0188, 36.7937, 76.9122),
('1IF003', '130411100019', '197406102008121002', '20152016', '1', 74.1798, 40.1623, 78.2721),
('1IF003', '130411100020', '197406102008121002', '20152016', '1', 70.8737, 69.552, 35.1391),
('1IF003', '140411100008', '197406102008121002', '20152016', '1', 67.0393, 79.7793, 47.7786),
('1IF003', '140411100010', '197406102008121002', '20152016', '1', 99.5551, 54.4398, 73.5335),
('1IF004', '130411100001', '197606102008121011', '20152016', '1', 54.3482, 51.1404, 92.6573),
('1IF004', '130411100002', '197606102008121011', '20152016', '1', 59.8655, 71.3554, 77.1806),
('1IF004', '130411100003', '197606102008121011', '20152016', '1', 71.837, 77.6432, 72.7048),
('1IF004', '130411100004', '197606102008121011', '20152016', '1', 30.5947, 34.8589, 82.5106),
('1IF004', '130411100005', '197606102008121011', '20152016', '1', 57.9761, 92.3486, 37.8149),
('1IF004', '130411100006', '197606102008121011', '20152016', '1', 62.0286, 46.6983, 97.4058),
('1IF004', '130411100007', '197606102008121011', '20152016', '1', 46.9339, 42.4522, 71.4594),
('1IF004', '130411100008', '197606102008121011', '20152016', '1', 79.9404, 35.3236, 86.7971),
('1IF004', '130411100009', '197606102008121011', '20152016', '1', 78.0144, 79.6809, 64.3613),
('1IF004', '130411100010', '197606102008121011', '20152016', '1', 32.7636, 70.7342, 55.38),
('1IF004', '130411100011', '197606102008121011', '20152016', '1', 64.6977, 57.3483, 42.6484),
('1IF004', '130411100012', '197606102008121011', '20152016', '1', 91.1971, 78.0402, 66.6098),
('1IF004', '130411100013', '197606102008121011', '20152016', '1', 48.9286, 44.8133, 77.2808),
('1IF004', '130411100014', '197606102008121011', '20152016', '1', 51.9642, 77.9785, 84.0001),
('1IF004', '130411100015', '197606102008121011', '20152016', '1', 36.0649, 78.3241, 33.4257),
('1IF004', '130411100016', '197606102008121011', '20152016', '1', 82.1562, 60.5042, 56.052),
('1IF004', '130411100017', '197606102008121011', '20152016', '1', 98.7477, 75.5826, 81.6697),
('1IF004', '130411100018', '197606102008121011', '20152016', '1', 81.6009, 62.9954, 70.1742),
('1IF004', '130411100019', '197606102008121011', '20152016', '1', 61.885, 98.9025, 58.8572),
('1IF004', '130411100020', '197606102008121011', '20152016', '1', 47.5784, 61.3206, 63.868),
('1IF004', '140411100008', '197606102008121011', '20152016', '1', 35.3778, 35.2853, 70.2932),
('1IF004', '140411100010', '197606102008121011', '20152016', '1', 45.6098, 67.1697, 49.0191),
('1IF005', '130411100001', '197606102008121011', '20152016', '1', 93.5863, 70.8742, 73.6123),
('1IF005', '130411100002', '197606102008121011', '20152016', '1', 55.4387, 56.3567, 65.4675),
('1IF005', '130411100003', '197606102008121011', '20152016', '1', 58.2673, 44.9338, 99.8673),
('1IF005', '130411100004', '197606102008121011', '20152016', '1', 64.5351, 73.0737, 71.7633),
('1IF005', '130411100005', '197606102008121011', '20152016', '1', 39.5952, 32.6861, 44.645),
('1IF005', '130411100006', '197606102008121011', '20152016', '1', 75.1665, 91.8977, 83.9891),
('1IF005', '130411100007', '197606102008121011', '20152016', '1', 44.2524, 69.2946, 63.7157),
('1IF005', '130411100008', '197606102008121011', '20152016', '1', 60.6947, 62.3266, 79.5487),
('1IF005', '130411100009', '197606102008121011', '20152016', '1', 60.7637, 65.1724, 93.5708),
('1IF005', '130411100010', '197606102008121011', '20152016', '1', 72.3369, 30.9721, 87.8499),
('1IF005', '130411100011', '197606102008121011', '20152016', '1', 46.333, 68.1155, 51.5782),
('1IF005', '130411100012', '197606102008121011', '20152016', '1', 53.5448, 62.9894, 54.3126),
('1IF005', '130411100013', '197606102008121011', '20152016', '1', 32.5946, 50.0352, 52.3923),
('1IF005', '130411100014', '197606102008121011', '20152016', '1', 61.8557, 52.1019, 74.9424),
('1IF005', '130411100015', '197606102008121011', '20152016', '1', 68.4063, 67.2042, 30.8021),
('1IF005', '130411100016', '197606102008121011', '20152016', '1', 52.3978, 69.5826, 90.7197),
('1IF005', '130411100017', '197606102008121011', '20152016', '1', 44.8507, 52.0943, 75.9196),
('1IF005', '130411100018', '197606102008121011', '20152016', '1', 73.315, 88.8164, 74.1369),
('1IF005', '130411100019', '197606102008121011', '20152016', '1', 54.2351, 98.765, 31.1196),
('1IF005', '130411100020', '197606102008121011', '20152016', '1', 59.3033, 53.1573, 37.8769),
('1IF005', '140411100008', '197606102008121011', '20152016', '1', 79.9123, 85.9311, 89.9187),
('1IF005', '140411100010', '197606102008121011', '20152016', '1', 91.7999, 89.2433, 70.8172);

-- --------------------------------------------------------

--
-- Struktur dari tabel `krs`
--

CREATE TABLE `krs` (
  `KodeMk` char(6) NOT NULL,
  `NimMhs` char(12) NOT NULL,
  `NipDosen` char(18) NOT NULL,
  `TahunAjaran` varchar(8) NOT NULL,
  `KodeSemester` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Kartu Rencana Studi';

--
-- Dumping data untuk tabel `krs`
--

INSERT INTO `krs` (`KodeMk`, `NimMhs`, `NipDosen`, `TahunAjaran`, `KodeSemester`) VALUES
('1IF001', '130411100001', '197406102008121002', '20152016', '1'),
('1IF001', '130411100002', '197406102008121002', '20152016', '1'),
('1IF001', '130411100003', '197406102008121002', '20152016', '1'),
('1IF001', '130411100004', '197406102008121002', '20152016', '1'),
('1IF001', '130411100005', '197406102008121002', '20152016', '1'),
('1IF001', '130411100006', '197406102008121002', '20152016', '1'),
('1IF001', '130411100007', '197406102008121002', '20152016', '1'),
('1IF001', '130411100008', '197406102008121002', '20152016', '1'),
('1IF001', '130411100009', '197406102008121002', '20152016', '1'),
('1IF001', '130411100010', '197406102008121002', '20152016', '1'),
('1IF001', '130411100011', '197406102008121002', '20152016', '1'),
('1IF001', '130411100012', '197406102008121002', '20152016', '1'),
('1IF001', '130411100013', '197406102008121002', '20152016', '1'),
('1IF001', '130411100014', '197406102008121002', '20152016', '1'),
('1IF001', '130411100015', '197406102008121002', '20152016', '1'),
('1IF001', '130411100016', '197406102008121002', '20152016', '1'),
('1IF001', '130411100017', '197406102008121002', '20152016', '1'),
('1IF001', '130411100018', '197406102008121002', '20152016', '1'),
('1IF001', '130411100019', '197406102008121002', '20152016', '1'),
('1IF001', '130411100020', '197406102008121002', '20152016', '1'),
('1IF001', '140411100008', '197406102008121002', '20152016', '1'),
('1IF001', '140411100010', '197406102008121002', '20152016', '1'),
('1IF002', '130411100001', '197406102008121002', '20152016', '1'),
('1IF002', '130411100002', '197406102008121002', '20152016', '1'),
('1IF002', '130411100003', '197406102008121002', '20152016', '1'),
('1IF002', '130411100004', '197406102008121002', '20152016', '1'),
('1IF002', '130411100005', '197406102008121002', '20152016', '1'),
('1IF002', '130411100006', '197406102008121002', '20152016', '1'),
('1IF002', '130411100007', '197406102008121002', '20152016', '1'),
('1IF002', '130411100008', '197406102008121002', '20152016', '1'),
('1IF002', '130411100009', '197406102008121002', '20152016', '1'),
('1IF002', '130411100010', '197406102008121002', '20152016', '1'),
('1IF002', '130411100011', '197406102008121002', '20152016', '1'),
('1IF002', '130411100012', '197406102008121002', '20152016', '1'),
('1IF002', '130411100013', '197406102008121002', '20152016', '1'),
('1IF002', '130411100014', '197406102008121002', '20152016', '1'),
('1IF002', '130411100015', '197406102008121002', '20152016', '1'),
('1IF002', '130411100016', '197406102008121002', '20152016', '1'),
('1IF002', '130411100017', '197406102008121002', '20152016', '1'),
('1IF002', '130411100018', '197406102008121002', '20152016', '1'),
('1IF002', '130411100019', '197406102008121002', '20152016', '1'),
('1IF002', '130411100020', '197406102008121002', '20152016', '1'),
('1IF002', '140411100008', '197406102008121002', '20152016', '1'),
('1IF002', '140411100010', '197406102008121002', '20152016', '1'),
('1IF003', '130411100001', '197406102008121002', '20152016', '1'),
('1IF003', '130411100002', '197406102008121002', '20152016', '1'),
('1IF003', '130411100003', '197406102008121002', '20152016', '1'),
('1IF003', '130411100004', '197406102008121002', '20152016', '1'),
('1IF003', '130411100005', '197406102008121002', '20152016', '1'),
('1IF003', '130411100006', '197406102008121002', '20152016', '1'),
('1IF003', '130411100007', '197406102008121002', '20152016', '1'),
('1IF003', '130411100008', '197406102008121002', '20152016', '1'),
('1IF003', '130411100009', '197406102008121002', '20152016', '1'),
('1IF003', '130411100010', '197406102008121002', '20152016', '1'),
('1IF003', '130411100011', '197406102008121002', '20152016', '1'),
('1IF003', '130411100012', '197406102008121002', '20152016', '1'),
('1IF003', '130411100013', '197406102008121002', '20152016', '1'),
('1IF003', '130411100014', '197406102008121002', '20152016', '1'),
('1IF003', '130411100015', '197406102008121002', '20152016', '1'),
('1IF003', '130411100016', '197406102008121002', '20152016', '1'),
('1IF003', '130411100017', '197406102008121002', '20152016', '1'),
('1IF003', '130411100018', '197406102008121002', '20152016', '1'),
('1IF003', '130411100019', '197406102008121002', '20152016', '1'),
('1IF003', '130411100020', '197406102008121002', '20152016', '1'),
('1IF003', '140411100008', '197406102008121002', '20152016', '1'),
('1IF003', '140411100010', '197406102008121002', '20152016', '1'),
('1IF004', '130411100001', '197606102008121011', '20152016', '1'),
('1IF004', '130411100002', '197606102008121011', '20152016', '1'),
('1IF004', '130411100003', '197606102008121011', '20152016', '1'),
('1IF004', '130411100004', '197606102008121011', '20152016', '1'),
('1IF004', '130411100005', '197606102008121011', '20152016', '1'),
('1IF004', '130411100006', '197606102008121011', '20152016', '1'),
('1IF004', '130411100007', '197606102008121011', '20152016', '1'),
('1IF004', '130411100008', '197606102008121011', '20152016', '1'),
('1IF004', '130411100009', '197606102008121011', '20152016', '1'),
('1IF004', '130411100010', '197606102008121011', '20152016', '1'),
('1IF004', '130411100011', '197606102008121011', '20152016', '1'),
('1IF004', '130411100012', '197606102008121011', '20152016', '1'),
('1IF004', '130411100013', '197606102008121011', '20152016', '1'),
('1IF004', '130411100014', '197606102008121011', '20152016', '1'),
('1IF004', '130411100015', '197606102008121011', '20152016', '1'),
('1IF004', '130411100016', '197606102008121011', '20152016', '1'),
('1IF004', '130411100017', '197606102008121011', '20152016', '1'),
('1IF004', '130411100018', '197606102008121011', '20152016', '1'),
('1IF004', '130411100019', '197606102008121011', '20152016', '1'),
('1IF004', '130411100020', '197606102008121011', '20152016', '1'),
('1IF004', '140411100008', '197606102008121011', '20152016', '1'),
('1IF004', '140411100010', '197606102008121011', '20152016', '1'),
('1IF005', '130411100001', '197606102008121011', '20152016', '1'),
('1IF005', '130411100002', '197606102008121011', '20152016', '1'),
('1IF005', '130411100003', '197606102008121011', '20152016', '1'),
('1IF005', '130411100004', '197606102008121011', '20152016', '1'),
('1IF005', '130411100005', '197606102008121011', '20152016', '1'),
('1IF005', '130411100006', '197606102008121011', '20152016', '1'),
('1IF005', '130411100007', '197606102008121011', '20152016', '1'),
('1IF005', '130411100008', '197606102008121011', '20152016', '1'),
('1IF005', '130411100009', '197606102008121011', '20152016', '1'),
('1IF005', '130411100010', '197606102008121011', '20152016', '1'),
('1IF005', '130411100011', '197606102008121011', '20152016', '1'),
('1IF005', '130411100012', '197606102008121011', '20152016', '1'),
('1IF005', '130411100013', '197606102008121011', '20152016', '1'),
('1IF005', '130411100014', '197606102008121011', '20152016', '1'),
('1IF005', '130411100015', '197606102008121011', '20152016', '1'),
('1IF005', '130411100016', '197606102008121011', '20152016', '1'),
('1IF005', '130411100017', '197606102008121011', '20152016', '1'),
('1IF005', '130411100018', '197606102008121011', '20152016', '1'),
('1IF005', '130411100019', '197606102008121011', '20152016', '1'),
('1IF005', '130411100020', '197606102008121011', '20152016', '1'),
('1IF005', '140411100008', '197606102008121011', '20152016', '1'),
('1IF005', '140411100010', '197606102008121011', '20152016', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NimMhs` char(12) NOT NULL,
  `NamaMhs` varchar(40) NOT NULL,
  `AlamatMhs` varchar(50) NOT NULL,
  `KodeKelMhs` char(9) NOT NULL,
  `KodeTempatLahirMhs` char(5) NOT NULL,
  `TanggalLahirMhs` date NOT NULL,
  `KodeProgramStudiMhs` char(4) NOT NULL,
  `TahunMasukMhs` char(4) NOT NULL,
  `AgamaMhs` char(1) NOT NULL,
  `JenisKelMhs` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Mahasiswa';

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`NimMhs`, `NamaMhs`, `AlamatMhs`, `KodeKelMhs`, `KodeTempatLahirMhs`, `TanggalLahirMhs`, `KodeProgramStudiMhs`, `TahunMasukMhs`, `AgamaMhs`, `JenisKelMhs`) VALUES
('130411100001', 'MUHAMMAD Arif', 'Jalan Blimbing 78 RT 6 Rw 1', '351510101', '35015', '2000-01-02', '0102', '2014', '2', '1'),
('130411100002', 'Teguh Budi', 'Jalan Nangka 8 RT 6 Rw 1', '351510102', '35023', '2001-04-02', '0102', '2014', '2', '1'),
('130411100003', 'Kunta Cucuk', 'Jalan Melati 7 RT 6 Rw 2', '351510103', '35031', '2001-04-06', '0102', '2014', '2', '1'),
('130411100004', 'Rahman Dedi', 'Jalan Blimbing 178 RT 6 Rw 2', '351510104', '35015', '2000-02-02', '0102', '2014', '2', '1'),
('130411100005', 'AhmadEndar', 'Jalan Mawar 728 RT 6 Rw 1', '351510105', '35046', '2000-01-01', '0102', '2014', '2', '1'),
('130411100006', 'Ahmad Fandi', 'Jalan Apel 781 RT 6 Rw 3', '351510105', '35046', '2001-01-05', '0102', '2014', '2', '1'),
('130411100007', 'Mahatma Gandi', 'Jalan Yani 782 RT 6 Rw 1', '351510105', '35015', '2000-05-02', '0102', '2014', '2', '1'),
('130411100008', 'M Hilman', 'Jalan Sudirman 708 RT 6 Rw 5', '351510106', '35023', '2000-07-02', '0102', '2014', '2', '1'),
('130411100009', 'Akbar Ijra', 'Jalan Hati 33 RT 6 Rw 1', '351510103', '35023', '2000-01-07', '0102', '2014', '2', '1'),
('130411100010', 'Salku Kalman', 'Jalan Kunci 45 RT 6 Rw 6', '351510102', '35015', '2001-03-03', '0102', '2014', '2', '1'),
('130411100011', 'Nurul Aini', 'Jalan Dahlia 23 RT 6 Rw 1', '351510105', '35023', '2001-03-07', '0102', '2014', '2', '2'),
('130411100012', 'Mualah Manaf', 'Jalan Anggrek 28 RT 6 Rw 1', '351510105', '35015', '2000-08-04', '0102', '2014', '2', '1'),
('130411100013', 'Kunaifi Nanang', 'Jalan Kelapa 348 RT 6 Rw 31', '351510105', '35023', '2000-09-02', '0102', '2014', '2', '1'),
('130411100014', 'A Oman', 'Jalan Bima 778 RT 6 Rw 11', '351510102', '35015', '2000-08-05', '0102', '2014', '2', '1'),
('130411100015', 'Lukman Pakih', 'Jalan Sakti 178 RT 3 Rw 1', '351510104', '35046', '2000-03-02', '0102', '2014', '2', '1'),
('130411100016', 'Abduk Qurais', 'Jalan Blimbing 76 RT 1 Rw 21', '351510104', '35046', '2000-02-04', '0102', '2014', '2', '1'),
('130411100017', 'Rita S', 'Jalan Hakim 73 RT 2 Rw 13', '351510104', '35023', '2001-11-03', '0102', '2014', '2', '2'),
('130411100018', 'R Salman', 'Jalan Kertajaya 78 RT 17 Rw 4', '351510103', '35046', '2000-11-02', '0102', '2014', '2', '1'),
('130411100019', 'Tutik A', 'Jalan Kunta 68 RT 10 Rw 9', '351510102', '35023', '2000-01-12', '0102', '2014', '2', '2'),
('130411100020', 'Putu Unang', 'Jalan Blimbing 70 RT 13 Rw 5', '351510102', '35023', '2000-10-12', '0102', '2014', '2', '1'),
('140411100008', 'ARIEF WICAKSONO', 'Jalan Jambu No 11, RT 5 RT 1', '351510102', '35015', '1995-09-30', '0401', '2014', '1', '1'),
('140411100010', 'SUSI SUSANTI', 'Jl Mawar 67 RT 12 RW 2', '351510102', '35015', '1994-01-23', '0401', '2014', '1', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `KodeMk` char(6) NOT NULL,
  `NamaMk` varchar(50) NOT NULL,
  `SksMk` smallint(1) NOT NULL,
  `StatusMk` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Matakuliah';

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`KodeMk`, `NamaMk`, `SksMk`, `StatusMk`) VALUES
('1IF001', 'Komputasi Aljabar Linier', 3, '1'),
('1IF002', 'Komputasi Numerik', 3, '1'),
('1IF003', 'Organisasi Komputer', 3, '1'),
('1IF004', 'Algoritma Pemrograman', 3, '1'),
('1IF005', 'Struktur Data', 3, '1'),
('2IF001', 'Sistem Informasi Manajemen', 3, '2'),
('2IF002', 'Pengolah Citra Digital', 3, '2'),
('2IF003', 'Sistem Basisdata', 3, '2'),
('2IF004', 'Pemrograman Game', 3, '2'),
('2IF005', 'Komputational Intelligence', 3, '2'),
('2IF006', 'Multimedia', 3, '2'),
('3IF001', 'Metodologi Penelitian', 3, '3'),
('3IF002', 'Bahasa Inggris', 3, '3'),
('4IF001', 'Mobile Programming', 3, '4'),
('4IF002', 'Biomedical Imaging', 3, '4'),
('4IF003', 'Audit Perangkat Lunak', 3, '4'),
('4IF004', 'Kompresi Citra', 3, '4');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mengajar`
--

CREATE TABLE `mengajar` (
  `Nip` char(18) NOT NULL,
  `KodeMk` char(6) NOT NULL,
  `TahunAjaran` char(8) NOT NULL,
  `Semester` char(1) NOT NULL,
  `ProsTugas` float DEFAULT '0.2',
  `ProsUts` float DEFAULT '0.3',
  `ProsUas` float DEFAULT '0.5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mengajar`
--

INSERT INTO `mengajar` (`Nip`, `KodeMk`, `TahunAjaran`, `Semester`, `ProsTugas`, `ProsUts`, `ProsUas`) VALUES
('197406102008121002', '1IF001', '20152016', '1', 0.3, 0.2, 0.5),
('197406102008121002', '1IF002', '20152016', '1', 0.2, 0.3, 0.5),
('197406102008121002', '1IF003', '20152016', '1', 0.2, 0.3, 0.5),
('197606102008121011', '1IF004', '20152016', '1', 0.4, 0.3, 0.3),
('197606102008121011', '1IF005', '20152016', '1', 0.25, 0.25, 0.5),
('197606102008121011', '2IF001', '20152016', '1', 0.3, 0.3, 0.4),
('198101092006041003', '2IF002', '20152016', '2', 0.2, 0.4, 0.3),
('198101092006041003', '2IF003', '20152016', '2', 0.2, 0.2, 0.6),
('198101092006041003', '2IF004', '20152016', '2', 0.2, 0.3, 0.5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perwalian`
--

CREATE TABLE `perwalian` (
  `NimMhs` char(12) NOT NULL,
  `NipDosen` char(18) NOT NULL,
  `TahunAjaran` char(8) NOT NULL,
  `Semester` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perwalian`
--

INSERT INTO `perwalian` (`NimMhs`, `NipDosen`, `TahunAjaran`, `Semester`) VALUES
('130411100001', '197406102008121002', '20152016', '1'),
('130411100002', '197406102008121002', '20152016', '1'),
('130411100004', '197406102008121002', '20152016', '1'),
('130411100005', '197406102008121002', '20152016', '1'),
('130411100006', '197406102008121002', '20152016', '1'),
('130411100007', '197406102008121002', '20152016', '1'),
('130411100008', '197406102008121002', '20152016', '1'),
('130411100009', '197406102008121002', '20152016', '1'),
('130411100010', '197406102008121002', '20152016', '1'),
('130411100011', '197406102008121002', '20152016', '1'),
('130411100012', '197406102008121002', '20152016', '1'),
('130411100013', '198101092006041003', '20152016', '1'),
('130411100014', '198101092006041003', '20152016', '1'),
('130411100015', '198101092006041003', '20152016', '1'),
('130411100016', '198101092006041003', '20152016', '1'),
('130411100017', '198101092006041003', '20152016', '1'),
('130411100018', '198101092006041003', '20152016', '1'),
('130411100019', '198101092006041003', '20152016', '1'),
('130411100020', '198101092006041003', '20152016', '1'),
('140411100008', '198101092006041003', '20152016', '1'),
('140411100010', '198101092006041003', '20152016', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `programstudi`
--

CREATE TABLE `programstudi` (
  `KodeFak` char(2) NOT NULL,
  `KodeProg` char(4) NOT NULL,
  `NamaProg` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Progra Studi';

--
-- Dumping data untuk tabel `programstudi`
--

INSERT INTO `programstudi` (`KodeFak`, `KodeProg`, `NamaProg`) VALUES
('01', '0101', 'Ilmu Kelautan'),
('01', '0102', 'Agrobisnis'),
('01', '0103', 'TIP'),
('02', '0201', 'Ilmu Hukum'),
('03', '0301', 'Akuntansi'),
('03', '0302', 'Manajemen'),
('03', '0303', 'Studi Pembangunan'),
('04', '0401', 'Teknik Informatika'),
('04', '0402', 'Teknik Industri'),
('04', '0403', 'Teknik Sistem Informasi'),
('04', '0404', 'Teknik Teknik Elektro'),
('04', '0405', 'Teknik Teknik Mesin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `propinsi`
--

CREATE TABLE `propinsi` (
  `KodeProp` char(2) NOT NULL,
  `NamaProp` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Propinsi';

--
-- Dumping data untuk tabel `propinsi`
--

INSERT INTO `propinsi` (`KodeProp`, `NamaProp`) VALUES
('31', 'DKI Jakarta'),
('32', 'Jawa Barat'),
('33', 'Jawa Tengah'),
('34', 'DKI Jogjakarta'),
('35', 'Jawa Timur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `KodeSemester` char(1) NOT NULL,
  `NamaSemester` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`KodeSemester`, `NamaSemester`) VALUES
('1', 'Ganjil'),
('2', 'Genap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `statusmatakuliah`
--

CREATE TABLE `statusmatakuliah` (
  `KodeStatMk` char(1) NOT NULL,
  `NamaStatusMk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Menyimpan Data Status Matakuliah';

--
-- Dumping data untuk tabel `statusmatakuliah`
--

INSERT INTO `statusmatakuliah` (`KodeStatMk`, `NamaStatusMk`) VALUES
('1', 'Matakuliah Kehlian Dasar'),
('2', 'Matakuliah Kehlian Kusus'),
('3', 'Matakuliah Kehlian Wajib Universitas'),
('4', 'Matakuliah Kehlian Pilihan'),
('5', 'Matakuliah Umum');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`KodeAgama`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NipDosen`),
  ADD KEY `KodeKelDosen` (`KodeKelDosen`),
  ADD KEY `KodeProgramStudiDosen` (`KodeProgramStudiDosen`),
  ADD KEY `AgamaDosen` (`AgamaDosen`),
  ADD KEY `JeniskelDosen` (`JeniskelDosen`),
  ADD KEY `KodeTempatLahirDosen` (`KodeTempatLahirDosen`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`KodeFak`);

--
-- Indexes for table `jeniskelamin`
--
ALTER TABLE `jeniskelamin`
  ADD PRIMARY KEY (`KodeJenisKelamin`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`KodeKab`),
  ADD KEY `KodeProp` (`KodeProp`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`KodeKec`),
  ADD KEY `KodeKab` (`KodeKab`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`KodeKel`),
  ADD KEY `KodeKec` (`KodeKec`);

--
-- Indexes for table `khs`
--
ALTER TABLE `khs`
  ADD PRIMARY KEY (`KodeMk`,`NimMhs`,`NipDosen`,`TahunAjaran`,`KodeSemester`),
  ADD KEY `NimMhs` (`NimMhs`),
  ADD KEY `NipDosen` (`NipDosen`),
  ADD KEY `KodeSemester` (`KodeSemester`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`KodeMk`,`NimMhs`,`NipDosen`,`TahunAjaran`,`KodeSemester`),
  ADD KEY `NimMhs` (`NimMhs`),
  ADD KEY `NipDosen` (`NipDosen`),
  ADD KEY `KodeSemester` (`KodeSemester`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NimMhs`),
  ADD KEY `KodeKelMhs` (`KodeKelMhs`),
  ADD KEY `KodeProgramStudiMhs` (`KodeProgramStudiMhs`),
  ADD KEY `KodeTempatLahirMhs` (`KodeTempatLahirMhs`),
  ADD KEY `AgamaMhs` (`AgamaMhs`),
  ADD KEY `JenisKelMhs` (`JenisKelMhs`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`KodeMk`),
  ADD KEY `StatusMk` (`StatusMk`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`Nip`,`KodeMk`,`TahunAjaran`,`Semester`),
  ADD KEY `KodeMk` (`KodeMk`);

--
-- Indexes for table `perwalian`
--
ALTER TABLE `perwalian`
  ADD PRIMARY KEY (`NimMhs`,`NipDosen`,`TahunAjaran`,`Semester`),
  ADD KEY `NipDosen` (`NipDosen`);

--
-- Indexes for table `programstudi`
--
ALTER TABLE `programstudi`
  ADD PRIMARY KEY (`KodeProg`),
  ADD KEY `KodeFak` (`KodeFak`);

--
-- Indexes for table `propinsi`
--
ALTER TABLE `propinsi`
  ADD PRIMARY KEY (`KodeProp`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`KodeSemester`);

--
-- Indexes for table `statusmatakuliah`
--
ALTER TABLE `statusmatakuliah`
  ADD PRIMARY KEY (`KodeStatMk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`KodeKelDosen`) REFERENCES `kelurahan` (`KodeKel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_ibfk_2` FOREIGN KEY (`KodeProgramStudiDosen`) REFERENCES `programstudi` (`KodeProg`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_ibfk_3` FOREIGN KEY (`AgamaDosen`) REFERENCES `agama` (`KodeAgama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_ibfk_4` FOREIGN KEY (`JeniskelDosen`) REFERENCES `jeniskelamin` (`KodeJenisKelamin`) ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_ibfk_5` FOREIGN KEY (`KodeTempatLahirDosen`) REFERENCES `kabupaten` (`KodeKab`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD CONSTRAINT `kabupaten_ibfk_1` FOREIGN KEY (`KodeProp`) REFERENCES `propinsi` (`KodeProp`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`KodeKab`) REFERENCES `kabupaten` (`KodeKab`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD CONSTRAINT `kelurahan_ibfk_1` FOREIGN KEY (`KodeKec`) REFERENCES `kecamatan` (`KodeKec`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `khs`
--
ALTER TABLE `khs`
  ADD CONSTRAINT `khs_ibfk_1` FOREIGN KEY (`KodeMk`) REFERENCES `matakuliah` (`KodeMk`) ON UPDATE CASCADE,
  ADD CONSTRAINT `khs_ibfk_2` FOREIGN KEY (`NimMhs`) REFERENCES `mahasiswa` (`NimMhs`) ON UPDATE CASCADE,
  ADD CONSTRAINT `khs_ibfk_3` FOREIGN KEY (`NipDosen`) REFERENCES `dosen` (`NipDosen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `khs_ibfk_4` FOREIGN KEY (`KodeSemester`) REFERENCES `semester` (`KodeSemester`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `krs`
--
ALTER TABLE `krs`
  ADD CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`KodeMk`) REFERENCES `matakuliah` (`KodeMk`) ON UPDATE CASCADE,
  ADD CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`NimMhs`) REFERENCES `mahasiswa` (`NimMhs`) ON UPDATE CASCADE,
  ADD CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`NipDosen`) REFERENCES `dosen` (`NipDosen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `krs_ibfk_4` FOREIGN KEY (`KodeSemester`) REFERENCES `semester` (`KodeSemester`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`KodeKelMhs`) REFERENCES `kelurahan` (`KodeKel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_2` FOREIGN KEY (`KodeProgramStudiMhs`) REFERENCES `programstudi` (`KodeProg`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_3` FOREIGN KEY (`KodeTempatLahirMhs`) REFERENCES `kabupaten` (`KodeKab`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_4` FOREIGN KEY (`AgamaMhs`) REFERENCES `agama` (`KodeAgama`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mahasiswa_ibfk_5` FOREIGN KEY (`JenisKelMhs`) REFERENCES `jeniskelamin` (`KodeJenisKelamin`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`StatusMk`) REFERENCES `statusmatakuliah` (`KodeStatMk`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `mengajar_ibfk_1` FOREIGN KEY (`Nip`) REFERENCES `dosen` (`NipDosen`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mengajar_ibfk_2` FOREIGN KEY (`KodeMk`) REFERENCES `matakuliah` (`KodeMk`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `perwalian`
--
ALTER TABLE `perwalian`
  ADD CONSTRAINT `perwalian_ibfk_1` FOREIGN KEY (`NimMhs`) REFERENCES `mahasiswa` (`NimMhs`) ON UPDATE CASCADE,
  ADD CONSTRAINT `perwalian_ibfk_2` FOREIGN KEY (`NipDosen`) REFERENCES `dosen` (`NipDosen`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `programstudi`
--
ALTER TABLE `programstudi`
  ADD CONSTRAINT `programstudi_ibfk_1` FOREIGN KEY (`KodeFak`) REFERENCES `fakultas` (`KodeFak`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
