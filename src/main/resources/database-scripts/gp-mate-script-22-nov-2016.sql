-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: medical-manager.cdy6fjajciob.us-west-2.rds.amazonaws.com    Database: medical_manager
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `chat_medical_session`
--

DROP TABLE IF EXISTS `chat_medical_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_medical_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) DEFAULT NULL,
  `practice_id` bigint(20) DEFAULT NULL,
  `session_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ssmw6enl02jm12p3bgua57qvq` (`doctor_id`),
  KEY `FK_aibkfgslrl0qndpdenyu690c4` (`practice_id`),
  KEY `FK_mntxr09lbggec45jao50pj867` (`session_id`),
  CONSTRAINT `FK_aibkfgslrl0qndpdenyu690c4` FOREIGN KEY (`practice_id`) REFERENCES `practice_place` (`id`),
  CONSTRAINT `FK_mntxr09lbggec45jao50pj867` FOREIGN KEY (`session_id`) REFERENCES `medical_session` (`id`),
  CONSTRAINT `FK_ssmw6enl02jm12p3bgua57qvq` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_medical_session`
--

LOCK TABLES `chat_medical_session` WRITE;
/*!40000 ALTER TABLE `chat_medical_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_medical_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_medical_session_message`
--

DROP TABLE IF EXISTS `chat_medical_session_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_medical_session_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `message_user_to_patient` bit(1) NOT NULL,
  `chat_session_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c5ikw5jlnjn2v3gjpcypyj9io` (`chat_session_id`),
  CONSTRAINT `FK_c5ikw5jlnjn2v3gjpcypyj9io` FOREIGN KEY (`chat_session_id`) REFERENCES `chat_medical_session` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_medical_session_message`
--

LOCK TABLES `chat_medical_session_message` WRITE;
/*!40000 ALTER TABLE `chat_medical_session_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_medical_session_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key_col` varchar(255) NOT NULL,
  `value_col` varchar(255) DEFAULT NULL,
  `practice_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `configurations_key_col` (`key_col`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (4,'maxNoOfProblemBoxes','4',NULL),(5,'timeInMinutes','15',NULL),(6,'genericEmailAddress','no-reply@gpmate.co.uk',NULL);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `image_profile_id` bigint(20) DEFAULT NULL,
  `practice_association_logged_id` bigint(20) DEFAULT NULL,
  `welcome_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3q0j5r6i4e9k3afhypo6uljph` (`user_id`),
  KEY `FK_dp1sid2mj72seyue9ohbfbj8m` (`image_profile_id`),
  KEY `FK_thop6jfgxopeshefpbg42div9` (`practice_association_logged_id`),
  CONSTRAINT `FK_3q0j5r6i4e9k3afhypo6uljph` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_dp1sid2mj72seyue9ohbfbj8m` FOREIGN KEY (`image_profile_id`) REFERENCES `image_entity` (`id`),
  CONSTRAINT `FK_thop6jfgxopeshefpbg42div9` FOREIGN KEY (`practice_association_logged_id`) REFERENCES `doctor_practice_place_association` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_practice_place_association`
--

DROP TABLE IF EXISTS `doctor_practice_place_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor_practice_place_association` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` int(11) DEFAULT NULL,
  `doctor_id` bigint(20) NOT NULL,
  `practice_place_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ildndcu3ia88st4ngoubqwkd5` (`doctor_id`),
  KEY `FK_pt4qjkg6x1yxg9g7w36msk6qe` (`practice_place_id`),
  CONSTRAINT `FK_ildndcu3ia88st4ngoubqwkd5` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `FK_pt4qjkg6x1yxg9g7w36msk6qe` FOREIGN KEY (`practice_place_id`) REFERENCES `practice_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_practice_place_association`
--

LOCK TABLES `doctor_practice_place_association` WRITE;
/*!40000 ALTER TABLE `doctor_practice_place_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_practice_place_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_entity`
--

DROP TABLE IF EXISTS `image_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo` longblob,
  `extension` varchar(255) DEFAULT NULL,
  `has_photo` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_entity`
--

LOCK TABLES `image_entity` WRITE;
/*!40000 ALTER TABLE `image_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_session`
--

DROP TABLE IF EXISTS `medical_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `finish_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `doctor_id` bigint(20) DEFAULT NULL,
  `patient_id` bigint(20) NOT NULL,
  `practice_place_id` bigint(20) NOT NULL,
  `available_to_be_taken` bit(1) NOT NULL,
  `open` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i7vx2ahgvieqj9t28ap3h8gsr` (`doctor_id`),
  KEY `FK_mqdroen5060ygm4els77ki6um` (`patient_id`),
  KEY `FK_qp2vlla4uvkyft7yj1u6l72ac` (`practice_place_id`),
  CONSTRAINT `FK_i7vx2ahgvieqj9t28ap3h8gsr` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `FK_mqdroen5060ygm4els77ki6um` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FK_qp2vlla4uvkyft7yj1u6l72ac` FOREIGN KEY (`practice_place_id`) REFERENCES `practice_place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_session`
--

LOCK TABLES `medical_session` WRITE;
/*!40000 ALTER TABLE `medical_session` DISABLE KEYS */;

/*!40000 ALTER TABLE `medical_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_practice_place`
--

DROP TABLE IF EXISTS `notification_practice_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_practice_place` (
  `notification_type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime DEFAULT NULL,
  `medical_session_notification_type` int(11) DEFAULT NULL,
  `practice_id` bigint(20) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_12vop7uncbtj519m99cdqpj4` (`practice_id`),
  KEY `FK_4vdjqpt5edqil5gn8j865rfpn` (`session_id`),
  CONSTRAINT `FK_12vop7uncbtj519m99cdqpj4` FOREIGN KEY (`practice_id`) REFERENCES `practice_place` (`id`),
  CONSTRAINT `FK_4vdjqpt5edqil5gn8j865rfpn` FOREIGN KEY (`session_id`) REFERENCES `medical_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_practice_place`
--

LOCK TABLES `notification_practice_place` WRITE;
/*!40000 ALTER TABLE `notification_practice_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_practice_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_birth` datetime DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `gcm_id` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6i3fp8wcdxk473941mbcvdao4` (`user_id`),
  KEY `patient_name` (`name`),
  KEY `patient_lastname` (`lastname`),
  CONSTRAINT `FK_6i3fp8wcdxk473941mbcvdao4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practice_place`
--

DROP TABLE IF EXISTS `practice_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `practice_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `interacting_password` varchar(255) DEFAULT NULL,
  `practice_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `image_profile_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1a590fo2pr7lu2kxgm2mnl48j` (`user_id`),
  KEY `FK_j502jnfq1oew8ynod7qli5j5n` (`image_profile_id`),
  KEY `practice_practice_id` (`practice_id`),
  CONSTRAINT `FK_1a590fo2pr7lu2kxgm2mnl48j` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_j502jnfq1oew8ynod7qli5j5n` FOREIGN KEY (`image_profile_id`) REFERENCES `image_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12373 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practice_place`
--

LOCK TABLES `practice_place` WRITE;
/*!40000 ALTER TABLE `practice_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `practice_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'PRACTICE_ADMIN'),(2,'DOCTOR');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer1` varchar(100) DEFAULT NULL,
  `answer2` varchar(10) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rbxc15ut8up0jw3ctoip2v6vs` (`session_id`),
  CONSTRAINT `FK_rbxc15ut8up0jw3ctoip2v6vs` FOREIGN KEY (`session_id`) REFERENCES `medical_session` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `activation_state` bit(1) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_username` (`username`),
  KEY `user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FK_it77eq964jhfqtu54081ebtio` (`role_id`),
  KEY `FK_apcc8lxk2xnug8377fatvbn04` (`user_id`),
  CONSTRAINT `FK_apcc8lxk2xnug8377fatvbn04` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_it77eq964jhfqtu54081ebtio` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (52,1),(53,2),(54,1),(55,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medical_manager'
--

--
-- Dumping routines for database 'medical_manager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-22 19:37:45
