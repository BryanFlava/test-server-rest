-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Apr 2022 pada 04.03
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `nama_buku` varchar(20) NOT NULL,
  `jenis_buku` varchar(20) NOT NULL,
  `nama_penerbit` varchar(20) NOT NULL,
  `tahun_penerbit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `nama_buku`, `jenis_buku`, `nama_penerbit`, `tahun_penerbit`) VALUES
(2, 'WORLD', 'M1', 'EVOS', 2019),
(3, 'Lemon', 'M2', 'RRQ', 2020),
(4, 'War Galaxy', 'Sejarah', 'ONIC', 2018),
(5, 'XINN', 'M3', 'RRQ', 2020),
(6, 'Royal Derby', 'Sejarah', 'Alter Ego', 2018),
(7, 'SUKSES DI USIA MUDA', 'TRADING', 'INDRA KENZ', 2020),
(8, 'GREEN TEA', 'MEMASAK', 'JEPAN LIBRARY', 2020),
(9, 'REST API', 'PEMROGRAMAN', 'Bryan Samperura', 2025),
(10, 'RPL', 'PROGRAMER', 'Erlangga', 2020);

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'Kitten123', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `nama_penerbit` varchar(20) NOT NULL,
  `tahun_penerbit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penerbit`
--

INSERT INTO `penerbit` (`id`, `nama_penerbit`, `tahun_penerbit`) VALUES
(1, 'NASA ACADEMY', '2020'),
(3, 'ONIC', '2019'),
(4, 'Alter Ego', '2020'),
(5, 'GEEK FAM', '2020'),
(6, 'BTR', '2019'),
(7, 'NAVI', '2019'),
(8, 'GPX', '2021'),
(9, 'Tesla.Inc', '2020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rak`
--

CREATE TABLE `rak` (
  `id` int(11) NOT NULL,
  `rak` int(11) NOT NULL,
  `kolom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rak`
--

INSERT INTO `rak` (`id`, `rak`, `kolom`) VALUES
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 4),
(8, 3, 1),
(9, 4, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(20) NOT NULL,
  `no_hp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `no_hp`) VALUES
(1, 'Bryan', 'bray.gaul99@gmail.co', 2147483647),
(2, 'Sapwan', 'creulpennywise@gmail', 2147483647),
(3, 'Bryan', 'bryan99@gmail.com', 2147483647),
(5, 'Ninja', 'ninjastrom23@gmail.c', 2147483647),
(6, 'Vior', 'bangpior444@gmail.co', 2147483647),
(7, 'Kayes', 'sapyes.1@gmail.com', 2147483647),
(8, 'Laura', 'lauragewh@gmail.com', 2147483647),
(9, 'Bryan', 'bryan99@gmail.com', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
