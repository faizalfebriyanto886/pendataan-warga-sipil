-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2022 pada 08.38
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sipil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_kawin`
--

CREATE TABLE `detail_kawin` (
  `id` int(11) NOT NULL,
  `kawin_id` int(11) NOT NULL,
  `penduduk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_kawin`
--

INSERT INTO `detail_kawin` (`id`, `kawin_id`, `penduduk_id`) VALUES
(1, 1, 5),
(2, 1, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_keluarga`
--

CREATE TABLE `detail_keluarga` (
  `id` int(11) NOT NULL,
  `keluarga_id` int(11) NOT NULL,
  `penduduk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_keluarga`
--

INSERT INTO `detail_keluarga` (`id`, `keluarga_id`, `penduduk_id`) VALUES
(1, 1, 5),
(2, 6, 5),
(3, 7, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kawin`
--

CREATE TABLE `kawin` (
  `id` int(11) NOT NULL,
  `tanggal_akad` date NOT NULL,
  `akta_nikah` varchar(20) NOT NULL,
  `tempat_nikah` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kawin`
--

INSERT INTO `kawin` (`id`, `tanggal_akad`, `akta_nikah`, `tempat_nikah`) VALUES
(1, '2022-01-01', 'a', 'a'),
(2, '2022-01-02', 'b', 'b'),
(3, '2022-01-03', 'c', 'c'),
(4, '2022-02-02', 'z', 'z'),
(6, '2022-12-30', 'xx', 'xx');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelahiran`
--

CREATE TABLE `kelahiran` (
  `id` int(11) NOT NULL,
  `penduduk_id` int(11) DEFAULT NULL,
  `nomor_kelahiran` varchar(16) NOT NULL,
  `tempat` varchar(32) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelahiran`
--

INSERT INTO `kelahiran` (`id`, `penduduk_id`, `nomor_kelahiran`, `tempat`, `hari`, `tanggal`, `keterangan`) VALUES
(1, NULL, '0011', 'a', 'a', '2022-01-01', 'a'),
(21, 5, '000111', 'a', 'a', '2022-01-01', 'a'),
(22, 6, '000222', 'b', 'b', '2022-01-01', 'b');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluarga`
--

CREATE TABLE `keluarga` (
  `id` int(11) NOT NULL,
  `wilayah_id` int(11) NOT NULL,
  `nomor_keluarga` varchar(16) NOT NULL,
  `status` varchar(20) NOT NULL,
  `alamat` varchar(32) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keluarga`
--

INSERT INTO `keluarga` (`id`, `wilayah_id`, `nomor_keluarga`, `status`, `alamat`, `tanggal_keluar`) VALUES
(1, 1, '0011', 'a', 'a', '2022-01-01'),
(6, 1, '0033', 'c', 'c', '2022-01-02'),
(7, 3, '0033', 'z', 'z', '2022-02-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kematian`
--

CREATE TABLE `kematian` (
  `id` int(11) NOT NULL,
  `penduduk_id` int(11) NOT NULL,
  `tempat` varchar(32) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `sebab` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kematian`
--

INSERT INTO `kematian` (`id`, `penduduk_id`, `tempat`, `hari`, `tanggal`, `sebab`) VALUES
(14, 5, 'a', 'a', '2022-01-30', 'aaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penduduk`
--

CREATE TABLE `penduduk` (
  `id` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `kelahiran_id` int(11) DEFAULT NULL,
  `kematian_id` int(11) DEFAULT NULL,
  `nama` varchar(32) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `status_kawin` varchar(15) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penduduk`
--

INSERT INTO `penduduk` (`id`, `nik`, `kelahiran_id`, `kematian_id`, `nama`, `jenis_kelamin`, `agama`, `status_kawin`, `pekerjaan`) VALUES
(5, '01', 21, 14, 'a', 'a', 'a', 'a', 'a'),
(6, '02', 22, NULL, 'z', 'z', 'z', 'z', 'z');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Eric Wahyu Amiruddin', 'ewa', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Struktur dari tabel `wilayah`
--

CREATE TABLE `wilayah` (
  `id` int(11) NOT NULL,
  `rt` varchar(3) NOT NULL,
  `rw` varchar(3) NOT NULL,
  `kelurahan` varchar(32) NOT NULL,
  `kecamatan` varchar(32) NOT NULL,
  `kabupaten` varchar(32) NOT NULL,
  `provinsi` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `wilayah`
--

INSERT INTO `wilayah` (`id`, `rt`, `rw`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`) VALUES
(1, '001', '001', 'a', 'a', 'a', 'a'),
(3, '002', '002', 'b', 'b', 'b', 'b');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_kawin`
--
ALTER TABLE `detail_kawin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kawin_id_kawin` (`kawin_id`),
  ADD KEY `fk_penduduk_id_kawin` (`penduduk_id`);

--
-- Indeks untuk tabel `detail_keluarga`
--
ALTER TABLE `detail_keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penduduk_id_detail` (`penduduk_id`),
  ADD KEY `fk_keluarga_id_detail` (`keluarga_id`);

--
-- Indeks untuk tabel `kawin`
--
ALTER TABLE `kawin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelahiran`
--
ALTER TABLE `kelahiran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penduduk_id` (`penduduk_id`);

--
-- Indeks untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wilayah_id` (`wilayah_id`) USING BTREE;

--
-- Indeks untuk tabel `kematian`
--
ALTER TABLE `kematian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penduduk_id_kematian` (`penduduk_id`);

--
-- Indeks untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kelahiran_id` (`kelahiran_id`),
  ADD KEY `fk_kematian_id` (`kematian_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_kawin`
--
ALTER TABLE `detail_kawin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `detail_keluarga`
--
ALTER TABLE `detail_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kawin`
--
ALTER TABLE `kawin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kelahiran`
--
ALTER TABLE `kelahiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kematian`
--
ALTER TABLE `kematian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_kawin`
--
ALTER TABLE `detail_kawin`
  ADD CONSTRAINT `fk_kawin_id_kawin` FOREIGN KEY (`kawin_id`) REFERENCES `kawin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penduduk_id_kawin` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_keluarga`
--
ALTER TABLE `detail_keluarga`
  ADD CONSTRAINT `fk_keluarga_id_detail` FOREIGN KEY (`keluarga_id`) REFERENCES `keluarga` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penduduk_id_detail` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelahiran`
--
ALTER TABLE `kelahiran`
  ADD CONSTRAINT `fk_penduduk_id` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `fk_wilayah_id` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kematian`
--
ALTER TABLE `kematian`
  ADD CONSTRAINT `fk_penduduk_id_kematian` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  ADD CONSTRAINT `fk_kelahiran_id` FOREIGN KEY (`kelahiran_id`) REFERENCES `kelahiran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kematian_id` FOREIGN KEY (`kematian_id`) REFERENCES `kematian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
