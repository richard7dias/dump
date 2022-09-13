CREATE DATABASE  IF NOT EXISTS `cadastro` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cadastro`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: cadastro
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` text,
  `carga` int unsigned DEFAULT NULL,
  `totaulas` int DEFAULT NULL,
  `ano` year DEFAULT '2022',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'HTML5','Curso de HTML5',40,37,2014),(2,'Algoritmos','Lógica de programação',20,15,2014),(3,'Photoshop','Dicas de Photoshop CC',10,8,2014),(4,'Php','Curso de PHP para iniciantes',40,20,2015),(5,'Java','Introdução à linguagem Java',40,29,2015),(6,'My SQL','Banco de dados MySQL',30,15,2016),(7,'Word','Curso completo de Word',40,30,2016);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_assiste_curso`
--

DROP TABLE IF EXISTS `p_assiste_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_assiste_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `idpessoa` int DEFAULT NULL,
  `idcurso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpessoa` (`idpessoa`),
  KEY `idcurso` (`idcurso`),
  CONSTRAINT `p_assiste_curso_ibfk_1` FOREIGN KEY (`idpessoa`) REFERENCES `pessoas` (`id`),
  CONSTRAINT `p_assiste_curso_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_assiste_curso`
--

LOCK TABLES `p_assiste_curso` WRITE;
/*!40000 ALTER TABLE `p_assiste_curso` DISABLE KEYS */;
INSERT INTO `p_assiste_curso` VALUES (1,'2022-08-28',2,6),(2,'2021-03-15',1,5),(3,'2020-05-23',5,7),(4,'2022-01-12',3,7);
/*!40000 ALTER TABLE `p_assiste_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `profissao` varchar(20) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  `cursopreferido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cursopreferido` (`cursopreferido`),
  CONSTRAINT `pessoas_ibfk_1` FOREIGN KEY (`cursopreferido`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'Godofredo',NULL,'1984-01-02','M',78.50,1.83,'Portugal',6),(2,'Richard',NULL,'1997-09-09','M',81.10,1.87,'Brasil',6),(3,'Mikaela',NULL,'1996-05-29','F',49.00,1.57,'Brasil',7),(4,'Ana',NULL,'1975-12-22','F',52.30,1.45,'EUA',5),(5,'Pedro',NULL,'2000-07-15','M',52.30,1.45,'Brasil',2),(6,'Maria',NULL,'1999-05-30','F',75.90,1.70,'Portugal',2),(7,'Alecrino',NULL,'1996-06-28','M',78.12,1.71,'EUA',3),(8,'Sadam Haialy',NULL,'1985-02-21','M',90.68,1.76,'Afeganistão',NULL);
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-05 16:27:00
