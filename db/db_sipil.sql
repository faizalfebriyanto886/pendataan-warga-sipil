-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jan 2022 pada 11.32
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
-- Struktur dari tabel `alamat`
--

CREATE TABLE `alamat` (
  `id` int(11) NOT NULL,
  `wilayah_id` int(11) NOT NULL,
  `jalan` varchar(32) NOT NULL,
  `nomor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `alamat`
--

INSERT INTO `alamat` (`id`, `wilayah_id`, `jalan`, `nomor`) VALUES
(1, 1, 'gang 31 AA', 19);

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
(1, 1, 3),
(2, 1, 4);

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
(1, 1, 3),
(2, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kawin`
--

CREATE TABLE `kawin` (
  `id` int(11) NOT NULL,
  `tanggal_kawin` date NOT NULL,
  `akta_kawin` varchar(16) NOT NULL,
  `tempat_kawin` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kawin`
--

INSERT INTO `kawin` (`id`, `tanggal_kawin`, `akta_kawin`, `tempat_kawin`) VALUES
(1, '2022-01-10', '123456789', 'surabaya'),
(2, '2022-02-02', '456456456', 'lamongan');

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
  `keterangan` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelahiran`
--

INSERT INTO `kelahiran` (`id`, `penduduk_id`, `nomor_kelahiran`, `tempat`, `hari`, `tanggal`, `keterangan`) VALUES
(3, 3, '654321', 'rungkut', 'jumat', '2021-11-26', 'lahir sehat'),
(4, 4, '654321', 'wonokromo', 'jumat', '2020-11-26', 'lahir sehat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluarga`
--

CREATE TABLE `keluarga` (
  `id` int(11) NOT NULL,
  `alamat_id` int(11) NOT NULL,
  `nomor_keluarga` varchar(16) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal_keluar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `keluarga`
--

INSERT INTO `keluarga` (`id`, `alamat_id`, `nomor_keluarga`, `status`, `tanggal_keluar`) VALUES
(1, 1, '000111', 'aktif', '2022-01-01'),
(3, 1, '000123', 'aktif', '2022-02-20');

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
  `sebab` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kematian`
--

INSERT INTO `kematian` (`id`, `penduduk_id`, `tempat`, `hari`, `tanggal`, `sebab`) VALUES
(1, 3, 'rumah sakit', 'jumat', '2020-02-02', 'sakit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penduduk`
--

CREATE TABLE `penduduk` (
  `id` int(11) NOT NULL,
  `kelahiran_id` int(11) NOT NULL,
  `kematian_id` int(11) DEFAULT NULL,
  `nik` varchar(16) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `agama` varchar(10) NOT NULL,
  `status_kawin` varchar(15) NOT NULL,
  `pekerjaan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penduduk`
--

INSERT INTO `penduduk` (`id`, `kelahiran_id`, `kematian_id`, `nik`, `nama`, `jenis_kelamin`, `agama`, `status_kawin`, `pekerjaan`) VALUES
(3, 3, 1, '3517182611990002', 'Eric Wahyu Amiruddin', 'laki-laki', 'islam', 'belum kawin', 'mahasiswa'),
(4, 4, NULL, '3517182611990002', 'Erika Wahyu Amiruddin', 'perempuan', 'islam', 'belum kawin', 'mahasiswa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Eric Wahyu Amiruddin', 'ewa', '123'),
(2, 'Faizal febriYANTO', 'lala', '123');

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
(1, '001', '001', 'medayu utara', 'rungkut', 'surabaya', 'jawa timur'),
(2, '001', '001', 'wonorejo', 'rungkut', 'surabaya', 'jawa timur');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wilayah_id` (`wilayah_id`);

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
  ADD KEY `fk_keluarga_id_detail` (`keluarga_id`),
  ADD KEY `fk_penduduk_id_detail` (`penduduk_id`);

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
  ADD KEY `fk_penduduk_id_kelahiran` (`penduduk_id`);

--
-- Indeks untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alamat` (`alamat_id`);

--
-- Indeks untuk tabel `kematian`
--
ALTER TABLE `kematian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_penduduk_id` (`penduduk_id`);

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
-- AUTO_INCREMENT untuk tabel `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_kawin`
--
ALTER TABLE `detail_kawin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_keluarga`
--
ALTER TABLE `detail_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kawin`
--
ALTER TABLE `kawin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kelahiran`
--
ALTER TABLE `kelahiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kematian`
--
ALTER TABLE `kematian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penduduk`
--
ALTER TABLE `penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD CONSTRAINT `fk_wilayah_id` FOREIGN KEY (`wilayah_id`) REFERENCES `wilayah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_penduduk_id_kelahiran` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `fk_alamat` FOREIGN KEY (`alamat_id`) REFERENCES `alamat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kematian`
--
ALTER TABLE `kematian`
  ADD CONSTRAINT `fk_penduduk_id` FOREIGN KEY (`penduduk_id`) REFERENCES `penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
