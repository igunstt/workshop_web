-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2018 at 10:41 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nidn` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` smallint(1) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nidn`, `nama`, `jurusan`, `alamat`) VALUES
('1015088303', 'Indro', 1, 'Tiban'),
('10159102', 'Dono', 1, 'Solo'),
('10191029', 'kasino', 2, 'Tegal');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `no` smallint(1) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`no`, `nama_jurusan`) VALUES
(1, 'T.Informatika'),
(2, 'T.Industri');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nik` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jurusan` smallint(1) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nik`, `nama`, `jurusan`, `alamat`) VALUES
('00001', 'Rangga', 1, 'Jakarta'),
('00002', 'Cinta', 1, 'Bandung'),
('00003', 'Maura', 2, 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` varchar(15) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` smallint(1) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `jurusan`, `alamat`, `no_telepon`) VALUES
('1015088303', 'Yusuf bin Sanusi', 2, 'Batam Centre', '0811800818'),
('1015920103', 'Bajuri', 1, 'Jakarta', '089288223'),
('101601940', 'Komeng', 1, 'Petamburan Jakarta', '088010243');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `no` int(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `quantity` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`no`, `nama`, `quantity`) VALUES
(1, 'sepatu', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `no` int(9) NOT NULL,
  `username` varchar(9) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `last_login` datetime NOT NULL,
  `user_agent` varchar(50) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`no`, `username`, `session_id`, `ip_address`, `last_login`, `user_agent`, `timestamp`, `status`) VALUES
(1, 'Agen001', '00000000000000000000000000000000000001', '127.0.0.1', '2014-06-02 00:00:00', 'Mozilla', '2014-06-09 01:34:38', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `no` int(9) NOT NULL,
  `level_id` int(1) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `lang_id` varchar(3) NOT NULL,
  `last_login` datetime NOT NULL,
  `created_on` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fullname` varchar(30) NOT NULL,
  `phone1` varchar(15) NOT NULL,
  `phone2` varchar(15) NOT NULL,
  `others` tinyblob
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`no`, `level_id`, `username`, `password`, `email`, `lang_id`, `last_login`, `created_on`, `timestamp`, `fullname`, `phone1`, `phone2`, `others`) VALUES
(1, 1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@gmail.com', 'id', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-03-10 16:21:59', 'Administrator', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `level_id` tinyint(1) UNSIGNED NOT NULL,
  `level_name` varchar(30) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`level_id`, `level_name`, `timestamp`) VALUES
(1, 'admin', '0000-00-00 00:00:00'),
(2, 'manager', '0000-00-00 00:00:00'),
(3, 'staff', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nidn`),
  ADD KEY `key_jurusan3` (`jurusan`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `key_jurusan2` (`jurusan`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`),
  ADD KEY `jurusan` (`jurusan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`no`),
  ADD UNIQUE KEY `no` (`no`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `author_id` (`no`),
  ADD UNIQUE KEY `author_id_2` (`no`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `fullname` (`fullname`),
  ADD KEY `phone1` (`phone1`,`phone2`),
  ADD KEY `LEVEL_ID` (`level_id`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `author_level_id` (`level_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `no` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `no` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `level_id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `key_jurusan3` FOREIGN KEY (`jurusan`) REFERENCES `jurusan` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `key_jurusan2` FOREIGN KEY (`jurusan`) REFERENCES `jurusan` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`jurusan`) REFERENCES `jurusan` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
