-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2023 at 04:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `duamasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_barang` text NOT NULL,
  `merk` varchar(255) NOT NULL,
  `harga_beli` varchar(255) NOT NULL,
  `harga_jual` varchar(255) NOT NULL,
  `satuan_barang` varchar(255) NOT NULL,
  `stok` text NOT NULL,
  `tgl_input` varchar(255) NOT NULL,
  `tgl_update` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah_orderan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_barang`, `id_kategori`, `nama_barang`, `merk`, `harga_beli`, `harga_jual`, `satuan_barang`, `stok`, `tgl_input`, `tgl_update`, `keterangan`, `jumlah_orderan`) VALUES
(32, 'BR001', 17, 'pizza ajwah', '2023-08-18', '2023-08-19', '60', 'Muhammad Alahuddin', '200', '16 August 2023, 14:44', '23 August 2023, 8:40', 'Lunas', 100),
(33, 'BR002', 25, 'nineties', '2023-08-18', '2023-08-19', '60', 'Muhammad Alahuddin', '1000', '18 August 2023, 14:36', '23 August 2023, 8:39', 'dp', 700),
(34, 'BR003', 23, 'pisang keju', '2023-08-19', '2023-08-20', '60', 'Arif Wahyu Pranoto', '1000', '18 August 2023, 14:37', '23 August 2023, 8:39', 'Lunas', 450),
(35, 'BR004', 24, 'ua', '2023-08-26', '2023-08-19', '60', 'M Parhan', '1000', '18 August 2023, 14:37', '23 August 2023, 8:38', 'DP', 500),
(36, 'BR005', 25, 'kw', '2023-08-19', '2023-08-26', '60', 'Muhammad Alahuddin', '100', '18 August 2023, 14:38', '23 August 2023, 8:38', 'Lunas', 300);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `tgl_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tgl_input`) VALUES
(15, 'LB 09 PE (Ekonomi)', '12 August 2023, 9:40'),
(16, 'LB 09 PE (Regular)', '12 August 2023, 9:40'),
(17, 'LB 02 PE', '12 August 2023, 9:40'),
(18, 'LB 03 PE', '12 August 2023, 9:41'),
(19, 'LB 05 PE', '12 August 2023, 9:41'),
(20, 'LB 08 PE', '12 August 2023, 9:41'),
(21, 'RB 01 PE', '12 August 2023, 9:41'),
(23, 'RB 02 PE', '12 August 2023, 9:42'),
(24, 'RB 03 PE', '12 August 2023, 9:42'),
(25, 'TR 01 PE', '12 August 2023, 9:42'),
(26, 'TR 02 PE', '12 August 2023, 9:43'),
(27, 'TR 04 PE', '12 August 2023, 9:43'),
(28, 'TR 06 PE', '12 August 2023, 9:43'),
(29, 'TR 07 PE', '12 August 2023, 9:43'),
(30, 'TOAST', '12 August 2023, 9:44'),
(31, 'PBG 001', '12 August 2023, 9:44'),
(32, 'PBG 002', '12 August 2023, 9:44'),
(33, 'SBG 001', '12 August 2023, 9:44'),
(34, 'SBG 002', '12 August 2023, 9:44'),
(35, 'SBG 003', '12 August 2023, 9:44'),
(36, 'SBG 011', '12 August 2023, 9:45'),
(37, 'B 01 No PE', '12 August 2023, 9:45'),
(38, 'B 02 No PE', '12 August 2023, 9:45'),
(39, 'B 04 No PE', '12 August 2023, 9:45'),
(40, 'B 05 No PE', '12 August 2023, 9:45'),
(41, 'B 08 No PE', '12 August 2023, 9:46'),
(42, 'B 09 No PE', '12 August 2023, 9:46'),
(43, 'B 12 No PE', '12 August 2023, 9:47'),
(44, 'B 08 PE', '12 August 2023, 9:47'),
(45, 'B 13 PE', '12 August 2023, 9:47'),
(46, 'B 14 PE', '12 August 2023, 9:48'),
(47, 'B 15 PE', '12 August 2023, 9:48'),
(48, 'B 10 PE', '12 August 2023, 9:48'),
(49, 'B 24 PE', '12 August 2023, 9:48'),
(50, 'LB 02 BLUE', '12 August 2023, 9:49'),
(51, 'LB 02 RED', '12 August 2023, 9:49'),
(52, 'LB BLACK (Regular)', '12 August 2023, 9:49'),
(53, 'LB 09 IVORY', '12 August 2023, 9:50'),
(54, 'LB 02 IVORY', '12 August 2023, 9:50'),
(55, 'LB IVORY', '12 August 2023, 9:50'),
(56, 'BOX PIZZA', '12 August 2023, 9:50'),
(57, 'CUP HOLDER', '12 August 2023, 9:50'),
(58, 'PAPERWRAP', '12 August 2023, 9:50');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` char(32) NOT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `user`, `pass`, `id_member`) VALUES
(1, 'yukemas', 'efe3b1cb17ab94f7ed34046988e2552a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nm_member` varchar(255) NOT NULL,
  `alamat_member` text NOT NULL,
  `telepon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gambar` text NOT NULL,
  `NIK` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nm_member`, `alamat_member`, `telepon`, `email`, `gambar`, `NIK`) VALUES
(1, 'Yu\'Kemas Packaging ', 'Banjarbaru', '085921254662', 'yukemas@gmail.com', 'WhatsApp Image 2023-08-08 at 15.48.52.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nota`
--

INSERT INTO `nota` (`id_nota`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`, `periode`) VALUES
(28, 'BR001', 1, '500', '30000', '16 August 2023, 14:45', '08-2023'),
(29, 'BR001', 1, '300', '18000', '18 August 2023, 14:30', '08-2023'),
(30, 'BR005', 1, '500', '30000', '18 August 2023, 14:48', '08-2023'),
(31, 'BR005', 1, '400', '24000', '26 August 2023, 8:50', '08-2023');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` varchar(255) NOT NULL,
  `id_member` int(11) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `tanggal_input` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_barang`, `id_member`, `jumlah`, `total`, `tanggal_input`) VALUES
(71, 'BR001', 1, '100', '6000', '4 September 2023, 8:53');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `tlp` varchar(255) NOT NULL,
  `nama_pemilik` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `alamat_toko`, `tlp`, `nama_pemilik`) VALUES
(1, 'YU\'KEMAS PACKAGING', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
