-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2020 at 01:23 PM
-- Server version: 10.1.41-MariaDB
-- PHP Version: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `root_resq`
--

-- --------------------------------------------------------

--
-- Table structure for table `adreferrals`
--

CREATE TABLE `adreferrals` (
  `adid` int(9) DEFAULT NULL,
  `userid` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `adid` int(9) NOT NULL,
  `bannertitle` varchar(150) DEFAULT NULL,
  `articletitle` varchar(150) NOT NULL,
  `description` varchar(180) DEFAULT NULL,
  `fullarticle` text NOT NULL,
  `imageurl` varchar(250) DEFAULT NULL,
  `websitelink` varchar(250) DEFAULT NULL,
  `typeofad` int(3) DEFAULT NULL COMMENT '1: Header, 2: Footer, 3: Courses',
  `addestination` varchar(50) NOT NULL,
  `areaid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`adid`, `bannertitle`, `articletitle`, `description`, `fullarticle`, `imageurl`, `websitelink`, `typeofad`, `addestination`, `areaid`) VALUES
(1, 'DO NOT PANIC', 'Are you prepared?', 'Coronavirus: Learn about the safety and readiness tips\r\n\r\n\r\nto help prevent the spread of COVID-19.', '', 'http://www.praxello.com/images/coronavirus.png', NULL, 1, 'HOME', 1),
(2, 'REMOVE', 'Santosh,', 'Remove this section', '', 'http://www.praxello.com/images/coronavirus.png', NULL, 3, 'HOME', 1),
(3, '', 'Just released: Classroom course for Handling Orthodontics Emergencies', '', '', '', NULL, 2, 'HOME', 1),
(4, '', 'Sign up today for a Basic CPR class.', '', '', '', NULL, 2, 'HOME', 1),
(5, 'Emergency Happens', 'Are you prepared?', 'It doesn\'t make a sense to dig a well when you are thirsty. ResQuers keep their kits and supplies up-to-date and are well prepared all the time.', '', 'http://www.praxello.com/images/prepare1.png', NULL, 1, 'PREPARE', 1),
(6, 'Every dental workplace must hold an emergency drugs box.', '', '', '', '', NULL, 2, 'HOME', 1),
(7, 'Learning Tools', 'Are you ResQ Certified?', 'Did you know that ResQ certified physicians and technical staff perform better in ER real time situations than others?', '', 'http://www.praxello.com/images/prepare1.png', NULL, 1, 'LEARN', 1),
(8, '', '', '', '', 'http://www.praxello.com/images/shop.png', NULL, 1, 'SHOP', 1),
(9, 'Keep Calm. All bleeding eventually stops.', '', '', '', '', NULL, 2, 'PREPARE', 1),
(10, 'First Aid for Severe Bleeding Online Course', '', 'INR 1750\r\n10th June 2020, Duration: 1 day, 5 Credits', '', 'http://www.praxello.com/images/bleeding.png', NULL, 2, 'HOME', 1),
(11, 'BE CALM', 'Are you prepared?', 'Coronavirus: Learn about the safety and readiness tips\r\n\r\n\r\nto help prevent the spread of COVID-19.', '', 'http://www.praxello.com/images/corona3.png', NULL, 1, 'HOME', 1);

-- --------------------------------------------------------

--
-- Table structure for table `algomaster`
--

CREATE TABLE `algomaster` (
  `algoid` int(9) NOT NULL,
  `conditionid` int(9) DEFAULT NULL,
  `algoname` varchar(150) NOT NULL,
  `description` text,
  `isactive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `algomaster`
--

INSERT INTO `algomaster` (`algoid`, `conditionid`, `algoname`, `description`, `isactive`) VALUES
(1001, 1, 'Angina Pectoris', 'Angina pectoris is the medical term for chest pain or discomfort due to coronary heart disease. It occurs when the heart muscle doesn\'t get as much blood as it needs. This usually happens because one or more of the heart\'s arteries is narrowed or blocked, also called ischemia.', 1),
(1002, 2, 'Syncope', 'Syncope is a temporary loss of consciousness usually related to insufficient blood flow to the brain. It\'s also called fainting or \"passing out.\" It most often occurs when blood pressure is too low (hypotension) and the heart doesn\'t pump enough oxygen to the brain.', 1),
(1003, 3, 'Chocking', 'Choking is a blockage of the upper airway by food or other objects, which prevents a person from breathing effectively. Choking can cause a simple coughing fit, but complete blockage of the airway may lead to death. Choking is a true medical emergency that requires fast, appropriate action by anyone available.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `algosteps`
--

CREATE TABLE `algosteps` (
  `algoid` int(9) NOT NULL,
  `nodeid` int(9) NOT NULL,
  `nodetype` varchar(10) NOT NULL,
  `nodetimer` int(2) NOT NULL,
  `nodecontent` text NOT NULL,
  `nextnode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `algosteps`
--

INSERT INTO `algosteps` (`algoid`, `nodeid`, `nodetype`, `nodetimer`, `nodecontent`, `nextnode`) VALUES
(1001, 1, 'Step', 0, 'Is your patient experiencing 1. sudden onset of chest pain, 2. Pain radiating to the left shoulder arm, 3. Tachycardia and high BP, 4. Dyspnea, Sweating and Apprehension?', '2'),
(1001, 2, 'Choice', 0, 'Yes', '4'),
(1001, 3, 'Choice', 0, 'No', '5'),
(1001, 4, 'Step', 0, 'Discontinue treatment and position patient comfortably.\r\nCheck pulse and respiration.\r\nStart CPR if pulse absent.\r\nAdminister O2.\r\nAdminister Nitroglycerine (0.3-0.6 mg, no more than 3 tablets in 15 minutes)\r\nCall for help if Angina persists.\r\nAdminister tablet Aspirin 325 mg if pain does not resolve.\r\nShift patient to hospital for monitoring and stabilization.', '0'),
(1001, 5, 'Step', 0, 'Reconsider diagnosis of Angina Pectoris', '0'),
(1002, 1, 'Step', 0, 'Did the patient have any of these pre-Syncopal signs and systems?\r\n1. Feeling of imminent collapse\r\n2. Perspiration, light headedness and/or blurred vision?\r\n3. Hyperventilation and/or sever anxiety?', '2'),
(1002, 2, 'Choice', 0, 'Yes', '4'),
(1002, 3, 'Choice', 0, 'No', '5'),
(1002, 4, 'Step', 0, 'Examine pulse and respiration.\r\nRecline chair so that the patient is in head-low position.\r\nRaise legs.\r\nPerform muscle movement.\r\nAmmonia smelling salts can be used if patient is Bradycardic.', '6'),
(1002, 5, 'Step', 0, 'This may not be a Syncope case. Evaluate other parameters.', '0'),
(1002, 6, 'Choice', 0, 'Next', '7'),
(1002, 7, 'Step', 0, 'Has the patient recovered?', '8'),
(1002, 8, 'Choice', 0, 'Yes', '10'),
(1002, 9, 'Choice', 0, 'No', '11'),
(1002, 10, 'Step', 0, 'Monitor before discharge.\r\nEnsure there is no post-syncopal confusion.\r\nIf confused, reconsider diagnosis or Syncope.', '0'),
(1002, 11, 'Step', 0, 'Take the patient to hospital', '0'),
(1003, 1, 'Step', 0, 'Is your patient experiencing: 1. Struggling to breath, 2. Altered breating, 3. Showing the Universal Choking Sign, 4. Foreceful coughing, 5. Some degree of Cyanosis?', '2'),
(1003, 2, 'Choice', 0, 'Yes', '6'),
(1003, 3, 'Choice', 0, 'No', '4'),
(1003, 4, 'Step', 0, 'Reconsider diagnosis of Respiratory Distress', '0'),
(1003, 5, 'Step', 0, 'Is the Patient', '0'),
(1003, 6, 'Choice', 0, 'An Adult', '9'),
(1003, 7, 'Choice', 0, 'A Child', '18'),
(1003, 8, 'Choice', 0, 'Yourself', ''),
(1003, 9, 'Step', 0, 'Assess Severirty', '10'),
(1003, 10, 'Choice', 0, 'Effective Cough', '12'),
(1003, 11, 'Choice', 0, 'Ineffective Cough', '13'),
(1003, 12, 'Step', 0, 'Encorage coughing\nMonitor continuously\nCheck for signs of resolution or deterioration', '0'),
(1003, 13, 'Step', 0, 'Assess consciousness', '14'),
(1003, 14, 'Choice', 0, 'Unconscious', '16'),
(1003, 15, 'Choice', 0, 'Conscious', '17'),
(1003, 16, 'Step', 0, 'Open airway\nGive 5 breaths\nStart CPR', '0'),
(1003, 17, 'Step', 0, 'Give 5 back blows\nGive 5 Abdominal Thrusts\nMonitor and repeat as required', '26'),
(1003, 18, 'Step', 0, 'Call for help\nLook for foreign body, if visible, remove with finger sweep\nAssess whether cough is effective', '19'),
(1003, 19, 'Choice', 0, 'Effective Cough', '21'),
(1003, 20, 'Choice', 0, 'Ineffective Cough', '22'),
(1003, 21, 'Step', 0, 'Encorage coughing\nAssess and monitor continuously', '0'),
(1003, 22, 'Step', 0, 'Consciousness retained?', '23'),
(1003, 23, 'Choice', 0, 'Yes', '25'),
(1003, 24, 'Choice', 0, 'No', '27'),
(1003, 25, 'Step', 0, 'Place baby on palm and forearm with head towards palm\nGive 5 back blows in upward direction between the shoulder blades\nTurn baby and giev 5 Chest Thrusts with two fingers just below the rib cage\nAssess and repeat as required', '26'),
(1003, 26, 'Choice', 0, 'Consciousness lost?', '27'),
(1003, 27, 'Step', 0, 'Open airway\nGive 2 breaths\nBegin Chest Compressions\nCheck for foregin body in upper airway', '0');

-- --------------------------------------------------------

--
-- Table structure for table `coursedetail`
--

CREATE TABLE `coursedetail` (
  `productid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `soid` int(9) NOT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `expirydate` date DEFAULT NULL,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coursedetail`
--

INSERT INTO `coursedetail` (`productid`, `userid`, `soid`, `created`, `createdate`, `expirydate`, `updated`, `updatedate`) VALUES
(1001, 1001, 1, 1001, '2020-03-18 12:55:45', '2020-05-14', 1001, '2020-03-18 12:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `courseheader`
--

CREATE TABLE `courseheader` (
  `productid` int(9) NOT NULL,
  `coursetype` varchar(10) NOT NULL COMMENT 'Online or Campus',
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `cost` int(4) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `systemid` varchar(250) NOT NULL,
  `conditionid` int(9) DEFAULT NULL,
  `lifethreatning` int(1) NOT NULL COMMENT '0: Non Life Threat 1: Life Threat',
  `credits` int(4) NOT NULL,
  `instructor` int(9) NOT NULL COMMENT 'User Id for Users tables',
  `startdate` datetime NOT NULL,
  `enddate` datetime DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courseheader`
--

INSERT INTO `courseheader` (`productid`, `coursetype`, `title`, `description`, `cost`, `branch`, `systemid`, `conditionid`, `lifethreatning`, `credits`, `instructor`, `startdate`, `enddate`, `created`, `createdate`, `updated`, `updatedate`, `isactive`) VALUES
(1001, 'Online', 'Emergency Medicine', 'Emergency Medicine course will help doctors to enhance their knowledge and skills required for the prevention, diagnosis and management of acute and urgent aspects of illness and injuries affecting patients of all age groups. This course will enable the student build competencies in triaging patients, identification and treatment of life threatening emergencies, resuscitating a critically ill patient and performing life saving procedures in addition to having good communication and counselling skills.\r\n\r\nThis course is specially aimed at doctors interested in enhancing their emergency care skills or making a career in emergency medicine. Any MBBS graduate registered with a State Medical Council or the Medical council of India (MCI) is eligible to take this course.', 1999, 'Medicine', '1001', 1, 0, 5, 0, '2020-07-01 00:00:00', '2020-07-31 00:00:00', 1001, '2020-03-10 20:21:58', 1001, '2020-03-10 20:21:58', 1),
(1002, 'Online', 'Certificate in Basic Life Support', 'Basic life support (BLS) is a level of medical care which is used for victims of life-threatening illnesses or injuries until they can be given full medical care at a hospital.\r\n\r\nBasic Life Support, or BLS, generally refers to the type of care that first-responders, healthcare providers and public safety professionals provide to anyone who is experiencing cardiac arrest, respiratory distress or an obstructed airway. It requires knowledge and skills in cardiopulmonary resuscitation (CPR), using automated external defibrillators (AED) and relieving airway obstructions in patients of every age.\r\n\r\nBasic Life Support for Healthcare Providers (BLS) uses a scenario-based approach to develop the critical thinking and problem solving skills that drive better patient outcomes. It is consistent with AHA Guidelines for CPR/ECC, and covers breathing and cardiac emergencies - including CPR, AED, and obstructed airway - for adult, child, and infant patients. Courses are delivered nationwide by our expert instructors, and give you the flexibility to complete part of your training online through our dynamic Simulation Learning experience, which combines online coursework with in-person skills sessions, so you can earn your BLS certification your way..', 1750, 'Dental', '1001', 1, 1, 5, 0, '2020-07-15 00:00:00', '2020-12-14 00:00:00', NULL, '2020-03-10 20:41:38', NULL, '2020-03-10 20:41:38', 1),
(1003, 'Online', 'Dealing with Altered Consciousness', 'Syncope is the most common emergency seen in dental offices (50% to 60% of all emergencies). Although it occurs predominately in adults, since an adult accompanies all pediatric dental patients, it can readily occur in a pediatric dental office. Syncope occurs as a result of a \"fight or flight\" response and the absence of patient muscular movement, leading to a transient loss of consciousness. It is most common in young adults, most commonly between the ages of 16 to 35 years, and in men more than women, probably as a result of being told to \"Take it like a man\" during a stressful situation. Pediatric patients rarely develop syncope because they do not hide their fears and readily react emotionally and physically during a stressful situation. If a pediatric patient or an adult older than 40 years exhibits syncope without predisposing factors, they should be sent for medical consultation.', 1550, 'Dental', '1001', 1, 1, 5, 0, '2020-07-10 00:00:00', '2020-09-30 00:00:00', NULL, '2020-03-10 20:47:04', NULL, '2020-03-10 20:47:04', 1),
(1004, 'Campus', 'Hands Only CPR Training', 'Hands-Only CPR can help gain precious time for a person experiencing a cardiac event but knowing First Aid, CPR and how to use an AED will enable you to provide life-saving care in a range of emergencies. The Red Cross offers convenient, flexible training options in this and other health and safety topics.\r\n', 2550, 'Dental', '1001', 1, 1, 10, 0, '2020-07-10 00:00:00', '2020-09-30 00:00:00', NULL, '2020-03-10 20:47:04', NULL, '2020-03-10 20:47:04', 1),
(1005, 'Campus', 'Adult and Pediatric First Aid/CPR/AED & BL', 'The Adult and Pediatric First Aid/CPR/AED/BL course incorporates the latest science and teaches students to recognize and care for a variety of first aid emergencies such as burns, cuts, scrapes, sudden illnesses, head, neck, back injuries, heat and cold emergencies and how to respond to breathing and cardiac emergencies to help victims of any age - adults (about 12 years and older) and pediatric (infants and children up to 12 years of age).Students who successfully complete this course will receive a certificate for Adult and Pediatric First Aid/CPR/AED valid for one year.', 3550, 'Medical', '1001', 1, 1, 10, 0, '2020-07-10 00:00:00', '2020-09-30 00:00:00', NULL, '2020-03-10 20:47:04', NULL, '2020-03-10 20:47:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `courselocation`
--

CREATE TABLE `courselocation` (
  `productid` int(9) NOT NULL,
  `locationid` int(9) NOT NULL,
  `courseurl` varchar(250) DEFAULT NULL COMMENT 'Ref to website',
  `addressline1` varchar(250) NOT NULL,
  `addressline2` varchar(250) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(75) NOT NULL,
  `pin` int(9) NOT NULL,
  `landmark` varchar(250) NOT NULL,
  `longitude` int(9) NOT NULL,
  `latitude` int(9) NOT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `dealerid` int(9) NOT NULL,
  `businessname` varchar(250) DEFAULT NULL,
  `contactname` varchar(150) DEFAULT NULL,
  `contactmobile` varchar(10) DEFAULT NULL,
  `altcontactname` varchar(150) DEFAULT NULL,
  `altcontactmobile` varchar(10) DEFAULT NULL,
  `addressline1` varchar(250) DEFAULT NULL,
  `addressline2` varchar(250) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(75) DEFAULT NULL,
  `pin` int(9) DEFAULT NULL,
  `landmark` varchar(250) DEFAULT NULL,
  `longitude` int(9) DEFAULT NULL,
  `latitude` int(9) DEFAULT NULL,
  `dealergst` int(15) DEFAULT NULL,
  `dealerrank` int(1) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetail`
--

CREATE TABLE `deliverydetail` (
  `soid` int(9) NOT NULL,
  `dealerid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `shiptoid` int(9) NOT NULL,
  `deliverydate` date NOT NULL,
  `deliveredby` int(9) NOT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `productid` int(9) NOT NULL,
  `discountid` int(9) NOT NULL,
  `promoname` varchar(250) DEFAULT NULL,
  `promoimage` text,
  `percentdiscount` int(9) DEFAULT NULL,
  `promostartdate` date DEFAULT NULL,
  `promoenddate` date DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emergencynumbers`
--

CREATE TABLE `emergencynumbers` (
  `emeregencyid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `emeregencyname` varchar(50) NOT NULL,
  `emeregencynumber` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emergencynumbers`
--

INSERT INTO `emergencynumbers` (`emeregencyid`, `userid`, `emeregencyname`, `emeregencynumber`) VALUES
(1, 1001, 'Police', '100'),
(2, 1001, 'Ambulance', '108'),
(3, 1001, 'Air Taxi', '109'),
(4, 1001, 'Oxygen', '9011017927'),
(5, 1001, 'Blood Bank', '9011013741'),
(6, 1002, 'Pharmacy', '9011011729'),
(7, 1002, 'Ambulance', '108'),
(8, 1002, 'Dr. Khan - ICU Head', '9980242575'),
(9, 1002, 'Oxygen', '9960411727'),
(10, 1002, 'Blood Bank', '9074129808'),
(11, 1003, 'Ambulance', '108'),
(12, 1003, 'Oxygen - SDCH', '9604128910');

-- --------------------------------------------------------

--
-- Table structure for table `expertsoncall`
--

CREATE TABLE `expertsoncall` (
  `systemid` int(9) NOT NULL,
  `conditionid` int(9) NOT NULL,
  `expertid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expertsoncall`
--

INSERT INTO `expertsoncall` (`systemid`, `conditionid`, `expertid`) VALUES
(1, 1, 1001),
(1, 1, 1002),
(2, 3, 1002);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `userid` int(9) NOT NULL,
  `rate1` int(1) DEFAULT NULL,
  `rate2` int(1) DEFAULT NULL,
  `rate3` int(1) DEFAULT NULL,
  `rate4` int(1) DEFAULT NULL,
  `rate5` int(1) DEFAULT NULL,
  `comments` text,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoicedetails`
--

CREATE TABLE `invoicedetails` (
  `invoiceid` int(9) DEFAULT NULL,
  `itemdescription` varchar(250) DEFAULT NULL,
  `HSNSACcode` int(9) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `quanity` float DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `totalinvoiceamount` float DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceheader`
--

CREATE TABLE `invoiceheader` (
  `invoiceid` int(9) NOT NULL,
  `soid` int(9) NOT NULL,
  `dealerid` int(9) DEFAULT NULL,
  `userid` int(9) DEFAULT NULL,
  `businessname` varchar(250) DEFAULT NULL,
  `invoicedate` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `shiptoid` int(9) DEFAULT NULL,
  `remarks` varchar(250) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kitcontents`
--

CREATE TABLE `kitcontents` (
  `productid` int(9) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(9) NOT NULL,
  `expirydate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `otpdetail`
--

CREATE TABLE `otpdetail` (
  `otpid` int(9) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `isverified` tinyint(1) DEFAULT NULL,
  `logindatetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productbydealer`
--

CREATE TABLE `productbydealer` (
  `productid` int(9) NOT NULL,
  `dealerid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productid` int(9) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `tradename` varchar(250) DEFAULT NULL,
  `longname` text,
  `producttype` varchar(50) DEFAULT NULL,
  `uom` varchar(50) DEFAULT NULL,
  `packageqty` float DEFAULT NULL,
  `productinfo` text,
  `availableqty` float DEFAULT NULL,
  `safetystockqty` float DEFAULT NULL,
  `procurementleadtime` int(9) DEFAULT NULL,
  `minbuyqty` float DEFAULT NULL,
  `maxbuyqty` float DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questionsmaster`
--

CREATE TABLE `questionsmaster` (
  `questionid` int(11) NOT NULL,
  `questiontype` int(11) DEFAULT NULL COMMENT '1: Text, 2: Image',
  `difficultylevel` int(1) DEFAULT NULL,
  `quizid` int(11) NOT NULL,
  `question` text,
  `option1` varchar(250) DEFAULT NULL,
  `answer1` int(1) DEFAULT NULL,
  `option2` varchar(250) DEFAULT NULL,
  `answer2` int(1) DEFAULT NULL,
  `option3` varchar(250) DEFAULT NULL,
  `answer3` int(1) DEFAULT NULL,
  `option4` varchar(250) DEFAULT NULL,
  `answer4` int(1) DEFAULT NULL,
  `answerdetails` text,
  `mediaUrl` varchar(250) DEFAULT NULL,
  `isActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionsmaster`
--

INSERT INTO `questionsmaster` (`questionid`, `questiontype`, `difficultylevel`, `quizid`, `question`, `option1`, `answer1`, `option2`, `answer2`, `option3`, `answer3`, `option4`, `answer4`, `answerdetails`, `mediaUrl`, `isActive`) VALUES
(1, 1, 1, 1001, 'A 50-year-old female patient with a medical condition starts to feel unwell during an amalgam filling procedure and is given glucagon by the dentist. Which one of the following medical emergencies is the patient experiencing?', 'Anaphylactic shock', 1, 'Angina attack', 1, 'Asthma attack', 1, 'Diabetic hypoglycaemia', 0, NULL, NULL, 1),
(2, 1, 1, 1001, 'Many dental workplaces now have automated external defibrillators (AEDs) on the premises to assist with the recognition and treatment of some medical emergencies. Which one of the following is an event for which the AED can be used?', 'Angina', 1, 'Arrhythmia', 0, 'Asystole', 0, 'Valvular defect', 0, NULL, NULL, 1),
(5, 1, 1, 1001, 'All members of the dental team have to be regularly trained and certificated in the recognition and handling of medical emergencies. Which one of the following is the current sequence of actions to follow in the event of a medical emergency?', 'ABC', 0, 'BLS', 0, 'CPR', 0, 'DRABC', 1, 'DRABC stands for Danger, Response, Airway, Breathing and Circulation.', NULL, 1),
(6, 1, 1, 1001, 'When a medical emergency occurs, the life of the casualty may depend on the correct recognition of the cause of the emergency. This is usually achieved by identifying the signs and symptoms present. Which one of the following is a sign rather than a symptom?', 'Dizziness', 0, 'Drowsiness', 0, 'Nausea', 0, 'Pain', 1, NULL, NULL, 1),
(8, 1, 1, 1001, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(9, 1, 1, 1001, 'When assessing the level of responsiveness of a casualty during a medical emergency, the scale that determines the level of consciousness of the casualty is usually referred to as ‘AVPU’. Which one of the following is the meaning of ‘A’ in this scale?', 'Airway', 0, 'Alert', 1, 'Automatic', 0, 'Awake', 0, 'alert, verbal, pain, unresponsive\r\nThe AVPU scale (an acronym from \"alert, verbal, pain, unresponsive\") is a system by which a health care professional can measure and record a patient\'s level of consciousness..', NULL, 1),
(10, 1, 1, 1001, 'All members of the dental team should be able to recognise and manage medical emergencies, not just to support life but also to give first aid treatment when necessary. Which one of the following actions should be taken in the event of an arterial bleed from the arm?', 'Apply a tourniquet for 1 hour', 0, 'Apply direct pressure', 0, 'Clean the wound', 0, 'Keep the limb level with the heart', 1, NULL, NULL, 1),
(11, 2, 1, 1001, 'Which of the following may cause allergic reaction?', 'http://www.praxello.com/images/nuts.jpeg', 1, 'http://www.praxello.com/images/fan.jpg', 0, 'http://www.praxello.com/images/icebag.jpeg', 0, 'http://www.praxello.com/images/towels.jpeg', 0, 'The most common symptom of a nut allergy is raised red bumps of skin (hives) and other allergic symptoms such as runny nose, cramps, nausea or vomiting. Food allergies can be life threatening and peanuts, tree nuts and seeds are some of the most common food triggers for life-threatening severe allergic reactions.', NULL, 1),
(12, 2, 1, 1001, 'True or False? Anaphylactic shock occurs when you get your paycheck at month end.', 'http://www.praxello.com/images/thumbsup.png', 0, 'http://www.praxello.com/images/thumbsdown.png', 1, '', 0, '', 0, 'Anaphylaxis is a severe, potentially life-threatening allergic reaction. It can occur within seconds or minutes of exposure to something you\'re allergic to, such as peanuts or bee stings.\r\n\r\nAnaphylaxis causes your immune system to release a flood of chemicals that can cause you to go into shock — your blood pressure drops suddenly and your airways narrow, blocking breathing. Signs and symptoms include a rapid, weak pulse; a skin rash; and nausea and vomiting. Common triggers include certain foods, some medications, insect venom and latex.', 'https://youtu.be/0ksr-Bd67sU', 1),
(13, 1, 1, 1001, 'True or False? Anaphylactic shock occurs when you get your paycheck at month end.', 'True', 0, 'False', 1, '', 0, '', 0, 'Anaphylaxis is a severe, potentially life-threatening allergic reaction. It can occur within seconds or minutes of exposure to something you\'re allergic to, such as peanuts or bee stings.\r\n\r\nAnaphylaxis causes your immune system to release a flood of chemicals that can cause you to go into shock — your blood pressure drops suddenly and your airways narrow, blocking breathing. Signs and symptoms include a rapid, weak pulse; a skin rash; and nausea and vomiting. Common triggers include certain foods, some medications, insect venom and latex.', 'https://youtu.be/0ksr-Bd67sU', 1),
(14, 2, 1, 1001, 'Which of the following may cause allergic reaction?', 'http://www.praxello.com/images/nuts.jpeg', 1, 'http://www.praxello.com/images/fan.jpg', 0, 'http://www.praxello.com/images/icebag.jpeg', 0, 'http://www.praxello.com/images/towels.jpeg', 0, 'The most common symptom of a nut allergy is raised red bumps of skin (hives) and other allergic symptoms such as runny nose, cramps, nausea or vomiting. Food allergies can be life threatening and peanuts, tree nuts and seeds are some of the most common food triggers for life-threatening severe allergic reactions.', NULL, 1),
(7, 1, 1, 1002, 'Every dental workplace must hold an emergency drugs box, with a recommended list of contents to be used in the event of a medical emergency on the premises. Which one of the following medications must be administered by injection rather than orally?', 'Aspirin', 0, 'Dextrose', 0, 'Glyceryl trinitrate', 1, 'Hydrocortisone', 0, NULL, NULL, 1),
(8, 1, 1, 1002, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(9, 1, 1, 1002, 'When assessing the level of responsiveness of a casualty during a medical emergency, the scale that determines the level of consciousness of the casualty is usually referred to as ‘AVPU’. Which one of the following is the meaning of ‘A’ in this scale?', 'Airway', 0, 'Alert', 1, 'Automatic', 0, 'Awake', 0, 'alert, verbal, pain, unresponsive\r\nThe AVPU scale (an acronym from \"alert, verbal, pain, unresponsive\") is a system by which a health care professional can measure and record a patient\'s level of consciousness..', NULL, 1),
(10, 1, 1, 1002, 'All members of the dental team should be able to recognise and manage medical emergencies, not just to support life but also to give first aid treatment when necessary. Which one of the following actions should be taken in the event of an arterial bleed from the arm?', 'Apply a tourniquet for 1 hour', 0, 'Apply direct pressure', 0, 'Clean the wound', 0, 'Keep the limb level with the heart', 1, NULL, NULL, 1),
(11, 2, 1, 1002, 'Which of the following may cause allergic reaction?', 'http://www.praxello.com/images/nuts.jpeg', 1, 'http://www.praxello.com/images/fan.jpg', 0, 'http://www.praxello.com/images/icebag.jpeg', 0, 'http://www.praxello.com/images/towels.jpeg', 0, 'The most common symptom of a nut allergy is raised red bumps of skin (hives) and other allergic symptoms such as runny nose, cramps, nausea or vomiting. Food allergies can be life threatening and peanuts, tree nuts and seeds are some of the most common food triggers for life-threatening severe allergic reactions.', NULL, 1),
(12, 2, 1, 1003, 'True or False? Anaphylactic shock occurs when you get your paycheck at month end.', 'http://www.praxello.com/images/thumbsup.png', 0, 'http://www.praxello.com/images/thumbsdown.png', 1, '', 0, '', 0, 'Anaphylaxis is a severe, potentially life-threatening allergic reaction. It can occur within seconds or minutes of exposure to something you\'re allergic to, such as peanuts or bee stings.\r\n\r\nAnaphylaxis causes your immune system to release a flood of chemicals that can cause you to go into shock — your blood pressure drops suddenly and your airways narrow, blocking breathing. Signs and symptoms include a rapid, weak pulse; a skin rash; and nausea and vomiting. Common triggers include certain foods, some medications, insect venom and latex.', 'https://youtu.be/0ksr-Bd67sU', 1),
(13, 1, 1, 1003, 'True or False? Anaphylactic shock occurs when you get your paycheck at month end.', 'TRUE', 0, 'FALSE', 1, '', 0, '', 0, 'Anaphylaxis is a severe, potentially life-threatening allergic reaction. It can occur within seconds or minutes of exposure to something you\'re allergic to, such as peanuts or bee stings.\r\n\r\nAnaphylaxis causes your immune system to release a flood of chemicals that can cause you to go into shock — your blood pressure drops suddenly and your airways narrow, blocking breathing. Signs and symptoms include a rapid, weak pulse; a skin rash; and nausea and vomiting. Common triggers include certain foods, some medications, insect venom and latex.', 'https://youtu.be/0ksr-Bd67sU', 1),
(14, 2, 1, 1003, 'Which of the following may cause allergic reaction?', 'http://www.praxello.com/images/nuts.jpeg', 1, 'http://www.praxello.com/images/fan.jpg', 0, 'http://www.praxello.com/images/icebag.jpeg', 0, 'http://www.praxello.com/images/towels.jpeg', 0, 'The most common symptom of a nut allergy is raised red bumps of skin (hives) and other allergic symptoms such as runny nose, cramps, nausea or vomiting. Food allergies can be life threatening and peanuts, tree nuts and seeds are some of the most common food triggers for life-threatening severe allergic reactions.', NULL, 1),
(15, 1, 1, 1003, 'A 50-year-old female patient with a medical condition starts to feel unwell during an amalgam filling procedure and is given glucagon by the dentist. Which one of the following medical emergencies is the patient experiencing?', 'Anaphylactic shock', 1, 'Angina attack', 1, 'Asthma attack', 1, 'Diabetic hypoglycaemia', 0, NULL, NULL, 1),
(16, 1, 1, 1003, 'Many dental workplaces now have automated external defibrillators (AEDs) on the premises to assist with the recognition and treatment of some medical emergencies. Which one of the following is an event for which the AED can be used?', 'Angina', 1, 'Arrhythmia', 0, 'Asystole', 0, 'Valvular defect', 0, NULL, NULL, 1),
(17, 1, 1, 1003, 'One of the first aid events that the dental team should be able to manage effectively is a scald. Which one of the following is the most likely cause of this injury?', 'Corrosive chemical', 0, 'Fire', 0, 'Steam', 0, 'Toxic chemical', 1, NULL, NULL, NULL),
(18, 1, 1, 1003, 'A 20-year-old male is undergoing first stage of endodontic treatment on upper right central incisor. While local anesthetic is being given, patient becomes pale, sweaty and distressed. Which one of following emergencies is patient experiencing?', 'Anaphylactic shock', 0, 'Angina attack', 0, 'Asthma attack', 0, 'Diabetic hypoglycaemia', 1, NULL, NULL, 1),
(19, 1, 1, 1003, 'All members of the dental team have to be regularly trained and certificated in the recognition and handling of medical emergencies. Which one of the following is the current sequence of actions to follow in the event of a medical emergency?', 'ABC', 0, 'BLS', 0, 'CPR', 0, 'DRABC', 1, 'DRABC stands for Danger, Response, Airway, Breathing and Circulation.', NULL, 1),
(20, 1, 1, 1004, 'A 50-year-old female patient with a medical condition starts to feel unwell during an amalgam filling procedure and is given glucagon by the dentist. Which one of the following medical emergencies is the patient experiencing?', 'Anaphylactic shock', 1, 'Angina attack', 1, 'Asthma attack', 1, 'Diabetic hypoglycaemia', 0, NULL, NULL, 1),
(21, 1, 1, 1004, 'Many dental workplaces now have automated external defibrillators (AEDs) on the premises to assist with the recognition and treatment of some medical emergencies. Which one of the following is an event for which the AED can be used?', 'Angina', 1, 'Arrhythmia', 0, 'Asystole', 0, 'Valvular defect', 0, NULL, NULL, 1),
(22, 1, 1, 1004, 'Every dental workplace must hold an emergency drugs box, with a recommended list of contents to be used in the event of a medical emergency on the premises. Which one of the following medications must be administered by injection rather than orally?', 'Aspirin', 0, 'Dextrose', 0, 'Glyceryl trinitrate', 1, 'Hydrocortisone', 0, NULL, NULL, 1),
(23, 1, 1, 1004, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(24, 1, 1, 1004, 'When assessing the level of responsiveness of a casualty during a medical emergency, the scale that determines the level of consciousness of the casualty is usually referred to as ‘AVPU’. Which one of the following is the meaning of ‘A’ in this scale?', 'Airway', 0, 'Alert', 1, 'Automatic', 0, 'Awake', 0, 'alert, verbal, pain, unresponsive\r\nThe AVPU scale (an acronym from \"alert, verbal, pain, unresponsive\") is a system by which a health care professional can measure and record a patient\'s level of consciousness..', NULL, 1),
(25, 1, 1, 1005, 'A 20-year-old male is undergoing first stage of endodontic treatment on upper right central incisor. While local anesthetic is being given, patient becomes pale, sweaty and distressed. Which one of following emergencies is patient experiencing?', 'Anaphylactic shock', 0, 'Angina attack', 0, 'Asthma attack', 0, 'Diabetic hypoglycaemia', 1, NULL, NULL, 1),
(26, 1, 1, 1005, 'All members of the dental team have to be regularly trained and certificated in the recognition and handling of medical emergencies. Which one of the following is the current sequence of actions to follow in the event of a medical emergency?', 'ABC', 0, 'BLS', 0, 'CPR', 0, 'DRABC', 1, 'DRABC stands for Danger, Response, Airway, Breathing and Circulation.', NULL, 1),
(27, 1, 1, 1005, 'When a medical emergency occurs, the life of the casualty may depend on the correct recognition of the cause of the emergency. This is usually achieved by identifying the signs and symptoms present. Which one of the following is a sign rather than a symptom?', 'Dizziness', 0, 'Drowsiness', 0, 'Nausea', 0, 'Pain', 1, NULL, NULL, 1),
(28, 1, 1, 1005, 'Every dental workplace must hold an emergency drugs box, with a recommended list of contents to be used in the event of a medical emergency on the premises. Which one of the following medications must be administered by injection rather than orally?', 'Aspirin', 0, 'Dextrose', 0, 'Glyceryl trinitrate', 1, 'Hydrocortisone', 0, NULL, NULL, 1),
(29, 1, 1, 1005, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(30, 1, 1, 1006, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(31, 1, 1, 1006, 'When assessing the level of responsiveness of a casualty during a medical emergency, the scale that determines the level of consciousness of the casualty is usually referred to as ‘AVPU’. Which one of the following is the meaning of ‘A’ in this scale?', 'Airway', 0, 'Alert', 1, 'Automatic', 0, 'Awake', 0, 'alert, verbal, pain, unresponsive\r\nThe AVPU scale (an acronym from \"alert, verbal, pain, unresponsive\") is a system by which a health care professional can measure and record a patient\'s level of consciousness..', NULL, 1),
(32, 1, 1, 1006, 'A 20-year-old male is undergoing first stage of endodontic treatment on upper right central incisor. While local anesthetic is being given, patient becomes pale, sweaty and distressed. Which one of following emergencies is patient experiencing?', 'Anaphylactic shock', 0, 'Angina attack', 0, 'Asthma attack', 0, 'Diabetic hypoglycaemia', 1, NULL, NULL, 1),
(33, 1, 1, 1006, 'All members of the dental team have to be regularly trained and certificated in the recognition and handling of medical emergencies. Which one of the following is the current sequence of actions to follow in the event of a medical emergency?', 'ABC', 0, 'BLS', 0, 'CPR', 0, 'DRABC', 1, 'DRABC stands for Danger, Response, Airway, Breathing and Circulation.', NULL, 1),
(34, 1, 1, 1006, 'When a medical emergency occurs, the life of the casualty may depend on the correct recognition of the cause of the emergency. This is usually achieved by identifying the signs and symptoms present. Which one of the following is a sign rather than a symptom?', 'Dizziness', 0, 'Drowsiness', 0, 'Nausea', 0, 'Pain', 1, NULL, NULL, 1),
(35, 1, 1, 1007, 'All members of the dental team have to be regularly trained and certificated in the recognition and handling of medical emergencies. Which one of the following is the current sequence of actions to follow in the event of a medical emergency?', 'ABC', 0, 'BLS', 0, 'CPR', 0, 'DRABC', 1, 'DRABC stands for Danger, Response, Airway, Breathing and Circulation.', NULL, 1),
(36, 2, 1, 1007, 'When a medical emergency occurs, the life of the casualty may depend on the correct recognition of the cause of the emergency. This is usually achieved by identifying the signs and symptoms present. Which one of the following is a sign rather than a symptom?', 'Dizziness', 0, 'Drowsiness', 0, 'Nausea', 0, 'Pain', 1, NULL, NULL, 1),
(37, 3, 1, 1007, 'Every dental workplace must hold an emergency drugs box, with a recommended list of contents to be used in the event of a medical emergency on the premises. Which one of the following medications must be administered by injection rather than orally?', 'Aspirin', 0, 'Dextrose', 0, 'Glyceryl trinitrate', 1, 'Hydrocortisone', 0, NULL, NULL, 1),
(38, 4, 1, 1007, 'When administering basic life support, the rescuer needs to perform chest compressions at a rate and depth that is adequate to artificially circulate the casualty’s blood. Which one of the following rates of compression is required to achieve adequate circulation?', '15 per minute', 1, '30 per minute', 0, '50 per minute', 0, '100 per minute', 0, NULL, NULL, 1),
(40, 5, 1, 1007, 'When assessing the level of responsiveness of a casualty during a medical emergency, the scale that determines the level of consciousness of the casualty is usually referred to as ‘AVPU’. Which one of the following is the meaning of ‘A’ in this scale?', 'Airway', 0, 'Alert', 1, 'Automatic', 0, 'Awake', 0, 'Alert, Verbal, Pain, Unresponsive\nThe AVPU scale (an acronym from \"alert, verbal, pain, unresponsive\") is a system by which a health care professional can measure and record a patient\'s level of consciousness..', NULL, 1),
(41, 6, 1, 1007, 'Which of the following may cause allergic reaction?', 'http://www.praxello.com/images/nuts.jpeg', 1, 'http://www.praxello.com/images/fan.jpg', 0, 'http://www.praxello.com/images/icebag.jpeg', 0, 'http://www.praxello.com/images/towels.jpeg', 0, 'The most common symptom of a nut allergy is raised red bumps of skin (hives) and other allergic symptoms such as runny nose, cramps, nausea or vomiting. Food allergies can be life threatening and peanuts, tree nuts and seeds are some of the most common food triggers for life-threatening severe allergic reactions.', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quizanswers`
--

CREATE TABLE `quizanswers` (
  `answerid` int(11) NOT NULL,
  `quizid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `quizdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizanswers`
--

INSERT INTO `quizanswers` (`answerid`, `quizid`, `userid`, `score`, `quizdate`) VALUES
(1, 1001, 1001, 25, '2020-03-18 00:00:00'),
(2, 1001, 1001, 25, '2020-03-18 00:00:00'),
(3, 1001, 1001, 15, '2020-03-18 00:00:00'),
(4, 1001, 1001, 15, '2020-03-18 00:00:00'),
(5, 1001, 1001, 15, '2020-03-18 00:00:00'),
(6, 1001, 1001, 15, '2020-03-18 00:00:00'),
(7, 1001, 1001, 38, '2020-03-18 00:00:00'),
(8, 1001, 1001, 23, '2020-03-18 00:00:00'),
(9, 1001, 1001, 38, '2020-03-18 00:00:00'),
(10, 1001, 1001, 0, '2020-03-18 00:00:00'),
(11, 1001, 1001, 23, '2020-03-18 00:00:00'),
(12, 1001, 1001, 77, '2020-03-18 00:00:00'),
(13, 1001, 1001, 23, '2020-03-18 00:00:00'),
(14, 1001, 1001, 31, '2020-03-18 00:00:00'),
(15, 1001, 1001, 77, '2020-03-18 00:00:00'),
(16, 1001, 1001, 54, '2020-03-18 00:00:00'),
(17, 1001, 1001, 77, '2020-03-18 00:00:00'),
(18, 1001, 1001, 77, '2020-03-18 00:00:00'),
(19, 1001, 1001, 69, '2020-03-18 00:00:00'),
(20, 1001, 1001, 85, '2020-03-18 00:00:00'),
(21, 1001, 1001, 92, '2020-03-18 00:00:00'),
(22, 1001, 1001, 85, '2020-03-18 00:00:00'),
(23, 1001, 1001, 77, '2020-03-18 00:00:00'),
(24, 1001, 1001, 77, '2020-03-18 00:00:00'),
(25, 1001, 1001, 92, '2020-03-18 00:00:00'),
(26, 1001, 1001, 100, '2020-03-18 00:00:00'),
(27, 1001, 1001, 100, '2020-03-18 00:00:00'),
(28, 1001, 1001, 100, '2020-03-18 00:00:00'),
(29, 1001, 1001, 8, '2020-03-18 00:00:00'),
(30, 1001, 1001, 46, '2020-03-18 00:00:00'),
(31, 1001, 1001, 69, '2020-03-18 00:00:00'),
(32, 1001, 1001, 85, '2020-03-18 00:00:00'),
(33, 1001, 1001, 77, '2020-03-18 00:00:00'),
(34, 1001, 1001, 92, '2020-03-18 00:00:00'),
(35, 1001, 1001, 85, '2020-03-19 00:00:00'),
(36, 1001, 1001, 92, '2020-03-19 00:00:00'),
(37, 1001, 1001, 38, '2020-03-19 00:00:00'),
(38, 1001, 1001, 85, '2020-03-19 00:00:00'),
(39, 1001, 1001, 85, '2020-03-19 00:00:00'),
(40, 1001, 1001, 33, '2020-03-19 00:00:00'),
(41, 1005, 1001, 100, '2020-03-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `quizmaster`
--

CREATE TABLE `quizmaster` (
  `quizid` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `conditionid` int(11) DEFAULT NULL,
  `title` varchar(150) NOT NULL,
  `details` varchar(250) NOT NULL,
  `passingscore` int(11) DEFAULT NULL,
  `questiontimeout` int(5) DEFAULT NULL,
  `quiztimeout` int(5) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quizmaster`
--

INSERT INTO `quizmaster` (`quizid`, `userId`, `conditionid`, `title`, `details`, `passingscore`, `questiontimeout`, `quiztimeout`, `created`, `createdate`, `updated`, `updatedate`, `isActive`) VALUES
(1001, 1001, 1001, 'ResQ Dent General Quiz', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1),
(1002, 1001, 1002, 'ResQ Dent General Quiz 2', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1),
(1003, 1001, 1003, 'ResQ Dent General Quiz 3', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1),
(1004, 1001, 1004, 'ResQ Dent General Quiz 4', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1),
(1005, 1001, 1005, 'ResQ Dent General Quiz 5', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1),
(1006, 1001, 1006, 'ResQ Dent General Quiz 6', '5 Credits', 90, 30, 120, 1001, '2020-03-11 21:13:17', 1001, '2020-03-11 21:13:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `servicearea`
--

CREATE TABLE `servicearea` (
  `areaid` int(9) NOT NULL,
  `country` varchar(150) NOT NULL,
  `state` varchar(150) NOT NULL,
  `district` varchar(250) DEFAULT NULL,
  `areaname` varchar(250) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicearea`
--

INSERT INTO `servicearea` (`areaid`, `country`, `state`, `district`, `areaname`, `isActive`) VALUES
(1, 'ALL', 'ALL', 'ALL', 'ALL', 1),
(2, 'IN', 'MH', 'Pune', 'Kondhwa', 1),
(3, 'IN', 'MH', 'Pune', 'Sinhgad', 1),
(4, 'IN', 'MH', 'Pune', 'Shivajinagar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sirengroup`
--

CREATE TABLE `sirengroup` (
  `groupid` int(9) NOT NULL,
  `groupname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sirengroup`
--

INSERT INTO `sirengroup` (`groupid`, `groupname`) VALUES
(1001, 'Sinhgad Dental');

-- --------------------------------------------------------

--
-- Table structure for table `sirengroupmembers`
--

CREATE TABLE `sirengroupmembers` (
  `groupid` int(9) NOT NULL,
  `userid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sirengroupmembers`
--

INSERT INTO `sirengroupmembers` (`groupid`, `userid`) VALUES
(1001, 1001),
(1001, 1002),
(1001, 1003);

-- --------------------------------------------------------

--
-- Table structure for table `sodetails`
--

CREATE TABLE `sodetails` (
  `soid` int(9) DEFAULT NULL,
  `solineid` int(9) NOT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `uom` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `expecteddate` date DEFAULT NULL,
  `deliverydate` date DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `soheader`
--

CREATE TABLE `soheader` (
  `soid` int(9) NOT NULL,
  `dealerid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `shiptoid` int(11) DEFAULT NULL,
  `salesdate` date DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `invoiceamount` float DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `systemid` int(9) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `systemname` varchar(250) DEFAULT NULL,
  `conditionid` int(9) DEFAULT NULL,
  `conditionname` varchar(250) DEFAULT NULL,
  `lifethreatning` int(1) DEFAULT NULL,
  `defintion` text,
  `classification` text,
  `clinicalfeatures` text,
  `diagnosis` text,
  `differentialdiagnosis` text,
  `labfindings` text,
  `managementadult` text,
  `managementpediatric` text,
  `prevention` text,
  `considerations` text,
  `posttraumarecoveryplan` text,
  `references` text,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`systemid`, `branch`, `systemname`, `conditionid`, `conditionname`, `lifethreatning`, `defintion`, `classification`, `clinicalfeatures`, `diagnosis`, `differentialdiagnosis`, `labfindings`, `managementadult`, `managementpediatric`, `prevention`, `considerations`, `posttraumarecoveryplan`, `references`, `created`, `createdate`, `updated`, `updatedate`, `isactive`) VALUES
(1001, 'Dental', 'Brain', 1001, 'Syncope', 1, '{\"Text\": \"Temporary loss of consciousness dues to sudden decline in brain blood flow Prodromal Stage:  Patient feels that the collapse is imminent Lasts up to 10 seconds to few minutes Symptoms experienced: Anxiety Tachycardia Perspiration Light-headedness Blurred vision For Pediatrics: Syncope is a common problem in the pediatric population. During the first two decades of life approximately 15% of children experience at least one episode of syncope, and the chief complaint of syncope accounts for 1% of all pediatric emergency department visits.3 The vast majority of pediatric loss-of-consciousness events is caused by neurally mediated hypotension leading to neurally mediated syncope (NMS).caused by neurally mediated hypotension leading to neurally mediated syncope(NMS)\",\"URL\": \"http://www.praxello.com/images/corona3.png\"}', '{\"Text\": \"Syncope is a transient and abrupt loss of consciousness with complete return to preexisting neurologic function. It is classified as neurally mediated (i.e., carotid sinus hypersensitivity, situational, or vasovagal), cardiac, orthostatic, or neurogenic.\"}', '{\"Text\": \"Prior faintness, dizziness, or light-headedness occurs in 70% of patients experiencing true syncope. Other symptoms, such as vertigo, weakness, diaphoresis, epigastric discomfort, nausea, blurred or faded vision, pallor, or paresthesias, may also occur in the presyncopal period.\"}', '{\"Text\": \"Diagnosing vasovagal syncope often involves ruling out other possible causes of your fainting — particularly heart-related problems. These tests may include: Electrocardiogram. ... It can detect irregular heart rhythms and other cardiac problems.\"}', '{\"Text\": \"Loss of Consciousness:\r\nAge:\r\n- Child\r\n- Teen-Middle Aged\r\n- >40 years\r\nCircumstances associated with LOC:\r\n- Stress Present\r\n- Stress Absent\r\n\r\nPosition of the Patient:\r\n- Upright\r\n- Supine to Upright\r\n- Supine\r\nDuration of Unconsciousness with BLS:\r\n- Short\r\n- Prolonged\r\n\r\nPre-syncopal Signs and Symptoms:\r\n- No Clinical Symptoms\r\n- Pallor and Cold, Clammy Skin\r\n- Tingling and Numbness of Extremities\r\n- Headache\r\n- Chest Pain\r\n- Breath Odour\r\n- Tonic-Clonic Movements and Incontinence\r\n- Heart Rate and Blood Pressure\r\n- Duration of Unconsciousness and Recovery\"}', '{\"Text\": \"Routine blood tests have a low yeild, especially in the absence of other clinical evidence that points to a specific diagnosis. 3 However, management guidelines for syncope often include determination of serum glucose levels and hematocrit. In addition, all women of childbearing age should have a urine pregnancy test.\"}', '{\"Text\": \"Key Points in Syncope Management:\r\n- Avoid/reduce stress in all patients\r\n- Maintain a good temperature in the clinic\r\n- Carefully observe patients during treatment\r\n- Prompt assessment to rule out other causes of LOC\"}\r\n', '{\"Text\": \"Diagnosis can typically be made with history and physical examination alone. With a typical history for NMS free from any red flags, a normal cardiac and neurological examination, and a normal EKG, the likelihood of an underlying cardiac or neurological pathology is minimal. If there is concern for underlying cardiac or neurological pathology, additional testing and referral to appropriate specialists is warranted. If the history is consistent with underlying psychological pathology, early referral to a mental health specialist is key.\r\n\r\nOnce a diagnosis of NMS is made, a standardized approach to the management of this problem is employed. The first-line treatments for pediatric patients with NMS include reassurance, adequate fluid and salt intake, and regular exercise.45, 46 We recommend a goal of 100 ounces of fluid per day for our adolescent patients. Care must be taken to balance other medical problems, and if a patient has underlying cardiac disease or hypertension then increased dietary salt should be avoided. Reassurance is paramount because patients and families are often concerned that a serious or life-threatening medical problem may have caused the syncopal event.\"}', '{\"Text\": \"To prevent fainting, stay out of hot places and don\'t stand for long periods. If you feel lightheaded, nauseous, or sweaty, lie down right away and raise your legs. Most people with occasional vasovagal syncope need to make only lifestyle changes such as drinking more fluids and eating more salt.\"}', '{\"Text\": \"In most cases of vasovagal syncope, you have some warning that you are near fainting. These signs include dizziness, feeling hot or cold, nausea, pale skin, \"tunnel-like\" vision, disturbance of hearing, and profuse sweating. After the episode, symptoms may continue because of continued low blood pressure.\"}', '{\"Text\": \"Orthostatic syncope treatment also focuses on educating the patient. Inform patients about avoiding postprandial dips in blood pressure (BP), teach them to elevate the head of their bed to prevent rapid BP fluctuations on arising from bed, and emphasize the importance of assuming an upright posture slowly.\"}', '{\"Text\": \"1. Brignole M, Alboni P, Benditt D. et al Guidelines on management (diagnosis and treatment) of syncope—Update 2004. Europace 20046467–537. [PubMed] [Google Scholar]\r\n2. Brignole M, Alboni P, Benditt D. et al Guidelines on management (diagnosis and treatment) of syncope—Update 2004—Executive summary and recommendations. Eur Heart J 2004252054–2072.References 1 and 2 are important consensus documents describing a standardised strategy for the evaluation and the treatment of patients with syncope [PubMed] [Google Scholar]\r\n3. Alboni P, Brignole M, Menozzi C. et al The diagnostic value of history in patients with syncope with or without heart disease. J Am Coll Cardiol 2001371921–1928. [PubMed] [Google Scholar]\r\n4. Linzer M, Yang E, Estes M. et al Diagnosing syncope. Part II: unexplained syncope. Ann Intern Med . 1997;12776–86. [PubMed]\"}', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1002, 'Dental', 'Pancreas', 1002, 'Hypoglycemia', 1, '{\"Text\": \"Differs from Syncope in the following points:\r\n- Onset and recovery are more gradual\r\n- Do not occur during or shortly after meals\r\n- Presyncopal symptoms do not improve in supine position\r\n- Lower BSL\r\n- No loss of postural muscle tone\r\n- Persisting neurological impairment\r\n- Hypoglycemia is relatively rare\r\n', '{\"Text\": \"Predisposing Factors:\r\n- Addison’s disease\r\n- Anorexia nervosa\r\n- Decrease in usual food intake\r\n- Thyroid gland dysfunction\r\n- Strenuous exercise\r\n- Insulin therapy\r\n- Old age\r\n- Oral hypoglycemic agents\r\n- Sepsis\r\n', '{\"Text\": \"VClinical Features:\r\n- Early Stage/Mild Reaction\r\n- Diminished cerebral function\r\n- Mood changes\r\n- Hunger\r\n- Nausea \r\nModerate Reaction\r\n- Sweating\r\n- Tachycardia\r\n- Piloerection\r\n- Increased anxiety\r\n- Uncooperativeness \r\nSevere Reaction\r\n- Unconsciousness\r\n- Seizures\r\n- Hypotension\r\n- Hypothermia \r\n', '{\"Text\": \"A diagnosis of hypoglycemia is not based only on symptoms. Rather, endocrinologists look for the presence Whipple\'s Triad, named for Allen O.Whipple, MD. These three factors help doctors diagnose hypoglycemia, or low blood sugar (blood glucose).\r\n\r\nWhipple\'s Triad involves:\r\n\r\n- low blood glucose level\r\n- symptoms of hypoglycemia at the time of the low glucose level\r\n- symptom relief with treatment of hypoglycemia\r\n- According to the textbook Henry\'s Clinical Diagnosis and Management by Laboratory Methods, a blood glucose level equal to or below 50mg/dL (normal blood glucose is 80-120) without the presence of diabetes warrants proper medical assessment.\"}', '{\"Text\": \"Loss of Consciousness:\r\nAge:\r\n- Child\r\n- Teen-Middle Aged\r\n- >40 years\r\nCircumstances associated with LOC:\r\n- Stress Present\r\n- Stress Absent\r\n\r\nPosition of the Patient:\r\n- Upright\r\n- Supine to Upright\r\n- Supine\r\nDuration of Unconsciousness with BLS:\r\n- Short\r\n- Prolonged\r\n\r\nPre-syncopal Signs and Symptoms:\r\n- No Clinical Symptoms\r\n- Pallor and Cold, Clammy Skin\r\n- Tingling and Numbness of Extremities\r\n- Headache\r\n- Chest Pain\r\n- Breath Odour\r\n- Tonic-Clonic Movements and Incontinence\r\n- Heart Rate and Blood Pressure\r\n- Duration of Unconsciousness and Recovery\"}', '{\"Text\": \"Complete physical examination, chest radiography (particularly in diabetic patients presenting with hypoglycemia), urinalysis, blood cultures).\r\n\r\nCheck liver function tests, serum insulin levels, and cortisol and thyroid levels. Proinsulin normally represents less than 20% of total immunoreactive insulin; in patients with islet-cell tumors, proinsulin may contribute as much as 70% of insulin immunoreactivity.\"}', '{\"Text\": \"Key Points in Hypoglycemia Management (Conscious Patient):\r\n- Assess Consciousness and terminate dental procedure\r\n- P – Position patient comfortably\r\n- ABC: Basic Life Support as needed\r\n- D: Definitive Care\r\n1. Administer oral carbohydrates\r\n2. Summon Medical Assistance if condition deteriorates\r\n\r\nKey Points in Hypoglycemia Management (Unconscious Patient):\r\n- Assess Consciousness and terminate dental procedure\r\n- P – Position patient in supine position with feet elevated\r\n- ABC: Basic Life Support as needed\r\n- D: Definitive Care\r\n1. Summon Medical Assistance\r\n2. 1mg Glucagon IV/IM\r\n3. Monitor Vitals\r\n4. Administer O2\r\n\r\nUrgent treatment is required in the event of severe hypoglycemia and\r\ncan be safely reversed by injection of glucagon, a potent and effective\r\nagent that can be administered intravenously, IM or SC.154 Recombinant crystalline glucagon is available as a lyophilized powder that is\r\nmixed with an aqueous diluent to a concentration of 1 mg/mL. Commercially available glucagon rescue kits include GlucaGen HypoKit\r\n1 mg (Novo NordiskA/S, Bagsvaerd, Denmark) and Glucagon Emergency Rescue Kit (Eli Lilly and Company, Indianapolis, Indiana ). The\r\nrecommended glucagon dosing is weight based: 1 mg for adults and\r\nchildren >25 kg and 0.5 mg for children <25 kg (according to Novo\r\nNordisk manufacturer guidelines) while Eli Lilly uses a weight cut-off\r\nof 20 kg. The evidence for these recommendations is unclear. Glucagon often induces nausea and vomiting on regaining consciousness\r\nand hence it is important to continue close observation and glucose\r\nmonitoring after treatment.\"}', '{\"Text\": \"Short-term treatment of hypoglycemia consists of an intravenous (IV) bolus of dextrose 10% 2.5 mL/kg. ... After the bolus is administered, an IV infusion that matches normal hepatic glucose production (approximately 5-8 mg/kg/min in an infant and about 3-5 mg/kg/min in an older child) should be continued.\"}', '{\"Text\": \"Prevention:\r\n- Appointments early in the day for diabetics\r\n- Enquire about duration since last meal\r\n- Short appointments\r\n- Shorter acting anaesthetics\r\n- Glass of juice before procedure\"}\r\n', '{\"Text\": \"Differs from Syncope in the following points:\r\n- Onset and recovery are more gradual\r\n- Do not occur during or shortly after meals\r\n- Presyncopal symptoms do not improve in supine position\r\n- Lower BSL\r\n- No loss of postural muscle tone\r\n- Persisting neurological impairment\r\n- Hypoglycemia is relatively rare\"}', '{\"Text\": \"VThe blood glucose threshold for activation of autonomic signs\r\nand symptoms is related to glycemic control, antecedent hypoglycemia, antecedent exercise, and sleep. \r\n\r\nThe blood glucose response to exercise is affected by many factors including the duration, intensity, and type of exercise, the time of day when exercise is performed, plasma glucose and insulin levels, and the availability of supplemental and stored carbohydrates.\r\n\r\nGlycemic management is based on frequent glucose monitoring, adjustments to both basal and bolus insulin dosing, and consumption of carbohydrates during and after exercise.\r\n\r\nAlcohol inhibits gluconeogenesis128 and hypoglycemia is further exacerbated if there is an inadequate intake of carbohydrates. Furthermore, the symptoms of hypoglycemia may be obscured or masked by the cerebral effects of alcohol. Even moderate consumption of ethanol may reduce hypoglycemia awareness and impair the counterregulatory response to insulin-induced hypoglycemia.\"}', '', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1003, 'Dental\r\n', 'Cardiovascular', 1003, 'Acute Myocardial Infarction', 1, '{\"Text\": \"Deficient coronary arterial blood supply to myocardium resulting in cellular death and necrosis\"}', '{\"Text\": \"Type 1 - Spontaneous MI related to ischemia due to a primary coronary event such as plaque erosion and/or rupture, fissuring or dissection\r\nType 2 - MI secondary to ischemia due to either increased oxygen demand or decreased supply eg coronary artery spasm, coronary embolism, hypertension, anaemia\r\nType 3 - Sudden unexpected cardiac death, including cardiac arrest\r\nType 4a - MI associated with Percutaneous Coronary Intervention (PCI)\r\nType 4b - MI associated with stent thrombosis as documented by angiography or at autopsy\r\nType 5 - MI associated with Coronary Artery Bypass Grafting (CABG)\"}', '{\"Text\": \"Pain – severe to intolerable, prolonged, crushing/choking type, retrosternal and radiating\r\nNausea and vomiting\r\nWeakness\r\nDizziness\r\nPalpitations\r\nCold perspiration\r\nSense of impending doom\r\nAcute distress\"}', '{\"Text\": \"Based on clinical features and lab tests\"}', '{\"Text\": \"Stable Angina\r\nacute pericarditis\r\nPulmonary Embolism\r\nAortic Stenosis\r\nAortic Dissection\r\nMyocarditis\r\nPneumonia\r\nPneumothorax\r\nGastroesophageal Reflux Disease\r\nAcute Pancreatitis\r\nOesophageal Spasm\r\nMusculoskeletal Chest pain\r\nAcute Gastritis\"}', '{\"Text\": \"ECG:\r\nST wave elevation\r\nInitially peaked T-waves followed by T-wave inversion\r\nComplete Blood Count:\r\nTo monitor changes in enzymes, electrolytes and blood constituents that might have contributed to the event\r\nCardiac Biomarkers:\r\nTroponin T and I and CK-MB\r\nChest Xray - helps in differential diagnosis\"}', '', '', '{\"Text\": \"Stress Reduction Protocol\r\nSupplemental O2 during Treatment\r\nSedation\r\nAdequate Pain Control\r\nDuration of Treatment should be short\r\nTime since last MI\r\nAnticoagulation/Antiplatelet Therapy\"}', '{\"Text\": \"Postpone elective treatment for at least 6 months since last MI attack\"}', '{\"Text\": \"The blood glucose threshold for activation of autonomic signs\r\nand symptoms is related to glycemic control, antecedent hypoglycemia, antecedent exercise, and sleep. \r\n\r\nThe blood glucose response to exercise is affected by many factors including the duration, intensity, and type of exercise, the time of day when exercise is performed, plasma glucose and insulin levels, and the availability of supplemental and stored carbohydrates.\r\n\r\nGlycemic management is based on frequent glucose monitoring, adjustments to both basal and bolus insulin dosing, and consumption of carbohydrates during and after exercise.\r\n\r\nAlcohol inhibits gluconeogenesis128 and hypoglycemia is further exacerbated if there is an inadequate intake of carbohydrates. Furthermore, the symptoms of hypoglycemia may be obscured or masked by the cerebral effects of alcohol. Even moderate consumption of ethanol may reduce hypoglycemia awareness and impair the counterregulatory response to insulin-induced hypoglycemia.\"}', '{\"Text\": \"1. Thygesen et al. Fourth universal definition of myocardial infarction (2018). Circulation. 2018;138:e618–e651.\"}', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1004, 'Dental\r\n', 'Respiratory', 1004, 'Choking', 1, '{\"Text\": \"Choking is defined as an aerodigestive foreign body causing varying amounts of obstruction to the airway [1]\"}', '{\"Text\": \"A. Based on Degree of Involvement:\r\n1. Complete Airway Obstruction\r\n2. Partial Airway Obstruction\r\nB. Based on Airway Involved\r\n1. Proximal Airway Obstruction\r\n2. Distal Airway Obstruction\"}', '\"URL\": \"http://www.praxello.com/images/Choking.jpg\"}', '{\"Text\": \"Generally made on the basis of clinical findings, especially the display of Universal Choking Sign\"}', '{\"Text\": \"Viral croup\r\nAsthma\r\nViral upper respiratory tract infection\"}', '{\"Text\": \"Chest Xray to locate foreign body\"}', '', '', '{\"Text\": \"Oral packing\r\nUse of suction during procedure\r\nUse of rubber dam\r\nSemi-upright chair position\r\nFloss/ligature ties to instruments\r\nTongue grasping forceps\"}', '', '', '{\"Text\": \"1. Cramer N, Jabbour N, Tavarez MM, et al. Foreign body aspiration. In: StatPearls (Internet). Treasure Island (FL): StatPearls Publishing; 2020 Jan-.\"}', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1005, 'Dental\r\n', 'Cardiovascular', 1005, 'Angina Pectoris', 1, '{\"Text\": \"Spasmodic, cramp-like, choking feeling or suffocating chest pain due to inadequate supply of oxygen to cardiac muscles\"}', '{\"Text\": \"1. Stable Angina/Angina Pectoris\r\n2. Variant (Prinzmetal) Angina\r\n3. Unstable Angina\r\n4. Microvascular Angina\"}', '{\"Text\": \"Sudden onset of chest pain\r\npain radiates to left arm and shoulder\r\nsweating and apprehension\r\ntachycardia\r\nraised BP\r\ndyspnea\"}', '{\"Text\": \"Based on clinical features and Lab findings\"}', '{\"Text\": \"Acute Myocardial Infarction\r\nAcute Pericarditis\r\nPnuemonia\r\nAcute Pulmonary Embolism\r\nCostochondritis\r\nGastroesophageal reflux disease\r\nPanic disorder\"}', '{\"Text\": \"ECG:\r\n1. ST segment changes\r\n2. T-wave inversion\r\n\r\nRaised Cardiac Biomarkers\"}', '', '', '\'{\"Text\": \"- Stress Reduction Protocol\r\n- Shorter Appointment Time\r\n- Supplemental O2 during Treatment\r\n- Good anesthesia\r\n- Choice of anesthesia\r\n- Use of sedation\r\n- Nitroglycerine premedication\"}', '', '', '{\"Text\": \"Harrison\'s Textbook of Internal Medicine pg1444\"}', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1006, 'Dental\r\n', 'Respiratory', 1006, 'Hyperventilation Syndrome', 0, '{\"Text\": \"Ventilation in excess of what is required to maintain normal blood PaCO2 and PaO2\"}', '', '{\"Text\": \"Stress\r\nAnxiety\r\nPhysical exertion\r\nFever\r\nPanic Disorders\r\nPain\r\nMetabolic acidosis\r\nDrug intoxication\r\nHypercapnia\r\nCirrhosis\"}', '{\"Text\": \"Cardiovascular:\r\nPalpitations\r\nTachycardia\r\nNeurologic:\r\nDizziness\r\nLight-headedness\r\nAltered Consciousness\r\nDisturbance of Vision\r\nNumbness and Tingling of Extremities\r\nRespiratory:\r\nShortness of Breath\r\nDryness of Mouth\r\nGastrointestinal:\r\nEpigastric Pain\r\nMusculoskeletal:\r\nMuscle Pain and Cramps\r\nTremors\r\nStiffness\r\nPsychological:\r\nTension\r\nAnxiety\r\nMuscle Pain and Cramps\r\nTremors\r\nStiffness\r\nPsychological:\r\nTension\r\nAnxiety\"}', '{\"Text\": \"Generally based on clinical signs and symptoms\"}', '{\"Text\": \"Asthma\r\nDiabetic Ketoacidosis\r\nMyocardial Infarction\r\nPulmonary Embolism\r\nMetabolic Acidosis\r\nAcute Respiratory Distress Syndrome\r\nPneumothorax\r\nNasopharyngeal Stenosis\r\nAtrial Fibrillation\r\nChronic Nasal Congestion\"}', '{\"Text\": \"Arterial Blood Gas estimation to determine levels of CO2 and O2 in blood\r\nCardiac markers and ECG to rule out underlying cardiac causes\"}', '', '', '{\"Text\": \"Prompt recognition and management of anxiety\r\nStress Reduction Protocol\"}', '', '{\"Text\": \"Brian Kern. Hyperventilation Syndrome Workup. Medscape Nov 27, 2016.\"}', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1),
(1007, 'Dental\r\n', 'Neurology', 1007, 'Seizures', 0, '{\"Text\": \"A seizure is a paroxysmal event due to abnormal, excessive, hypersynchronous discharges from aggregate of central nervous system neurons. [1]\r\nEpilepsy describes a condition in which a person has recurrent seizures due to a chronic, underlying process [1] (two or more unprovoked seizures)\"}', '{\"Text\": \"1. Partial Seizures: (seizure activity is restricted to small areas of the cerebral cortex)\r\na. Simple partial seizures (with motor, sensory or psychic signs) (consciousness fully preserved)\r\nb. Complex partial seizures (consciousness impaired)\r\nc. Partial seizures with secondary generalization (begin as partial seizures and then spread throughout the cortex)\r\n\r\n2. Primarily Generalized Seizures: (involve mutliple areas of the brain simultaneously)\r\na. Absence (petit mal) (sudden, breif lapses of consciousness without loss of postural control)\r\nb. Tonic-clonic (grand mal) (sudden tonic contraction of muscles followed by a period of loss of consciousness)\r\nc. Tonic\r\nd. Atonic\r\ne. Myoclonic\r\n\r\n3. Unclassified Seizures:\r\na. Neonatal seizures\r\nb. Infantile seizures\"}', '{\"Text\": \"Stress\r\nAnxiety\r\nPhysical exertion\r\nFever\r\nPanic Disorders\r\nPain\r\nMetabolic acidosis\r\nDrug intoxication\r\nHypercapnia\r\nCirrhosis\"}', '{\"Text\": \"Based on type of seizure\"}', '{\"Text\": \"Based on clinical features and EEG findings\"}', '', '{\"Text\": \"Routine Blood Studies - to rule out metabolic causes of seizures due to electrolyte imbalance\r\nElectroencephalography (EEG) - measures brain activity and helps classify seizure type\r\nMRI - to rule out presence of cerebral lesions\"}', '', '', '', '{\"Text\": \"Following factors can precipitate a seizure:\r\nFlashing Lights\r\nFatigue or Decreased Physical Health\r\nMissed Meals\r\nAlcohol Ingestion\r\nPhysical or Emotional Stress\r\nLack of Sleep\r\nOnset of Menstrual Cycle\"}', '{\"Text\": \"Let patient lie down flat till recovery is complete\"}\r\n', 1001, '2020-03-09 10:19:22', 1001, '2020-03-09 10:19:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subsdetail`
--

CREATE TABLE `subsdetail` (
  `productid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `soid` int(9) NOT NULL,
  `discountid` int(9) DEFAULT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subsheader`
--

CREATE TABLE `subsheader` (
  `productid` int(9) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `cost` int(4) NOT NULL,
  `validity` int(2) NOT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subsheader`
--

INSERT INTO `subsheader` (`productid`, `branch`, `description`, `cost`, `validity`, `created`, `createdate`, `updated`, `updatedate`) VALUES
(1001, 'Dental', 'ResQ Dent Annual Subscription\r\nIncludes 3 online courses for free and 3 hands-on sessions.', 4999, 12, 1001, '2020-03-11 21:08:19', 1001, '2020-03-11 21:08:19'),
(1002, 'Dental', 'ResQ Dent Semi Annual Subscription\r\nIncludes 2 online courses for free and 1 hands-on sessions.', 1999, 6, 1001, '2020-03-11 21:08:50', 1001, '2020-03-11 21:08:50'),
(1003, 'Dental', 'ResQ Dent Annual Institutional Subscription\r\nIncludes 3 online courses for free and 3 hands-on sessions for each member. Number of members not to exceed 500.', 50000, 12, 1001, '2020-03-11 21:09:18', 1001, '2020-03-11 21:09:18'),
(1004, 'Dental', 'ResQ Dent Semi Annual Institutional Subscription\r\nIncludes 2 online courses for free and 1 hands-on sessions for each member. Number of members not to exceed 500.', 25000, 6, 1001, '2020-03-11 21:09:47', 1001, '2020-03-11 21:09:47'),
(1005, 'Medical', 'ResQ Med Annual Subscription\r\nIncludes 3 online courses for free and 3 hands-on sessions.', 6999, 12, 1001, '2020-03-11 21:10:17', 1011, '2020-03-11 21:10:17'),
(1006, 'Medical', 'ResQ Med Semi Annual Subscription\r\nIncludes 2 online courses for free and 1 hands-on sessions.', 3999, 6, 1001, '2020-03-11 21:10:44', 1001, '2020-03-11 21:10:44'),
(1007, 'Medical', 'ResQ Med Annual Institutional Subscription\r\nIncludes 3 online courses for free and 3 hands-on sessions for each member. Number of members not to exceed 500.', 60000, 12, 1001, '2020-03-11 21:11:13', 1001, '2020-03-11 21:11:13'),
(1008, 'Medical', 'ResQ Med Semi Annual Institutional Subscription\r\nIncludes 2 online courses for free and 1 hands-on sessions for each member. Number of members not to exceed 500.', 30000, 6, 1001, '2020-03-11 21:11:36', 1001, '2020-03-11 21:11:36');

-- --------------------------------------------------------

--
-- Table structure for table `userdevices`
--

CREATE TABLE `userdevices` (
  `mobile` varchar(10) NOT NULL,
  `uuid` varchar(200) DEFAULT NULL,
  `devicetype` varchar(30) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `imei` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usergroup`
--

CREATE TABLE `usergroup` (
  `groupid` int(9) NOT NULL,
  `groupname` varchar(150) NOT NULL,
  `userid` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usernotes`
--

CREATE TABLE `usernotes` (
  `userid` int(9) NOT NULL,
  `conditionid` int(9) DEFAULT NULL,
  `noteid` int(9) DEFAULT NULL,
  `note` text,
  `starred` int(1) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `roleid` int(9) NOT NULL,
  `rolename` varchar(250) DEFAULT NULL,
  `description` text,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`roleid`, `rolename`, `description`, `created`, `createdate`, `updated`, `updatedate`, `isactive`) VALUES
(1, 'Admin', 'Admin User', 1001, '2020-03-09 20:44:44', 1001, '2020-03-09 20:44:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(9) NOT NULL,
  `password` varchar(20) NOT NULL,
  `roleid` int(9) DEFAULT NULL,
  `categoryid` int(9) DEFAULT NULL,
  `businessname` text,
  `gstno` varchar(15) DEFAULT NULL,
  `usertitle` varchar(10) NOT NULL,
  `firstname` varchar(150) DEFAULT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `whatsappmobile` varchar(10) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `joiningdate` date DEFAULT NULL,
  `subscriptionid` int(9) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `altcontactname` varchar(150) DEFAULT NULL,
  `altcontactmobile` varchar(10) DEFAULT NULL,
  `billtoaddressline1` varchar(250) DEFAULT NULL,
  `billtoaddressline2` varchar(250) DEFAULT NULL,
  `billtocity` varchar(100) DEFAULT NULL,
  `billtostate` varchar(75) DEFAULT NULL,
  `billtopin` int(9) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `roleid`, `categoryid`, `businessname`, `gstno`, `usertitle`, `firstname`, `lastname`, `whatsappmobile`, `email`, `joiningdate`, `subscriptionid`, `birthdate`, `altcontactname`, `altcontactmobile`, `billtoaddressline1`, `billtoaddressline2`, `billtocity`, `billtostate`, `billtopin`, `created`, `createdate`, `updated`, `updatedate`, `isactive`) VALUES
(1001, '1234', 1, 1, 'Shri Ganesh Medicare Clinic', NULL, 'Dr.', 'Mohit', 'Bhishikar', '9011015854', 'mohit.bhishikar@praxello.com', '2020-03-10', 1001, '1975-01-01', NULL, NULL, '403, Wellworth Regency, 4th Floor,', 'Shivaji Nagar', 'Pune', 'MH', 411005, NULL, '2020-03-09 20:56:32', NULL, '2020-03-09 20:56:32', 1),
(1002, 'admin123', 1, 1, 'Shri Ganesh Medicare Clinic', NULL, 'Dr.', 'Santosh', 'Pardeshi', '9527956414', 'santosh.pardeshi@praxello.com', '2020-03-10', 1002, '1965-01-01', NULL, NULL, '403, Wellworth Regency, 4th Floor,', 'Shivaji Nagar', 'Pune', 'MH', 411005, NULL, '2020-03-09 20:56:32', NULL, '2020-03-09 20:56:32', 1),
(1003, 'admin123', 1, 1, 'Shri Ganesh Medicare Clinic', NULL, 'Dr.', 'Vikas', 'Pawar', '9657613754', 'vikas.pawar@praxello.com', '2020-03-10', 1003, '1955-07-01', NULL, NULL, '403, Wellworth Regency, 4th Floor,', 'Shivaji Nagar', 'Pune', 'MH', 411005, NULL, '2020-03-09 20:56:32', NULL, '2020-03-09 20:56:32', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usershipto`
--

CREATE TABLE `usershipto` (
  `shiptoid` int(9) NOT NULL,
  `userid` int(9) DEFAULT NULL,
  `shiptomobile` varchar(10) NOT NULL,
  `shiptoaddressline1` varchar(250) DEFAULT NULL,
  `shiptoaddressline2` varchar(250) DEFAULT NULL,
  `shiptocity` varchar(100) DEFAULT NULL,
  `shiptostate` varchar(75) DEFAULT NULL,
  `shiptopin` int(9) DEFAULT NULL,
  `landmark` varchar(250) DEFAULT NULL,
  `longitude` int(9) DEFAULT NULL,
  `latitude` int(9) DEFAULT NULL,
  `created` int(9) DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` int(9) DEFAULT NULL,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  `isactive` int(1) DEFAULT NULL,
  `isprimary` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usershipto`
--

INSERT INTO `usershipto` (`shiptoid`, `userid`, `shiptomobile`, `shiptoaddressline1`, `shiptoaddressline2`, `shiptocity`, `shiptostate`, `shiptopin`, `landmark`, `longitude`, `latitude`, `created`, `createdate`, `updated`, `updatedate`, `isactive`, `isprimary`) VALUES
(1001, 1001, '9011015854', '403, Wellworth Regency,', 'Shivaji Nagar', 'Pune', 'MH', 411005, 'Near Bus Stand', NULL, NULL, 1001, '2020-03-09 20:58:18', 1001, '2020-03-09 20:58:18', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adreferrals`
--
ALTER TABLE `adreferrals`
  ADD KEY `adid` (`adid`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`adid`),
  ADD KEY `areaid` (`areaid`);

--
-- Indexes for table `algomaster`
--
ALTER TABLE `algomaster`
  ADD PRIMARY KEY (`algoid`),
  ADD UNIQUE KEY `algoid` (`algoid`);

--
-- Indexes for table `algosteps`
--
ALTER TABLE `algosteps`
  ADD UNIQUE KEY `algoid_2` (`algoid`,`nodeid`) USING BTREE;

--
-- Indexes for table `coursedetail`
--
ALTER TABLE `coursedetail`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `courseheader`
--
ALTER TABLE `courseheader`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `courselocation`
--
ALTER TABLE `courselocation`
  ADD UNIQUE KEY `productid` (`productid`,`locationid`) USING BTREE;

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`dealerid`);

--
-- Indexes for table `deliverydetail`
--
ALTER TABLE `deliverydetail`
  ADD PRIMARY KEY (`soid`),
  ADD UNIQUE KEY `deliverydetail_index_17` (`soid`,`dealerid`,`shiptoid`,`deliverydate`),
  ADD KEY `dealerid` (`dealerid`),
  ADD KEY `shiptoid` (`shiptoid`),
  ADD KEY `deliveredby` (`deliveredby`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`productid`,`discountid`);

--
-- Indexes for table `emergencynumbers`
--
ALTER TABLE `emergencynumbers`
  ADD PRIMARY KEY (`emeregencyid`,`userid`,`emeregencyname`),
  ADD UNIQUE KEY `emeregencyid` (`emeregencyid`);

--
-- Indexes for table `expertsoncall`
--
ALTER TABLE `expertsoncall`
  ADD KEY `systemid` (`systemid`,`conditionid`) USING BTREE;

--
-- Indexes for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD UNIQUE KEY `invoicedetails_index_16` (`invoiceid`);

--
-- Indexes for table `invoiceheader`
--
ALTER TABLE `invoiceheader`
  ADD PRIMARY KEY (`invoiceid`),
  ADD UNIQUE KEY `invoiceheader_index_15` (`invoiceid`),
  ADD KEY `dealerid` (`dealerid`),
  ADD KEY `shiptoid` (`shiptoid`);

--
-- Indexes for table `kitcontents`
--
ALTER TABLE `kitcontents`
  ADD PRIMARY KEY (`productid`,`item`);

--
-- Indexes for table `productbydealer`
--
ALTER TABLE `productbydealer`
  ADD PRIMARY KEY (`productid`,`dealerid`),
  ADD KEY `dealerid` (`dealerid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productid`,`sku`),
  ADD UNIQUE KEY `products_index_4` (`productid`),
  ADD KEY `products_index_5` (`tradename`);

--
-- Indexes for table `questionsmaster`
--
ALTER TABLE `questionsmaster`
  ADD PRIMARY KEY (`quizid`,`questionid`) USING BTREE,
  ADD KEY `question_master_index_1` (`questionid`) USING BTREE,
  ADD KEY `questions_master_0` (`quizid`) USING BTREE;

--
-- Indexes for table `quizanswers`
--
ALTER TABLE `quizanswers`
  ADD KEY `quizid` (`quizid`),
  ADD KEY `answerid` (`answerid`) USING BTREE;

--
-- Indexes for table `quizmaster`
--
ALTER TABLE `quizmaster`
  ADD PRIMARY KEY (`quizid`),
  ADD UNIQUE KEY `quizid` (`quizid`),
  ADD KEY `quizmaster_index_1` (`quizid`),
  ADD KEY `quizmaster_index_2` (`conditionid`),
  ADD KEY `quizmaster_index_3` (`userId`),
  ADD KEY `quiz_question_master_index_2` (`quizid`);

--
-- Indexes for table `servicearea`
--
ALTER TABLE `servicearea`
  ADD PRIMARY KEY (`areaid`) USING BTREE,
  ADD KEY `district` (`district`) USING BTREE,
  ADD KEY `servicearea_index_18` (`areaid`) USING BTREE,
  ADD KEY `servicearea_index_20` (`areaname`) USING BTREE;

--
-- Indexes for table `sirengroup`
--
ALTER TABLE `sirengroup`
  ADD PRIMARY KEY (`groupid`),
  ADD UNIQUE KEY `groupid` (`groupid`);

--
-- Indexes for table `sirengroupmembers`
--
ALTER TABLE `sirengroupmembers`
  ADD KEY `groupid` (`groupid`) USING BTREE;

--
-- Indexes for table `sodetails`
--
ALTER TABLE `sodetails`
  ADD PRIMARY KEY (`solineid`),
  ADD UNIQUE KEY `sodetails_index_14` (`soid`,`solineid`);

--
-- Indexes for table `soheader`
--
ALTER TABLE `soheader`
  ADD PRIMARY KEY (`soid`),
  ADD UNIQUE KEY `soheader_index_13` (`soid`),
  ADD KEY `dealerid` (`dealerid`),
  ADD KEY `shiptoid` (`shiptoid`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`systemid`),
  ADD UNIQUE KEY `systemid` (`systemid`);

--
-- Indexes for table `subsdetail`
--
ALTER TABLE `subsdetail`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `subsheader`
--
ALTER TABLE `subsheader`
  ADD PRIMARY KEY (`productid`);

--
-- Indexes for table `userdevices`
--
ALTER TABLE `userdevices`
  ADD UNIQUE KEY `mobile` (`mobile`);

--
-- Indexes for table `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`roleid`),
  ADD UNIQUE KEY `userroles_index_2` (`roleid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `users_index_0` (`userid`,`email`),
  ADD UNIQUE KEY `users_index_1` (`email`),
  ADD KEY `roleid` (`roleid`);

--
-- Indexes for table `usershipto`
--
ALTER TABLE `usershipto`
  ADD PRIMARY KEY (`shiptoid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `algomaster`
--
ALTER TABLE `algomaster`
  MODIFY `algoid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `algosteps`
--
ALTER TABLE `algosteps`
  MODIFY `algoid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `coursedetail`
--
ALTER TABLE `coursedetail`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `courseheader`
--
ALTER TABLE `courseheader`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1006;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `dealerid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergencynumbers`
--
ALTER TABLE `emergencynumbers`
  MODIFY `emeregencyid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoiceheader`
--
ALTER TABLE `invoiceheader`
  MODIFY `invoiceid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kitcontents`
--
ALTER TABLE `kitcontents`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questionsmaster`
--
ALTER TABLE `questionsmaster`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `quizanswers`
--
ALTER TABLE `quizanswers`
  MODIFY `answerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `quizmaster`
--
ALTER TABLE `quizmaster`
  MODIFY `quizid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1007;

--
-- AUTO_INCREMENT for table `servicearea`
--
ALTER TABLE `servicearea`
  MODIFY `areaid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sirengroup`
--
ALTER TABLE `sirengroup`
  MODIFY `groupid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `sodetails`
--
ALTER TABLE `sodetails`
  MODIFY `solineid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soheader`
--
ALTER TABLE `soheader`
  MODIFY `soid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `systemid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `subsdetail`
--
ALTER TABLE `subsdetail`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subsheader`
--
ALTER TABLE `subsheader`
  MODIFY `productid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `groupid` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `roleid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `usershipto`
--
ALTER TABLE `usershipto`
  MODIFY `shiptoid` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adreferrals`
--
ALTER TABLE `adreferrals`
  ADD CONSTRAINT `adreferrals_ibfk_1` FOREIGN KEY (`adid`) REFERENCES `advertisements` (`adid`),
  ADD CONSTRAINT `adreferrals_ibfk_2` FOREIGN KEY (`adid`) REFERENCES `advertisements` (`adid`),
  ADD CONSTRAINT `adreferrals_ibfk_3` FOREIGN KEY (`adid`) REFERENCES `advertisements` (`adid`);

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`areaid`) REFERENCES `servicearea` (`areaid`),
  ADD CONSTRAINT `advertisements_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `servicearea` (`areaid`),
  ADD CONSTRAINT `advertisements_ibfk_3` FOREIGN KEY (`areaid`) REFERENCES `servicearea` (`areaid`);

--
-- Constraints for table `algosteps`
--
ALTER TABLE `algosteps`
  ADD CONSTRAINT `algosteps_ibfk_1` FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`),
  ADD CONSTRAINT `algosteps_ibfk_2` FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`),
  ADD CONSTRAINT `algosteps_ibfk_3` FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`),
  ADD CONSTRAINT `algosteps_ibfk_4` FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`),
  ADD CONSTRAINT `algosteps_ibfk_5` FOREIGN KEY (`algoid`) REFERENCES `algomaster` (`algoid`);

--
-- Constraints for table `coursedetail`
--
ALTER TABLE `coursedetail`
  ADD CONSTRAINT `coursedetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `courseheader` (`productid`);

--
-- Constraints for table `deliverydetail`
--
ALTER TABLE `deliverydetail`
  ADD CONSTRAINT `deliverydetail_ibfk_1` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `deliverydetail_ibfk_10` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_11` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `deliverydetail_ibfk_12` FOREIGN KEY (`deliveredby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_2` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_3` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `deliverydetail_ibfk_4` FOREIGN KEY (`deliveredby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_5` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `deliverydetail_ibfk_6` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_7` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `deliverydetail_ibfk_8` FOREIGN KEY (`deliveredby`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `deliverydetail_ibfk_9` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`);

--
-- Constraints for table `invoicedetails`
--
ALTER TABLE `invoicedetails`
  ADD CONSTRAINT `invoicedetails_ibfk_1` FOREIGN KEY (`invoiceid`) REFERENCES `invoiceheader` (`invoiceid`),
  ADD CONSTRAINT `invoicedetails_ibfk_2` FOREIGN KEY (`invoiceid`) REFERENCES `invoiceheader` (`invoiceid`),
  ADD CONSTRAINT `invoicedetails_ibfk_3` FOREIGN KEY (`invoiceid`) REFERENCES `invoiceheader` (`invoiceid`),
  ADD CONSTRAINT `invoicedetails_ibfk_4` FOREIGN KEY (`invoiceid`) REFERENCES `invoiceheader` (`invoiceid`);

--
-- Constraints for table `invoiceheader`
--
ALTER TABLE `invoiceheader`
  ADD CONSTRAINT `invoiceheader_ibfk_1` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `invoiceheader_ibfk_2` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `invoiceheader_ibfk_3` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `invoiceheader_ibfk_4` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `invoiceheader_ibfk_5` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `invoiceheader_ibfk_6` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `invoiceheader_ibfk_7` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `invoiceheader_ibfk_8` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`);

--
-- Constraints for table `kitcontents`
--
ALTER TABLE `kitcontents`
  ADD CONSTRAINT `kitcontents_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `kitcontents_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `kitcontents_ibfk_3` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `kitcontents_ibfk_4` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `kitcontents_ibfk_5` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`);

--
-- Constraints for table `productbydealer`
--
ALTER TABLE `productbydealer`
  ADD CONSTRAINT `productbydealer_ibfk_1` FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`),
  ADD CONSTRAINT `productbydealer_ibfk_10` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `productbydealer_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `productbydealer_ibfk_3` FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`),
  ADD CONSTRAINT `productbydealer_ibfk_4` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `productbydealer_ibfk_5` FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`),
  ADD CONSTRAINT `productbydealer_ibfk_6` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `productbydealer_ibfk_7` FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`),
  ADD CONSTRAINT `productbydealer_ibfk_8` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `productbydealer_ibfk_9` FOREIGN KEY (`dealerid`) REFERENCES `dealer` (`dealerid`);

--
-- Constraints for table `quizanswers`
--
ALTER TABLE `quizanswers`
  ADD CONSTRAINT `quizanswers_ibfk_1` FOREIGN KEY (`quizid`) REFERENCES `quizmaster` (`quizid`);

--
-- Constraints for table `sodetails`
--
ALTER TABLE `sodetails`
  ADD CONSTRAINT `sodetails_ibfk_1` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `sodetails_ibfk_2` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `sodetails_ibfk_3` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `sodetails_ibfk_4` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`),
  ADD CONSTRAINT `sodetails_ibfk_5` FOREIGN KEY (`soid`) REFERENCES `soheader` (`soid`);

--
-- Constraints for table `soheader`
--
ALTER TABLE `soheader`
  ADD CONSTRAINT `soheader_ibfk_1` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `soheader_ibfk_10` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `soheader_ibfk_2` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `soheader_ibfk_3` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `soheader_ibfk_4` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `soheader_ibfk_5` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `soheader_ibfk_6` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `soheader_ibfk_7` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `soheader_ibfk_8` FOREIGN KEY (`shiptoid`) REFERENCES `usershipto` (`shiptoid`),
  ADD CONSTRAINT `soheader_ibfk_9` FOREIGN KEY (`dealerid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `subsdetail`
--
ALTER TABLE `subsdetail`
  ADD CONSTRAINT `subsdetail_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `subsheader` (`productid`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`roleid`) REFERENCES `userroles` (`roleid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
