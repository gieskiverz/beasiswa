-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 08 Jul 2019 pada 19.28
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `spkbeasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `beasiswa`
--

CREATE TABLE IF NOT EXISTS `beasiswa` (
  `beasiswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `keterangan` longtext NOT NULL,
  `tahun` int(4) NOT NULL,
  `kuota` int(11) NOT NULL,
  PRIMARY KEY (`beasiswa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `beasiswa`
--

INSERT INTO `beasiswa` (`beasiswa_id`, `judul`, `keterangan`, `tahun`, `kuota`) VALUES
(3, 'Beasiswa Kurang mampu', 'bla bla bla', 2016, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE IF NOT EXISTS `kriteria` (
  `kriteria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kriteria` varchar(50) NOT NULL,
  PRIMARY KEY (`kriteria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`kriteria_id`, `nama_kriteria`) VALUES
(1, 'Nilai Rapor ny'),
(2, 'Prestasi Akademik'),
(3, 'Prestasi Non Akademik'),
(4, 'Penghasilan Orang Tua'),
(5, 'Tanggungan Orang Tua');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria_nilai`
--

CREATE TABLE IF NOT EXISTS `kriteria_nilai` (
  `kriteria_nilai_id` int(11) NOT NULL AUTO_INCREMENT,
  `beasiswa_id` int(11) NOT NULL,
  `kriteria_id_dari` int(11) NOT NULL,
  `kriteria_id_tujuan` int(11) NOT NULL,
  `nilai` int(1) NOT NULL,
  PRIMARY KEY (`kriteria_nilai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data untuk tabel `kriteria_nilai`
--

INSERT INTO `kriteria_nilai` (`kriteria_nilai_id`, `beasiswa_id`, `kriteria_id_dari`, `kriteria_id_tujuan`, `nilai`) VALUES
(1, 3, 1, 2, 3),
(2, 3, 1, 3, 5),
(3, 3, 1, 4, 6),
(4, 3, 1, 5, 6),
(5, 3, 2, 3, 3),
(6, 3, 2, 4, 4),
(7, 3, 2, 5, 4),
(8, 3, 3, 4, 2),
(9, 3, 3, 5, 2),
(10, 3, 4, 5, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_kategori`
--

CREATE TABLE IF NOT EXISTS `nilai_kategori` (
  `nilai_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_nilai` varchar(40) NOT NULL,
  PRIMARY KEY (`nilai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `nilai_kategori`
--

INSERT INTO `nilai_kategori` (`nilai_id`, `nama_nilai`) VALUES
(1, 'Sangat Baik'),
(2, 'Baik'),
(3, 'Cukup'),
(4, 'Kurang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `akses` enum('siswa','tu','walikelas','wakasis','admin') NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`user_id`, `nama`, `username`, `password`, `akses`, `photo`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'ava-c4ca4238a0b923820dcc509a6f75849b.jpg'),
(3, 'Tata Usaha', 'tu', 'b6b4ce6df035dcfaa26f3bc32fb89e6a', 'tu', 'ava-eccbc87e4b5ce2fe28308fd9f2a7baf3.jpg'),
(5, 'Waka Siswa2', 'wakasis', 'bc5810a0e11508bae24473d70a0bd72e', 'wakasis', 'ava-e4da3b7fbbce2345d7772b0674a318d5.jpg'),
(6, 'Wali Kelas 1', 'wali', 'bf8cd26e6c6732b8df17a31b54800ed8', 'walikelas', ''),
(15, 'Peserta Satu', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'siswa', ''),
(16, 'Peserta Dua', '23456', 'adcaec3805aa912c0d0b14a81bedb6ff', 'siswa', ''),
(17, 'boby', 'boby', 'c83e4046a7c5d3c4bf4c292e1e6ec681', 'tu', ''),
(18, 'jack sparow', '1212', 'a01610228fe998f515a72dd730294d87', 'siswa', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta`
--

CREATE TABLE IF NOT EXISTS `peserta` (
  `peserta_id` int(11) NOT NULL AUTO_INCREMENT,
  `beasiswa_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `status` enum('daftar','lolos','tidak lolos') NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`peserta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `peserta`
--

INSERT INTO `peserta` (`peserta_id`, `beasiswa_id`, `siswa_id`, `status`, `total`) VALUES
(2, 3, 3, 'lolos', 3.9012057519557),
(3, 3, 4, 'lolos', 0),
(4, 3, 5, 'lolos', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta_nilai`
--

CREATE TABLE IF NOT EXISTS `peserta_nilai` (
  `peserta_nilai_id` int(11) NOT NULL AUTO_INCREMENT,
  `peserta_id` int(11) NOT NULL,
  `kriteria_id` int(11) NOT NULL,
  `nilai_id` int(11) NOT NULL,
  PRIMARY KEY (`peserta_nilai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data untuk tabel `peserta_nilai`
--

INSERT INTO `peserta_nilai` (`peserta_nilai_id`, `peserta_id`, `kriteria_id`, `nilai_id`) VALUES
(11, 2, 1, 1),
(12, 2, 2, 8),
(13, 2, 3, 15),
(14, 2, 4, 16),
(15, 2, 5, 21),
(16, 3, 1, 5),
(17, 3, 2, 8),
(18, 3, 3, 12),
(19, 3, 4, 17),
(20, 3, 5, 23),
(21, 4, 1, 5),
(22, 4, 2, 10),
(23, 4, 3, 15),
(24, 4, 4, 17),
(25, 4, 5, 23);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE IF NOT EXISTS `siswa` (
  `siswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nisn` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('pria','wanita') NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tahun` int(4) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `semester` int(1) NOT NULL,
  `walikelas_id` int(11) NOT NULL,
  `anak_ke` int(2) NOT NULL,
  `saudara` int(11) NOT NULL,
  `nama_ayah` varchar(60) NOT NULL,
  `pekerjaan_ayah` varchar(60) NOT NULL,
  `nama_ibu` varchar(60) NOT NULL,
  `pekerjaan_ibu` varchar(60) NOT NULL,
  `nama_bank` varchar(30) NOT NULL,
  `no_rek` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`siswa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`siswa_id`, `nisn`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenkel`, `alamat`, `tahun`, `kelas`, `jurusan`, `semester`, `walikelas_id`, `anak_ke`, `saudara`, `nama_ayah`, `pekerjaan_ayah`, `nama_ibu`, `pekerjaan_ibu`, `nama_bank`, `no_rek`, `user_id`) VALUES
(3, '123456', 'Eli Sugigi', 'Padang', '2000-07-19', 'pria', 'Jalan Padang', 2014, '1', 'TIK', 2, 3, 2, 4, 'Ayah Peserta Satu', 'Pekerjaan Ayah peserta satu', 'Ibu Peserta satu', 'Pekerjaan Ibu peserta satu', '', '', 15),
(4, '23456', 'Peserta Dua', 'Jakarta', '2000-02-16', 'wanita', 'Jalan jakarta', 2014, '1', 'TIK', 2, 3, 1, 2, 'Ayah Peserta Dua', 'Pekerjaan ayah', 'Ibu Peserta Dua', 'Pekerjaan Ibu', '', '', 16),
(5, '1212', 'jack sparow', 'Bandung', '2004-07-13', 'pria', 'Jl. Sariasih no. 54, Sarijadi, Sukasari, Kota Bandung, Jawa Barat\r\nJl. Prumnas Tiara Lahat', 2019, '1', 'TIK', 6, 3, 2, 2, 'nama ayah', 'pekerjaan ayah', 'nama ibu', 'pekerjaan ibu', '', '', 18);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkriteria`
--

CREATE TABLE IF NOT EXISTS `subkriteria` (
  `subkriteria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_subkriteria` varchar(50) NOT NULL,
  `kriteria_id` int(11) NOT NULL,
  `tipe` enum('teks','nilai') NOT NULL,
  `nilai_minimum` double DEFAULT NULL,
  `nilai_maksimum` double DEFAULT NULL,
  `op_min` varchar(4) DEFAULT NULL,
  `op_max` varchar(4) DEFAULT NULL,
  `nilai_id` int(11) NOT NULL,
  PRIMARY KEY (`subkriteria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data untuk tabel `subkriteria`
--

INSERT INTO `subkriteria` (`subkriteria_id`, `nama_subkriteria`, `kriteria_id`, `tipe`, `nilai_minimum`, `nilai_maksimum`, `op_min`, `op_max`, `nilai_id`) VALUES
(1, '> 90  90', 1, 'nilai', 90, 90, '>', NULL, 1),
(5, '< 80 <= 90', 1, 'nilai', 80, 90, '<', '<=', 2),
(6, '< 70 <= 80', 1, 'nilai', 70, 80, '<', '<=', 3),
(7, '<= 70 < 70', 1, 'nilai', 70, 70, '<=', '<', 4),
(8, 'Nasional', 2, 'teks', NULL, NULL, NULL, NULL, 1),
(9, 'Provinsi / Kota', 2, 'teks', NULL, NULL, NULL, NULL, 2),
(10, 'Sekolah', 2, 'teks', NULL, NULL, NULL, NULL, 3),
(11, 'Tidak Ada', 2, 'teks', NULL, NULL, NULL, NULL, 4),
(12, 'Nasional', 3, 'teks', NULL, NULL, NULL, NULL, 1),
(13, 'Provinsi / Kota', 3, 'teks', NULL, NULL, NULL, NULL, 2),
(14, 'Sekolah', 3, 'teks', NULL, NULL, NULL, NULL, 3),
(15, 'Tidak Ada', 3, 'teks', NULL, NULL, NULL, NULL, 4),
(16, '<= 1500000 < 1500000', 4, 'nilai', 1500000, 1500000, '<=', '<', 1),
(17, '< 1500000 <= 2500000', 4, 'nilai', 1500000, 2500000, '<', '<=', 2),
(18, '< 2500000 <= 3500000', 4, 'nilai', 2500000, 3500000, '<', '<=', 3),
(19, '=> 3500000 > 3500000', 4, 'nilai', 3500000, 3500000, '=>', '>', 4),
(20, '= 4  4', 5, 'nilai', 4, 4, '=', NULL, 1),
(21, '> 4  > 4', 5, 'nilai', 4, 4, '>', '>', 2),
(22, '= 3 = 3', 5, 'nilai', 3, 3, '=', '=', 3),
(23, '<= 2 <= 2', 5, 'nilai', 2, 2, '<=', '<=', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkriteria_hasil`
--

CREATE TABLE IF NOT EXISTS `subkriteria_hasil` (
  `subkriteria_hasil_id` int(11) NOT NULL AUTO_INCREMENT,
  `beasiswa_id` int(11) NOT NULL,
  `subkriteria_id` int(11) NOT NULL,
  `prioritas` double NOT NULL,
  PRIMARY KEY (`subkriteria_hasil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data untuk tabel `subkriteria_hasil`
--

INSERT INTO `subkriteria_hasil` (`subkriteria_hasil_id`, `beasiswa_id`, `subkriteria_id`, `prioritas`) VALUES
(1, 3, 16, 1),
(2, 3, 17, 0.6088913020841081),
(3, 3, 18, 0.2782827306130342),
(4, 3, 19, 0.20898353242193896),
(5, 3, 1, 1),
(6, 3, 5, 0.4652226971611079),
(7, 3, 6, 0.20150479274158797),
(8, 3, 7, 0.1264838604896141),
(9, 3, 8, 1),
(10, 3, 9, 0.5949526134405514),
(11, 3, 10, 0.34577828834003443),
(12, 3, 11, 0.20602383687535897),
(13, 3, 12, 1),
(14, 3, 13, 0.4301845987904696),
(15, 3, 14, 0.25758657541918056),
(16, 3, 15, 0.15612791814736754),
(17, 3, 20, 1),
(18, 3, 21, 0.7450778338083753),
(19, 3, 22, 0.2948147336110502),
(20, 3, 23, 0.16278228458671345);

-- --------------------------------------------------------

--
-- Struktur dari tabel `subkriteria_nilai`
--

CREATE TABLE IF NOT EXISTS `subkriteria_nilai` (
  `subkriteria_nilai_id` int(11) NOT NULL AUTO_INCREMENT,
  `beasiswa_id` int(11) NOT NULL,
  `kriteria_id` int(11) NOT NULL,
  `subkriteria_id_dari` int(11) NOT NULL,
  `subkriteria_id_tujuan` int(11) NOT NULL,
  `nilai` int(1) NOT NULL,
  PRIMARY KEY (`subkriteria_nilai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data untuk tabel `subkriteria_nilai`
--

INSERT INTO `subkriteria_nilai` (`subkriteria_nilai_id`, `beasiswa_id`, `kriteria_id`, `subkriteria_id_dari`, `subkriteria_id_tujuan`, `nilai`) VALUES
(91, 3, 1, 1, 5, 3),
(92, 3, 1, 1, 6, 5),
(93, 3, 1, 1, 7, 6),
(94, 3, 1, 5, 6, 3),
(95, 3, 1, 5, 7, 4),
(96, 3, 1, 6, 7, 2),
(97, 3, 2, 8, 9, 2),
(98, 3, 2, 8, 10, 3),
(99, 3, 2, 8, 11, 4),
(100, 3, 2, 9, 10, 2),
(101, 3, 2, 9, 11, 3),
(102, 3, 2, 10, 11, 2),
(103, 3, 3, 12, 13, 3),
(104, 3, 3, 12, 14, 4),
(105, 3, 3, 12, 15, 5),
(106, 3, 3, 13, 14, 2),
(107, 3, 3, 13, 15, 3),
(108, 3, 3, 14, 15, 2),
(109, 3, 4, 16, 17, 2),
(110, 3, 4, 16, 18, 3),
(111, 3, 4, 16, 19, 5),
(112, 3, 4, 17, 18, 2),
(113, 3, 4, 17, 19, 4),
(114, 3, 4, 18, 19, 1),
(115, 3, 5, 20, 21, 2),
(116, 3, 5, 20, 22, 4),
(117, 3, 5, 20, 23, 4),
(118, 3, 5, 21, 22, 4),
(119, 3, 5, 21, 23, 5),
(120, 3, 5, 22, 23, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tata_usaha`
--

CREATE TABLE IF NOT EXISTS `tata_usaha` (
  `tata_usaha_id` int(11) NOT NULL AUTO_INCREMENT,
  `nuptk` varchar(30) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `tempat` varchar(40) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('pria','wanita') NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`tata_usaha_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `tata_usaha`
--

INSERT INTO `tata_usaha` (`tata_usaha_id`, `nuptk`, `nama`, `tempat`, `tgl_lahir`, `jenkel`, `user_id`) VALUES
(2, 'tu', 'Tata Usaha', 'Jakarta', '1998-08-10', 'pria', 3),
(3, 'boby', 'boby', '', '0000-00-00', 'pria', 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `waka_siswa`
--

CREATE TABLE IF NOT EXISTS `waka_siswa` (
  `waka_siswa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nuptk` varchar(30) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `tempat` varchar(40) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('pria','wanita') NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`waka_siswa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `waka_siswa`
--

INSERT INTO `waka_siswa` (`waka_siswa_id`, `nuptk`, `nama`, `tempat`, `tgl_lahir`, `jenkel`, `user_id`) VALUES
(2, 'wakasis', 'Waka Siswa2', 'padang', '1978-04-20', 'pria', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wali_kelas`
--

CREATE TABLE IF NOT EXISTS `wali_kelas` (
  `wali_kelas_id` int(11) NOT NULL AUTO_INCREMENT,
  `nuptk` varchar(30) NOT NULL,
  `kelas` varchar(30) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `tempat` varchar(40) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenkel` enum('pria','wanita') NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`wali_kelas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `wali_kelas`
--

INSERT INTO `wali_kelas` (`wali_kelas_id`, `nuptk`, `kelas`, `jurusan`, `nama`, `tempat`, `tgl_lahir`, `jenkel`, `user_id`) VALUES
(3, 'wali', '1', 'TIK', 'Wali Kelas 1', 'Padang', '1989-04-03', 'wanita', 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
