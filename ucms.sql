-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2023 at 06:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ucms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `full_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `password_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `full_name`, `email`, `password`, `password_text`) VALUES
(1, 'Ratcy12', 'mratul201198@bscse.uiu.ac.bd', '202cb962ac59075b964b07152d234b70', '123');

-- --------------------------------------------------------

--
-- Table structure for table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `block_list`
--

INSERT INTO `block_list` (`id`, `user_id`, `blocked_user_id`) VALUES
(22, 1, 3),
(23, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `id` int(11) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `club_description` varchar(255) NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default_profile.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_comments`
--

CREATE TABLE `club_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_follow_list`
--

CREATE TABLE `club_follow_list` (
  `id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_likes`
--

CREATE TABLE `club_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club_posts`
--

CREATE TABLE `club_posts` (
  `id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(51, 17, 1, ' hnm', '2023-04-28 17:37:38'),
(52, 17, 1, 'f2wqfweq', '2023-04-29 08:26:07'),
(56, 21, 2, 'twetw', '2023-05-01 15:34:51'),
(57, 21, 1, 'fef', '2023-05-01 17:17:58'),
(58, 23, 1, 'maa', '2023-05-02 06:30:38'),
(59, 25, 2, 'egb', '2023-05-03 09:21:06'),
(60, 15, 1, 'vxdv', '2023-05-04 05:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(88, 2, 3),
(98, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(102, 16, 2),
(103, 15, 2),
(104, 17, 1),
(113, 21, 1),
(114, 23, 1),
(118, 25, 2),
(119, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `msg`, `read_status`, `created_at`) VALUES
(41, 2, 1, 'wfdqwef', 1, '2023-04-28 18:12:36'),
(42, 2, 1, 'hrth', 1, '2023-04-28 18:12:43'),
(43, 1, 2, 'ola', 1, '2023-04-29 08:25:26'),
(44, 1, 2, 'rn', 1, '2023-04-30 14:49:32'),
(45, 3, 2, 'efef', 1, '2023-05-01 15:32:34'),
(46, 2, 3, 'yrert', 1, '2023-05-01 15:33:38'),
(47, 1, 2, 'dvdfv', 1, '2023-05-01 17:18:10'),
(48, 1, 3, 'Kire khobor ki?', 1, '2023-05-02 06:10:05'),
(49, 3, 1, 'aitto bhalo', 1, '2023-05-02 06:10:35'),
(50, 1, 3, 'ki', 1, '2023-05-02 06:31:25'),
(51, 2, 1, 'hello', 1, '2023-05-03 09:23:54'),
(52, 1, 2, 'hi', 1, '2023-05-04 05:08:46');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_user_id` int(11) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `post_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `message`, `created_at`, `from_user_id`, `read_status`, `post_id`) VALUES
(99, 1, 'started following you !', '2023-04-27 15:23:34', 2, 1, '0'),
(100, 2, 'started following you !', '2023-04-27 15:25:35', 1, 1, '0'),
(101, 2, 'Unfollowed you !', '2023-04-27 17:14:03', 1, 1, '0'),
(102, 2, 'started following you !', '2023-04-27 17:14:16', 1, 1, '0'),
(103, 2, 'Unfollowed you !', '2023-04-27 17:15:05', 1, 1, '0'),
(104, 2, 'started following you !', '2023-04-27 17:15:08', 1, 1, '0'),
(105, 2, 'Unfollowed you !', '2023-04-27 17:43:59', 1, 1, '0'),
(106, 2, 'started following you !', '2023-04-27 17:44:20', 1, 1, '0'),
(107, 1, 'liked your post !', '2023-04-28 05:22:12', 2, 1, '16'),
(108, 1, 'liked your post !', '2023-04-28 05:22:25', 2, 1, '15'),
(109, 1, 'Unfollowed you !', '2023-04-29 08:27:20', 2, 1, '0'),
(110, 1, 'started following you !', '2023-04-29 08:27:48', 2, 1, '0'),
(111, 1, 'Unfollowed you !', '2023-04-30 14:51:15', 2, 1, '0'),
(112, 1, 'started following you !', '2023-04-30 14:51:19', 2, 1, '0'),
(113, 2, 'Unfollowed you !', '2023-04-30 15:09:53', 1, 1, '0'),
(114, 2, 'started following you !', '2023-04-30 15:32:01', 1, 1, '0'),
(115, 1, 'Unfollowed you !', '2023-04-30 16:02:13', 2, 1, '0'),
(116, 2, 'blocked you', '2023-04-30 17:32:52', 1, 1, '0'),
(117, 2, 'Unblocked you !', '2023-04-30 17:32:53', 1, 1, '0'),
(118, 2, 'started following you !', '2023-04-30 17:46:28', 1, 1, '0'),
(119, 2, 'commented on your post', '2023-04-30 17:49:48', 1, 1, '19'),
(120, 2, 'Unfollowed you !', '2023-05-01 14:18:31', 1, 1, '0'),
(121, 2, 'started following you !', '2023-05-01 14:18:48', 1, 1, '0'),
(122, 1, 'started following you !', '2023-05-01 14:53:59', 3, 1, '0'),
(123, 2, 'started following you !', '2023-05-01 15:32:23', 3, 1, '0'),
(124, 3, 'started following you !', '2023-05-01 15:34:19', 2, 1, '0'),
(125, 3, 'liked your post !', '2023-05-01 15:34:25', 2, 1, '21'),
(126, 3, 'commented on your post', '2023-05-01 15:34:51', 2, 1, '21'),
(127, 3, 'unliked your post !', '2023-05-01 15:48:53', 2, 1, '21'),
(128, 3, 'liked your post !', '2023-05-01 15:48:53', 2, 1, '21'),
(129, 3, 'unliked your post !', '2023-05-01 15:48:55', 2, 1, '21'),
(130, 3, 'liked your post !', '2023-05-01 15:48:55', 2, 1, '21'),
(131, 3, 'unliked your post !', '2023-05-01 15:48:58', 2, 1, '21'),
(132, 3, 'liked your post !', '2023-05-01 15:48:58', 2, 1, '21'),
(133, 3, 'unliked your post !', '2023-05-01 15:48:59', 2, 1, '21'),
(134, 3, 'liked your post !', '2023-05-01 15:49:00', 2, 1, '21'),
(135, 3, 'unliked your post !', '2023-05-01 15:49:02', 2, 1, '21'),
(136, 2, 'Unfollowed you !', '2023-05-01 17:04:23', 1, 1, '0'),
(137, 2, 'started following you !', '2023-05-01 17:04:27', 1, 1, '0'),
(138, 2, 'blocked you', '2023-05-01 17:04:32', 1, 1, '0'),
(139, 2, 'Unblocked you !', '2023-05-01 17:04:35', 1, 1, '0'),
(140, 2, 'blocked you', '2023-05-01 17:04:37', 1, 1, '0'),
(141, 2, 'Unblocked you !', '2023-05-01 17:04:38', 1, 1, '0'),
(142, 2, 'blocked you', '2023-05-01 17:04:44', 1, 1, '0'),
(143, 2, 'Unblocked you !', '2023-05-01 17:06:28', 1, 1, '0'),
(144, 3, 'started following you !', '2023-05-01 17:07:27', 1, 1, '0'),
(145, 3, 'Unfollowed you !', '2023-05-01 17:07:36', 1, 1, '0'),
(146, 3, 'started following you !', '2023-05-01 17:07:41', 1, 1, '0'),
(147, 2, 'started following you !', '2023-05-01 17:08:32', 1, 1, '0'),
(148, 2, 'Unfollowed you !', '2023-05-01 17:12:58', 1, 1, '0'),
(149, 2, 'started following you !', '2023-05-01 17:13:03', 1, 1, '0'),
(150, 3, 'liked your post !', '2023-05-01 17:17:48', 1, 1, '21'),
(151, 3, 'commented on your post', '2023-05-01 17:17:58', 1, 1, '21'),
(152, 2, 'Unfollowed you !', '2023-05-01 17:23:23', 1, 1, '0'),
(153, 2, 'started following you !', '2023-05-01 17:23:33', 1, 1, '0'),
(154, 2, 'blocked you', '2023-05-01 17:32:17', 1, 1, '0'),
(155, 3, 'blocked you', '2023-05-01 17:33:10', 1, 1, '0'),
(156, 3, 'Unblocked you !', '2023-05-01 17:33:12', 1, 1, '0'),
(157, 3, 'started following you !', '2023-05-01 17:42:49', 1, 1, '0'),
(158, 3, 'blocked you', '2023-05-01 17:42:52', 1, 1, '0'),
(159, 2, 'Unfollowed you !', '2023-05-01 17:44:32', 3, 1, '0'),
(160, 2, 'started following you !', '2023-05-01 17:44:35', 3, 1, '0'),
(161, 2, 'Unfollowed you !', '2023-05-01 17:45:53', 3, 1, '0'),
(162, 3, 'Unblocked you !', '2023-05-01 17:50:31', 1, 1, '0'),
(163, 1, 'started following you !', '2023-05-01 17:50:50', 3, 1, '0'),
(164, 2, 'started following you !', '2023-05-01 17:51:44', 3, 1, '0'),
(165, 1, 'Unfollowed you !', '2023-05-01 17:52:29', 3, 1, '0'),
(166, 3, 'started following you !', '2023-05-01 17:52:55', 1, 1, '0'),
(167, 1, 'started following you !', '2023-05-01 17:53:42', 3, 1, '0'),
(168, 3, 'Unfollowed you !', '2023-05-02 05:37:12', 1, 1, '0'),
(169, 3, 'blocked you', '2023-05-02 05:38:02', 1, 1, '0'),
(170, 3, 'Unblocked you !', '2023-05-02 05:38:05', 1, 1, '0'),
(171, 1, 'started following you !', '2023-05-02 06:07:32', 3, 1, '0'),
(172, 3, 'started following you !', '2023-05-02 06:09:52', 1, 1, '0'),
(173, 3, 'Unfollowed you !', '2023-05-02 06:15:46', 1, 1, '0'),
(174, 1, 'liked your post !', '2023-05-02 06:24:37', 3, 1, '23'),
(175, 3, 'started following you !', '2023-05-02 06:28:47', 1, 1, '0'),
(176, 1, 'blocked you', '2023-05-02 06:36:31', 3, 1, '0'),
(177, 1, 'Unblocked you !', '2023-05-02 14:19:05', 3, 1, '0'),
(178, 1, 'started following you !', '2023-05-02 14:19:09', 3, 1, '0'),
(179, 2, 'Unblocked you !', '2023-05-03 08:41:45', 1, 1, '0'),
(180, 1, 'started following you !', '2023-05-03 09:20:25', 2, 1, '0'),
(181, 3, 'started following you !', '2023-05-03 09:24:36', 1, 0, '0'),
(182, 3, 'blocked you', '2023-05-03 09:24:41', 1, 0, '0'),
(183, 2, 'started following you !', '2023-05-04 05:08:55', 1, 1, '0'),
(184, 2, 'blocked you', '2023-05-04 05:09:08', 1, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`) VALUES
(15, 1, '1682594608icon.png', 'First', '2023-04-27 11:23:28'),
(17, 1, '16826876681638244233bot.png', 'ola', '2023-04-28 13:14:28'),
(24, 3, '1683103197download (2).jpg', '123', '2023-05-03 08:39:57'),
(25, 2, '16831056561637829203bot.png', 'xwde', '2023-05-03 09:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default_profile.jpg',
  `university_id` int(11) NOT NULL,
  `cell_no` int(11) NOT NULL,
  `blood_group` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL COMMENT '0=NV, active= 1, blocked=2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `university_id`, `cell_no`, `blood_group`, `created_at`, `updated_at`, `ac_status`) VALUES
(1, 'Mahmudul', 'Hasan', 1, 'ratcyrat.mh123@gmail.com', 'ratcy', '202cb962ac59075b964b07152d234b70', '1681853142wa8px9tfvbg71.jpg', 0, 0, '', '2023-04-17 20:43:01', '2023-05-04 05:11:06', 1),
(2, 'Rafin', 'Haque', 1, 'mratul201198@bscse.uiu.ac.bd', '123', '202cb962ac59075b964b07152d234b70', 'default_profile.jpg', 0, 0, '', '2023-04-27 15:22:42', '2023-05-03 09:19:59', 1),
(3, 'Mahfuz', 'Rahman', 1, 'agbnahid1936@gmail.com', 'nahid', '202cb962ac59075b964b07152d234b70', 'default_profile.jpg', 0, 0, '', '2023-05-01 14:47:47', '2023-05-02 16:56:51', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_comments`
--
ALTER TABLE `club_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_follow_list`
--
ALTER TABLE `club_follow_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `club_likes`
--
ALTER TABLE `club_likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `club_comments`
--
ALTER TABLE `club_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_follow_list`
--
ALTER TABLE `club_follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club_likes`
--
ALTER TABLE `club_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
