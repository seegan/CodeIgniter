-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2017 at 03:15 PM
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
('0tvvnrfed1sv4bukloa1c9jkki4qfca6', 120809394, '2017-12-13 05:58:53', '2017-12-13 13:32:56', '::1', 'Chrome 63.0.3239.84 on Windows 7'),
('ft7b8vqdeqpf9k0hjucancnlhmumbrtr', 120809394, '2017-12-12 05:26:37', '2017-12-12 13:04:43', '::1', 'Chrome 62.0.3202.94 on Windows 7'),
('epqggdhi04ergvvsj0bjr15q0h40a443', 120809394, '2017-12-14 06:10:20', '2017-12-14 14:14:42', '::1', 'Chrome 63.0.3239.84 on Windows 7'),
('u337lkjrsmo6tbb2riko7n8fv48og365', 1393196124, '2017-12-12 13:16:17', '2017-12-12 08:00:40', '::1', 'Chrome 62.0.3202.94 on Windows 7');

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
(0, 'superadmin', '::1', '2017-12-11 06:04:59'),
(0, 'superadmin', '::1', '2017-12-11 06:04:59'),
(0, 'superadmin', '::1', '2017-12-11 06:04:50'),
(0, 'superadmin', '::1', '2017-12-11 06:04:50'),
(0, 'superadmin', '::1', '2017-12-11 06:05:08'),
(0, 'superadmin', '::1', '2017-12-11 06:05:08');

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
(1292387, '544', 'bala@y.com', 1, '0', '$2y$11$6fPxK28y6nKrx/zIEjL4/uAjsBHpyKiped3ypPybvP.Tr61bX4x1G', NULL, NULL, NULL, NULL, '2017-12-01 12:42:52', '2017-12-01 11:42:52'),
(9493673, '253', '1as5sajf@gmm.com', 1, '0', '$2y$11$aDrYsbeRuLXkgT8Xy0.j3OFXC5n26WGHQtCyC3mdEfpHcABReREB.', NULL, NULL, NULL, NULL, '2017-12-01 12:19:29', '2017-12-01 11:19:29'),
(14997873, '206', 'sdgh@asnmas.com', 1, '0', '$2y$11$a3foVMR0CKz6r0kuD7R6a.G8F52VwhhXnql3ZUQCIvBIlVTc5adsm', NULL, NULL, NULL, NULL, '2017-12-01 10:50:25', '2017-12-01 09:50:25'),
(26390240, '563', 'eis@y.com', 1, '0', '$2y$11$MOsTAnwkV7pcfaasvTBnGeG3tX6X4dcVyXn8Ugg50ZbixgLJ6eRni', NULL, NULL, NULL, NULL, '2017-12-01 13:05:51', '2017-12-01 12:05:51'),
(51536103, '580', 'parasu@y.com', 1, '0', '$2y$11$slv4Xvfddz8BOWjb83Wm9OGtul855CD2f.5jHSkMTJNKb8LClsWny', NULL, NULL, NULL, NULL, '2017-12-01 13:32:14', '2017-12-01 12:32:14'),
(51737999, '251', '145148sajf@gmm.com', 1, '0', '$2y$11$pwdg.l1nvwykRYl7yCHoUu5yxYYBNTWEtNQYphOxxqIV6b4i9Kn6G', NULL, NULL, NULL, NULL, '2017-12-01 12:17:28', '2017-12-01 11:17:28'),
(59815409, '516', 'bar@y.com', 1, '0', '$2y$11$XSBfzKsQsuN/XHReqW8tHOfALynT93HZ95I4PznGmrA1Psh4PQMrC', NULL, NULL, NULL, NULL, '2017-12-01 11:05:00', '2017-12-01 10:05:00'),
(63532582, '531', 'nivi@y.com', 1, '0', '$2y$11$vH6G5bYhQPHHCy3d.62jX.yfRLnUxiW1xF8QgrQIvexngxrl/vETm', NULL, NULL, NULL, NULL, '2017-12-01 11:32:37', '2017-12-01 10:32:37'),
(87397351, '242', 'asasdesgdjf@gmm.com', 1, '0', '$2y$11$AX3uvuHBXSYyo2HdTnpR4O7eJmEPw4qdnktL4nD/VjZ9BMaby6VhG', NULL, NULL, NULL, NULL, '2017-12-01 12:11:23', '2017-12-11 09:10:35'),
(89392213, '231', 'm28545as7871@ss.com', 1, '0', '$2y$11$16MyijfcakEMwycjWcq3hOO/3ypg0cSjSLYX5HIGPc4EY6v3dWiAO', NULL, NULL, NULL, NULL, '2017-12-01 11:34:34', '2017-12-01 10:34:34'),
(95176353, '217', '57dgh1215@ss.com', 1, '0', '$2y$11$TUOohq3Txtv29bsOg/AGNeTfYEeUKxp5UpvR6sHCB/l8MUP60sRti', NULL, NULL, NULL, NULL, '2017-12-01 11:02:37', '2017-12-01 10:02:37'),
(102107471, '215', '47dgh1215@ss.com', 1, '0', '$2y$11$6BblekMW28BBEgplVP33AehRrkQolH4nDrM4Bcg8wnDpyJxRpgACC', NULL, NULL, NULL, NULL, '2017-12-01 11:00:41', '2017-12-01 10:00:41'),
(107188336, '515', 'bavi@y.com', 1, '0', '$2y$11$RjPJgLNQq.0g1wTg6NpKzuTVMQtPaOeApdEJQ/.6QJe5a109oCv.y', NULL, NULL, NULL, NULL, '2017-12-01 10:49:19', '2017-12-01 09:49:19'),
(110436087, '568', 'balu@y.com', 1, '0', '$2y$11$M9RMtIBMUP..VA3KocZb1eFkGJz0ZCALbyl8rLEU6ExrczvaeXVa.', NULL, NULL, NULL, NULL, '2017-12-01 13:21:25', '2017-12-01 12:21:25'),
(120809394, 'superadmin', 'superadmin@example.com', 9, '0', '$2y$11$VG3Rpod76a8eh7zsz3VuQuWYiNKnp13rvoIx49g8ofxYg.ob.Ls/m', NULL, NULL, NULL, '2017-12-14 06:10:20', '2017-10-31 12:47:43', '2017-12-14 05:10:20'),
(125056675, '227', 'm12k5as7871@ss.com', 1, '0', '$2y$11$7Rt.SyUnuZOnFI9Mzlw1TOzj8JeApRLUzzSMKSU5Udnkl14jVZUFa', NULL, NULL, NULL, NULL, '2017-12-01 11:26:12', '2017-12-01 10:26:12'),
(125915352, '207', 'sdgh12@asnmas.com', 1, '0', '$2y$11$zRoglnMAo6evsZaIgSLCm.YJwGW8yRI6jnqgF0rAOkLUgq6DH9LX2', NULL, NULL, NULL, NULL, '2017-12-01 10:51:04', '2017-12-01 09:51:04'),
(141233326, 'admin2', 'jyg@hgj.com', 4, '0', '$2y$11$CSTMfrJje6c6vjH5178T.Oym.WgTCFrackJaulwJvkBDSasD0y0IK', NULL, NULL, NULL, NULL, '2017-12-01 08:04:06', '2017-12-01 07:04:06'),
(163184172, '541', 'diya@y.com', 1, '0', '$2y$11$GEfBSoLCFJ7Dk8KqwZ1tnu.dYECXe1wj222VZ20ZCcC52aoFdXbzO', NULL, NULL, NULL, NULL, '2017-12-01 12:39:52', '2017-12-01 11:39:52'),
(178900630, '514', 'banu@y.com', 1, '0', '$2y$11$kimLQ.gK7Sz4TXRNgJDcqubQ3.SlOqMeoh2ojsqUkR63BiH7K8xOa', NULL, NULL, NULL, NULL, '2017-12-01 10:48:34', '2017-12-01 09:48:34'),
(206025908, '270', 'as1aas12sf@gm.com', 1, '0', '$2y$11$NfpIEeCHkb9qMDInandFK.qQJK0QwHjzOWvG9jwLjyoWG2S.qt4uW', NULL, NULL, NULL, NULL, '2017-12-01 12:40:05', '2017-12-01 11:40:05'),
(208008353, '111', 'asdsdg@gmail.com', 1, '0', '$2y$11$ADKycc4RSA8kw0T8RZkL7eIS6KI8RxDgwy.sV8kO8HXtEjgCBs2Ei', NULL, NULL, NULL, NULL, '2017-12-01 10:37:34', '2017-12-01 09:37:34'),
(209763291, '551', 'sange@y.com', 1, '0', '$2y$11$MfZkvWVV1sry1KtxKqOFVO0/HCxzc6o4StD/YS1yvgKdGfcj.rWj2', NULL, NULL, NULL, NULL, '2017-12-01 12:51:53', '2017-12-01 11:51:53'),
(217215999, '501', 'ashwin@y.com', 1, '0', '$2y$11$w4Un1ttKtpNSJWEu1Uq8COyIYCLLSU1Vzi.k99JD59yu/379Us7sC', NULL, NULL, NULL, NULL, '2017-12-01 08:58:24', '2017-12-01 07:58:24'),
(233154638, '509', 'athithii@y.com', 1, '0', '$2y$11$Wcgwr9T5Y296uYx7Q6ctzehmKHr0XaAcy0eHxFzedm/36GZ9.36.e', NULL, NULL, NULL, NULL, '2017-12-01 10:41:48', '2017-12-01 09:41:48'),
(268079875, '573', 'uthra@y.com', 1, '0', '$2y$11$KTbHRgQy0/Qg/GJCNIPhm.bdxdSxgIDftPSd.CmfumI0EI6wsS3s2', NULL, NULL, NULL, NULL, '2017-12-01 13:25:33', '2017-12-01 12:25:33'),
(272350801, '222', '55as7151@ss.com', 1, '0', '$2y$11$2deJwIHiAx/0zwOt2lXrQulLsM5EnVuzPTFR5UKLFlyPKWniYE22y', NULL, NULL, NULL, NULL, '2017-12-01 11:17:06', '2017-12-01 10:17:06'),
(286729273, '289', 'asas2as12sf@gm.com', 1, '0', '$2y$11$dRg1v5u6Zm/JtowoVaBFpOaV9CDVsqqtG6l3uXbT65fjMRgt/HGJO', NULL, NULL, NULL, NULL, '2017-12-01 13:10:13', '2017-12-01 12:10:13'),
(287358727, '574', 'gani@y.com', 1, '0', '$2y$11$wHFDhHJ/aTvuKpRUc.RZ.u1yaS7Pcj.z/Gfs/Lgb1lVNGkrqPkwLW', NULL, NULL, NULL, NULL, '2017-12-01 13:27:17', '2017-12-01 12:27:17'),
(294124307, '503', 'ara@y.com', 1, '0', '$2y$11$3h0Z56CAAuAP7MemRnQ1cuWitc4CJsKts.MrWA0.UUVO/HK8St8VG', NULL, NULL, NULL, NULL, '2017-12-01 09:02:34', '2017-12-01 08:02:34'),
(324890201, '261', '1aasas12sf@gm.com', 1, '0', '$2y$11$3hJEGl7aY6xpCMC74NgLoecfGsRFzbB5/i/0lmCSMzo/5KZ/vkZmq', NULL, NULL, NULL, NULL, '2017-12-01 12:35:23', '2017-12-01 11:35:23'),
(328762956, '297', 'qwasas2as1f@gm.com', 1, '0', '$2y$11$FnZqwJh2BEOB7CyngYJszOZKxJpewmf53jdlcCu1fAHuwSesSf5j.', NULL, NULL, NULL, NULL, '2017-12-01 13:14:24', '2017-12-01 12:14:24'),
(338352673, '249', '5148sasa15jf@gmm.com', 1, '0', '$2y$11$rStwbqUU0R3hypKZ39KexePJFTVJKHyV.eqvUCuFHe4sn9f0gT2zK', NULL, NULL, NULL, NULL, '2017-12-01 12:16:05', '2017-12-01 11:16:05'),
(343121370, '537', 'oviya@y.com', 1, '0', '$2y$11$P233rO8LZC.Uu3sgl9i90upowO5L3/7JWyCagx54Z8y4Cqt82x5vu', NULL, NULL, NULL, NULL, '2017-12-01 11:59:10', '2017-12-01 10:59:10'),
(350699334, '113', 'assadsfdfg@gmail.com', 1, '0', '$2y$11$7n9OwYf/.Hu9hPLsnkF.COl6lReWUpo6XDZgUxf0D91RMRaOJRbMW', NULL, NULL, NULL, NULL, '2017-12-01 10:39:14', '2017-12-01 09:39:14'),
(369601912, '246', '58sasad12jf@gmm.com', 1, '0', '$2y$11$zIzRPZ4o2T6mji2yRHmDX.cW6TlBwKrBvYHM.u4LUAYqlbsX6ZeRq', NULL, NULL, NULL, NULL, '2017-12-01 12:14:00', '2017-12-01 11:14:00'),
(377282306, 'BUDB17004', 'jaya063@gmail.com', 1, '0', '$2y$11$vglDGE9w0zrYyQdzzX/Ig.sZYTqOSak.QEj11fsemzEwVnYO2ex06', NULL, NULL, NULL, NULL, '2017-12-14 07:12:04', '2017-12-14 06:12:04'),
(377858530, '101', 'aa@y.com', 1, '0', '$2y$11$BOghpw1aszxTOZM06B7t9.9060HbIxrqE7BynWnfhGDS.PPyabPAi', NULL, NULL, NULL, NULL, '2017-12-01 08:53:49', '2017-12-01 07:53:49'),
(393322520, '107', 'agsgkh@mnnn.com', 1, '0', '$2y$11$aPprpuk/tYojz8tYd7br9ek9Mb45Bq637VeuTkQZf.CwMfZ7N8pR6', NULL, NULL, NULL, NULL, '2017-12-01 09:00:20', '2017-12-01 08:00:20'),
(403755287, '561', 'vasu@y.com', 1, '0', '$2y$11$QUij09TjATu6Y.WJbhTF7u48V9Jkk8UPV6bNHXPxqR7OB8qgVCp7C', NULL, NULL, NULL, NULL, '2017-12-01 13:03:35', '2017-12-01 12:03:35'),
(405906856, '226', 'mk5as7871@ss.com', 1, '0', '$2y$11$.ZyraETIgFYDrJr1rWblHO/BgxPRnfsPp6hYdV4KxA2CbyLrud9SC', NULL, NULL, NULL, NULL, '2017-12-01 11:24:53', '2017-12-01 10:24:53'),
(416323513, '539', 'priyaaaa@y.com', 1, '0', '$2y$11$gQqnyT5ZOpjngqHWrvn.geUt4ff7VAp0qWNvQnzhp9UchMOrciy/2', NULL, NULL, NULL, NULL, '2017-12-01 12:36:29', '2017-12-01 11:36:29'),
(427703838, '565', 'getha@y.com', 1, '0', '$2y$11$QZjv4fi6fbzo/Z1OHiOCNuyemta.xtjqdgyEC01x6tkdlOSA/frn2', NULL, NULL, NULL, NULL, '2017-12-01 13:19:22', '2017-12-01 12:19:22'),
(430103405, '545', 'janu@y.com', 1, '0', '$2y$11$oZMdLFUXfF0CP1yeBaogU.9CYdiE5Dr6aJP00InRXcIG0lZX1tifC', NULL, NULL, NULL, NULL, '2017-12-01 12:45:49', '2017-12-01 11:45:49'),
(434890234, '280', 'as2as12sf@gm.com', 1, '0', '$2y$11$3gj7PGJXzquTYLIqwtvA5O8u.CXQKL42XO0.vlp9n2P9bh01zMQva', NULL, NULL, NULL, NULL, '2017-12-01 13:06:22', '2017-12-01 12:06:22'),
(450346194, '578', 'ashu@y.com', 1, '0', '$2y$11$nTlfNKxO5n.4UsGOcxGho.ClNEKkhaExJBxjH2abW1hoBM9ACe3Ue', NULL, NULL, NULL, NULL, '2017-12-01 13:30:26', '2017-12-01 12:30:26'),
(452705309, '232', 'm28545asas@ss.com', 1, '0', '$2y$11$9rBqSiWrb/R9TBRNNV/hXOxJXRFzzx1mxpmzrPvc5qQmugYNNw006', NULL, NULL, NULL, NULL, '2017-12-01 11:35:18', '2017-12-01 10:35:18'),
(467373823, '271', 'a1aas12sf@gm.com', 1, '0', '$2y$11$5Tm0.7yTaLTh7MYS8rilR.mWckWko3o6MkHHqAKrQmzO560XzIbIK', NULL, NULL, NULL, NULL, '2017-12-01 12:41:04', '2017-12-01 11:41:04'),
(471881946, '513', 'ankul@y.com', 1, '0', '$2y$11$WseMTzM.j3yUIEU/W5o9uO4Q9vN8EoEEaoTNMme3nt0D1JMdOutWq', NULL, NULL, NULL, NULL, '2017-12-01 10:47:22', '2017-12-01 09:47:22'),
(473555243, '104', 'ardghghghh@gnmaop.com', 1, '0', '$2y$11$Oye2wC0/GXxhMIAEi0xwB.12fRAF0E5b8nbxEjKTThJYKy.7oZDaK', NULL, NULL, NULL, NULL, '2017-12-01 08:58:46', '2017-12-01 07:58:46'),
(482245825, '218', '5as7dgh1215@ss.com', 1, '0', '$2y$11$.j4Z9Ob3LNF.zoxR1DUNiu44QZ9wIx1rfpO6igZGwviUIdPyo/y62', NULL, NULL, NULL, NULL, '2017-12-01 11:03:15', '2017-12-01 10:03:15'),
(513227656, '230', 'm28k545as7871@ss.com', 1, '0', '$2y$11$8NwK28TKZvjuOP9RJKQtt.1Rxyxu/c3883IjfdbKG3ZCXIzJvKng.', NULL, NULL, NULL, NULL, '2017-12-01 11:33:44', '2017-12-01 10:33:44'),
(527752542, '524', 'raji@y.com', 1, '0', '$2y$11$W/z.rquy4MWWNrEzrEC21OHTkvzR4QmE/j.xtyCh7LWGzyXRWwRYO', NULL, NULL, NULL, NULL, '2017-12-01 11:11:54', '2017-12-01 10:11:54'),
(533808006, '530', 'kar@y.com', 1, '0', '$2y$11$GhELI3ZvNntsGok/IRQLJer8XlNjhDDzqIbt46OxxDFJTDGcuI2le', NULL, NULL, NULL, NULL, '2017-12-01 11:31:42', '2017-12-01 10:31:42'),
(534003596, '252', '145sajf@gmm.com', 1, '0', '$2y$11$XjN.TnkjeMmkTI5X.LxDEO1nfVwTzbAoyHHM7iQFbTZAw3biP5yYy', NULL, NULL, NULL, NULL, '2017-12-01 12:18:39', '2017-12-01 11:18:39'),
(574353793, 'BUDA17004', 'jaya059@gmail.com', 1, '0', '$2y$11$ilezYkBnu/WG6Yxy/czKE.i0GM3xLVUDYbCsQ2AxlnuL.CcD0x3XS', NULL, NULL, NULL, NULL, '2017-12-14 07:12:02', '2017-12-14 06:12:02'),
(574946095, '583', 'vishu@g.com', 1, '0', '$2y$11$iNJ031iKNqhTyDd03iANVek3CY5sWy3ETZVSesSYVhD9iaBYHL7w6', NULL, NULL, NULL, NULL, '2017-12-01 13:37:06', '2017-12-01 12:37:06'),
(579493916, '527', 'poja@y.com', 1, '0', '$2y$11$aSNiYkZ0YoddvLnT.LjT3OLaYyHihYZ4KLWTyvs8egVoDWwvZ1mWe', NULL, NULL, NULL, NULL, '2017-12-01 11:26:34', '2017-12-01 10:26:34'),
(584725788, '552', 'kavi@y.com', 1, '0', '$2y$11$TUgy/3Nw7yrnMl69itSdkudpjd8orvISOZEYd2iJ9DPAKc1ogryFq', NULL, NULL, NULL, NULL, '2017-12-01 12:52:42', '2017-12-01 11:52:42'),
(586065926, '212', 'sdgh1215@ss7mas.com', 1, '0', '$2y$11$MjmWO2ydi72Q9yQf844PleCeA3cI9U7FOAWBOftNhddqf7YJc3yK6', NULL, NULL, NULL, NULL, '2017-12-01 10:57:52', '2017-12-01 09:57:52'),
(603150543, '258', '1as12sf@gmm.com', 1, '0', '$2y$11$G/4VQhNBvVP8AUWnAh7EiOMQMpnUTCmaYxKvOLJFEMPsMnF4QfEcS', NULL, NULL, NULL, NULL, '2017-12-01 12:33:24', '2017-12-01 11:33:24'),
(607211026, '538', 'priya@y.com', 1, '0', '$2y$11$jh7PPoGreBSXWxveCXI6U.kxiM0Cs29IHuDxSUiIyEYjgrG39dF3a', NULL, NULL, NULL, NULL, '2017-12-01 12:11:03', '2017-12-01 11:11:03'),
(620959666, '567', 'vion@y.com', 1, '0', '$2y$11$ksfdUErKe/A91C4yDpp8aecYrx8sNQzfkN8/9zR7U3MCj2Sk.5lcS', NULL, NULL, NULL, NULL, '2017-12-01 13:20:51', '2017-12-01 12:20:51'),
(650934232, '505', 'akshey@y.com', 1, '0', '$2y$11$7rorbDgCXaJWTiwPL4TuI.rmhRrMBNUs4Rq43B7qXuGon.bERUH3m', NULL, NULL, NULL, NULL, '2017-12-01 10:34:51', '2017-12-01 09:34:51'),
(659878011, '528', 'viki@y.com', 1, '0', '$2y$11$sY/1Wu0xso91XLAaVq8PbeAB7kmwJ3qS4qszp2SVHvINdzq91PNXa', NULL, NULL, NULL, NULL, '2017-12-01 11:28:11', '2017-12-01 10:28:11'),
(669479428, '558', 'oori@y.com', 1, '0', '$2y$11$OuLwHwQI2Srrj64nqFj2G.e08N2S8/uWIQgNSrEVU7dLwZj57J6v2', NULL, NULL, NULL, NULL, '2017-12-01 12:59:06', '2017-12-01 11:59:06'),
(714696100, 'BUDB17005', 'jaya064@gmail.com', 1, '0', '$2y$11$av3C6gQHrcC.9wwfsGHusedQT5ROuB5tkMB2L/6/3zCAMxqJfuKS6', NULL, NULL, NULL, NULL, '2017-12-14 07:12:05', '2017-12-14 06:12:05'),
(718409545, '236', '1a8ddfg@vcbvb.com', 1, '0', '$2y$11$dGpR/mAvd9ZSMoUMJvFWNuExltRnXjwY00dcq/9gziSEoCE8GKiyK', NULL, NULL, NULL, NULL, '2017-12-01 11:40:55', '2017-12-01 10:40:55'),
(744054822, '536', 'pukal@y.com', 1, '0', '$2y$11$K1n8VDrojU5YjsldQ./cbevUurNjCp4l7Pv03rwU/NJY5SMOY5B1i', NULL, NULL, NULL, NULL, '2017-12-01 11:57:56', '2017-12-01 10:57:56'),
(749448746, '566', 'vikram@y.com', 1, '0', '$2y$11$q4zCrdOURnHYlBZ.OYCW..MZjgUjRDYIUKOyRSgi78eaAaAdehOUW', NULL, NULL, NULL, NULL, '2017-12-01 13:20:12', '2017-12-01 12:20:12'),
(760114545, '214', 's47dgh1215@ss.com', 1, '0', '$2y$11$O4ngt8EIOM38G7Vp0xrpV.6ynhGBMEiaaVyOFTwWy1USeOMNrWv2.', NULL, NULL, NULL, NULL, '2017-12-01 10:59:52', '2017-12-01 09:59:52'),
(783574469, '209', 'sdgh1215@aassnmas.com', 1, '0', '$2y$11$wVk0haVySYl60ZzubeYymeYHiu2roUwHHn/gikQpC9afiIPw2VbLK', NULL, NULL, NULL, NULL, '2017-12-01 10:52:23', '2017-12-01 09:52:23'),
(820644380, '117', 'dfdfgjhkj478@gmail.com', 1, '0', '$2y$11$BK.chmB1zNE0TTk0Vwhz5.eqntMY7epUexa8Oho1iPHREq7JZ0YMi', NULL, NULL, NULL, NULL, '2017-12-01 10:41:10', '2017-12-01 09:41:10'),
(838306127, '510', 'num@y.com', 1, '0', '$2y$11$ZfHmpJau8kgmZPZSOIUhYO8DZ/DDxYCTwuirpnSTtNEkFTAezisPy', NULL, NULL, NULL, NULL, '2017-12-01 10:43:58', '2017-12-01 09:43:58'),
(849853204, '245', '58sad12jf@gmm.com', 1, '0', '$2y$11$93Vjn2hpvS/NvhT5e9Llguc6a./XC0N5eGen8R7qZBCoY8psFwf7u', NULL, NULL, NULL, NULL, '2017-12-01 12:13:25', '2017-12-01 11:13:25'),
(849954188, '296', 'asasas2as1f@gm.com', 1, '0', '$2y$11$mdg4ZvZoTSio4ZF6XedlGOKcCH6UPGraXMog9zf08uOx.CDF6V41i', NULL, NULL, NULL, NULL, '2017-12-01 13:13:00', '2017-12-01 12:13:00'),
(852778907, '233', 'asddfg@vcbvb.com', 1, '0', '$2y$11$kvZiWbNdZ.kvOMxzURDk.uKQl3IUzm9H4OoWSXgr.IHJ2HOHqdenW', NULL, NULL, NULL, NULL, '2017-12-01 11:37:31', '2017-12-01 10:37:31'),
(893573212, '576', 'nithra@y.com', 1, '0', '$2y$11$DUpWreVjsXtKHOZrPD0GT.EyjEEGRE/3COo0fsg3Ra0hfbLAUX/HO', NULL, NULL, NULL, NULL, '2017-12-01 13:28:56', '2017-12-01 12:28:56'),
(924018651, '223', '55as71@ss.com', 1, '0', '$2y$11$fmNJSFTV46.Gi7sfrYfpxOzlAOLQcyABhgt3BKhjpWrzzEjconNju', NULL, NULL, NULL, NULL, '2017-12-01 11:18:11', '2017-12-01 10:18:11'),
(931721219, '569', 'teja@y.com', 1, '0', '$2y$11$agpB2.SGtPdLl0gc9rUYLeqN2Liv443kU.QEIW9zFGB1Z.HHsuOtm', NULL, NULL, NULL, NULL, '2017-12-01 13:22:07', '2017-12-01 12:22:07'),
(952071729, 'BUDA17001', 'jaya056@gmail.com', 1, '0', '$2y$11$a/QPisTBP/4xdzvCegSjCePlIDSBrYVVdQBf6zMEkprxYTC8vsgRK', NULL, NULL, NULL, NULL, '2017-12-14 07:12:01', '2017-12-14 06:13:53'),
(981581045, '213', 'sdgh1215@ss.com', 1, '0', '$2y$11$vzcv1u/Brkc88Fygzi241OrIj4hGslph3Mf8jAHMF26cb1oSVDK5a', NULL, NULL, NULL, NULL, '2017-12-01 10:58:44', '2017-12-01 09:58:44'),
(995482841, '247', '58sasaas2jf@gmm.com', 1, '0', '$2y$11$QHjyJqUYrtpzTeHlpvkpquwjAZ7hgCijCd.sY1lTCc6/XsdPZ64H6', NULL, NULL, NULL, NULL, '2017-12-01 12:14:46', '2017-12-01 11:14:46'),
(1000335706, '229', 'm2k545as7871@ss.com', 1, '0', '$2y$11$53HefA3vnW36aDzaYxe2HuqvGZaNjV8TIp/knyhC8WzP4/Jj89BhC', NULL, NULL, NULL, NULL, '2017-12-01 11:32:17', '2017-12-01 10:32:17'),
(1006027396, '237', 'fgn8ddfg@vcbvb.com', 1, '0', '$2y$11$mtIrPQP/tHerrMMEnYCuduurtPYGmI2WZ95uT2.im.Nh2SP0VFg0u', NULL, NULL, NULL, NULL, '2017-12-01 12:05:02', '2017-12-01 11:05:02'),
(1018193395, '521', 'gari@y.com', 1, '0', '$2y$11$okuVZa4uIdgZLWcCmjELUOUfSMJbzqTxakCT31jy7Lpf0q3.Rvg5G', NULL, NULL, NULL, NULL, '2017-12-01 11:07:10', '2017-12-01 10:07:10'),
(1045729945, 'BUDA17003', 'jaya058@gmail.com', 1, '0', '$2y$11$3O476NwZ1Qm1c0aNxMqJEO1aVpKbu8oqF5YMxfTauVFweAwOrjoD2', NULL, NULL, NULL, NULL, '2017-12-14 07:12:02', '2017-12-14 06:12:02'),
(1063099048, '532', 'malu@y.com', 1, '0', '$2y$11$MvWVgD1YvTKY5O5NTxR2KOeMf9KSYuRom3ytbqz3aSy0OFl83XpDG', NULL, NULL, NULL, NULL, '2017-12-01 11:34:12', '2017-12-01 10:34:12'),
(1079896168, '520', 'hari@y.com', 1, '0', '$2y$11$ZsOg2WrxEPey1kJZEx1PRuWkJ3fZWk4SELuZaaelxB8GguQCgq5OW', NULL, NULL, NULL, NULL, '2017-12-01 11:06:00', '2017-12-01 10:06:00'),
(1089018805, '577', 'jaya@y.com', 1, '0', '$2y$11$E.4MWu6IWUeomiwWyQFJeumqOvyK7h7semvWfuXQFfQ2NgAJmFs4a', NULL, NULL, NULL, NULL, '2017-12-01 13:29:37', '2017-12-01 12:29:37'),
(1094957348, '256', '1as152sajf@gmm.com', 1, '0', '$2y$11$0/q4CsCHB.8UojjKM28jFerITyF6X/5LydZH4NpSYLcFgpC/zB7PK', NULL, NULL, NULL, NULL, '2017-12-01 12:32:27', '2017-12-01 11:32:27'),
(1109222946, '571', 'dulkar@y.com', 1, '0', '$2y$11$TWLRRlvyrZmMTy/.wpitZuqsnbc/uTrX47PDm94EsSpoKhw1xn8Da', NULL, NULL, NULL, NULL, '2017-12-01 13:23:52', '2017-12-01 12:23:52'),
(1132319033, '562', 'quency@y.com', 1, '0', '$2y$11$o3ZRwtXeR5PXc1gy04dVweenpRYQycvwoCb21ROT5VnPipVnUibj.', NULL, NULL, NULL, NULL, '2017-12-01 13:04:35', '2017-12-01 12:04:35'),
(1139830173, '112', 'asdsdggfh@gmail.com', 1, '0', '$2y$11$CAgx1VNA/f6F5piDXA6ov.xvQm9n8VlY1OMGQWbZZJFEXm9to9DiO', NULL, NULL, NULL, NULL, '2017-12-01 10:38:33', '2017-12-01 09:38:33'),
(1145457897, '555', 'saro@y.com', 1, '0', '$2y$11$WMLmFWhDvw9OMapO2Ut8QOywTRcR1sFc6anspCe4jf0MDPBP/q9OC', NULL, NULL, NULL, NULL, '2017-12-01 12:56:19', '2017-12-01 11:56:19'),
(1147813045, '549', 'bush@y.com', 1, '0', '$2y$11$TxB6cxXazcZYiL0HgeSYzuUszCbXCmXcASk9fBvD7P1on2tJMdulm', NULL, NULL, NULL, NULL, '2017-12-01 12:49:54', '2017-12-01 11:49:54'),
(1148973622, '517', 'push@y.com', 1, '0', '$2y$11$psUQxo4BTtGXKRC8w/dWYeLRKA3t586vDoy.EUPp8/opUDEbZm2rq', NULL, NULL, NULL, NULL, '2017-12-01 10:57:48', '2017-12-01 09:57:48'),
(1157703522, '244', '58sadjf@gmm.com', 1, '0', '$2y$11$piu4L5NwAmZQQvGYWNeVUuRpIF8JyVGriwVhXptuPBRHzSqMwaw4m', NULL, NULL, NULL, NULL, '2017-12-01 12:12:43', '2017-12-01 11:12:43'),
(1182401255, '533', 'laksh@y.com', 1, '0', '$2y$11$3v0f7RJozciK74.JPiYP7ucGKql2G4Fn10QsRcUJ4fcpuM7hFqQuW', NULL, NULL, NULL, NULL, '2017-12-01 11:35:12', '2017-12-01 10:35:12'),
(1200951710, '543', 'mahe@y.com', 1, '0', '$2y$11$vmrYyR8bHimKpwnNLc351ueo/hU4l7i.b/bRwx9YqcAy7g5CtVs6u', NULL, NULL, NULL, NULL, '2017-12-01 12:41:54', '2017-12-01 11:41:54'),
(1207641564, '220', '145as715@ss.com', 1, '0', '$2y$11$XUPEE9FkKsgslUgrvSmUnOmLqkwjRFr994E.d9EkxP3EddDrAef3e', NULL, NULL, NULL, NULL, '2017-12-01 11:05:33', '2017-12-01 10:05:33'),
(1209327414, '518', 'sin@y.com', 1, '0', '$2y$11$5JOf5WkrOpu.4bO4lt6/XOQFpkYKXC7K/7pDJZOf0.KGA2X7gMR3W', NULL, NULL, NULL, NULL, '2017-12-01 10:59:24', '2017-12-01 09:59:24'),
(1224305269, '564', 'eivianyy@y.com', 1, '0', '$2y$11$KV59ON7.jcjZy5N/jIIgdefFH8SZLtZ3KMjtWKuH7bRV2aop.OkMa', NULL, NULL, NULL, NULL, '2017-12-01 13:18:27', '2017-12-01 12:18:27'),
(1225317259, '575', 'gkoushi@y.com', 1, '0', '$2y$11$XpsPOZDLgbXvw60NwZ1xmeprA7J/ek5xzy0RM1dhc/CI2PGPozuEO', NULL, NULL, NULL, NULL, '2017-12-01 13:28:06', '2017-12-01 12:28:06'),
(1233173899, '211', 'sdgh1215@ssnmas.com', 1, '0', '$2y$11$hk44Ylp0WP8cwfGcFT.SDeWhjafk1TjVCofk3kzwxYtb70iPYaa96', NULL, NULL, NULL, NULL, '2017-12-01 10:56:53', '2017-12-01 09:56:53'),
(1256493618, '234', '1asddfg@vcbvb.com', 1, '0', '$2y$11$hC0FFd15cpD6KZLFigJ9CeVd1QOCfownS5K0rV4Kdh4W/tbFLqKyW', NULL, NULL, NULL, NULL, '2017-12-01 11:38:09', '2017-12-01 10:38:09'),
(1264095586, '272', 'aas12sf@gm.com', 1, '0', '$2y$11$1ULwChvzXzFZM4I/4X8DNul61ywU5JirLdd9Gze//Udm.altxnF0W', NULL, NULL, NULL, NULL, '2017-12-01 12:41:32', '2017-12-01 11:41:32'),
(1297936987, 'admin3', 'cdsvfdgfdg@sddfvdsg.com', 4, '0', '$2y$11$qhGfoonCBXrn5pog54qk8.JDuxOppxEngv2l4q9A79p47n.cEH0x6', NULL, NULL, NULL, NULL, '2017-12-01 08:04:35', '2017-12-01 07:04:35'),
(1298188473, '201', 'shgsfhuujhg@gmail.com', 1, '0', '$2y$11$1TO1huLwXhbh42ZWzl7yUO/kuyR2RH56rQz8yJ4vkPXemiInsJ5DC', NULL, NULL, NULL, NULL, '2017-12-01 10:44:40', '2017-12-01 09:44:40'),
(1309376766, '224', '575as71@ss.com', 1, '0', '$2y$11$BDm/ok1XwihKXt19Gvcjt./l0iJBfXAzeyf6yq4iq4rvnZ.3Jkvhe', NULL, NULL, NULL, NULL, '2017-12-01 11:18:49', '2017-12-01 10:18:49'),
(1316370818, '553', 'nethu@y.com', 1, '0', '$2y$11$gEr91llqIbe0U/7I0wuY5uNcHQZf/wGyHskLKKIU7OLA3BBJbkWfa', NULL, NULL, NULL, NULL, '2017-12-01 12:53:25', '2017-12-01 11:53:25'),
(1350977998, '550', 'sha@y.com', 1, '0', '$2y$11$JMsM7QnuyHyI6mAGpdjfAOITzhWCv4hoEAPM1GTqPexarN5oLRMJq', NULL, NULL, NULL, NULL, '2017-12-01 12:50:51', '2017-12-01 11:50:51'),
(1352098928, '103', 'sfgghjj@fgjh.com', 1, '0', '$2y$11$RHBuCytX7uJETyJQf5KRZ.yk5tsbC7sF/Ny7poG5/TtS84ruDwN2a', NULL, NULL, NULL, NULL, '2017-12-01 08:57:25', '2017-12-01 07:57:25'),
(1383642353, '525', 'ravi@y.com', 1, '0', '$2y$11$olRlZoEbI.8raj6ID15/S.J1TzJOFlB8lKPRILE9K.jDV0IH9imdC', NULL, NULL, NULL, NULL, '2017-12-01 11:13:10', '2017-12-01 10:13:10'),
(1384828447, '240', 'agsgdjf@gmm.com', 1, '0', '$2y$11$fILWkJWrLPWOjo1.uTv5nuArBgLxE3NHgq4qzUCX1HsbNxfLKtjGa', NULL, NULL, NULL, NULL, '2017-12-01 12:09:51', '2017-12-01 11:09:51'),
(1393196124, 'seegan', 'see.gan21see@gmail.com', 1, '0', '$2y$11$jc1cWdQNl9iSkagu13tODuLteMGdJFR2U9nQolJn7MyZrJq6iYkMu', NULL, NULL, NULL, '2017-12-12 13:16:17', '2017-12-04 13:48:05', '2017-12-12 07:46:17'),
(1402460928, '579', 'giri@y.com', 1, '0', '$2y$11$ZhfnuoidJTEiJJZrjgvK2OGKd6eWjJF/S5jDyTn.bVeMkN2coO0f.', NULL, NULL, NULL, '2017-12-04 13:43:00', '2017-12-01 13:31:08', '2017-12-04 12:43:00'),
(1412604297, '219', '5as715@ss.com', 1, '0', '$2y$11$mably210oA9TpdzWoON7T.nD/00qknFz/C.V3mwg6KoGjrpzTqEB2', NULL, NULL, NULL, NULL, '2017-12-01 11:04:10', '2017-12-01 10:04:10'),
(1434399577, '118', 'asdffhj34@gmail.com', 1, '0', '$2y$11$mXzk9ayPhVwOmj.jvcE8UuaA24/zzGPL5PUr3Ta0RDNrsjHBxytp2', NULL, NULL, NULL, NULL, '2017-12-01 10:42:50', '2017-12-01 09:42:50'),
(1437275726, 'BUDB17001', 'jaya060@gmail.com', 1, '0', '$2y$11$dY2k7afPAcyG4ZwE5sPiz.qYwo07gnahbluxFw14l9QxENXPKkt1y', NULL, NULL, NULL, NULL, '2017-12-14 07:12:03', '2017-12-14 06:12:03'),
(1452064532, '274', '112as12sf@gm.com', 1, '0', '$2y$11$we6BUolV8WPaOwf4SIsBXuCoWr0t0wRHWBI80vZtKyFYRub/iWx/O', NULL, NULL, NULL, NULL, '2017-12-01 12:43:44', '2017-12-01 11:43:44'),
(1475055901, '254', '1as12sajf@gmm.com', 1, '0', '$2y$11$2gLPvYG6JILqTISsOufeDu/ngOTTAGncw0mtm4oBt0jRUmXZY.Bju', NULL, NULL, NULL, NULL, '2017-12-01 12:29:15', '2017-12-01 11:29:15'),
(1482754483, '534', 'kavin@y.com', 1, '0', '$2y$11$eE17/wH6i9OX0gILyWP3WOhznXf/QojUM9BGRceHbcuE7bzDT2tPy', NULL, NULL, NULL, NULL, '2017-12-01 11:36:10', '2017-12-01 10:36:10'),
(1499026119, '546', 'manju@y.com', 1, '0', '$2y$11$DF28/RwhWV333.TSXJIk5eohaWarGQgCaAKHuvKuVYZpjuVHljdby', NULL, NULL, NULL, NULL, '2017-12-01 12:46:51', '2017-12-01 11:46:51'),
(1501157906, '202', 'sdgfghhj@nm.com', 1, '0', '$2y$11$7YikjKF/PbjASkrJN2f8Lu/g9jpyFl.1REOmloxXGJJfD2ZUjMnsq', NULL, NULL, NULL, NULL, '2017-12-01 10:47:10', '2017-12-01 09:47:10'),
(1505376651, '269', '1aas12sf@gm.com', 1, '0', '$2y$11$0oLELy7CsYW7QcyHwHnMPObC2xwfbPkuggg2QNNStVHa1a34AUprK', NULL, NULL, NULL, NULL, '2017-12-01 12:39:07', '2017-12-01 11:39:07'),
(1530427548, '506', 'arju@y.com', 1, '0', '$2y$11$tX0Sa1wt3z5ytIoVKte0ZObh6Sf7DXC5svgL1yJ.NpDru6yeExlqK', NULL, NULL, NULL, NULL, '2017-12-01 10:37:19', '2017-12-01 09:37:19'),
(1541910301, '508', 'ani@y.com', 1, '0', '$2y$11$g5ULPejU7zzd0cvAq4VUI.X55A.stndpnRGM/ff6C1Gd4riBbOdpi', NULL, NULL, NULL, NULL, '2017-12-01 10:40:02', '2017-12-01 09:40:02'),
(1543292834, '109', 'asdsdfgh@gmail.com', 1, '0', '$2y$11$sZsN4Q37uh0.7EetPm3AyuIWkYyWmJLxm3J1ayJmbxXdi0uXbNvFi', NULL, NULL, NULL, NULL, '2017-12-01 10:16:55', '2017-12-01 09:16:55'),
(1558623438, 'BUDA17002', 'jaya057@gmail.com', 1, '0', '$2y$11$4OIBQ93DgNoLgcR9Q11i0.eRVkTVkfWa7e9lS8vh87R2QGk6MrT.m', NULL, NULL, NULL, NULL, '2017-12-14 07:12:01', '2017-12-14 06:12:01'),
(1569536457, '235', '1assddfg@vcbvb.com', 1, '0', '$2y$11$qUhmKcsOxnjzm6W3w6JeLuhCAqY3J0idRqfQKhWf62oUwv2lpZNNO', NULL, NULL, NULL, NULL, '2017-12-01 11:38:54', '2017-12-01 10:38:54'),
(1601953502, '203', 'sdgfghhj@nmas.com', 1, '0', '$2y$11$pb/CwFQZ1G/a9TVLO5NGuujktv7XU3PlzohyHjHH/Fl6WoogVZFSK', NULL, NULL, NULL, NULL, '2017-12-01 10:47:48', '2017-12-01 09:47:48'),
(1627346031, '241', 'asagsgdjf@gmm.com', 1, '0', '$2y$11$NunM6xHZ2X27ggn8reKNGuYqP6StOnPRc0ZUWBpvLw2n9xnYJMDfS', NULL, NULL, NULL, NULL, '2017-12-01 12:10:27', '2017-12-01 11:10:27'),
(1653834729, '115', 'assadsfdfg12233@gmail.com', 1, '0', '$2y$11$023US/sp3a.IqHREL4JTceXKHzlQZmxuBDzhLJBGBuFWKSzW8o06i', NULL, NULL, NULL, NULL, '2017-12-01 10:39:57', '2017-12-01 09:39:57'),
(1661742635, '260', '1aasas12sf@gmm.com', 1, '0', '$2y$11$y/sFN.26H5xXEwq5ao8BA.7WA5U6SYksmfg7Cldqj.6tldutm4eey', NULL, NULL, NULL, NULL, '2017-12-01 12:34:26', '2017-12-01 11:34:26'),
(1665923974, '250', '5148sajf@gmm.com', 1, '0', '$2y$11$8Wxar6sPCr4/Vh.OqrjJ5OAvTIIHZr.1zyZQbMwUbcRvx4CjJfmKG', NULL, NULL, NULL, NULL, '2017-12-01 12:16:40', '2017-12-01 11:16:40'),
(1675521907, 'BUDB17002', 'jaya061@gmail.com', 1, '0', '$2y$11$nwLhbpzHV6pECIwGpwufBe4aDvaomEqFQlWKNxJMojRJjHTiXZ1eS', NULL, NULL, NULL, NULL, '2017-12-14 07:12:03', '2017-12-14 06:12:03'),
(1758499598, '548', 'nakul@y.com', 1, '0', '$2y$11$NlBcJbW7PmX9lTYqTGP1VuIlIAmFq5UfzB3La/1oBO3uf2OZv0mj6', NULL, NULL, NULL, NULL, '2017-12-01 12:48:41', '2017-12-01 11:48:41'),
(1786985706, 'BUDB17003', 'jaya062@gmail.com', 1, '0', '$2y$11$Xb4ociEI0kcXWM6tmrga..5A3i40PzVZPEcNja.ryz37FGZEB6R1S', NULL, NULL, NULL, NULL, '2017-12-14 07:12:04', '2017-12-14 06:12:04'),
(1814386809, '204', 'sdgfgh@nmas.com', 1, '0', '$2y$11$9WbccqEmfw36qPdJtZONw.Fl7oMBEZx6ehcb8REMhtAO20HwIDk0m', NULL, NULL, NULL, NULL, '2017-12-01 10:48:51', '2017-12-01 09:48:51'),
(1827974049, '502', 'anu@y.com', 1, '0', '$2y$11$5ficQRVZwdx9h38w8.Oa/.vQENdpaf2Gp4pcbwJfhrUHZnp2uuccm', NULL, NULL, NULL, NULL, '2017-12-01 09:00:26', '2017-12-01 08:00:26'),
(1832763065, '504', 'akas@y.com', 1, '0', '$2y$11$c/6Kl9oh4ayUyKeTZNppZ.va988k7Cqx6/d6mUlnaV7rxJ.v72qoi', NULL, NULL, NULL, NULL, '2017-12-01 10:33:46', '2017-12-01 09:33:46'),
(1860834328, '248', '58sasa15jf@gmm.com', 1, '0', '$2y$11$/YHnlQ9U5D.jPOC.0S.0Peutct.L6eP9XRAKxZhn/qdIrZNq2ILwm', NULL, NULL, NULL, NULL, '2017-12-01 12:15:25', '2017-12-01 11:15:25'),
(1870931909, '255', '1aswq12sajf@gmm.com', 1, '0', '$2y$11$hYJyllm/.OpFu6j7pLd3leJJToNiHzqSUVFF.1ZFp9eGrHnqvjpz.', NULL, NULL, NULL, NULL, '2017-12-01 12:30:06', '2017-12-01 11:30:06'),
(1876255399, '512', 'anbu@y.com', 1, '0', '$2y$11$IIQAw4KR6GntEykRoUwb/eQAaqp9eeSxWcpYFHMrqYpPlfEwJnrlS', NULL, NULL, NULL, NULL, '2017-12-01 10:46:27', '2017-12-01 09:46:27'),
(1888496530, '200', 'shgsfg@gmail.com', 1, '0', '$2y$11$0UFF6tFDyvh2HSF02K/kguJlmLtVEJ233lPhFshZOr2Ox/LA0f326', NULL, NULL, NULL, NULL, '2017-12-01 10:44:04', '2017-12-01 09:44:04'),
(1897244549, '522', 'jamu@y.com', 1, '0', '$2y$11$SOs9pvl13M.3wThWSYwGUOoKZfD/c1VuLKhkTGVM5pVY.eqsLj6MC', NULL, NULL, NULL, NULL, '2017-12-01 11:07:59', '2017-12-01 10:07:59'),
(1920976199, '238', 'fgn1ddfg@vcbvb.com', 1, '0', '$2y$11$wltLLFJQO/OhxhRJGkhtU.bKEutpyU1Fan/h7Jxy/kJaQhlLE692u', NULL, NULL, NULL, NULL, '2017-12-01 12:05:44', '2017-12-01 11:05:44'),
(1933651679, '581', 'malathi@y.com', 1, '0', '$2y$11$DDS2BycdX9kPdR2YCbk1aezhPPTBnUV8Wt3rstLh6f82b60jpKSIS', NULL, NULL, NULL, NULL, '2017-12-01 13:33:24', '2017-12-01 12:33:24'),
(1939682506, '526', 'ishu@y.com', 1, '0', '$2y$11$1rkfHpQm3ywMMELoV7VLxuyxIOAO41skXPCOWs4DWLwq7q7EXFX76', NULL, NULL, NULL, NULL, '2017-12-01 11:25:22', '2017-12-01 10:25:22'),
(1953057180, '243', '58sasdesgdjf@gmm.com', 1, '0', '$2y$11$zlgT4AKtxuLc/7srd.QOs.3LgHy0GsLVVqj9OfOwh2xJN/7AOX/sC', NULL, NULL, NULL, NULL, '2017-12-01 12:12:10', '2017-12-01 11:12:10'),
(1959784840, '221', '855as715@ss.com', 1, '0', '$2y$11$Oa8Cn60qgikW7yxNz7tGZO1K67xhAIT2z3lLCThtH25.NlBZMZpMO', NULL, NULL, NULL, NULL, '2017-12-01 11:06:24', '2017-12-01 10:06:24'),
(1964630807, '507', 'aru@y.com', 1, '0', '$2y$11$i.uDe0xO7l9eyCmPMxJlj.FzlCgoDCv8LBsmAbMpeT//MoTN0x/qK', NULL, NULL, NULL, NULL, '2017-12-01 10:38:25', '2017-12-01 09:38:25'),
(1972726852, '511', 'archu@y.com', 1, '0', '$2y$11$8bh4kTtiq/4vAoEtIHp/yeeLAHNmp4VLPq3m4084i4KciU5PelWra', NULL, NULL, NULL, NULL, '2017-12-01 10:45:06', '2017-12-01 09:45:06'),
(1983522617, '557', 'puvi@y.com', 1, '0', '$2y$11$4oDDrdITTm/AhFylVwg3UuuFlRnApc00sPafEmN6DHgbESHbPoPum', NULL, NULL, NULL, NULL, '2017-12-01 12:58:25', '2017-12-01 11:58:25'),
(1988429488, '535', 'dur@y.com', 1, '0', '$2y$11$4pSzawoKjZBrsMMwx9eJZuu/azuX.3t2Y6qGaK/9DkNjQplTRxAuS', NULL, NULL, NULL, NULL, '2017-12-01 11:54:32', '2017-12-01 10:54:32'),
(1988654472, '205', 'sdgfgh@asnmas.com', 1, '0', '$2y$11$Q93oaQOvnI5mog0JsfmKb./x0Om1fkUqdUzxwmV0TCB260hXm3LHW', NULL, NULL, NULL, NULL, '2017-12-01 10:49:25', '2017-12-01 09:49:25'),
(1991790907, '547', 'lawan@y.com', 1, '0', '$2y$11$JgUVKTLB9KPHLfu3a17rs.byKCIO8nKRRXyeRHLmIjw5YaIf8at/i', NULL, NULL, NULL, NULL, '2017-12-01 12:47:37', '2017-12-01 11:47:37'),
(1993277189, '300', 'asas2asas@gm.com', 1, '0', '$2y$11$ygYq/hyFRa/itD4tufa26e0.mpCWPY/8bFWdEsYwHqUKUWAvI/sMK', NULL, NULL, NULL, NULL, '2017-12-01 13:17:14', '2017-12-01 12:17:14'),
(1996722426, '570', 'oona@y.com', 1, '0', '$2y$11$5JUTw.gXgojA5oJ3.NbIGuJYybpkytwitGX62B5Zav3rsXYd1VwnW', NULL, NULL, NULL, NULL, '2017-12-01 13:22:55', '2017-12-01 12:22:55'),
(2000663237, '281', '2as12sf@gm.com', 1, '0', '$2y$11$NAG/9gJFMdapCGaYoSvwmuCRiIKJ5ahl0Gqa1fhhO2c6HHUu/2N.K', NULL, NULL, NULL, NULL, '2017-12-01 13:07:18', '2017-12-01 12:07:18'),
(2009035514, '540', 'sona@y.com', 1, '0', '$2y$11$bYE2U30FnjolohHKOVSyc..4DDhMekq7RP/NpD6X7MMuZ7HG1MlS6', NULL, NULL, NULL, NULL, '2017-12-01 12:39:07', '2017-12-01 11:39:07'),
(2011350220, '523', 'pavi@y.com', 1, '0', '$2y$11$znlu8TLfxjXuiFgsSSImle8jazBkFNIhEYqWXZJsL7D8A1Qv2gsvy', NULL, NULL, NULL, NULL, '2017-12-01 11:08:44', '2017-12-01 10:08:44'),
(2047781531, '542', 'umesh@y.com', 1, '0', '$2y$11$QtK73OzDJ6jwslncEBfgi.nnjTjlsPzf6cQzJI1EI73c0.8H8oW3.', NULL, NULL, NULL, NULL, '2017-12-01 12:40:41', '2017-12-01 11:40:41'),
(2051624252, '554', 'sam@y.com', 1, '0', '$2y$11$gBTOyOf8szjlvSQ.xcEmRuVoaX3DHE74kzzjIX4CTdJ1Ibby56/Uu', NULL, NULL, NULL, NULL, '2017-12-01 12:55:04', '2017-12-01 11:55:04'),
(2052306258, '100', 'agskdklf@gmail.com', 1, '0', '$2y$11$DfJVA59ET2cgPFLOn2DB..sA.m5FgSs2R8dq3OfIuzkwA3f/Xw.Z6', NULL, NULL, NULL, NULL, '2017-12-01 08:53:12', '2017-12-01 07:53:12'),
(2093114299, '582', 'jana@g.com', 1, '0', '$2y$11$lznpHaPIcLP3I29bz1ErC.T5nyaHtX9T2MiaSn5YVZdkEUjcZZ97e', NULL, NULL, NULL, NULL, '2017-12-01 13:35:03', '2017-12-01 12:35:03'),
(2094662382, '556', 'taru@y.com', 1, '0', '$2y$11$Mcn0kqR9/S6meYc7xS4Rw..bcy0hRZRifQ9T2VsZKeQwc4jE1GcDK', NULL, NULL, NULL, NULL, '2017-12-01 12:57:17', '2017-12-01 11:57:17'),
(2096642350, '529', 'yuvi@y.com', 1, '0', '$2y$11$.wGwRSiCrDmCc4jJt0prK.JbYSUB5kpERW0IVU5eZs4fTsInLfoG.', NULL, NULL, NULL, NULL, '2017-12-01 11:29:58', '2017-12-01 10:29:58'),
(2097729885, '225', 'mk5as71@ss.com', 1, '0', '$2y$11$PH/AZinYwnIRtp3pXj/DfeDV/NUWnmzdCgWnbmCZTE6CkUBIspzNq', NULL, NULL, NULL, NULL, '2017-12-01 11:21:38', '2017-12-01 10:21:38'),
(2100508305, '519', 'ugan@y.com', 1, '0', '$2y$11$egpKNcO5sOJfVrQeR2hfZeF6.BptPIyEEhAROmBPm8mPvsNk3KDZG', NULL, NULL, NULL, NULL, '2017-12-01 11:03:53', '2017-12-01 10:03:53'),
(2102895354, '291', 'asas2as1f@gm.com', 1, '0', '$2y$11$BCaW7RQ9MkyqgcI326bWGeRWrdOrGrWoM3KjJ0y923nfXNjoEeaN2', NULL, NULL, NULL, NULL, '2017-12-01 13:11:58', '2017-12-01 12:11:58'),
(2104221322, '216', '4257dgh1215@ss.com', 1, '0', '$2y$11$pSmI6yq6sHos7G51eGdSreWlbJEmBYVGbV2oLHg1TkB.FeTrfG6ru', NULL, NULL, NULL, NULL, '2017-12-01 11:02:03', '2017-12-01 10:02:03'),
(2121475871, '208', 'sdgh12@aassnmas.com', 1, '0', '$2y$11$SWxyhCFWJKdLdthFJuE0geAoaSrg2iU3FNRNqNbgVZ5VrbvIHufqu', NULL, NULL, NULL, NULL, '2017-12-01 10:51:46', '2017-12-01 09:51:46'),
(2138925738, '278', '12as2as12sf@gm.com', 1, '0', '$2y$11$Db21WkpY3yxQHW0oW8S83e5povWJQ/uZa9OWHTCwnAQFBkJxJtFT.', NULL, NULL, NULL, NULL, '2017-12-01 12:44:51', '2017-12-01 11:44:51'),
(2147484848, 'admin1', 'agajakk@gmail.com', 4, '0', '$2y$11$1qN/oPH/ZVu.NeTROylNDe53wQLeokfg16DH5cBYNgwIhmG7kQlAS', NULL, NULL, NULL, NULL, '2017-12-01 08:00:28', '2017-12-01 07:00:28');

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
(1, 1, 'morning tamil', '2017-12-01 08:09:24', '0000-00-00 00:00:00', 1),
(2, 1, 'evening tamil', '2017-12-01 08:09:38', '0000-00-00 00:00:00', 1),
(3, 3, 'morn', '2017-12-01 08:12:22', '0000-00-00 00:00:00', 1),
(4, 3, 'eve', '2017-12-01 08:12:47', '0000-00-00 00:00:00', 1),
(5, 3, 'noon', '2017-12-01 08:13:15', '0000-00-00 00:00:00', 1),
(6, 3, 'morn2', '2017-12-01 08:13:39', '0000-00-00 00:00:00', 1),
(7, 3, 'AN', '2017-12-01 08:14:03', '0000-00-00 00:00:00', 1),
(8, 3, 'AN2', '2017-12-01 08:14:29', '0000-00-00 00:00:00', 1),
(9, 1, 'FN', '2017-12-01 08:15:09', '0000-00-00 00:00:00', 1),
(10, 1, 'FN2', '2017-12-01 08:15:28', '0000-00-00 00:00:00', 1),
(11, 1, 'AF', '2017-12-01 08:15:49', '0000-00-00 00:00:00', 1),
(12, 2, 'FN', '2017-12-01 08:16:07', '0000-00-00 00:00:00', 1),
(13, 2, 'FN2', '2017-12-01 08:16:18', '0000-00-00 00:00:00', 1),
(14, 2, 'AF', '2017-12-01 08:16:35', '0000-00-00 00:00:00', 1),
(15, 2, 'AN', '2017-12-01 08:18:55', '0000-00-00 00:00:00', 1);

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
(1, 1, 1, 1, '0000-00-00 00:00:00'),
(2, 2, 1, 1, '0000-00-00 00:00:00'),
(3, 3, 3, 1, '0000-00-00 00:00:00'),
(4, 3, 3, 2, '0000-00-00 00:00:00'),
(5, 4, 3, 3, '0000-00-00 00:00:00'),
(6, 4, 3, 4, '0000-00-00 00:00:00'),
(7, 5, 3, 1, '0000-00-00 00:00:00'),
(8, 5, 3, 5, '0000-00-00 00:00:00'),
(9, 6, 3, 2, '0000-00-00 00:00:00'),
(10, 6, 3, 3, '0000-00-00 00:00:00'),
(11, 6, 3, 4, '0000-00-00 00:00:00'),
(12, 7, 3, 1, '0000-00-00 00:00:00'),
(13, 7, 3, 3, '0000-00-00 00:00:00'),
(14, 8, 3, 2, '0000-00-00 00:00:00'),
(15, 8, 3, 5, '0000-00-00 00:00:00'),
(16, 9, 1, 1, '0000-00-00 00:00:00'),
(17, 10, 1, 5, '0000-00-00 00:00:00'),
(18, 11, 1, 1, '0000-00-00 00:00:00'),
(19, 11, 1, 5, '0000-00-00 00:00:00'),
(20, 12, 2, 2, '0000-00-00 00:00:00'),
(21, 13, 2, 3, '0000-00-00 00:00:00'),
(22, 14, 2, 2, '0000-00-00 00:00:00'),
(23, 14, 2, 3, '0000-00-00 00:00:00'),
(24, 15, 2, 2, '0000-00-00 00:00:00'),
(25, 15, 2, 3, '0000-00-00 00:00:00');

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
(1, 'kodambakkam', 'fhgydshksdjf;', 'India', 'Tamilnadu', 'Chennai', '4661285', '144107147417', ' nhhuj', '214524343.', 0, 0, '2017-12-01 08:03:07', '0000-00-00 00:00:00', 0, 1),
(2, 'guindy', 'dftgedrhytr', 'India', 'Tamilnadu', 'Chennai', '6885588', '451465', 'dghyrftuyt', '52465', 0, 0, '2017-12-01 08:05:15', '0000-00-00 00:00:00', 0, 1),
(3, 'Huricane', 'regrtujtyjyt', 'India', 'Gujarat', 'Vadodara', '241854854', '54898g', 'fgrfdhgtr', '5849854984', 0, 0, '2017-12-01 08:06:16', '0000-00-00 00:00:00', 0, 1);

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
(1, 1, 1, '0000-00-00 00:00:00', 1),
(2, 1, 5, '0000-00-00 00:00:00', 1),
(3, 2, 2, '0000-00-00 00:00:00', 1),
(4, 2, 3, '0000-00-00 00:00:00', 1),
(5, 3, 1, '0000-00-00 00:00:00', 1),
(6, 3, 2, '0000-00-00 00:00:00', 1),
(7, 3, 3, '0000-00-00 00:00:00', 1),
(8, 3, 4, '0000-00-00 00:00:00', 1),
(9, 3, 5, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_branch_user`
--

CREATE TABLE `xtra_branch_user` (
  `branch_id` int(10) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `is_admin` int(1) NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_branch_user`
--

INSERT INTO `xtra_branch_user` (`branch_id`, `user_id`, `is_admin`, `active`) VALUES
(1, 2147483647, 1, 1),
(2, 141233326, 1, 1),
(3, 1297936987, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate`
--

CREATE TABLE `xtra_candidate` (
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
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_candidate`
--

INSERT INTO `xtra_candidate` (`user_id`, `name`, `enrollment_no`, `ref_pass`, `mobile`, `phone`, `address`, `enquiry_from`, `hear_from`, `guardian_name`, `guardian_mobile`, `gender`, `send_mail`, `registration_date`, `birth_date`, `instiute`, `modified_at`, `referred_by`, `active`) VALUES
(1292387, 'bala', '5044', 'imadogkit', '9992682584', '', '', '', '', '', '', 'Male', 0, '2017-05-17', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(9493673, 'sddfhhwq', '1754878574', 'asasfsdg12323242', '892551579788', '', '', '', '', '', '', 'Female', 0, '2017-04-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(14997873, 'agalll', '122559965', 'asasdfsdfgghj456', '1233589884', '', '', '', '', '', '', 'Female', 0, '2017-12-04', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(26390240, 'eiswar', '5063', 'hhhhhhhh', '7987658859', '', '', '', '', '', '', 'Male', 0, '2017-03-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(51536103, 'parasu', '5080', 'paaaaaaa', '7009866745', '', '', '', '', '', '', 'Male', 0, '2017-01-21', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(51737999, 'marsdeasw', '175487712', 'asasfsdg12323242', '8925569788', '', '', '', '', '', '', 'Female', 0, '2017-08-17', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(59815409, 'Barathi', '5016', '12378912', '8695894558', '', '', '', '', '', '', 'Female', 0, '2017-07-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(63532582, 'nivin', '5031', 'mnbvlkjh', '9099900325', '', '', '', '', '', '', 'Male', 0, '2017-05-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(87397351, 'seegan p', '15487778', 'asasfsdg12323242', '9952380502', '6565656', 'btfh esdfsdf fgdfg', 'btfh', 'Google', 'd', 'e', 'Female', 1, '2017-02-27', '1970-01-01', '', '2017-12-11 14:40:35', 0, 1),
(89392213, 'agrttyudd', '122559918', 'asasdfsdfgghj456', '7581223312', '', '', '', '', '', '', 'Male', 0, '2017-07-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(95176353, 'agalsaw779', '122559947', 'asasdfsdfgghj456', '123898841', '', '', '', '', '', '', 'Female', 0, '2017-06-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(102107471, 'agalsaw12', '122559927', 'asasdfsdfgghj456', '123898841278', '', '', '', '', '', '', 'Male', 0, '2017-07-13', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(107188336, 'Bavi', '5015', '26594878', '9995894558', '', '', '', '', '', '', 'Female', 0, '2017-11-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(110436087, 'balu', '5068', 'bbbbbbbb', '8799678759', '', '', '', '', '', '', 'Male', 0, '2017-09-26', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(125056675, 'agalyas', '1225599145', 'asasdfsdfgghj456', '758122334123', '', '', '', '', '', '', 'Female', 0, '2017-12-09', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(125915352, 'agalllas', '12255996512', 'asasdfsdfgghj456', '12389884', '', '', '', '', '', '', 'Female', 0, '2017-12-04', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(163184172, 'diya', '5041', 'olacabin', '7886082584', '', '', '', '', '', '', 'Female', 0, '2017-09-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(178900630, 'banu', '5014', 'asdfghjk', '9995684558', '', '', '', '', '', '', 'Female', 0, '2017-11-14', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(206025908, 'swawaqwr', '1224814123', 'asasfsdg12323242', '8925579874', '', '', '', '', '', '', 'Female', 0, '2017-01-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(208008353, 'aswerrt', '13312', 'gghghgjhjhk45', '48579125463', '', '', '', '', '', '', 'Female', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(209763291, 'sange', '5051', 'lateeeeee', '8556805587', '', '', '', '', '', '', 'Female', 0, '2017-09-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(217215999, 'ashwin', '5001', '000000001', '00000000000', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(233154638, 'Athithi', '5009', '1346791346', '9658474586', '', '', '', '', '', '', 'Female', 0, '2017-11-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(268079875, 'uthra', '5073', 'kkkkkkkkk', '9585015785', '', '', '', '', '', '', 'Female', 0, '2017-01-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(272350801, 'agalsaw7', '12255997817', 'asasdfsdfgghj456', '7581223378', '', '', '', '', '', '', 'Male', 0, '2017-05-03', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(286729273, 'santhiyaqwe', '122487147', 'assggdhdfh', '89255798145', '', '', '', '', '', '', 'Female', 0, '2017-04-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(287358727, 'gani', '5074', 'hhhhhhhh', '7900015785', '', '', '', '', '', '', 'Female', 0, '2017-07-22', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(294124307, 'aravind', '5003', '88888888', '6666666666', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(324890201, 'swawsqw', '112481478', 'asasfsdg12323242', '8925579847', '', '', '', '', '', '', 'Female', 0, '2017-03-15', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(328762956, 'santhiyqw', '12248748', 'asdsdfgghghh', '8925577845', '', '', '', '', '', '', 'Female', 0, '2017-04-25', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(338352673, 'marysswrt', '17548778124', 'asasfsdg12323242', '893925569784', '', '', '', '', '', '', 'Female', 0, '2017-08-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(343121370, 'oviya', '5037', '753869421', '7240002584', '', '', '', '', '', '', 'Male', 0, '2017-12-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(350699334, 'seegan', '15484', 'ffdgggjhj66', '4577651323', '', '', '', '', '', '', 'Male', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(369601912, 'maryaawsw', '154877814', 'asasfsdg12323242', '89392553723', '', '', '', '', '', '', 'Male', 0, '2017-09-09', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(377282306, 'M. DHARCINI', 'BUDB17004', '20032007', '4351200078', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(377858530, 'aa', '5001', '00000001', '0000000000', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(393322520, 'asddg', '124578', 'aghdjkkgkg122', '12457863', '', '', '', '', '', '', 'Female', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(403755287, 'vasu', '5061', 'tttttttt', '8987775859', '', '', '', '', '', '', 'Male', 0, '2017-03-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(405906856, 'agalyaam', '1225599123', 'asasdfsdfgghj456', '75812233478', '', '', '', '', '', '', 'Male', 0, '2017-12-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(416323513, 'priya', '5038', 'rgnthmyj', '9564872584', '', '', '', '', '', '', 'Female', 0, '2017-12-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(427703838, 'getha', '5065', 'eeeeeeee', '8889656459', '', '', '', '', '', '', 'Female', 0, '2017-09-22', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(430103405, 'janu', '5045', 'assoonasposi', '8972682584', '', '', '', '', '', '', 'Female', 0, '2017-05-17', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(434890234, 'santhiya1', '122487817', 'asasfsdg12323242', '8925579871', '', '', '', '', '', '', 'Female', 0, '2017-04-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(450346194, 'ashu', '5078', 'asasasasas', '9700566745', '', '', '', '', '', '', 'Female', 0, '2017-05-21', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(452705309, 'agrttyuddsd', '12255991815', 'asasdfsdfgghj456', '7581222859', '', '', '', '', '', '', 'Female', 0, '2017-06-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(467373823, 'swaaswaqwr', '12248789', 'asasfsdg12323242', '8925579871', '', '', '', '', '', '', 'Male', 0, '2017-02-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(471881946, 'Anukul', '5013', '85274196', '7995684558', '', '', '', '', '', '', 'Male', 0, '2017-11-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(473555243, 'adasrf', '125486', 'sdfhghj345', '12345889', '', '', '', '', '', '', 'Male', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(482245825, 'agalsaw77914', '1225599412', 'asasdfsdfgghj456', '131654684897', '', '', '', '', '', '', 'Male', 0, '2017-06-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(513227656, 'agrttyu', '1225599148', 'asasdfsdfgghj456', '7581223379', '', '', '', '', '', '', 'Female', 0, '2017-07-10', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(527752542, 'raji', '5024', 'edcrfvtg', '8750723015', '', '', '', '', '', '', 'Female', 0, '2017-02-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(533808006, 'karthi', '5030', 'vcxzfdsa', '7099900325', '', '', '', '', '', '', 'Male', 0, '2017-07-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(534003596, 'sddfhh', '1754878596', 'asasfsdg12323242', '8925579788', '', '', '', '', '', '', 'Male', 0, '2017-04-14', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(574353793, 'S. JEYDHEV', 'BUDA17004', '17012010', '4351200074', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(574946095, 'vishu', '5083', 'fgggggggg', '9962747474', '', '', '', '', '', '', 'Male', 0, '2017-12-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(579493916, 'poja', '5027', '147893256', '8985968956', '', '', '', '', '', '', 'Female', 0, '2017-06-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(584725788, 'kavi', '5052', '951847623', '7006805587', '', '', '', '', '', '', 'Female', 0, '2017-09-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(586065926, 'agalsaw78s12', '1225599289', 'asasdfsdfgghj456', '12389884124', '', '', '', '', '', '', 'Female', 0, '2017-09-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(603150543, 'swsewawqw', '112487847', 'asasfsdg12323242', '8925579748', '', '', '', '', '', '', 'Female', 0, '2017-02-14', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(607211026, 'priya', '5038', 'malayalam', '9564872584', '', '', '', '', '', '', 'Female', 0, '2017-12-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(620959666, 'vion', '5067', 'nnnnnnnn', '9799678759', '', '', '', '', '', '', 'Male', 0, '2017-09-25', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(650934232, 'Akashey', '5005', '7845127845', '9875664122', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(659878011, 'viki', '5028', '36987413256', '8985900325', '', '', '', '', '', '', 'Male', 0, '2017-05-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(669479428, 'orvasi', '5058', 'ooooooooo', '9710985869', '', '', '', '', '', '', 'Female', 0, '2017-03-13', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(714696100, 'S. PAVITHRAN', 'BUDB17005', '18072009', '4351200079', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(718409545, 'agalsw', '124578784', 'ASDDSGGGGGG', '89395103312', '', '', '', '', '', '', 'Male', 0, '2017-03-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(744054822, 'pukal', '5036', 'thnrgbef', '7850003004', '', '', '', '', '', '', 'Male', 0, '2017-11-25', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(749448746, 'vikram', '5066', 'qqqqqqqq', '9799656459', '', '', '', '', '', '', 'Male', 0, '2017-09-22', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(760114545, 'agalsaw78aw', '12255992', 'asasdfsdfgghj456', '1238988412', '', '', '', '', '', '', 'Male', 0, '2017-07-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(783574469, 'agallsd', '122559912', 'asasdfsdfgghj456', '1238988447', '', '', '', '', '', '', 'Female', 0, '2017-12-10', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(820644380, 'rahul', '1234563', 'aswqer2345', '12344656588', '', '', '', '', '', '', 'Female', 0, '2017-12-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(838306127, 'Avinum', '5010', '3265983265', '9655684586', '', '', '', '', '', '', 'Male', 0, '2017-11-09', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(849853204, 'maryaaw', '1548778575', 'asasfsdg12323242', '89392533723', '', '', '', '', '', '', 'Male', 0, '2017-09-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(849954188, 'santhiyaq', '12248778', 'asdsdfgghghh', '89255794848', '', '', '', '', '', '', 'Male', 0, '2017-04-30', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(852778907, 'agalyaa', '124578', 'ASDDSGGGGGG', '89395103388', '', '', '', '', '', '', 'Female', 0, '2017-03-02', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(893573212, 'nithra', '5076', 'gerrrrrrr', '8956015785', '', '', '', '', '', '', 'Female', 0, '2017-07-23', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(924018651, 'agalsaqw', '12255997', 'asasdfsdfgghj456', '75812233787', '', '', '', '', '', '', 'Male', 0, '2017-11-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(931721219, 'teja', '5069', 'zzzzzzzzz', '9789678759', '', '', '', '', '', '', 'Male', 0, '2017-09-26', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(952071729, 'M. BHAVANI', 'BUDA17001', '54542010', '4351200071', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '1970-01-01', 'JAYAVIDYA LEARNING & EDUCATION', '2017-12-14 11:43:53', 120809394, 1),
(981581045, 'agalsaw78xs', '1225599278', 'asasdfsdfgghj456', '1238988412774', '', '', '', '', '', '', 'Male', 0, '2017-08-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(995482841, 'maryaAW', '154877812', 'asasfsdg12323242', '89392553789', '', '', '', '', '', '', 'Female', 0, '2017-07-02', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1000335706, 'agalyahju', '1225599112', 'asasdfsdfgghj456', '7581223385', '', '', '', '', '', '', 'Male', 0, '2017-07-09', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1006027396, 'agalasw', '124578758', 'ASDDSGGGGGG', '89395103314', '', '', '', '', '', '', 'Female', 0, '2017-02-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1018193395, 'garitha', '5021', 'mnbvcxzx', '9855729565', '', '', '', '', '', '', 'Female', 0, '2017-05-15', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1045729945, 'S. CHARU CHARITH', 'BUDA17003', '647062010', '4351200073', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1063099048, 'malu', '5032', 'lpkojihu', '8529900325', '', '', '', '', '', '', 'Female', 0, '2017-05-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1079896168, 'hari', '5020', 'lkjhgfds', '8955729565', '', '', '', '', '', '', 'Male', 0, '2017-05-06', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1089018805, 'jaya', '5077', 'paviiiiiii', '8956689745', '', '', '', '', '', '', 'Female', 0, '2017-07-23', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1094957348, 'adgghhet', '112487845', 'adsdfggaq', '8925579712', '', '', '', '', '', '', 'Female', 0, '2017-04-20', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1109222946, 'dulkar', '5071', 'wwwwwwww', '7899987759', '', '', '', '', '', '', 'Male', 0, '2017-09-29', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1132319033, 'quncy', '5062', 'uuuuuuuu', '8987658859', '', '', '', '', '', '', 'Female', 0, '2017-03-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1139830173, 'raj', '55666544', 'sdsfdfht5w6', '122334t244', '', '', '', '', '', '', 'Male', 0, '2017-01-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1145457897, 'saro', '5055', 'youonlyd', '9780022587', '', '', '', '', '', '', 'Male', 0, '2017-09-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1147813045, 'pushan', '5049', 'naskaralim', '9588805587', '', '', '', '', '', '', 'Male', 0, '2017-03-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1148973622, 'Pushpa', '5017', 'pouching', '9952983845', '', '', '', '', '', '', 'Female', 0, '2017-05-02', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1157703522, 'marya', '1548778574', 'asasfsdg12323242', '8939253372', '', '', '', '', '', '', 'Female', 0, '2017-10-26', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1182401255, 'laksh', '5033', 'lpkojihu', '9658210004', '', '', '', '', '', '', 'Male', 0, '2017-11-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1200951710, 'mahe', '5043', 'mamcalsfor', '7842682584', '', '', '', '', '', '', 'Male', 0, '2017-05-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1207641564, 'agalsaw712', '1225599412', 'asasdfsdfgghj456', '758122336589', '', '', '', '', '', '', 'Female', 0, '2017-06-21', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1209327414, 'Sindhu', '5018', 'queening', '9957293845', '', '', '', '', '', '', 'Female', 0, '2017-09-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1224305269, 'vinay', '5064', 'lllllllll', '8889658859', '', '', '', '', '', '', 'Male', 0, '2017-03-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1225317259, 'koushi', '5075', 'mannnnnnnn', '7956015785', '', '', '', '', '', '', 'Female', 0, '2017-07-22', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1233173899, 'agalsawas12', '1225599212', 'asasdfsdfgghj456', '1238988412', '', '', '', '', '', '', 'Female', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1256493618, 'agalyaaa', '1245784', 'ASDDSGGGGGG', '89395103387', '', '', '', '', '', '', 'Male', 0, '2017-03-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1264095586, 'swaasaw', '122487897', 'asasfsdg12323242', '89255798717', '', '', '', '', '', '', 'Male', 0, '2017-02-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1298188473, 'anjbdnjkghkl', '124579832', 'dfhiudfjjgkhgl', '455463553544', '', '', '', '', '', '', 'Male', 0, '2017-01-09', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1309376766, 'agalsaal', '122559974', 'asasdfsdfgghj456', '75812233712', '', '', '', '', '', '', 'Female', 0, '2017-11-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1316370818, 'nethu', '5053', 'passssss', '8886805587', '', '', '', '', '', '', 'Female', 0, '2017-09-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1350977998, 'shravan', '5050', 'pavithraa', '9556805587', '', '', '', '', '', '', 'Male', 0, '2017-03-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1352098928, 'aswerswer', '103104', 'ryiopp77899', '7581223365', '', '', '', '', '', '', 'Male', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1383642353, 'ravi', '5025', ',lpmkonj', '8750723897', '', '', '', '', '', '', 'Male', 0, '2017-02-17', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1384828447, 'htayaya', '1548778', 'asasfsdg12323242', '8939253388', '', '', '', '', '', '', 'Male', 0, '2017-02-17', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1393196124, 'seegan', '123456', '22221111', '9952380502', '', '', '', '', '', '', 'Male', 0, '2017-11-30', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1402460928, 'giri', '5079', '22221111', '9789866745', '', '', '', '', '', '', 'Male', 0, '2017-11-21', '0000-00-00', '', '2017-12-04 12:11:00', 0, 1),
(1412604297, 'agalsaw77as', '1225599478', 'asasdfsdfgghj456', '131654684878', '', '', '', '', '', '', 'Female', 0, '2017-06-20', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1434399577, 'aqwett', '123789', 'aswertyt1233', '124579933', '', '', '', '', '', '', 'Female', 0, '2017-12-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1437275726, 'RUTURAJ DINESH DHAMANE', 'BUDB17001', '15092007', '4351200075', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1452064532, 'swaaaqaq', '12248781', 'asasfsdg12323242', '8925579818', '', '', '', '', '', '', 'Female', 0, '2017-05-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1475055901, 'swsewert', '175487887', 'asasfsdg12323242', '892551579778', '', '', '', '', '', '', 'Male', 0, '2017-04-21', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1482754483, 'kavin', '5034', 'gfbvtrtr', '9658653004', '', '', '', '', '', '', 'Male', 0, '2017-01-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1499026119, 'manju', '5046', 'mahemanju', '8972696884', '', '', '', '', '', '', 'Female', 0, '2017-05-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1501157906, 'sow', '1223445', 'asasdfsdfgghj456', '123358988', '', '', '', '', '', '', 'Male', 0, '2017-01-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1505376651, 'swawasqr', '122481448', 'asasfsdg12323242', '8925579842', '', '', '', '', '', '', 'Male', 0, '2017-01-02', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1530427548, 'Arjun', '5006', '8956238956', '8978451256', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1541910301, 'Anitha', '5008', '1245781245', '9865745854', '', '', '', '', '', '', 'Female', 0, '2017-11-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1543292834, 'hamsa', '124537', 'sddgfhghh2334', '12345668789', '', '', '', '', '', '', 'Female', 0, '2017-01-06', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1558623438, 'S. AKILAN', 'BUDA17002', '25102010', '4351200072', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1569536457, 'agalyaqw', '12457878', 'ASDDSGGGGGG', '89395103347', '', '', '', '', '', '', 'Female', 0, '2017-02-24', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1601953502, 'sowa', '12234452', 'asasdfsdfgghj456', '12335898812', '', '', '', '', '', '', 'Male', 0, '2017-01-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1627346031, 'htayayad', '15487781', 'asasfsdg12323242', '8939253387', '', '', '', '', '', '', 'Male', 0, '2017-02-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1653834729, 'seegan', '15484', 'ryhjjkklkill.k.,k.,', '45776513232', '', '', '', '', '', '', 'Male', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1661742635, 'swawsq', '112481447', 'asasfsdg12323242', '8925579747', '', '', '', '', '', '', 'Male', 0, '2017-02-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1665923974, 'marsde', '1754877', 'asasfsdg12323242', '8925569784', '', '', '', '', '', '', 'Male', 0, '2017-08-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1675521907, 'ANUSHKA A,IT PANDIT', 'BUDB17002', '14032008', '4351200076', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1758499598, 'nakul', '5048', 'overrapoir', '9600005587', '', '', '', '', '', '', 'Male', 0, '2017-03-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1786985706, 'AYESHA MUSHTAQDAFEDAE', 'BUDB17003', '25102007', '4351200077', '', '', 'Call', 'Email', '', '', 'Male', 0, '2017-10-11', '0000-00-00', 'JAYAVIDYA LEARNING & EDUCATION', '0000-00-00 00:00:00', 120809394, 1),
(1814386809, 'sowaqw', '124452', 'asasdfsdfgghj456', '12335898845', '', '', '', '', '', '', 'Female', 0, '2017-12-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1827974049, 'anumanth', '5002', '000000008', '88888888888', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1832763065, 'Akask', '5004', '32165498', '9687456154', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1860834328, 'maryswe', '1548778124', 'asasfsdg12323242', '89392553784', '', '', '', '', '', '', 'Male', 0, '2017-07-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1870931909, 'swsewaw', '112487887', 'asasfsdg12323242', '8925579778', '', '', '', '', '', '', 'Female', 0, '2017-04-22', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1876255399, 'Anbu', '5012', '65983265', '7255684558', '', '', '', '', '', '', 'Female', 0, '2017-11-29', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1888496530, 'anjbdnjkghkl', '124579862', 'dfhiudfjjgkhgl', '455463553544', '', '', '', '', '', '', 'Male', 0, '2017-01-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1897244549, 'jamu', '5022', 'asdfghjk', '9855723015', '', '', '', '', '', '', 'Female', 0, '2017-12-15', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1920976199, 'agalasasd', '124578787', 'ASDDSGGGGGG', '8939510312', '', '', '', '', '', '', 'Male', 0, '2017-02-26', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1933651679, 'malathi', '5081', 'mkkkkkkk', '9799866745', '', '', '', '', '', '', 'Female', 0, '2017-01-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1939682506, 'ishu', '5026', 'polkmnpo', '7285968956', '', '', '', '', '', '', 'Female', 0, '2017-12-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1953057180, 'mary', '154877857', 'asasfsdg12323242', '8939253378', '', '', '', '', '', '', 'Male', 0, '2017-10-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1959784840, 'agalsaw7as', '122559978', 'asasdfsdfgghj456', '75812233612', '', '', '', '', '', '', 'Male', 0, '2017-05-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1964630807, 'Arun', '5007', '3265983265', '7845691235', '', '', '', '', '', '', 'Male', 0, '2017-11-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1972726852, 'archu', '5011', '65498732', '7255684586', '', '', '', '', '', '', 'Female', 0, '2017-11-19', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1983522617, 'puvi', '5057', 'mynameisanu', '9710985023', '', '', '', '', '', '', 'Male', 0, '2017-03-12', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1988429488, 'durka', '5035', '09876543', '9650003004', '', '', '', '', '', '', 'Female', 0, '2017-01-05', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1988654472, 'sowaqwas', '12445212', 'asasdfsdfgghj456', '1233589884512', '', '', '', '', '', '', 'Female', 0, '2017-12-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1991790907, 'lawan', '5047', 'manualman', '9072696884', '', '', '', '', '', '', 'Female', 0, '2017-05-18', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1993277189, 'santhaqwe', '122487178', 'asddsfd112212', '8925577845', '', '', '', '', '', '', 'Female', 0, '2017-02-14', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(1996722426, 'oona', '5070', 'dddddddd', '7899678759', '', '', '', '', '', '', 'Female', 0, '2017-09-29', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2000663237, 'santhiyaaw', '122487147', 'asasfsdg12323242', '8925579878', '', '', '', '', '', '', 'Male', 0, '2017-07-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2009035514, 'sona', '5040', 'humidity', '9566082584', '', '', '', '', '', '', 'Female', 0, '2017-09-07', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2011350220, 'pavi', '5023', 'qazwsxed', '9590723015', '', '', '', '', '', '', 'Female', 0, '2017-12-25', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2047781531, 'umesh', '5042', 'werinsame', '7855582584', '', '', '', '', '', '', 'Male', 0, '2017-09-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2051624252, 'sam', '5054', 'winingman', '9786805587', '', '', '', '', '', '', 'Male', 0, '2017-09-08', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2052306258, 'agal', '101102', 'adh46667nn', '13148979*9', '', '', '', '', '', '', 'Female', 1, '2017-01-01', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2093114299, 'janavi', '5082', 'JAAAAAAAA', '8939754869', '', '', '', '', '', '', 'Female', 0, '2017-02-25', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2094662382, 'taru', '5056', 'manisdman', '8990022587', '', '', '', '', '', '', 'Male', 0, '2017-03-11', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2096642350, 'yuvi', '5029', 'qwerasdf', '8999900325', '', '', '', '', '', '', 'Male', 0, '2017-07-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2097729885, 'agalyaa', '1225599747', 'asasdfsdfgghj456', '75812233412', '', '', '', '', '', '', 'Female', 0, '2017-11-10', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2100508305, 'ugan', '5019', 'poiuytre', '8955729385', '', '', '', '', '', '', 'Male', 0, '2017-07-06', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2102895354, 'santhiyasq', '1224871117', 'asdsdfgghghh', '89255794878', '', '', '', '', '', '', 'Female', 0, '2017-04-28', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2104221322, 'agalsaw789', '122559978', 'asasdfsdfgghj456', '12389884110', '', '', '', '', '', '', 'Female', 0, '2017-06-13', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2121475871, 'agalllasas', '122559965', 'asasdfsdfgghj456', '1238988447', '', '', '', '', '', '', 'Female', 0, '2017-12-10', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1),
(2138925738, 'santhiya', '122487812', 'asasfsdg12323242', '8925579878', '', '', '', '', '', '', 'Male', 0, '2017-04-02', '0000-00-00', '', '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_attended_data`
--

CREATE TABLE `xtra_candidate_attended_data` (
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

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_attended_schedule`
--

CREATE TABLE `xtra_candidate_attended_schedule` (
  `id` int(11) NOT NULL,
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
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `xtra_candidate_branch_batch`
--

CREATE TABLE `xtra_candidate_branch_batch` (
  `candidate_id` bigint(11) NOT NULL,
  `branch_id` int(10) NOT NULL,
  `batch_id` int(10) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_candidate_branch_batch`
--

INSERT INTO `xtra_candidate_branch_batch` (`candidate_id`, `branch_id`, `batch_id`, `active`) VALUES
(2052306258, 1, 1, 1),
(217215999, 3, 3, 1),
(473555243, 1, 1, 1),
(393322520, 1, 1, 1),
(1827974049, 3, 3, 1),
(1832763065, 3, 3, 1),
(650934232, 3, 3, 1),
(1530427548, 3, 3, 1),
(208008353, 1, 1, 1),
(1964630807, 3, 3, 1),
(1139830173, 1, 1, 1),
(1541910301, 3, 3, 1),
(820644380, 1, 1, 1),
(233154638, 3, 3, 1),
(1434399577, 1, 1, 1),
(838306127, 3, 3, 1),
(1888496530, 1, 1, 1),
(1298188473, 1, 1, 1),
(1972726852, 3, 3, 1),
(1876255399, 3, 3, 1),
(1501157906, 1, 1, 1),
(471881946, 3, 3, 1),
(1601953502, 1, 1, 1),
(178900630, 3, 3, 1),
(1814386809, 1, 1, 1),
(107188336, 3, 3, 1),
(1988654472, 1, 1, 1),
(14997873, 1, 1, 1),
(125915352, 1, 1, 1),
(2121475871, 1, 1, 1),
(783574469, 1, 1, 1),
(1233173899, 1, 1, 1),
(1148973622, 3, 4, 1),
(586065926, 1, 1, 1),
(981581045, 1, 1, 1),
(1209327414, 3, 4, 1),
(760114545, 1, 2, 1),
(102107471, 1, 2, 1),
(2104221322, 1, 2, 1),
(95176353, 1, 2, 1),
(482245825, 1, 2, 1),
(2100508305, 3, 4, 1),
(1412604297, 1, 2, 1),
(59815409, 3, 4, 1),
(1207641564, 1, 2, 1),
(1079896168, 3, 4, 1),
(1959784840, 1, 2, 1),
(1018193395, 3, 4, 1),
(1897244549, 3, 4, 1),
(2011350220, 3, 4, 1),
(527752542, 3, 4, 1),
(1383642353, 3, 4, 1),
(272350801, 1, 2, 1),
(924018651, 1, 2, 1),
(1309376766, 1, 2, 1),
(2097729885, 1, 2, 1),
(405906856, 1, 2, 1),
(1939682506, 3, 4, 1),
(125056675, 1, 2, 1),
(579493916, 3, 4, 1),
(659878011, 3, 4, 1),
(2096642350, 3, 4, 1),
(533808006, 3, 4, 1),
(1000335706, 1, 2, 1),
(63532582, 3, 5, 1),
(513227656, 1, 9, 1),
(1063099048, 3, 5, 1),
(89392213, 1, 9, 1),
(1182401255, 3, 5, 1),
(452705309, 1, 9, 1),
(1482754483, 3, 5, 1),
(852778907, 1, 9, 1),
(1256493618, 1, 9, 1),
(1569536457, 1, 9, 1),
(718409545, 1, 9, 1),
(1988429488, 3, 5, 1),
(744054822, 3, 5, 1),
(343121370, 3, 5, 1),
(1006027396, 1, 9, 1),
(1920976199, 1, 9, 1),
(1384828447, 1, 9, 1),
(1627346031, 1, 9, 1),
(607211026, 3, 5, 1),
(1953057180, 1, 10, 1),
(1157703522, 1, 10, 1),
(849853204, 1, 10, 1),
(369601912, 1, 10, 1),
(995482841, 1, 10, 1),
(1860834328, 1, 10, 1),
(338352673, 1, 10, 1),
(1665923974, 1, 10, 1),
(51737999, 1, 10, 1),
(534003596, 1, 10, 1),
(9493673, 1, 10, 1),
(1475055901, 1, 10, 1),
(1870931909, 1, 10, 1),
(603150543, 1, 10, 1),
(1661742635, 1, 10, 1),
(324890201, 1, 10, 1),
(416323513, 3, 5, 1),
(2009035514, 3, 5, 1),
(1505376651, 1, 10, 1),
(163184172, 3, 5, 1),
(206025908, 1, 10, 1),
(2047781531, 3, 5, 1),
(467373823, 1, 11, 1),
(1264095586, 1, 11, 1),
(1200951710, 3, 5, 1),
(1292387, 3, 5, 1),
(1452064532, 1, 11, 1),
(2138925738, 1, 11, 1),
(430103405, 3, 5, 1),
(1499026119, 3, 5, 1),
(1991790907, 3, 5, 1),
(1758499598, 3, 5, 1),
(1147813045, 3, 5, 1),
(1350977998, 3, 5, 1),
(209763291, 3, 5, 1),
(584725788, 3, 5, 1),
(1316370818, 3, 5, 1),
(2051624252, 3, 6, 1),
(1145457897, 3, 6, 1),
(2094662382, 3, 6, 1),
(1983522617, 3, 6, 1),
(669479428, 3, 6, 1),
(403755287, 3, 6, 1),
(1132319033, 3, 6, 1),
(26390240, 3, 6, 1),
(434890234, 1, 11, 1),
(2000663237, 1, 11, 1),
(286729273, 1, 11, 1),
(2102895354, 1, 11, 1),
(849954188, 1, 11, 1),
(328762956, 1, 11, 1),
(1993277189, 1, 11, 1),
(1224305269, 3, 6, 1),
(427703838, 3, 6, 1),
(749448746, 3, 7, 1),
(620959666, 3, 7, 1),
(110436087, 3, 7, 1),
(931721219, 3, 7, 1),
(1996722426, 3, 7, 1),
(1109222946, 3, 7, 1),
(268079875, 3, 7, 1),
(287358727, 3, 7, 1),
(1225317259, 3, 7, 1),
(893573212, 3, 7, 1),
(1089018805, 3, 7, 1),
(450346194, 3, 7, 1),
(1402460928, 3, 0, 1),
(51536103, 3, 7, 1),
(1933651679, 3, 8, 1),
(2093114299, 3, 8, 1),
(574946095, 3, 8, 1),
(1393196124, 3, 3, 1),
(87397351, 1, 10, 1),
(416372041, 1, 9, 1),
(1221740354, 1, 9, 1),
(533736992, 3, 6, 1),
(175976042, 1, 9, 1),
(169423850, 0, 0, 1),
(149265542, 2, 12, 1),
(955069765, 1, 11, 1),
(1558623438, 1, 9, 1),
(1045729945, 2, 0, 1),
(574353793, 2, 12, 1),
(1437275726, 1, 11, 1),
(952071729, 3, 6, 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam`
--

CREATE TABLE `xtra_exam` (
  `id` int(11) NOT NULL,
  `exam_name` text NOT NULL,
  `exam_duration` int(10) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `total_marks` decimal(10,2) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_exam`
--

INSERT INTO `xtra_exam` (`id`, `exam_name`, `exam_duration`, `total_questions`, `total_marks`, `description`, `created_at`, `modified_at`, `active`) VALUES
(1, 'Tamil Exam', 10, 10, '100.00', '<p>fgfdgfd</p>', '2017-12-01 10:36:24', '2017-12-05 13:28:26', 1),
(2, 'English Exam 2017 Dec', 3107, 100, '100.00', '<p>Test English Exam</p>', '2017-12-01 14:44:33', '2017-12-10 03:04:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_questions`
--

CREATE TABLE `xtra_exam_questions` (
  `id` int(11) NOT NULL,
  `exam_id` int(10) NOT NULL,
  `questions` longtext NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_exam_questions`
--

INSERT INTO `xtra_exam_questions` (`id`, `exam_id`, `questions`, `active`) VALUES
(1, 1, 'a:15:{i:19;a:4:{s:11:"question_id";s:2:"19";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:17;a:4:{s:11:"question_id";s:2:"17";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:15;a:4:{s:11:"question_id";s:2:"15";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:13;a:4:{s:11:"question_id";s:2:"13";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:11;a:4:{s:11:"question_id";s:2:"11";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:10;a:4:{s:11:"question_id";s:2:"10";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:9;a:4:{s:11:"question_id";s:1:"9";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:8;a:4:{s:11:"question_id";s:1:"8";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:7;a:4:{s:11:"question_id";s:1:"7";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:6;a:4:{s:11:"question_id";s:1:"6";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:5;a:4:{s:11:"question_id";s:1:"5";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:4;a:4:{s:11:"question_id";s:1:"4";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:3;a:4:{s:11:"question_id";s:1:"3";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:2;a:4:{s:11:"question_id";s:1:"2";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:1;a:4:{s:11:"question_id";s:1:"1";s:10:"right_mark";s:1:"0";s:10:"wrong_mark";s:1:"0";s:13:"question_time";s:1:"0";}}', 1),
(2, 2, 'a:15:{i:49;a:4:{s:11:"question_id";s:2:"49";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:45;a:4:{s:11:"question_id";s:2:"45";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:43;a:4:{s:11:"question_id";s:2:"43";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:40;a:4:{s:11:"question_id";s:2:"40";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:38;a:4:{s:11:"question_id";s:2:"38";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:37;a:4:{s:11:"question_id";s:2:"37";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:35;a:4:{s:11:"question_id";s:2:"35";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:33;a:4:{s:11:"question_id";s:2:"33";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:31;a:4:{s:11:"question_id";s:2:"31";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:29;a:4:{s:11:"question_id";s:2:"29";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:27;a:4:{s:11:"question_id";s:2:"27";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:26;a:4:{s:11:"question_id";s:2:"26";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:24;a:4:{s:11:"question_id";s:2:"24";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}i:22;a:4:{s:11:"question_id";s:2:"22";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:1:"5";}i:21;a:4:{s:11:"question_id";s:2:"21";s:10:"right_mark";s:1:"1";s:10:"wrong_mark";s:1:"1";s:13:"question_time";s:2:"10";}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule`
--

CREATE TABLE `xtra_exam_schedule` (
  `id` int(11) NOT NULL,
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
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_exam_schedule`
--

INSERT INTO `xtra_exam_schedule` (`id`, `exam_id`, `schedule_name`, `description`, `start_date`, `end_date`, `result_date`, `offered_as`, `offer_cost`, `result_as`, `schedule_to`, `created_at`, `modified_at`, `active`) VALUES
(1, 1, 'Test Schedule', '<p>yuytu</p>', '2017-12-04 00:00:00', '2017-12-05 22:30:00', '2017-12-20 01:00:00', 'paid', '10.00', 'auto', 2, '2017-12-02 21:06:28', '2017-12-07 14:46:05', 0),
(2, 2, 'English 2017', '<p>fdgfdg</p>', '2017-12-03 00:30:00', '2017-12-04 08:00:00', '2017-12-05 02:00:00', 'paid', '10.00', 'manual', 2, '2017-12-02 21:09:31', '0000-00-00 00:00:00', 1),
(3, 2, 'English 2017', '<p>fdgfdg</p>', '2017-12-03 01:30:00', '2017-12-04 08:00:00', '2017-12-05 02:00:00', 'paid', '10.00', 'manual', 2, '2017-12-02 21:10:33', '0000-00-00 00:00:00', 1),
(4, 2, 'English 2017', '<p>fdgfdg</p>', '2017-12-03 23:59:00', '2017-12-04 08:00:00', '2017-12-05 02:00:00', 'paid', '10.00', 'manual', 2, '2017-12-02 21:10:53', '0000-00-00 00:00:00', 1),
(5, 2, 'test schedule', '<p>jhghj</p>', '2017-12-04 01:00:00', '2017-12-06 18:00:00', '2017-12-06 09:00:00', 'free', '0.00', 'auto', 2, '2017-12-03 06:35:31', '2017-12-06 12:34:03', 1),
(6, 2, 'Seegan Test', '<p>drytryt</p>', '2017-12-11 14:00:00', '2017-12-27 17:00:00', '2017-12-07 01:30:00', 'paid', '10.00', 'auto', 2, '2017-12-04 13:51:12', '2017-12-11 16:36:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule_batchs`
--

CREATE TABLE `xtra_exam_schedule_batchs` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_exam_schedule_batchs`
--

INSERT INTO `xtra_exam_schedule_batchs` (`id`, `schedule_id`, `batch_id`, `active`) VALUES
(1, 5, 3, 1),
(2, 5, 6, 1),
(3, 5, 8, 1),
(4, 5, 12, 1),
(5, 5, 14, 1),
(6, 6, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_exam_schedule_candidates`
--

CREATE TABLE `xtra_exam_schedule_candidates` (
  `id` int(11) NOT NULL,
  `schedule_id` int(10) NOT NULL,
  `candidates` longtext NOT NULL,
  `active` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_exam_schedule_candidates`
--

INSERT INTO `xtra_exam_schedule_candidates` (`id`, `schedule_id`, `candidates`, `active`) VALUES
(1, 1, 'a:2:{i:2121475871;a:1:{s:12:"candidate_id";s:10:"2121475871";}i:783574469;a:1:{s:12:"candidate_id";s:9:"783574469";}}', 1),
(2, 2, 'a:0:{}', 1),
(3, 3, 'a:0:{}', 1),
(4, 4, 'a:0:{}', 1),
(5, 5, 'a:2:{i:574946095;a:1:{s:12:"candidate_id";s:9:"574946095";}i:1876255399;a:1:{s:12:"candidate_id";s:10:"1876255399";}}', 1),
(6, 6, 'a:1:{i:1393196124;a:1:{s:12:"candidate_id";s:10:"1393196124";}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_import_files`
--

CREATE TABLE `xtra_import_files` (
  `id` int(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `import_type` varchar(255) NOT NULL,
  `file_name` text NOT NULL,
  `import_data` longtext NOT NULL,
  `estimated_count` int(10) NOT NULL DEFAULT '0',
  `current_status` varchar(250) NOT NULL DEFAULT 'open',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_import_files`
--

INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(1, 120809394, 'candidate', 'Book11-dd13.xlsx', 'a:10:{i:1;a:30:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:3;i:15;N;i:16;s:5:"morn2";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:533736992;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:2;a:30:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:9;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:175976042;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:3;a:30:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:6:"guindy";i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:169423850;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:4;a:30:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:2;i:15;N;i:16;d:12;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:149265542;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:5;a:30:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:955069765;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:6;a:30:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1123336046;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:7;a:30:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1417498423;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:8;a:30:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:508070884;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:9;a:30:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:434622022;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:10;a:29:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:130:"<p><span class="redfield">Password</span> must contain:\r\n				<ol>\r\n					<li>At least 8 characters</li>\r\n				</ol>\r\n			</span></p>\n";}}', 10, 'analyze', '2017-12-14 11:37:55', 1),
(2, 120809394, 'candidate', 'Book11-dd14.xlsx', 'a:10:{i:1;a:30:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:3;i:15;N;i:16;s:5:"morn2";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:952071729;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:2;a:30:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:9;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1558623438;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:3;a:30:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:6:"guindy";i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1045729945;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:4;a:30:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:2;i:15;N;i:16;d:12;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:574353793;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:5;a:30:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1437275726;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:6;a:30:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1675521907;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:7;a:30:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:1786985706;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:8;a:30:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:377282306;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:9;a:30:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:12:"candidate_id";d:714696100;s:6:"status";s:7:"success";s:14:"status_message";s:25:"Candidate Import Success!";}i:10;a:29:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:130:"<p><span class="redfield">Password</span> must contain:\r\n				<ol>\r\n					<li>At least 8 characters</li>\r\n				</ol>\r\n			</span></p>\n";}}', 10, 'analyze', '2017-12-14 11:41:58', 1),
(3, 120809394, 'candidate', 'Book11-dd15.xlsx', 'a:10:{i:1;a:29:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:3;i:15;N;i:16;s:5:"morn2";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:2;a:29:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:9;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:3;a:29:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:6:"guindy";i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:4;a:29:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:2;i:15;N;i:16;d:12;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:5;a:29:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:6;a:29:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:7;a:29:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:8;a:29:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:9;a:29:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:69:"<p>Username already in use.</p>\n<p>Email address already in use.</p>\n";}i:10;a:29:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;s:6:"status";s:6:"failed";s:14:"status_message";s:130:"<p><span class="redfield">Password</span> must contain:\r\n				<ol>\r\n					<li>At least 8 characters</li>\r\n				</ol>\r\n			</span></p>\n";}}', 10, 'analyze', '2017-12-14 11:44:20', 1),
(4, 120809394, 'candidate', 'food-inventory-a.xlsx', '', 0, 'open', '2017-12-14 12:17:39', 0),
(5, 120809394, 'candidate', 'BASICS_PAYROLL.xls', '', 0, 'open', '2017-12-14 12:20:14', 0),
(6, 120809394, 'candidate', 'Book11-dd.xlsx', 'a:10:{i:1;a:27:{i:0;s:9:"BUDA17001";i:1;d:54542010;i:2;s:9:"BUDA17001";i:3;s:10:"M. BHAVANI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya056@gmail.com";i:8;N;i:9;d:4351200071;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:3;i:15;N;i:16;s:5:"morn2";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:2:"no";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:2;a:27:{i:0;s:9:"BUDA17002";i:1;d:25102010;i:2;s:9:"BUDA17002";i:3;s:9:"S. AKILAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya057@gmail.com";i:8;N;i:9;d:4351200072;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:9;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:3;a:27:{i:0;s:9:"BUDA17003";i:1;d:647062010;i:2;s:9:"BUDA17003";i:3;s:16:"S. CHARU CHARITH";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya058@gmail.com";i:8;N;i:9;d:4351200073;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:6:"guindy";i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:4;a:27:{i:0;s:9:"BUDA17004";i:1;d:17012010;i:2;s:9:"BUDA17004";i:3;s:10:"S. JEYDHEV";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya059@gmail.com";i:8;N;i:9;d:4351200074;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:2;i:15;N;i:16;d:12;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:5;a:27:{i:0;s:9:"BUDB17001";i:1;d:15092007;i:2;s:9:"BUDB17001";i:3;s:22:"RUTURAJ DINESH DHAMANE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya060@gmail.com";i:8;N;i:9;d:4351200075;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;d:1;i:15;N;i:16;d:11;i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:6;a:27:{i:0;s:9:"BUDB17002";i:1;d:14032008;i:2;s:9:"BUDB17002";i:3;s:19:"ANUSHKA A,IT PANDIT";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya061@gmail.com";i:8;N;i:9;d:4351200076;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:7;a:27:{i:0;s:9:"BUDB17003";i:1;d:25102007;i:2;s:9:"BUDB17003";i:3;s:21:"AYESHA MUSHTAQDAFEDAE";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya062@gmail.com";i:8;N;i:9;d:4351200077;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:27:"RAJASHREES LEARNING ACADEMY";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:8;a:27:{i:0;s:9:"BUDB17004";i:1;d:20032007;i:2;s:9:"BUDB17004";i:3;s:11:"M. DHARCINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya063@gmail.com";i:8;N;i:9;d:4351200078;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:9;a:27:{i:0;s:9:"BUDB17005";i:1;d:18072009;i:2;s:9:"BUDB17005";i:3;s:12:"S. PAVITHRAN";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya064@gmail.com";i:8;N;i:9;d:4351200079;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}i:10;a:27:{i:0;s:9:"BUDB17006";i:1;d:4042009;i:2;s:9:"BUDB17006";i:3;s:19:"S. P. SRIDHARRSHINI";i:4;N;i:5;N;i:6;s:10:"10/11/2017";i:7;s:17:"jaya065@gmail.com";i:8;N;i:9;d:4351200080;i:10;N;i:11;s:4:"Call";i:12;s:5:"Email";i:13;s:30:"JAYAVIDYA LEARNING & EDUCATION";i:14;s:11:"BRAINY KIDS";i:15;N;i:16;s:5:"BUD-B";i:17;N;i:18;N;i:19;s:2:"No";i:20;s:3:"yes";i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;}}', 10, 'analyze', '2017-12-14 12:20:34', 0);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(7, 120809394, 'candidate', 'sample.xlsx', 'a:6:{i:1;a:1027:{i:0;s:9:"Subject 1";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:2;a:1027:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:3;a:1027:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:4;a:1027:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:5;a:1027:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:6;a:1027:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}}', 6, 'analyze', '2017-12-14 12:26:45', 1);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(8, 120809394, 'question', 'sample1.xlsx', 'a:6:{i:1;a:1025:{i:0;s:9:"Subject 1";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:2;a:1025:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:3;a:1025:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:4;a:1025:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:5;a:1025:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:6;a:1025:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;N;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}}', 6, 'analyze', '2017-12-14 12:39:54', 0);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(9, 120809394, 'question', 'sample_(2).xlsx', 'a:6:{i:1;a:1027:{i:0;s:9:"Subject 1";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:2;a:1027:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:3;a:1027:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:4;a:1027:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:5;a:1027:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:6;a:1027:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}}', 6, 'analyze', '2017-12-14 12:41:38', 1);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(10, 120809394, 'question', 'sample_(2)1.xlsx', 'a:6:{i:1;a:1025:{i:0;s:9:"Subject 1";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:2;a:1025:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:3;a:1025:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:4;a:1025:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:5;a:1025:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}i:6;a:1025:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;i:40;N;i:41;N;i:42;N;i:43;N;i:44;N;i:45;N;i:46;N;i:47;N;i:48;N;i:49;N;i:50;N;i:51;N;i:52;N;i:53;N;i:54;N;i:55;N;i:56;N;i:57;N;i:58;N;i:59;N;i:60;N;i:61;N;i:62;N;i:63;N;i:64;N;i:65;N;i:66;N;i:67;N;i:68;N;i:69;N;i:70;N;i:71;N;i:72;N;i:73;N;i:74;N;i:75;N;i:76;N;i:77;N;i:78;N;i:79;N;i:80;N;i:81;N;i:82;N;i:83;N;i:84;N;i:85;N;i:86;N;i:87;N;i:88;N;i:89;N;i:90;N;i:91;N;i:92;N;i:93;N;i:94;N;i:95;N;i:96;N;i:97;N;i:98;N;i:99;N;i:100;N;i:101;N;i:102;N;i:103;N;i:104;N;i:105;N;i:106;N;i:107;N;i:108;N;i:109;N;i:110;N;i:111;N;i:112;N;i:113;N;i:114;N;i:115;N;i:116;N;i:117;N;i:118;N;i:119;N;i:120;N;i:121;N;i:122;N;i:123;N;i:124;N;i:125;N;i:126;N;i:127;N;i:128;N;i:129;N;i:130;N;i:131;N;i:132;N;i:133;N;i:134;N;i:135;N;i:136;N;i:137;N;i:138;N;i:139;N;i:140;N;i:141;N;i:142;N;i:143;N;i:144;N;i:145;N;i:146;N;i:147;N;i:148;N;i:149;N;i:150;N;i:151;N;i:152;N;i:153;N;i:154;N;i:155;N;i:156;N;i:157;N;i:158;N;i:159;N;i:160;N;i:161;N;i:162;N;i:163;N;i:164;N;i:165;N;i:166;N;i:167;N;i:168;N;i:169;N;i:170;N;i:171;N;i:172;N;i:173;N;i:174;N;i:175;N;i:176;N;i:177;N;i:178;N;i:179;N;i:180;N;i:181;N;i:182;N;i:183;N;i:184;N;i:185;N;i:186;N;i:187;N;i:188;N;i:189;N;i:190;N;i:191;N;i:192;N;i:193;N;i:194;N;i:195;N;i:196;N;i:197;N;i:198;N;i:199;N;i:200;N;i:201;N;i:202;N;i:203;N;i:204;N;i:205;N;i:206;N;i:207;N;i:208;N;i:209;N;i:210;N;i:211;N;i:212;N;i:213;N;i:214;N;i:215;N;i:216;N;i:217;N;i:218;N;i:219;N;i:220;N;i:221;N;i:222;N;i:223;N;i:224;N;i:225;N;i:226;N;i:227;N;i:228;N;i:229;N;i:230;N;i:231;N;i:232;N;i:233;N;i:234;N;i:235;N;i:236;N;i:237;N;i:238;N;i:239;N;i:240;N;i:241;N;i:242;N;i:243;N;i:244;N;i:245;N;i:246;N;i:247;N;i:248;N;i:249;N;i:250;N;i:251;N;i:252;N;i:253;N;i:254;N;i:255;N;i:256;N;i:257;N;i:258;N;i:259;N;i:260;N;i:261;N;i:262;N;i:263;N;i:264;N;i:265;N;i:266;N;i:267;N;i:268;N;i:269;N;i:270;N;i:271;N;i:272;N;i:273;N;i:274;N;i:275;N;i:276;N;i:277;N;i:278;N;i:279;N;i:280;N;i:281;N;i:282;N;i:283;N;i:284;N;i:285;N;i:286;N;i:287;N;i:288;N;i:289;N;i:290;N;i:291;N;i:292;N;i:293;N;i:294;N;i:295;N;i:296;N;i:297;N;i:298;N;i:299;N;i:300;N;i:301;N;i:302;N;i:303;N;i:304;N;i:305;N;i:306;N;i:307;N;i:308;N;i:309;N;i:310;N;i:311;N;i:312;N;i:313;N;i:314;N;i:315;N;i:316;N;i:317;N;i:318;N;i:319;N;i:320;N;i:321;N;i:322;N;i:323;N;i:324;N;i:325;N;i:326;N;i:327;N;i:328;N;i:329;N;i:330;N;i:331;N;i:332;N;i:333;N;i:334;N;i:335;N;i:336;N;i:337;N;i:338;N;i:339;N;i:340;N;i:341;N;i:342;N;i:343;N;i:344;N;i:345;N;i:346;N;i:347;N;i:348;N;i:349;N;i:350;N;i:351;N;i:352;N;i:353;N;i:354;N;i:355;N;i:356;N;i:357;N;i:358;N;i:359;N;i:360;N;i:361;N;i:362;N;i:363;N;i:364;N;i:365;N;i:366;N;i:367;N;i:368;N;i:369;N;i:370;N;i:371;N;i:372;N;i:373;N;i:374;N;i:375;N;i:376;N;i:377;N;i:378;N;i:379;N;i:380;N;i:381;N;i:382;N;i:383;N;i:384;N;i:385;N;i:386;N;i:387;N;i:388;N;i:389;N;i:390;N;i:391;N;i:392;N;i:393;N;i:394;N;i:395;N;i:396;N;i:397;N;i:398;N;i:399;N;i:400;N;i:401;N;i:402;N;i:403;N;i:404;N;i:405;N;i:406;N;i:407;N;i:408;N;i:409;N;i:410;N;i:411;N;i:412;N;i:413;N;i:414;N;i:415;N;i:416;N;i:417;N;i:418;N;i:419;N;i:420;N;i:421;N;i:422;N;i:423;N;i:424;N;i:425;N;i:426;N;i:427;N;i:428;N;i:429;N;i:430;N;i:431;N;i:432;N;i:433;N;i:434;N;i:435;N;i:436;N;i:437;N;i:438;N;i:439;N;i:440;N;i:441;N;i:442;N;i:443;N;i:444;N;i:445;N;i:446;N;i:447;N;i:448;N;i:449;N;i:450;N;i:451;N;i:452;N;i:453;N;i:454;N;i:455;N;i:456;N;i:457;N;i:458;N;i:459;N;i:460;N;i:461;N;i:462;N;i:463;N;i:464;N;i:465;N;i:466;N;i:467;N;i:468;N;i:469;N;i:470;N;i:471;N;i:472;N;i:473;N;i:474;N;i:475;N;i:476;N;i:477;N;i:478;N;i:479;N;i:480;N;i:481;N;i:482;N;i:483;N;i:484;N;i:485;N;i:486;N;i:487;N;i:488;N;i:489;N;i:490;N;i:491;N;i:492;N;i:493;N;i:494;N;i:495;N;i:496;N;i:497;N;i:498;N;i:499;N;i:500;N;i:501;N;i:502;N;i:503;N;i:504;N;i:505;N;i:506;N;i:507;N;i:508;N;i:509;N;i:510;N;i:511;N;i:512;N;i:513;N;i:514;N;i:515;N;i:516;N;i:517;N;i:518;N;i:519;N;i:520;N;i:521;N;i:522;N;i:523;N;i:524;N;i:525;N;i:526;N;i:527;N;i:528;N;i:529;N;i:530;N;i:531;N;i:532;N;i:533;N;i:534;N;i:535;N;i:536;N;i:537;N;i:538;N;i:539;N;i:540;N;i:541;N;i:542;N;i:543;N;i:544;N;i:545;N;i:546;N;i:547;N;i:548;N;i:549;N;i:550;N;i:551;N;i:552;N;i:553;N;i:554;N;i:555;N;i:556;N;i:557;N;i:558;N;i:559;N;i:560;N;i:561;N;i:562;N;i:563;N;i:564;N;i:565;N;i:566;N;i:567;N;i:568;N;i:569;N;i:570;N;i:571;N;i:572;N;i:573;N;i:574;N;i:575;N;i:576;N;i:577;N;i:578;N;i:579;N;i:580;N;i:581;N;i:582;N;i:583;N;i:584;N;i:585;N;i:586;N;i:587;N;i:588;N;i:589;N;i:590;N;i:591;N;i:592;N;i:593;N;i:594;N;i:595;N;i:596;N;i:597;N;i:598;N;i:599;N;i:600;N;i:601;N;i:602;N;i:603;N;i:604;N;i:605;N;i:606;N;i:607;N;i:608;N;i:609;N;i:610;N;i:611;N;i:612;N;i:613;N;i:614;N;i:615;N;i:616;N;i:617;N;i:618;N;i:619;N;i:620;N;i:621;N;i:622;N;i:623;N;i:624;N;i:625;N;i:626;N;i:627;N;i:628;N;i:629;N;i:630;N;i:631;N;i:632;N;i:633;N;i:634;N;i:635;N;i:636;N;i:637;N;i:638;N;i:639;N;i:640;N;i:641;N;i:642;N;i:643;N;i:644;N;i:645;N;i:646;N;i:647;N;i:648;N;i:649;N;i:650;N;i:651;N;i:652;N;i:653;N;i:654;N;i:655;N;i:656;N;i:657;N;i:658;N;i:659;N;i:660;N;i:661;N;i:662;N;i:663;N;i:664;N;i:665;N;i:666;N;i:667;N;i:668;N;i:669;N;i:670;N;i:671;N;i:672;N;i:673;N;i:674;N;i:675;N;i:676;N;i:677;N;i:678;N;i:679;N;i:680;N;i:681;N;i:682;N;i:683;N;i:684;N;i:685;N;i:686;N;i:687;N;i:688;N;i:689;N;i:690;N;i:691;N;i:692;N;i:693;N;i:694;N;i:695;N;i:696;N;i:697;N;i:698;N;i:699;N;i:700;N;i:701;N;i:702;N;i:703;N;i:704;N;i:705;N;i:706;N;i:707;N;i:708;N;i:709;N;i:710;N;i:711;N;i:712;N;i:713;N;i:714;N;i:715;N;i:716;N;i:717;N;i:718;N;i:719;N;i:720;N;i:721;N;i:722;N;i:723;N;i:724;N;i:725;N;i:726;N;i:727;N;i:728;N;i:729;N;i:730;N;i:731;N;i:732;N;i:733;N;i:734;N;i:735;N;i:736;N;i:737;N;i:738;N;i:739;N;i:740;N;i:741;N;i:742;N;i:743;N;i:744;N;i:745;N;i:746;N;i:747;N;i:748;N;i:749;N;i:750;N;i:751;N;i:752;N;i:753;N;i:754;N;i:755;N;i:756;N;i:757;N;i:758;N;i:759;N;i:760;N;i:761;N;i:762;N;i:763;N;i:764;N;i:765;N;i:766;N;i:767;N;i:768;N;i:769;N;i:770;N;i:771;N;i:772;N;i:773;N;i:774;N;i:775;N;i:776;N;i:777;N;i:778;N;i:779;N;i:780;N;i:781;N;i:782;N;i:783;N;i:784;N;i:785;N;i:786;N;i:787;N;i:788;N;i:789;N;i:790;N;i:791;N;i:792;N;i:793;N;i:794;N;i:795;N;i:796;N;i:797;N;i:798;N;i:799;N;i:800;N;i:801;N;i:802;N;i:803;N;i:804;N;i:805;N;i:806;N;i:807;N;i:808;N;i:809;N;i:810;N;i:811;N;i:812;N;i:813;N;i:814;N;i:815;N;i:816;N;i:817;N;i:818;N;i:819;N;i:820;N;i:821;N;i:822;N;i:823;N;i:824;N;i:825;N;i:826;N;i:827;N;i:828;N;i:829;N;i:830;N;i:831;N;i:832;N;i:833;N;i:834;N;i:835;N;i:836;N;i:837;N;i:838;N;i:839;N;i:840;N;i:841;N;i:842;N;i:843;N;i:844;N;i:845;N;i:846;N;i:847;N;i:848;N;i:849;N;i:850;N;i:851;N;i:852;N;i:853;N;i:854;N;i:855;N;i:856;N;i:857;N;i:858;N;i:859;N;i:860;N;i:861;N;i:862;N;i:863;N;i:864;N;i:865;N;i:866;N;i:867;N;i:868;N;i:869;N;i:870;N;i:871;N;i:872;N;i:873;N;i:874;N;i:875;N;i:876;N;i:877;N;i:878;N;i:879;N;i:880;N;i:881;N;i:882;N;i:883;N;i:884;N;i:885;N;i:886;N;i:887;N;i:888;N;i:889;N;i:890;N;i:891;N;i:892;N;i:893;N;i:894;N;i:895;N;i:896;N;i:897;N;i:898;N;i:899;N;i:900;N;i:901;N;i:902;N;i:903;N;i:904;N;i:905;N;i:906;N;i:907;N;i:908;N;i:909;N;i:910;N;i:911;N;i:912;N;i:913;N;i:914;N;i:915;N;i:916;N;i:917;N;i:918;N;i:919;N;i:920;N;i:921;N;i:922;N;i:923;N;i:924;N;i:925;N;i:926;N;i:927;N;i:928;N;i:929;N;i:930;N;i:931;N;i:932;N;i:933;N;i:934;N;i:935;N;i:936;N;i:937;N;i:938;N;i:939;N;i:940;N;i:941;N;i:942;N;i:943;N;i:944;N;i:945;N;i:946;N;i:947;N;i:948;N;i:949;N;i:950;N;i:951;N;i:952;N;i:953;N;i:954;N;i:955;N;i:956;N;i:957;N;i:958;N;i:959;N;i:960;N;i:961;N;i:962;N;i:963;N;i:964;N;i:965;N;i:966;N;i:967;N;i:968;N;i:969;N;i:970;N;i:971;N;i:972;N;i:973;N;i:974;N;i:975;N;i:976;N;i:977;N;i:978;N;i:979;N;i:980;N;i:981;N;i:982;N;i:983;N;i:984;N;i:985;N;i:986;N;i:987;N;i:988;N;i:989;N;i:990;N;i:991;N;i:992;N;i:993;N;i:994;N;i:995;N;i:996;N;i:997;N;i:998;N;i:999;N;i:1000;N;i:1001;N;i:1002;N;i:1003;N;i:1004;N;i:1005;N;i:1006;N;i:1007;N;i:1008;N;i:1009;N;i:1010;N;i:1011;N;i:1012;N;i:1013;N;i:1014;N;i:1015;N;i:1016;N;i:1017;N;i:1018;N;i:1019;N;i:1020;N;i:1021;N;i:1022;N;i:1023;N;i:1024;N;}}', 6, 'analyze', '2017-12-14 14:59:22', 1);
INSERT INTO `xtra_import_files` (`id`, `user_id`, `import_type`, `file_name`, `import_data`, `estimated_count`, `current_status`, `created_at`, `active`) VALUES
(11, 120809394, 'question', 'Book1.xlsx', 'a:6:{i:1;a:40:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;}i:2;a:40:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;}i:3;a:40:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;}i:4;a:40:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;}i:5;a:40:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;}i:6;a:40:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;}}', 6, 'analyze', '2017-12-14 16:45:05', 1),
(12, 120809394, 'question', 'Book11.xlsx', 'a:6:{i:1;a:40:{i:0;s:7:"English";i:1;s:13:"Single Choice";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;}i:2;a:40:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;}i:3;a:40:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;}i:4;a:40:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;}i:5;a:40:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;}i:6;a:40:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;}}', 6, 'analyze', '2017-12-14 17:18:08', 1),
(13, 120809394, 'question', 'Book12.xlsx', 'a:6:{i:1;a:43:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:11:"question_id";i:84;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:43:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;s:11:"question_id";i:86;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:3;a:43:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;s:11:"question_id";i:88;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:4;a:42:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:5;a:42:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:6;a:43:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;s:11:"question_id";i:90;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}}', 6, 'analyze', '2017-12-14 19:11:24', 1),
(14, 120809394, 'candidate', 'Book1.xlsx', 'a:6:{i:1;a:42:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:189:"<p><span class="redfield">Password</span> must contain:\r\n				<ol>\r\n					<li>At least 8 characters</li>\r\n				</ol>\r\n			</span></p>\n<p>The email field must contain a valid email address.</p>\n";}i:2;a:42:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:3;a:42:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:4;a:42:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:5;a:42:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}i:6;a:42:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:59:"<p>The email field must contain a valid email address.</p>\n";}}', 6, 'analyze', '2017-12-14 19:39:56', 1),
(15, 120809394, 'question', 'Book13.xlsx', 'a:6:{i:1;a:43:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:11:"question_id";i:91;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:42:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:3;a:42:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:4;a:42:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:5;a:42:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:6;a:43:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;s:11:"question_id";i:93;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}}', 6, 'analyze', '2017-12-14 19:40:32', 1),
(16, 120809394, 'question', 'Book14.xlsx', 'a:6:{i:1;a:43:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:11:"question_id";i:94;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:42:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:3;a:42:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:4;a:42:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:5;a:42:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:6;a:43:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;s:11:"question_id";i:95;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}}', 6, 'analyze', '2017-12-14 19:42:27', 1),
(17, 120809394, 'question', 'Book15.xlsx', 'a:6:{i:1;a:43:{i:0;s:7:"English";i:1;s:6:"lesson";i:2;s:7:"English";i:3;s:13:"SINGLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:109:"Speed= 		60 x 	5 	m/sec 	= 		50 	m/sec.\n18 	3\n\nLength of the train = (Speed x Time) = 		50 	x 9 	m = 150 m.\n3";i:13;s:102:"A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?";i:14;s:10:"120 metres";i:15;s:10:"180 metres";i:16;s:10:"324 metres";i:17;s:10:"150 metres";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:11:"question_id";i:96;s:6:"status";s:7:"success";s:14:"status_message";s:18:"Question Imported!";}i:2;a:42:{i:0;s:9:"Subject 2";i:1;s:15:"Multiple choice";i:2;s:7:"English";i:3;s:15:"MULTIPLE CHOICE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:132:"A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :";i:14;s:3:"1\n4";i:15;s:4:"1\n10";i:16;s:4:"7\n15";i:17;s:4:"8\n15";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:3;a:42:{i:0;s:9:"Subject 3";i:1;s:20:"True /False Quetions";i:2;s:7:"English";i:3;s:10:"TRUE FALSE";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"hard";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:103:"True, we can use long double; if double range is not enough.\n\ndouble = 8 bytes.\nlong double = 10 bytes.";i:13;s:90:"A long double can be used if range of a double is not enough to accommodate a real number.";i:14;b:1;i:15;s:4:"Fale";i:16;N;i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"1,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:4;a:42:{i:0;s:9:"Subject 4";i:1;s:28:"Fill In the blankes Question";i:2;s:7:"English";i:3;s:18:"FILL IN THE BLANKS";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;s:299:"A wedding results in a joining, or a marriage, so choice d is the essential element. Love (choice a) usually precedes a wedding, but it is not essential. A wedding may take place anywhere, so a church (choice b) is not required. A ring (choice c) is often used in a wedding, but it is not necessary.";i:13;s:188:"A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.";i:14;s:4:"love";i:15;s:6:"church";i:16;s:4:"ring";i:17;s:8:"marriage";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;N;i:27;N;i:28;N;i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:2:"4,";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:5;a:42:{i:0;s:9:"Subject 5";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:15:"MATCH FOLLOWING";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Match the following:";i:14;s:15:"Darlington pair";i:15;s:12:"CB amplifier";i:16;s:17:"Cascade amplifier";i:17;N;i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:52:"uses pnp and npn transistors used as power amplifier";i:27;s:46:"Voltage gain nearly 1 and high input impedance";i:28;s:53:"low input impedance used for high frequency isolation";i:29;N;i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:13:"1-2, 2-3, 3-1";i:39;d:0;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}i:6;a:42:{i:0;s:9:"Subject 6";i:1;s:17:"Mathch  following";i:2;s:7:"English";i:3;s:12:"MATCH MATRIX";i:4;s:7:"Written";i:5;d:2015;i:6;s:4:"Easy";i:7;s:8:"For Demo";i:8;s:8:"For Demo";i:9;d:1;i:10;d:2;i:11;d:3;i:12;N;i:13;s:20:"Fing Following Match";i:14;s:9:"Word wrap";i:15;s:6:"Client";i:16;s:12:"Multitasking";i:17;s:9:"Landscape";i:18;N;i:19;N;i:20;N;i:21;N;i:22;N;i:23;N;i:24;N;i:25;N;i:26;s:66:"interleaved execution of two or more programs by the same computer";i:27;s:82:"automatically moves a word to the next line if it does not fit in the current line";i:28;s:29:"an application receiving data";i:29;s:24:"orientation of worksheet";i:30;N;i:31;N;i:32;N;i:33;N;i:34;N;i:35;N;i:36;N;i:37;N;i:38;s:18:"1-2, 2-3, 3-1, 4-4";i:39;d:1;s:6:"status";s:6:"failed";s:14:"status_message";s:22:"Invalid User Question!";}}', 6, 'analyze', '2017-12-14 19:43:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_question`
--

CREATE TABLE `xtra_question` (
  `id` int(11) NOT NULL,
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
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_question`
--

INSERT INTO `xtra_question` (`id`, `question`, `question_type`, `subject`, `topic`, `language`, `year`, `difficulty_level`, `right_mark`, `negative_mark`, `question_time`, `choice`, `created_at`, `active`) VALUES
(1, '<p>question 1</p>', 1, 1, 1, 'en', 2017, 2, 0, 0, 0, 4, '2017-12-01 07:00:14', 1),
(2, '<p>question 2</p>', 1, 1, 1, 'en', 2017, 1, 1, 1, 10, 4, '2017-12-01 07:01:57', 1),
(3, '<p>question 3</p>', 1, 1, 1, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:02:42', 1),
(4, '<p>question 4</p>', 1, 1, 1, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:06:22', 1),
(5, '<p>question 5</p>', 1, 1, 1, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:07:23', 1),
(6, '<p>ilakkanam 1</p>', 1, 1, 2, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:09:17', 1),
(7, '<p>ilakkanam 2</p>', 1, 1, 2, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:12:22', 1),
(8, '<p>ilakkanam 3</p>', 1, 1, 2, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:13:16', 1),
(9, '<p>ilakkanam 4</p>', 1, 1, 2, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:14:10', 1),
(10, '<p>ilakkanam 5</p>', 1, 1, 2, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:15:07', 1),
(11, '<p>seiyul 1</p>', 1, 1, 3, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:16:12', 1),
(12, '<p>wat is history?</p>', 1, 5, 13, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:20:09', 1),
(13, '<p>seiyul 2?</p>', 1, 1, 3, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:21:24', 1),
(14, '<p>define history?</p>', 1, 5, 13, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:21:24', 1),
(15, '<p>seiyul 3?</p>', 1, 1, 3, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:22:06', 1),
(16, '<p>king?</p>', 1, 5, 13, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:22:15', 1),
(17, '<p>seiyul 5?</p>', 1, 1, 3, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:22:59', 1),
(18, '<p>history 4?</p>', 1, 5, 13, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:23:40', 1),
(19, '<p>seiyul 5?</p>', 1, 1, 3, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:23:59', 1),
(20, '<p>azsxdcf?</p>', 1, 5, 13, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:24:41', 1),
(21, '<p>is legend?</p>', 1, 2, 4, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:24:48', 1),
(22, '<p>powerful?</p>', 1, 2, 4, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:26:06', 1),
(23, '<p>cvbnng?</p>', 1, 5, 14, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:26:51', 1),
(24, '<p>mineful ?</p>', 1, 2, 4, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:27:08', 1),
(25, '<p>asdggh?</p>', 1, 5, 14, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:27:48', 1),
(26, '<p>younger than?</p>\r\n<p>&nbsp;</p>', 1, 2, 4, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:27:55', 1),
(27, '<p>pioneer?</p>', 1, 2, 4, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:28:46', 1),
(28, '<p>asdertyum?</p>', 1, 5, 14, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:28:49', 1),
(29, '<p>shaskesphere there?</p>\r\n<p>&nbsp;</p>', 1, 2, 5, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:29:35', 1),
(30, '<p>asdeerttyy?</p>', 1, 5, 14, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:29:42', 1),
(31, '<p>william manro?</p>', 1, 2, 5, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:30:45', 1),
(32, '<p>dfrtyun?</p>', 1, 5, 14, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:30:49', 1),
(33, '<p>poultry?</p>', 1, 2, 5, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:31:40', 1),
(34, '<p>dfgtgty?</p>', 1, 5, 15, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:32:08', 1),
(35, '<p>right to?</p>', 1, 2, 5, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:32:29', 1),
(36, '<p>sdert 2014?</p>', 1, 5, 15, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:32:50', 1),
(37, '<p>be a?</p>', 1, 2, 5, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:33:48', 1),
(38, '<p>leaderful?</p>', 1, 2, 6, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:34:48', 1),
(39, '<p>sdffrtty</p>', 1, 5, 15, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:35:05', 1),
(40, '<p>harsha ?</p>', 1, 2, 6, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:35:47', 1),
(41, '<p>asdfgg?</p>', 1, 5, 15, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:36:02', 1),
(42, '<p>vbnhj123?</p>', 1, 5, 15, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:36:41', 1),
(43, '<p>do it?</p>', 1, 2, 6, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:36:58', 1),
(44, '<p>vbnnmhyjyuy?</p>', 1, 5, 15, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:37:20', 1),
(45, '<p>metric pattern?</p>', 1, 2, 6, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:38:12', 1),
(46, '<p>dfgghhjhjjbn</p>', 1, 4, 10, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:38:26', 1),
(47, '<p>asddfdfggh</p>', 1, 4, 10, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:38:59', 1),
(48, '<p>sdfdfgghghj</p>', 1, 4, 10, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:39:50', 1),
(49, '<p>poverty?</p>', 1, 2, 6, 'en', 2017, 1, 1, 1, 0, 4, '2017-12-01 07:40:28', 1),
(50, '<p>gthyjhhjtyu?</p>', 1, 4, 10, 'en', 2017, 1, 1, 1, 0, 4, '2017-12-01 07:40:28', 1),
(51, '<p>fghgjhm,j?</p>', 1, 4, 10, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:41:15', 1),
(52, '<p>5+6?</p>', 1, 3, 7, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:41:53', 1),
(53, '<p>yhjjjkjk?</p>', 1, 4, 10, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:41:57', 1),
(54, '<p>5(9)?</p>', 1, 3, 7, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:42:55', 1),
(55, '<p>sdfghgfjhjkjkmjm</p>', 1, 4, 11, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:43:05', 1),
(56, '<p>6*6?</p>', 1, 3, 7, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:43:31', 1),
(57, '<p>rrtyrtyhjyj?</p>', 1, 4, 11, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:43:43', 1),
(58, '<p>8-9</p>', 1, 3, 7, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:44:10', 1),
(59, '<p>dfggfhghgjh</p>', 1, 4, 11, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:44:21', 1),
(60, '<p>fgfhgjhj?</p>', 1, 4, 11, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:44:58', 1),
(61, '<p>8%8?</p>', 1, 3, 7, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:45:00', 1),
(62, '<p>ddfhgjjhmhm?</p>', 1, 4, 11, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:45:30', 1),
(63, '<p>sin 0?</p>', 1, 3, 8, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:45:46', 1),
(64, '<p>kkkk?</p>', 1, 4, 11, 'en', 2017, 3, 1, 1, 0, 4, '2017-12-01 07:47:34', 1),
(65, '<p>fgghghjnhjhytm</p>', 1, 4, 12, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:48:34', 1),
(66, '<p>ghfgjhjhjhjhyj</p>', 1, 4, 12, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:49:04', 1),
(67, '<p>rgthbghhg</p>', 1, 4, 12, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:50:02', 1),
(68, '<p>dffghghjj</p>', 1, 4, 12, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:50:32', 1),
(69, '<p>tghnnhjj</p>', 1, 4, 12, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:51:04', 1),
(70, '<p>asfgfhhhj</p>', 1, 4, 12, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:51:47', 1),
(71, '<p>1245565</p>', 1, 3, 9, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:52:38', 1),
(72, '<p>wertgtryth</p>', 1, 3, 9, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:53:21', 1),
(73, '<p>cos 95?</p>', 1, 3, 8, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:53:43', 1),
(74, '<p>tththnghjtyty</p>', 1, 3, 9, 'en', 2017, 3, 1, 1, 15, 4, '2017-12-01 07:53:56', 1),
(75, '<p>errtrththh</p>', 1, 3, 9, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:54:28', 1),
(76, '<p>rhghjhjyjyjjjjy</p>', 1, 3, 9, 'en', 2017, 1, 1, 1, 5, 4, '2017-12-01 07:55:14', 1),
(77, '<p>cosec 0</p>', 1, 3, 8, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:56:09', 1),
(78, '<p>tan 45</p>', 1, 3, 8, 'en', 2017, 2, 1, 1, 10, 4, '2017-12-01 07:57:43', 1),
(79, '<p>sec 45</p>', 1, 3, 8, 'en', 2017, 3, 1, 1, 10, 4, '2017-12-01 07:58:24', 1),
(83, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 6, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 14:50:56', 1),
(84, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 6, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:04:17', 1),
(85, 'A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :', 2, 0, 0, 'en', 2015, 1, 1, 2, 3, 7, '2017-12-14 15:04:17', 1),
(86, 'A can do a work in 15 days and B in 20 days. If they work on it together for 4 days, then the fraction of the work that is left is :', 2, 0, 0, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:05:47', 1),
(87, 'A long double can be used if range of a double is not enough to accommodate a real number.', 4, 0, 0, 'en', 2015, 3, 1, 2, 3, 5, '2017-12-14 15:05:48', 1),
(88, 'A long double can be used if range of a double is not enough to accommodate a real number.', 4, 0, 0, 'en', 2015, 3, 1, 2, 3, 2, '2017-12-14 15:06:46', 1),
(89, 'A good way to approach this type of question is to use the following sentence: "A ______ could not exist without ______.". Find the word that names a necessary part of the underlined word.', 3, 0, 0, 'en', 2015, 1, 1, 2, 3, 7, '2017-12-14 15:06:47', 1),
(90, 'Fing Following Match', 1, 0, 0, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:08:55', 1),
(91, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 6, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:10:35', 1),
(92, 'Fing Following Match', 1, 0, 0, 'en', 2015, 1, 1, 2, 3, 7, '2017-12-14 15:10:35', 1),
(93, 'Fing Following Match', 1, 0, 0, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:11:43', 1),
(94, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 6, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:12:30', 1),
(95, 'Fing Following Match', 1, 0, 0, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:12:35', 1),
(96, 'A train running at the speed of 60 km/hr crosses a pole in 9 seconds. What is the length of the train?', 1, 2, 6, 'en', 2015, 1, 1, 2, 3, 4, '2017-12-14 15:13:26', 1);

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
(2, 'Multi Choice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_single_answer`
--

CREATE TABLE `xtra_single_answer` (
  `question_id` int(10) NOT NULL,
  `option_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_single_answer`
--

INSERT INTO `xtra_single_answer` (`question_id`, `option_id`) VALUES
(1, 1),
(2, 6),
(3, 11),
(4, 14),
(5, 19),
(6, 22),
(7, 27),
(8, 30),
(9, 35),
(10, 40),
(11, 42),
(12, 46),
(13, 50),
(14, 55),
(15, 58),
(16, 64),
(17, 68),
(18, 71),
(19, 73),
(20, 78),
(21, 81),
(22, 88),
(23, 90),
(24, 95),
(25, 98),
(26, 104),
(27, 107),
(28, 109),
(29, 116),
(30, 118),
(31, 124),
(32, 126),
(33, 131),
(34, 134),
(35, 139),
(36, 143),
(37, 146),
(38, 152),
(39, 155),
(40, 159),
(41, 164),
(42, 167),
(43, 172),
(44, 173),
(45, 180),
(46, 182),
(47, 186),
(48, 190),
(49, 196),
(50, 199),
(51, 203),
(52, 206),
(53, 212),
(54, 214),
(55, 218),
(56, 224),
(57, 227),
(58, 229),
(59, 235),
(60, 239),
(61, 241),
(62, 247),
(63, 249),
(64, 256),
(65, 258),
(66, 263),
(67, 268),
(68, 270),
(69, 275),
(70, 279),
(71, 282),
(72, 287),
(73, 292),
(74, 295),
(75, 300),
(76, 303),
(77, 308),
(78, 311),
(79, 313),
(83, 320),
(84, 324),
(86, 328),
(88, 329),
(90, 331),
(90, 332),
(90, 333),
(90, 334),
(91, 338),
(93, 339),
(93, 340),
(93, 341),
(93, 342),
(94, 346),
(95, 347),
(95, 348),
(95, 349),
(95, 350),
(96, 354);

-- --------------------------------------------------------

--
-- Table structure for table `xtra_single_options`
--

CREATE TABLE `xtra_single_options` (
  `option_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `option_key` varchar(2) NOT NULL,
  `option_val` text NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xtra_single_options`
--

INSERT INTO `xtra_single_options` (`option_id`, `question_id`, `option_key`, `option_val`, `active`) VALUES
(1, 1, 'A', '<p>answer 1</p>', 1),
(2, 1, 'B', '<p>answet 2</p>', 1),
(3, 1, 'C', '<p>answer 3</p>', 1),
(4, 1, 'D', '<p>answer 4</p>', 1),
(5, 2, 'A', '<p>answer 1</p>', 1),
(6, 2, 'B', '<p>answer 2</p>', 1),
(7, 2, 'C', '<p>answer 3</p>', 1),
(8, 2, 'D', '<p>answer 4</p>', 1),
(9, 3, 'A', '<p>answer 1</p>', 1),
(10, 3, 'B', '<p>answer 2</p>', 1),
(11, 3, 'C', '<p>answer 3</p>', 1),
(12, 3, 'D', '<p>answer 4</p>', 1),
(13, 4, 'A', '<p>answer 1</p>', 1),
(14, 4, 'B', '<p>answer 2</p>', 1),
(15, 4, 'C', '<p>answer 3</p>', 1),
(16, 4, 'D', '<p>answer 4</p>', 1),
(17, 5, 'A', '<p>answer 1</p>', 1),
(18, 5, 'B', '<p>answer 2</p>', 1),
(19, 5, 'C', '<p>answer 3</p>', 1),
(20, 5, 'D', '<p>answer 4</p>', 1),
(21, 6, 'A', '<p>pattern 1</p>', 1),
(22, 6, 'B', '<p>pattern 2</p>', 1),
(23, 6, 'C', '<p>pattern 3</p>', 1),
(24, 6, 'D', '<p>pattern 4</p>', 1),
(25, 7, 'A', '<p>option a</p>', 1),
(26, 7, 'B', '<p>option b</p>', 1),
(27, 7, 'C', '<p>option c</p>', 1),
(28, 7, 'D', '<p>option d</p>', 1),
(29, 8, 'A', '<p>public 1</p>', 1),
(30, 8, 'B', '<p>public 2</p>', 1),
(31, 8, 'C', '<p>public 3</p>', 1),
(32, 8, 'D', '<p>public 4</p>', 1),
(33, 9, 'A', '<p>private 1</p>', 1),
(34, 9, 'B', '<p>private 2</p>', 1),
(35, 9, 'C', '<p>private 3</p>', 1),
(36, 9, 'D', '<p>private 4</p>', 1),
(37, 10, 'A', '<p>s</p>', 1),
(38, 10, 'B', '<p>d</p>', 1),
(39, 10, 'C', '<p>f</p>', 1),
(40, 10, 'D', '<p>g</p>', 1),
(41, 11, 'A', '<p>v</p>', 1),
(42, 11, 'B', '<p>z</p>', 1),
(43, 11, 'C', '<p>date</p>', 1),
(44, 11, 'D', '<p>time</p>', 1),
(45, 12, 'A', '<p>ag</p>', 1),
(46, 12, 'B', '<p>al</p>', 1),
(47, 12, 'C', '<p>ya</p>', 1),
(48, 12, 'D', '<p>m</p>', 1),
(49, 13, 'A', '<p>time</p>', 1),
(50, 13, 'B', '<p>date</p>', 1),
(51, 14, 'A', '<p>as</p>', 1),
(52, 13, 'C', '<p>period</p>', 1),
(53, 14, 'B', '<p>gh</p>', 1),
(54, 13, 'D', '<p>sch</p>', 1),
(55, 14, 'C', '<p>nm</p>', 1),
(56, 14, 'D', '<p>jkkk</p>', 1),
(57, 15, 'A', '<p>private</p>', 1),
(58, 15, 'B', '<p>public</p>', 1),
(59, 15, 'C', '<p>source</p>', 1),
(60, 15, 'D', '<p>field</p>', 1),
(61, 16, 'A', '<p>wer</p>', 1),
(62, 16, 'B', '<p>fghh</p>', 1),
(63, 16, 'C', '<p>nmhy</p>', 1),
(64, 16, 'D', '<p>qwerty</p>', 1),
(65, 17, 'A', '<p>girl</p>', 1),
(66, 17, 'B', '<p>admin</p>', 1),
(67, 17, 'C', '<p>dry</p>', 1),
(68, 17, 'D', '<p>power</p>', 1),
(69, 18, 'A', '<p>asf</p>', 1),
(70, 18, 'B', '<p>ghyt</p>', 1),
(71, 18, 'C', '<p>werty</p>', 1),
(72, 18, 'D', '<p>nmjjuj</p>', 1),
(73, 19, 'A', '<p>power</p>', 1),
(74, 19, 'B', '<p>potential</p>', 1),
(75, 19, 'C', '<p>rare</p>', 1),
(76, 19, 'D', '<p>field</p>', 1),
(77, 20, 'A', '<p>123</p>', 1),
(78, 20, 'B', '<p>1234</p>', 1),
(79, 20, 'C', '<p>12345</p>', 1),
(80, 20, 'D', '<p>5678</p>', 1),
(81, 21, 'A', '<p>no</p>', 1),
(82, 21, 'B', '<p>none</p>', 1),
(83, 21, 'C', '<p>yes</p>', 1),
(84, 21, 'D', '<p>nil</p>', 1),
(85, 22, 'A', '<p>try</p>', 1),
(86, 22, 'B', '<p>pinch</p>', 1),
(87, 22, 'C', '<p>good</p>', 1),
(88, 22, 'D', '<p>none</p>', 1),
(89, 23, 'A', '<p>233d</p>', 1),
(90, 23, 'B', '<p>asdret</p>', 1),
(91, 23, 'C', '<p>1123edtrt</p>', 1),
(92, 23, 'D', '<p>123edrt</p>', 1),
(93, 24, 'A', '<p>product</p>', 1),
(94, 24, 'B', '<p>pear</p>', 1),
(95, 24, 'C', '<p>pin</p>', 1),
(96, 24, 'D', '<p>small</p>', 1),
(97, 25, 'A', '<p>12wer</p>', 1),
(98, 25, 'B', '<p>asdfg</p>', 1),
(99, 25, 'C', '<p>wdrt</p>', 1),
(100, 25, 'D', '<p>aswer4</p>', 1),
(101, 26, 'A', '<p>yes</p>', 1),
(102, 26, 'B', '<p>no</p>', 1),
(103, 26, 'C', '<p>neutral</p>', 1),
(104, 26, 'D', '<p>none</p>', 1),
(105, 27, 'A', '<p>pinch</p>', 1),
(106, 27, 'B', '<p>sweet</p>', 1),
(107, 27, 'C', '<p>jug</p>', 1),
(108, 27, 'D', '<p>huge</p>', 1),
(109, 28, 'A', '<p>asqwe</p>', 1),
(110, 28, 'B', '<p>wedsf</p>', 1),
(111, 28, 'C', '<p>rtyu</p>', 1),
(112, 28, 'D', '<p>vbgft</p>', 1),
(113, 29, 'A', '<p>govern</p>', 1),
(114, 29, 'B', '<p>polite&nbsp;</p>', 1),
(115, 29, 'C', '<p>related</p>', 1),
(116, 29, 'D', '<p>nineful</p>', 1),
(117, 30, 'A', '<p>aswer</p>', 1),
(118, 30, 'B', '<p>1233df</p>', 1),
(119, 30, 'C', '<p>swerty</p>', 1),
(120, 30, 'D', '<p>1we3r5</p>', 1),
(121, 31, 'A', '<p>the</p>', 1),
(122, 31, 'B', '<p>threat</p>', 1),
(123, 31, 'C', '<p>treat</p>', 1),
(124, 31, 'D', '<p>twinkle</p>', 1),
(125, 32, 'A', '<p>asder</p>', 1),
(126, 32, 'B', '<p>wderty</p>', 1),
(127, 32, 'C', '<p>1w23e4</p>', 1),
(128, 32, 'D', '<p>xcderty</p>', 1),
(129, 33, 'A', '<p>peak</p>', 1),
(130, 33, 'B', '<p>pwin</p>', 1),
(131, 33, 'C', '<p>pul</p>', 1),
(132, 33, 'D', '<p>poul</p>', 1),
(133, 34, 'A', '<p>2017</p>', 1),
(134, 34, 'B', '<p>2014</p>', 1),
(135, 34, 'C', '<p>2015</p>', 1),
(136, 34, 'D', '<p>2016</p>', 1),
(137, 35, 'A', '<p>feminine</p>', 1),
(138, 35, 'B', '<p>cuisine</p>', 1),
(139, 35, 'C', '<p>genine</p>', 1),
(140, 35, 'D', '<p>control</p>', 1),
(141, 36, 'A', '<p>sdert</p>', 1),
(142, 36, 'B', '<p>swdrt</p>', 1),
(143, 36, 'C', '<p>bnty</p>', 1),
(144, 36, 'D', '<p>dggghy</p>', 1),
(145, 37, 'A', '<p>honest</p>', 1),
(146, 37, 'B', '<p>afraid</p>', 1),
(147, 37, 'C', '<p>povert</p>', 1),
(148, 37, 'D', '<p>coward</p>', 1),
(149, 38, 'A', '<p>liquid</p>', 1),
(150, 38, 'B', '<p>fear</p>', 1),
(151, 38, 'C', '<p>finish</p>', 1),
(152, 38, 'D', '<p>freedom</p>', 1),
(153, 39, 'A', '<p>asd</p>', 1),
(154, 39, 'B', '<p>sdf</p>', 1),
(155, 39, 'C', '<p>ghj</p>', 1),
(156, 39, 'D', '<p>jkl</p>', 1),
(157, 40, 'A', '<p>garden</p>', 1),
(158, 40, 'B', '<p>ground</p>', 1),
(159, 40, 'C', '<p>gulf</p>', 1),
(160, 40, 'D', '<p>go green</p>', 1),
(161, 41, 'A', '<p>asd</p>', 1),
(162, 41, 'B', '<p>swer</p>', 1),
(163, 41, 'C', '<p>rgty</p>', 1),
(164, 41, 'D', '<p>bghyh</p>', 1),
(165, 42, 'A', '<p>asdfg</p>', 1),
(166, 42, 'B', '<p>werty</p>', 1),
(167, 42, 'C', '<p>dcfgh</p>', 1),
(168, 42, 'D', '<p>vfgtyu</p>', 1),
(169, 43, 'A', '<p>judgement</p>', 1),
(170, 43, 'B', '<p>playful</p>', 1),
(171, 43, 'C', '<p>need</p>', 1),
(172, 43, 'D', '<p>order</p>', 1),
(173, 44, 'A', '<p>asd</p>', 1),
(174, 44, 'B', '<p>1w23</p>', 1),
(175, 44, 'C', '<p>dfgh5</p>', 1),
(176, 44, 'D', '<p>sdg6</p>', 1),
(177, 45, 'A', '<p>bed</p>', 1),
(178, 45, 'B', '<p>begger</p>', 1),
(179, 45, 'C', '<p>power</p>', 1),
(180, 45, 'D', '<p>pit</p>', 1),
(181, 46, 'A', '<p>as</p>', 1),
(182, 46, 'B', '<p>dsf</p>', 1),
(183, 46, 'C', '<p>fhjh</p>', 1),
(184, 46, 'D', '<p>gbh</p>', 1),
(185, 47, 'A', '<p>vbghg</p>', 1),
(186, 47, 'B', '<p>ghhjkj</p>', 1),
(187, 47, 'C', '<p>ghhjjkm</p>', 1),
(188, 47, 'D', '<p>ghhjhjkk</p>', 1),
(189, 48, 'A', '<p>dsfgh234</p>', 1),
(190, 48, 'B', '<p>12334gfg</p>', 1),
(191, 48, 'C', '<p>fghghhj5</p>', 1),
(192, 48, 'D', '<p>fhgghjhj3</p>', 1),
(193, 49, 'A', '<p>device</p>', 1),
(194, 49, 'B', '<p>queen</p>', 1),
(195, 49, 'C', '<p>none</p>', 1),
(196, 49, 'D', '<p>wear</p>', 1),
(197, 50, 'A', '<p>asd</p>', 1),
(198, 50, 'B', '<p>wer</p>', 1),
(199, 50, 'C', '<p>fgfhj</p>', 1),
(200, 50, 'D', '<p>gjghkjuj</p>', 1),
(201, 51, 'A', '<p>1223</p>', 1),
(202, 51, 'B', '<p>443545</p>', 1),
(203, 51, 'C', '<p>sddf5</p>', 1),
(204, 51, 'D', '<p>e5546</p>', 1),
(205, 52, 'A', '<p>7</p>', 1),
(206, 52, 'B', '<p>4</p>', 1),
(207, 52, 'C', '<p>6</p>', 1),
(208, 52, 'D', '<p>9</p>', 1),
(209, 53, 'A', '<p>123</p>', 1),
(210, 53, 'B', '<p>dfggh</p>', 1),
(211, 53, 'C', '<p>rtrtytyh</p>', 1),
(212, 53, 'D', '<p>tyytyyt</p>', 1),
(213, 54, 'A', '<p>12</p>', 1),
(214, 54, 'B', '<p>15</p>', 1),
(215, 54, 'C', '<p>17</p>', 1),
(216, 54, 'D', '<p>2</p>', 1),
(217, 55, 'A', '<p>1133</p>', 1),
(218, 55, 'B', '<p>4454</p>', 1),
(219, 55, 'C', '<p>rgh</p>', 1),
(220, 55, 'D', '<p>565343</p>', 1),
(221, 56, 'A', '<p>98</p>', 1),
(222, 56, 'B', '<p>54</p>', 1),
(223, 56, 'C', '<p>35</p>', 1),
(224, 56, 'D', '<p>61</p>', 1),
(225, 57, 'A', '<p>asd</p>', 1),
(226, 57, 'B', '<p>wer</p>', 1),
(227, 57, 'C', '<p>gth</p>', 1),
(228, 57, 'D', '<p>tgth</p>', 1),
(229, 58, 'A', '<p>7</p>', 1),
(230, 58, 'B', '<p>5</p>', 1),
(231, 58, 'C', '<p>8</p>', 1),
(232, 58, 'D', '<p>0</p>', 1),
(233, 59, 'A', '<p>rgghng</p>', 1),
(234, 59, 'B', '<p>213rfdg</p>', 1),
(235, 59, 'C', '<p>ggh32342</p>', 1),
(236, 59, 'D', '<p>ghgj454</p>', 1),
(237, 60, 'A', '<p>ab</p>', 1),
(238, 60, 'B', '<p>bc</p>', 1),
(239, 60, 'C', '<p>cd</p>', 1),
(240, 60, 'D', '<p>de</p>', 1),
(241, 61, 'A', '<p>5</p>', 1),
(242, 61, 'B', '<p>99</p>', 1),
(243, 61, 'C', '<p>46</p>', 1),
(244, 61, 'D', '<p>2</p>', 1),
(245, 62, 'A', '<p>ads</p>', 1),
(246, 62, 'B', '<p>sdgffg</p>', 1),
(247, 62, 'C', '<p>344tt5</p>', 1),
(248, 62, 'D', '<p>fggfh5</p>', 1),
(249, 63, 'A', '<p>5</p>', 1),
(250, 63, 'B', '<p>none</p>', 1),
(251, 63, 'C', '<p>infinity</p>', 1),
(252, 63, 'D', '<p>0</p>', 1),
(253, 64, 'A', '<p>asd</p>', 1),
(254, 64, 'B', '<p>rth</p>', 1),
(255, 64, 'C', '<p>34344</p>', 1),
(256, 64, 'D', '<p>dsrdt5</p>', 1),
(257, 65, 'A', '<p>ggth</p>', 1),
(258, 65, 'B', '<p>rtryty</p>', 1),
(259, 65, 'C', '<p>ttyyt</p>', 1),
(260, 65, 'D', '<p>rttytty</p>', 1),
(261, 66, 'A', '<p>ert</p>', 1),
(262, 66, 'B', '<p>1212</p>', 1),
(263, 66, 'C', '<p>34fg</p>', 1),
(264, 66, 'D', '<p>r45r445</p>', 1),
(265, 67, 'A', '<p>sfggh</p>', 1),
(266, 67, 'B', '<p>rtttjj</p>', 1),
(267, 67, 'C', '<p>3rtyyj</p>', 1),
(268, 67, 'D', '<p>tytyuyjj</p>', 1),
(269, 68, 'A', '<p>123</p>', 1),
(270, 68, 'B', '<p>34545</p>', 1),
(271, 68, 'C', '<p>34545</p>', 1),
(272, 68, 'D', '<p>32455</p>', 1),
(273, 69, 'A', '<p>rttrythh</p>', 1),
(274, 69, 'B', '<p>rtgghgh</p>', 1),
(275, 69, 'C', '<p>er45354</p>', 1),
(276, 69, 'D', '<p>4545gbhj</p>', 1),
(277, 70, 'A', '<p>ere4ttt</p>', 1),
(278, 70, 'B', '<p>143fsfdg</p>', 1),
(279, 70, 'C', '<p>fg4544</p>', 1),
(280, 70, 'D', '<p>ttrygh5</p>', 1),
(281, 71, 'A', '<p>2</p>', 1),
(282, 71, 'B', '<p>4</p>', 1),
(283, 71, 'C', '<p>5</p>', 1),
(284, 71, 'D', '<p>6</p>', 1),
(285, 72, 'A', '<p>4545</p>', 1),
(286, 72, 'B', '<p>2233</p>', 1),
(287, 72, 'C', '<p>13234</p>', 1),
(288, 72, 'D', '<p>2444</p>', 1),
(289, 73, 'A', '<p>15</p>', 1),
(290, 73, 'B', '<p>0</p>', 1),
(291, 73, 'C', '<p>95</p>', 1),
(292, 73, 'D', '<p>10</p>', 1),
(293, 74, 'A', '<p>ass</p>', 1),
(294, 74, 'B', '<p>rtt</p>', 1),
(295, 74, 'C', '<p>errttr</p>', 1),
(296, 74, 'D', '<p>rtrttty</p>', 1),
(297, 75, 'A', '<p>eerret</p>', 1),
(298, 75, 'B', '<p>rttrtr</p>', 1),
(299, 75, 'C', '<p>trtyr5r</p>', 1),
(300, 75, 'D', '<p>454tttt</p>', 1),
(301, 76, 'A', '<p>12</p>', 1),
(302, 76, 'B', '<p>34</p>', 1),
(303, 76, 'C', '<p>45</p>', 1),
(304, 76, 'D', '<p>67</p>', 1),
(305, 77, 'A', '<p>power 2</p>', 1),
(306, 77, 'B', '<p>45</p>', 1),
(307, 77, 'C', '<p>15</p>', 1),
(308, 77, 'D', '<p>10</p>', 1),
(309, 78, 'A', '<p>0</p>', 1),
(310, 78, 'B', '<p>45</p>', 1),
(311, 78, 'C', '<p>1</p>', 1),
(312, 78, 'D', '<p>infinity</p>', 1),
(313, 79, 'A', '<p>45</p>', 1),
(314, 79, 'B', '<p>1</p>', 1),
(315, 79, 'C', '<p>2</p>', 1),
(316, 79, 'D', '<p>0</p>', 1),
(317, 83, 'A', '120 metres', 1),
(318, 83, 'B', '180 metres', 1),
(319, 83, 'C', '324 metres', 1),
(320, 83, 'D', '150 metres', 1),
(321, 84, 'A', '120 metres', 1),
(322, 84, 'B', '180 metres', 1),
(323, 84, 'C', '324 metres', 1),
(324, 84, 'D', '150 metres', 1),
(325, 86, 'A', '1\n4', 1),
(326, 86, 'B', '1\n10', 1),
(327, 86, 'C', '7\n15', 1),
(328, 86, 'D', '8\n15', 1),
(329, 88, 'A', '1', 1),
(330, 88, 'B', 'Fale', 1),
(331, 90, 'A', 'Word wrap', 1),
(332, 90, 'B', 'Client', 1),
(333, 90, 'C', 'Multitasking', 1),
(334, 90, 'D', 'Landscape', 1),
(335, 91, 'A', '120 metres', 1),
(336, 91, 'B', '180 metres', 1),
(337, 91, 'C', '324 metres', 1),
(338, 91, 'D', '150 metres', 1),
(339, 93, 'A', 'Word wrap', 1),
(340, 93, 'B', 'Client', 1),
(341, 93, 'C', 'Multitasking', 1),
(342, 93, 'D', 'Landscape', 1),
(343, 94, 'A', '120 metres', 1),
(344, 94, 'B', '180 metres', 1),
(345, 94, 'C', '324 metres', 1),
(346, 94, 'D', '150 metres', 1),
(347, 95, 'A', 'Word wrap', 1),
(348, 95, 'B', 'Client', 1),
(349, 95, 'C', 'Multitasking', 1),
(350, 95, 'D', 'Landscape', 1),
(351, 96, 'A', '120 metres', 1),
(352, 96, 'B', '180 metres', 1),
(353, 96, 'C', '324 metres', 1),
(354, 96, 'D', '150 metres', 1);

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
(1, 'Tamil', '', '2017-12-01 06:52:51', '0000-00-00 00:00:00', 1),
(2, 'English', '', '2017-12-01 06:53:08', '0000-00-00 00:00:00', 1),
(3, 'Maths', '', '2017-12-01 06:53:17', '2017-12-01 13:05:35', 1),
(4, 'Science', '', '2017-12-01 06:53:24', '0000-00-00 00:00:00', 1),
(5, 'Social Science', '', '2017-12-01 06:53:34', '0000-00-00 00:00:00', 1);

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
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1);

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
(1, 1, 'Ilakkiyam', '', '2017-12-01 06:54:07', '0000-00-00 00:00:00', 1),
(2, 1, 'ilakkanam', '', '2017-12-01 07:05:20', '0000-00-00 00:00:00', 1),
(3, 1, 'seiyul', '', '2017-12-01 07:06:25', '0000-00-00 00:00:00', 1),
(4, 2, 'Grammar', '', '2017-12-01 07:07:21', '0000-00-00 00:00:00', 1),
(5, 2, 'poem', '', '2017-12-01 07:07:48', '0000-00-00 00:00:00', 1),
(6, 2, 'lesson', '', '2017-12-01 07:08:17', '0000-00-00 00:00:00', 1),
(7, 3, 'numerical', '', '2017-12-01 07:09:13', '0000-00-00 00:00:00', 1),
(8, 3, 'trigonometry', '', '2017-12-01 07:10:30', '0000-00-00 00:00:00', 1),
(9, 3, 'geometry', '', '2017-12-01 07:11:51', '0000-00-00 00:00:00', 1),
(10, 4, 'physics', '', '2017-12-01 07:12:18', '0000-00-00 00:00:00', 1),
(11, 4, 'chemistry', '', '2017-12-01 07:13:12', '0000-00-00 00:00:00', 1),
(12, 4, 'biology', '', '2017-12-01 07:14:02', '0000-00-00 00:00:00', 1),
(13, 5, 'History', '', '2017-12-01 07:14:31', '0000-00-00 00:00:00', 1),
(14, 5, 'geography', '', '2017-12-01 07:14:57', '0000-00-00 00:00:00', 1),
(15, 5, 'economics', '', '2017-12-01 07:16:03', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`);

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
-- Indexes for table `xtra_candidate`
--
ALTER TABLE `xtra_candidate`
  ADD UNIQUE KEY `user_id_3` (`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `user_id_4` (`user_id`);

--
-- Indexes for table `xtra_candidate_attended_schedule`
--
ALTER TABLE `xtra_candidate_attended_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_category`
--
ALTER TABLE `xtra_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_exam`
--
ALTER TABLE `xtra_exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_exam_questions`
--
ALTER TABLE `xtra_exam_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_exam_schedule`
--
ALTER TABLE `xtra_exam_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_exam_schedule_batchs`
--
ALTER TABLE `xtra_exam_schedule_batchs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_exam_schedule_candidates`
--
ALTER TABLE `xtra_exam_schedule_candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_import_files`
--
ALTER TABLE `xtra_import_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_question`
--
ALTER TABLE `xtra_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `xtra_question_type`
--
ALTER TABLE `xtra_question_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xtra_single_options`
--
ALTER TABLE `xtra_single_options`
  ADD PRIMARY KEY (`option_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `xtra_batch_subject`
--
ALTER TABLE `xtra_batch_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `xtra_branch`
--
ALTER TABLE `xtra_branch`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `xtra_branch_subject`
--
ALTER TABLE `xtra_branch_subject`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `xtra_candidate_attended_schedule`
--
ALTER TABLE `xtra_candidate_attended_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xtra_category`
--
ALTER TABLE `xtra_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `xtra_exam`
--
ALTER TABLE `xtra_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xtra_exam_questions`
--
ALTER TABLE `xtra_exam_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xtra_exam_schedule`
--
ALTER TABLE `xtra_exam_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `xtra_exam_schedule_batchs`
--
ALTER TABLE `xtra_exam_schedule_batchs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `xtra_exam_schedule_candidates`
--
ALTER TABLE `xtra_exam_schedule_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `xtra_import_files`
--
ALTER TABLE `xtra_import_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `xtra_question`
--
ALTER TABLE `xtra_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `xtra_question_type`
--
ALTER TABLE `xtra_question_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `xtra_single_options`
--
ALTER TABLE `xtra_single_options`
  MODIFY `option_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=355;
--
-- AUTO_INCREMENT for table `xtra_subject`
--
ALTER TABLE `xtra_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `xtra_subject_topic`
--
ALTER TABLE `xtra_subject_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
