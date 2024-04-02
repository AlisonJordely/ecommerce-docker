-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: astore
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(250) NOT NULL,
  `Description` mediumtext,
  `CategorySlug` varchar(250) NOT NULL,
  `Image` longtext NOT NULL,
  PRIMARY KEY (`CategoryID`),
  KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (12,'Xbox','Juegos de Xbox','Xbox','https://static.vecteezy.com/system/resources/previews/018/930/272/original/xbox-logo-transparent-free-png.png'),(13,'Nintendo','Juegos de Nintendo','Nintendo','https://store.tictactoys.cl/wp-content/uploads/logo-nintendo.png'),(16,'PC ','Juegos de PC','PC','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Windows_logo_-_2012.svg/768px-Windows_logo_-_2012.svg.png'),(18,'Play Station','Juegos de Play Station','Play-Station','https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Playstation_logo_colour.svg/800px-Playstation_logo_colour.svg.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codigos`
--

DROP TABLE IF EXISTS `codigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codigos` (
  `CodigoID` int NOT NULL AUTO_INCREMENT,
  `orden` int DEFAULT NULL,
  `juego` int DEFAULT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CodigoID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codigos`
--

LOCK TABLES `codigos` WRITE;
/*!40000 ALTER TABLE `codigos` DISABLE KEYS */;
INSERT INTO `codigos` VALUES (1,86,40,'xddxdx'),(2,86,40,'xddxdx'),(3,86,40,'xddxdx'),(4,86,40,'xddxdx'),(5,87,36,'xddxdx'),(6,87,36,'xddxdx'),(7,87,36,'xddxdx'),(8,87,36,'xddxdx'),(9,87,37,'xddxdx'),(10,87,37,'xddxdx'),(11,87,37,'xddxdx'),(12,87,37,'xddxdx'),(13,87,37,'xddxdx'),(14,87,37,'xddxdx'),(15,87,37,'xddxdx'),(16,88,39,'G6XJ-UJZS-V2PR'),(17,88,36,'VM1E-6WTV-PVUC'),(18,88,36,'P2HI-EEZQ-X4H5'),(19,88,36,'YBNW-NJVR-6F57'),(20,88,37,'DKNX-1T3X-TLGF'),(21,88,39,'GOSY-TKZ7-2WCS'),(22,88,39,'2NPI-AYUM-QDAE'),(23,89,39,'78HL-V6O3-VD6K'),(24,89,39,'PGQ7-QIL7-YQLU'),(25,89,39,'DP31-KR25-HU2Y'),(26,89,39,'GKAJ-TFAP-1OT3'),(27,89,39,'EOBE-9NS2-GNAA'),(28,89,39,'ADCI-86V8-D4CQ'),(29,89,39,'8GZP-RNQ1-8IZM'),(30,89,39,'MK9M-03S4-HUOI'),(31,89,39,'JQ9R-02XX-MZTH'),(32,90,40,'6IIR-BC9O-IW3I'),(33,91,41,'YSER-8J1E-BA36'),(34,92,37,'UF7C-Q1L9-QZDN'),(35,93,40,'60PO-4WVV-OROR'),(36,94,43,'6SG7-IH5A-XCJQ'),(37,95,40,'EDSL-BJOF-RRPR'),(38,96,40,'GXBL-K9AZ-F70Y'),(39,96,37,'5149-XR8F-PDE2'),(40,97,40,'78J6-8H3F-PVMU'),(41,98,41,'YQ8E-N91T-6DGQ'),(42,99,36,'B9RL-IEBA-MNWH'),(43,99,45,'8I58-LEPD-0QPN'),(44,100,37,'PYJ2-D002-9RX9'),(45,101,39,'L6IC-S01Q-GOZ6'),(46,102,42,'VACC-19VY-C778'),(47,103,35,'2GQ0-2Y68-60NP'),(48,103,35,'MIPG-2Q3R-B932'),(49,103,35,'W7WY-C10D-KDW9'),(50,104,36,'3E9A-NHCU-DYT9'),(51,104,37,'GPFN-EY9R-B8QI'),(52,105,36,'Q75M-KSTZ-QKY4'),(53,106,39,'DJ8V-AA7D-JDLT'),(54,107,43,'7WXP-SMGP-ZUKZ'),(55,108,37,'A8V5-DGM7-XD48'),(56,109,37,'8TJP-QBZM-Y70F'),(57,110,37,'6B9I-HO5Q-7I6N'),(58,111,35,'V5KO-H354-FIBH'),(59,112,37,'GLWX-JVKY-KF1S'),(60,113,38,'P0OD-4ZGJ-SP6D'),(61,114,43,'VRO7-CWKD-FSM4'),(62,114,47,'0X3D-U8KL-VTPF'),(63,114,57,'8LAO-TZG5-63FU'),(64,115,36,'YVBZ-HWID-PH0H'),(65,116,35,'TB04-KM2E-XTSB'),(66,116,36,'MUH0-ST90-P8OB'),(67,116,39,'KH50-MS4Q-5F1H'),(68,117,37,'G6DN-YGCX-LG5O'),(69,117,37,'WSPT-B685-QN0X'),(70,117,40,'UOMK-UNA3-9AYX'),(71,117,45,'FUJL-VW79-6EIQ'),(72,118,36,'XZ1S-WLWM-WNKY'),(73,118,37,'TEZG-BSSQ-URA8'),(74,120,37,'B4M3-L633-0TZ6'),(75,120,40,'32WH-FZC8-XEI3'),(76,120,41,'2BH3-GQAO-DTFF'),(77,120,41,'2X3X-H1WL-JMAO'),(78,120,41,'6FOT-LM0J-BTL3'),(79,121,39,'4Z3Q-CAK6-XJGR'),(80,121,39,'ML5A-1OUP-2J06'),(81,122,40,'MEMX-WANN-MPXG'),(82,123,36,'4K8D-XI8H-POD7'),(83,124,38,'4EDI-5Q8E-M46Q'),(84,124,36,'JCCR-HW14-V3K9'),(85,124,38,'7EH5-2W6S-Y4XV'),(86,124,38,'O643-LVA1-WNDZ'),(87,124,40,'FGG3-UA0X-ZI4R');
/*!40000 ALTER TABLE `codigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `MessageID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL,
  PRIMARY KEY (`MessageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'hnj','jobdavid107@gmail.com','byuhnij','uhnjimk'),(2,'llera','vgjhbbkjnknlj@mail.com','uhnjimko,','hunjik'),(3,'llera','lleralj@mail.com','fvgbh','tfyguh'),(4,'Llera Leo','lleramail@mail.com','gvhjkl','ghjklzgvhghzghzgh1');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order details`
--

DROP TABLE IF EXISTS `order details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order details` (
  `OrderID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` smallint NOT NULL DEFAULT '1',
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`),
  KEY `FK_Order_Details_Products` (`ProductID`),
  CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order details`
--

LOCK TABLES `order details` WRITE;
/*!40000 ALTER TABLE `order details` DISABLE KEYS */;
INSERT INTO `order details` VALUES (116,35,1,1200.00),(116,36,1,999.00),(116,39,1,820.00),(117,37,2,2400.00),(117,40,1,1200.00),(117,45,1,1100.00),(118,36,1,999.00),(118,37,1,1200.00),(120,37,1,1200.00),(120,40,1,1200.00),(120,41,3,3600.00),(121,39,2,1640.00),(122,40,1,1200.00),(123,36,1,999.00),(124,36,1,999.00),(124,38,3,3600.00),(124,40,1,1200.00);
/*!40000 ALTER TABLE `order details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_Orders_Users` (`UserID`),
  CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (116,42,3019.00,0.00,3019.00,'2023-06-11 13:08:37','Order Received'),(117,42,4700.00,0.00,4700.00,'2023-06-11 13:26:44','Order Received'),(118,42,2199.00,0.00,2199.00,'2023-06-11 13:34:45','Order Received'),(120,42,6000.00,0.00,6000.00,'2023-06-11 13:47:24','Order Received'),(121,42,1640.00,0.00,1640.00,'2023-06-11 13:53:33','Order Received'),(122,42,1200.00,0.00,1200.00,'2023-06-11 13:54:25','Order Received'),(123,42,999.00,0.00,999.00,'2023-06-11 14:13:25','Order Received'),(124,42,5799.00,0.00,5799.00,'2023-06-11 14:14:53','Order Received');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) NOT NULL,
  `CategoryID` int DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT '0.00',
  `UnitsInStock` smallint DEFAULT '0',
  `Description` longtext NOT NULL,
  `ManufactureYear` smallint NOT NULL,
  `Image` longtext NOT NULL,
  `ProductSlug` longtext NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ProductID`),
  KEY `FK_Products_Categories` (`CategoryID`),
  KEY `ProductName` (`ProductName`),
  CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (35,'Ori and the Will of the Wisps (PC)',16,1200.00,5,'Ori and the Will of the Wisps es la continuación del emblemático videojuego de plataformas y aventuras Ori and the Blind Forest, desarrollado por Moon Studios. Se trata de una secuela que sigue ofreciéndonos un estilo impecable a nivel visual y jugable de la mano de Microsoft Studios y con un lanzamiento para Xbox One y PC.',2020,'https://sm.ign.com/ign_es/game/o/ori-and-th/ori-and-the-will-of-the-wisps_1ch5.png','Ori-and-the-Will-of-the-Wisps-PC',1),(36,'Ori and the Blind Forest: Definitive Edition (PC)',16,999.00,95,'En Ori and the Blind Forest: Definitive Edition, versión mejorada de la aventura original para Xbox One y PC, encontraremos nuevas áreas, nuevas habilidades, secuencias inéditas de la historia y varios modos de dificultad. En esta versión ampliada, por ejemplo, podemos descubrir más del pasado de Naru en dos nuevos entornos y descubrir nuevos secretos en Nibel gracias a un nuevo sistema de teletransporte entre escenarios.',2016,'https://uvejuegos.com/img/caratulas/63240/Ori-and-the-Blind-Forest-Definitive-Edition-Switch-EU.jpg','Ori-and-the-Blind-Forest-Definitive-Edition-PC',1),(37,'Need for Speed Unbound (PC)',16,1200.00,10,'Corre hasta lo más alto, sin llevarte chascos. Supera a la policía y participa en las eliminatorias semanales del Grand, la carrera callejera definitiva. Llena tu garaje de coches personalizados y tuneados con precisión e inunda las calles con tu estilo.',2020,'https://upload.wikimedia.org/wikipedia/ru/5/50/Need_for_Speed_Unbound.jpeg','Need-for-Speed-Unbound-PC',0),(38,'Ghost of Tsushima (PS5)',18,1200.00,6,'Forja un nuevo camino y emplea tácticas de guerra poco convencionales para liberar Tsushima. Desafía a tus enemigos con tu katana, domina el arco para eliminar las amenazas lejanas, aprende tácticas de sigilo para emboscar a los enemigos y explora una nueva historia en la Isla Iki.',2020,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Ghost-of-Tsushima-DIRECTORS-CUT.png','Ghost-of-Tsushima-PS5',1),(39,'Battlefield 1 (Xbox Series)',12,820.00,5,'Battlefield 1 supone el retorno a las raíces de esta veterana serie de videojuegos de acción bélica. El conflicto se traslada a los campos de batalla de la Primera Guerra Mundial, en los que podemos pilotar una amplia variedad de vehículos terrestres, marinos y aéreos; aparte de usar también un vasto arsenal de armas de fuego.',2016,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Battlefield-1-2.jpg','Battlefield-1-Xbox-Series',1),(40,'Hogwarts Legacy (PS5)',18,1200.00,6,'Hogwarts Legacy es un videojuego de rol y aventuras en tercera persona desarrollado por Warner Bros. Games y Avalanche para consolas y PC. El título nos traslada al universo de Harry Potter a través de una experiencia inmersiva de mundo abierto ambientada a finales del siglo XIX, invitándonos a explorar y descubrir bestias fantásticas, personalizar nuestro personaje y elaborar pociones, dominar el lanzamiento de hechizos y desentrañar qué misterios se ocultan en Hogwarts. ',2023,'https://www.mishoppingdigital.com/wp-content/uploads/2023/03/Hogwarts-Legacy.png','Hogwarts-Legacy-PS5',1),(41,'God of War Ragnarök (PS5)',18,1200.00,5,'Equipado con sus fieles armas de guerra, como el hacha Leviatán y las Espadas del Caos, Kratos deberá llevar al límite sus letales capacidades para proteger a su familia. Además, tanto él como Atreus podrán aprender nuevas habilidades que les permitirán personalizar el fluido y expresivo combate en este relato épico e implacable que garantiza sus responsables con God of War: Ragnarok.',2022,'https://www.mishoppingdigital.com/wp-content/uploads/2022/09/God-of-War-Ragnarok.png','God-of-War-Ragnarok-PS5',0),(42,'Dead Island 2 (PS4)',18,1200.00,49,'Una aventura cinemática cooperativa – Dead Island 2 es una experiencia de rol auténtica; ofrece numerosas misiones emocionantes, un elenco de personajes disparatado, un mundo abierto infestado de Zombis y una trepidante historia de serie B para que te sumerjas en su retorcido universo. La rejugabilidad está garantizada. Añade un modo cooperativo de infarto para hasta tres jugadores, lo que te garantiza una larga (y sangrienta) estancia en Los Ángeles.',2023,'https://www.mishoppingdigital.com/wp-content/uploads/2023/04/Dead-Island-2.png','Dead-Island-2-PS4',1),(43,'Assassin’s Creed Odyssey (PS5)',18,1200.00,7,'Sentenciado a muerte por tu propia familia, Assassin’s Creed: Odyssey te propone embarcarte en un viaje épico en el que dejarás de ser un mercenario proscrito para convertirte en un legendario héroe griego y descubrir la verdad sobre tu pasado, forjando tu camino a través de un mundo en guerra modelado por dioses y hombres, donde mares y montañas colisionan.',2018,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Assassins-Creed-Odyssey.jpg','Assassins-Creed-Odyssey-PS5',1),(45,'Biomutant (Xbox One)',12,1100.00,8,'Biomutant es un título de rol y acción de mundo abierto, con especial énfasis en la exploración y el combate cuerpo a cuerpo. Llevándonos a un universo de ciencia ficción lejano, plagado de planetas selváticos y de climas extremos, en Biomutant encarnaremos a un animal capaz de mutar, añadir habilidades y viajar por distintos escenarios con los más variados vehículos, que irán desde mechas a globos y jetpacks.',2022,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Biomutant-.png','Biomutant-Xbox-One',1),(46,'Call of Duty Black Ops Cold War (Xbox series)',12,1200.00,80,'Call of Duty: Black Ops Cold War es la entrega para el año de 2020 de la veterana y exitosa saga de acción bélica de Activision. La producción apuesta por la Guerra Fría como ambientación y posibles saltos temporales entre diferentes guerras de distintas épocas.',2020,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Call-of-Duty-Black-Ops-Cold-War.jpg','Call-of-Duty-Black-Ops-Cold-War-Xbox-series',1),(47,'Crash Team Racing Nitro-Fueled (PS4)',18,1800.00,97,'El gran éxito de Crash Bandicoot N. Sane Trilogy ha animado a Activision y Beenox a traer también de vuelta a Crash Team Racing, el divertido videojuego de karts que protagonizaron los personajes más conocidos de esta saga en los tiempos de la primera PlayStation. En la remasterización CTR Nitro-Fueled no solo vamos a encontrarnos aquel mítico videojuego con gráficos muy mejorados, sino también algunos de los personajes y circuitos que en aquel entonces no pudieron añadirse.',2019,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/CTR-Nitro-Fueled.jpg','Crash-Team-Racing-Nitro-Fueled-PS4',1),(48,'Cyberpunk 2077 (PC)',16,2000.00,100,'Cyberpunk 2077 es el nuevo videojuego de rol en primera persona con estructura de mundo abierto de CD Projekt RED. Los padres de The Witcher nos presentan una aventura de corte futurista y ciberpunk en la que encarnaremos a un personaje diseñado a nuestra medida y en la que tendremos que sobrevivir en una peligrosa urbe plagada de corporaciones, ciborgs, bandas y las más variadas amenazas tecnológicas.',2020,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Cyberpunk-2077.png','Cyberpunk-2077-PC',1),(49,'Elden Ring (Xbox Series)',12,2500.00,10,'Elden Ring es un misterioso videojuego en el que trabaja FromSoftware, padres de Dark Souls, y George R.R. Martin, autor de la saga de libros adaptada con éxito a televisión bajo el nombre de Juego de Tronos. Elden Ring es un juego de mundo abierto, que presumiblemente sigue a rajatabla los mandamientos de la serie creada por Hidetaka Miyazaki, y que está ambientado en la fantasía oscura occidental y que proponen una mirada más profunda del RPG en tercera persona.',2022,'https://www.mishoppingdigital.com/wp-content/uploads/2022/03/Elden-Ring.png','Elden-Ring-Xbox-Series',1),(50,'FAR CRY 6 (PC)',16,2150.00,100,'En Far Cry 6 los jugadores volverán a explorar un exuberante mundo abierto, repleto de vegetación, ciudades, playas, selvas y muchos más lugares que explorar más allá de Esperanza, la enorme capital de Yara. La variedad de escenarios será amplia, ya que este será el Far Cry más grande de toda la saga.',2021,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Far-Cry-6-.png','FAR-CRY-6-PC',1),(51,'FIFA 22 (Xbox Series)',12,2150.00,100,'Videojuego de simulación de fútbol para PC y consolas. No se han compartido detalles sobre sus novedades, pero los jugadores pueden esperar un título con un nuevo salto jugable y técnico en PS5 y Xbox Series X|S cargado de contenidos como viene siendo habitual en las últimas entregas de la serie. FIFA 22 cuenta con casi la totalidad de licencias de los principales campeonatos y equipos del mundo, y eso incluye la UEFA Champions League en exclusiva tras la renovación de su acuerdo con la UEFA.',2021,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/FIFA-22.jpeg','FIFA-22-Xbox-Series',1),(52,'Mario Kart 8 Deluxe Código (Nintendo Switch)',13,3375.00,100,'Remasterización para Nintendo Switch de este exitoso y aclamado juego de Wii U. Además de ofrecer mejores gráficos, también contará con nuevos personajes, ajustes jugables y un renovado Modo Batalla. De esta forma, Mario Kart 8 Deluxe tendrá 48 circuitos (los 32 del original más los 16 de los DLC) y 40 personajes, cinco de ellos nuevos. Estos son Inkling chico e Inkling chica de Splatoon, el Rey Boo, Huesitos y Bowsy, así como nuevas piezas con las que configurar nuestros vehículos.',2014,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/Mario-Kart-8-Deluxe.jpg','Mario-Kart-8-Deluxe-Codigo-Nintendo-Switch',1),(53,'Grand Theft Auto V GTA (Xbox Series)',12,2500.00,10,'Tres protagonistas (Michael, Trevor y Franklin) se centran en la búsqueda del todopoderoso dinero en un reinventado Sur de California en la actualidad.',2013,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/gtav_350.jpg','Grand-Theft-Auto-V-GTA-Xbox-Series',1),(54,'The Last of Us Part II (PS5)',18,2500.00,10,'Secuela de The Last of Us, uno de los juegos más aclamados de la consola PS3, que apareció en 2015 en PS4 en versión remasterizada. Esta continuación ha sido anunciada en el evento PlayStation Experience de diciembre de 2016, generando grandísimas expectativas entre los jugadores.',2020,'https://www.mishoppingdigital.com/wp-content/uploads/2022/01/The-Last-of-Us-II.jpg','The-Last-of-Us-Part-II-PS5',1),(55,'Resident Evil 4 Remake (PS4)',18,2150.00,10,'En esta ocasión, Capcom ha optado por crear un remake que se mantiene fiel al original en algunas situaciones y escenas clásicas, pero añadiendo también otros momentos nuevos y refinando los que necesitaban algo más de tensión e incluso transformando algunos jefes que necesitaban un diseño mejorado. El resultado es un juego que se beneficia de estas modificaciones, aunque en el que también se pueden echar de menos algunos momentos y jefes míticos. Uno de los grandes añadidos ha sido el juego con el cuchillo, que no solo puede mejorarse y repararse, sino que nos sirve para la defensa en incontables ocasiones y permite acabar con algunos enemigos mediante el sigilo.',2023,'https://www.mishoppingdigital.com/wp-content/uploads/2023/03/Resident-Evil-4-Remake.png','Resident-Evil-4-Remake-PS4',1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES ('javier_xmd@hotmail.com'),('avgagh@mail.com');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`),
  KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','0123456789','admin@astore.com','admin','$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6',1),(28,'Leo Llera','5582337118','leollera04@gmail.com','llera1234','$2a$10$2YMwnV4XJv6w0jOvvjQVEuMxLeuhmnosE/HqIKBVlAwwAVxKJRSte',0),(42,'job ramos','5582773616','jobdavid107@gmail.com','jobdavid107','$2a$10$6vW3MMssMiOLWNIcAIkb0OhU8059Kpm4MIN5D3BcV6yfhAZCOkHMq',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `idwishlist` int NOT NULL AUTO_INCREMENT,
  `IDvideojuego` int DEFAULT NULL,
  `IDUsuario` int DEFAULT NULL,
  PRIMARY KEY (`idwishlist`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (57,39,1),(62,40,19),(72,37,26),(74,43,4),(75,41,4),(77,37,27),(78,35,27),(79,57,27),(80,37,38),(82,38,38),(83,39,38),(84,41,38),(85,36,42),(87,37,42);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 17:15:15
