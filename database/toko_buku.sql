-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 17, 2026 at 06:16 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` bigint UNSIGNED NOT NULL,
  `penerbit_id` bigint UNSIGNED NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `tahun_terbit` year DEFAULT NULL,
  `harga` decimal(12,2) NOT NULL,
  `stok` int DEFAULT '0',
  `deskripsi` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `penerbit_id`, `isbn`, `judul`, `penulis`, `kategori`, `tahun_terbit`, `harga`, `stok`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, '9786020651234', 'Laskar Pelangi', 'Andrea Hirata', 'Novel', 2005, '85000.00', 20, 'Novel tentang perjuangan pendidikan', '2026-11-17 06:13:21', '2026-11-17 06:13:21'),
(2, 1, '9786020334567', 'Bumi', 'Tere Liye', 'Fantasi', 2014, '95000.00', 15, 'Novel fantasi petualangan', '2026-11-17 06:13:21', '2026-11-17 06:13:21'),
(3, 2, '9786022987654', 'Matematika Dasar', 'Sukino', 'Pendidikan', 2020, '75000.00', 30, 'Buku pembelajaran matematika', '2026-11-17 06:13:21', '2026-11-17 06:13:21'),
(4, 2, '9786021234567', 'Bahasa Indonesia', 'Tim Erlangga', 'Pendidikan', 2021, '65000.00', 25, 'Buku pembelajaran bahasa Indonesia', '2026-11-17 06:13:21', '2026-11-17 06:13:21'),
(5, 3, '9786029876543', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Novel', 2009, '90000.00', 10, 'Novel tentang pendidikan dan persahabatan', '2026-11-17 06:13:21', '2026-11-17 06:13:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `fk_buku_penerbit` (`penerbit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_buku_penerbit` FOREIGN KEY (`penerbit_id`) REFERENCES `penerbit` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
