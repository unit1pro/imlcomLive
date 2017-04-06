-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2017 at 01:31 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iml`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment_attachments`
--

CREATE TABLE `comment_attachments` (
  `att_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `attachment_type` varchar(20) NOT NULL,
  `attachment_path` text NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment_attachments`
--

INSERT INTO `comment_attachments` (`att_id`, `comment_id`, `attachment_type`, `attachment_path`, `isActive`, `created_on`, `created_by`, `updated_on`, `updated_by`) VALUES
(1, 2, 'images', '20170210143131000000homepage_background.jpg', b'1', '2017-02-10 13:31:34', 1, '2017-02-10 13:31:34', 1),
(2, 3, 'images', '20170210143201000000logo-red.png', b'1', '2017-02-10 13:32:02', 1, '2017-02-10 13:32:02', 1),
(3, 3, 'images', '20170210143201000000homepage_background.jpg', b'1', '2017-02-10 13:32:02', 1, '2017-02-10 13:32:02', 1),
(4, 10, 'images', '20170211155003000000bg.jpg', b'1', '2017-02-11 14:50:11', 1, '2017-02-11 14:50:11', 1),
(5, 10, 'images', '20170211155009000000user-image.png', b'1', '2017-02-11 14:50:11', 1, '2017-02-11 14:50:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_categories`
--

CREATE TABLE `group_categories` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_NAME` varchar(120) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `iml_comment_song` (
  `COM_ID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `AUTHOR` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `EMAIL` varchar(120) COLLATE latin1_general_ci DEFAULT NULL,
  `COMMENTS` text COLLATE latin1_general_ci NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `Song_id` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `iml_comment_song`
--

INSERT INTO `iml_comment_song` (`COM_ID`, `ID`, `parent_id`, `AUTHOR`, `EMAIL`, `COMMENTS`, `DATE`, `Song_id`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 1, 0, NULL, NULL, 'Post without attachment', NULL, 0, b'1', '2017-02-10 13:31:10', 1, '2017-02-10 13:31:10', 1),
(2, 1, 0, NULL, NULL, 'Test Post With 1 Attachment', NULL, 0, b'1', '2017-02-10 13:31:34', 1, '2017-02-10 13:31:34', 1),
(3, 1, 0, NULL, NULL, 'test comment with multiple attachments', NULL, 0, b'1', '2017-02-10 13:32:02', 1, '2017-02-10 13:32:02', 1),
(4, 1, 0, NULL, NULL, 'test 1', NULL, 0, b'1', '2017-02-11 14:30:36', 1, '2017-02-11 14:30:36', 1),
(5, 1, 0, NULL, NULL, 'test 2', NULL, 0, b'1', '2017-02-11 14:30:45', 1, '2017-02-11 14:30:45', 1),
(6, 1, 0, NULL, NULL, 'test 4', NULL, 0, b'1', '2017-02-11 14:31:15', 1, '2017-02-11 14:31:15', 1),
(7, 1, 0, NULL, NULL, 'test 5\r\n', NULL, 0, b'1', '2017-02-11 14:31:50', 1, '2017-02-11 14:31:50', 1),
(8, 1, 0, NULL, NULL, 'test 6', NULL, 0, b'1', '2017-02-11 14:33:09', 1, '2017-02-11 14:33:09', 1),
(9, 1, 0, NULL, NULL, 'test 7', NULL, 0, b'1', '2017-02-11 14:33:20', 1, '2017-02-11 14:33:20', 1),
(10, 1, 0, NULL, NULL, 'test 8 with attachment', NULL, 0, b'1', '2017-02-11 14:50:11', 1, '2017-02-11 14:50:11', 1),
(11, 1, 9, NULL, NULL, 'hmm', NULL, 0, b'1', '2017-04-03 10:07:35', 1, '2017-04-03 10:07:35', 1),
(12, 1, -1, NULL, NULL, 'soo', NULL, 11, b'1', '2017-04-03 10:08:35', 1, '2017-04-03 10:08:35', 1),
(13, 1, 0, NULL, NULL, 'hello new post', NULL, 0, b'1', '2017-04-03 10:10:13', 1, '2017-04-03 10:10:13', 1),
(14, 1, 0, NULL, NULL, 'sgsdf', NULL, 13, b'1', '2017-04-03 10:13:45', 1, '2017-04-03 10:13:45', 1),
(15, 1, 0, NULL, NULL, 'dfgfdg', NULL, 13, b'1', '2017-04-03 10:14:10', 1, '2017-04-03 10:14:10', 1),
(16, 1, 0, NULL, NULL, 'testing', NULL, 0, b'1', '2017-04-03 11:01:48', 1, '2017-04-03 11:01:48', 1),
(17, 1, 2, NULL, NULL, 'lets see', NULL, 0, b'1', '2017-04-04 07:32:50', 1, '2017-04-04 07:32:50', 1),
(18, 1, -1, NULL, NULL, 'hmmm', NULL, 16, b'1', '2017-04-04 07:33:06', 1, '2017-04-04 07:33:06', 1),
(19, 1, -1, NULL, NULL, 'hello', NULL, 11, b'1', '2017-04-05 09:32:43', 1, '2017-04-05 09:32:43', 1),
(20, 1, 0, NULL, NULL, 'hello', NULL, 14, b'1', '2017-04-05 09:35:22', 1, '2017-04-05 09:35:22', 1),
(21, 1, -1, NULL, NULL, 'testing', NULL, 10, b'1', '2017-04-05 09:51:02', 1, '2017-04-05 09:51:02', 1),
(22, 1, -1, NULL, NULL, 'again testing', NULL, 10, b'1', '2017-04-05 09:52:25', 1, '2017-04-05 09:52:25', 1),
(23, 1, -1, NULL, NULL, 'hmm again', NULL, 10, b'1', '2017-04-05 09:56:47', 1, '2017-04-05 09:56:47', 1),
(24, 1, -1, NULL, NULL, 'hello', NULL, 10, b'1', '2017-04-05 09:59:29', 1, '2017-04-05 09:59:29', 1),
(25, 1, 0, NULL, NULL, 'hello', NULL, 13, b'1', '2017-04-05 11:46:06', 1, '2017-04-05 11:46:06', 1),
(26, 1, 0, NULL, NULL, 'sdfsdf', NULL, 13, b'1', '2017-04-05 11:47:23', 1, '2017-04-05 11:47:23', 1),
(27, 1, -1, NULL, NULL, 'lets see', NULL, 10, b'1', '2017-04-05 12:08:59', 1, '2017-04-05 12:08:59', 1),
(28, 1, 0, NULL, NULL, 'sdsdfsdfsd', NULL, 13, b'1', '2017-04-06 09:22:25', 1, '2017-04-06 09:22:25', 1),
(29, 1, 0, NULL, NULL, 'ergfdgfdg', NULL, 13, b'1', '2017-04-06 09:30:47', 1, '2017-04-06 09:30:47', 1),
(30, 1, 0, NULL, NULL, 'rex', NULL, 13, b'1', '2017-04-06 11:12:51', 1, '2017-04-06 11:12:51', 1),
(31, 1, 0, NULL, NULL, 'latest', NULL, 13, b'1', '2017-04-06 13:22:48', 1, '2017-04-06 13:22:48', 1),
(32, 1, 0, NULL, NULL, 'hello', NULL, 15, b'1', '2017-04-06 13:23:27', 1, '2017-04-06 13:23:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `industry_communication`
--

CREATE TABLE `industry_communication` (
  `M_ID` int(11) NOT NULL,
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
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `m_reference`
--

CREATE TABLE `m_reference` (
  `reference_id` int(11) NOT NULL,
  `reference_code` varchar(20) NOT NULL,
  `reference` varchar(200) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_reference`
--

INSERT INTO `m_reference` (`reference_id`, `reference_code`, `reference`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'ur_atv', 'User Activation', b'1', '2017-01-31 13:19:04', 1, '2017-01-31 13:19:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_reference_detail`
--

CREATE TABLE `m_reference_detail` (
  `Reference_Detail_id` int(11) NOT NULL,
  `Reference_ID` int(11) NOT NULL,
  `Reference_detail_code` varchar(20) NOT NULL,
  `Reference_detail` varchar(200) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `songs` (
  `ID` int(11) NOT NULL,
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
  `Song_status` int(11) DEFAULT '0' COMMENT '0->in Review, 1->public',
  `Song_File_Name` varchar(100) DEFAULT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`ID`, `CAT_ID`, `Song_Title`, `composer`, `director`, `Writers`, `synopsis`, `Date`, `LINK_APPROVED`, `HITS`, `RATING`, `NO_RATES`, `TOTAL_COMMENTS`, `HIT_DATE`, `Image`, `Song_status`, `Song_File_Name`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(10, 1, 'Ibadat', 'Alan Manjrekar', '', '', '', '2017-03-05', NULL, 4, NULL, NULL, NULL, NULL, 'Shikhar.jpg', 1, '2017201702020202133622000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-05 12:09:44', 1, '0000-00-00 00:00:00', 1),
(11, 1, 'test 3', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 6, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133837000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-06 11:46:15', 1, '0000-00-00 00:00:00', 1),
(12, 1, 'test 4', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 14, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133850000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-05 09:45:08', 1, '0000-00-00 00:00:00', 1),
(13, 1, 'test 5', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 33, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133854000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-06 13:22:53', 1, '0000-00-00 00:00:00', 1),
(14, 1, 'test 6', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 17, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133857000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-06 07:02:28', 1, '0000-00-00 00:00:00', 1),
(15, 1, 'test 7', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 12, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133901000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-06 13:23:30', 1, '0000-00-00 00:00:00', 1),
(16, 1, 'test 8', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 12, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133904000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-05 09:49:24', 1, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `song_cat`
--

CREATE TABLE `song_cat` (
  `CAT_ID` int(11) NOT NULL,
  `CAT_TYPE` varchar(140) NOT NULL,
  `GROUPCAT` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `usermain` (
  `UID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `ContactMe` varchar(100) NOT NULL,
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
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usermain`
--

INSERT INTO `usermain` (`UID`, `UserName`, `Password`, `FirstName`, `LastName`, `ContactMe`, `City`, `State`, `Country`, `Email`, `DOB`, `AboutMe`, `DateJoined`, `Photo`, `Website`, `Hits`, `LastVisit`, `LastUpdated`, `PMEmailNotification`, `Activation`, `ShowFriendsListinProfile`, `ShowsingerProfile`, `NumRecordsSongsQuickView`, `NumRecordsFriendsList`, `IsFirsTimeLogin`, `UserType`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 'admin', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Gaurav', 'Rao', '7388458272', 'Mumbai', 'Maharastra', 'India', 'gr19490@gmail.com', '1990-04-19', '', '0000-00-00', 'Varun Dhawan.JPG', 'gaurav.com', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, b'1', '2017-01-30 08:50:00', 1, '2017-01-30 08:50:00', 1),
(7, 'RohitShethy', 'e10adc3949ba59abbe56e057f20f883e', 'Rohit', 'Shethy', '', '', '', '', 'rs@iml.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, b'1', '2017-02-11 13:48:57', 1, '2017-02-11 13:48:57', 1),
(8, 'shikharkumar', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Shikhar', 'Kumar', '', '', '', '', 'shikhar@indianmusiclab.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-02-20 14:42:42', 1, '2017-02-20 14:42:42', 1),
(9, 'hansa', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Hanshaduti', 'Kundu', '', '', '', '', 'hanshaduti@indianmusiclab.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-03-07 04:07:43', 1, '2017-03-07 04:07:43', 1),
(10, 'anurag', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Anurag', 'Puranik', '', '', '', '', 'anurag@indianmusiclab.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-03-07 04:09:29', 1, '2017-03-07 04:09:29', 1),
(11, 'ashwani', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Ashwani', 'Bisoya', '', '', '', '', 'ashwani@indianmusiclab.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-03-07 04:11:24', 1, '2017-03-07 04:11:24', 1),
(12, 'sachin', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Sachin', 'Dave', '', '', '', '', 'sachin@indiantimesdaily.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-03-07 04:12:50', 1, '2017-03-07 04:12:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usersuspensionlog`
--

CREATE TABLE `usersuspensionlog` (
  `ID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Note` text NOT NULL,
  `Date` datetime NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_song`
--

CREATE TABLE `user_song` (
  `ID` int(11) NOT NULL,
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
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_song`
--

INSERT INTO `user_song` (`ID`, `UID`, `SongsID`, `Hits`, `Date`, `Song_Locked`, `Locked_communication_id`, `isActive`, `created_On`, `Created_By`, `Updated_On`, `Updated_By`) VALUES
(1, 8, 10, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:36:22', 1, '2017-02-02 12:36:22', 1),
(2, 9, 11, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:37', 1, '2017-02-02 12:38:37', 1),
(3, 10, 12, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:50', 1, '2017-02-02 12:38:50', 1),
(4, 11, 13, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:54', 1, '2017-02-02 12:38:54', 1),
(5, 12, 14, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:38:58', 1, '2017-02-02 12:38:58', 1),
(6, 8, 15, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:39:01', 1, '2017-02-02 12:39:01', 1),
(7, 9, 16, NULL, NULL, NULL, NULL, b'1', '2017-02-02 12:39:04', 1, '2017-02-02 12:39:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `ID` int(11) NOT NULL,
  `User_Type` varchar(20) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `whoisonline` (
  `UserName` varchar(200) NOT NULL,
  `UserIP` varchar(200) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `LastDateChecked` datetime NOT NULL,
  `CheckedIn` datetime NOT NULL,
  `LastChecked` datetime NOT NULL,
  `PageBrowse` text NOT NULL,
  `isActive` bit(1) NOT NULL,
  `created_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Created_By` int(11) NOT NULL,
  `Updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment_attachments`
--
ALTER TABLE `comment_attachments`
  ADD PRIMARY KEY (`att_id`);

--
-- Indexes for table `group_categories`
--
ALTER TABLE `group_categories`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `iml_comment_song`
--
ALTER TABLE `iml_comment_song`
  ADD PRIMARY KEY (`COM_ID`);

--
-- Indexes for table `industry_communication`
--
ALTER TABLE `industry_communication`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `m_reference`
--
ALTER TABLE `m_reference`
  ADD PRIMARY KEY (`reference_id`);

--
-- Indexes for table `m_reference_detail`
--
ALTER TABLE `m_reference_detail`
  ADD PRIMARY KEY (`Reference_Detail_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `song_cat`
--
ALTER TABLE `song_cat`
  ADD PRIMARY KEY (`CAT_ID`);

--
-- Indexes for table `usermain`
--
ALTER TABLE `usermain`
  ADD PRIMARY KEY (`UID`);

--
-- Indexes for table `usersuspensionlog`
--
ALTER TABLE `usersuspensionlog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_song`
--
ALTER TABLE `user_song`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment_attachments`
--
ALTER TABLE `comment_attachments`
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `group_categories`
--
ALTER TABLE `group_categories`
  MODIFY `CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `iml_comment_song`
--
ALTER TABLE `iml_comment_song`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `industry_communication`
--
ALTER TABLE `industry_communication`
  MODIFY `M_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `m_reference`
--
ALTER TABLE `m_reference`
  MODIFY `reference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_reference_detail`
--
ALTER TABLE `m_reference_detail`
  MODIFY `Reference_Detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `song_cat`
--
ALTER TABLE `song_cat`
  MODIFY `CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usermain`
--
ALTER TABLE `usermain`
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `usersuspensionlog`
--
ALTER TABLE `usersuspensionlog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_song`
--
ALTER TABLE `user_song`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
