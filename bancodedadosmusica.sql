-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: musica
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_album` varchar(45) NOT NULL,
  `ano_lancamento` year(4) NOT NULL,
  `nome_banda` varchar(45) NOT NULL,
  `banda_ID_FK` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_ID`),
  KEY `banda_ID_FK` (`banda_ID_FK`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`banda_ID_FK`) REFERENCES `banda` (`banda_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Concentrado',2012,'GNR',1),(2,'Brothers in Arms',1985,'Dire Straits',2),(3,'Making Movies',1980,'Dire Straits',2),(4,'Reckless 30th Anniversary',1984,'Bryan Adams',3),(5,'Ao vivo em São Paulo',2017,'Maneva',4);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_participacao`
--

DROP TABLE IF EXISTS `artista_participacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista_participacao` (
  `artista_participacao_ID` int(11) NOT NULL AUTO_INCREMENT,
  `musica_ID_FK` int(11) DEFAULT NULL,
  `banda_ID_FK` int(11) DEFAULT NULL,
  `produtor_ID_FK` int(11) DEFAULT NULL,
  `papel_participacao` varchar(45) NOT NULL,
  `nome_participacao` varchar(255) NOT NULL,
  PRIMARY KEY (`artista_participacao_ID`),
  KEY `musica_ID_FK` (`musica_ID_FK`),
  KEY `banda_ID_FK` (`banda_ID_FK`),
  KEY `produtor_ID_FK` (`produtor_ID_FK`),
  CONSTRAINT `artista_participacao_ibfk_1` FOREIGN KEY (`musica_ID_FK`) REFERENCES `musica` (`musica_ID`),
  CONSTRAINT `artista_participacao_ibfk_2` FOREIGN KEY (`banda_ID_FK`) REFERENCES `banda` (`banda_ID`),
  CONSTRAINT `artista_participacao_ibfk_3` FOREIGN KEY (`produtor_ID_FK`) REFERENCES `produtor` (`produtor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_participacao`
--

LOCK TABLES `artista_participacao` WRITE;
/*!40000 ALTER TABLE `artista_participacao` DISABLE KEYS */;
INSERT INTO `artista_participacao` VALUES (1,44,3,5,'Cantor','Tina Turner'),(2,48,4,7,'Cantor','Di Ferrero');
/*!40000 ALTER TABLE `artista_participacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banda`
--

DROP TABLE IF EXISTS `banda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banda` (
  `banda_ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_banda` varchar(45) NOT NULL,
  `tipo` enum('solo','grupo') NOT NULL,
  `data_inicio` year(4) NOT NULL,
  `data_fim` year(4) DEFAULT NULL,
  PRIMARY KEY (`banda_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banda`
--

LOCK TABLES `banda` WRITE;
/*!40000 ALTER TABLE `banda` DISABLE KEYS */;
INSERT INTO `banda` VALUES (1,'GNR','grupo',1980,NULL),(2,'Dire Straits','grupo',1977,1995),(3,'Bryan Adams','solo',1977,NULL),(4,'Maneva','grupo',2005,NULL);
/*!40000 ALTER TABLE `banda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositor`
--

DROP TABLE IF EXISTS `compositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositor` (
  `compositor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compositor` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`compositor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositor`
--

LOCK TABLES `compositor` WRITE;
/*!40000 ALTER TABLE `compositor` DISABLE KEYS */;
INSERT INTO `compositor` VALUES (1,'Tóli César Machado','1961-06-08'),(3,'Rui Reininho','1955-02-28'),(4,'Jorge Romão','1963-10-09'),(5,'Mark Knopfler','1949-08-12'),(6,'Sting','1951-10-02'),(7,'Bryan Adams','1959-11-05'),(8,'Bob Clearmountain','1953-01-16'),(9,'Tales Mello De Polli','1981-03-09');
/*!40000 ALTER TABLE `compositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `musica_ID` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(75) NOT NULL,
  `duracao` decimal(11,2) NOT NULL,
  `album_ID_FK` int(11) DEFAULT NULL,
  `compositor_ID_FK` int(11) DEFAULT NULL,
  `banda_ID_FK` int(11) DEFAULT NULL,
  `produtor_ID_FK` int(11) DEFAULT NULL,
  `letra` text,
  PRIMARY KEY (`musica_ID`),
  KEY `album_ID_FK` (`album_ID_FK`),
  KEY `compositor_ID_FK` (`compositor_ID_FK`),
  KEY `banda_ID_FK` (`banda_ID_FK`),
  KEY `produtor_ID_FK` (`produtor_ID_FK`),
  CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`album_ID_FK`) REFERENCES `album` (`album_ID`),
  CONSTRAINT `musica_ibfk_2` FOREIGN KEY (`compositor_ID_FK`) REFERENCES `compositor` (`compositor_ID`),
  CONSTRAINT `musica_ibfk_3` FOREIGN KEY (`banda_ID_FK`) REFERENCES `banda` (`banda_ID`),
  CONSTRAINT `musica_ibfk_4` FOREIGN KEY (`produtor_ID_FK`) REFERENCES `produtor` (`produtor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

LOCK TABLES `musica` WRITE;
/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'Sangue Oculto',5.13,1,1,1,1,NULL),(2,'Video maria',4.41,1,3,1,2,NULL),(3,'Efectivamente',3.17,1,4,1,2,NULL),(4,'Dunas',3.33,1,4,1,2,NULL),(5,'Ana Lee',3.19,1,3,1,2,NULL),(6,'Pronúncia do norte',3.27,1,3,1,2,NULL),(7,'Morte ao sol',4.44,1,4,1,2,NULL),(8,'+ Vale nunca',5.26,1,3,1,2,NULL),(9,'Quero que vá pró inferno',2.40,1,4,1,2,NULL),(10,'Asas',3.52,1,3,1,2,NULL),(11,'Saliva',3.38,1,4,1,2,NULL),(12,'Hardcore (1º Escalão)',4.23,1,3,1,2,NULL),(13,'Portugal na CEE',3.34,1,4,1,2,NULL),(14,'Pós modernos',4.27,1,3,1,2,NULL),(15,'Vocês',3.21,1,4,1,2,NULL),(16,'Cais',4.12,1,3,1,2,NULL),(17,'Tirana',4.59,1,4,1,2,NULL),(18,'Las vegas',4.17,1,3,1,2,NULL),(19,'Sub-16',3.21,1,4,1,2,NULL),(20,'Sexta-feira (um seu criado)',3.45,1,4,1,2,NULL),(21,'So far away',5.08,2,5,2,3,NULL),(22,'Money for nothing',8.30,2,6,2,3,NULL),(23,'Walk of life',4.09,2,5,2,3,'Here comes Johnny singing oldies, goldies\r\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\r\nHere comes Johnny singing, \"I Gotta Woman\"\r\nDown in the tunnels, trying to make it pay\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nHe do the song about the sweet lovin\' woman\r\nHe do the song about the knife\r\nHe do the walk, do the walk of life\r\nYeah, he do the walk of life\r\nHere comes Johnny, gonna tell you the story\r\nHand me down my walkin\' shoes\r\nHere comes Johnny with the power and the glory\r\nBackbeat the talkin\' blues\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nThe song about the sweet lovin\' woman\r\nHe do the song about the knife\r\nThen he do the walk, he do the walk of life\r\nYeah, he do the walk of life\r\nHere comes Johnny singing oldies, goldies\r\n\"Be-Bop-A-Lula, \" \"Baby What I Say\"\r\nHere comes Johnny singing, \"I Gotta Woman\"\r\nDown in the tunnels, trying to make it pay\r\nHe got the action, he got the motion\r\nYeah, the boy can play\r\nDedication, devotion\r\nTurning all the night time into the day\r\nAnd after all the violence and double talk\r\nThere\'s just a song in all the trouble and the strife\r\nYou do the walk, yeah, you do the walk of life\r\nHmm, you do the walk of life'),(24,'Your latest trick',6.33,2,5,2,3,NULL),(25,'Why worry?',8.29,2,5,2,3,NULL),(26,'Ride across the river',7.04,2,5,2,3,NULL),(27,'The mans too strong',4.38,2,5,2,3,NULL),(28,'One world',3.38,2,5,2,3,NULL),(29,'Brothers in arms',7.04,2,5,2,3,NULL),(30,'Tunnel of love',8.08,3,5,2,4,NULL),(31,'Romeo and Juliet',8.30,3,5,2,3,NULL),(32,'Skateaway',6.18,3,5,2,4,NULL),(33,'Expresso love',5.03,3,5,2,3,NULL),(34,'Hand in hand',4.49,3,5,2,3,NULL),(35,'Solid rock',3.19,3,5,2,4,NULL),(36,'Les boys',4.06,3,5,2,3,NULL),(37,'One Night Love Affair',4.32,4,7,3,5,NULL),(38,'Shes Only Happy When Shes Dancin',3.14,4,7,3,5,NULL),(39,'Run to You',3.54,4,7,3,6,NULL),(40,'Heaven',4.02,4,7,3,5,NULL),(41,'Somebody',4.44,3,8,3,6,NULL),(42,'Summer of 69',3.35,4,7,3,6,NULL),(43,'Kids Wanna Rock',2.36,4,8,3,5,NULL),(44,'Its Only Love',3.15,4,7,3,5,NULL),(45,'Long Gone',3.57,4,7,3,5,NULL),(46,'Aint Gonna Cry',4.06,4,7,3,5,NULL),(47,'O Destino não quis',3.20,5,9,4,7,NULL),(48,'Seja para mim',3.05,5,9,4,7,NULL),(49,'Saudades do tempo',4.59,5,9,4,7,NULL),(50,'Luz que me traz paz',4.36,5,9,4,7,NULL),(51,'Pisando descalço',3.50,5,9,4,7,NULL),(52,'Deixe-me ir',4.24,5,9,4,7,NULL),(53,'Chuva',2.46,5,9,4,7,NULL),(54,'Reviso meus planos',4.13,5,9,4,7,NULL);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtor`
--

DROP TABLE IF EXISTS `produtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtor` (
  `produtor_ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_produtor` varchar(45) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`produtor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtor`
--

LOCK TABLES `produtor` WRITE;
/*!40000 ALTER TABLE `produtor` DISABLE KEYS */;
INSERT INTO `produtor` VALUES (1,'Remy Walter','1960-01-04'),(2,'GNR','1988-01-11'),(3,'Mark Knopfler','1949-08-12'),(4,'Jimmy Iovine','1953-03-11'),(5,'Bryan Adams','1959-11-05'),(6,'Bob Clearmountain','1953-01-16'),(7,'Thiago Stancev','1988-01-19');
/*!40000 ALTER TABLE `produtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_musica_detalhada`
--

DROP TABLE IF EXISTS `view_musica_detalhada`;
/*!50001 DROP VIEW IF EXISTS `view_musica_detalhada`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_musica_detalhada` AS SELECT 
 1 AS `Música`,
 1 AS `Duração da música em minutos`,
 1 AS `Número do Álbum`,
 1 AS `Nome do Álbum`,
 1 AS `Número do Compositor`,
 1 AS `Nome do Compositor`,
 1 AS `Número da Banda`,
 1 AS `Nome da Banda`,
 1 AS `Número do Produtor`,
 1 AS `Nome do Produtor`,
 1 AS `Letra da Música`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_musica_detalhada`
--

/*!50001 DROP VIEW IF EXISTS `view_musica_detalhada`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_musica_detalhada` AS select `a`.`titulo` AS `Música`,`a`.`duracao` AS `Duração da música em minutos`,`a`.`album_ID_FK` AS `Número do Álbum`,`b`.`nome_album` AS `Nome do Álbum`,`a`.`compositor_ID_FK` AS `Número do Compositor`,`c`.`nome_compositor` AS `Nome do Compositor`,`a`.`banda_ID_FK` AS `Número da Banda`,`d`.`nome_banda` AS `Nome da Banda`,`a`.`produtor_ID_FK` AS `Número do Produtor`,`e`.`nome_produtor` AS `Nome do Produtor`,`a`.`letra` AS `Letra da Música` from ((((`musica` `a` join `album` `b` on((`a`.`album_ID_FK` = `b`.`album_ID`))) join `compositor` `c` on((`a`.`compositor_ID_FK` = `c`.`compositor_ID`))) join `banda` `d` on((`a`.`banda_ID_FK` = `d`.`banda_ID`))) join `produtor` `e` on((`a`.`produtor_ID_FK` = `e`.`produtor_ID`))) where (`a`.`musica_ID` = '23') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09 10:31:52
