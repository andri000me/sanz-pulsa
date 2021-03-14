-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2021 at 11:02 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sanzpulsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Pulsa Regular'),
(2, 'Pulsa Data'),
(5, 'Voucher Ga');

-- --------------------------------------------------------

--
-- Table structure for table `nominal`
--

CREATE TABLE `nominal` (
  `id_nominal` int(11) NOT NULL,
  `nama_nominal` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `hpp` decimal(8,0) NOT NULL,
  `harga_jual` decimal(8,0) NOT NULL,
  `stok` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_proveder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nominal`
--

INSERT INTO `nominal` (`id_nominal`, `nama_nominal`, `deskripsi`, `hpp`, `harga_jual`, `stok`, `id_kategori`, `id_proveder`) VALUES
(3, 'Pulsa 5 Ribu', 'All Operator Rp.5000', '5000', '6000', 999, 1, 6),
(10, 'Pulsa 10 Ribu', 'All Operator Rp.10.000', '10000', '11000', 999, 1, 6),
(11, 'Pulsa 20 Ribu', 'All Operator Rp.20.000', '20000', '21000', 999, 1, 6),
(15, 'Pulsa 50 Ribu', 'All Operator Rp.50.000', '49000', '51000', 999, 1, 6),
(16, 'Telkomsel 1GB', 'Data Flash 1GB', '9000', '10000', 50, 2, 1),
(17, 'Axis 1GB', '', '9000', '10000', 20, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `proveder`
--

CREATE TABLE `proveder` (
  `id_proveder` int(11) NOT NULL,
  `nama_proveder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveder`
--

INSERT INTO `proveder` (`id_proveder`, `nama_proveder`) VALUES
(1, 'Telkomsel'),
(2, 'Indosat'),
(3, 'Tri'),
(4, 'XL & Axis'),
(5, 'Smartfren'),
(6, 'All Operator');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `no_hp` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `id_nominal` int(11) NOT NULL,
  `harga_pulsa` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `id_provider` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `detail` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `no_hp`, `qty`, `id_nominal`, `harga_pulsa`, `status`, `id_provider`, `id_kategori`, `detail`, `tanggal`, `user_id`) VALUES
(105, '081311633340', 4, 10, '11000', 1, 1, 1, 1, '2021-02-22 14:13:39', 1),
(106, '08384594956', 2, 17, '10000', 1, 4, 1, 1, '2021-02-22 14:09:07', 1),
(107, '081311633340', 3, 15, '51000', 1, 1, 1, 1, '2021-02-22 14:13:39', 1),
(108, '081311633340', 3, 16, '10000', 1, 1, 1, 1, '2021-02-22 14:13:39', 1),
(109, '081311633340', 2, 16, '10000', 1, 1, 2, 1, '2021-02-22 14:13:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pembelian`
--

CREATE TABLE `transaksi_pembelian` (
  `id` int(11) NOT NULL,
  `id_nominal` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_provider` int(11) NOT NULL,
  `harga_pokok` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `dekripsi` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_pembelian`
--

INSERT INTO `transaksi_pembelian` (`id`, `id_nominal`, `id_kategori`, `id_provider`, `harga_pokok`, `qty`, `dekripsi`, `status`, `tanggal`, `user_id`) VALUES
(13, 16, 2, 1, '9000', 20, '', 0, '2021-02-22 14:06:21', 1),
(14, 16, 2, 1, '9000', 10, '', 0, '2021-02-22 14:12:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` enum('admin','karyawan') NOT NULL,
  `active` enum('0','1') NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `level`, `active`, `last_login`) VALUES
(1, 'Muhammad Sandy P.R.', 'msandypr', '202cb962ac59075b964b07152d234b70', 'admin', '1', '2018-05-05 09:56:00'),
(7, 'Karyawan', 'Karyawan', '202cb962ac59075b964b07152d234b70', 'karyawan', '1', '0000-00-00 00:00:00'),
(8, 'Udin', 'udinsedunia', '202cb962ac59075b964b07152d234b70', 'karyawan', '0', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_nominal`
-- (See below for the actual view)
--
CREATE TABLE `v_nominal` (
`id_nominal` int(11)
,`nama_nominal` varchar(50)
,`nama_kategori` varchar(50)
,`nama_proveder` varchar(50)
,`deskripsi` text
,`hpp` decimal(8,0)
,`harga_jual` decimal(8,0)
,`stok` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_nominal`
--
DROP TABLE IF EXISTS `v_nominal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_nominal`  AS SELECT `nominal`.`id_nominal` AS `id_nominal`, `nominal`.`nama_nominal` AS `nama_nominal`, `kategori`.`nama_kategori` AS `nama_kategori`, `proveder`.`nama_proveder` AS `nama_proveder`, `nominal`.`deskripsi` AS `deskripsi`, `nominal`.`hpp` AS `hpp`, `nominal`.`harga_jual` AS `harga_jual`, `nominal`.`stok` AS `stok` FROM ((`nominal` join `proveder` on(`proveder`.`id_proveder` = `nominal`.`id_proveder`)) join `kategori` on(`kategori`.`id_kategori` = `nominal`.`id_kategori`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `nominal`
--
ALTER TABLE `nominal`
  ADD PRIMARY KEY (`id_nominal`),
  ADD KEY `id_kategori` (`id_kategori`,`id_proveder`),
  ADD KEY `id_proveder` (`id_proveder`);

--
-- Indexes for table `proveder`
--
ALTER TABLE `proveder`
  ADD PRIMARY KEY (`id_proveder`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_nominal` (`id_nominal`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Indexes for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nominal` (`id_nominal`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `id_provider` (`id_provider`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nominal`
--
ALTER TABLE `nominal`
  MODIFY `id_nominal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `proveder`
--
ALTER TABLE `proveder`
  MODIFY `id_proveder` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nominal`
--
ALTER TABLE `nominal`
  ADD CONSTRAINT `nominal_ibfk_1` FOREIGN KEY (`id_proveder`) REFERENCES `proveder` (`id_proveder`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nominal_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_nominal`) REFERENCES `nominal` (`id_nominal`);

--
-- Constraints for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD CONSTRAINT `transaksi_pembelian_ibfk_1` FOREIGN KEY (`id_nominal`) REFERENCES `nominal` (`id_nominal`),
  ADD CONSTRAINT `transaksi_pembelian_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`),
  ADD CONSTRAINT `transaksi_pembelian_ibfk_3` FOREIGN KEY (`id_provider`) REFERENCES `proveder` (`id_proveder`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
