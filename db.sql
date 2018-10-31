-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: WestmarchDatabase
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `WestmarchDatabase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `WestmarchDatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `WestmarchDatabase`;

--
-- Table structure for table `Character`
--

DROP TABLE IF EXISTS `Character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Character` (
  `CharID` int(11) NOT NULL AUTO_INCREMENT,
  `CharName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CharID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character`
--

LOCK TABLES `Character` WRITE;
/*!40000 ALTER TABLE `Character` DISABLE KEYS */;
/*!40000 ALTER TABLE `Character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CharacterSession`
--

DROP TABLE IF EXISTS `CharacterSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CharacterSession` (
  `CharID` int(11) DEFAULT NULL,
  `SessionID` int(11) DEFAULT NULL,
  KEY `CharID` (`CharID`),
  KEY `SessionID` (`SessionID`),
  CONSTRAINT `charactersession_ibfk_1` FOREIGN KEY (`CharID`) REFERENCES `character` (`charid`) ON DELETE CASCADE,
  CONSTRAINT `charactersession_ibfk_2` FOREIGN KEY (`SessionID`) REFERENCES `session` (`sessionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CharacterSession`
--

LOCK TABLES `CharacterSession` WRITE;
/*!40000 ALTER TABLE `CharacterSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `CharacterSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CharItem`
--

DROP TABLE IF EXISTS `CharItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CharItem` (
  `ItemID` int(11) DEFAULT NULL,
  `CharID` int(11) DEFAULT NULL,
  KEY `CharID` (`CharID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `charitem_ibfk_1` FOREIGN KEY (`CharID`) REFERENCES `character` (`charid`) ON DELETE CASCADE,
  CONSTRAINT `charitem_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`itemid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CharItem`
--

LOCK TABLES `CharItem` WRITE;
/*!40000 ALTER TABLE `CharItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `CharItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `City` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `RegionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CityID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`RegionID`) REFERENCES `region` (`regionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CityItem`
--

DROP TABLE IF EXISTS `CityItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CityItem` (
  `CityID` int(11) DEFAULT NULL,
  `ItemID` int(11) DEFAULT NULL,
  KEY `CityID` (`CityID`),
  CONSTRAINT `cityitem_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `city` (`cityid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CityItem`
--

LOCK TABLES `CityItem` WRITE;
/*!40000 ALTER TABLE `CityItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `CityItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GM`
--

DROP TABLE IF EXISTS `GM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `GM` (
  `GMID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`GMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GM`
--

LOCK TABLES `GM` WRITE;
/*!40000 ALTER TABLE `GM` DISABLE KEYS */;
/*!40000 ALTER TABLE `GM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Item`
--

DROP TABLE IF EXISTS `Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Item` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Item`
--

LOCK TABLES `Item` WRITE;
/*!40000 ALTER TABLE `Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player`
--

DROP TABLE IF EXISTS `Player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Player` (
  `PlayerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player`
--

LOCK TABLES `Player` WRITE;
/*!40000 ALTER TABLE `Player` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Region` (
  `RegionID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  `WorldID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegionID`),
  KEY `WorldID` (`WorldID`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`WorldID`) REFERENCES `world` (`worldid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Session` (
  `SessionID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) NOT NULL,
  `RegionID` int(11) DEFAULT NULL,
  `SessionDate` datetime NOT NULL,
  PRIMARY KEY (`SessionID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`RegionID`) REFERENCES `region` (`regionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TownCryer`
--

DROP TABLE IF EXISTS `TownCryer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TownCryer` (
  `SessionID` int(11) DEFAULT NULL,
  `Link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TownCryer`
--

LOCK TABLES `TownCryer` WRITE;
/*!40000 ALTER TABLE `TownCryer` DISABLE KEYS */;
/*!40000 ALTER TABLE `TownCryer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `World`
--

DROP TABLE IF EXISTS `World`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `World` (
  `WorldID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`WorldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `World`
--

LOCK TABLES `World` WRITE;
/*!40000 ALTER TABLE `World` DISABLE KEYS */;
/*!40000 ALTER TABLE `World` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-25 19:05:19
