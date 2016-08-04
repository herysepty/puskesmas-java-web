# Host: localhost  (Version: 5.5.25a)
# Date: 2014-05-02 10:38:15
# Generator: MySQL-Front 5.2  (Build 5.66)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

DROP DATABASE IF EXISTS `jw_puskesmas`;
CREATE DATABASE `jw_puskesmas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jw_puskesmas`;

#
# Source for table "dokter"
#

DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `nip` varchar(5) NOT NULL DEFAULT '',
  `nm_dokter` varchar(25) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `spesialis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "dokter"
#

INSERT INTO `dokter` VALUES ('D0002','Hery','Jakarta','Umum');

#
# Source for table "pasien"
#

DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien` (
  `no_pasien` varchar(6) NOT NULL DEFAULT '',
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `nm_pasien` varchar(25) DEFAULT NULL,
  `jenkel` varchar(255) DEFAULT NULL,
  `tmp_lahir` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `umur` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `pekerjaan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`no_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "pasien"
#

INSERT INTO `pasien` VALUES ('P0001','herysepty','12345','Hery Septyadi','wanita','Jakarta','1992-09-09','98','Jakarta','0987','0987','Mahasiswa');

#
# Source for table "petugas"
#

DROP TABLE IF EXISTS `petugas`;
CREATE TABLE `petugas` (
  `kd_petugas` varchar(5) NOT NULL DEFAULT '',
  `nm_petugas` varchar(25) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kd_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "petugas"
#

INSERT INTO `petugas` VALUES ('R0002','jfsdh','jfdk');

#
# Source for table "registrasi_pasien"
#

DROP TABLE IF EXISTS `registrasi_pasien`;
CREATE TABLE `registrasi_pasien` (
  `no_pasien` varchar(6) NOT NULL DEFAULT '',
  `nm_pasien` varchar(25) DEFAULT NULL,
  `jenkel` varchar(6) DEFAULT NULL,
  `tmp_lahir` varchar(255) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `umur` varchar(3) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `pekerjaan` varchar(25) DEFAULT NULL,
  `kd_dokter` varchar(5) DEFAULT NULL,
  `kd_ruang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`no_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

#
# Data for table "registrasi_pasien"
#


#
# Source for table "ruangan"
#

DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan` (
  `kd_ruang` varchar(5) NOT NULL DEFAULT '',
  `nm_ruang` varchar(25) DEFAULT NULL,
  `gedung` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`kd_ruang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "ruangan"
#

INSERT INTO `ruangan` VALUES ('R0003','UGD','1B');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
