-- MySQL dump 10.13  Distrib 8.0.30, for macos11.6 (arm64)
--
-- Host: localhost    Database: tours
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Lviv','49.84067923671226,24.029880111471325'),(2,'Berlin','52.51919922857955,13.405186793127015');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `id` varchar(255) NOT NULL,
  `date_added` date DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
INSERT INTO `file_info` VALUES ('041602cb-326c-4aad-9596-fbf651c506e1',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('0e2687aa-c49a-403e-a7c3-37fa44d1d0a0',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('13897c2d-0077-4ead-a14b-6f0f5aeefd72',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('2180e389-ed84-4777-b74d-4c7e57d64b8f',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('2ebac145-433d-4488-9c19-4e9a5f67ba62',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('3ed40802-21cb-46ab-8dee-2251a213ead8',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('5cc3d656-a1d1-4d58-8f33-58b15713d493',NULL,'jpg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('5d085f55-7035-40f8-9488-0e87f6f5a05b',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('65f97ec5-f414-451b-b315-67b719829ac1',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('691a57be-66b0-4996-a621-32118c45fe3e',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('719325fe-22c2-41ae-9bd7-fbe1aa4e12cb',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('73ac6fe9-b86d-4ce4-b590-2b075ff3e91e',NULL,'jpg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('8b1a6c49-60f9-458c-a1b9-871d4a5003dc',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('97a5f5ad-2fb0-46da-b561-487ae416d894',NULL,'png','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('b0093ae9-2852-438a-a94e-17269506ccd0',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('d15b0d01-be8d-4e2f-b9da-e06ed82498e6',NULL,'jpg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('d1e79a74-cf01-4e1f-b5d0-cef2f156f29d',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('d1f511c7-89cb-4c90-b28a-c73d48d6847c',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('d2b8e82f-7c80-4e3d-9ff9-454f6d1552f7',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('d55568a7-64cf-4275-9833-0bd70ad19144',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('e012d6dd-4d69-4ec7-b0e9-9badae8910be',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('e600bfc5-f199-4051-8396-b05915604c65',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('f7ae9fbd-9dda-4ae4-89be-c422836c5fab',NULL,'png','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f'),('f7cb2039-6914-4cd6-a682-f7cd145e44cf',NULL,'jpeg','IMAGE','af0a9415-de24-4867-a31e-7212767bf82f');
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (30);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer`
--

DROP TABLE IF EXISTS `layer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layer` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `points` mediumblob,
  `text` longtext,
  `city_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKidr1jdxseuc4iugvhov5j071r` (`city_id`),
  CONSTRAINT `FKidr1jdxseuc4iugvhov5j071r` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer`
--

LOCK TABLES `layer` WRITE;
/*!40000 ALTER TABLE `layer` DISABLE KEYS */;
INSERT INTO `layer` VALUES (5,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/691a57be-66b0-4996-a621-32118c45fe3e','Lviv\'s Old City','1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000',_binary '�\�\0ur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0t\0%49.845370604697756,24.023710108052114t\0\"49.84517688579212,24.0235813620194t\0$49.844237345012566,24.02409553527832t\0#49.84511124531678,24.02280888582311t\0$49.84408728824335,24.021736002217153t\0#49.84336773786508,24.02177891756139t\0\"49.8426758524015,24.02203640962682t\0$49.84275887917996,24.023195123921255t\0%49.840544782957956,24.023409700642446t\0#49.83882878864413,24.02555546785436t\0$49.83827522909976,24.028688287983755t\0$49.838358263435396,24.03104863191686t\0$49.83883643847354,24.033139622478075t\0#49.83955605629305,24.03622952726323t\0#49.84348763758761,24.03429833677251t\0#49.84442858359395,24.03223840024907t\0%49.844926724065196,24.025672352580614t\0%49.845370604697756,24.023710108052114','<p><strong>Lviv</strong>&nbsp;(<a title=\"Ukrainian language\" href=\"https://en.wikipedia.org/wiki/Ukrainian_language\">Ukrainian</a>:&nbsp;<span lang=\"uk\">Львів</span>) is the largest city in&nbsp;<a title=\"Western Ukraine\" href=\"https://en.wikipedia.org/wiki/Western_Ukraine\">Western Ukraine</a>, and the&nbsp;<a title=\"List of cities in Ukraine\" href=\"https://en.wikipedia.org/wiki/List_of_cities_in_Ukraine\">seventh-largest</a>&nbsp;in Ukraine, with a population of&nbsp;<span class=\"nowrap\">717,510</span><sup id=\"cite_ref-ua2021estimate_3-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Lviv#cite_note-ua2021estimate-3\">[3]</a></sup>. It serves as the administrative centre of&nbsp;<a title=\"Lviv Oblast\" href=\"https://en.wikipedia.org/wiki/Lviv_Oblast\">Lviv Oblast</a>&nbsp;and&nbsp;<a title=\"Lviv Raion\" href=\"https://en.wikipedia.org/wiki/Lviv_Raion\">Lviv Raion</a>,<sup id=\"cite_ref-4\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Lviv#cite_note-4\">[4]</a></sup>&nbsp;and is one of the main&nbsp;<a class=\"mw-redirect\" title=\"Ukrainian culture\" href=\"https://en.wikipedia.org/wiki/Ukrainian_culture\">cultural centres of Ukraine</a>. It was named in honour of&nbsp;<a title=\"Leo I of Galicia\" href=\"https://en.wikipedia.org/wiki/Leo_I_of_Galicia\">Leo</a>, the eldest son of&nbsp;<a title=\"Daniel of Galicia\" href=\"https://en.wikipedia.org/wiki/Daniel_of_Galicia\">Daniel</a>,&nbsp;<a title=\"King of Ruthenia\" href=\"https://en.wikipedia.org/wiki/King_of_Ruthenia\">King of Ruthenia</a>.</p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/73ac6fe9-b86d-4ce4-b590-2b075ff3e91e\" alt=\"\" width=\"400\" height=\"325\"></p>\n<p><strong>Old Lviv before 1924</strong></p>\n<p>&nbsp;</p>',1),(8,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/5d085f55-7035-40f8-9488-0e87f6f5a05b','High Castle Park','1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000',_binary '�\�\0ur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0t\0$49.84774207158073,24.031121798351023t\0%49.848931983735085,24.030134745433543t\0$49.85039857934312,24.033610888316844t\0$49.85086898737613,24.038116999461863t\0$49.85125637878909,24.041335650279734t\0#49.85176551194792,24.04233745362012t\0$49.85083854422897,24.043807304160282t\0$49.84823221181045,24.044903604545766t\0%49.847291339839984,24.041899530449086t\0$49.84737435869171,24.040397493400746t\0%49.847263666857735,24.035204736747914t\0$49.84774207158073,24.031121798351023','<p>Park itself was founded at 1835, before its top was occupied by castle (destroyed at XIX)</p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/f7cb2039-6914-4cd6-a682-f7cd145e44cf\" alt=\"\" width=\"400\" height=\"222\"></p>\n<p><strong>Old view</strong></p>',1),(10,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/8b1a6c49-60f9-458c-a1b9-871d4a5003dc','Market Square','1960-11-28 21:46:42.723000','1352-11-20 21:44:34.431000',_binary '�\�\0ur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0t\0$49.84250747419194,24.032257258990512t\0#49.8415664907937,24.032729327777133t\0$49.84116864303952,24.030975163081393t\0%49.842192661931946,24.030487001040683t\0$49.84250747419194,24.032257258990512','<p><strong>Rynok Square</strong>&nbsp;(<a title=\"Ukrainian language\" href=\"https://en.wikipedia.org/wiki/Ukrainian_language\">Ukrainian</a>:&nbsp;<span lang=\"uk\">Площа Ринок</span>,&nbsp;<a title=\"Polish language\" href=\"https://en.wikipedia.org/wiki/Polish_language\">Polish</a>:&nbsp;<em lang=\"pl\">Rynek we Lwowie</em>,&nbsp;<a title=\"German language\" href=\"https://en.wikipedia.org/wiki/German_language\">German</a>:&nbsp;<em lang=\"de\">Ring</em>) is a central square of the city of&nbsp;<a title=\"Lviv\" href=\"https://en.wikipedia.org/wiki/Lviv\">Lviv</a>,&nbsp;<a title=\"Ukraine\" href=\"https://en.wikipedia.org/wiki/Ukraine\">Ukraine</a>. According to archaeological data, the square was planned in the second half of the 13th century, during the reign of Prince&nbsp;<a title=\"Leo I of Galicia\" href=\"https://en.wikipedia.org/wiki/Leo_I_of_Galicia\">Leo I of Galicia</a>.&nbsp;However, there is a long tradition of later dating the emergence of the square, associated with the activities of the Polish king&nbsp;<a title=\"Casimir III the Great\" href=\"https://en.wikipedia.org/wiki/Casimir_III_the_Great\">Casimir III the Great</a>.</p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/f7ae9fbd-9dda-4ae4-89be-c422836c5fab\" alt=\"\" width=\"400\" height=\"326\"></p>\n<p><strong>Plan of the square</strong></p>\n<p>The square was designed soon after Lviv&rsquo;s location as a city. Originally, the buildings were&nbsp;<a title=\"Gothic architecture\" href=\"https://en.wikipedia.org/wiki/Gothic_architecture\">Gothic</a>; however, a great fire on 3 June 1527 destroyed most of the city. The new city, then known in Polish as Lwow, was rebuilt in&nbsp;<a title=\"Renaissance\" href=\"https://en.wikipedia.org/wiki/Renaissance\">Renaissance</a>&nbsp;style, with a few remaining examples of Gothic architecture. There is a vault in tenement house number 24 and a portal in house number 25. Market Square was witness to several important events in the history of&nbsp;<a title=\"Poland\" href=\"https://en.wikipedia.org/wiki/Poland\">Poland</a>&nbsp;and&nbsp;<a title=\"Ukraine\" href=\"https://en.wikipedia.org/wiki/Ukraine\">Ukraine</a>. Among these, in 1387 King&nbsp;<a class=\"mw-redirect\" title=\"Jogaila\" href=\"https://en.wikipedia.org/wiki/Jogaila\">Wladyslaw Jagiello</a>&nbsp;accepted the homage of&nbsp;<a title=\"Petru I of Moldavia\" href=\"https://en.wikipedia.org/wiki/Petru_I_of_Moldavia\">Petru I of Moldavia</a>&nbsp;here. In 1436 another Moldavian ruler,&nbsp;<a class=\"mw-redirect\" title=\"Ilias of Moldavia\" href=\"https://en.wikipedia.org/wiki/Ilias_of_Moldavia\">Ilias of Moldavia</a>, paid homage to King&nbsp;<a class=\"mw-redirect\" title=\"Wladyslaw III of Poland\" href=\"https://en.wikipedia.org/wiki/Wladyslaw_III_of_Poland\">Wladyslaw III</a>&nbsp;in Lviv. Also, at the&nbsp;<a title=\"Pillory\" href=\"https://en.wikipedia.org/wiki/Pillory\">pillory</a>, several historical figures were executed by the Polish authorities including rulers of Moldavia&nbsp;<a class=\"mw-redirect\" title=\"Ştefan Tomşa\" href=\"https://en.wikipedia.org/wiki/%C5%9Etefan_Tom%C5%9Fa\">Ştefan Tomşa</a>&nbsp;(1564), Ukrainian national hero&nbsp;<a class=\"mw-redirect\" title=\"Ioan Potcoavă\" href=\"https://en.wikipedia.org/wiki/Ioan_Potcoav%C4%83\">Ioan Potcoavă</a>&nbsp;(Ivan Pidkova) (1578) and&nbsp;<a title=\"Iancu Sasul\" href=\"https://en.wikipedia.org/wiki/Iancu_Sasul\">Iancu Sasul</a>&nbsp;(1582).</p>\n<p>In 1848, during the&nbsp;<a title=\"Revolutions of 1848\" href=\"https://en.wikipedia.org/wiki/Revolutions_of_1848\">Spring of Nations</a>, a Polish National Guard was formed here. On 11 November 1920, prime minister&nbsp;<a class=\"mw-redirect\" title=\"Jozef Pilsudski\" href=\"https://en.wikipedia.org/wiki/Jozef_Pilsudski\">Jozef Pilsudski</a>&nbsp;hosted a military parade to commemorate awarding the&nbsp;<a title=\"Virtuti Militari\" href=\"https://en.wikipedia.org/wiki/Virtuti_Militari\">Virtuti Militari</a>&nbsp;cross to the city. Also, on 30 June 1941,&nbsp;<a title=\"\" href=\"https://en.wikipedia.org/wiki/Yaroslav_Stetsko\">Yaroslav Stetsko</a>&nbsp;<a class=\"mw-redirect\" title=\"Proclamation of Ukrainian statehood, 1941\" href=\"https://en.wikipedia.org/wiki/Proclamation_of_Ukrainian_statehood,_1941\">proclaimed Ukraine\'s independence</a>&nbsp;in a house located on the square. In 2006, a major restoration of the square&rsquo;s pavement was carried out.</p>',1),(13,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/2180e389-ed84-4777-b74d-4c7e57d64b8f','East Berlin','1990-10-09 21:54:00.319000','1949-10-09 21:53:54.199000',_binary '�\�\0ur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0t\0#52.61626741005564,13.39035345146715t\0$52.60083950344343,13.404773007131212t\0$52.56871535148508,13.400653134084337t\0$52.54617267797779,13.391726742482774t\0#52.547425352604705,13.3601410491234t\0\"52.52821374594518,13.3436615569359t\0$52.523809634229735,13.35800857562731t\0#52.51608008182281,13.40916366595934t\0$52.51252820988028,13.406073761174184t\0$52.503542781631744,13.41191024799059t\0#52.5031248100287,13.446242523381216t\0\"52.496436723886,13.464438629338247t\0%52.488911410808086,13.456198883244497t\0$52.41363488139329,13.565032196232778t\0$52.38346924567597,13.635070038029653t\0$52.31468162882743,13.669402313420278t\0%52.324754795926275,13.746306610295278t\0$52.44880206319939,13.799864959904653t\0$52.60920918079612,13.588378143498403t\0$52.64652471417354,13.363480089810764t\0#52.61626741005564,13.39035345146715','<p>With the&nbsp;<a title=\"London Protocol (1944)\" href=\"https://en.wikipedia.org/wiki/London_Protocol_(1944)\">London Protocol of 1944</a> signed on 12 September 1944, the United States, the United Kingdom, and the Soviet Union decided to divide Germany into three occupation zones and to establish a special area of Berlin, which was occupied by the three Allied Forces together.<sup id=\"cite_ref-1\" class=\"reference\"></sup>&nbsp;In May 1945, the Soviet Union installed a city government for the whole city that was called \"Magistrate of Greater Berlin\", which existed until 1947. After the war, the Allied Forces initially administered the city together within the&nbsp;<a title=\"Allied Kommandatura\" href=\"https://en.wikipedia.org/wiki/Allied_Kommandatura\">Allied Kommandatura</a>, which served as the governing body of the city. However, in 1948 the Soviet representative left the Kommandatura and the common administration broke apart during the following months. In the Soviet sector, a separate city government was established, which continued to call itself the \"Magistrate of Greater Berlin\".</p>\n<p>When the German Democratic Republic was established in 1949, it immediately claimed East Berlin as its capital&mdash;a claim that was recognized by all&nbsp;<a class=\"mw-redirect\" title=\"Communist countries\" href=\"https://en.wikipedia.org/wiki/Communist_countries\">communist countries</a>. Nevertheless, its representatives to the&nbsp;<a class=\"mw-redirect\" title=\"People\'s Chamber\" href=\"https://en.wikipedia.org/wiki/People%27s_Chamber\">People\'s Chamber</a> were not directly elected and did not have full voting rights until 1981.<sup id=\"cite_ref-2\" class=\"reference\"></sup></p>\n<p>In June 1948, all railways and roads leading to West Berlin were&nbsp;<a title=\"Berlin Blockade\" href=\"https://en.wikipedia.org/wiki/Berlin_Blockade\">blocked</a>, and East Berliners were not allowed to emigrate. Nevertheless, more than 1,000 East Germans were&nbsp;<a title=\"Republikflucht\" href=\"https://en.wikipedia.org/wiki/Republikflucht\">escaping</a>&nbsp;to West Berlin each day by 1960, caused by the strains on the East German economy from war reparations owed to the Soviet Union, massive destruction of industry, and lack of assistance from the&nbsp;<a title=\"Marshall Plan\" href=\"https://en.wikipedia.org/wiki/Marshall_Plan\">Marshall Plan</a>. In August 1961, the&nbsp;<a title=\"Politics of East Germany\" href=\"https://en.wikipedia.org/wiki/Politics_of_East_Germany\">East German Government</a>&nbsp;tried to stop the population exodus by enclosing West Berlin within the&nbsp;<a title=\"Berlin Wall\" href=\"https://en.wikipedia.org/wiki/Berlin_Wall\">Berlin Wall</a>. It was very dangerous for fleeing residents to cross because&nbsp;<a title=\"Border Troops of the German Democratic Republic\" href=\"https://en.wikipedia.org/wiki/Border_Troops_of_the_German_Democratic_Republic\">armed soldiers</a>&nbsp;were trained to&nbsp;<a title=\"Schie&szlig;befehl\" href=\"https://en.wikipedia.org/wiki/Schie%C3%9Fbefehl\">shoot illegal migrants</a>.<sup id=\"cite_ref-3\" class=\"reference\"></sup></p>\n<p>East Germany was a&nbsp;<a class=\"mw-redirect\" title=\"Socialist republic\" href=\"https://en.wikipedia.org/wiki/Socialist_republic\">socialist republic</a>. Eventually, Christian churches were allowed to operate without restraint after years of harassment by authorities. In the 1970s, the wages of East Berliners rose and working hours fell.<sup id=\"cite_ref-4\" class=\"reference\"></sup></p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/97a5f5ad-2fb0-46da-b561-487ae416d894\" alt=\"\" width=\"400\" height=\"338\"></p>\n<p><strong>East Berlin Borroughs</strong></p>',2),(15,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/b0093ae9-2852-438a-a94e-17269506ccd0','Alexandr Platz','2022-11-28 22:04:41.580000','1960-11-28 22:04:37.827000',_binary '�\�\0ur\0[Ljava.lang.String;�\�V\�\�{G\0\0xp\0\0\0t\0$52.52193184633554,13.416570855801638t\0#52.5240207704077,13.412193490689333t\0$52.52002561644123,13.404640390103395t\0%52.517022483750786,13.409060670559938t\0$52.52193184633554,13.416570855801638','<div class=\"block paragraph  \">\n<div class=\"inner\">The \"Alex\", as it is called by Berliners, is the cental square of the eastern city center and one of the most important sights of Berlin. The square and its attractions - such as the&nbsp;<a href=\"https://www.berlin.de/en/attractions-and-sights/3560707-3104052-berlin-tv-tower.en.html\" target=\"_blank\" rel=\"noopener\">TV Tower</a>, the World Clock, and the Fountain of Friendship between Nations - are popular with tourists from all around the world. In recent years, Alexanderplatz has also become one of the city\'s main addresses for shopping. The square and its immediate vicinity feature many stores of global fashion brands, the famous department store Galeria, and the Alexa, one of Berlin\'s largest shopping malls.</div>\n</div>\n<div class=\"block teaser\">\n<ul class=\"list--arrowlist\">\n<li><a class=\"\" href=\"https://www.berlin.de/en/hotels/alexanderplatz/\" target=\"_top\" data-campaign=\"cm.rubric.3783724\">Hotels near Alexanderplatz</a></li>\n<li><a class=\"\" href=\"https://www.berlin.de/en/tourism/guides/x/2044870-5426434-city-tour-by-bus-hop-on-hop-off-tours.en.html\" target=\"_top\" data-campaign=\"cm.articles.2044870\">Stops at Alexanderplatz: Hop-On Hop-Off City Tour by Bus</a></li>\n<li><a class=\"\" href=\"https://www.berlin.de/en/tourism/bicycle-tours/x/3786816-5458307-bike-tour-berlins-best-tour.en.html\" target=\"_top\" data-campaign=\"cm.articles.3786816\">Guided Bike Tour: Berlin\'s Best</a></li>\n</ul>\n</div>\n<div class=\"block paragraph  \">\n<div class=\"inner\">Alexanderplatz owes its current name to King Frederick William III, who renamed the square on the occasion of the visit of Tsar Alexander in 1805. Today\'s lively meeting place for Berliners and tourists was used as a military parade and drill ground until the middle of the 19th century. Merchants and farmers of the region also used the square to sell their goods.</div>\n</div>\n<div class=\"block paragraph  \">\n<h3 id=\"h3868591\">Important Site of Historical Events</h3>\n<div class=\"inner\">The former parade ground has repeatedly been the scene for important historical events. During the March Revolution in 1848, the square was the location of heavy street fights. More peaceful fights for freedom took place here during the protests against the Socialist German regime in the fall of 1989, which culminated on Alexanderplatz on November 4, shortly before the fall of the Wall.</div>\n</div>\n<div class=\"block paragraph  \">\n<h3 id=\"h3868592\">Alexanderplatz after the Second World War.</h3>\n<div class=\"inner\">Like many places in Berlin, Alexanderplatz did not survive the Second World War unscathed. In April 1945, large-scale destruction occurred here in the course of hostilities. After the end of the war, Alexanderplatz was in located the Soviet occupation zone. Under Soviet control, the square in Berlin\'s eastern center took on its current form in the 1960s and 70s. In the spring of 1964, a competition to redesign Alexanderplatz was announced. The competition winner envisaged two important points for the square: freeing it from traffic and improving its quality of stay for pedestrians.</div>\n</div>\n<div class=\"block paragraph  \">\n<h3 id=\"h3868593\">Major Sights at Alexanderplatz</h3>\n<div class=\"inner\">By 1969, all tram lines crossing Alexanderplatz were removed and the square\'s most distinctive buildings to this day were built: the former Centrum department store (now Galeria Kaufhof), the former Hotel Stadt Berlin (now Hotel Park Inn), the World Time Clock, and the Fountain of Friendship between Nations. The same year, after four years of construction, the TV Tower was inaugurated. Standing 365 meters tall, it is the tallest building in Germany. A ride up into the rotating observation platform will reward visitors with an unbeatable view of the city. Not far from Alexanderplatz you will find the famous&nbsp;<a href=\"https://www.berlin.de/en/attractions-and-sights/3559880-3104052-red-city-hall.en.html\" target=\"_blank\" rel=\"noopener\">Red City Hall</a>&nbsp;and the Neptune Fountain. Since 1998, trams have been crossing Alexanderplatz again.</div>\n</div>',2);
/*!40000 ALTER TABLE `layer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layer_tours`
--

DROP TABLE IF EXISTS `layer_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layer_tours` (
  `layer_id` int NOT NULL,
  `tours_id` int NOT NULL,
  UNIQUE KEY `UK_jvho656skf2x31f2mkiswyhbt` (`tours_id`),
  KEY `FK6dvsh1ptt9vjyiy3qqn4vueo1` (`layer_id`),
  CONSTRAINT `FK6dvsh1ptt9vjyiy3qqn4vueo1` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKcyumcxn34a9x8rc0249erohrk` FOREIGN KEY (`tours_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layer_tours`
--

LOCK TABLES `layer_tours` WRITE;
/*!40000 ALTER TABLE `layer_tours` DISABLE KEYS */;
/*!40000 ALTER TABLE `layer_tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layers_tags`
--

DROP TABLE IF EXISTS `layers_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `layers_tags` (
  `layer_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`layer_id`,`tag_id`),
  KEY `FKbf8birdeht3xsy4swu7adb8ro` (`tag_id`),
  CONSTRAINT `FKbf8birdeht3xsy4swu7adb8ro` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`),
  CONSTRAINT `FKnjg4yk7ktyfiugqbr938s2k3j` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layers_tags`
--

LOCK TABLES `layers_tags` WRITE;
/*!40000 ALTER TABLE `layers_tags` DISABLE KEYS */;
INSERT INTO `layers_tags` VALUES (5,3),(8,3),(10,3),(5,4),(10,4),(8,6),(8,7),(10,9),(13,11),(15,11),(13,12),(15,12),(15,14);
/*!40000 ALTER TABLE `layers_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `point` varchar(255) DEFAULT NULL,
  `text` longtext,
  `type` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `layer_id` int DEFAULT NULL,
  `tour_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr2gdhhu8rhyrvslukhtfbg8v5` (`city_id`),
  KEY `FKjxa4afqvbsksim68w7m2vrlbb` (`layer_id`),
  KEY `FKs8m2flc1idrb01230h1thvptp` (`tour_id`),
  CONSTRAINT `FKjxa4afqvbsksim68w7m2vrlbb` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKr2gdhhu8rhyrvslukhtfbg8v5` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FKs8m2flc1idrb01230h1thvptp` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (17,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/041602cb-326c-4aad-9596-fbf651c506e1','Old Synagouge',0,'1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000','49.840232696174596,24.034295515227313','<p>The&nbsp;<strong>Golden Rose Synagogue</strong>, known also as the&nbsp;<strong>Nachmanowicz Synagogue</strong>, or the&nbsp;<strong>Turei Zahav Synagogue</strong>&nbsp;(<a title=\"Hebrew language\" href=\"https://en.wikipedia.org/wiki/Hebrew_language\">Hebrew</a>:&nbsp;<span dir=\"rtl\" lang=\"he\">בית הכנסת טורי זהב</span>) was a&nbsp;<a title=\"Synagogue\" href=\"https://en.wikipedia.org/wiki/Synagogue\">synagogue</a>&nbsp;in&nbsp;<a title=\"Lviv\" href=\"https://en.wikipedia.org/wiki/Lviv\">Lviv</a>, western&nbsp;<a title=\"Ukraine\" href=\"https://en.wikipedia.org/wiki/Ukraine\">Ukraine</a>. The Golden Rose Synagogue was the&nbsp;<a class=\"mw-redirect\" title=\"Oldest synagogues in the World\" href=\"https://en.wikipedia.org/wiki/Oldest_synagogues_in_the_World\">oldest synagogue</a>&nbsp;in what is now Ukraine.</p>\n<p>A midtown plot of land was bought in 1580, and the synagogue was founded and funded in 1581 by Yitzhak ben Nachman (Izak Nachmanowicz), a financier to&nbsp;<a class=\"mw-redirect\" title=\"Stefan Batory\" href=\"https://en.wikipedia.org/wiki/Stefan_Batory\">Stefan Batory</a>,&nbsp;<a class=\"mw-redirect\" title=\"King of Poland\" href=\"https://en.wikipedia.org/wiki/King_of_Poland\">King of Poland</a>. Therefore, the oldest name of the synagogue was the Nachmanowicz Synagogue.<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-1\">[1]</a></sup></p>\n<p>It was built in 1582 by Paulus Italus (\"Paolo the Italian\") from&nbsp;<a title=\"Tujetsch\" href=\"https://en.wikipedia.org/wiki/Tujetsch\">Tujetsch</a>&nbsp;(Tschamut) village in canton&nbsp;<a class=\"mw-redirect\" title=\"Graub&uuml;nden\" href=\"https://en.wikipedia.org/wiki/Graub%C3%BCnden\">Graub&uuml;nden</a>,&nbsp;<a title=\"Switzerland\" href=\"https://en.wikipedia.org/wiki/Switzerland\">Switzerland</a>, a master builder known by his guild nickname Paweł Szczęśliwy (Paul the Fortunate, in Polish).<sup id=\"cite_ref-2\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-2\">[2]</a></sup></p>\n<p>In 1595, the same Paolo, assisted by Ambrogio Nutclauss (alias Ambroży Przychylny), by Adam Pokora, and by master Zachariasz (most probably, Zachariasz Sprawny, alias Zaccaria de Lugano) built a&nbsp;<a title=\"Vestibule (architecture)\" href=\"https://en.wikipedia.org/wiki/Vestibule_(architecture)\">vestibule</a>&nbsp;and a women\'s gallery in the synagogue. Men prayed in a hall that was spanned by a cloister&nbsp;<a title=\"Rib vault\" href=\"https://en.wikipedia.org/wiki/Rib_vault\">rib vault</a>&nbsp;with pointed&nbsp;<a title=\"Lunette\" href=\"https://en.wikipedia.org/wiki/Lunette\">lunettes</a>&nbsp;above the windows. An alabaster&nbsp;<a class=\"mw-redirect\" title=\"Ark (synagogue)\" href=\"https://en.wikipedia.org/wiki/Ark_(synagogue)\">Torah ark</a>&nbsp;in&nbsp;<a title=\"Renaissance\" href=\"https://en.wikipedia.org/wiki/Renaissance\">renaissance style</a>&nbsp;was located at the eastern wall. A&nbsp;<a title=\"Bema\" href=\"https://en.wikipedia.org/wiki/Bema#Judaism\">bimah</a>&nbsp;was located in the middle of the prayer hall. The building was topped by an&nbsp;<a title=\"Attic\" href=\"https://en.wikipedia.org/wiki/Attic\">attic</a>&nbsp;in&nbsp;<a class=\"mw-redirect\" title=\"Manierism\" href=\"https://en.wikipedia.org/wiki/Manierism\">Mannerist style</a>.<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-3\">[3]</a></sup><sup id=\"cite_ref-4\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-4\">[4]</a></sup></p>\n<p>In 1606 the building was confiscated by the&nbsp;<a title=\"Jesuits\" href=\"https://en.wikipedia.org/wiki/Jesuits\">Jesuits</a>. In 1609, after paying a ransom of 20,600 guilders the synagogue was returned to the Jewish community. A local legend (first published in 1863) ascribed the merit of the restitution of the synagogue to Rosa bat Ya\'akov, Yitzhak\'s daughter-in-law.<sup id=\"cite_ref-5\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-5\">[5]</a></sup>&nbsp;The synagogue was therefore also called the Golden Rose Synagogue after her. Rabbi Yitzhak ben Shemuel HaLevi composed in 1609&nbsp;<em>Shir Ge\'ula</em>&nbsp;(a Song of Deliverance) &ndash; which was read each year as a part of the&nbsp;<a title=\"Shacharit\" href=\"https://en.wikipedia.org/wiki/Shacharit\">shacharit</a>&nbsp;prayer on Shabbat following&nbsp;<a title=\"Purim\" href=\"https://en.wikipedia.org/wiki/Purim\">Purim</a>. The Song of Deliverance compared the return of the synagogue to the Jewish community to the salvation of the Jews from the Babylonian and Egyptian captivities.<sup id=\"cite_ref-6\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Golden_Rose_Synagogue_(Lviv)#cite_note-6\">[6]</a></sup></p>\n<p>In 1654-67, rabbi&nbsp;<a title=\"David HaLevi Segal\" href=\"https://en.wikipedia.org/wiki/David_HaLevi_Segal\">David HaLevi Segal</a>, called TaZ after his main work Sefer&nbsp;<a class=\"mw-redirect\" title=\"Turei Zahav\" href=\"https://en.wikipedia.org/wiki/Turei_Zahav\">Turei Zahav</a>, the younger brother of Yitzhak HaLevi and his pupil, prayed in this synagogue. For that reason the building was also named the TaZ Synagogue.</p>\n<p>In 1941, the synagogue was desecrated, and in 1943 ruined by the&nbsp;<a class=\"mw-redirect\" title=\"Nazis\" href=\"https://en.wikipedia.org/wiki/Nazis\">Nazis</a>.</p>\n<p>&nbsp;</p>',NULL,1,5,16),(18,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/5cc3d656-a1d1-4d58-8f33-58b15713d493','City walls',1,'1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000','49.841668316219746,24.035355391365556','<p>When the Austrian Empire acquired Lviv in 1772, the city&rsquo;s fortification walls and moats were in a particularly poor state. Five years later, the new rulers began to pull down the fortifications as part of their urban planning strategy, which, among other aims, sought to unite the historic center and the outlying districts. By the late 1820s, most of the fortifications were demolished and in their place a modern ring boulevard was being created, which was also to have an administrative and cultural function.</p>\n<p>Pictured below is the new recreational promenades that were constructed in place of the city&rsquo;s outdated fortification walls:</p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/d1e79a74-cf01-4e1f-b5d0-cef2f156f29d\" alt=\"\" width=\"500\" height=\"357\"></p>',NULL,1,5,16),(19,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/3ed40802-21cb-46ab-8dee-2251a213ead8','Park na Valakh',2,'1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000','49.84177210183339,24.033816921957396','<p>Park \"On the ramparts\" - a park in the Galician district of Lviv (Ukraine), a monument of landscape art of local importance (since 1984). The total area is 1.9 hectares.</p>\n<p>This small park (sometimes also called a public garden) is located between Podvalnaya (former Gubernatorskie Valy) and Vinnichenko streets. Nearby are the Powder Tower and the oldest school building in Lviv, secondary school No. 19. This is the second oldest park in the city.</p>\n<p>At the end of the 18th century, powerful city fortifications were located here, the thickness of the walls reached six meters. After the transfer of Lviv to the Habsburg Monarchy in 1772, the walls were dismantled and only the Powder Tower remained of all the fortifications. In 1821, the Austrian provincial councilor Reitzenheim built a park with walking paths here. A suspension bridge was thrown over a large swampy ravine located here at that time. Nowadays, ancient, almost two hundred years old trees create one of the tightest alleys in the city in the park.</p>',NULL,1,5,16),(20,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/0e2687aa-c49a-403e-a7c3-37fa44d1d0a0','DRUNK CHERRY',3,'1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000','49.84158128995628,24.032647478826902','<p><br>The best Lviv tincture is an integral part of old Lviv. Drunken cherry has long been infused in every house in Lviv. Every Lviv housewife made that tincture, and every young lady knew that taste. The tincture was so delicious that no female, regardless of age, could resist its taste. And female colleagues, no matter how they tried to gossip about boys, always tasted the tincture.</p>\n<p>The drink is tasty, takes away quickly. Made according to a traditional recipe using the best brandy alcohol from selected cherries. Good for hunting or other adventures. Helps to find love since the 17th century.</p>',NULL,1,5,16),(22,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/d2b8e82f-7c80-4e3d-9ff9-454f6d1552f7','Castle remains',0,'1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000','49.848902048683435,24.03359248616107','<p>The&nbsp;<strong>Lviv High Castle</strong>&nbsp;(<a title=\"Ukrainian language\" href=\"https://en.wikipedia.org/wiki/Ukrainian_language\">Ukrainian</a>:&nbsp;<span lang=\"uk\">Високий замок</span>,&nbsp;<small><a title=\"Romanization of Ukrainian\" href=\"https://en.wikipedia.org/wiki/Romanization_of_Ukrainian\">romanized</a>:&nbsp;</small><span title=\"Ukrainian-language romanization\"><em lang=\"uk-Latn\">Vysokyi zamok</em></span>;&nbsp;<a title=\"Polish language\" href=\"https://en.wikipedia.org/wiki/Polish_language\">Polish</a>:&nbsp;<em lang=\"pl\">Wysoki Zamek we Lwowie</em>) is a&nbsp;<a title=\"History of Lviv\" href=\"https://en.wikipedia.org/wiki/History_of_Lviv\">historic castle</a>&nbsp;located on the top of the Castle Hill of the city of&nbsp;<a title=\"Lviv\" href=\"https://en.wikipedia.org/wiki/Lviv\">Lviv</a>. It is currently the highest point in the city, 413 metres (1,355&nbsp;ft) above&nbsp;<a title=\"Sea level\" href=\"https://en.wikipedia.org/wiki/Sea_level\">sea level</a>. The castle currently stands in ruins.</p>\n<p>The High Castle is proximate to the&nbsp;<a title=\"Old Town (Lviv)\" href=\"https://en.wikipedia.org/wiki/Old_Town_(Lviv)\">centre</a>&nbsp;of Lviv (<a title=\"File:Lwow-panorama-m.jpg\" href=\"https://en.wikipedia.org/wiki/File:Lwow-panorama-m.jpg\">see picture</a>), formerly being surrounded by a fortification wall. The Castle Hill took its name from the High Castle (as opposed to the other, Low Castle), which used to be located on the hill from the 13th century to the late 19th century. The castle was a main defensive fort of the city during its existence.</p>\n<p>As it follows from Rus\' Chronicles, the first fortifying structures appeared on the Castle Hill in the time&nbsp;<a class=\"mw-redirect\" title=\"Halych-Volhynia\" href=\"https://en.wikipedia.org/wiki/Halych-Volhynia\">Halych-Volhynia</a>, and were built by&nbsp;<a class=\"mw-redirect\" title=\"Leo I of Halych\" href=\"https://en.wikipedia.org/wiki/Leo_I_of_Halych\">Leo I of Halych</a>&nbsp;from wood. It was originally a wood and soil construction, as most others at that time. In 1259 by a request of Burunday Khan they were destroyed. In 1270 they were rebuilt.</p>\n<p>In 1340, when Lviv was captured by&nbsp;<a class=\"mw-redirect\" title=\"Casimir III of Poland\" href=\"https://en.wikipedia.org/wiki/Casimir_III_of_Poland\">Casimir III of Poland</a>&nbsp;the wooden castle was put under fire. In 1353 it was destroyed again by Lithuanians. A new brick castle appeared on the hill in 1362 by the king Casmimir III. It became the residence of Polish nobles. In 1537, the castle witnessed a rebellion known as the&nbsp;<a title=\"Chicken War\" href=\"https://en.wikipedia.org/wiki/Chicken_War\">Chicken War</a>&nbsp;against Polish king&nbsp;<a title=\"Sigismund I the Old\" href=\"https://en.wikipedia.org/wiki/Sigismund_I_the_Old\">Sigismund I the Old</a>&nbsp;and his wife&nbsp;<a title=\"Bona Sforza\" href=\"https://en.wikipedia.org/wiki/Bona_Sforza\">Bona Sforza</a>.</p>\n<p>The castle was rebuilt and repaired many times. In the times of&nbsp;<a title=\"Khmelnytsky Uprising\" href=\"https://en.wikipedia.org/wiki/Khmelnytsky_Uprising\">Khmelnytsky Uprising</a>&nbsp;it was taken by Cossack forces of Colonel&nbsp;<a title=\"Maksym Kryvonis\" href=\"https://en.wikipedia.org/wiki/Maksym_Kryvonis\">Maksym Kryvonis</a>&nbsp;in October 1648. In 1704, when Lviv was occupied by Swedes the castle was heavily damaged. In 1777, Austrians initiated disassembling of fortifications around the castle.</p>\n<p>In the 19th century, the then destroyed castle was taken apart and new facilities were built in its place. The fortification was strengthened, trees were planted on the hill\'s slope, and a park was constructed. On the place where the castle once stood, a&nbsp;<a title=\"Union of Lublin Mound\" href=\"https://en.wikipedia.org/wiki/Union_of_Lublin_Mound\">Union of Lublin Mound</a>&nbsp;was constructed in 1869, dedicated to the 300-years of the&nbsp;<a title=\"Union of Lublin\" href=\"https://en.wikipedia.org/wiki/Union_of_Lublin\">Union of Lublin</a>. Currently, an observation platform is located atop the kurgan. In 1957, a 141-meter tall&nbsp;<a class=\"mw-redirect\" title=\"Television tower\" href=\"https://en.wikipedia.org/wiki/Television_tower\">television tower</a>&nbsp;was constructed on a ridge of the hill (<a title=\"File:Ukraine-Lviv-High Castle-8.jpg\" href=\"https://en.wikipedia.org/wiki/File:Ukraine-Lviv-High_Castle-8.jpg\">see picture</a>).</p>\n<p>In 2004-2005, there were talks of reconstructing a stone castle on the hill. The project gained some support and opposition. However, at this time, plans for the construction of the castle are not realistic.</p>\n<p><em><a title=\"Highcastle\" href=\"https://en.wikipedia.org/wiki/Highcastle\">Highcastle: A Remembrance</a></em>&nbsp;(<a title=\"Polish language\" href=\"https://en.wikipedia.org/wiki/Polish_language\">Polish</a>:&nbsp;<em lang=\"pl\">Wysoki Zamek</em>), a 1966&nbsp;<a title=\"Coming-of-age story\" href=\"https://en.wikipedia.org/wiki/Coming-of-age_story\">coming-of-age</a>&nbsp;autobiographical novel by the Polish science fiction writer&nbsp;<a title=\"Stanisław Lem\" href=\"https://en.wikipedia.org/wiki/Stanis%C5%82aw_Lem\">Stanisław Lem</a>, refers to the castle.&nbsp;<sup id=\"cite_ref-iresy_1-0\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Lviv_High_Castle#cite_note-iresy-1\">[1]</a></sup></p>',NULL,1,8,21),(23,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/e012d6dd-4d69-4ec7-b0e9-9badae8910be','TV Tower',1,'1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000','49.847875356241126,24.03685405232318','<ul class=\"listspacing\">\n<li><span class=\"rubric\">Type:&nbsp;</span><span class=\"withicon typeicon\"><a title=\"Tower\" href=\"https://en.wikipedia.org/wiki/Tower\" target=\"_blank\" rel=\"noopener\">Tower</a></span></li>\n<li><span class=\"rubric\">Description:&nbsp;</span>television tower in Ukraine</li>\n<li><span class=\"rubric\">Category:&nbsp;</span><a title=\"television tower\" href=\"https://www.wikidata.org/wiki/Q11166728\" target=\"_blank\" rel=\"noopener\">television tower</a></li>\n<li><span class=\"rubric\">Location:&nbsp;</span><a title=\"Lviv Oblast\" href=\"https://mapcarta.com/Lviv_Oblast\" rel=\"noopener\">Lviv Oblast</a>,&nbsp;<a title=\"Western Ukraine\" href=\"https://mapcarta.com/Western_Ukraine\" rel=\"noopener\">Western Ukraine</a>,&nbsp;<a title=\"Ukraine\" href=\"https://mapcarta.com/Ukraine\" rel=\"noopener\">Ukraine</a>,&nbsp;<a title=\"Eastern Europe\" href=\"https://mapcarta.com/Eastern_Europe\" rel=\"noopener\">Eastern Europe</a>,&nbsp;<a title=\"Europe\" href=\"https://mapcarta.com/Europe\" rel=\"noopener\">Europe</a></li>\n</ul>',NULL,1,8,21),(24,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/13897c2d-0077-4ead-a14b-6f0f5aeefd72','old Rathaus lion',2,'1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000','49.84822126300332,24.03954699017413','<p>Grotto on the lower terrace of the park in 1841</p>',NULL,1,8,21),(25,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/65f97ec5-f414-451b-b315-67b719829ac1','Union of Lublin Mound',3,'1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000','49.847812345334376,24.033934945830424','<p>Anyone who loves viewing platforms and higher, then you are definitely here. Castle Hill will give a lot of pleasant impressions, namely, gorgeous views from a high point on the new Lviv and on the old one) You can perfectly see the town hall and many churches. The entrance is absolutely free, it&rsquo;s hard to climb, of course, but if you don&rsquo;t rush, then you can climb calmly and slowly in 20 minutes.</p>',NULL,1,8,21),(27,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/719325fe-22c2-41ae-9bd7-fbe1aa4e12cb','Black House',0,'1960-11-28 21:46:42.723000','1352-11-20 21:44:34.431000','49.84166794818941,24.03262088208851','<p>The&nbsp;<strong>Black House</strong>&nbsp;(<a title=\"Ukrainian language\" href=\"https://en.wikipedia.org/wiki/Ukrainian_language\">Ukrainian</a>:&nbsp;<span lang=\"uk\">Чорна кам\'яниця</span>,&nbsp;<em><span title=\"Ukrainian-language romanization\"><em lang=\"uk-Latn\">Chorna Kamyanytsia</em></span></em>;&nbsp;<a title=\"Polish language\" href=\"https://en.wikipedia.org/wiki/Polish_language\">Polish</a>:&nbsp;<em lang=\"pl\">Czarna&nbsp;<a class=\"mw-redirect\" title=\"Kamienica (architecture)\" href=\"https://en.wikipedia.org/wiki/Kamienica_(architecture)\">Kamienica</a></em>) is a remarkable&nbsp;<a title=\"Renaissance\" href=\"https://en.wikipedia.org/wiki/Renaissance\">Renaissance</a>&nbsp;building on the&nbsp;<a class=\"mw-redirect\" title=\"Lviv Market Square\" href=\"https://en.wikipedia.org/wiki/Lviv_Market_Square\">Market Square</a>&nbsp;in the city of&nbsp;<a title=\"Lviv\" href=\"https://en.wikipedia.org/wiki/Lviv\">Lviv</a>,&nbsp;<a title=\"Ukraine\" href=\"https://en.wikipedia.org/wiki/Ukraine\">Ukraine</a>. It was built for Italian tax-collector Tomaso Alberti in 1577. The architect was probably&nbsp;<a class=\"new\" title=\"Piotr Krasowski (page does not exist)\" href=\"https://en.wikipedia.org/w/index.php?title=Piotr_Krasowski&amp;action=edit&amp;redlink=1\">Piotr Krasowski</a>.<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"https://en.wikipedia.org/wiki/Black_House,_Lviv#cite_note-1\">[1]</a></sup>&nbsp;The&nbsp;<a class=\"new\" title=\"Lviv Historical Museum (page does not exist)\" href=\"https://en.wikipedia.org/w/index.php?title=Lviv_Historical_Museum&amp;action=edit&amp;redlink=1\">Lviv Historical Museum</a>&nbsp;has been housed in the Black House since 1926.</p>\n<p>The fa&ccedil;ade is lined with&nbsp;<a title=\"Sandstone\" href=\"https://en.wikipedia.org/wiki/Sandstone\">sandstone</a>&nbsp;which has darkened over the years to blackish brown. The front exhibits some fine decorative ornamentation. Jan Lorencowicz acquired the house in 1596, adding another storey and opening one of the town\'s first&nbsp;<a title=\"Pharmacy\" href=\"https://en.wikipedia.org/wiki/Pharmacy\">pharmacies</a>&nbsp;on the ground floor. The uppermost storey was added in 1884.</p>',NULL,1,10,26),(28,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/d55568a7-64cf-4275-9833-0bd70ad19144','Scholz-Wolf House',1,'1960-11-28 21:46:42.723000','1352-11-20 21:44:34.431000','49.842387523866904,24.03231511026081','<p>Wolf Scholz, or Wolfgang Scholz (German: Wolf or Wolfgang Scholz, Polish: Wolfgang Szolc) (1505? &mdash; 1572?) was a Lviv merchant, shopkeeper (1529&mdash;1540), viit (1533, 1534, 1537, 1539), city councilor (1544-1568) and burgomaster (1554, 1556, 1559, 1561).</p>\n<p>Biography<br>He came from Silesia. He arrived in Lviv as a merchant from Wroclaw during the reign of King Sigismund I the Old [1]. In 1543, he was elected city mayor, and later burgomaster.</p>\n<p>He is known for having 12 sons and 12 daughters from one wife, Beata, the daughter of the Lviv patrician Gaz (probably Melchior). Because of the marriage, they joked in the town that the Wolf married the Hare. After his death, he left a huge legacy at that time &mdash; 25,000 in gold, in addition to houses, shops and land.</p>\n<p>Together with his brothers Yakub and Yohan, he is the founder of the family of the Lviv patricians Sholz-Wolfovich. The Scholz-Wolfovych family owned a tenement house at Rynok Square, 23 &mdash; (conscription number 47) and a tenement house, which does not exist today, on the site of building No. 32 of Rynok Square in Lviv.[2]</p>',NULL,1,10,26),(29,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,NULL,'http://localhost:8080/files-uploader/file/image/e600bfc5-f199-4051-8396-b05915604c65','Zipper Family House',2,'1960-11-28 21:46:42.723000','1352-11-20 21:44:34.431000','49.84235984807734,24.031478261048164','<p>Zipper Family House at Nr. 32</p>',NULL,1,10,26);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_tags`
--

DROP TABLE IF EXISTS `locations_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_tags` (
  `location_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`location_id`,`tag_id`),
  KEY `FKtdnn0jyb53jixkem0vhsonden` (`tag_id`),
  CONSTRAINT `FK4ujg7x8hoeucjuj5ruyh5i084` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKtdnn0jyb53jixkem0vhsonden` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_tags`
--

LOCK TABLES `locations_tags` WRITE;
/*!40000 ALTER TABLE `locations_tags` DISABLE KEYS */;
INSERT INTO `locations_tags` VALUES (17,3),(18,3),(19,3),(20,3),(17,4),(18,4),(19,4),(20,4),(27,4),(28,4),(29,4),(22,6),(23,6),(24,6),(25,6),(22,7),(23,7),(24,7),(25,7),(27,9),(28,9),(29,9);
/*!40000 ALTER TABLE `locations_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1wdpsed5kna2y38hnbgrnhi5b` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (14,'AlexandrPlatz'),(11,'Berlin'),(7,'City Park'),(12,'East Berlin'),(6,'High Castle'),(3,'Lviv'),(9,'Market Square'),(4,'Old City');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int NOT NULL,
  `approved` bit(1) DEFAULT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  `date_added` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `period_end` datetime(6) DEFAULT NULL,
  `period_start` datetime(6) DEFAULT NULL,
  `text` longtext,
  `type` varchar(255) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `layer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpy38sq4e84fouj3ixh3t6pkhs` (`city_id`),
  KEY `FK3k1ku3q7wcsbh9orxqs2vpr0k` (`layer_id`),
  CONSTRAINT `FK3k1ku3q7wcsbh9orxqs2vpr0k` FOREIGN KEY (`layer_id`) REFERENCES `layer` (`id`),
  CONSTRAINT `FKpy38sq4e84fouj3ixh3t6pkhs` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (16,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,65,NULL,'http://localhost:8080/files-uploader/file/image/2ebac145-433d-4488-9c19-4e9a5f67ba62','City wall','1960-10-28 20:46:06.305000','1256-11-21 20:43:47.648000','<p>Tour around city walls</p>\n<p>You will see Lviv\'s oldest past</p>\n<p>Join this exciting journey</p>\n<p><img src=\"http://localhost:8080/files-uploader/file/image/d15b0d01-be8d-4e2f-b9da-e06ed82498e6\" alt=\"\" width=\"500\" height=\"174\"></p>',NULL,1,5),(21,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,110,NULL,'http://localhost:8080/files-uploader/file/image/d15b0d01-be8d-4e2f-b9da-e06ed82498e6','High Castle Tour','1900-11-28 21:34:32.939000','1270-11-21 21:32:23.676000','<p>Join the high Castle tour</p>',NULL,1,8),(26,NULL,'af0a9415-de24-4867-a31e-7212767bf82f',NULL,NULL,45,NULL,'http://localhost:8080/files-uploader/file/image/8b1a6c49-60f9-458c-a1b9-871d4a5003dc','Market Square Tour','1960-11-28 21:46:42.723000','1352-11-20 21:44:34.431000','<p>The very center of the city</p>',NULL,1,10);
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_locations`
--

DROP TABLE IF EXISTS `tour_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_locations` (
  `tour_id` int NOT NULL,
  `locations_id` int NOT NULL,
  UNIQUE KEY `UK_esg04snnosykya5bc4ocx33mv` (`locations_id`),
  KEY `FKmq7ddlq4jy4nu36me2qpobxkp` (`tour_id`),
  CONSTRAINT `FK876x0thfod30ip67dhro4qhqw` FOREIGN KEY (`locations_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKmq7ddlq4jy4nu36me2qpobxkp` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_locations`
--

LOCK TABLES `tour_locations` WRITE;
/*!40000 ALTER TABLE `tour_locations` DISABLE KEYS */;
INSERT INTO `tour_locations` VALUES (16,17),(16,18),(16,19),(16,20),(21,22),(21,23),(21,24),(21,25),(26,27),(26,28),(26,29);
/*!40000 ALTER TABLE `tour_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_tags`
--

DROP TABLE IF EXISTS `tours_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours_tags` (
  `tour_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`tour_id`,`tag_id`),
  KEY `FK40hqhk3exyuufvmraypdcet73` (`tag_id`),
  CONSTRAINT `FK1kmioisse1ggqaffe0slt1jde` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`id`),
  CONSTRAINT `FK40hqhk3exyuufvmraypdcet73` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_tags`
--

LOCK TABLES `tours_tags` WRITE;
/*!40000 ALTER TABLE `tours_tags` DISABLE KEYS */;
INSERT INTO `tours_tags` VALUES (16,3),(16,4),(26,4),(21,6),(21,7),(26,9);
/*!40000 ALTER TABLE `tours_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-28 23:01:34
