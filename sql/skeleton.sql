-- MySQL dump 10.11
--
-- Host: localhost    Database: tv
-- ------------------------------------------------------
-- Server version	5.0.95

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `broadcast_synopsis`
--

DROP TABLE IF EXISTS `broadcast_synopsis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcast_synopsis` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `channel` int(8) unsigned NOT NULL default '0',
  `programme` int(8) unsigned NOT NULL default '0',
  `broadcast` int(8) unsigned NOT NULL default '0',
  `synopsis` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `channel` (`channel`),
  KEY `programme` (`programme`)
) ENGINE=MyISAM AUTO_INCREMENT=2885431 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `broadcasts`
--

DROP TABLE IF EXISTS `broadcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broadcasts` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `programme` int(8) unsigned NOT NULL default '0',
  `channel` int(8) unsigned NOT NULL default '0',
  `broadcast_date` date NOT NULL default '0000-00-00',
  `start_time` time NOT NULL default '00:00:00',
  `end_time` time NOT NULL default '00:00:00',
  `synopsis` int(8) unsigned NOT NULL default '0',
  `sub_title` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `sub_title` (`sub_title`),
  KEY `broadcast_date` (`broadcast_date`,`channel`),
  KEY `channel` (`channel`)
) ENGINE=MyISAM AUTO_INCREMENT=2776389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(4) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '9999',
  `logdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channelid` int(8) unsigned NOT NULL auto_increment,
  `xmltv_id` varchar(100) default NULL,
  `name` varchar(100) NOT NULL default '',
  `logdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `active` enum('y','n') NOT NULL default 'y',
  PRIMARY KEY  (`channelid`)
) ENGINE=MyISAM AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `imdb_id` varchar(8) default NULL,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11410 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episodes` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `programme` int(8) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `season` int(8) unsigned NOT NULL default '0',
  `total_number` int(8) unsigned NOT NULL default '0',
  `number` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `programme` (`programme`),
  KEY `season` (`season`)
) ENGINE=MyISAM AUTO_INCREMENT=32228 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programme`
--

DROP TABLE IF EXISTS `programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programme` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `category` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `title` (`title`),
  KEY `category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=72516 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programme_director`
--

DROP TABLE IF EXISTS `programme_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programme_director` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `programme` int(8) unsigned NOT NULL default '0',
  `director` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `director` (`director`),
  KEY `programme` (`programme`)
) ENGINE=MyISAM AUTO_INCREMENT=32836 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programme_star`
--

DROP TABLE IF EXISTS `programme_star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programme_star` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `programme` int(8) unsigned NOT NULL default '0',
  `star` int(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `star` (`star`),
  KEY `programme` (`programme`)
) ENGINE=MyISAM AUTO_INCREMENT=285782 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `star` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `imdb_id` varchar(8) default NULL,
  `photo` text,
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=81596 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `first_name` varchar(50) NOT NULL default '',
  `second_name` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `password` varchar(50) NOT NULL default '',
  `logdate` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=290 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-25  8:27:43
