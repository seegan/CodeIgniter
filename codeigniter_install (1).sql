-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2017 at 02:11 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter_install`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `ai` int(10) UNSIGNED NOT NULL,
  `action_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
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

CREATE TABLE `acl_actions` (
  `action_id` int(10) UNSIGNED NOT NULL,
  `action_code` varchar(100) NOT NULL COMMENT 'No periods allowed!',
  `action_desc` varchar(100) NOT NULL COMMENT 'Human readable description',
  `category_id` int(10) UNSIGNED NOT NULL
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

CREATE TABLE `acl_categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
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

CREATE TABLE `auth_sessions` (
  `id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(60) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_sessions`
--

INSERT INTO `auth_sessions` (`id`, `user_id`, `login_time`, `modified_at`, `ip_address`, `user_agent`) VALUES
('mtaqglqak57g1lnmfccssrv3q01meo48', 1173926690, '2017-11-10 12:16:04', '2017-11-10 11:16:04', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('aa1lmp3blsc8dcpqcb21vs0aa6aptrm6', 1173926690, '2017-11-10 12:11:23', '2017-11-10 11:11:23', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('ehdlfbof4v3ffqibft2vac4tl42hmror', 1478819960, '2017-11-10 12:10:21', '2017-11-10 11:10:21', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('00s665djt9gl02uvuo02p3tmtkq90sfq', 1173926690, '2017-11-10 12:09:45', '2017-11-10 11:09:45', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('29jt0qnei1kgmv0g8cstmk1hehprq62n', 1173926690, '2017-11-10 12:07:17', '2017-11-10 11:07:17', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('2dhngnil2fjrg7n28g7pomp7i7d3lktn', 1478819960, '2017-11-10 12:10:10', '2017-11-10 11:10:10', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('lvqinb3j0ldjrk9jc5c4t1itga5242tu', 120809394, '2017-11-10 09:33:55', '2017-11-10 12:05:21', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('v12sv6hjm6strp4r53b22p4nsf1vgr2b', 1173926690, '2017-11-10 12:06:32', '2017-11-10 11:06:32', '::1', 'Chrome 62.0.3202.89 on Windows 7');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `denied_access`
--

CREATE TABLE `denied_access` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL,
  `reason_code` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ips_on_hold`
--

CREATE TABLE `ips_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_errors`
--

CREATE TABLE `login_errors` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_errors`
--

INSERT INTO `login_errors` (`ai`, `username_or_email`, `ip_address`, `time`) VALUES
(0, 'admin', '::1', '2017-11-10 12:09:13'),
(0, 'admin', '::1', '2017-11-10 12:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `username_or_email_on_hold`
--

CREATE TABLE `username_or_email_on_hold` (
  `ai` int(10) UNSIGNED NOT NULL,
  `username_or_email` varchar(255) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `auth_level` tinyint(3) UNSIGNED NOT NULL,
  `banned` enum('0','1') NOT NULL DEFAULT '0',
  `passwd` varchar(60) NOT NULL,
  `passwd_recovery_code` varchar(60) DEFAULT NULL,
  `passwd_recovery_date` datetime DEFAULT NULL,
  `passwd_modified_at` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `auth_level`, `banned`, `passwd`, `passwd_recovery_code`, `passwd_recovery_date`, `passwd_modified_at`, `last_login`, `created_at`, `modified_at`) VALUES
(120809394, 'superadmin', 'superadmin@example.com', 9, '0', '$2y$11$VG3Rpod76a8eh7zsz3VuQuWYiNKnp13rvoIx49g8ofxYg.ob.Ls/m', NULL, NULL, NULL, '2017-11-10 12:09:35', '2017-10-31 12:47:43', '2017-11-10 11:09:35'),
(1478819960, 'student', 'student@example.com', 1, '0', '$2y$11$kWcAOfwgWrKr7tbSwyMeHuniS3UsbZ2ZAa.BuUwKUk/YIg0aNMljO', NULL, NULL, NULL, '2017-11-10 12:10:21', '2017-10-31 14:53:33', '2017-11-10 11:10:21'),
(2147484848, 'admin', 'admin@example.com', 6, '0', '$2y$11$LxQ4xfQCXqTB82lN7GJRXuBkVUaa5Hw8LYCZEVm64DnkfT76DfEde', NULL, NULL, NULL, '2017-11-10 12:09:23', '2017-10-31 14:53:11', '2017-11-10 11:09:23'),
(1173926690, 'branchadmin', 'cfdsfsd@dfsd.com', 4, '0', '$2y$11$PJDH2xfKTL3t/MDTD1qv8uft0mkaOaRk23dslAY5E6y0aZqPCQ/fm', NULL, NULL, NULL, '2017-11-10 12:16:04', '2017-11-10 12:04:02', '2017-11-10 11:16:04'),
(1085985878, 'branchadmin2', 'cfdsfsd21@dfsd.com', 4, '0', '$2y$11$OMxOvXMir66YErqeAdsloOPf0/MTUOl8r83.Sg4rnN/Oir.mUnoA2', NULL, NULL, NULL, NULL, '2017-11-10 12:06:02', '2017-11-10 11:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch`
--

CREATE TABLE `xtra_branch` (
  `id` bigint(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `baned` int(2) NOT NULL DEFAULT '0',
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_user`
--

CREATE TABLE `xtra_branch_user` (
  `branch_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `baned` int(2) NOT NULL DEFAULT '0',
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xtra_branch`
--
ALTER TABLE `xtra_branch`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xtra_branch`
--
ALTER TABLE `xtra_branch`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
