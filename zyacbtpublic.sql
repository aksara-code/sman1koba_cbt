-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Mar 2026 pada 05.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zyacbtpublic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_jawaban`
--

CREATE TABLE `cbt_jawaban` (
  `jawaban_id` bigint(20) UNSIGNED NOT NULL,
  `jawaban_soal_id` bigint(20) UNSIGNED NOT NULL,
  `jawaban_detail` text NOT NULL,
  `jawaban_benar` tinyint(1) NOT NULL DEFAULT 0,
  `jawaban_aktif` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_konfigurasi`
--

CREATE TABLE `cbt_konfigurasi` (
  `konfigurasi_id` int(11) NOT NULL,
  `konfigurasi_kode` varchar(50) NOT NULL,
  `konfigurasi_isi` varchar(500) NOT NULL,
  `konfigurasi_keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_konfigurasi`
--

INSERT INTO `cbt_konfigurasi` (`konfigurasi_id`, `konfigurasi_kode`, `konfigurasi_isi`, `konfigurasi_keterangan`) VALUES
(1, 'link_login_operator', 'ya', 'Menampilkan Link Login Operator'),
(2, 'cbt_nama', 'SMA NEGERI 1 KOBA', 'Nama Penyelenggara ZYACBT'),
(3, 'cbt_keterangan', 'Ujian Online', 'Keterangan Penyelenggara ZYACBT'),
(4, 'cbt_mobile_lock_xambro', 'tidak', 'Melakukan Lock pada browser mobile agar menggunakan Xambro Saja'),
(5, 'cbt_informasi', '<p>Silahkan pilih Tes yang diikuti dari daftar tes yang tersedia dibawah ini. Apabila tes tidak muncul, silahkan menghubungi Operator yang bertugas.</p>\r\n', 'Informasi yang diberika di Dashboard peserta tes\''),
(6, 'proteksi_multilogin', 'ya', 'Proteksi MultiLogin Peserta Tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_modul`
--

CREATE TABLE `cbt_modul` (
  `modul_id` bigint(20) UNSIGNED NOT NULL,
  `modul_nama` varchar(255) NOT NULL,
  `modul_aktif` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `cbt_modul`
--

INSERT INTO `cbt_modul` (`modul_id`, `modul_nama`, `modul_aktif`) VALUES
(9, 'Default', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_sessions`
--

CREATE TABLE `cbt_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `cbt_sessions`
--

INSERT INTO `cbt_sessions` (`id`, `ip_address`, `timestamp`, `data`, `ts`) VALUES
('2d9ms2701roh6ikdgo45cmerniq39kt7', '::1', 1773028137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737333032383133373b6362745f757365725f69647c733a31363a2270726f6b746f72736d616e316b6f6261223b6362745f6e616d617c733a373a2250726f6b746f72223b6362745f6c6576656c7c733a353a2261646d696e223b6362745f6f707369317c733a303a22223b6362745f6f707369327c733a303a22223b, '2026-03-09 03:48:57'),
('79qkcmnr7fo2sf9kbtnqi7c8r8vm6ukr', '::1', 1773031242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737333033313038303b6362745f757365725f69647c733a31363a2270726f6b746f72736d616e316b6f6261223b6362745f6e616d617c733a373a2250726f6b746f72223b6362745f6c6576656c7c733a353a2261646d696e223b6362745f6f707369317c733a303a22223b6362745f6f707369327c733a303a22223b, '2026-03-09 04:38:00'),
('hd90jobuphe6omfdn69oaakbrs0n5ih9', '::1', 1773031080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737333033313038303b6362745f757365725f69647c733a31363a2270726f6b746f72736d616e316b6f6261223b6362745f6e616d617c733a373a2250726f6b746f72223b6362745f6c6576656c7c733a353a2261646d696e223b6362745f6f707369317c733a303a22223b6362745f6f707369327c733a303a22223b, '2026-03-09 03:53:58'),
('tkom1b144btc562qi1giqqe13mteum5u', '::1', 1773028438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737333032383433383b6362745f757365725f69647c733a31363a2270726f6b746f72736d616e316b6f6261223b6362745f6e616d617c733a373a2250726f6b746f72223b6362745f6c6576656c7c733a353a2261646d696e223b6362745f6f707369317c733a303a22223b6362745f6f707369327c733a303a22223b, '2026-03-09 03:43:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_soal`
--

CREATE TABLE `cbt_soal` (
  `soal_id` bigint(20) UNSIGNED NOT NULL,
  `soal_topik_id` bigint(20) UNSIGNED NOT NULL,
  `soal_detail` text NOT NULL,
  `soal_tipe` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=Pilihan ganda, 2=essay, 3=jawaban singkat',
  `soal_kunci` text DEFAULT NULL COMMENT 'Kunci untuk soal jawaban singkat',
  `soal_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `soal_aktif` tinyint(1) NOT NULL DEFAULT 0,
  `soal_audio` varchar(200) DEFAULT NULL,
  `soal_audio_play` int(11) NOT NULL DEFAULT 0,
  `soal_timer` smallint(10) DEFAULT NULL,
  `soal_inline_answers` tinyint(1) NOT NULL DEFAULT 0,
  `soal_auto_next` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes`
--

CREATE TABLE `cbt_tes` (
  `tes_id` bigint(20) UNSIGNED NOT NULL,
  `tes_nama` varchar(255) NOT NULL,
  `tes_detail` text NOT NULL,
  `tes_begin_time` datetime DEFAULT NULL,
  `tes_end_time` datetime DEFAULT NULL,
  `tes_duration_time` smallint(10) UNSIGNED NOT NULL DEFAULT 0,
  `tes_ip_range` varchar(255) NOT NULL DEFAULT '*.*.*.*',
  `tes_results_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_detail_to_users` tinyint(1) NOT NULL DEFAULT 0,
  `tes_score_right` decimal(10,2) DEFAULT 1.00,
  `tes_score_wrong` decimal(10,2) DEFAULT 0.00,
  `tes_score_unanswered` decimal(10,2) DEFAULT 0.00,
  `tes_max_score` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tes_token` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tesgrup`
--

CREATE TABLE `cbt_tesgrup` (
  `tstgrp_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tstgrp_grup_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes_soal`
--

CREATE TABLE `cbt_tes_soal` (
  `tessoal_id` bigint(20) UNSIGNED NOT NULL,
  `tessoal_tesuser_id` bigint(20) UNSIGNED NOT NULL,
  `tessoal_user_ip` varchar(39) DEFAULT NULL,
  `tessoal_soal_id` bigint(20) UNSIGNED NOT NULL,
  `tessoal_jawaban_text` text DEFAULT NULL,
  `tessoal_nilai` decimal(10,2) DEFAULT NULL,
  `tessoal_creation_time` datetime DEFAULT NULL,
  `tessoal_display_time` datetime DEFAULT NULL,
  `tessoal_change_time` datetime DEFAULT NULL,
  `tessoal_reaction_time` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_ragu` int(1) NOT NULL DEFAULT 0 COMMENT '1=ragu, 0=tidak ragu',
  `tessoal_order` smallint(6) NOT NULL DEFAULT 1,
  `tessoal_num_answers` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `tessoal_comment` text DEFAULT NULL,
  `tessoal_audio_play` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes_soal_jawaban`
--

CREATE TABLE `cbt_tes_soal_jawaban` (
  `soaljawaban_tessoal_id` bigint(20) UNSIGNED NOT NULL,
  `soaljawaban_jawaban_id` bigint(20) UNSIGNED NOT NULL,
  `soaljawaban_selected` smallint(6) NOT NULL DEFAULT -1,
  `soaljawaban_order` smallint(6) NOT NULL DEFAULT 1,
  `soaljawaban_position` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes_token`
--

CREATE TABLE `cbt_tes_token` (
  `token_id` int(11) NOT NULL,
  `token_isi` varchar(20) NOT NULL,
  `token_user_id` int(11) NOT NULL,
  `token_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_aktif` int(11) NOT NULL DEFAULT 1 COMMENT 'Umur Token dalam menit, 1 = 1 hari penuh',
  `token_tes_id` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `cbt_tes_token`
--

INSERT INTO `cbt_tes_token` (`token_id`, `token_isi`, `token_user_id`, `token_ts`, `token_aktif`, `token_tes_id`) VALUES
(13, 'BE7D24', 1, '2026-03-05 21:12:11', 5, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes_topik_set`
--

CREATE TABLE `cbt_tes_topik_set` (
  `tset_id` bigint(20) UNSIGNED NOT NULL,
  `tset_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tset_topik_id` bigint(20) UNSIGNED NOT NULL,
  `tset_tipe` smallint(6) NOT NULL DEFAULT 1,
  `tset_difficulty` smallint(6) NOT NULL DEFAULT 1,
  `tset_jumlah` smallint(6) NOT NULL DEFAULT 1,
  `tset_jawaban` smallint(6) NOT NULL DEFAULT 0,
  `tset_acak_jawaban` int(11) NOT NULL DEFAULT 1,
  `tset_acak_soal` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_tes_user`
--

CREATE TABLE `cbt_tes_user` (
  `tesuser_id` bigint(20) UNSIGNED NOT NULL,
  `tesuser_tes_id` bigint(20) UNSIGNED NOT NULL,
  `tesuser_user_id` bigint(20) UNSIGNED NOT NULL,
  `tesuser_status` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `tesuser_creation_time` datetime NOT NULL,
  `tesuser_comment` text DEFAULT NULL,
  `tesuser_token` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_topik`
--

CREATE TABLE `cbt_topik` (
  `topik_id` bigint(20) UNSIGNED NOT NULL,
  `topik_modul_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `topik_nama` varchar(255) NOT NULL,
  `topik_detail` text DEFAULT NULL,
  `topik_aktif` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_user`
--

CREATE TABLE `cbt_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_login` int(11) NOT NULL DEFAULT 0 COMMENT ' 	0=Tidak Login, 1=Login ',
  `user_login_date` date DEFAULT NULL,
  `user_grup_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_regdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_ip` varchar(39) DEFAULT NULL,
  `user_firstname` varchar(255) DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_birthplace` varchar(255) DEFAULT NULL,
  `user_level` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `user_detail` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cbt_user_grup`
--

CREATE TABLE `cbt_user_grup` (
  `grup_id` bigint(20) UNSIGNED NOT NULL,
  `grup_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `opsi1` varchar(75) NOT NULL,
  `opsi2` varchar(75) NOT NULL,
  `keterangan` varchar(150) NOT NULL,
  `level` varchar(50) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `opsi1`, `opsi2`, `keterangan`, `level`, `ts`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Achmad Lutfi', '', '', '', 'admin', '2015-07-29 18:12:03'),
(6, 'proktorsman1koba', '93aed8046cb8a94a2fd96cdd9c05b17c1cc6bfe9', 'Proktor', '', '', 'Operator Ujian', 'admin', '2026-03-06 03:26:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_akses`
--

CREATE TABLE `user_akses` (
  `id` int(11) NOT NULL,
  `level` varchar(75) NOT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `add` int(2) NOT NULL DEFAULT 1 COMMENT '0=false, 1=true',
  `edit` int(2) NOT NULL DEFAULT 1 COMMENT '0=false, 1=true'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_akses`
--

INSERT INTO `user_akses` (`id`, `level`, `kode_menu`, `add`, `edit`) VALUES
(254, 'operator-soal', 'modul-daftar', 1, 1),
(255, 'operator-soal', 'modul-filemanager', 1, 1),
(256, 'operator-soal', 'modul-import', 1, 1),
(257, 'operator-soal', 'modul-soal', 1, 1),
(258, 'operator-soal', 'modul-topik', 1, 1),
(259, 'operator-tes', 'tes-hasil-operator', 1, 1),
(260, 'operator-tes', 'tes-token', 1, 1),
(505, 'admin', 'laporan-analisis-butir-soal', 1, 1),
(506, 'admin', 'peserta-kartu', 1, 1),
(507, 'admin', 'peserta-group', 1, 1),
(508, 'admin', 'peserta-daftar', 1, 1),
(509, 'admin', 'modul-daftar', 1, 1),
(510, 'admin', 'tes-daftar', 1, 1),
(511, 'admin', 'tool-backup', 1, 1),
(512, 'admin', 'tes-evaluasi', 1, 1),
(513, 'admin', 'tool-exportimport-soal', 1, 1),
(514, 'admin', 'modul-filemanager', 1, 1),
(515, 'admin', 'tes-hasil', 1, 1),
(516, 'admin', 'peserta-import', 1, 1),
(517, 'admin', 'modul-import', 1, 1),
(518, 'admin', 'modul-import-word', 1, 1),
(519, 'admin', 'user_level', 1, 1),
(520, 'admin', 'user_menu', 1, 1),
(521, 'admin', 'user_atur', 1, 1),
(522, 'admin', 'user-zyacbt', 1, 1),
(523, 'admin', 'laporan-rekap', 1, 1),
(524, 'admin', 'peserta-reset', 1, 1),
(525, 'admin', 'modul-soal', 1, 1),
(526, 'admin', 'tes-tambah', 1, 1),
(527, 'admin', 'tes-token', 1, 1),
(528, 'admin', 'modul-topik', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id`, `level`, `keterangan`) VALUES
(1, 'admin', 'Administrator'),
(7, 'operator-soal', 'Operator Soal'),
(8, 'operator-tes', 'Operator Tes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `log` varchar(250) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `tipe` int(11) NOT NULL DEFAULT 1 COMMENT '0=parent, 1=child',
  `parent` varchar(50) DEFAULT NULL,
  `kode_menu` varchar(50) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `url` varchar(150) NOT NULL DEFAULT '#',
  `icon` varchar(75) NOT NULL DEFAULT 'fa fa-circle-o',
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `tipe`, `parent`, `kode_menu`, `nama_menu`, `url`, `icon`, `urutan`) VALUES
(1, 0, '', 'user', 'Pengaturan', '#', 'fa fa-user', 20),
(3, 1, 'user', 'user_atur', 'Pengaturan User', 'manager/useratur', 'fa fa-circle-o', 5),
(4, 1, 'user', 'user_level', 'Pengaturan Level', 'manager/userlevel', 'fa fa-circle-o', 6),
(5, 1, 'user', 'user_menu', 'Pengaturan Menu', 'manager/usermenu', 'fa fa-circle-o', 7),
(6, 0, '', 'modul', 'Data Modul', '#', 'fa fa-book', 2),
(7, 1, 'modul', 'modul-daftar', 'Daftar Soal', 'manager/modul_daftar', 'fa fa-circle-o', 5),
(8, 1, 'modul', 'modul-topik', 'Topik', 'manager/modul_topik', 'fa fa-circle-o', 2),
(10, 0, '', 'peserta', 'Data Peserta', '#', 'fa fa-users', 3),
(11, 1, 'peserta', 'peserta-daftar', 'Daftar Peserta', 'manager/peserta_daftar', 'fa fa-circle-o', 2),
(12, 1, 'peserta', 'peserta-group', 'Daftar Group', 'manager/peserta_group', 'fa fa-circle-o', 1),
(13, 1, 'peserta', 'peserta-import', 'Import Data Peserta', 'manager/peserta_import', 'fa fa-circle-o', 3),
(14, 0, '', 'tes', 'Data Tes', '#', 'fa fa-tasks', 4),
(15, 1, 'tes', 'tes-tambah', 'Tambah Tes', 'manager/tes_tambah', 'fa fa-circle-o', 1),
(16, 1, 'tes', 'tes-daftar', 'Daftar Tes', 'manager/tes_daftar', 'fa fa-circle-o', 2),
(17, 1, 'tes', 'tes-hasil', 'Hasil Tes', 'manager/tes_hasil', 'fa fa-circle-o', 6),
(18, 1, 'modul', 'modul-soal', 'Soal', 'manager/modul_soal', 'fa fa-circle-o', 3),
(19, 1, 'tes', 'tes-token', 'Token', 'manager/tes_token', 'fa fa-circle-o', 8),
(22, 1, 'modul', 'modul-filemanager', 'File Manager', 'manager/modul_filemanager', 'fa fa-circle-o', 6),
(24, 1, 'modul', 'modul-import', 'Import Soal Spreadsheet', 'manager/modul_import', 'fa fa-circle-o', 4),
(25, 1, 'tes', 'tes-evaluasi', 'Evaluasi Tes', 'manager/tes_evaluasi', 'fa fa-circle-o', 5),
(28, 1, 'tes', 'tes-hasil-operator', 'Hasil Tes Operator', 'manager/tes_hasil_operator', 'fa fa-circle-o', 10),
(30, 0, '', 'tool', 'Tool', '#', 'fa fa-wrench', 6),
(31, 1, 'tool', 'tool-backup', 'Database', 'manager/tool_backup', 'fa fa-database', 1),
(32, 1, 'tes-laporan', 'laporan-rekap', 'Rekap Hasil Tes', 'manager/laporan_rekap_hasil', 'fa fa-circle-o', 7),
(33, 1, 'tool', 'tool-exportimport-soal', 'Export / Import Soal', 'manager/tool_exportimport_soal', 'fa fa-circle-o', 2),
(34, 1, 'user', 'user-zyacbt', 'Pengaturan CBT', 'manager/pengaturan_zyacbt', 'fa fa-circle-o', 1),
(37, 1, 'peserta', 'peserta-kartu', 'Cetak Kartu', 'manager/peserta_kartu', 'fa fa-circle-o', 5),
(38, 0, '', 'tes-laporan', 'Laporan', '#', 'fa fa-print', 5),
(41, 1, 'tes-laporan', 'laporan-analisis-butir-soal', 'Analisis Butir Soal', 'manager/laporan_analisis_butir_soal', 'fa fa-circle-o', 1),
(42, 1, 'tes-laporan', 'laporan-analisis-soal', 'Analisis Soal', 'manager/laporan_analisis_soal', 'fa fa-circle-o', 2),
(43, 1, 'modul', 'modul-import-word', 'Import Soal Word', 'manager/modul_import_word', 'fa fa-circle-o', 4),
(44, 1, 'peserta', 'peserta-reset', 'Reset Login', 'manager/peserta_reset', 'fa fa-circle-o', 7),
(45, 0, '', 'persiapan', 'Persiapan Ujian', '#', 'fa fa-book', 6),
(46, 1, 'peserta', 'Denah-Peserta', 'Denah Peserta', '#', 'fa fa-circle-o', 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  ADD PRIMARY KEY (`jawaban_id`),
  ADD KEY `p_answer_question_id` (`jawaban_soal_id`);

--
-- Indeks untuk tabel `cbt_konfigurasi`
--
ALTER TABLE `cbt_konfigurasi`
  ADD PRIMARY KEY (`konfigurasi_id`),
  ADD UNIQUE KEY `konfigurasi_kode` (`konfigurasi_kode`);

--
-- Indeks untuk tabel `cbt_modul`
--
ALTER TABLE `cbt_modul`
  ADD PRIMARY KEY (`modul_id`),
  ADD UNIQUE KEY `ak_module_name` (`modul_nama`);

--
-- Indeks untuk tabel `cbt_sessions`
--
ALTER TABLE `cbt_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indeks untuk tabel `cbt_soal`
--
ALTER TABLE `cbt_soal`
  ADD PRIMARY KEY (`soal_id`),
  ADD KEY `p_question_subject_id` (`soal_topik_id`);

--
-- Indeks untuk tabel `cbt_tes`
--
ALTER TABLE `cbt_tes`
  ADD PRIMARY KEY (`tes_id`),
  ADD UNIQUE KEY `ak_test_name` (`tes_nama`);

--
-- Indeks untuk tabel `cbt_tesgrup`
--
ALTER TABLE `cbt_tesgrup`
  ADD PRIMARY KEY (`tstgrp_tes_id`,`tstgrp_grup_id`),
  ADD KEY `p_tstgrp_test_id` (`tstgrp_tes_id`),
  ADD KEY `p_tstgrp_group_id` (`tstgrp_grup_id`);

--
-- Indeks untuk tabel `cbt_tes_soal`
--
ALTER TABLE `cbt_tes_soal`
  ADD PRIMARY KEY (`tessoal_id`),
  ADD UNIQUE KEY `ak_testuser_question` (`tessoal_tesuser_id`,`tessoal_soal_id`),
  ADD KEY `p_testlog_question_id` (`tessoal_soal_id`),
  ADD KEY `p_testlog_testuser_id` (`tessoal_tesuser_id`);

--
-- Indeks untuk tabel `cbt_tes_soal_jawaban`
--
ALTER TABLE `cbt_tes_soal_jawaban`
  ADD PRIMARY KEY (`soaljawaban_tessoal_id`,`soaljawaban_jawaban_id`),
  ADD KEY `p_logansw_answer_id` (`soaljawaban_jawaban_id`),
  ADD KEY `p_logansw_testlog_id` (`soaljawaban_tessoal_id`);

--
-- Indeks untuk tabel `cbt_tes_token`
--
ALTER TABLE `cbt_tes_token`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `token_user_id` (`token_user_id`);

--
-- Indeks untuk tabel `cbt_tes_topik_set`
--
ALTER TABLE `cbt_tes_topik_set`
  ADD PRIMARY KEY (`tset_id`),
  ADD KEY `p_tsubset_test_id` (`tset_tes_id`),
  ADD KEY `tsubset_subject_id` (`tset_topik_id`);

--
-- Indeks untuk tabel `cbt_tes_user`
--
ALTER TABLE `cbt_tes_user`
  ADD PRIMARY KEY (`tesuser_id`),
  ADD UNIQUE KEY `ak_testuser` (`tesuser_tes_id`,`tesuser_user_id`,`tesuser_status`),
  ADD KEY `p_testuser_user_id` (`tesuser_user_id`),
  ADD KEY `p_testuser_test_id` (`tesuser_tes_id`);

--
-- Indeks untuk tabel `cbt_topik`
--
ALTER TABLE `cbt_topik`
  ADD PRIMARY KEY (`topik_id`),
  ADD UNIQUE KEY `ak_subject_name` (`topik_modul_id`,`topik_nama`);

--
-- Indeks untuk tabel `cbt_user`
--
ALTER TABLE `cbt_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `ak_user_name` (`user_name`),
  ADD KEY `user_groups_id` (`user_grup_id`),
  ADD KEY `user_detail` (`user_detail`);

--
-- Indeks untuk tabel `cbt_user_grup`
--
ALTER TABLE `cbt_user_grup`
  ADD PRIMARY KEY (`grup_id`),
  ADD UNIQUE KEY `group_name` (`grup_nama`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `level` (`level`);

--
-- Indeks untuk tabel `user_akses`
--
ALTER TABLE `user_akses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `akses_kode_menu` (`kode_menu`),
  ADD KEY `akses_level` (`level`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `level` (`level`);

--
-- Indeks untuk tabel `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_menu` (`kode_menu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  MODIFY `jawaban_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1376;

--
-- AUTO_INCREMENT untuk tabel `cbt_konfigurasi`
--
ALTER TABLE `cbt_konfigurasi`
  MODIFY `konfigurasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `cbt_modul`
--
ALTER TABLE `cbt_modul`
  MODIFY `modul_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `cbt_soal`
--
ALTER TABLE `cbt_soal`
  MODIFY `soal_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT untuk tabel `cbt_tes`
--
ALTER TABLE `cbt_tes`
  MODIFY `tes_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `cbt_tes_soal`
--
ALTER TABLE `cbt_tes_soal`
  MODIFY `tessoal_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `cbt_tes_token`
--
ALTER TABLE `cbt_tes_token`
  MODIFY `token_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `cbt_tes_topik_set`
--
ALTER TABLE `cbt_tes_topik_set`
  MODIFY `tset_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `cbt_tes_user`
--
ALTER TABLE `cbt_tes_user`
  MODIFY `tesuser_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cbt_topik`
--
ALTER TABLE `cbt_topik`
  MODIFY `topik_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `cbt_user`
--
ALTER TABLE `cbt_user`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `cbt_user_grup`
--
ALTER TABLE `cbt_user_grup`
  MODIFY `grup_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `user_akses`
--
ALTER TABLE `user_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cbt_jawaban`
--
ALTER TABLE `cbt_jawaban`
  ADD CONSTRAINT `cbt_jawaban_ibfk_1` FOREIGN KEY (`jawaban_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_soal`
--
ALTER TABLE `cbt_soal`
  ADD CONSTRAINT `cbt_soal_ibfk_1` FOREIGN KEY (`soal_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_tesgrup`
--
ALTER TABLE `cbt_tesgrup`
  ADD CONSTRAINT `cbt_tesgrup_ibfk_1` FOREIGN KEY (`tstgrp_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tesgrup_ibfk_2` FOREIGN KEY (`tstgrp_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_tes_soal`
--
ALTER TABLE `cbt_tes_soal`
  ADD CONSTRAINT `cbt_tes_soal_ibfk_1` FOREIGN KEY (`tessoal_tesuser_id`) REFERENCES `cbt_tes_user` (`tesuser_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_soal_ibfk_2` FOREIGN KEY (`tessoal_soal_id`) REFERENCES `cbt_soal` (`soal_id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_tes_soal_jawaban`
--
ALTER TABLE `cbt_tes_soal_jawaban`
  ADD CONSTRAINT `cbt_tes_soal_jawaban_ibfk_1` FOREIGN KEY (`soaljawaban_tessoal_id`) REFERENCES `cbt_tes_soal` (`tessoal_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_soal_jawaban_ibfk_2` FOREIGN KEY (`soaljawaban_jawaban_id`) REFERENCES `cbt_jawaban` (`jawaban_id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_tes_token`
--
ALTER TABLE `cbt_tes_token`
  ADD CONSTRAINT `cbt_tes_token_ibfk_1` FOREIGN KEY (`token_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `cbt_tes_topik_set`
--
ALTER TABLE `cbt_tes_topik_set`
  ADD CONSTRAINT `cbt_tes_topik_set_ibfk_1` FOREIGN KEY (`tset_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `cbt_tes_topik_set_ibfk_2` FOREIGN KEY (`tset_topik_id`) REFERENCES `cbt_topik` (`topik_id`) ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_tes_user`
--
ALTER TABLE `cbt_tes_user`
  ADD CONSTRAINT `cbt_tes_user_ibfk_1` FOREIGN KEY (`tesuser_tes_id`) REFERENCES `cbt_tes` (`tes_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cbt_tes_user_ibfk_2` FOREIGN KEY (`tesuser_user_id`) REFERENCES `cbt_user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_topik`
--
ALTER TABLE `cbt_topik`
  ADD CONSTRAINT `cbt_topik_ibfk_1` FOREIGN KEY (`topik_modul_id`) REFERENCES `cbt_modul` (`modul_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `cbt_user`
--
ALTER TABLE `cbt_user`
  ADD CONSTRAINT `cbt_user_ibfk_1` FOREIGN KEY (`user_grup_id`) REFERENCES `cbt_user_grup` (`grup_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user_akses`
--
ALTER TABLE `user_akses`
  ADD CONSTRAINT `user_akses_ibfk_2` FOREIGN KEY (`kode_menu`) REFERENCES `user_menu` (`kode_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_akses_ibfk_3` FOREIGN KEY (`level`) REFERENCES `user_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
