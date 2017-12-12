-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Course_Registration
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Course_Available`
--

DROP TABLE IF EXISTS `Course_Available`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_Available` (
  `CCode` varchar(7) NOT NULL,
  `Slot` varchar(2) NOT NULL,
  `FNo` int(11) NOT NULL,
  `CNo` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Seats_left` int(11) NOT NULL,
  PRIMARY KEY (`CCode`,`Slot`,`FNo`),
  KEY `FNo` (`FNo`),
  KEY `CNo` (`CNo`),
  KEY `Location` (`Location`),
  KEY `Slot` (`Slot`),
  KEY `CCode` (`CCode`,`Slot`),
  CONSTRAINT `Course_Available_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Course_Available_ibfk_2` FOREIGN KEY (`FNo`) REFERENCES `Faculty` (`FNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Course_Available_ibfk_3` FOREIGN KEY (`CNo`) REFERENCES `Room` (`CNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Course_Available_ibfk_4` FOREIGN KEY (`Location`) REFERENCES `Room` (`Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_Available`
--

LOCK TABLES `Course_Available` WRITE;
/*!40000 ALTER TABLE `Course_Available` DISABLE KEYS */;
INSERT INTO `Course_Available` VALUES ('CSE1001','A1',1,303,'SJT',3),('CSE1001','A1',2,303,'SJT',25),('CSE1002','A2',1,303,'SJT',24),('CSE2001','D1',7,101,'SJT',44),('CSE2001','D2',8,103,'SJT',25),('CSE2002','E1',5,303,'SJT',14),('ECE2001','A2',3,123,'TT',35),('ECE2002','F1',9,555,'TT',24),('ECE2002','F2',9,512,'TT',55),('EEE2001','D1',6,201,'TT',0),('EEE2001','D2',5,202,'TT',17),('EEE2004','B1',10,728,'SJT',28),('EEE2004','B2',4,444,'SJT',58),('MAT1001','A1',1,303,'SJT',10),('MAT1002','C1',4,202,'TT',35),('MAT1002','C2',4,201,'TT',65);
/*!40000 ALTER TABLE `Course_Available` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course_Details`
--

DROP TABLE IF EXISTS `Course_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_Details` (
  `CCode` varchar(7) NOT NULL,
  `CName` varchar(20) NOT NULL,
  `Credits` int(11) NOT NULL,
  `DNo` int(11) NOT NULL,
  PRIMARY KEY (`CCode`),
  KEY `DNo` (`DNo`),
  CONSTRAINT `Course_Details_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_Details`
--

LOCK TABLES `Course_Details` WRITE;
/*!40000 ALTER TABLE `Course_Details` DISABLE KEYS */;
INSERT INTO `Course_Details` VALUES ('CSE1001','Python',4,1),('CSE1002','C++',4,1),('CSE2001','Computer Architectur',3,1),('CSE2002','Theory of Computatio',4,1),('ECE2001','Semiconductors',4,2),('ECE2002','Signals and Processi',3,2),('EEE2001','Basic EEE',2,3),('EEE2004','Network Theory',4,3),('MAT1001','Maths for Engineers',5,1),('MAT1002','Statistics',4,1);
/*!40000 ALTER TABLE `Course_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course_Prerequisite`
--

DROP TABLE IF EXISTS `Course_Prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course_Prerequisite` (
  `CCode` varchar(7) NOT NULL,
  `PreCCode` varchar(7) NOT NULL,
  KEY `CCode` (`CCode`),
  KEY `PreCCode` (`PreCCode`),
  CONSTRAINT `Course_Prerequisite_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Course_Prerequisite_ibfk_2` FOREIGN KEY (`PreCCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course_Prerequisite`
--

LOCK TABLES `Course_Prerequisite` WRITE;
/*!40000 ALTER TABLE `Course_Prerequisite` DISABLE KEYS */;
INSERT INTO `Course_Prerequisite` VALUES ('CSE1002','CSE1001'),('CSE1002','MAT1001'),('EEE2004','EEE2001'),('ECE2002','ECE2001'),('MAT1002','MAT1001');
/*!40000 ALTER TABLE `Course_Prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Dno` int(11) NOT NULL,
  `Dname` varchar(20) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `DeanFNo` int(11) NOT NULL,
  PRIMARY KEY (`Dno`),
  UNIQUE KEY `Dname` (`Dname`),
  KEY `Location` (`Location`),
  KEY `DeanFNo` (`DeanFNo`),
  CONSTRAINT `Department_ibfk_1` FOREIGN KEY (`DeanFNo`) REFERENCES `Faculty` (`FNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'SCOPE','SJT',1),(2,'SELECT','TT',2),(3,'SENSE','TT',2);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `FNo` int(11) NOT NULL,
  `FName` varchar(20) NOT NULL,
  `LName` varchar(20) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `DOB` date NOT NULL,
  `PhNo` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `DNo` int(11) NOT NULL,
  PRIMARY KEY (`FNo`),
  UNIQUE KEY `PhNo` (`PhNo`),
  UNIQUE KEY `Email` (`Email`),
  KEY `DNo_2` (`DNo`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`DNo`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1,'Ram','Kumar','M','1977-08-22','9962562195','Vellore','ramkumar@gmail.com',1),(2,'Lionel','Messi','M','1966-07-01','9884282603','Argentina','cr7@gmail.com',1),(3,'Vijaya','Kumar','M','1965-01-21','9092399767','Chennai','vij@gmail.com',1),(4,'Raj','Kumar','M','1968-01-21','9092831574','Madurai','raj@gmail.com',2),(5,'Sai','Kumar','M','1974-05-21','9092831569','Dindugul','sai@gmail.com',3),(6,'Meena','Kumari','F','1981-01-15','8992831574','Chennai','kumari@gmail.com',2),(7,'John','Snow','F','1991-01-15','9092855574','America','nothing@gmail.com',3),(8,'Kevin','Paul','M','1981-09-15','8012855574','Thanjavur','kevin@gmail.com',3),(9,'Johhny','Singh','M','1975-05-15','9012812374','Punjab','johnny@gmail.com',2),(10,'Nigel','John','F','1988-04-21','8882812374','Kerala','nigel@gmail.com',3);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Rno` varchar(9) NOT NULL,
  `Password` varchar(20) NOT NULL,
  UNIQUE KEY `Rno` (`Rno`),
  CONSTRAINT `Login_ibfk_1` FOREIGN KEY (`Rno`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES ('15BCE0012','adithya'),('15BCE0069','lakshay'),('15BCE0123','raghav'),('15BEC2064','ananya'),('15BEE0089','Nithya');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `CNo` int(11) NOT NULL,
  `Location` varchar(20) NOT NULL,
  PRIMARY KEY (`CNo`),
  KEY `Location` (`Location`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`Location`) REFERENCES `Department` (`Location`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (101,'SJT'),(103,'SJT'),(133,'SJT'),(303,'SJT'),(444,'SJT'),(728,'SJT'),(123,'TT'),(201,'TT'),(202,'TT'),(512,'TT'),(555,'TT');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `RNo` varchar(9) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `DOB` date NOT NULL,
  `Phno` varchar(10) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Dno` int(11) NOT NULL,
  `Credits` int(11) NOT NULL,
  PRIMARY KEY (`RNo`),
  UNIQUE KEY `Phno` (`Phno`),
  UNIQUE KEY `Email` (`Email`),
  KEY `Dno_2` (`Dno`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`Dno`) REFERENCES `Department` (`Dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('15BCE0012','Adithya','Murali','Chennai','1997-08-22','9962562193','madi770@gmail.com','M',1,4),('15BCE0069','Lakshay','Vaikunth','Chennai','1997-11-11','123456789','lak@gmail.com','M',1,4),('15BCE0123','Raghav','Ananth','Chennai','1997-12-01','9092399767','raghav@gmail.com','M',1,2),('15BEC2064','Ananya','Mathur','Delhi','1997-12-05','9092512345','ananya@gmail.com','F',2,2),('15BEE0089','Nithya','Ratan','Somalia','1997-12-05','6969696969','vaishu@gmail.com','M',3,4);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Completed`
--

DROP TABLE IF EXISTS `Student_Completed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Completed` (
  `RNo` varchar(9) NOT NULL,
  `CCode` varchar(7) NOT NULL,
  KEY `RNo` (`RNo`),
  KEY `CCode` (`CCode`),
  CONSTRAINT `Student_Completed_ibfk_1` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Student_Completed_ibfk_2` FOREIGN KEY (`RNo`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Completed`
--

LOCK TABLES `Student_Completed` WRITE;
/*!40000 ALTER TABLE `Student_Completed` DISABLE KEYS */;
INSERT INTO `Student_Completed` VALUES ('15BCE0012','ECE2001');
/*!40000 ALTER TABLE `Student_Completed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Registers`
--

DROP TABLE IF EXISTS `Student_Registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Registers` (
  `RNo` varchar(9) NOT NULL,
  `Slot` varchar(2) NOT NULL,
  `CCode` varchar(7) NOT NULL,
  `FNo` int(11) NOT NULL,
  KEY `RNo` (`RNo`,`Slot`,`CCode`,`FNo`),
  KEY `FNo` (`FNo`),
  KEY `Student_Registers_ibfk_3` (`CCode`),
  KEY `Slot` (`Slot`),
  CONSTRAINT `Student_Registers_ibfk_1` FOREIGN KEY (`RNo`) REFERENCES `Student` (`RNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Student_Registers_ibfk_3` FOREIGN KEY (`CCode`) REFERENCES `Course_Details` (`CCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Student_Registers_ibfk_4` FOREIGN KEY (`FNo`) REFERENCES `Faculty` (`FNo`),
  CONSTRAINT `Student_Registers_ibfk_5` FOREIGN KEY (`Slot`) REFERENCES `Course_Available` (`Slot`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Registers`
--

LOCK TABLES `Student_Registers` WRITE;
/*!40000 ALTER TABLE `Student_Registers` DISABLE KEYS */;
INSERT INTO `Student_Registers` VALUES ('15BCE0012','A1','CSE1001',1);
/*!40000 ALTER TABLE `Student_Registers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-23 11:48:49
