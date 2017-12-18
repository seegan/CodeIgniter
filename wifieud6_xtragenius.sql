-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2017 at 01:03 PM
-- Server version: 5.6.29-76.2-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wifieud6_xtragenius`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `ai` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`ai`, `action_id`, `user_id`) VALUES
(1, 2, 2147484848);

-- --------------------------------------------------------

--
-- Table structure for table `acl_actions`
--

CREATE TABLE IF NOT EXISTS `acl_actions` (
  `action_id` int(10) unsigned NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_actions`
--

INSERT INTO `acl_actions` (`action_id`, `action_code`, `action_desc`, `category_id`) VALUES
(1, '*', 'All Actions', 1),
(2, 'view_documents', 'View Documents', 1);

-- --------------------------------------------------------

--
-- Table structure for table `acl_categories`
--

CREATE TABLE IF NOT EXISTS `acl_categories` (
  `category_id` int(10) unsigned NOT NULL,
  `category_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `category_desc` varchar(100) NOT NULL COMMENT 'Human readable description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `acl_categories`
--

INSERT INTO `acl_categories` (`category_id`, `category_code`, `category_desc`) VALUES
(1, 'general', 'General Permissions');

-- --------------------------------------------------------

--
-- Table structure for table `auth_sessions`
--

CREATE TABLE IF NOT EXISTS `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('2rrnapd4tqsqg2c458jrfq9219du9gou', 120809394, '2017-12-18 10:02:26', '2017-12-18 12:24:08', '210.18.157.2', 'Chrome 63.0.3239.84 on Windows 7'),
('nn4ud9rmmmb7qpaps0cr87jj3o1r3vgh', 3725195695, '2017-12-18 16:36:40', '2017-12-18 11:57:36', '210.18.157.2', 'Chrome 63.0.3239.84 on Windows 7'),
('oos6cujfcqd5lsek4pfbe3pflgbq3l5g', 3725195695, '2017-12-18 18:09:54', '2017-12-18 13:02:33', '210.18.157.2', 'Chrome 63.0.3239.84 on Windows 7');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `denied_access`
--

CREATE TABLE IF NOT EXISTS `denied_access` (
  `ai` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) unsigned DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ips_on_hold`
--

CREATE TABLE IF NOT EXISTS `ips_on_hold` (
  `ai` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_errors`
--

CREATE TABLE IF NOT EXISTS `login_errors` (
  `ai` int(10) unsigned NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_errors`
--

INSERT INTO `login_errors` (`ai`, `username_or_email`, `ip_address`, `time`) VALUES
(0, 'BUDB17005', '210.18.157.2', '2017-12-18 16:29:44'),
(0, 'BUDB17005', '210.18.157.2', '2017-12-18 16:29:44'),
(0, 'BUDB17005', '210.18.157.2', '2017-12-18 16:28:24'),
(0, 'BUDB17005', '210.18.157.2', '2017-12-18 16:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `username_or_email_on_hold`
--

CREATE TABLE IF NOT EXISTS `username_or_email_on_hold` (
  `ai` int(10) unsigned NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) unsigned NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(57410469, 'BUDB17003', 'jaya062@gmail.com', 1, '0', '$2y$10$13ffa2af59a46075fd5a5uJQa6StMebJ/QXel6Mqzdv3KaFmT6vYG', NULL, NULL, NULL, NULL, '2017-12-18 10:55:27', '2017-12-18 10:55:27'),
(89711126, 'BUDB17002', 'jaya061@gmail.com', 1, '0', '$2y$10$df4bb4459ffe1abb18e7autpyM1ijnkztWz4BjtrxeFeZujUFcgkO', NULL, NULL, NULL, NULL, '2017-12-18 10:55:26', '2017-12-18 10:55:26'),
(120809394, 'superadmin', 'superadmin@example.com', 9, '0', '$2y$11$VG3Rpod76a8eh7zsz3VuQuWYiNKnp13rvoIx49g8ofxYg.ob.Ls/m', NULL, NULL, NULL, '2017-12-18 10:02:26', '2017-10-31 12:47:43', '2017-12-18 10:02:26'),
(779332544, 'BUDA17002', 'jaya057@gmail.com', 1, '0', '$2y$10$344f46c54df5735fe10b7OuiJ7zXN6Hsp6mEyDqa1IQRpvN6zeWQW', NULL, NULL, NULL, NULL, '2017-12-18 10:55:24', '2017-12-18 10:55:24'),
(1005173121, 'BUDA17003', 'jaya058@gmail.com', 1, '0', '$2y$10$f1ac15b782836dba1f4eaekvUl2SxYCcTvZ2XJweqmwN2tfmfT4jO', NULL, NULL, NULL, NULL, '2017-12-18 10:55:25', '2017-12-18 10:55:25'),
(1153198671, 'BUDB17004', 'jaya063@gmail.com', 1, '0', '$2y$10$c0791b6b4d402567ddb7buSj4UFRK6A8e9SEsmITTWiinmSGWrAQy', NULL, NULL, NULL, NULL, '2017-12-18 10:55:27', '2017-12-18 10:55:27'),
(1598569673, 'BUDB17001', 'jaya060@gmail.com', 1, '0', '$2y$10$5ef86963493f7cace0323eDGp5b81m1wLbzRgKCHr2te06xkIMDTC', NULL, NULL, NULL, NULL, '2017-12-18 10:55:26', '2017-12-18 10:55:26'),
(2150753429, 'BUDA17001', 'jaya056@gmail.com', 1, '1', '$2y$10$fd4a9b165dbd700e42f48utyj/fvVt8OtHqCgUxe9yJQU0IIiOoaO', NULL, NULL, NULL, NULL, '2017-12-18 10:55:24', '2017-12-18 10:55:24'),
(2411497054, 'seegan', 'testwipost@gmail.com', 4, '0', '$2y$10$45b8ed7bdb6edf960da72ugYZThPjDpfZw2YuNY3Y/jv4RTEGulnK', NULL, NULL, NULL, NULL, '2017-12-18 10:45:38', '2017-12-18 10:45:38'),
(3524336305, 'BUDA17004', 'jaya059@gmail.com', 1, '0', '$2y$10$39335f91b8fa875377cfburmllu1e2qvMs6yfMdGIfqGlyp3S9DZq', NULL, NULL, NULL, NULL, '2017-12-18 10:55:25', '2017-12-18 10:55:25'),
(3725195695, 'BUDB17005', 'jaya064@gmail.com', 1, '0', '$2y$10$3b2e3dfcdfcd91c3a48f4uPieNvf2VY5q8YVNDG5lGVVrEEmHwwn2', NULL, NULL, NULL, '2017-12-18 18:09:54', '2017-12-18 10:55:28', '2017-12-18 12:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `xtra_batch`
--

CREATE TABLE IF NOT EXISTS `xtra_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) NOT NULL,
  `batch_name` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_batch`
--

INSERT INTO `xtra_batch` (`id`, `branch_id`, `batch_name`, `created_at`, `modified_at`, `active`) VALUES
(1, 1, 'Abacus Lvl1', '2017-12-18 10:47:26', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_batch_subject`
--

CREATE TABLE IF NOT EXISTS `xtra_batch_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_batch_subject`
--

INSERT INTO `xtra_batch_subject` (`id`, `batch_id`, `branch_id`, `subject_id`, `created_at`) VALUES
(1, 1, 1, 2, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch`
--

CREATE TABLE IF NOT EXISTS `xtra_branch` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `exam_limit` int(11) NOT NULL,
  `student_limit` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `baned` int(2) NOT NULL DEFAULT '0',
  `active` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_branch`
--

INSERT INTO `xtra_branch` (`id`, `name`, `address`, `country`, `state`, `city`, `zip`, `phone`, `contact_person`, `mobile`, `exam_limit`, `student_limit`, `created_at`, `modified_at`, `baned`, `active`) VALUES
(1, 'RAJASHREES LEARNING ACADEMY', 'kattuvilai, karungal', 'India', 'Tamilnadu', 'Chennai', '629157', '9952380502', 'seegan p', '9952380502', 0, 0, '2017-12-18 10:46:52', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_subject`
--

CREATE TABLE IF NOT EXISTS `xtra_branch_subject` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `branch_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_branch_subject`
--

INSERT INTO `xtra_branch_subject` (`id`, `branch_id`, `subject_id`, `created_at`, `active`) VALUES
(1, 1, 2, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_user`
--

CREATE TABLE IF NOT EXISTS `xtra_branch_user` (
  `branch_id` int(10) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_branch_user`
--

INSERT INTO `xtra_branch_user` (`branch_id`, `user_id`, `is_admin`, `active`) VALUES
(1, 2411497054, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate`
--

CREATE TABLE IF NOT EXISTS `xtra_candidate` (
  `user_id` bigint(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `enrollment_no` varchar(250) NOT NULL,
  `ref_pass` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `address` text NOT NULL,
  `enquiry_from` text NOT NULL,
  `hear_from` text NOT NULL,
  `guardian_name` varchar(250) NOT NULL,
  `guardian_mobile` varchar(250) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `send_mail` int(1) NOT NULL,
  `registration_date` date NOT NULL,
  `birth_date` date NOT NULL,
  `instiute` varchar(255) NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `referred_by` bigint(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `user_id_3` (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_candidate`
--

INSERT INTO `xtra_candidate` (`user_id`, `name`, `enrollment_no`, `ref_pass`, `mobile`, `phone`, `address`, `enquiry_from`, `hear_from`, `guardian_name`, `guardian_mobile`, `gender`, `send_mail`, `registration_date`, `birth_date`, `instiute`, `modified_at`, `referred_by`, `active`) VALUES
(57410469, 'AYESHA MUSHTAQDAFEDAE', 'BUDB17003', '25102007', '4351200077', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(89711126, 'ANUSHKA A,IT PANDIT', 'BUDB17002', '14032008', '4351200076', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(779332544, 'S. AKILAN', 'BUDA17002', '25102010', '4351200072', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1005173121, 'S. CHARU CHARITH', 'BUDA17003', '647062010', '4351200073', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1153198671, 'M. DHARCINI', 'BUDB17004', '20032007', '4351200078', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1598569673, 'RUTURAJ DINESH DHAMANE', 'BUDB17001', '15092007', '4351200075', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(2150753429, 'M. BHAVANI', 'BUDA17001', '54542010', '4351200071', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(3524336305, 'S. JEYDHEV', 'BUDA17004', '17012010', '4351200074', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(3725195695, 'S. PAVITHRAN', 'BUDB17005', '18072009', '4351200079', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_attended_data`
--

CREATE TABLE IF NOT EXISTS `xtra_candidate_attended_data` (
  `attend_schedule_id` bigint(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `schedule_id` bigint(20) NOT NULL,
  `schedule_hash` varchar(255) NOT NULL,
  `taken_from` datetime NOT NULL,
  `taken_to` datetime NOT NULL,
  `answer_data` longtext NOT NULL,
  `schedule_status` varchar(250) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_candidate_attended_data`
--

INSERT INTO `xtra_candidate_attended_data` (`attend_schedule_id`, `user_id`, `schedule_id`, `schedule_hash`, `taken_from`, `taken_to`, `answer_data`, `schedule_status`, `active`) VALUES
(1, 3725195695, 1, 'XTRA173998630686', '2017-12-18 18:28:44', '2017-12-18 18:29:08', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA171663972141', '2017-12-18 18:28:58', '2017-12-18 18:29:51', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA171400084906', '2017-12-18 18:29:42', '2017-12-18 18:29:58', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA172698645148', '2017-12-18 18:29:49', '2017-12-18 18:30:05', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA172237539628', '2017-12-18 18:30:02', '2017-12-18 18:30:16', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA173511895810', '2017-12-18 18:30:07', '2017-12-18 18:30:26', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA171266269628', '2017-12-18 18:30:19', '2017-12-18 18:30:47', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA173548227248', '2017-12-18 18:30:38', '2017-12-18 18:31:03', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA17243667017', '2017-12-18 18:30:58', '2017-12-18 18:31:13', '[]', 'open', 1),
(1, 3725195695, 1, 'XTRA174033238537', '2017-12-18 18:31:04', '2017-12-18 18:32:42', '[]', 'open', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_attended_schedule`
--

CREATE TABLE IF NOT EXISTS `xtra_candidate_attended_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `schedule_id` bigint(11) NOT NULL,
  `schedule_hash` varchar(255) NOT NULL,
  `time_taken` time NOT NULL,
  `positive_marks` decimal(10,2) NOT NULL,
  `negative_marks` decimal(10,2) NOT NULL,
  `total_marks` decimal(10,2) NOT NULL,
  `schedule_status` varchar(250) NOT NULL DEFAULT 'open',
  `answer_data` longtext NOT NULL,
  `last_update` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_candidate_attended_schedule`
--

INSERT INTO `xtra_candidate_attended_schedule` (`id`, `user_id`, `schedule_id`, `schedule_hash`, `time_taken`, `positive_marks`, `negative_marks`, `total_marks`, `schedule_status`, `answer_data`, `last_update`, `active`) VALUES
(1, 3725195695, 1, 'XTRA174033238537', '00:00:00', '0.00', '2.00', '-2.00', 'submit', '[{"attend_status":"reviewnext","active_status":"0","candidate_answer":0,"question_id":2},{"attend_status":"answered","active_status":"1","candidate_answer":"14","question_id":4}]', '2017-12-18 18:32:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_branch_batch`
--

CREATE TABLE IF NOT EXISTS `xtra_candidate_branch_batch` (
  `candidate_id` bigint(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `batch_id` int(10) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_candidate_branch_batch`
--

INSERT INTO `xtra_candidate_branch_batch` (`candidate_id`, `branch_id`, `batch_id`, `active`) VALUES
(2150753429, 1, 1, 1),
(779332544, 1, 1, 1),
(1005173121, 1, 1, 1),
(3524336305, 1, 1, 1),
(1598569673, 1, 1, 1),
(89711126, 1, 1, 1),
(57410469, 1, 1, 1),
(1153198671, 1, 1, 1),
(3725195695, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_category`
--

CREATE TABLE IF NOT EXISTS `xtra_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam`
--

CREATE TABLE IF NOT EXISTS `xtra_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_name` text NOT NULL,
  `exam_duration` int(10) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `total_marks` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_exam`
--

INSERT INTO `xtra_exam` (`id`, `exam_name`, `exam_duration`, `total_questions`, `total_marks`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 'Exam abacus lvl1', 300, 2, '2.00', '<p>check</p>', '2017-12-18 11:15:50', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_questions`
--

CREATE TABLE IF NOT EXISTS `xtra_exam_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `questions` longtext NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_exam_questions`
--

INSERT INTO `xtra_exam_questions` (`id`, `exam_id`, `questions`, `active`) VALUES
(1, 1, '{"4":{"question_id":"4","right_mark":"1","wrong_mark":"2","question_time":"3"},"2":{"question_id":"2","right_mark":"1","wrong_mark":"1","question_time":"10"}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule`
--

CREATE TABLE IF NOT EXISTS `xtra_exam_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) NOT NULL,
  `schedule_name` text NOT NULL,
  `description` text NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `result_date` datetime NOT NULL,
  `offered_as` varchar(5) NOT NULL,
  `offer_cost` decimal(10,2) NOT NULL,
  `result_as` varchar(7) NOT NULL,
  `schedule_to` int(1) NOT NULL,
  `result_on` varchar(255) NOT NULL DEFAULT 'date',
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xtra_exam_schedule`
--

INSERT INTO `xtra_exam_schedule` (`id`, `exam_id`, `schedule_name`, `description`, `start_date`, `end_date`, `result_date`, `offered_as`, `offer_cost`, `result_as`, `schedule_to`, `result_on`, `created_at`, `modified_at`, `active`) VALUES
(1, 1, 'Abacus Level 1 exam', '<p>test</p>', '2017-12-17 07:00:00', '2017-12-19 18:00:00', '2017-12-20 04:30:00', 'paid', '100.00', 'auto', 2, 'date', '2017-12-18 11:20:33', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule_batchs`
--

CREATE TABLE IF NOT EXISTS `xtra_exam_schedule_batchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xtra_exam_schedule_batchs`
--

INSERT INTO `xtra_exam_schedule_batchs` (`id`, `schedule_id`, `batch_id`, `active`) VALUES
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule_candidates`
--

CREATE TABLE IF NOT EXISTS `xtra_exam_schedule_candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(10) NOT NULL,
  `candidates` longtext NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xtra_exam_schedule_candidates`
--

INSERT INTO `xtra_exam_schedule_candidates` (`id`, `schedule_id`, `candidates`, `active`) VALUES
(2, 1, '{"3725195695":{"candidate_id":"3725195695"},"1153198671":{"candidate_id":"1153198671"},"57410469":{"candidate_id":"57410469"},"89711126":{"candidate_id":"89711126"},"1598569673":{"candidate_id":"1598569673"},"2150753429":{"candidate_id":"2150753429"},"779332544":{"candidate_id":"779332544"},"1005173121":{"candidate_id":"1005173121"},"3524336305":{"candidate_id":"3524336305"}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_import_files`
--

CREATE TABLE IF NOT EXISTS `xtra_import_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `import_type` varchar(255) NOT NULL,
  `file_name` text NOT NULL,
  `import_data` longtext NOT NULL,
  `estimated_count` int(10) NOT NULL DEFAULT '0',
  `current_status` varchar(250) NOT NULL DEFAULT 'open',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `xtra_import_files`
--

INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(1, 120809394, 'question', 'sample_(2)2.xlsx', 'a:6:{i:1;a:1028:{i:0;s:9:"Subject 1";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:11:"question_id";i:3;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:1027:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:3;a:1027:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:4;a:1027:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:5;a:1027:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:6;a:1027:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}}', 6, 'analyze', '2017-12-18 10:37:43', 1);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(2, 120809394, 'question', 'sample_(2)3.xlsx', 'a:6:{i:1;a:1028:{i:0;s:6:"ABACUS";i:1;s:11:"Abacus Lvl1";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:11:"question_id";i:4;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:1027:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:3;a:1027:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:4;a:1027:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:5;a:1027:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}i:6;a:1027:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:26:"Invalid Question and Type!";}}', 6, 'analyze', '2017-12-18 10:42:04', 1);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(3, 120809394, 'candidate', 'Book11-dd16.xlsx', 'a:10:{i:1;a:27:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:2;a:27:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:3;a:27:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:4;a:27:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:5;a:27:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:6;a:27:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:7;a:27:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:8;a:27:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:9;a:27:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:10;a:27:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}}', 10, 'analyze', '2017-12-18 10:52:32', 0),
(4, 120809394, 'candidate', 'Book11-dd17.xlsx', 'a:10:{i:1;a:30:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:2150753429;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:2;a:30:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:779332544;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:3;a:30:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:1005173121;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:4;a:30:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:3524336305;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:5;a:30:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:1598569673;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:6;a:30:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:89711126;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:7;a:30:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:57410469;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:8;a:30:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:1153198671;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:9;a:30:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";i:3725195695;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:10;a:29:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:11:"Abacus Lvl1";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:130:"<p><span class="redfield">Password</span> must contain:\r\n				<ol>\r\n					<li>At least 8 characters</li>\r\n				</ol>\r\n			</span></p>\n";}}', 10, 'analyze', '2017-12-18 10:53:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_question`
--

CREATE TABLE IF NOT EXISTS `xtra_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `question_type` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `topic` int(11) NOT NULL,
  `language` varchar(3) NOT NULL,
  `year` int(11) NOT NULL,
  `difficulty_level` int(11) NOT NULL,
  `right_mark` float NOT NULL,
  `negative_mark` float NOT NULL,
  `question_time` int(11) NOT NULL,
  `choice` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `xtra_question`
--

INSERT INTO `xtra_question` (`id`, `question`, `question_type`, `subject`, `topic`, `language`, `year`, `difficulty_level`, `right_mark`, `negative_mark`, `question_time`, `choice`, `created_at`, `active`) VALUES
(1, '<p>Sample Question 1 Tamil</p>', 1, 1, 1, 'en', 2017, 1, 1, 1, 10, 4, '2017-12-18 10:18:00', 1),
(2, '<p>question ?</p>', 1, 2, 2, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-18 10:35:57', 1),
(3, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 0, 0, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-18 10:37:59', 1),
(4, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 2, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-18 10:42:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_question_type`
--

CREATE TABLE IF NOT EXISTS `xtra_question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type` varchar(250) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xtra_question_type`
--

INSERT INTO `xtra_question_type` (`id`, `question_type`, `active`) VALUES
(1, 'Single Choice', 1),
(2, 'Multi Choice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_single_answer`
--

CREATE TABLE IF NOT EXISTS `xtra_single_answer` (
  `question_id` int(10) NOT NULL,
  `option_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_single_answer`
--

INSERT INTO `xtra_single_answer` (`question_id`, `option_id`) VALUES
(1, 3),
(2, 7),
(3, 12),
(4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_single_options`
--

CREATE TABLE IF NOT EXISTS `xtra_single_options` (
  `option_id` int(10) NOT NULL AUTO_INCREMENT,
  `question_id` int(10) NOT NULL,
  `option_key` varchar(2) NOT NULL,
  `option_val` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `xtra_single_options`
--

INSERT INTO `xtra_single_options` (`option_id`, `question_id`, `option_key`, `option_val`, `active`) VALUES
(1, 1, 'A', '<p>Ans A</p>', 1),
(2, 1, 'B', '<p>Ans B</p>', 1),
(3, 1, 'C', '<p>Ans C</p>', 1),
(4, 1, 'D', '<p>Ans D</p>', 1),
(5, 2, 'A', '<p>option 1</p>', 1),
(6, 2, 'B', '<p>option 2</p>', 1),
(7, 2, 'C', '<p>option 3</p>', 1),
(8, 2, 'D', '<p>option 4</p>', 1),
(9, 3, 'A', '120 metres', 1),
(10, 3, 'B', '180 metres', 1),
(11, 3, 'C', '324 metres', 1),
(12, 3, 'D', '150 metres', 1),
(13, 4, 'A', '120 metres', 1),
(14, 4, 'B', '180 metres', 1),
(15, 4, 'C', '324 metres', 1),
(16, 4, 'D', '150 metres', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject`
--

CREATE TABLE IF NOT EXISTS `xtra_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xtra_subject`
--

INSERT INTO `xtra_subject` (`id`, `subject`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 'Tamil', '', '2017-12-18 10:13:48', '0000-00-00 00:00:00', 1),
(2, 'ABACUS', '', '2017-12-18 10:33:54', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject_question_type`
--

CREATE TABLE IF NOT EXISTS `xtra_subject_question_type` (
  `subject_id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_subject_question_type`
--

INSERT INTO `xtra_subject_question_type` (`subject_id`, `type_id`, `active`) VALUES
(1, 1, 1),
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject_topic`
--

CREATE TABLE IF NOT EXISTS `xtra_subject_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_id` int(10) NOT NULL,
  `topic` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `xtra_subject_topic`
--

INSERT INTO `xtra_subject_topic` (`id`, `subject_id`, `topic`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 1, 'Lession 1', '', '2017-12-18 10:14:48', '0000-00-00 00:00:00', 1),
(2, 2, 'Abacus Lvl1', '', '2017-12-18 10:34:21', '0000-00-00 00:00:00', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
