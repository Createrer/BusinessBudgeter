/*
SQLyog Community Edition- MySQL GUI v6.15
MySQL - 5.5.8 : Database - businessbudget
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `businessbudget`;

USE `businessbudget`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `accessuser` */

DROP TABLE IF EXISTS `accessuser`;

CREATE TABLE `accessuser` (
  `userid` int(11) NOT NULL,
  `fullname` text,
  `username` text,
  `password` text,
  `validafter` date DEFAULT NULL,
  `validbefore` date DEFAULT NULL,
  `failedloginscount` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accessuser` */

insert  into `accessuser`(`userid`,`fullname`,`username`,`password`,`validafter`,`validbefore`,`failedloginscount`) values (2,'Dinesh','prashant','21232f297a57a5a743894a0e4a801fc3',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;



/*** 17-01-2016 **/
ALTER TABLE STAFF ADD COLUMN  postal_code text;
