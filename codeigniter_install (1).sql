-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2017 at 02:07 PM
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
('v12sv6hjm6strp4r53b22p4nsf1vgr2b', 1173926690, '2017-11-10 12:06:32', '2017-11-10 11:06:32', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('219vavkga5ig6o7rt8n7ktuiuf8d5pfk', 120809394, '2017-11-12 11:05:44', '2017-11-12 10:33:47', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('5n0227j737mbns3p3nrhq8c2m92h98tp', 120809394, '2017-11-12 14:27:00', '2017-11-12 19:19:31', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('cvd0ubsoqp4bevrtaicoi761fnsdipqc', 120809394, '2017-11-13 03:09:39', '2017-11-13 02:09:40', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('k5duob85jta8e7tevcldl48gi3klhaia', 120809394, '2017-11-13 07:19:17', '2017-11-13 06:19:17', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('0953av7gmc16r0c5lbv3g8m7v2jo1r1f', 120809394, '2017-11-13 14:39:40', '2017-11-13 16:59:18', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('t3k50a882r4t876ceivrv4otejndpod0', 120809394, '2017-11-14 04:01:02', '2017-11-14 09:55:45', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('437k023v6sbcq0n98k24sl27c0a393ql', 120809394, '2017-11-14 12:59:27', '2017-11-14 13:41:52', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('700ld47coeed6317bkagqgfh6mjcd2m2', 120809394, '2017-11-14 17:23:35', '2017-11-14 17:54:45', '::1', 'Chrome 62.0.3202.89 on Windows 7'),
('hm5f4adcbrau1uv1fjj58ftej1bohjbd', 120809394, '2017-11-15 04:44:46', '2017-11-15 08:55:20', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('neq249jomtsstlgfumn138oujjm1m3bi', 120809394, '2017-11-15 11:58:21', '2017-11-15 14:45:05', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('alov0cgdp4a9i9h1kcomutr9ldktp3dd', 120809394, '2017-11-15 18:51:50', '2017-11-15 20:25:48', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('e1clbdbsgkfp7pb3qt5l9o1pfjvei76b', 120809394, '2017-11-16 04:39:51', '2017-11-16 04:04:30', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('bjnu3hnm4jn7ol4lleb01k8jk5v5ppvv', 120809394, '2017-11-16 07:37:11', '2017-11-16 09:32:52', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('5pqiclg31n99n3m6us2q4lo67097squ6', 120809394, '2017-11-16 15:12:50', '2017-11-16 14:36:04', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('dcfl4scvid9qu942lnvd11q6b5ivn7ml', 120809394, '2017-11-16 18:07:22', '2017-11-16 19:01:28', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('ntn4cd6bdao9m84i2oqlc7eks11uccfv', 120809394, '2017-11-17 03:44:06', '2017-11-17 06:23:52', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('67bj437ud7ti1ccmjt768ga2h3cdss1f', 120809394, '2017-11-20 06:08:27', '2017-11-20 13:03:30', '::1', 'Chrome 62.0.3202.89 on Windows 7');

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
(0, 'superadmin', '::1', '2017-11-16 18:07:14'),
(0, 'superadmin', '::1', '2017-11-16 18:07:13');

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
(120809394, 'superadmin', 'superadmin@example.com', 9, '0', '$2y$11$VG3Rpod76a8eh7zsz3VuQuWYiNKnp13rvoIx49g8ofxYg.ob.Ls/m', NULL, NULL, NULL, '2017-11-20 06:08:27', '2017-10-31 12:47:43', '2017-11-20 05:08:27'),
(1478819960, 'student', 'student@example.com', 1, '0', '$2y$11$kWcAOfwgWrKr7tbSwyMeHuniS3UsbZ2ZAa.BuUwKUk/YIg0aNMljO', NULL, NULL, NULL, '2017-11-10 12:10:21', '2017-10-31 14:53:33', '2017-11-10 11:10:21'),
(2147484848, 'admin', 'admin@example.com', 6, '0', '$2y$11$LxQ4xfQCXqTB82lN7GJRXuBkVUaa5Hw8LYCZEVm64DnkfT76DfEde', NULL, NULL, NULL, '2017-11-10 12:09:23', '2017-10-31 14:53:11', '2017-11-10 11:09:23'),
(1173926690, 'branchadmin', 'cfdsfsd@dfsd.com', 4, '0', '$2y$11$PJDH2xfKTL3t/MDTD1qv8uft0mkaOaRk23dslAY5E6y0aZqPCQ/fm', NULL, NULL, NULL, '2017-11-10 12:16:04', '2017-11-10 12:04:02', '2017-11-10 11:16:04'),
(1085985878, 'branchadmin2', 'cfdsfsd21@dfsd.com', 4, '0', '$2y$11$OMxOvXMir66YErqeAdsloOPf0/MTUOl8r83.Sg4rnN/Oir.mUnoA2', NULL, NULL, NULL, NULL, '2017-11-10 12:06:02', '2017-11-10 11:06:02'),
(1833978067, 'branchadmin3', 'branchadmin3@gmail.com', 4, '0', '$2y$11$H3Gd6.U0yEnmBHS/sd5j3.08hQ5lkj6ZEu7VnEeusp6aGKeqgKLx6', NULL, NULL, NULL, NULL, '2017-11-12 15:41:45', '2017-11-12 14:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `xtra_batch`
--

CREATE TABLE `xtra_batch` (
  `id` int(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `batch_name` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_batch`
--

INSERT INTO `xtra_batch` (`id`, `branch_id`, `batch_name`, `created_at`, `modified_at`, `active`) VALUES
(1, 3, 'Abacus Batch', '2017-11-20 10:42:52', '0000-00-00 00:00:00', 1),
(2, 3, 'Abacus Batch', '2017-11-20 10:44:07', '0000-00-00 00:00:00', 1),
(3, 3, 'Abacus Batch2', '2017-11-20 10:45:39', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_batch_subject`
--

CREATE TABLE `xtra_batch_subject` (
  `id` int(11) NOT NULL,
  `batch_id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_batch_subject`
--

INSERT INTO `xtra_batch_subject` (`id`, `batch_id`, `branch_id`, `subject_id`, `created_at`) VALUES
(1, 1, 3, 4, '0000-00-00 00:00:00'),
(2, 2, 3, 4, '0000-00-00 00:00:00'),
(3, 3, 3, 4, '0000-00-00 00:00:00');

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
  `exam_limit` int(11) NOT NULL,
  `student_limit` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `baned` int(2) NOT NULL DEFAULT '0',
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_branch`
--

INSERT INTO `xtra_branch` (`id`, `name`, `address`, `country`, `state`, `city`, `zip`, `phone`, `contact_person`, `mobile`, `exam_limit`, `student_limit`, `created_at`, `modified_at`, `baned`, `active`) VALUES
(1, 'Branch1', 'dfsdf', 'India', 'Tamilnadu', 'Madurai', '565645', '4365464564', 'ddsgfsdfsd', '34457657657567', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 1),
(2, 'Branch2', 'dfssdfds', 'India', 'Assam', 'Guwahati', '600001', '9952380502', 'seegan', '9952380502', 0, 0, '2017-11-12 19:30:10', '0000-00-00 00:00:00', 0, 1),
(3, 'Branch3', 'ffg', 'India', 'Gujarat', 'Surat', '5654654', '546456456', 'gddfg', '767567657', 0, 0, '2017-11-20 07:59:41', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_subject`
--

CREATE TABLE `xtra_branch_subject` (
  `id` int(10) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_branch_subject`
--

INSERT INTO `xtra_branch_subject` (`id`, `branch_id`, `subject_id`, `created_at`, `active`) VALUES
(1, 3, 4, '0000-00-00 00:00:00', 1),
(2, 3, 5, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_user`
--

CREATE TABLE `xtra_branch_user` (
  `branch_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_branch_user`
--

INSERT INTO `xtra_branch_user` (`branch_id`, `user_id`, `is_admin`, `active`) VALUES
(2, 1833978067, 1, 1),
(3, 1173926690, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_category`
--

CREATE TABLE `xtra_category` (
  `id` int(11) NOT NULL,
  `category` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_category`
--

INSERT INTO `xtra_category` (`id`, `category`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 'database', 'ssss', '2017-11-14 07:58:25', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_question_type`
--

CREATE TABLE `xtra_question_type` (
  `id` int(11) NOT NULL,
  `question_type` varchar(250) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_question_type`
--

INSERT INTO `xtra_question_type` (`id`, `question_type`, `active`) VALUES
(1, 'Single Choice', 1),
(2, 'Multiple Choice', 1),
(3, 'Fill In The Blanks', 1),
(4, 'True Or False', 1),
(5, 'Match The Following', 1),
(6, 'Matrix Match', 1),
(7, 'Descriptive Question', 0);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject`
--

CREATE TABLE `xtra_subject` (
  `id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_subject`
--

INSERT INTO `xtra_subject` (`id`, `subject`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 'test', '', '2017-11-13 17:22:14', '0000-00-00 00:00:00', 1),
(4, 'Abacus', '', '2017-11-14 14:41:52', '0000-00-00 00:00:00', 1),
(5, 'Tamil', '', '2017-11-16 09:09:17', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject_question_type`
--

CREATE TABLE `xtra_subject_question_type` (
  `subject_id` int(10) NOT NULL,
  `type_id` int(10) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_subject_question_type`
--

INSERT INTO `xtra_subject_question_type` (`subject_id`, `type_id`, `active`) VALUES
(4, 1, 1),
(4, 3, 1),
(4, 6, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(5, 4, 1),
(5, 5, 1),
(5, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_subject_topic`
--

CREATE TABLE `xtra_subject_topic` (
  `id` int(11) NOT NULL,
  `subject_id` int(10) NOT NULL,
  `topic` text NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `modified_at` datetime NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_subject_topic`
--

INSERT INTO `xtra_subject_topic` (`id`, `subject_id`, `topic`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 1, 'Test Topic', '', '2017-11-14 05:40:13', '0000-00-00 00:00:00', 1),
(2, 4, 'Level 1', '', '2017-11-15 08:44:29', '0000-00-00 00:00:00', 1),
(3, 4, 'Level 2', '', '2017-11-15 08:44:37', '0000-00-00 00:00:00', 1),
(4, 4, 'Level 3', '', '2017-11-15 08:44:44', '0000-00-00 00:00:00', 1),
(5, 5, 'Tamil Topic 1', '', '2017-11-16 09:09:32', '0000-00-00 00:00:00', 1),
(6, 5, 'Tamil Topic 2', '', '2017-11-16 09:09:39', '0000-00-00 00:00:00', 1),
(7, 5, 'Tamil Topic 3', '', '2017-11-16 09:09:45', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `xtra_batch`
--
ALTER TABLE `xtra_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_batch_subject`
--
ALTER TABLE `xtra_batch_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_branch`
--
ALTER TABLE `xtra_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_branch_subject`
--
ALTER TABLE `xtra_branch_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_category`
--
ALTER TABLE `xtra_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_question_type`
--
ALTER TABLE `xtra_question_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_subject`
--
ALTER TABLE `xtra_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_subject_topic`
--
ALTER TABLE `xtra_subject_topic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `xtra_batch`
--
ALTER TABLE `xtra_batch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xtra_batch_subject`
--
ALTER TABLE `xtra_batch_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xtra_branch`
--
ALTER TABLE `xtra_branch`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xtra_branch_subject`
--
ALTER TABLE `xtra_branch_subject`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xtra_category`
--
ALTER TABLE `xtra_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `xtra_question_type`
--
ALTER TABLE `xtra_question_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `xtra_subject`
--
ALTER TABLE `xtra_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xtra_subject_topic`
--
ALTER TABLE `xtra_subject_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
