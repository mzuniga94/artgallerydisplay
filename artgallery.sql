USE `artgallery`;

--
-- Drop tables if they already exist
--

DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `artist`;
DROP TABLE IF EXISTS `artwork`;
DROP TABLE IF EXISTS `exhibit`;
DROP TABLE IF EXISTS `employee`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
); 

--
-- Inserting data for table `admin`
--

INSERT INTO `admin` (`adminId`, `userName`, `password`) VALUES
(1, 'admin', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

-- Artist may not have last name such as the case with Caravaggio

CREATE TABLE IF NOT EXISTS `artist` (
  `artistId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255),
  `lastName` varchar(255),
  `birthPlace` varchar(255) NOT NULL,
  `birthDate` date NOT NULL,
  `artPeriod` varchar(255) NOT NULL,
  `bio` varchar(4096) NOT NULL,
  PRIMARY KEY (`artistId`)
);

--
-- Inserting data for table `artist`
--

INSERT INTO `artist` (`artistId`, `firstName`, `middleName`, `lastName`, `birthPlace`, `birthDate`, `artPeriod`, `bio`) VALUES
(1, 'Pablo', '', 'Picasso', 'Malaga, Spain', '1881-10-25', 'Modern', 'Pablo Picasso was a Spanish artist who was best known for deconstructing the human figure and his contributions to modern art movements like Cubism.'),
(2, 'Vincent', 'Van', 'Gogh', 'Zundert, Netherlands', '1853-03-30', 'Modern', 'Vincent Van Gogh was best known for his works in Impressionism and Expressionism.'),
(3, 'Caravaggio', '', '', 'Milan, Italy', '1571-09-29', 'Baroque', 'Caravaggio was a Baroque artist who used chiaroscuro to bring dramatic contrast in his realistic paintings.'),
(4, 'Frida', '', 'Kahlo', 'Coyoacan, Mexico City, Mexico', '1907-07-06', 'Modern', 'Frida Kahlo was a surrealist artist who explored concepts such as identity and gender.'),
(5, 'Salvador', '', 'Dali', 'Figueres, Spain', '1904-05-11', 'Modern', 'Salvador Dali was best known for his surrealist works and his eccentricity.');
-- --------------------------------------------------------

-- 
-- Table structure for table `artwork`
--

CREATE TABLE IF NOT EXISTS `artwork` (
	`artworkId` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`artist` varchar(255) NOT NULL,
	`dateOfCreation` int(4),
	`artPeriod` varchar(255) NOT NULL,
	`description` varchar(4096) NOT NULL,
	PRIMARY KEY (`artworkId`)
);

--
-- Inserting data for table `artwork`
--

INSERT INTO `artwork` (`artworkId`, `title`, `artist`, `dateOfCreation`, `artPeriod`, `description`) VALUES
(1, 'Guernica', 'Pablo Picasso', 1937, 'Cubism', 'Guernica depicts a horrifying scene of the bombing of Guernica.'),
(2, 'Starry Night', 'Vincent Van Gogh', 1889, 'Post-Impressionism', 'Perhaps his most well-known work, Starry Night depicts the view from the asylum he was staying in.'),
(3, 'Judith Beheading Holofernes', 'Caravaggio', 1599, 'Caravaggio', 'A gruesome scene showing the Biblical story of Judith who beheads Holofernes. This was a common theme in 16th century artwork.'),
(4, 'The Broken Column', 'Frida Kahlo', 1944, 'Surrealism', 'The Broken Column is a depiction of Frida''s pain and suffering in her life.'),
(5, 'Persistence of Memory', 'Salvador Dali', 1931, 'Surrealism', 'Depicts Dali''s theory of hardness and softness of time.');

-- --------------------------------------------------------

-- 
-- Table structure for table `exhibit`
--

CREATE TABLE IF NOT EXISTS `exhibit` (
	`exhibitId` int(11) NOT NULL AUTO_INCREMENT,
	`exhibitName` varchar(255) NOT NULL,
	`dateStart` date NOT NULL,
	`dateEnd` date NOT NULL,
	`description` varchar(4096) NOT NULL,
	PRIMARY KEY (`exhibitId`)
);

--
-- Inserting data for table `exhibit`
--

INSERT INTO `exhibit` (`exhibitId`, `exhibitName`, `dateStart`, `dateEnd`, `description`) VALUES
(1, 'California Impressionism', '2018-12-16', '2019-03-31', 'Discover the hidden artists of California Impressionists.'),
(2, 'History of Women Artists', '2019-03-08', '2019-03-31', 'Learn about the hidden figures of the art world.');

-- --------------------------------------------------------

-- 
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employee` (
	`employeeId` int(11) NOT NULL AUTO_INCREMENT,
	`firstName` varchar(255) NOT NULL,
	`middleName` varchar(255),
	`lastName` varchar(255) NOT NULL,
	`birthDate` date NOT NULL,
	`hireDate` date NOT NULL,
	`position` varchar(255) NOT NULL,
	`salary` int(11) NOT NULL,
	PRIMARY KEY (`employeeId`)
);

--
-- Inserting data for table `employees`
--

INSERT INTO `employee` (`employeeId`, `firstName`, `middleName`, `lastName`, `birthDate`, `hireDate`, `position`, `salary`) VALUES
(1, 'Collette', 'Nancy', 'Crenshaw', '1978-05-15', '2014-06-10', 'Museum Docent', 30000),
(2, 'Ochako', '', 'Uraraka', '1975-12-08', '2015-11-01', 'Gallery Director', 110000),
(3, 'Thomas', 'Norbert', 'McDonald', '1981-07-25', '2004-11-23', 'Security Guard', 25000),
(4, 'Sharon', 'Gerina', 'Ellis', '1979-01-13', '2017-04-25', 'Curator', 60000),
(5, 'Fumikage', '', 'Tokoyami', '1990-10-30', '2019-01-24', 'Accountant', 75000);