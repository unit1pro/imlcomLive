-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2017 at 01:47 PM
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
(5, 10, 'images', '20170211155009000000user-image.png', b'1', '2017-02-11 14:50:11', 1, '2017-02-11 14:50:11', 1),
(6, 42, 'images', '20170408081917000000855354f514e70099cbd0220ded75ddc3.JPG', b'1', '2017-04-08 08:19:18', 21, '2017-04-08 08:19:18', 21),
(7, 44, 'images', '20170410085917000000855354f514e70099cbd0220ded75ddc3.JPG', b'1', '2017-04-10 08:59:18', 22, '2017-04-10 08:59:18', 22),
(8, 45, 'images', '20170410090608000000665091.jpg', b'1', '2017-04-10 09:06:10', 22, '2017-04-10 09:06:10', 22),
(9, 46, 'images', '20170410090748000000d9c84860f3bef6445c8b1ed4b09de024.JPG', b'1', '2017-04-10 09:07:51', 22, '2017-04-10 09:07:51', 22),
(10, 47, 'images', '20170410091521000000511052.jpg', b'1', '2017-04-10 09:15:23', 22, '2017-04-10 09:15:23', 22),
(11, 48, 'images', '20170410092649000000kanganaranaut.png', b'1', '2017-04-10 09:26:52', 22, '2017-04-10 09:26:52', 22),
(12, 49, 'images', '20170410092907000000kiaraadvani.png', b'1', '2017-04-10 09:29:08', 22, '2017-04-10 09:29:08', 22);

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
(32, 1, 0, NULL, NULL, 'hello', NULL, 15, b'1', '2017-04-06 13:23:27', 1, '2017-04-06 13:23:27', 1),
(33, 1, -1, NULL, NULL, 'ggggg', NULL, 10, b'1', '2017-04-07 06:39:33', 1, '2017-04-07 06:39:33', 1),
(34, 21, -1, NULL, NULL, 'hello from rajkumar', NULL, 10, b'1', '2017-04-07 09:19:57', 21, '2017-04-07 09:19:57', 21),
(35, 21, 0, NULL, NULL, 'Hello', NULL, 15, b'1', '2017-04-07 09:32:12', 21, '2017-04-07 09:32:12', 21),
(36, 21, 0, NULL, NULL, 'sdfsdfsd', NULL, 15, b'1', '2017-04-07 11:17:42', 21, '2017-04-07 11:17:42', 21),
(37, 21, 36, NULL, NULL, 'hmmm', NULL, 0, b'1', '2017-04-07 11:20:03', 21, '2017-04-07 11:20:03', 21),
(38, 21, 0, NULL, NULL, 'test', NULL, 16, b'1', '2017-04-08 07:37:34', 21, '2017-04-08 07:37:34', 21),
(39, 21, 0, NULL, NULL, 'test 1', NULL, 0, b'1', '2017-04-08 07:51:39', 21, '2017-04-08 07:51:39', 21),
(40, 21, 0, NULL, NULL, 'test 2', NULL, 0, b'1', '2017-04-08 07:51:47', 21, '2017-04-08 07:51:47', 21),
(41, 21, 0, NULL, NULL, 'hello', NULL, 12, b'1', '2017-04-08 08:18:06', 21, '2017-04-08 08:18:06', 21),
(42, 21, 0, NULL, NULL, 'adfDFdafDAFADFSAFDSA', NULL, 0, b'1', '2017-04-08 08:19:18', 21, '2017-04-08 08:19:18', 21),
(43, 22, 0, NULL, NULL, 'gfdggfdgfdg', NULL, 15, b'1', '2017-04-08 11:33:51', 22, '2017-04-08 11:33:51', 22),
(44, 22, 0, NULL, NULL, 'testing file comment', NULL, 0, b'1', '2017-04-10 08:59:18', 22, '2017-04-10 08:59:18', 22),
(45, 22, 0, NULL, NULL, 'another one', NULL, 0, b'1', '2017-04-10 09:06:10', 22, '2017-04-10 09:06:10', 22),
(46, 22, 0, NULL, NULL, 'sdfsdfs', NULL, 0, b'1', '2017-04-10 09:07:51', 22, '2017-04-10 09:07:51', 22),
(47, 22, 0, NULL, NULL, 'sdfsdfsd', NULL, 0, b'1', '2017-04-10 09:15:23', 22, '2017-04-10 09:15:23', 22),
(48, 22, 0, NULL, NULL, 'sfsdf', NULL, 0, b'1', '2017-04-10 09:26:52', 22, '2017-04-10 09:26:52', 22),
(49, 22, 0, NULL, NULL, 'vssd', NULL, 0, b'1', '2017-04-10 09:29:08', 22, '2017-04-10 09:29:08', 22),
(50, 22, 0, NULL, NULL, 'adcdsfd', NULL, 15, b'1', '2017-04-11 06:43:22', 22, '2017-04-11 06:43:22', 22),
(51, 22, 0, NULL, NULL, 'adcdsfdnvbnvbn', NULL, 15, b'1', '2017-04-11 06:43:32', 22, '2017-04-11 06:43:32', 22),
(52, 22, 0, NULL, NULL, 'Test', NULL, 0, b'1', '2017-04-13 11:52:23', 22, '2017-04-13 11:52:23', 22),
(53, 22, 0, NULL, NULL, 'vcvxcv', NULL, 0, b'1', '2017-04-13 11:57:37', 22, '2017-04-13 11:57:37', 22),
(54, 22, 53, NULL, NULL, 'vxvxcvxcv', NULL, 0, b'1', '2017-04-13 11:57:44', 22, '2017-04-13 11:57:44', 22),
(55, 22, 53, NULL, NULL, 'shxgsxglkxhajkxhkjxhkjxhkxhkshxkajhakjxhkajxhkasjxhkaxxh', NULL, 0, b'1', '2017-04-14 09:06:41', 22, '2017-04-14 09:06:41', 22),
(56, 22, -1, NULL, NULL, 'gaurav comments', NULL, 11, b'1', '2017-04-14 16:36:36', 22, '2017-04-14 16:36:36', 22),
(57, 22, 0, NULL, NULL, 'vnvn', NULL, 15, b'1', '2017-04-15 11:06:04', 22, '2017-04-15 11:06:04', 22),
(58, 22, 0, NULL, NULL, 'gfdgdf', NULL, 15, b'1', '2017-04-15 11:07:07', 22, '2017-04-15 11:07:07', 22),
(59, 22, 0, NULL, NULL, 'rage', NULL, 15, b'1', '2017-04-15 11:18:34', 22, '2017-04-15 11:18:34', 22),
(60, 22, 59, NULL, NULL, 'ccvxcbxc', NULL, 0, b'1', '2017-04-15 12:14:46', 22, '2017-04-15 12:14:46', 22),
(61, 22, 59, NULL, NULL, 'ccvxcbxc', NULL, 0, b'1', '2017-04-15 12:22:44', 22, '2017-04-15 12:22:44', 22),
(62, 22, 59, NULL, NULL, 'sfsdfsdfsdf', NULL, 0, b'1', '2017-04-15 12:25:59', 22, '2017-04-15 12:25:59', 22),
(63, 22, 59, NULL, NULL, 'gsdfsdf', NULL, 0, b'1', '2017-04-15 12:32:22', 22, '2017-04-15 12:32:22', 22),
(64, 22, 59, NULL, NULL, 'sdfsdfsdf', NULL, 0, b'1', '2017-04-15 12:32:57', 22, '2017-04-15 12:32:57', 22),
(65, 22, 59, NULL, NULL, 'rex', NULL, 0, b'1', '2017-04-15 12:34:09', 22, '2017-04-15 12:34:09', 22),
(66, 22, 59, NULL, NULL, 'power', NULL, 0, b'1', '2017-04-15 12:35:43', 22, '2017-04-15 12:35:43', 22),
(67, 22, 59, NULL, NULL, 'hmmm', NULL, 0, b'1', '2017-04-15 12:36:35', 22, '2017-04-15 12:36:35', 22),
(68, 22, 59, NULL, NULL, 'again', NULL, 0, b'1', '2017-04-15 12:37:15', 22, '2017-04-15 12:37:15', 22),
(69, 22, 0, NULL, NULL, 'wgwrtregr', NULL, 15, b'1', '2017-04-18 09:39:56', 22, '2017-04-18 09:39:56', 22);

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
-- Table structure for table `social_response`
--

CREATE TABLE `social_response` (
  `id` int(11) NOT NULL,
  `response_type` tinyint(4) NOT NULL COMMENT '0->neutral;1->like;2->dislike',
  `response_on` tinyint(4) NOT NULL,
  `post_type` tinyint(10) NOT NULL COMMENT '1->song, 2->post, 3->comment',
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_response`
--

INSERT INTO `social_response` (`id`, `response_type`, `response_on`, `post_type`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(46, 2, 69, 3, 22, '2017-04-18 04:09:59', 22, '2017-04-18 04:10:00'),
(45, 2, 15, 1, 22, '2017-04-18 04:09:50', 22, '2017-04-18 04:09:51'),
(44, 2, 63, 3, 22, '2017-04-15 07:03:23', 22, '2017-04-15 07:03:23'),
(43, 2, 10, 1, 22, '2017-04-15 06:08:30', 22, '2017-04-15 06:08:30'),
(42, 1, 59, 3, 22, '2017-04-15 05:48:37', 22, '2017-04-15 05:48:40'),
(41, 2, 53, 2, 1, '2017-04-15 04:09:14', 1, '2017-04-15 04:09:14'),
(40, 1, 54, 3, 1, '2017-04-15 04:09:12', 1, '2017-04-15 04:09:12'),
(39, 2, 54, 3, 22, '2017-04-15 04:08:58', 22, '2017-04-15 04:08:58'),
(38, 1, 55, 3, 22, '2017-04-15 04:08:55', 22, '2017-04-15 05:35:31'),
(37, 2, 16, 1, 1, '2017-04-15 04:07:03', 1, '2017-04-15 04:07:03'),
(36, 1, 16, 1, 22, '2017-04-15 04:06:08', 22, '2017-04-15 04:06:10');

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
(10, 1, 'Ibadat', 'Alan Manjrekar', '', '', '', '2017-03-05', NULL, 6, NULL, NULL, NULL, NULL, 'Shikhar.jpg', 1, '2017201702020202133622000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-15 11:38:35', 1, '0000-00-00 00:00:00', 1),
(11, 1, 'test 3', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 11, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133837000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-14 16:38:13', 1, '0000-00-00 00:00:00', 1),
(12, 1, 'test 4', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 60, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133850000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-15 12:58:03', 1, '0000-00-00 00:00:00', 1),
(13, 1, 'test 5', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 43, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133854000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-15 11:36:58', 1, '0000-00-00 00:00:00', 1),
(14, 1, 'test 6', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 48, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133857000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-15 12:13:56', 1, '0000-00-00 00:00:00', 1),
(15, 1, 'test 7', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 38, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133901000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-18 09:39:48', 1, '0000-00-00 00:00:00', 1),
(16, 1, 'test 8', 'test c1', 'test d', 'test w', 'Test', '0000-00-00', NULL, 53, NULL, NULL, NULL, NULL, 'sample-image.jpg', 1, '2017201702020202133904000000SampleVideo_1280x720_1mb.mp4', b'1', '2017-04-15 12:58:23', 1, '0000-00-00 00:00:00', 1);

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
(12, 'sachin', '7c39e97815e778d2d7c3ce2f56c6fd12', 'Sachin', 'Dave', '', '', '', '', 'sachin@indiantimesdaily.com', '0000-00-00', '', '0000-00-00', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, b'1', '2017-03-07 04:12:50', 1, '2017-03-07 04:12:50', 1),
(22, 'rajkumar', 'fcea920f7412b5da7be0cf42b8c93759', 'Raj', 'Kumar', '9839653641', '', '', '', 'rkgt76@gmail.com', '1970-01-01', '', '2017-04-10', '855354f514e70099cbd0220ded75ddc3.JPG', 'raj.kr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, b'1', '2017-04-08 11:21:51', 1, '2017-04-08 11:21:51', 22),
(23, 'test1234', '7c39e97815e778d2d7c3ce2f56c6fd12', 'test', '1234', '', '', '', '', 'test1234@gmil.com', '0000-00-00', '', '2017-04-19', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, b'1', '2017-04-19 12:58:03', 0, '2017-04-19 12:58:03', 0);

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
-- Indexes for table `social_response`
--
ALTER TABLE `social_response`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `att_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `group_categories`
--
ALTER TABLE `group_categories`
  MODIFY `CAT_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `iml_comment_song`
--
ALTER TABLE `iml_comment_song`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
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
-- AUTO_INCREMENT for table `social_response`
--
ALTER TABLE `social_response`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
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
  MODIFY `UID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
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
