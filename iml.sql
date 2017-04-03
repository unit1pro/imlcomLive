-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2017 at 10:40 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iml`
--

-- --------------------------------------------------------

--
-- Table structure for table `group_categories`
--

CREATE TABLE IF NOT EXISTS `group_categories` (
  `CAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_NAME` varchar(120) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group_categories`
--

INSERT INTO `group_categories` (`CAT_ID`, `CAT_NAME`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'Solo', b'1', '2017-01-30 10:02:27', 1, '2017-01-30 10:02:27', 1),
(2, 'Duet', b'1', '2017-01-30 10:02:27', 1, '2017-01-30 10:02:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `iml_comment_song`
--

CREATE TABLE IF NOT EXISTS `iml_comment_song` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `AUTHOR` varchar(120) COLLATE latin1_general_ci NOT NULL,
  `EMAIL` varchar(120) COLLATE latin1_general_ci NOT NULL,
  `COMMENTS` text COLLATE latin1_general_ci NOT NULL,
  `DATE` datetime NOT NULL,
  `Song_id` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `industry_communication`
--

CREATE TABLE IF NOT EXISTS `industry_communication` (
  `M_ID` int(11) NOT NULL AUTO_INCREMENT,
  `M_Subject` varchar(150) NOT NULL,
  `M_From` int(11) NOT NULL,
  `M_To` int(11) NOT NULL,
  `M_Sent` datetime NOT NULL,
  `PM_Message` text NOT NULL,
  `M_mail` int(11) NOT NULL,
  `M_song_id` int(11) NOT NULL,
  `Song_Locked` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m_reference`
--

CREATE TABLE IF NOT EXISTS `m_reference` (
  `reference_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_code` varchar(20) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`reference_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m_reference`
--

INSERT INTO `m_reference` (`reference_id`, `reference_code`, `reference`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'ur_atv', 'User Activation', b'1', '2017-01-31 13:19:04', 1, '2017-01-31 13:19:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_reference_detail`
--

CREATE TABLE IF NOT EXISTS `m_reference_detail` (
  `Reference_Detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `Reference_ID` int(11) NOT NULL,
  `Reference_detail_code` varchar(20) NOT NULL,
  `Reference_detail` varchar(200) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`Reference_Detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m_reference_detail`
--

INSERT INTO `m_reference_detail` (`Reference_Detail_id`, `Reference_ID`, `Reference_detail_code`, `Reference_detail`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 1, 'active', 'User Active', b'1', '2017-01-31 13:21:01', 1, '2017-01-31 13:21:01', 1),
(2, 1, 'deactive', 'User Deactive', b'1', '2017-01-31 13:21:01', 1, '2017-01-31 13:21:01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE IF NOT EXISTS `songs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_ID` int(11) NOT NULL,
  `Song_Title` text NOT NULL,
  `composer` varchar(100) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `Writers` varchar(100) DEFAULT NULL,
  `synopsis` text,
  `Date` date DEFAULT NULL,
  `LINK_APPROVED` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `NO_RATES` int(11) DEFAULT NULL,
  `TOTAL_COMMENTS` int(11) DEFAULT NULL,
  `HIT_DATE` datetime DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `Song_status` int(11) DEFAULT NULL,
  `Song_File_Name` varchar(100) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`ID`, `CAT_ID`, `Song_Title`, `composer`, `director`, `Writers`, `synopsis`, `Date`, `LINK_APPROVED`, `HITS`, `RATING`, `NO_RATES`, `TOTAL_COMMENTS`, `HIT_DATE`, `Image`, `Song_status`, `Song_File_Name`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(10, 1, 'test 2', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133622000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(11, 1, 'test 3', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133837000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(12, 1, 'test 4', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133850000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(13, 1, 'test 5', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133854000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(14, 1, 'test 6', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133857000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(15, 1, 'test 7', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133901000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1),
(16, 1, 'test 8', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, 'sample-image.jpg', NULL, '2017201702020202133904000000SampleVideo_1280x720_1mb.mp4', b'1', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `song_cat`
--

CREATE TABLE IF NOT EXISTS `song_cat` (
  `CAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_TYPE` varchar(140) NOT NULL,
  `GROUPCAT` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `song_cat`
--

INSERT INTO `song_cat` (`CAT_ID`, `CAT_TYPE`, `GROUPCAT`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'Male', 1, b'1', '2017-01-30 10:03:53', 1, '2017-01-30 10:03:53', 1),
(2, 'Female', 1, b'1', '2017-01-30 10:03:53', 1, '2017-01-30 10:03:53', 1),
(3, 'Both', 2, b'1', '2017-01-30 10:04:21', 1, '2017-01-30 10:04:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usermain`
--

CREATE TABLE IF NOT EXISTS `usermain` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Email` varchar(120) NOT NULL,
  `DOB` date DEFAULT NULL,
  `AboutMe` text,
  `DateJoined` date DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Hits` int(11) DEFAULT NULL,
  `LastVisit` datetime DEFAULT NULL,
  `LastUpdated` datetime DEFAULT NULL,
  `ContactMe` int(11) DEFAULT NULL,
  `PMEmailNotification` int(11) DEFAULT NULL,
  `Activation` int(11) DEFAULT NULL,
  `ShowFriendsListinProfile` int(11) DEFAULT NULL,
  `ShowsingerProfile` int(11) DEFAULT NULL,
  `NumRecordsSongsQuickView` int(11) DEFAULT NULL,
  `NumRecordsFriendsList` int(11) DEFAULT NULL,
  `IsFirsTimeLogin` int(11) DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `usermain`
--

INSERT INTO `usermain` (`UID`, `UserName`, `Password`, `FirstName`, `LastName`, `City`, `State`, `Country`, `Email`, `DOB`, `AboutMe`, `DateJoined`, `Photo`, `Website`, `Hits`, `LastVisit`, `LastUpdated`, `ContactMe`, `PMEmailNotification`, `Activation`, `ShowFriendsListinProfile`, `ShowsingerProfile`, `NumRecordsSongsQuickView`, `NumRecordsFriendsList`, `IsFirsTimeLogin`, `UserType`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'admin', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Gaurav', 'Rao', 'Mumbai', 'Maharashtra', 'India', 'gaurav@indianmusiclab.com', '1990-04-19', '', '2017-01-30', '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 1, b'1', '2017-01-30 08:50:00', 1, '2017-01-30 08:50:00', 1),
(2, 'shikhar', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Shikhar', 'Kumar', '', '', '', 'shikhar@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-01-30 13:40:23', 1, '2017-01-30 13:40:23', 1),
(3, 'testuser2', '7c39e97815e778d2d7c3ce2f56c6fd12', 'test', 'user2', '', '', '', 'testuser2@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-02-02 12:41:27', 1, '2017-02-02 12:41:27', 1),
(4, 'testuser3', '7c39e97815e778d2d7c3ce2f56c6fd12', 'test', 'user3', '', '', '', 'testuser3@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-02-02 12:44:15', 1, '2017-02-02 12:44:15', 1),
(5, 'testuser4', '7c39e97815e778d2d7c3ce2f56c6fd12', 'test', 'user4', '', '', '', 'testuser4@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-02-02 12:44:56', 1, '2017-02-02 12:44:56', 1),
(6, 'testuser5', '7c39e97815e778d2d7c3ce2f56c6fd12', 'test', 'user5', '', '', '', 'testuser5@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-02-02 12:45:33', 1, '2017-02-02 12:45:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usersuspensionlog`
--

CREATE TABLE IF NOT EXISTS `usersuspensionlog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Note` text NOT NULL,
  `Date` datetime NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_song`
--

CREATE TABLE IF NOT EXISTS `user_song` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `SongsID` int(11) NOT NULL,
  `Hits` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Song_Locked` int(11) DEFAULT NULL,
  `Locked_communication_id` int(11) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `user_song`
--

INSERT INTO `user_song` (`ID`, `UID`, `SongsID`, `Hits`, `Date`, `Song_Locked`, `Locked_communication_id`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 2, 10, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:36:22', 1, '2017-02-02 12:36:22', 1),
(2, 3, 11, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:37', 1, '2017-02-02 12:38:37', 1),
(3, 4, 12, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:50', 1, '2017-02-02 12:38:50', 1),
(4, 5, 13, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:54', 1, '2017-02-02 12:38:54', 1),
(5, 6, 14, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:58', 1, '2017-02-02 12:38:58', 1),
(6, 2, 15, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:39:01', 1, '2017-02-02 12:39:01', 1),
(7, 2, 16, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:39:04', 1, '2017-02-02 12:39:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Type` varchar(20) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`ID`, `User_Type`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'admin', b'1', '2017-01-30 08:46:15', 1, '2017-01-30 08:46:15', 1),
(2, 'moderator', b'1', '2017-01-30 08:46:15', 1, '2017-01-30 08:46:15', 1),
(3, 'artist', b'1', '2017-01-30 12:11:54', 1, '2017-01-30 12:11:54', 1),
(4, 'public', b'1', '2017-01-30 12:11:54', 1, '2017-01-30 12:11:54', 1),
(5, 'industry', b'1', '2017-01-30 12:12:27', 1, '2017-01-30 12:12:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `whoisonline`
--

CREATE TABLE IF NOT EXISTS `whoisonline` (
  `UserName` varchar(200) NOT NULL,
  `UserIP` varchar(200) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `LastDateChecked` datetime NOT NULL,
  `CheckedIn` datetime NOT NULL,
  `LastChecked` datetime NOT NULL,
  `PageBrowse` text NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
