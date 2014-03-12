CREATE DATABASE  IF NOT EXISTS `wpzf2` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wpzf2`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: wpzf2
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `idaction` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `access` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `idrole` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `acl_roles_has_acl_actions`
--

DROP TABLE IF EXISTS `acl_roles_has_acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_has_acl_actions` (
  `acl_roles_idrole` int(11) NOT NULL,
  `acl_actions_idaction` int(11) NOT NULL,
  PRIMARY KEY (`acl_roles_idrole`,`acl_actions_idaction`),
  KEY `fk_acl_roles_has_acl_actions_acl_actions1_idx` (`acl_actions_idaction`),
  KEY `fk_acl_roles_has_acl_actions_acl_roles_idx` (`acl_roles_idrole`),
  CONSTRAINT `fk_acl_roles_has_acl_actions_acl_roles` FOREIGN KEY (`acl_roles_idrole`) REFERENCES `acl_roles` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acl_roles_has_acl_actions_acl_actions1` FOREIGN KEY (`acl_actions_idaction`) REFERENCES `acl_actions` (`idaction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `idcity` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `states_countries_idcountry` int(11) NOT NULL,
  PRIMARY KEY (`idcity`),
  KEY `fk_cities_states1_idx` (`states_countries_idcountry`),
  CONSTRAINT `fk_cities_states1` FOREIGN KEY (`states_countries_idcountry`) REFERENCES `states` (`countries_idcountry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `idcompanie` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cities_idcity` int(11) NOT NULL,
  PRIMARY KEY (`idcompanie`),
  KEY `fk_companies_cities1_idx` (`cities_idcity`),
  CONSTRAINT `fk_companies_cities1` FOREIGN KEY (`cities_idcity`) REFERENCES `cities` (`idcity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies_has_projects`
--

DROP TABLE IF EXISTS `companies_has_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies_has_projects` (
  `companies_idcompanie` int(11) NOT NULL,
  `projects_idproject` int(11) NOT NULL,
  PRIMARY KEY (`companies_idcompanie`,`projects_idproject`),
  KEY `fk_companies_has_projects_projects1_idx` (`projects_idproject`),
  KEY `fk_companies_has_projects_companies1_idx` (`companies_idcompanie`),
  CONSTRAINT `fk_companies_has_projects_companies1` FOREIGN KEY (`companies_idcompanie`) REFERENCES `companies` (`idcompanie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_companies_has_projects_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `idcontract` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '	',
  `description` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcontract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `idcountry` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcountry`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `idproject` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`idproject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_has_transactions`
--

DROP TABLE IF EXISTS `projects_has_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_has_transactions` (
  `projects_idproject` int(11) NOT NULL,
  `transactions_idtransaction` int(11) NOT NULL,
  `companies_idcompanie` int(11) NOT NULL,
  `users_iduser` int(11) NOT NULL,
  PRIMARY KEY (`transactions_idtransaction`,`companies_idcompanie`),
  KEY `fk_projects_has_transactions_transactions1_idx` (`transactions_idtransaction`),
  KEY `fk_projects_has_transactions_projects1_idx` (`projects_idproject`),
  KEY `fk_projects_has_transactions_companies1_idx` (`companies_idcompanie`),
  KEY `fk_projects_has_transactions_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_projects_has_transactions_projects1` FOREIGN KEY (`projects_idproject`) REFERENCES `projects` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_has_transactions_transactions1` FOREIGN KEY (`transactions_idtransaction`) REFERENCES `transactions` (`idtransaction`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_has_transactions_companies1` FOREIGN KEY (`companies_idcompanie`) REFERENCES `companies` (`idcompanie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_has_transactions_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projects_has_transactions_has_contracts`
--

DROP TABLE IF EXISTS `projects_has_transactions_has_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_has_transactions_has_contracts` (
  `projects_has_transactions_transactions_idtransaction` int(11) NOT NULL,
  `projects_has_transactions_companies_idcompanie` int(11) NOT NULL,
  `contracts_idcontract` int(11) NOT NULL,
  PRIMARY KEY (`projects_has_transactions_transactions_idtransaction`,`projects_has_transactions_companies_idcompanie`,`contracts_idcontract`),
  KEY `fk_projects_has_transactions_has_contracts_contracts1_idx` (`contracts_idcontract`),
  KEY `fk_projects_has_transactions_has_contracts_projects_has_tra_idx` (`projects_has_transactions_transactions_idtransaction`,`projects_has_transactions_companies_idcompanie`),
  CONSTRAINT `fk_projects_has_transactions_has_contracts_projects_has_trans1` FOREIGN KEY (`projects_has_transactions_transactions_idtransaction`, `projects_has_transactions_companies_idcompanie`) REFERENCES `projects_has_transactions` (`transactions_idtransaction`, `companies_idcompanie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_has_transactions_has_contracts_contracts1` FOREIGN KEY (`contracts_idcontract`) REFERENCES `contracts` (`idcontract`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `idstate` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `countries_idcountry` int(11) NOT NULL,
  PRIMARY KEY (`idstate`),
  KEY `fk_states_countries1_idx` (`countries_idcountry`),
  CONSTRAINT `fk_states_countries1` FOREIGN KEY (`countries_idcountry`) REFERENCES `countries` (`idcountry`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `idtransaction` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`idtransaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `cities_idcity` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `fk_users_cities1_idx` (`cities_idcity`),
  CONSTRAINT `fk_users_cities1` FOREIGN KEY (`cities_idcity`) REFERENCES `cities` (`idcity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_acl_roles`
--

DROP TABLE IF EXISTS `users_has_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_acl_roles` (
  `users_iduser` int(11) NOT NULL,
  `acl_roles_idrole` int(11) NOT NULL,
  PRIMARY KEY (`users_iduser`,`acl_roles_idrole`),
  KEY `fk_users_has_acl_roles_acl_roles1_idx` (`acl_roles_idrole`),
  KEY `fk_users_has_acl_roles_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_users_has_acl_roles_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_acl_roles_acl_roles1` FOREIGN KEY (`acl_roles_idrole`) REFERENCES `acl_roles` (`idrole`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_has_companies`
--

DROP TABLE IF EXISTS `users_has_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_has_companies` (
  `users_iduser` int(11) NOT NULL,
  `companies_idcompanie` int(11) NOT NULL,
  PRIMARY KEY (`users_iduser`,`companies_idcompanie`),
  KEY `fk_users_has_companies_companies1_idx` (`companies_idcompanie`),
  KEY `fk_users_has_companies_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_users_has_companies_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_companies_companies1` FOREIGN KEY (`companies_idcompanie`) REFERENCES `companies` (`idcompanie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-12 17:53:35
