-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2025 at 07:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id_admin` bigint(20) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id_admin`, `nama`, `username`, `password`) VALUES
(1, 'admin', 'admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_anggota`
--

CREATE TABLE `tbl_anggota` (
  `npm` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jurusan` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_anggota`
--

INSERT INTO `tbl_anggota` (`npm`, `nama`, `jurusan`, `no_telp`, `email`) VALUES
('05351233', 'Andi', 'T.I', '061061', 'andi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buku`
--

CREATE TABLE `tbl_buku` (
  `kode_buku` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  `penerbit` text NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_buku`
--

INSERT INTO `tbl_buku` (`kode_buku`, `isbn`, `judul`, `pengarang`, `tahun`, `penerbit`, `status`) VALUES
('B-01', '90-9090909', 'Pem Web', 'Tommy', 2025, 'Andi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kembali`
--

CREATE TABLE `tbl_kembali` (
  `id_kembali` bigint(20) NOT NULL,
  `id_pinjam` bigint(20) DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `id_pinjam` bigint(20) NOT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `kode_buku` varchar(255) DEFAULT NULL,
  `npm` varchar(255) DEFAULT NULL,
  `deadline` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tbl_anggota`
--
ALTER TABLE `tbl_anggota`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  ADD PRIMARY KEY (`kode_buku`) USING BTREE;

--
-- Indexes for table `tbl_kembali`
--
ALTER TABLE `tbl_kembali`
  ADD PRIMARY KEY (`id_kembali`),
  ADD KEY `kembali_fk1` (`id_pinjam`);

--
-- Indexes for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `pinjam_fk1` (`kode_buku`),
  ADD KEY `pinjam_fk2` (`npm`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id_admin` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_kembali`
--
ALTER TABLE `tbl_kembali`
  MODIFY `id_kembali` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  MODIFY `id_pinjam` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kembali`
--
ALTER TABLE `tbl_kembali`
  ADD CONSTRAINT `kembali_fk1` FOREIGN KEY (`id_pinjam`) REFERENCES `tbl_pinjam` (`id_pinjam`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD CONSTRAINT `pinjam_fk1` FOREIGN KEY (`kode_buku`) REFERENCES `tbl_buku` (`kode_buku`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_fk2` FOREIGN KEY (`npm`) REFERENCES `tbl_anggota` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
