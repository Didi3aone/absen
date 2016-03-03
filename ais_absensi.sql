/*
Navicat MySQL Data Transfer

Source Server         : cmos
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : ais_absensi

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-02 16:47:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `absen_masuk`
-- ----------------------------
DROP TABLE IF EXISTS `absen_masuk`;
CREATE TABLE `absen_masuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `foto1` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of absen_masuk
-- ----------------------------

-- ----------------------------
-- Table structure for `absen_pulang`
-- ----------------------------
DROP TABLE IF EXISTS `absen_pulang`;
CREATE TABLE `absen_pulang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jam_pulang` time NOT NULL,
  `foto2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of absen_pulang
-- ----------------------------

-- ----------------------------
-- Table structure for `assigned_roles`
-- ----------------------------
DROP TABLE IF EXISTS `assigned_roles`;
CREATE TABLE `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assigned_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of assigned_roles
-- ----------------------------
INSERT INTO assigned_roles VALUES ('122', '1', '1');
INSERT INTO assigned_roles VALUES ('148', '14', '2');
INSERT INTO assigned_roles VALUES ('149', '15', '2');

-- ----------------------------
-- Table structure for `divisi`
-- ----------------------------
DROP TABLE IF EXISTS `divisi`;
CREATE TABLE `divisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `divisi` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of divisi
-- ----------------------------
INSERT INTO divisi VALUES ('1', 'Holding Company', '2016-03-02 01:06:55', '2016-03-02 01:06:55', '14');
INSERT INTO divisi VALUES ('2', 'Trading', '2016-03-01 23:41:48', '2016-03-01 23:41:48', '1');
INSERT INTO divisi VALUES ('3', 'Feul & Transport', '2016-03-01 23:41:49', '2016-03-01 23:41:49', '1');
INSERT INTO divisi VALUES ('4', 'Project', '2016-03-02 00:53:53', '2016-03-02 00:53:53', '1');
INSERT INTO divisi VALUES ('5', 'IT', '2016-03-02 00:54:16', '2016-03-02 00:54:16', '1');
INSERT INTO divisi VALUES ('6', 'HRD', '2016-03-02 00:54:36', '2016-03-02 00:54:36', '1');

-- ----------------------------
-- Table structure for `karyawan`
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perusahaan` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `nik` varchar(25) NOT NULL,
  `no_ktp` varchar(25) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` varchar(20) NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `tgl_mulai_kerja` date NOT NULL,
  `tgl_kontrak_berakhir` date NOT NULL,
  `penempatan` varchar(50) NOT NULL,
  `gol_jabatan` varchar(3) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `status_karyawan` varchar(20) NOT NULL,
  `status_nikah` varchar(20) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `telp_hp` varchar(20) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO karyawan VALUES ('42', '1', '1', '63140656067', '7371071002740010', 'Ferry Donso', 'Laki-laki', 'Makassar', '1974-06-10', 'Islam', 'A', '2014-06-02', '1970-01-01', 'Makassar', ' A1', '', 'Kontrak', 'Belum Kawin', 'Jl. Muh. Jufri No. 10', '082-121-777-383', '', 'feri', 'feri', '2016-03-01 23:29:31', '2016-03-02 16:46:40', '0');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO permissions VALUES ('1', 'view_administrator', 'View Administrator', '1', '2015-08-08 16:56:36', '2015-11-28 13:09:06');
INSERT INTO permissions VALUES ('2', 'view_admin_hrd', 'View Admin HRD', '0', '2015-08-08 16:56:36', '2016-03-01 23:58:04');
INSERT INTO permissions VALUES ('3', 'view_karyawan', 'View_Karyawan', '0', '2016-03-02 08:59:51', '2016-03-02 08:59:51');

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO permission_role VALUES ('38', '1', '1');
INSERT INTO permission_role VALUES ('53', '2', '2');
INSERT INTO permission_role VALUES ('54', '3', '3');

-- ----------------------------
-- Table structure for `permission_user`
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  KEY `permission_user_user_id_foreign` (`user_id`),
  CONSTRAINT `permission_user_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_user
-- ----------------------------

-- ----------------------------
-- Table structure for `perusahaan`
-- ----------------------------
DROP TABLE IF EXISTS `perusahaan`;
CREATE TABLE `perusahaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perusahaan` varchar(255) NOT NULL,
  `npwp` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of perusahaan
-- ----------------------------
INSERT INTO perusahaan VALUES ('1', 'PT. Anak Indonesia Sukses', '02.821.063.1-805.000', 'Jl. Pelita Raya No 27 A - B Makassar', 'JX73HLw7Tv.jpg', '2016-03-02 01:23:00', '2016-03-02 01:23:00', '14');
INSERT INTO perusahaan VALUES ('2', 'PT. Trans Lestari Mandiri', '02.821.063.1-805.001', 'Jl. Pelita Raya No 27 A - B Makassar', '', '2016-03-02 00:52:44', '2016-03-02 00:52:44', '1');
INSERT INTO perusahaan VALUES ('3', 'PT. Tri Karsa Manunggal', '02.821.063.1-805.001', 'Jl. Pelita Raya', '', '2016-03-02 00:52:46', '2016-03-02 00:52:46', '1');
INSERT INTO perusahaan VALUES ('4', 'PT. Sulawesi AIS Mandiri', '02.821.063.1-805.001', 'Jl. Pelita Raya No 27 A - B Makassar', '', '2016-03-02 00:53:01', '2016-03-02 00:53:01', '1');
INSERT INTO perusahaan VALUES ('5', 'PT. Hikma Global Mandiri', '02.821.063.1-805.001', 'Jl. Pelita Raya No 27 A - B Makassar', '', '2016-03-01 23:39:17', '2016-03-01 23:39:17', '1');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO roles VALUES ('1', 'Administrator', '2015-08-08 16:56:34', '2015-08-08 16:56:34');
INSERT INTO roles VALUES ('2', 'AdminHRD', '2015-08-08 16:56:34', '2016-03-01 23:58:28');
INSERT INTO roles VALUES ('3', 'Karyawan', '2016-03-02 09:00:19', '2016-03-02 09:00:19');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_perusahaan` int(11) DEFAULT NULL,
  `foto` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', 'Administrator', 'admin@ais-hc.com', '$2y$10$O5WyT55SHLbz4Q4geSccHeh2fFZ5kPttugr30UtUsWZsMuoS5lxDi', '1', '97d72dd76e66649a5a006b465e41372f', '1', 'c7w3piXG4eUCPUDzvK6qVjRAWQqP1KsdrO3guBdSF8JoQCbyDImVoaKrCIPj', '1', null, '2015-08-08 16:56:33', '2016-03-02 00:13:14', null);
INSERT INTO users VALUES ('14', 'Reza', 'reza@ais-hc.com', '$2y$10$rVZ35aDp7ye4Y9c4xLuaEe4FX756RUoj5IBKR.edlATMmtqQGtkWC', '1', '4530016f88bdfa0e395e72d486ce5396', '1', 'YiyVSdfTdtYEZ1GlynonG8e9osMbtC0npgLWQ7PZaly7zWaZq22IwItWmWWV', '1', null, '2015-09-14 17:05:32', '2016-03-02 08:58:35', null);
INSERT INTO users VALUES ('15', 'Uci', 'uci@ais-hc.com', '$2y$10$LA5oIn.HIaX3AxCfTI0d2OHZH/g0nkjrphLePnTQAIE2AbKTx.4ra', '1', '180b5d957998d07481094d2ff6f94645', '1', 'tVul2ykIcD0JwTZvahDJIn4NBU2MedG8EkWHpN9hvlTubihwj9MXBBuGQUfn', '1', null, '2015-09-15 13:27:21', '2016-03-01 23:59:41', null);

-- ----------------------------
-- Table structure for `user_providers`
-- ----------------------------
DROP TABLE IF EXISTS `user_providers`;
CREATE TABLE `user_providers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_providers_user_id_foreign` (`user_id`),
  CONSTRAINT `user_providers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users123` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_providers
-- ----------------------------
