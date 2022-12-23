-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 23, 2022 lúc 04:19 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `forex`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_setting`
--

CREATE TABLE `admin_setting` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `plain_value` longtext NOT NULL,
  `type_input` tinyint(4) NOT NULL,
  `type_data` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposits`
--

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `license` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_affiliate`
--

CREATE TABLE `event_affiliate` (
  `id` int(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` int(191) NOT NULL,
  `content` text DEFAULT NULL,
  `reward` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_affiliate_rank`
--

CREATE TABLE `event_affiliate_rank` (
  `id` int(20) NOT NULL,
  `event_affiliate_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `count_referal` bigint(20) NOT NULL DEFAULT 0,
  `bonus` double NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_master`
--

CREATE TABLE `event_master` (
  `id` int(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `reward` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_master_rank`
--

CREATE TABLE `event_master_rank` (
  `id` int(20) NOT NULL,
  `event_master_id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `count_signal` bigint(20) NOT NULL DEFAULT 0,
  `rate` double NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_social`
--

CREATE TABLE `event_social` (
  `id` int(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `order_free` int(11) NOT NULL,
  `expired_at` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event_social_reply`
--

CREATE TABLE `event_social_reply` (
  `id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `event_social_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exchanges`
--

CREATE TABLE `exchanges` (
  `id` bigint(20) NOT NULL,
  `admin_id` bigint(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL,
  `vote` bigint(20) NOT NULL,
  `rate` double NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `exchanges_vote`
--

CREATE TABLE `exchanges_vote` (
  `id` bigint(11) NOT NULL,
  `exchange_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `rate` double NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follows`
--

CREATE TABLE `follows` (
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `expired_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `follows`
--

INSERT INTO `follows` (`from_user_id`, `to_user_id`, `expired_at`, `created_at`, `updated_at`) VALUES
(7, 3, '2023-01-20', NULL, NULL),
(7, 5, '2023-01-20', NULL, NULL),
(7, 6, '2023-01-20', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(20) NOT NULL,
  `admin_id` int(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(20) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_highlight` tinyint(4) NOT NULL DEFAULT 0,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_advise`
--

CREATE TABLE `news_advise` (
  `id` int(20) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `avatar` varchar(191) NOT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_highlight` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news_category`
--

CREATE TABLE `news_category` (
  `id` bigint(20) NOT NULL,
  `title` int(11) NOT NULL,
  `slug` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_free`
--

CREATE TABLE `order_free` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expired_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_packages`
--

CREATE TABLE `order_packages` (
  `id` int(20) NOT NULL,
  `package_id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `price` int(11) NOT NULL,
  `expired_days` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_to_signal`
--

CREATE TABLE `order_to_signal` (
  `order_id` int(11) NOT NULL,
  `signal_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `promotion_follow` float NOT NULL,
  `order_free` int(11) NOT NULL,
  `expired_order_free` tinyint(4) NOT NULL,
  `date_use` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `register_master`
--

CREATE TABLE `register_master` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `info` longtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `register_master`
--

INSERT INTO `register_master` (`id`, `admin_id`, `user_id`, `info`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 3, '{\"number_identity_card\": \"221435463\", \"name_identity_card\": \"TRAN VAN TRUONG\", \"image_identity_card\": [\"image1\", \"image2\"]}', 1, '2022-12-20 19:58:48', '2022-12-20 21:18:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `signals`
--

CREATE TABLE `signals` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `tag` char(191) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `content` longtext NOT NULL,
  `gallery` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `result` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `signals`
--

INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(1, NULL, 3, 'tag3', 'Tin hieu 3', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-21 01:53:09', '2022-12-22 00:52:15'),
(2, NULL, 5, 'tag3', 'Tin hieu 5', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-21 01:53:09', '2022-12-22 00:52:15'),
(3, NULL, 6, 'tag3', 'Tin hieu 6', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-21 01:53:09', '2022-12-22 00:52:15'),
(4, NULL, 3, 'tag3', 'Tin hieu 3', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-21 01:53:59', '2022-12-22 00:52:15'),
(5, NULL, 5, 'tag3', 'Tin hieu 5', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-21 01:53:59', '2022-12-22 00:52:15'),
(6, NULL, 6, 'tag3', 'Tin hieu 6', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-21 01:53:59', '2022-12-22 00:52:15'),
(7, NULL, 3, 'tag3', 'Tin hieu 7', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(8, NULL, 5, 'tag3', 'Tin hieu 7', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(9, NULL, 6, 'tag3', 'Tin hieu 7', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(10, NULL, 3, 'tag3', 'Tin hieu 8', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(11, NULL, 5, 'tag3', 'Tin hieu 8', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(12, NULL, 6, 'tag3', 'Tin hieu 8', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(13, NULL, 3, 'tag3', 'Tin hieu 9', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(14, NULL, 5, 'tag3', 'Tin hieu 9', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(15, NULL, 6, 'tag3', 'Tin hieu 9', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(16, NULL, 3, 'tag3', 'Tin hieu 10', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(17, NULL, 5, 'tag3', 'Tin hieu 10', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(18, NULL, 6, 'tag3', 'Tin hieu 10', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(19, NULL, 3, 'tag3', 'Tin hieu 11', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(20, NULL, 5, 'tag3', 'Tin hieu 11', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(21, NULL, 6, 'tag3', 'Tin hieu 11', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(22, NULL, 3, 'tag3', 'Tin hieu 12', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(23, NULL, 5, 'tag3', 'Tin hieu 12', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(24, NULL, 6, 'tag3', 'Tin hieu 12', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(25, NULL, 3, 'tag3', 'Tin hieu 13', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(26, NULL, 5, 'tag3', 'Tin hieu 13', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(27, NULL, 6, 'tag3', 'Tin hieu 13', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(28, NULL, 3, 'tag3', 'Tin hieu 14', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(29, NULL, 5, 'tag3', 'Tin hieu 14', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:38', '2022-12-22 00:52:15'),
(30, NULL, 6, 'tag3', 'Tin hieu 14', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(31, NULL, 3, 'tag3', 'Tin hieu 15', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(32, NULL, 5, 'tag3', 'Tin hieu 15', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(33, NULL, 6, 'tag3', 'Tin hieu 15', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(34, NULL, 3, 'tag3', 'Tin hieu 16', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(35, NULL, 5, 'tag3', 'Tin hieu 16', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(36, NULL, 6, 'tag3', 'Tin hieu 16', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(37, NULL, 3, 'tag3', 'Tin hieu 17', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(38, NULL, 5, 'tag3', 'Tin hieu 17', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(39, NULL, 6, 'tag3', 'Tin hieu 17', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(40, NULL, 3, 'tag3', 'Tin hieu 18', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(41, NULL, 5, 'tag3', 'Tin hieu 18', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(42, NULL, 6, 'tag3', 'Tin hieu 18', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(43, NULL, 3, 'tag3', 'Tin hieu 19', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(44, NULL, 5, 'tag3', 'Tin hieu 19', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(45, NULL, 6, 'tag3', 'Tin hieu 19', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(46, NULL, 3, 'tag3', 'Tin hieu 20', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(47, NULL, 5, 'tag3', 'Tin hieu 20', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(48, NULL, 6, 'tag3', 'Tin hieu 20', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(49, NULL, 3, 'tag3', 'Tin hieu 21', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(50, NULL, 5, 'tag3', 'Tin hieu 21', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(51, NULL, 6, 'tag3', 'Tin hieu 21', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(52, NULL, 3, 'tag3', 'Tin hieu 22', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(53, NULL, 5, 'tag3', 'Tin hieu 22', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(54, NULL, 6, 'tag3', 'Tin hieu 22', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(55, NULL, 3, 'tag3', 'Tin hieu 23', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(56, NULL, 5, 'tag3', 'Tin hieu 23', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(57, NULL, 6, 'tag3', 'Tin hieu 23', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(58, NULL, 3, 'tag3', 'Tin hieu 24', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(59, NULL, 5, 'tag3', 'Tin hieu 24', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(60, NULL, 6, 'tag3', 'Tin hieu 24', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(61, NULL, 3, 'tag3', 'Tin hieu 25', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(62, NULL, 5, 'tag3', 'Tin hieu 25', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(63, NULL, 6, 'tag3', 'Tin hieu 25', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(64, NULL, 3, 'tag3', 'Tin hieu 26', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(65, NULL, 5, 'tag3', 'Tin hieu 26', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(66, NULL, 6, 'tag3', 'Tin hieu 26', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(67, NULL, 3, 'tag3', 'Tin hieu 27', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(68, NULL, 5, 'tag3', 'Tin hieu 27', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(69, NULL, 6, 'tag3', 'Tin hieu 27', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(70, NULL, 3, 'tag3', 'Tin hieu 28', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(71, NULL, 5, 'tag3', 'Tin hieu 28', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(72, NULL, 6, 'tag3', 'Tin hieu 28', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(73, NULL, 3, 'tag3', 'Tin hieu 29', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(74, NULL, 5, 'tag3', 'Tin hieu 29', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(75, NULL, 6, 'tag3', 'Tin hieu 29', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(76, NULL, 3, 'tag3', 'Tin hieu 30', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(77, NULL, 5, 'tag3', 'Tin hieu 30', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(78, NULL, 6, 'tag3', 'Tin hieu 30', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(79, NULL, 3, 'tag3', 'Tin hieu 31', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(80, NULL, 5, 'tag3', 'Tin hieu 31', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(81, NULL, 6, 'tag3', 'Tin hieu 31', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(82, NULL, 3, 'tag3', 'Tin hieu 32', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(83, NULL, 5, 'tag3', 'Tin hieu 32', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(84, NULL, 6, 'tag3', 'Tin hieu 32', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(85, NULL, 3, 'tag3', 'Tin hieu 33', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(86, NULL, 5, 'tag3', 'Tin hieu 33', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(87, NULL, 6, 'tag3', 'Tin hieu 33', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(88, NULL, 3, 'tag3', 'Tin hieu 34', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(89, NULL, 5, 'tag3', 'Tin hieu 34', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(90, NULL, 6, 'tag3', 'Tin hieu 34', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(91, NULL, 3, 'tag3', 'Tin hieu 35', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(92, NULL, 5, 'tag3', 'Tin hieu 35', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(93, NULL, 6, 'tag3', 'Tin hieu 35', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(94, NULL, 3, 'tag3', 'Tin hieu 36', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(95, NULL, 5, 'tag3', 'Tin hieu 36', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(96, NULL, 6, 'tag3', 'Tin hieu 36', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(97, NULL, 3, 'tag3', 'Tin hieu 37', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(98, NULL, 5, 'tag3', 'Tin hieu 37', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(99, NULL, 6, 'tag3', 'Tin hieu 37', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(100, NULL, 3, 'tag3', 'Tin hieu 38', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(101, NULL, 5, 'tag3', 'Tin hieu 38', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(102, NULL, 6, 'tag3', 'Tin hieu 38', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(103, NULL, 3, 'tag3', 'Tin hieu 39', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(104, NULL, 5, 'tag3', 'Tin hieu 39', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(105, NULL, 6, 'tag3', 'Tin hieu 39', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(106, NULL, 3, 'tag3', 'Tin hieu 40', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(107, NULL, 5, 'tag3', 'Tin hieu 40', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(108, NULL, 6, 'tag3', 'Tin hieu 40', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(109, NULL, 3, 'tag3', 'Tin hieu 41', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(110, NULL, 5, 'tag3', 'Tin hieu 41', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(111, NULL, 6, 'tag3', 'Tin hieu 41', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(112, NULL, 3, 'tag3', 'Tin hieu 42', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(113, NULL, 5, 'tag3', 'Tin hieu 42', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(114, NULL, 6, 'tag3', 'Tin hieu 42', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(115, NULL, 3, 'tag3', 'Tin hieu 43', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(116, NULL, 5, 'tag3', 'Tin hieu 43', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(117, NULL, 6, 'tag3', 'Tin hieu 43', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(118, NULL, 3, 'tag3', 'Tin hieu 44', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(119, NULL, 5, 'tag3', 'Tin hieu 44', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(120, NULL, 6, 'tag3', 'Tin hieu 44', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(121, NULL, 3, 'tag3', 'Tin hieu 45', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(122, NULL, 5, 'tag3', 'Tin hieu 45', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(123, NULL, 6, 'tag3', 'Tin hieu 45', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(124, NULL, 3, 'tag3', 'Tin hieu 46', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(125, NULL, 5, 'tag3', 'Tin hieu 46', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(126, NULL, 6, 'tag3', 'Tin hieu 46', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(127, NULL, 3, 'tag3', 'Tin hieu 47', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(128, NULL, 5, 'tag3', 'Tin hieu 47', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(129, NULL, 6, 'tag3', 'Tin hieu 47', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(130, NULL, 3, 'tag3', 'Tin hieu 48', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(131, NULL, 5, 'tag3', 'Tin hieu 48', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(132, NULL, 6, 'tag3', 'Tin hieu 48', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(133, NULL, 3, 'tag3', 'Tin hieu 49', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(134, NULL, 5, 'tag3', 'Tin hieu 49', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(135, NULL, 6, 'tag3', 'Tin hieu 49', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(136, NULL, 3, 'tag3', 'Tin hieu 50', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(137, NULL, 5, 'tag3', 'Tin hieu 50', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(138, NULL, 6, 'tag3', 'Tin hieu 50', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(139, NULL, 3, 'tag3', 'Tin hieu 51', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(140, NULL, 5, 'tag3', 'Tin hieu 51', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(141, NULL, 6, 'tag3', 'Tin hieu 51', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(142, NULL, 3, 'tag3', 'Tin hieu 52', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(143, NULL, 5, 'tag3', 'Tin hieu 52', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(144, NULL, 6, 'tag3', 'Tin hieu 52', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(145, NULL, 3, 'tag3', 'Tin hieu 53', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(146, NULL, 5, 'tag3', 'Tin hieu 53', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(147, NULL, 6, 'tag3', 'Tin hieu 53', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(148, NULL, 3, 'tag3', 'Tin hieu 54', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(149, NULL, 5, 'tag3', 'Tin hieu 54', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(150, NULL, 6, 'tag3', 'Tin hieu 54', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(151, NULL, 3, 'tag3', 'Tin hieu 55', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(152, NULL, 5, 'tag3', 'Tin hieu 55', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(153, NULL, 6, 'tag3', 'Tin hieu 55', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(154, NULL, 3, 'tag3', 'Tin hieu 56', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(155, NULL, 5, 'tag3', 'Tin hieu 56', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(156, NULL, 6, 'tag3', 'Tin hieu 56', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(157, NULL, 3, 'tag3', 'Tin hieu 57', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(158, NULL, 5, 'tag3', 'Tin hieu 57', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(159, NULL, 6, 'tag3', 'Tin hieu 57', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(160, NULL, 3, 'tag3', 'Tin hieu 58', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(161, NULL, 5, 'tag3', 'Tin hieu 58', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(162, NULL, 6, 'tag3', 'Tin hieu 58', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:16'),
(163, NULL, 3, 'tag3', 'Tin hieu 59', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(164, NULL, 5, 'tag3', 'Tin hieu 59', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(165, NULL, 6, 'tag3', 'Tin hieu 59', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(166, NULL, 3, 'tag3', 'Tin hieu 60', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(167, NULL, 5, 'tag3', 'Tin hieu 60', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(168, NULL, 6, 'tag3', 'Tin hieu 60', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(169, NULL, 3, 'tag3', 'Tin hieu 61', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(170, NULL, 5, 'tag3', 'Tin hieu 61', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(171, NULL, 6, 'tag3', 'Tin hieu 61', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(172, NULL, 3, 'tag3', 'Tin hieu 62', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(173, NULL, 5, 'tag3', 'Tin hieu 62', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(174, NULL, 6, 'tag3', 'Tin hieu 62', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(175, NULL, 3, 'tag3', 'Tin hieu 63', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(176, NULL, 5, 'tag3', 'Tin hieu 63', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(177, NULL, 6, 'tag3', 'Tin hieu 63', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(178, NULL, 3, 'tag3', 'Tin hieu 64', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(179, NULL, 5, 'tag3', 'Tin hieu 64', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(180, NULL, 6, 'tag3', 'Tin hieu 64', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(181, NULL, 3, 'tag3', 'Tin hieu 65', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(182, NULL, 5, 'tag3', 'Tin hieu 65', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(183, NULL, 6, 'tag3', 'Tin hieu 65', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(184, NULL, 3, 'tag3', 'Tin hieu 66', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(185, NULL, 5, 'tag3', 'Tin hieu 66', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(186, NULL, 6, 'tag3', 'Tin hieu 66', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(187, NULL, 3, 'tag3', 'Tin hieu 67', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(188, NULL, 5, 'tag3', 'Tin hieu 67', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(189, NULL, 6, 'tag3', 'Tin hieu 67', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(190, NULL, 3, 'tag3', 'Tin hieu 68', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(191, NULL, 5, 'tag3', 'Tin hieu 68', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(192, NULL, 6, 'tag3', 'Tin hieu 68', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(193, NULL, 3, 'tag3', 'Tin hieu 69', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(194, NULL, 5, 'tag3', 'Tin hieu 69', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(195, NULL, 6, 'tag3', 'Tin hieu 69', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(196, NULL, 3, 'tag3', 'Tin hieu 70', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(197, NULL, 5, 'tag3', 'Tin hieu 70', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(198, NULL, 6, 'tag3', 'Tin hieu 70', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(199, NULL, 3, 'tag3', 'Tin hieu 71', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(200, NULL, 5, 'tag3', 'Tin hieu 71', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(201, NULL, 6, 'tag6', 'Tin hieu 71', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(202, NULL, 3, 'tag6', 'Tin hieu 72', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(203, NULL, 5, 'tag6', 'Tin hieu 72', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(204, NULL, 6, 'tag6', 'Tin hieu 72', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(205, NULL, 3, 'tag6', 'Tin hieu 73', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(206, NULL, 5, 'tag6', 'Tin hieu 73', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(207, NULL, 6, 'tag6', 'Tin hieu 73', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(208, NULL, 3, 'tag6', 'Tin hieu 74', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:39', '2022-12-22 00:52:17'),
(209, NULL, 5, 'tag6', 'Tin hieu 74', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(210, NULL, 6, 'tag6', 'Tin hieu 74', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(211, NULL, 3, 'tag6', 'Tin hieu 75', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(212, NULL, 5, 'tag6', 'Tin hieu 75', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(213, NULL, 6, 'tag6', 'Tin hieu 75', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(214, NULL, 3, 'tag6', 'Tin hieu 76', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(215, NULL, 5, 'tag6', 'Tin hieu 76', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(216, NULL, 6, 'tag6', 'Tin hieu 76', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(217, NULL, 3, 'tag6', 'Tin hieu 77', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(218, NULL, 5, 'tag6', 'Tin hieu 77', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(219, NULL, 6, 'tag6', 'Tin hieu 77', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(220, NULL, 3, 'tag6', 'Tin hieu 78', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(221, NULL, 5, 'tag6', 'Tin hieu 78', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(222, NULL, 6, 'tag6', 'Tin hieu 78', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(223, NULL, 3, 'tag6', 'Tin hieu 79', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(224, NULL, 5, 'tag6', 'Tin hieu 79', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(225, NULL, 6, 'tag6', 'Tin hieu 79', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(226, NULL, 3, 'tag6', 'Tin hieu 80', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(227, NULL, 5, 'tag6', 'Tin hieu 80', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(228, NULL, 6, 'tag6', 'Tin hieu 80', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(229, NULL, 3, 'tag6', 'Tin hieu 81', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(230, NULL, 5, 'tag6', 'Tin hieu 81', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(231, NULL, 6, 'tag6', 'Tin hieu 81', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(232, NULL, 3, 'tag6', 'Tin hieu 82', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(233, NULL, 5, 'tag6', 'Tin hieu 82', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(234, NULL, 6, 'tag6', 'Tin hieu 82', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(235, NULL, 3, 'tag6', 'Tin hieu 83', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(236, NULL, 5, 'tag6', 'Tin hieu 83', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(237, NULL, 6, 'tag6', 'Tin hieu 83', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(238, NULL, 3, 'tag6', 'Tin hieu 84', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(239, NULL, 5, 'tag6', 'Tin hieu 84', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(240, NULL, 6, 'tag6', 'Tin hieu 84', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(241, NULL, 3, 'tag6', 'Tin hieu 85', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(242, NULL, 5, 'tag6', 'Tin hieu 85', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(243, NULL, 6, 'tag6', 'Tin hieu 85', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(244, NULL, 3, 'tag6', 'Tin hieu 86', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(245, NULL, 5, 'tag6', 'Tin hieu 86', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(246, NULL, 6, 'tag6', 'Tin hieu 86', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(247, NULL, 3, 'tag6', 'Tin hieu 87', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(248, NULL, 5, 'tag6', 'Tin hieu 87', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(249, NULL, 6, 'tag6', 'Tin hieu 87', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(250, NULL, 3, 'tag6', 'Tin hieu 88', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(251, NULL, 5, 'tag6', 'Tin hieu 88', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(252, NULL, 6, 'tag6', 'Tin hieu 88', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(253, NULL, 3, 'tag6', 'Tin hieu 89', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(254, NULL, 5, 'tag6', 'Tin hieu 89', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(255, NULL, 6, 'tag6', 'Tin hieu 89', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(256, NULL, 3, 'tag6', 'Tin hieu 90', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(257, NULL, 5, 'tag6', 'Tin hieu 90', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(258, NULL, 6, 'tag6', 'Tin hieu 90', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(259, NULL, 3, 'tag6', 'Tin hieu 91', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(260, NULL, 5, 'tag6', 'Tin hieu 91', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(261, NULL, 6, 'tag6', 'Tin hieu 91', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(262, NULL, 3, 'tag6', 'Tin hieu 92', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(263, NULL, 5, 'tag6', 'Tin hieu 92', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(264, NULL, 6, 'tag6', 'Tin hieu 92', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(265, NULL, 3, 'tag6', 'Tin hieu 93', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(266, NULL, 5, 'tag6', 'Tin hieu 93', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(267, NULL, 6, 'tag6', 'Tin hieu 93', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(268, NULL, 3, 'tag6', 'Tin hieu 94', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(269, NULL, 5, 'tag6', 'Tin hieu 94', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(270, NULL, 6, 'tag6', 'Tin hieu 94', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(271, NULL, 3, 'tag6', 'Tin hieu 95', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(272, NULL, 5, 'tag6', 'Tin hieu 95', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(273, NULL, 6, 'tag6', 'Tin hieu 95', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(274, NULL, 3, 'tag6', 'Tin hieu 96', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(275, NULL, 5, 'tag6', 'Tin hieu 96', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(276, NULL, 6, 'tag6', 'Tin hieu 96', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(277, NULL, 3, 'tag6', 'Tin hieu 97', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(278, NULL, 5, 'tag6', 'Tin hieu 97', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(279, NULL, 6, 'tag6', 'Tin hieu 97', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(280, NULL, 3, 'tag6', 'Tin hieu 98', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(281, NULL, 5, 'tag6', 'Tin hieu 98', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(282, NULL, 6, 'tag6', 'Tin hieu 98', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(283, NULL, 3, 'tag6', 'Tin hieu 99', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(284, NULL, 5, 'tag6', 'Tin hieu 99', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(285, NULL, 6, 'tag6', 'Tin hieu 99', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(286, NULL, 3, 'tag6', 'Tin hieu 100', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(287, NULL, 5, 'tag6', 'Tin hieu 100', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(288, NULL, 6, 'tag6', 'Tin hieu 100', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(289, NULL, 3, 'tag6', 'Tin hieu 101', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(290, NULL, 5, 'tag6', 'Tin hieu 101', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(291, NULL, 6, 'tag6', 'Tin hieu 101', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(292, NULL, 3, 'tag6', 'Tin hieu 102', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(293, NULL, 5, 'tag6', 'Tin hieu 102', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(294, NULL, 6, 'tag6', 'Tin hieu 102', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(295, NULL, 3, 'tag6', 'Tin hieu 103', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(296, NULL, 5, 'tag6', 'Tin hieu 103', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(297, NULL, 6, 'tag6', 'Tin hieu 103', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(298, NULL, 3, 'tag6', 'Tin hieu 104', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(299, NULL, 5, 'tag6', 'Tin hieu 104', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(300, NULL, 6, 'tag6', 'Tin hieu 104', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(301, NULL, 3, 'tag6', 'Tin hieu 105', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(302, NULL, 5, 'tag6', 'Tin hieu 105', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(303, NULL, 6, 'tag6', 'Tin hieu 105', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(304, NULL, 3, 'tag6', 'Tin hieu 106', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(305, NULL, 5, 'tag6', 'Tin hieu 106', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(306, NULL, 6, 'tag6', 'Tin hieu 106', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(307, NULL, 3, 'tag6', 'Tin hieu 107', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(308, NULL, 5, 'tag6', 'Tin hieu 107', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(309, NULL, 6, 'tag6', 'Tin hieu 107', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(310, NULL, 3, 'tag6', 'Tin hieu 108', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(311, NULL, 5, 'tag6', 'Tin hieu 108', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(312, NULL, 6, 'tag6', 'Tin hieu 108', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(313, NULL, 3, 'tag6', 'Tin hieu 109', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(314, NULL, 5, 'tag6', 'Tin hieu 109', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(315, NULL, 6, 'tag6', 'Tin hieu 109', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:17'),
(316, NULL, 3, 'tag6', 'Tin hieu 110', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(317, NULL, 5, 'tag6', 'Tin hieu 110', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(318, NULL, 6, 'tag6', 'Tin hieu 110', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(319, NULL, 3, 'tag6', 'Tin hieu 111', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(320, NULL, 5, 'tag6', 'Tin hieu 111', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(321, NULL, 6, 'tag6', 'Tin hieu 111', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(322, NULL, 3, 'tag6', 'Tin hieu 112', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(323, NULL, 5, 'tag6', 'Tin hieu 112', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(324, NULL, 6, 'tag6', 'Tin hieu 112', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(325, NULL, 3, 'tag6', 'Tin hieu 113', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(326, NULL, 5, 'tag6', 'Tin hieu 113', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(327, NULL, 6, 'tag6', 'Tin hieu 113', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(328, NULL, 3, 'tag6', 'Tin hieu 114', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(329, NULL, 5, 'tag6', 'Tin hieu 114', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(330, NULL, 6, 'tag6', 'Tin hieu 114', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(331, NULL, 3, 'tag6', 'Tin hieu 115', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(332, NULL, 5, 'tag6', 'Tin hieu 115', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(333, NULL, 6, 'tag6', 'Tin hieu 115', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(334, NULL, 3, 'tag6', 'Tin hieu 116', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(335, NULL, 5, 'tag6', 'Tin hieu 116', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(336, NULL, 6, 'tag6', 'Tin hieu 116', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(337, NULL, 3, 'tag6', 'Tin hieu 117', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(338, NULL, 5, 'tag6', 'Tin hieu 117', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(339, NULL, 6, 'tag6', 'Tin hieu 117', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(340, NULL, 3, 'tag6', 'Tin hieu 118', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(341, NULL, 5, 'tag6', 'Tin hieu 118', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(342, NULL, 6, 'tag6', 'Tin hieu 118', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(343, NULL, 3, 'tag6', 'Tin hieu 119', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(344, NULL, 5, 'tag6', 'Tin hieu 119', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(345, NULL, 6, 'tag6', 'Tin hieu 119', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(346, NULL, 3, 'tag6', 'Tin hieu 120', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(347, NULL, 5, 'tag6', 'Tin hieu 120', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(348, NULL, 6, 'tag6', 'Tin hieu 120', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(349, NULL, 3, 'tag6', 'Tin hieu 121', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(350, NULL, 5, 'tag6', 'Tin hieu 121', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(351, NULL, 6, 'tag6', 'Tin hieu 121', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(352, NULL, 3, 'tag6', 'Tin hieu 122', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(353, NULL, 5, 'tag6', 'Tin hieu 122', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(354, NULL, 6, 'tag6', 'Tin hieu 122', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(355, NULL, 3, 'tag6', 'Tin hieu 123', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(356, NULL, 5, 'tag6', 'Tin hieu 123', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(357, NULL, 6, 'tag6', 'Tin hieu 123', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(358, NULL, 3, 'tag6', 'Tin hieu 124', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(359, NULL, 5, 'tag6', 'Tin hieu 124', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(360, NULL, 6, 'tag6', 'Tin hieu 124', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(361, NULL, 3, 'tag6', 'Tin hieu 125', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(362, NULL, 5, 'tag6', 'Tin hieu 125', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(363, NULL, 6, 'tag6', 'Tin hieu 125', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(364, NULL, 3, 'tag6', 'Tin hieu 126', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(365, NULL, 5, 'tag6', 'Tin hieu 126', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(366, NULL, 6, 'tag6', 'Tin hieu 126', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(367, NULL, 3, 'tag6', 'Tin hieu 127', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(368, NULL, 5, 'tag6', 'Tin hieu 127', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(369, NULL, 6, 'tag6', 'Tin hieu 127', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(370, NULL, 3, 'tag6', 'Tin hieu 128', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(371, NULL, 5, 'tag6', 'Tin hieu 128', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(372, NULL, 6, 'tag6', 'Tin hieu 128', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(373, NULL, 3, 'tag6', 'Tin hieu 129', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(374, NULL, 5, 'tag6', 'Tin hieu 129', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(375, NULL, 6, 'tag6', 'Tin hieu 129', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(376, NULL, 3, 'tag6', 'Tin hieu 130', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(377, NULL, 5, 'tag6', 'Tin hieu 130', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(378, NULL, 6, 'tag6', 'Tin hieu 130', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(379, NULL, 3, 'tag6', 'Tin hieu 131', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(380, NULL, 5, 'tag6', 'Tin hieu 131', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(381, NULL, 6, 'tag6', 'Tin hieu 131', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(382, NULL, 3, 'tag6', 'Tin hieu 132', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(383, NULL, 5, 'tag6', 'Tin hieu 132', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(384, NULL, 6, 'tag6', 'Tin hieu 132', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(385, NULL, 3, 'tag6', 'Tin hieu 133', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(386, NULL, 5, 'tag6', 'Tin hieu 133', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(387, NULL, 6, 'tag6', 'Tin hieu 133', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(388, NULL, 3, 'tag6', 'Tin hieu 134', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(389, NULL, 5, 'tag6', 'Tin hieu 134', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(390, NULL, 6, 'tag6', 'Tin hieu 134', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(391, NULL, 3, 'tag6', 'Tin hieu 135', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(392, NULL, 5, 'tag6', 'Tin hieu 135', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(393, NULL, 6, 'tag6', 'Tin hieu 135', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(394, NULL, 3, 'tag6', 'Tin hieu 136', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:40', '2022-12-22 00:52:18'),
(395, NULL, 5, 'tag6', 'Tin hieu 136', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(396, NULL, 6, 'tag6', 'Tin hieu 136', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(397, NULL, 3, 'tag6', 'Tin hieu 137', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(398, NULL, 5, 'tag6', 'Tin hieu 137', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(399, NULL, 6, 'tag6', 'Tin hieu 137', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(400, NULL, 3, 'tag6', 'Tin hieu 138', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(401, NULL, 5, 'tag3', 'Tin hieu 138', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(402, NULL, 6, 'tag3', 'Tin hieu 138', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(403, NULL, 3, 'tag3', 'Tin hieu 139', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(404, NULL, 5, 'tag3', 'Tin hieu 139', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(405, NULL, 6, 'tag3', 'Tin hieu 139', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(406, NULL, 3, 'tag3', 'Tin hieu 140', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(407, NULL, 5, 'tag3', 'Tin hieu 140', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(408, NULL, 6, 'tag3', 'Tin hieu 140', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(409, NULL, 3, 'tag3', 'Tin hieu 141', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(410, NULL, 5, 'tag3', 'Tin hieu 141', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(411, NULL, 6, 'tag3', 'Tin hieu 141', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(412, NULL, 3, 'tag3', 'Tin hieu 142', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(413, NULL, 5, 'tag3', 'Tin hieu 142', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(414, NULL, 6, 'tag3', 'Tin hieu 142', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(415, NULL, 3, 'tag3', 'Tin hieu 143', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(416, NULL, 5, 'tag3', 'Tin hieu 143', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(417, NULL, 6, 'tag3', 'Tin hieu 143', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(418, NULL, 3, 'tag3', 'Tin hieu 144', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(419, NULL, 5, 'tag3', 'Tin hieu 144', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(420, NULL, 6, 'tag3', 'Tin hieu 144', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(421, NULL, 3, 'tag3', 'Tin hieu 145', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(422, NULL, 5, 'tag3', 'Tin hieu 145', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(423, NULL, 6, 'tag3', 'Tin hieu 145', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(424, NULL, 3, 'tag3', 'Tin hieu 146', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(425, NULL, 5, 'tag3', 'Tin hieu 146', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(426, NULL, 6, 'tag3', 'Tin hieu 146', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(427, NULL, 3, 'tag3', 'Tin hieu 147', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(428, NULL, 5, 'tag3', 'Tin hieu 147', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(429, NULL, 6, 'tag3', 'Tin hieu 147', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(430, NULL, 3, 'tag3', 'Tin hieu 148', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(431, NULL, 5, 'tag3', 'Tin hieu 148', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(432, NULL, 6, 'tag3', 'Tin hieu 148', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(433, NULL, 3, 'tag3', 'Tin hieu 149', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(434, NULL, 5, 'tag3', 'Tin hieu 149', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(435, NULL, 6, 'tag3', 'Tin hieu 149', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(436, NULL, 3, 'tag3', 'Tin hieu 150', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(437, NULL, 5, 'tag3', 'Tin hieu 150', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(438, NULL, 6, 'tag3', 'Tin hieu 150', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(439, NULL, 3, 'tag3', 'Tin hieu 151', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(440, NULL, 5, 'tag3', 'Tin hieu 151', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(441, NULL, 6, 'tag3', 'Tin hieu 151', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(442, NULL, 3, 'tag3', 'Tin hieu 152', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(443, NULL, 5, 'tag3', 'Tin hieu 152', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(444, NULL, 6, 'tag3', 'Tin hieu 152', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(445, NULL, 3, 'tag3', 'Tin hieu 153', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(446, NULL, 5, 'tag3', 'Tin hieu 153', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(447, NULL, 6, 'tag3', 'Tin hieu 153', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:18'),
(448, NULL, 3, 'tag3', 'Tin hieu 154', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(449, NULL, 5, 'tag3', 'Tin hieu 154', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(450, NULL, 6, 'tag3', 'Tin hieu 154', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(451, NULL, 3, 'tag3', 'Tin hieu 155', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(452, NULL, 5, 'tag3', 'Tin hieu 155', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(453, NULL, 6, 'tag3', 'Tin hieu 155', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(454, NULL, 3, 'tag3', 'Tin hieu 156', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(455, NULL, 5, 'tag3', 'Tin hieu 156', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(456, NULL, 6, 'tag3', 'Tin hieu 156', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(457, NULL, 3, 'tag3', 'Tin hieu 157', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(458, NULL, 5, 'tag3', 'Tin hieu 157', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(459, NULL, 6, 'tag3', 'Tin hieu 157', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(460, NULL, 3, 'tag3', 'Tin hieu 158', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(461, NULL, 5, 'tag3', 'Tin hieu 158', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(462, NULL, 6, 'tag3', 'Tin hieu 158', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(463, NULL, 3, 'tag3', 'Tin hieu 159', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(464, NULL, 5, 'tag3', 'Tin hieu 159', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(465, NULL, 6, 'tag3', 'Tin hieu 159', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(466, NULL, 3, 'tag3', 'Tin hieu 160', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(467, NULL, 5, 'tag3', 'Tin hieu 160', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(468, NULL, 6, 'tag3', 'Tin hieu 160', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(469, NULL, 3, 'tag3', 'Tin hieu 161', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(470, NULL, 5, 'tag3', 'Tin hieu 161', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(471, NULL, 6, 'tag3', 'Tin hieu 161', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(472, NULL, 3, 'tag3', 'Tin hieu 162', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(473, NULL, 5, 'tag3', 'Tin hieu 162', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(474, NULL, 6, 'tag3', 'Tin hieu 162', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(475, NULL, 3, 'tag3', 'Tin hieu 163', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(476, NULL, 5, 'tag3', 'Tin hieu 163', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(477, NULL, 6, 'tag3', 'Tin hieu 163', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(478, NULL, 3, 'tag3', 'Tin hieu 164', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(479, NULL, 5, 'tag3', 'Tin hieu 164', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(480, NULL, 6, 'tag3', 'Tin hieu 164', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(481, NULL, 3, 'tag3', 'Tin hieu 165', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(482, NULL, 5, 'tag3', 'Tin hieu 165', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(483, NULL, 6, 'tag3', 'Tin hieu 165', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(484, NULL, 3, 'tag3', 'Tin hieu 166', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(485, NULL, 5, 'tag3', 'Tin hieu 166', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(486, NULL, 6, 'tag3', 'Tin hieu 166', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(487, NULL, 3, 'tag3', 'Tin hieu 167', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(488, NULL, 5, 'tag3', 'Tin hieu 167', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(489, NULL, 6, 'tag3', 'Tin hieu 167', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(490, NULL, 3, 'tag3', 'Tin hieu 168', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(491, NULL, 5, 'tag3', 'Tin hieu 168', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(492, NULL, 6, 'tag3', 'Tin hieu 168', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(493, NULL, 3, 'tag3', 'Tin hieu 169', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(494, NULL, 5, 'tag3', 'Tin hieu 169', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(495, NULL, 6, 'tag3', 'Tin hieu 169', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(496, NULL, 3, 'tag3', 'Tin hieu 170', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(497, NULL, 5, 'tag3', 'Tin hieu 170', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(498, NULL, 6, 'tag3', 'Tin hieu 170', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(499, NULL, 3, 'tag3', 'Tin hieu 171', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(500, NULL, 5, 'tag3', 'Tin hieu 171', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(501, NULL, 6, 'tag3', 'Tin hieu 171', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(502, NULL, 3, 'tag3', 'Tin hieu 172', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(503, NULL, 5, 'tag3', 'Tin hieu 172', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(504, NULL, 6, 'tag3', 'Tin hieu 172', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(505, NULL, 3, 'tag3', 'Tin hieu 173', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(506, NULL, 5, 'tag3', 'Tin hieu 173', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(507, NULL, 6, 'tag3', 'Tin hieu 173', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(508, NULL, 3, 'tag3', 'Tin hieu 174', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(509, NULL, 5, 'tag3', 'Tin hieu 174', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(510, NULL, 6, 'tag3', 'Tin hieu 174', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(511, NULL, 3, 'tag3', 'Tin hieu 175', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(512, NULL, 5, 'tag3', 'Tin hieu 175', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(513, NULL, 6, 'tag3', 'Tin hieu 175', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(514, NULL, 3, 'tag3', 'Tin hieu 176', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(515, NULL, 5, 'tag3', 'Tin hieu 176', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(516, NULL, 6, 'tag3', 'Tin hieu 176', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(517, NULL, 3, 'tag3', 'Tin hieu 177', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(518, NULL, 5, 'tag3', 'Tin hieu 177', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(519, NULL, 6, 'tag3', 'Tin hieu 177', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(520, NULL, 3, 'tag3', 'Tin hieu 178', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(521, NULL, 5, 'tag3', 'Tin hieu 178', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(522, NULL, 6, 'tag3', 'Tin hieu 178', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(523, NULL, 3, 'tag3', 'Tin hieu 179', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(524, NULL, 5, 'tag3', 'Tin hieu 179', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(525, NULL, 6, 'tag3', 'Tin hieu 179', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(526, NULL, 3, 'tag3', 'Tin hieu 180', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(527, NULL, 5, 'tag3', 'Tin hieu 180', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(528, NULL, 6, 'tag3', 'Tin hieu 180', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(529, NULL, 3, 'tag3', 'Tin hieu 181', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(530, NULL, 5, 'tag3', 'Tin hieu 181', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(531, NULL, 6, 'tag3', 'Tin hieu 181', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(532, NULL, 3, 'tag3', 'Tin hieu 182', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(533, NULL, 5, 'tag3', 'Tin hieu 182', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(534, NULL, 6, 'tag3', 'Tin hieu 182', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(535, NULL, 3, 'tag3', 'Tin hieu 183', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(536, NULL, 5, 'tag3', 'Tin hieu 183', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(537, NULL, 6, 'tag3', 'Tin hieu 183', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(538, NULL, 3, 'tag3', 'Tin hieu 184', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(539, NULL, 5, 'tag3', 'Tin hieu 184', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(540, NULL, 6, 'tag3', 'Tin hieu 184', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(541, NULL, 3, 'tag3', 'Tin hieu 185', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(542, NULL, 5, 'tag3', 'Tin hieu 185', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(543, NULL, 6, 'tag3', 'Tin hieu 185', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(544, NULL, 3, 'tag3', 'Tin hieu 186', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(545, NULL, 5, 'tag3', 'Tin hieu 186', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(546, NULL, 6, 'tag3', 'Tin hieu 186', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(547, NULL, 3, 'tag3', 'Tin hieu 187', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(548, NULL, 5, 'tag3', 'Tin hieu 187', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(549, NULL, 6, 'tag3', 'Tin hieu 187', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(550, NULL, 3, 'tag3', 'Tin hieu 188', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(551, NULL, 5, 'tag3', 'Tin hieu 188', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(552, NULL, 6, 'tag3', 'Tin hieu 188', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(553, NULL, 3, 'tag3', 'Tin hieu 189', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(554, NULL, 5, 'tag3', 'Tin hieu 189', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(555, NULL, 6, 'tag3', 'Tin hieu 189', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(556, NULL, 3, 'tag3', 'Tin hieu 190', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(557, NULL, 5, 'tag3', 'Tin hieu 190', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(558, NULL, 6, 'tag3', 'Tin hieu 190', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(559, NULL, 3, 'tag3', 'Tin hieu 191', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(560, NULL, 5, 'tag3', 'Tin hieu 191', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(561, NULL, 6, 'tag3', 'Tin hieu 191', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(562, NULL, 3, 'tag3', 'Tin hieu 192', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(563, NULL, 5, 'tag3', 'Tin hieu 192', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(564, NULL, 6, 'tag3', 'Tin hieu 192', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(565, NULL, 3, 'tag3', 'Tin hieu 193', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(566, NULL, 5, 'tag3', 'Tin hieu 193', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(567, NULL, 6, 'tag3', 'Tin hieu 193', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(568, NULL, 3, 'tag3', 'Tin hieu 194', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(569, NULL, 5, 'tag3', 'Tin hieu 194', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(570, NULL, 6, 'tag3', 'Tin hieu 194', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(571, NULL, 3, 'tag3', 'Tin hieu 195', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(572, NULL, 5, 'tag3', 'Tin hieu 195', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(573, NULL, 6, 'tag3', 'Tin hieu 195', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(574, NULL, 3, 'tag3', 'Tin hieu 196', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:41', '2022-12-22 00:52:19'),
(575, NULL, 5, 'tag3', 'Tin hieu 196', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(576, NULL, 6, 'tag3', 'Tin hieu 196', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(577, NULL, 3, 'tag3', 'Tin hieu 197', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(578, NULL, 5, 'tag3', 'Tin hieu 197', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(579, NULL, 6, 'tag3', 'Tin hieu 197', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(580, NULL, 3, 'tag3', 'Tin hieu 198', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(581, NULL, 5, 'tag3', 'Tin hieu 198', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(582, NULL, 6, 'tag3', 'Tin hieu 198', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(583, NULL, 3, 'tag3', 'Tin hieu 199', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(584, NULL, 5, 'tag3', 'Tin hieu 199', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(585, NULL, 6, 'tag3', 'Tin hieu 199', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(586, NULL, 3, 'tag3', 'Tin hieu 200', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(587, NULL, 5, 'tag3', 'Tin hieu 200', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(588, NULL, 6, 'tag3', 'Tin hieu 200', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(589, NULL, 3, 'tag3', 'Tin hieu 201', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(590, NULL, 5, 'tag3', 'Tin hieu 201', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(591, NULL, 6, 'tag3', 'Tin hieu 201', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(592, NULL, 3, 'tag3', 'Tin hieu 202', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(593, NULL, 5, 'tag3', 'Tin hieu 202', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(594, NULL, 6, 'tag3', 'Tin hieu 202', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(595, NULL, 3, 'tag3', 'Tin hieu 203', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(596, NULL, 5, 'tag3', 'Tin hieu 203', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(597, NULL, 6, 'tag3', 'Tin hieu 203', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(598, NULL, 3, 'tag3', 'Tin hieu 204', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(599, NULL, 5, 'tag3', 'Tin hieu 204', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:19'),
(600, NULL, 6, 'tag3', 'Tin hieu 204', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(601, NULL, 3, 'tag4', 'Tin hieu 205', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(602, NULL, 5, 'tag4', 'Tin hieu 205', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(603, NULL, 6, 'tag4', 'Tin hieu 205', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(604, NULL, 3, 'tag4', 'Tin hieu 206', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(605, NULL, 5, 'tag4', 'Tin hieu 206', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(606, NULL, 6, 'tag4', 'Tin hieu 206', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(607, NULL, 3, 'tag4', 'Tin hieu 207', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(608, NULL, 5, 'tag4', 'Tin hieu 207', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(609, NULL, 6, 'tag4', 'Tin hieu 207', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(610, NULL, 3, 'tag4', 'Tin hieu 208', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(611, NULL, 5, 'tag4', 'Tin hieu 208', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(612, NULL, 6, 'tag4', 'Tin hieu 208', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(613, NULL, 3, 'tag4', 'Tin hieu 209', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(614, NULL, 5, 'tag4', 'Tin hieu 209', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(615, NULL, 6, 'tag4', 'Tin hieu 209', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(616, NULL, 3, 'tag4', 'Tin hieu 210', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(617, NULL, 5, 'tag4', 'Tin hieu 210', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(618, NULL, 6, 'tag4', 'Tin hieu 210', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(619, NULL, 3, 'tag4', 'Tin hieu 211', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(620, NULL, 5, 'tag4', 'Tin hieu 211', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(621, NULL, 6, 'tag4', 'Tin hieu 211', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(622, NULL, 3, 'tag4', 'Tin hieu 212', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(623, NULL, 5, 'tag4', 'Tin hieu 212', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(624, NULL, 6, 'tag4', 'Tin hieu 212', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(625, NULL, 3, 'tag4', 'Tin hieu 213', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(626, NULL, 5, 'tag4', 'Tin hieu 213', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(627, NULL, 6, 'tag4', 'Tin hieu 213', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(628, NULL, 3, 'tag4', 'Tin hieu 214', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(629, NULL, 5, 'tag4', 'Tin hieu 214', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(630, NULL, 6, 'tag4', 'Tin hieu 214', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(631, NULL, 3, 'tag4', 'Tin hieu 215', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(632, NULL, 5, 'tag4', 'Tin hieu 215', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(633, NULL, 6, 'tag4', 'Tin hieu 215', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(634, NULL, 3, 'tag4', 'Tin hieu 216', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(635, NULL, 5, 'tag4', 'Tin hieu 216', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(636, NULL, 6, 'tag4', 'Tin hieu 216', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(637, NULL, 3, 'tag4', 'Tin hieu 217', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(638, NULL, 5, 'tag4', 'Tin hieu 217', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(639, NULL, 6, 'tag4', 'Tin hieu 217', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(640, NULL, 3, 'tag4', 'Tin hieu 218', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(641, NULL, 5, 'tag4', 'Tin hieu 218', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(642, NULL, 6, 'tag4', 'Tin hieu 218', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(643, NULL, 3, 'tag4', 'Tin hieu 219', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(644, NULL, 5, 'tag4', 'Tin hieu 219', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(645, NULL, 6, 'tag4', 'Tin hieu 219', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(646, NULL, 3, 'tag4', 'Tin hieu 220', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(647, NULL, 5, 'tag4', 'Tin hieu 220', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(648, NULL, 6, 'tag4', 'Tin hieu 220', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(649, NULL, 3, 'tag4', 'Tin hieu 221', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(650, NULL, 5, 'tag4', 'Tin hieu 221', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(651, NULL, 6, 'tag4', 'Tin hieu 221', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(652, NULL, 3, 'tag4', 'Tin hieu 222', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(653, NULL, 5, 'tag4', 'Tin hieu 222', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(654, NULL, 6, 'tag4', 'Tin hieu 222', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(655, NULL, 3, 'tag4', 'Tin hieu 223', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(656, NULL, 5, 'tag4', 'Tin hieu 223', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(657, NULL, 6, 'tag4', 'Tin hieu 223', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(658, NULL, 3, 'tag4', 'Tin hieu 224', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(659, NULL, 5, 'tag4', 'Tin hieu 224', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(660, NULL, 6, 'tag4', 'Tin hieu 224', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(661, NULL, 3, 'tag4', 'Tin hieu 225', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(662, NULL, 5, 'tag4', 'Tin hieu 225', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(663, NULL, 6, 'tag4', 'Tin hieu 225', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(664, NULL, 3, 'tag4', 'Tin hieu 226', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(665, NULL, 5, 'tag4', 'Tin hieu 226', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(666, NULL, 6, 'tag4', 'Tin hieu 226', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(667, NULL, 3, 'tag4', 'Tin hieu 227', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(668, NULL, 5, 'tag4', 'Tin hieu 227', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(669, NULL, 6, 'tag4', 'Tin hieu 227', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(670, NULL, 3, 'tag4', 'Tin hieu 228', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(671, NULL, 5, 'tag4', 'Tin hieu 228', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(672, NULL, 6, 'tag4', 'Tin hieu 228', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(673, NULL, 3, 'tag4', 'Tin hieu 229', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(674, NULL, 5, 'tag4', 'Tin hieu 229', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(675, NULL, 6, 'tag4', 'Tin hieu 229', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(676, NULL, 3, 'tag4', 'Tin hieu 230', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(677, NULL, 5, 'tag4', 'Tin hieu 230', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(678, NULL, 6, 'tag4', 'Tin hieu 230', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(679, NULL, 3, 'tag4', 'Tin hieu 231', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(680, NULL, 5, 'tag4', 'Tin hieu 231', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(681, NULL, 6, 'tag4', 'Tin hieu 231', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(682, NULL, 3, 'tag4', 'Tin hieu 232', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(683, NULL, 5, 'tag4', 'Tin hieu 232', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(684, NULL, 6, 'tag4', 'Tin hieu 232', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(685, NULL, 3, 'tag4', 'Tin hieu 233', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(686, NULL, 5, 'tag4', 'Tin hieu 233', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(687, NULL, 6, 'tag4', 'Tin hieu 233', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(688, NULL, 3, 'tag4', 'Tin hieu 234', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(689, NULL, 5, 'tag4', 'Tin hieu 234', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(690, NULL, 6, 'tag4', 'Tin hieu 234', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(691, NULL, 3, 'tag4', 'Tin hieu 235', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(692, NULL, 5, 'tag4', 'Tin hieu 235', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(693, NULL, 6, 'tag4', 'Tin hieu 235', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(694, NULL, 3, 'tag4', 'Tin hieu 236', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(695, NULL, 5, 'tag4', 'Tin hieu 236', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(696, NULL, 6, 'tag4', 'Tin hieu 236', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(697, NULL, 3, 'tag4', 'Tin hieu 237', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(698, NULL, 5, 'tag4', 'Tin hieu 237', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(699, NULL, 6, 'tag4', 'Tin hieu 237', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(700, NULL, 3, 'tag4', 'Tin hieu 238', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(701, NULL, 5, 'tag4', 'Tin hieu 238', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(702, NULL, 6, 'tag4', 'Tin hieu 238', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(703, NULL, 3, 'tag4', 'Tin hieu 239', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(704, NULL, 5, 'tag4', 'Tin hieu 239', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(705, NULL, 6, 'tag4', 'Tin hieu 239', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(706, NULL, 3, 'tag4', 'Tin hieu 240', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(707, NULL, 5, 'tag4', 'Tin hieu 240', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(708, NULL, 6, 'tag4', 'Tin hieu 240', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(709, NULL, 3, 'tag4', 'Tin hieu 241', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(710, NULL, 5, 'tag4', 'Tin hieu 241', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(711, NULL, 6, 'tag4', 'Tin hieu 241', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(712, NULL, 3, 'tag4', 'Tin hieu 242', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(713, NULL, 5, 'tag4', 'Tin hieu 242', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(714, NULL, 6, 'tag4', 'Tin hieu 242', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(715, NULL, 3, 'tag4', 'Tin hieu 243', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(716, NULL, 5, 'tag4', 'Tin hieu 243', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(717, NULL, 6, 'tag4', 'Tin hieu 243', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(718, NULL, 3, 'tag4', 'Tin hieu 244', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(719, NULL, 5, 'tag4', 'Tin hieu 244', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(720, NULL, 6, 'tag4', 'Tin hieu 244', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(721, NULL, 3, 'tag4', 'Tin hieu 245', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(722, NULL, 5, 'tag4', 'Tin hieu 245', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(723, NULL, 6, 'tag4', 'Tin hieu 245', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(724, NULL, 3, 'tag4', 'Tin hieu 246', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(725, NULL, 5, 'tag4', 'Tin hieu 246', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(726, NULL, 6, 'tag4', 'Tin hieu 246', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(727, NULL, 3, 'tag4', 'Tin hieu 247', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(728, NULL, 5, 'tag4', 'Tin hieu 247', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(729, NULL, 6, 'tag4', 'Tin hieu 247', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(730, NULL, 3, 'tag4', 'Tin hieu 248', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(731, NULL, 5, 'tag4', 'Tin hieu 248', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(732, NULL, 6, 'tag4', 'Tin hieu 248', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(733, NULL, 3, 'tag4', 'Tin hieu 249', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(734, NULL, 5, 'tag4', 'Tin hieu 249', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(735, NULL, 6, 'tag4', 'Tin hieu 249', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(736, NULL, 3, 'tag4', 'Tin hieu 250', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(737, NULL, 5, 'tag4', 'Tin hieu 250', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(738, NULL, 6, 'tag4', 'Tin hieu 250', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(739, NULL, 3, 'tag4', 'Tin hieu 251', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(740, NULL, 5, 'tag4', 'Tin hieu 251', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(741, NULL, 6, 'tag4', 'Tin hieu 251', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(742, NULL, 3, 'tag4', 'Tin hieu 252', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(743, NULL, 5, 'tag4', 'Tin hieu 252', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(744, NULL, 6, 'tag4', 'Tin hieu 252', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(745, NULL, 3, 'tag4', 'Tin hieu 253', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(746, NULL, 5, 'tag4', 'Tin hieu 253', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(747, NULL, 6, 'tag4', 'Tin hieu 253', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(748, NULL, 3, 'tag4', 'Tin hieu 254', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(749, NULL, 5, 'tag4', 'Tin hieu 254', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(750, NULL, 6, 'tag4', 'Tin hieu 254', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(751, NULL, 3, 'tag4', 'Tin hieu 255', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(752, NULL, 5, 'tag4', 'Tin hieu 255', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(753, NULL, 6, 'tag4', 'Tin hieu 255', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(754, NULL, 3, 'tag4', 'Tin hieu 256', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(755, NULL, 5, 'tag4', 'Tin hieu 256', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(756, NULL, 6, 'tag4', 'Tin hieu 256', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:20'),
(757, NULL, 3, 'tag4', 'Tin hieu 257', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:21'),
(758, NULL, 5, 'tag4', 'Tin hieu 257', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:42', '2022-12-22 00:52:21'),
(759, NULL, 6, 'tag4', 'Tin hieu 257', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(760, NULL, 3, 'tag4', 'Tin hieu 258', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(761, NULL, 5, 'tag4', 'Tin hieu 258', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(762, NULL, 6, 'tag4', 'Tin hieu 258', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(763, NULL, 3, 'tag4', 'Tin hieu 259', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(764, NULL, 5, 'tag4', 'Tin hieu 259', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(765, NULL, 6, 'tag4', 'Tin hieu 259', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(766, NULL, 3, 'tag4', 'Tin hieu 260', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(767, NULL, 5, 'tag4', 'Tin hieu 260', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(768, NULL, 6, 'tag4', 'Tin hieu 260', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(769, NULL, 3, 'tag4', 'Tin hieu 261', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(770, NULL, 5, 'tag4', 'Tin hieu 261', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(771, NULL, 6, 'tag4', 'Tin hieu 261', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(772, NULL, 3, 'tag4', 'Tin hieu 262', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(773, NULL, 5, 'tag4', 'Tin hieu 262', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(774, NULL, 6, 'tag4', 'Tin hieu 262', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(775, NULL, 3, 'tag4', 'Tin hieu 263', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(776, NULL, 5, 'tag4', 'Tin hieu 263', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(777, NULL, 6, 'tag4', 'Tin hieu 263', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(778, NULL, 3, 'tag4', 'Tin hieu 264', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(779, NULL, 5, 'tag4', 'Tin hieu 264', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(780, NULL, 6, 'tag4', 'Tin hieu 264', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(781, NULL, 3, 'tag4', 'Tin hieu 265', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(782, NULL, 5, 'tag4', 'Tin hieu 265', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(783, NULL, 6, 'tag4', 'Tin hieu 265', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(784, NULL, 3, 'tag4', 'Tin hieu 266', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(785, NULL, 5, 'tag4', 'Tin hieu 266', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(786, NULL, 6, 'tag4', 'Tin hieu 266', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(787, NULL, 3, 'tag4', 'Tin hieu 267', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(788, NULL, 5, 'tag4', 'Tin hieu 267', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(789, NULL, 6, 'tag4', 'Tin hieu 267', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(790, NULL, 3, 'tag4', 'Tin hieu 268', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(791, NULL, 5, 'tag4', 'Tin hieu 268', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(792, NULL, 6, 'tag4', 'Tin hieu 268', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(793, NULL, 3, 'tag4', 'Tin hieu 269', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(794, NULL, 5, 'tag4', 'Tin hieu 269', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(795, NULL, 6, 'tag4', 'Tin hieu 269', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(796, NULL, 3, 'tag4', 'Tin hieu 270', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(797, NULL, 5, 'tag4', 'Tin hieu 270', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(798, NULL, 6, 'tag4', 'Tin hieu 270', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(799, NULL, 3, 'tag4', 'Tin hieu 271', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(800, NULL, 5, 'tag4', 'Tin hieu 271', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(801, NULL, 6, 'tag2', 'Tin hieu 271', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(802, NULL, 3, 'tag2', 'Tin hieu 272', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(803, NULL, 5, 'tag2', 'Tin hieu 272', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(804, NULL, 6, 'tag2', 'Tin hieu 272', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(805, NULL, 3, 'tag2', 'Tin hieu 273', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(806, NULL, 5, 'tag2', 'Tin hieu 273', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(807, NULL, 6, 'tag2', 'Tin hieu 273', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(808, NULL, 3, 'tag2', 'Tin hieu 274', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(809, NULL, 5, 'tag2', 'Tin hieu 274', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(810, NULL, 6, 'tag2', 'Tin hieu 274', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(811, NULL, 3, 'tag2', 'Tin hieu 275', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(812, NULL, 5, 'tag2', 'Tin hieu 275', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(813, NULL, 6, 'tag2', 'Tin hieu 275', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(814, NULL, 3, 'tag2', 'Tin hieu 276', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(815, NULL, 5, 'tag2', 'Tin hieu 276', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(816, NULL, 6, 'tag2', 'Tin hieu 276', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(817, NULL, 3, 'tag2', 'Tin hieu 277', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(818, NULL, 5, 'tag2', 'Tin hieu 277', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(819, NULL, 6, 'tag2', 'Tin hieu 277', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(820, NULL, 3, 'tag2', 'Tin hieu 278', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(821, NULL, 5, 'tag2', 'Tin hieu 278', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(822, NULL, 6, 'tag2', 'Tin hieu 278', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(823, NULL, 3, 'tag2', 'Tin hieu 279', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(824, NULL, 5, 'tag2', 'Tin hieu 279', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(825, NULL, 6, 'tag2', 'Tin hieu 279', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(826, NULL, 3, 'tag2', 'Tin hieu 280', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(827, NULL, 5, 'tag2', 'Tin hieu 280', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(828, NULL, 6, 'tag2', 'Tin hieu 280', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(829, NULL, 3, 'tag2', 'Tin hieu 281', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(830, NULL, 5, 'tag2', 'Tin hieu 281', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(831, NULL, 6, 'tag2', 'Tin hieu 281', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(832, NULL, 3, 'tag2', 'Tin hieu 282', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(833, NULL, 5, 'tag2', 'Tin hieu 282', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(834, NULL, 6, 'tag2', 'Tin hieu 282', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(835, NULL, 3, 'tag2', 'Tin hieu 283', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(836, NULL, 5, 'tag2', 'Tin hieu 283', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(837, NULL, 6, 'tag2', 'Tin hieu 283', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(838, NULL, 3, 'tag2', 'Tin hieu 284', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(839, NULL, 5, 'tag2', 'Tin hieu 284', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(840, NULL, 6, 'tag2', 'Tin hieu 284', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(841, NULL, 3, 'tag2', 'Tin hieu 285', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(842, NULL, 5, 'tag2', 'Tin hieu 285', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(843, NULL, 6, 'tag2', 'Tin hieu 285', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(844, NULL, 3, 'tag2', 'Tin hieu 286', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(845, NULL, 5, 'tag2', 'Tin hieu 286', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(846, NULL, 6, 'tag2', 'Tin hieu 286', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(847, NULL, 3, 'tag2', 'Tin hieu 287', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(848, NULL, 5, 'tag2', 'Tin hieu 287', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(849, NULL, 6, 'tag2', 'Tin hieu 287', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(850, NULL, 3, 'tag2', 'Tin hieu 288', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(851, NULL, 5, 'tag2', 'Tin hieu 288', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(852, NULL, 6, 'tag2', 'Tin hieu 288', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(853, NULL, 3, 'tag2', 'Tin hieu 289', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(854, NULL, 5, 'tag2', 'Tin hieu 289', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(855, NULL, 6, 'tag2', 'Tin hieu 289', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(856, NULL, 3, 'tag2', 'Tin hieu 290', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(857, NULL, 5, 'tag2', 'Tin hieu 290', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(858, NULL, 6, 'tag2', 'Tin hieu 290', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(859, NULL, 3, 'tag2', 'Tin hieu 291', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(860, NULL, 5, 'tag2', 'Tin hieu 291', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(861, NULL, 6, 'tag2', 'Tin hieu 291', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(862, NULL, 3, 'tag2', 'Tin hieu 292', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(863, NULL, 5, 'tag2', 'Tin hieu 292', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(864, NULL, 6, 'tag2', 'Tin hieu 292', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(865, NULL, 3, 'tag2', 'Tin hieu 293', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(866, NULL, 5, 'tag2', 'Tin hieu 293', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(867, NULL, 6, 'tag2', 'Tin hieu 293', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(868, NULL, 3, 'tag2', 'Tin hieu 294', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(869, NULL, 5, 'tag2', 'Tin hieu 294', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(870, NULL, 6, 'tag2', 'Tin hieu 294', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(871, NULL, 3, 'tag2', 'Tin hieu 295', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(872, NULL, 5, 'tag2', 'Tin hieu 295', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(873, NULL, 6, 'tag2', 'Tin hieu 295', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(874, NULL, 3, 'tag2', 'Tin hieu 296', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(875, NULL, 5, 'tag2', 'Tin hieu 296', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(876, NULL, 6, 'tag2', 'Tin hieu 296', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(877, NULL, 3, 'tag2', 'Tin hieu 297', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(878, NULL, 5, 'tag2', 'Tin hieu 297', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(879, NULL, 6, 'tag2', 'Tin hieu 297', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(880, NULL, 3, 'tag2', 'Tin hieu 298', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(881, NULL, 5, 'tag2', 'Tin hieu 298', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(882, NULL, 6, 'tag2', 'Tin hieu 298', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(883, NULL, 3, 'tag2', 'Tin hieu 299', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(884, NULL, 5, 'tag2', 'Tin hieu 299', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(885, NULL, 6, 'tag2', 'Tin hieu 299', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(886, NULL, 3, 'tag2', 'Tin hieu 300', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(887, NULL, 5, 'tag2', 'Tin hieu 300', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(888, NULL, 6, 'tag2', 'Tin hieu 300', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(889, NULL, 3, 'tag2', 'Tin hieu 301', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(890, NULL, 5, 'tag2', 'Tin hieu 301', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(891, NULL, 6, 'tag2', 'Tin hieu 301', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(892, NULL, 3, 'tag2', 'Tin hieu 302', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(893, NULL, 5, 'tag2', 'Tin hieu 302', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(894, NULL, 6, 'tag2', 'Tin hieu 302', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(895, NULL, 3, 'tag2', 'Tin hieu 303', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(896, NULL, 5, 'tag2', 'Tin hieu 303', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(897, NULL, 6, 'tag2', 'Tin hieu 303', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(898, NULL, 3, 'tag2', 'Tin hieu 304', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(899, NULL, 5, 'tag2', 'Tin hieu 304', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(900, NULL, 6, 'tag2', 'Tin hieu 304', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(901, NULL, 3, 'tag2', 'Tin hieu 305', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(902, NULL, 5, 'tag2', 'Tin hieu 305', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(903, NULL, 6, 'tag2', 'Tin hieu 305', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(904, NULL, 3, 'tag2', 'Tin hieu 306', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(905, NULL, 5, 'tag2', 'Tin hieu 306', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(906, NULL, 6, 'tag2', 'Tin hieu 306', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(907, NULL, 3, 'tag2', 'Tin hieu 307', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(908, NULL, 5, 'tag2', 'Tin hieu 307', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(909, NULL, 6, 'tag2', 'Tin hieu 307', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(910, NULL, 3, 'tag2', 'Tin hieu 308', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:21'),
(911, NULL, 5, 'tag2', 'Tin hieu 308', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(912, NULL, 6, 'tag2', 'Tin hieu 308', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(913, NULL, 3, 'tag2', 'Tin hieu 309', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(914, NULL, 5, 'tag2', 'Tin hieu 309', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(915, NULL, 6, 'tag2', 'Tin hieu 309', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(916, NULL, 3, 'tag2', 'Tin hieu 310', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(917, NULL, 5, 'tag2', 'Tin hieu 310', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(918, NULL, 6, 'tag2', 'Tin hieu 310', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(919, NULL, 3, 'tag2', 'Tin hieu 311', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(920, NULL, 5, 'tag2', 'Tin hieu 311', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(921, NULL, 6, 'tag2', 'Tin hieu 311', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(922, NULL, 3, 'tag2', 'Tin hieu 312', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(923, NULL, 5, 'tag2', 'Tin hieu 312', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(924, NULL, 6, 'tag2', 'Tin hieu 312', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(925, NULL, 3, 'tag2', 'Tin hieu 313', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(926, NULL, 5, 'tag2', 'Tin hieu 313', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(927, NULL, 6, 'tag2', 'Tin hieu 313', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(928, NULL, 3, 'tag2', 'Tin hieu 314', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(929, NULL, 5, 'tag2', 'Tin hieu 314', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(930, NULL, 6, 'tag2', 'Tin hieu 314', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(931, NULL, 3, 'tag2', 'Tin hieu 315', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(932, NULL, 5, 'tag2', 'Tin hieu 315', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(933, NULL, 6, 'tag2', 'Tin hieu 315', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(934, NULL, 3, 'tag2', 'Tin hieu 316', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(935, NULL, 5, 'tag2', 'Tin hieu 316', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(936, NULL, 6, 'tag2', 'Tin hieu 316', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(937, NULL, 3, 'tag2', 'Tin hieu 317', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(938, NULL, 5, 'tag2', 'Tin hieu 317', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(939, NULL, 6, 'tag2', 'Tin hieu 317', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(940, NULL, 3, 'tag2', 'Tin hieu 318', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(941, NULL, 5, 'tag2', 'Tin hieu 318', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:43', '2022-12-22 00:52:22'),
(942, NULL, 6, 'tag2', 'Tin hieu 318', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(943, NULL, 3, 'tag2', 'Tin hieu 319', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(944, NULL, 5, 'tag2', 'Tin hieu 319', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(945, NULL, 6, 'tag2', 'Tin hieu 319', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(946, NULL, 3, 'tag2', 'Tin hieu 320', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(947, NULL, 5, 'tag2', 'Tin hieu 320', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(948, NULL, 6, 'tag2', 'Tin hieu 320', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(949, NULL, 3, 'tag2', 'Tin hieu 321', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(950, NULL, 5, 'tag2', 'Tin hieu 321', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(951, NULL, 6, 'tag2', 'Tin hieu 321', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(952, NULL, 3, 'tag2', 'Tin hieu 322', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(953, NULL, 5, 'tag2', 'Tin hieu 322', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(954, NULL, 6, 'tag2', 'Tin hieu 322', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(955, NULL, 3, 'tag2', 'Tin hieu 323', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(956, NULL, 5, 'tag2', 'Tin hieu 323', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(957, NULL, 6, 'tag2', 'Tin hieu 323', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(958, NULL, 3, 'tag2', 'Tin hieu 324', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(959, NULL, 5, 'tag2', 'Tin hieu 324', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(960, NULL, 6, 'tag2', 'Tin hieu 324', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(961, NULL, 3, 'tag2', 'Tin hieu 325', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(962, NULL, 5, 'tag2', 'Tin hieu 325', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(963, NULL, 6, 'tag2', 'Tin hieu 325', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(964, NULL, 3, 'tag2', 'Tin hieu 326', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(965, NULL, 5, 'tag2', 'Tin hieu 326', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(966, NULL, 6, 'tag2', 'Tin hieu 326', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(967, NULL, 3, 'tag2', 'Tin hieu 327', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(968, NULL, 5, 'tag2', 'Tin hieu 327', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(969, NULL, 6, 'tag2', 'Tin hieu 327', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(970, NULL, 3, 'tag2', 'Tin hieu 328', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(971, NULL, 5, 'tag2', 'Tin hieu 328', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(972, NULL, 6, 'tag2', 'Tin hieu 328', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(973, NULL, 3, 'tag2', 'Tin hieu 329', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(974, NULL, 5, 'tag2', 'Tin hieu 329', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(975, NULL, 6, 'tag2', 'Tin hieu 329', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(976, NULL, 3, 'tag2', 'Tin hieu 330', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(977, NULL, 5, 'tag2', 'Tin hieu 330', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(978, NULL, 6, 'tag2', 'Tin hieu 330', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(979, NULL, 3, 'tag2', 'Tin hieu 331', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(980, NULL, 5, 'tag2', 'Tin hieu 331', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(981, NULL, 6, 'tag2', 'Tin hieu 331', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(982, NULL, 3, 'tag2', 'Tin hieu 332', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(983, NULL, 5, 'tag2', 'Tin hieu 332', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(984, NULL, 6, 'tag2', 'Tin hieu 332', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(985, NULL, 3, 'tag2', 'Tin hieu 333', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(986, NULL, 5, 'tag2', 'Tin hieu 333', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(987, NULL, 6, 'tag2', 'Tin hieu 333', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(988, NULL, 3, 'tag2', 'Tin hieu 334', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(989, NULL, 5, 'tag2', 'Tin hieu 334', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(990, NULL, 6, 'tag2', 'Tin hieu 334', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(991, NULL, 3, 'tag2', 'Tin hieu 335', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(992, NULL, 5, 'tag2', 'Tin hieu 335', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(993, NULL, 6, 'tag2', 'Tin hieu 335', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(994, NULL, 3, 'tag2', 'Tin hieu 336', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(995, NULL, 5, 'tag2', 'Tin hieu 336', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(996, NULL, 6, 'tag2', 'Tin hieu 336', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(997, NULL, 3, 'tag2', 'Tin hieu 337', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(998, NULL, 5, 'tag2', 'Tin hieu 337', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(999, NULL, 6, 'tag2', 'Tin hieu 337', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1000, NULL, 3, 'tag2', 'Tin hieu 338', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1001, NULL, 5, 'tag1', 'Tin hieu 338', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1002, NULL, 6, 'tag1', 'Tin hieu 338', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1003, NULL, 3, 'tag1', 'Tin hieu 339', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1004, NULL, 5, 'tag1', 'Tin hieu 339', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1005, NULL, 6, 'tag1', 'Tin hieu 339', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1006, NULL, 3, 'tag1', 'Tin hieu 340', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1007, NULL, 5, 'tag1', 'Tin hieu 340', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1008, NULL, 6, 'tag1', 'Tin hieu 340', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1009, NULL, 3, 'tag1', 'Tin hieu 341', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1010, NULL, 5, 'tag1', 'Tin hieu 341', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1011, NULL, 6, 'tag1', 'Tin hieu 341', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1012, NULL, 3, 'tag1', 'Tin hieu 342', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1013, NULL, 5, 'tag1', 'Tin hieu 342', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1014, NULL, 6, 'tag1', 'Tin hieu 342', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1015, NULL, 3, 'tag1', 'Tin hieu 343', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1016, NULL, 5, 'tag1', 'Tin hieu 343', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1017, NULL, 6, 'tag1', 'Tin hieu 343', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1018, NULL, 3, 'tag1', 'Tin hieu 344', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1019, NULL, 5, 'tag1', 'Tin hieu 344', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1020, NULL, 6, 'tag1', 'Tin hieu 344', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1021, NULL, 3, 'tag1', 'Tin hieu 345', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1022, NULL, 5, 'tag1', 'Tin hieu 345', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1023, NULL, 6, 'tag1', 'Tin hieu 345', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1024, NULL, 3, 'tag1', 'Tin hieu 346', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1025, NULL, 5, 'tag1', 'Tin hieu 346', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1026, NULL, 6, 'tag1', 'Tin hieu 346', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1027, NULL, 3, 'tag1', 'Tin hieu 347', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1028, NULL, 5, 'tag1', 'Tin hieu 347', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1029, NULL, 6, 'tag1', 'Tin hieu 347', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1030, NULL, 3, 'tag1', 'Tin hieu 348', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1031, NULL, 5, 'tag1', 'Tin hieu 348', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1032, NULL, 6, 'tag1', 'Tin hieu 348', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1033, NULL, 3, 'tag1', 'Tin hieu 349', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1034, NULL, 5, 'tag1', 'Tin hieu 349', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1035, NULL, 6, 'tag1', 'Tin hieu 349', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1036, NULL, 3, 'tag1', 'Tin hieu 350', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1037, NULL, 5, 'tag1', 'Tin hieu 350', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1038, NULL, 6, 'tag1', 'Tin hieu 350', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1039, NULL, 3, 'tag1', 'Tin hieu 351', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1040, NULL, 5, 'tag1', 'Tin hieu 351', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1041, NULL, 6, 'tag1', 'Tin hieu 351', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1042, NULL, 3, 'tag1', 'Tin hieu 352', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1043, NULL, 5, 'tag1', 'Tin hieu 352', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1044, NULL, 6, 'tag1', 'Tin hieu 352', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1045, NULL, 3, 'tag1', 'Tin hieu 353', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1046, NULL, 5, 'tag1', 'Tin hieu 353', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1047, NULL, 6, 'tag1', 'Tin hieu 353', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1048, NULL, 3, 'tag1', 'Tin hieu 354', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1049, NULL, 5, 'tag1', 'Tin hieu 354', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1050, NULL, 6, 'tag1', 'Tin hieu 354', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1051, NULL, 3, 'tag1', 'Tin hieu 355', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1052, NULL, 5, 'tag1', 'Tin hieu 355', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1053, NULL, 6, 'tag1', 'Tin hieu 355', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1054, NULL, 3, 'tag1', 'Tin hieu 356', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1055, NULL, 5, 'tag1', 'Tin hieu 356', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1056, NULL, 6, 'tag1', 'Tin hieu 356', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1057, NULL, 3, 'tag1', 'Tin hieu 357', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1058, NULL, 5, 'tag1', 'Tin hieu 357', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1059, NULL, 6, 'tag1', 'Tin hieu 357', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1060, NULL, 3, 'tag1', 'Tin hieu 358', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1061, NULL, 5, 'tag1', 'Tin hieu 358', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1062, NULL, 6, 'tag1', 'Tin hieu 358', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1063, NULL, 3, 'tag1', 'Tin hieu 359', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:22'),
(1064, NULL, 5, 'tag1', 'Tin hieu 359', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1065, NULL, 6, 'tag1', 'Tin hieu 359', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1066, NULL, 3, 'tag1', 'Tin hieu 360', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1067, NULL, 5, 'tag1', 'Tin hieu 360', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1068, NULL, 6, 'tag1', 'Tin hieu 360', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1069, NULL, 3, 'tag1', 'Tin hieu 361', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1070, NULL, 5, 'tag1', 'Tin hieu 361', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1071, NULL, 6, 'tag1', 'Tin hieu 361', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1072, NULL, 3, 'tag1', 'Tin hieu 362', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1073, NULL, 5, 'tag1', 'Tin hieu 362', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1074, NULL, 6, 'tag1', 'Tin hieu 362', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1075, NULL, 3, 'tag1', 'Tin hieu 363', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1076, NULL, 5, 'tag1', 'Tin hieu 363', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1077, NULL, 6, 'tag1', 'Tin hieu 363', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1078, NULL, 3, 'tag1', 'Tin hieu 364', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1079, NULL, 5, 'tag1', 'Tin hieu 364', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1080, NULL, 6, 'tag1', 'Tin hieu 364', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1081, NULL, 3, 'tag1', 'Tin hieu 365', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1082, NULL, 5, 'tag1', 'Tin hieu 365', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1083, NULL, 6, 'tag1', 'Tin hieu 365', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1084, NULL, 3, 'tag1', 'Tin hieu 366', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1085, NULL, 5, 'tag1', 'Tin hieu 366', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1086, NULL, 6, 'tag1', 'Tin hieu 366', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1087, NULL, 3, 'tag1', 'Tin hieu 367', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1088, NULL, 5, 'tag1', 'Tin hieu 367', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1089, NULL, 6, 'tag1', 'Tin hieu 367', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1090, NULL, 3, 'tag1', 'Tin hieu 368', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1091, NULL, 5, 'tag1', 'Tin hieu 368', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1092, NULL, 6, 'tag1', 'Tin hieu 368', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1093, NULL, 3, 'tag1', 'Tin hieu 369', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1094, NULL, 5, 'tag1', 'Tin hieu 369', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1095, NULL, 6, 'tag1', 'Tin hieu 369', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1096, NULL, 3, 'tag1', 'Tin hieu 370', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1097, NULL, 5, 'tag1', 'Tin hieu 370', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1098, NULL, 6, 'tag1', 'Tin hieu 370', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1099, NULL, 3, 'tag1', 'Tin hieu 371', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1100, NULL, 5, 'tag1', 'Tin hieu 371', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1101, NULL, 6, 'tag1', 'Tin hieu 371', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1102, NULL, 3, 'tag1', 'Tin hieu 372', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1103, NULL, 5, 'tag1', 'Tin hieu 372', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1104, NULL, 6, 'tag1', 'Tin hieu 372', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1105, NULL, 3, 'tag1', 'Tin hieu 373', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1106, NULL, 5, 'tag1', 'Tin hieu 373', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1107, NULL, 6, 'tag1', 'Tin hieu 373', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1108, NULL, 3, 'tag1', 'Tin hieu 374', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1109, NULL, 5, 'tag1', 'Tin hieu 374', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1110, NULL, 6, 'tag1', 'Tin hieu 374', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1111, NULL, 3, 'tag1', 'Tin hieu 375', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1112, NULL, 5, 'tag1', 'Tin hieu 375', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1113, NULL, 6, 'tag1', 'Tin hieu 375', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:44', '2022-12-22 00:52:23'),
(1114, NULL, 3, 'tag1', 'Tin hieu 376', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1115, NULL, 5, 'tag1', 'Tin hieu 376', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1116, NULL, 6, 'tag1', 'Tin hieu 376', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1117, NULL, 3, 'tag1', 'Tin hieu 377', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1118, NULL, 5, 'tag1', 'Tin hieu 377', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1119, NULL, 6, 'tag1', 'Tin hieu 377', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1120, NULL, 3, 'tag1', 'Tin hieu 378', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1121, NULL, 5, 'tag1', 'Tin hieu 378', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1122, NULL, 6, 'tag1', 'Tin hieu 378', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1123, NULL, 3, 'tag1', 'Tin hieu 379', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1124, NULL, 5, 'tag1', 'Tin hieu 379', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1125, NULL, 6, 'tag1', 'Tin hieu 379', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1126, NULL, 3, 'tag1', 'Tin hieu 380', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1127, NULL, 5, 'tag1', 'Tin hieu 380', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1128, NULL, 6, 'tag1', 'Tin hieu 380', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1129, NULL, 3, 'tag1', 'Tin hieu 381', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1130, NULL, 5, 'tag1', 'Tin hieu 381', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1131, NULL, 6, 'tag1', 'Tin hieu 381', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1132, NULL, 3, 'tag1', 'Tin hieu 382', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1133, NULL, 5, 'tag1', 'Tin hieu 382', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1134, NULL, 6, 'tag1', 'Tin hieu 382', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1135, NULL, 3, 'tag1', 'Tin hieu 383', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1136, NULL, 5, 'tag1', 'Tin hieu 383', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1137, NULL, 6, 'tag1', 'Tin hieu 383', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1138, NULL, 3, 'tag1', 'Tin hieu 384', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1139, NULL, 5, 'tag1', 'Tin hieu 384', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1140, NULL, 6, 'tag1', 'Tin hieu 384', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1141, NULL, 3, 'tag1', 'Tin hieu 385', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1142, NULL, 5, 'tag1', 'Tin hieu 385', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1143, NULL, 6, 'tag1', 'Tin hieu 385', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1144, NULL, 3, 'tag1', 'Tin hieu 386', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1145, NULL, 5, 'tag1', 'Tin hieu 386', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1146, NULL, 6, 'tag1', 'Tin hieu 386', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1147, NULL, 3, 'tag1', 'Tin hieu 387', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1148, NULL, 5, 'tag1', 'Tin hieu 387', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1149, NULL, 6, 'tag1', 'Tin hieu 387', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1150, NULL, 3, 'tag1', 'Tin hieu 388', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1151, NULL, 5, 'tag1', 'Tin hieu 388', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1152, NULL, 6, 'tag1', 'Tin hieu 388', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1153, NULL, 3, 'tag1', 'Tin hieu 389', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1154, NULL, 5, 'tag1', 'Tin hieu 389', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1155, NULL, 6, 'tag1', 'Tin hieu 389', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1156, NULL, 3, 'tag1', 'Tin hieu 390', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1157, NULL, 5, 'tag1', 'Tin hieu 390', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1158, NULL, 6, 'tag1', 'Tin hieu 390', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1159, NULL, 3, 'tag1', 'Tin hieu 391', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1160, NULL, 5, 'tag1', 'Tin hieu 391', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1161, NULL, 6, 'tag1', 'Tin hieu 391', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1162, NULL, 3, 'tag1', 'Tin hieu 392', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1163, NULL, 5, 'tag1', 'Tin hieu 392', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1164, NULL, 6, 'tag1', 'Tin hieu 392', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1165, NULL, 3, 'tag1', 'Tin hieu 393', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1166, NULL, 5, 'tag1', 'Tin hieu 393', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1167, NULL, 6, 'tag1', 'Tin hieu 393', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1168, NULL, 3, 'tag1', 'Tin hieu 394', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1169, NULL, 5, 'tag1', 'Tin hieu 394', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1170, NULL, 6, 'tag1', 'Tin hieu 394', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1171, NULL, 3, 'tag1', 'Tin hieu 395', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1172, NULL, 5, 'tag1', 'Tin hieu 395', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1173, NULL, 6, 'tag1', 'Tin hieu 395', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1174, NULL, 3, 'tag1', 'Tin hieu 396', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1175, NULL, 5, 'tag1', 'Tin hieu 396', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1176, NULL, 6, 'tag1', 'Tin hieu 396', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1177, NULL, 3, 'tag1', 'Tin hieu 397', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1178, NULL, 5, 'tag1', 'Tin hieu 397', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1179, NULL, 6, 'tag1', 'Tin hieu 397', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1180, NULL, 3, 'tag1', 'Tin hieu 398', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1181, NULL, 5, 'tag1', 'Tin hieu 398', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1182, NULL, 6, 'tag1', 'Tin hieu 398', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1183, NULL, 3, 'tag1', 'Tin hieu 399', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1184, NULL, 5, 'tag1', 'Tin hieu 399', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1185, NULL, 6, 'tag1', 'Tin hieu 399', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1186, NULL, 3, 'tag1', 'Tin hieu 400', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1187, NULL, 5, 'tag1', 'Tin hieu 400', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1188, NULL, 6, 'tag1', 'Tin hieu 400', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1189, NULL, 3, 'tag1', 'Tin hieu 401', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1190, NULL, 5, 'tag1', 'Tin hieu 401', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1191, NULL, 6, 'tag1', 'Tin hieu 401', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1192, NULL, 3, 'tag1', 'Tin hieu 402', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1193, NULL, 5, 'tag1', 'Tin hieu 402', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1194, NULL, 6, 'tag1', 'Tin hieu 402', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1195, NULL, 3, 'tag1', 'Tin hieu 403', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1196, NULL, 5, 'tag1', 'Tin hieu 403', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1197, NULL, 6, 'tag1', 'Tin hieu 403', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(1198, NULL, 3, 'tag1', 'Tin hieu 404', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1199, NULL, 5, 'tag1', 'Tin hieu 404', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1200, NULL, 6, 'tag1', 'Tin hieu 404', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1201, NULL, 3, 'tag6', 'Tin hieu 405', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1202, NULL, 5, 'tag6', 'Tin hieu 405', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1203, NULL, 6, 'tag6', 'Tin hieu 405', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1204, NULL, 3, 'tag6', 'Tin hieu 406', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1205, NULL, 5, 'tag6', 'Tin hieu 406', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1206, NULL, 6, 'tag6', 'Tin hieu 406', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1207, NULL, 3, 'tag6', 'Tin hieu 407', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1208, NULL, 5, 'tag6', 'Tin hieu 407', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1209, NULL, 6, 'tag6', 'Tin hieu 407', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1210, NULL, 3, 'tag6', 'Tin hieu 408', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1211, NULL, 5, 'tag6', 'Tin hieu 408', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1212, NULL, 6, 'tag6', 'Tin hieu 408', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1213, NULL, 3, 'tag6', 'Tin hieu 409', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1214, NULL, 5, 'tag6', 'Tin hieu 409', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1215, NULL, 6, 'tag6', 'Tin hieu 409', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1216, NULL, 3, 'tag6', 'Tin hieu 410', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1217, NULL, 5, 'tag6', 'Tin hieu 410', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1218, NULL, 6, 'tag6', 'Tin hieu 410', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:23'),
(1219, NULL, 3, 'tag6', 'Tin hieu 411', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1220, NULL, 5, 'tag6', 'Tin hieu 411', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1221, NULL, 6, 'tag6', 'Tin hieu 411', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1222, NULL, 3, 'tag6', 'Tin hieu 412', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1223, NULL, 5, 'tag6', 'Tin hieu 412', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1224, NULL, 6, 'tag6', 'Tin hieu 412', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1225, NULL, 3, 'tag6', 'Tin hieu 413', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1226, NULL, 5, 'tag6', 'Tin hieu 413', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1227, NULL, 6, 'tag6', 'Tin hieu 413', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1228, NULL, 3, 'tag6', 'Tin hieu 414', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1229, NULL, 5, 'tag6', 'Tin hieu 414', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1230, NULL, 6, 'tag6', 'Tin hieu 414', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1231, NULL, 3, 'tag6', 'Tin hieu 415', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1232, NULL, 5, 'tag6', 'Tin hieu 415', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1233, NULL, 6, 'tag6', 'Tin hieu 415', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1234, NULL, 3, 'tag6', 'Tin hieu 416', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1235, NULL, 5, 'tag6', 'Tin hieu 416', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1236, NULL, 6, 'tag6', 'Tin hieu 416', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1237, NULL, 3, 'tag6', 'Tin hieu 417', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1238, NULL, 5, 'tag6', 'Tin hieu 417', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1239, NULL, 6, 'tag6', 'Tin hieu 417', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1240, NULL, 3, 'tag6', 'Tin hieu 418', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1241, NULL, 5, 'tag6', 'Tin hieu 418', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1242, NULL, 6, 'tag6', 'Tin hieu 418', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1243, NULL, 3, 'tag6', 'Tin hieu 419', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1244, NULL, 5, 'tag6', 'Tin hieu 419', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1245, NULL, 6, 'tag6', 'Tin hieu 419', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1246, NULL, 3, 'tag6', 'Tin hieu 420', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1247, NULL, 5, 'tag6', 'Tin hieu 420', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1248, NULL, 6, 'tag6', 'Tin hieu 420', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1249, NULL, 3, 'tag6', 'Tin hieu 421', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1250, NULL, 5, 'tag6', 'Tin hieu 421', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1251, NULL, 6, 'tag6', 'Tin hieu 421', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1252, NULL, 3, 'tag6', 'Tin hieu 422', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1253, NULL, 5, 'tag6', 'Tin hieu 422', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1254, NULL, 6, 'tag6', 'Tin hieu 422', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1255, NULL, 3, 'tag6', 'Tin hieu 423', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1256, NULL, 5, 'tag6', 'Tin hieu 423', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1257, NULL, 6, 'tag6', 'Tin hieu 423', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1258, NULL, 3, 'tag6', 'Tin hieu 424', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1259, NULL, 5, 'tag6', 'Tin hieu 424', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1260, NULL, 6, 'tag6', 'Tin hieu 424', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1261, NULL, 3, 'tag6', 'Tin hieu 425', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1262, NULL, 5, 'tag6', 'Tin hieu 425', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1263, NULL, 6, 'tag6', 'Tin hieu 425', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1264, NULL, 3, 'tag6', 'Tin hieu 426', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1265, NULL, 5, 'tag6', 'Tin hieu 426', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1266, NULL, 6, 'tag6', 'Tin hieu 426', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1267, NULL, 3, 'tag6', 'Tin hieu 427', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1268, NULL, 5, 'tag6', 'Tin hieu 427', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1269, NULL, 6, 'tag6', 'Tin hieu 427', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1270, NULL, 3, 'tag6', 'Tin hieu 428', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1271, NULL, 5, 'tag6', 'Tin hieu 428', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1272, NULL, 6, 'tag6', 'Tin hieu 428', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1273, NULL, 3, 'tag6', 'Tin hieu 429', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1274, NULL, 5, 'tag6', 'Tin hieu 429', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1275, NULL, 6, 'tag6', 'Tin hieu 429', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1276, NULL, 3, 'tag6', 'Tin hieu 430', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1277, NULL, 5, 'tag6', 'Tin hieu 430', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1278, NULL, 6, 'tag6', 'Tin hieu 430', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1279, NULL, 3, 'tag6', 'Tin hieu 431', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1280, NULL, 5, 'tag6', 'Tin hieu 431', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1281, NULL, 6, 'tag6', 'Tin hieu 431', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1282, NULL, 3, 'tag6', 'Tin hieu 432', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1283, NULL, 5, 'tag6', 'Tin hieu 432', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1284, NULL, 6, 'tag6', 'Tin hieu 432', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1285, NULL, 3, 'tag6', 'Tin hieu 433', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1286, NULL, 5, 'tag6', 'Tin hieu 433', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1287, NULL, 6, 'tag6', 'Tin hieu 433', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1288, NULL, 3, 'tag6', 'Tin hieu 434', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1289, NULL, 5, 'tag6', 'Tin hieu 434', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1290, NULL, 6, 'tag6', 'Tin hieu 434', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1291, NULL, 3, 'tag6', 'Tin hieu 435', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1292, NULL, 5, 'tag6', 'Tin hieu 435', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1293, NULL, 6, 'tag6', 'Tin hieu 435', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1294, NULL, 3, 'tag6', 'Tin hieu 436', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1295, NULL, 5, 'tag6', 'Tin hieu 436', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1296, NULL, 6, 'tag6', 'Tin hieu 436', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1297, NULL, 3, 'tag6', 'Tin hieu 437', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1298, NULL, 5, 'tag6', 'Tin hieu 437', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:45', '2022-12-22 00:52:24'),
(1299, NULL, 6, 'tag6', 'Tin hieu 437', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1300, NULL, 3, 'tag6', 'Tin hieu 438', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1301, NULL, 5, 'tag6', 'Tin hieu 438', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1302, NULL, 6, 'tag6', 'Tin hieu 438', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1303, NULL, 3, 'tag6', 'Tin hieu 439', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1304, NULL, 5, 'tag6', 'Tin hieu 439', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1305, NULL, 6, 'tag6', 'Tin hieu 439', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1306, NULL, 3, 'tag6', 'Tin hieu 440', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1307, NULL, 5, 'tag6', 'Tin hieu 440', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1308, NULL, 6, 'tag6', 'Tin hieu 440', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1309, NULL, 3, 'tag6', 'Tin hieu 441', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1310, NULL, 5, 'tag6', 'Tin hieu 441', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1311, NULL, 6, 'tag6', 'Tin hieu 441', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1312, NULL, 3, 'tag6', 'Tin hieu 442', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1313, NULL, 5, 'tag6', 'Tin hieu 442', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1314, NULL, 6, 'tag6', 'Tin hieu 442', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1315, NULL, 3, 'tag6', 'Tin hieu 443', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1316, NULL, 5, 'tag6', 'Tin hieu 443', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1317, NULL, 6, 'tag6', 'Tin hieu 443', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1318, NULL, 3, 'tag6', 'Tin hieu 444', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1319, NULL, 5, 'tag6', 'Tin hieu 444', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1320, NULL, 6, 'tag6', 'Tin hieu 444', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1321, NULL, 3, 'tag6', 'Tin hieu 445', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1322, NULL, 5, 'tag6', 'Tin hieu 445', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1323, NULL, 6, 'tag6', 'Tin hieu 445', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1324, NULL, 3, 'tag6', 'Tin hieu 446', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1325, NULL, 5, 'tag6', 'Tin hieu 446', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1326, NULL, 6, 'tag6', 'Tin hieu 446', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1327, NULL, 3, 'tag6', 'Tin hieu 447', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1328, NULL, 5, 'tag6', 'Tin hieu 447', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1329, NULL, 6, 'tag6', 'Tin hieu 447', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1330, NULL, 3, 'tag6', 'Tin hieu 448', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1331, NULL, 5, 'tag6', 'Tin hieu 448', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1332, NULL, 6, 'tag6', 'Tin hieu 448', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1333, NULL, 3, 'tag6', 'Tin hieu 449', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1334, NULL, 5, 'tag6', 'Tin hieu 449', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1335, NULL, 6, 'tag6', 'Tin hieu 449', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1336, NULL, 3, 'tag6', 'Tin hieu 450', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1337, NULL, 5, 'tag6', 'Tin hieu 450', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1338, NULL, 6, 'tag6', 'Tin hieu 450', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1339, NULL, 3, 'tag6', 'Tin hieu 451', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1340, NULL, 5, 'tag6', 'Tin hieu 451', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1341, NULL, 6, 'tag6', 'Tin hieu 451', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1342, NULL, 3, 'tag6', 'Tin hieu 452', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1343, NULL, 5, 'tag6', 'Tin hieu 452', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1344, NULL, 6, 'tag6', 'Tin hieu 452', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1345, NULL, 3, 'tag6', 'Tin hieu 453', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1346, NULL, 5, 'tag6', 'Tin hieu 453', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1347, NULL, 6, 'tag6', 'Tin hieu 453', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1348, NULL, 3, 'tag6', 'Tin hieu 454', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1349, NULL, 5, 'tag6', 'Tin hieu 454', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1350, NULL, 6, 'tag6', 'Tin hieu 454', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1351, NULL, 3, 'tag6', 'Tin hieu 455', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1352, NULL, 5, 'tag6', 'Tin hieu 455', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1353, NULL, 6, 'tag6', 'Tin hieu 455', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1354, NULL, 3, 'tag6', 'Tin hieu 456', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1355, NULL, 5, 'tag6', 'Tin hieu 456', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1356, NULL, 6, 'tag6', 'Tin hieu 456', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1357, NULL, 3, 'tag6', 'Tin hieu 457', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1358, NULL, 5, 'tag6', 'Tin hieu 457', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1359, NULL, 6, 'tag6', 'Tin hieu 457', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1360, NULL, 3, 'tag6', 'Tin hieu 458', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1361, NULL, 5, 'tag6', 'Tin hieu 458', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1362, NULL, 6, 'tag6', 'Tin hieu 458', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1363, NULL, 3, 'tag6', 'Tin hieu 459', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1364, NULL, 5, 'tag6', 'Tin hieu 459', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1365, NULL, 6, 'tag6', 'Tin hieu 459', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1366, NULL, 3, 'tag6', 'Tin hieu 460', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1367, NULL, 5, 'tag6', 'Tin hieu 460', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1368, NULL, 6, 'tag6', 'Tin hieu 460', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1369, NULL, 3, 'tag6', 'Tin hieu 461', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1370, NULL, 5, 'tag6', 'Tin hieu 461', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1371, NULL, 6, 'tag6', 'Tin hieu 461', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1372, NULL, 3, 'tag6', 'Tin hieu 462', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:24'),
(1373, NULL, 5, 'tag6', 'Tin hieu 462', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1374, NULL, 6, 'tag6', 'Tin hieu 462', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1375, NULL, 3, 'tag6', 'Tin hieu 463', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1376, NULL, 5, 'tag6', 'Tin hieu 463', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1377, NULL, 6, 'tag6', 'Tin hieu 463', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1378, NULL, 3, 'tag6', 'Tin hieu 464', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1379, NULL, 5, 'tag6', 'Tin hieu 464', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1380, NULL, 6, 'tag6', 'Tin hieu 464', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1381, NULL, 3, 'tag6', 'Tin hieu 465', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1382, NULL, 5, 'tag6', 'Tin hieu 465', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1383, NULL, 6, 'tag6', 'Tin hieu 465', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1384, NULL, 3, 'tag6', 'Tin hieu 466', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1385, NULL, 5, 'tag6', 'Tin hieu 466', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1386, NULL, 6, 'tag6', 'Tin hieu 466', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1387, NULL, 3, 'tag6', 'Tin hieu 467', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1388, NULL, 5, 'tag6', 'Tin hieu 467', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1389, NULL, 6, 'tag6', 'Tin hieu 467', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1390, NULL, 3, 'tag6', 'Tin hieu 468', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1391, NULL, 5, 'tag6', 'Tin hieu 468', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1392, NULL, 6, 'tag6', 'Tin hieu 468', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1393, NULL, 3, 'tag6', 'Tin hieu 469', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1394, NULL, 5, 'tag6', 'Tin hieu 469', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1395, NULL, 6, 'tag6', 'Tin hieu 469', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1396, NULL, 3, 'tag6', 'Tin hieu 470', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1397, NULL, 5, 'tag6', 'Tin hieu 470', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1398, NULL, 6, 'tag6', 'Tin hieu 470', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1399, NULL, 3, 'tag6', 'Tin hieu 471', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1400, NULL, 5, 'tag6', 'Tin hieu 471', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1401, NULL, 6, 'tag2', 'Tin hieu 471', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1402, NULL, 3, 'tag2', 'Tin hieu 472', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1403, NULL, 5, 'tag2', 'Tin hieu 472', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1404, NULL, 6, 'tag2', 'Tin hieu 472', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1405, NULL, 3, 'tag2', 'Tin hieu 473', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1406, NULL, 5, 'tag2', 'Tin hieu 473', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1407, NULL, 6, 'tag2', 'Tin hieu 473', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1408, NULL, 3, 'tag2', 'Tin hieu 474', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1409, NULL, 5, 'tag2', 'Tin hieu 474', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1410, NULL, 6, 'tag2', 'Tin hieu 474', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1411, NULL, 3, 'tag2', 'Tin hieu 475', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1412, NULL, 5, 'tag2', 'Tin hieu 475', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1413, NULL, 6, 'tag2', 'Tin hieu 475', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1414, NULL, 3, 'tag2', 'Tin hieu 476', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1415, NULL, 5, 'tag2', 'Tin hieu 476', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1416, NULL, 6, 'tag2', 'Tin hieu 476', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1417, NULL, 3, 'tag2', 'Tin hieu 477', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1418, NULL, 5, 'tag2', 'Tin hieu 477', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1419, NULL, 6, 'tag2', 'Tin hieu 477', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1420, NULL, 3, 'tag2', 'Tin hieu 478', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1421, NULL, 5, 'tag2', 'Tin hieu 478', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1422, NULL, 6, 'tag2', 'Tin hieu 478', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1423, NULL, 3, 'tag2', 'Tin hieu 479', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1424, NULL, 5, 'tag2', 'Tin hieu 479', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1425, NULL, 6, 'tag2', 'Tin hieu 479', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1426, NULL, 3, 'tag2', 'Tin hieu 480', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1427, NULL, 5, 'tag2', 'Tin hieu 480', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1428, NULL, 6, 'tag2', 'Tin hieu 480', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1429, NULL, 3, 'tag2', 'Tin hieu 481', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1430, NULL, 5, 'tag2', 'Tin hieu 481', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1431, NULL, 6, 'tag2', 'Tin hieu 481', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1432, NULL, 3, 'tag2', 'Tin hieu 482', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1433, NULL, 5, 'tag2', 'Tin hieu 482', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1434, NULL, 6, 'tag2', 'Tin hieu 482', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1435, NULL, 3, 'tag2', 'Tin hieu 483', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1436, NULL, 5, 'tag2', 'Tin hieu 483', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1437, NULL, 6, 'tag2', 'Tin hieu 483', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1438, NULL, 3, 'tag2', 'Tin hieu 484', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1439, NULL, 5, 'tag2', 'Tin hieu 484', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1440, NULL, 6, 'tag2', 'Tin hieu 484', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1441, NULL, 3, 'tag2', 'Tin hieu 485', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1442, NULL, 5, 'tag2', 'Tin hieu 485', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1443, NULL, 6, 'tag2', 'Tin hieu 485', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1444, NULL, 3, 'tag2', 'Tin hieu 486', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1445, NULL, 5, 'tag2', 'Tin hieu 486', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1446, NULL, 6, 'tag2', 'Tin hieu 486', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1447, NULL, 3, 'tag2', 'Tin hieu 487', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1448, NULL, 5, 'tag2', 'Tin hieu 487', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1449, NULL, 6, 'tag2', 'Tin hieu 487', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1450, NULL, 3, 'tag2', 'Tin hieu 488', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1451, NULL, 5, 'tag2', 'Tin hieu 488', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1452, NULL, 6, 'tag2', 'Tin hieu 488', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1453, NULL, 3, 'tag2', 'Tin hieu 489', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1454, NULL, 5, 'tag2', 'Tin hieu 489', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1455, NULL, 6, 'tag2', 'Tin hieu 489', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1456, NULL, 3, 'tag2', 'Tin hieu 490', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1457, NULL, 5, 'tag2', 'Tin hieu 490', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1458, NULL, 6, 'tag2', 'Tin hieu 490', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1459, NULL, 3, 'tag2', 'Tin hieu 491', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1460, NULL, 5, 'tag2', 'Tin hieu 491', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1461, NULL, 6, 'tag2', 'Tin hieu 491', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1462, NULL, 3, 'tag2', 'Tin hieu 492', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1463, NULL, 5, 'tag2', 'Tin hieu 492', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1464, NULL, 6, 'tag2', 'Tin hieu 492', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1465, NULL, 3, 'tag2', 'Tin hieu 493', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1466, NULL, 5, 'tag2', 'Tin hieu 493', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1467, NULL, 6, 'tag2', 'Tin hieu 493', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1468, NULL, 3, 'tag2', 'Tin hieu 494', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1469, NULL, 5, 'tag2', 'Tin hieu 494', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1470, NULL, 6, 'tag2', 'Tin hieu 494', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1471, NULL, 3, 'tag2', 'Tin hieu 495', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1472, NULL, 5, 'tag2', 'Tin hieu 495', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1473, NULL, 6, 'tag2', 'Tin hieu 495', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1474, NULL, 3, 'tag2', 'Tin hieu 496', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1475, NULL, 5, 'tag2', 'Tin hieu 496', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1476, NULL, 6, 'tag2', 'Tin hieu 496', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1477, NULL, 3, 'tag2', 'Tin hieu 497', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1478, NULL, 5, 'tag2', 'Tin hieu 497', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1479, NULL, 6, 'tag2', 'Tin hieu 497', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1480, NULL, 3, 'tag2', 'Tin hieu 498', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1481, NULL, 5, 'tag2', 'Tin hieu 498', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1482, NULL, 6, 'tag2', 'Tin hieu 498', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1483, NULL, 3, 'tag2', 'Tin hieu 499', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:46', '2022-12-22 00:52:25'),
(1484, NULL, 5, 'tag2', 'Tin hieu 499', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1485, NULL, 6, 'tag2', 'Tin hieu 499', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1486, NULL, 3, 'tag2', 'Tin hieu 500', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1487, NULL, 5, 'tag2', 'Tin hieu 500', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1488, NULL, 6, 'tag2', 'Tin hieu 500', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1489, NULL, 3, 'tag2', 'Tin hieu 501', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1490, NULL, 5, 'tag2', 'Tin hieu 501', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1491, NULL, 6, 'tag2', 'Tin hieu 501', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1492, NULL, 3, 'tag2', 'Tin hieu 502', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1493, NULL, 5, 'tag2', 'Tin hieu 502', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1494, NULL, 6, 'tag2', 'Tin hieu 502', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1495, NULL, 3, 'tag2', 'Tin hieu 503', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1496, NULL, 5, 'tag2', 'Tin hieu 503', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1497, NULL, 6, 'tag2', 'Tin hieu 503', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1498, NULL, 3, 'tag2', 'Tin hieu 504', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1499, NULL, 5, 'tag2', 'Tin hieu 504', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1500, NULL, 6, 'tag2', 'Tin hieu 504', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1501, NULL, 3, 'tag2', 'Tin hieu 505', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1502, NULL, 5, 'tag2', 'Tin hieu 505', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1503, NULL, 6, 'tag2', 'Tin hieu 505', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1504, NULL, 3, 'tag2', 'Tin hieu 506', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1505, NULL, 5, 'tag2', 'Tin hieu 506', 'avatar', 'content', 'gallery', 3, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1506, NULL, 6, 'tag2', 'Tin hieu 506', 'avatar', 'content', 'gallery', 2, NULL, '2022-12-22 00:28:47', '2022-12-22 00:52:25'),
(1507, NULL, 3, 'tag2', 'Tin hieu 507', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1508, NULL, 3, 'tag2', 'Tin hieu 508', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1509, NULL, 3, 'tag2', 'Tin hieu 509', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:25'),
(1510, NULL, 3, 'tag2', 'Tin hieu 510', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1511, NULL, 3, 'tag2', 'Tin hieu 511', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:25'),
(1512, NULL, 3, 'tag2', 'Tin hieu 512', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1513, NULL, 3, 'tag2', 'Tin hieu 513', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:25'),
(1514, NULL, 3, 'tag2', 'Tin hieu 514', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1515, NULL, 3, 'tag2', 'Tin hieu 515', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:25'),
(1516, NULL, 3, 'tag2', 'Tin hieu 516', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1517, NULL, 3, 'tag2', 'Tin hieu 517', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1518, NULL, 3, 'tag2', 'Tin hieu 518', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1519, NULL, 3, 'tag2', 'Tin hieu 519', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1520, NULL, 3, 'tag2', 'Tin hieu 520', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1521, NULL, 3, 'tag2', 'Tin hieu 521', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1522, NULL, 3, 'tag2', 'Tin hieu 522', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1523, NULL, 3, 'tag2', 'Tin hieu 523', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:25'),
(1524, NULL, 3, 'tag2', 'Tin hieu 524', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1525, NULL, 3, 'tag2', 'Tin hieu 525', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1526, NULL, 3, 'tag2', 'Tin hieu 526', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1527, NULL, 3, 'tag2', 'Tin hieu 527', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1528, NULL, 3, 'tag2', 'Tin hieu 528', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1529, NULL, 3, 'tag2', 'Tin hieu 529', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1530, NULL, 3, 'tag2', 'Tin hieu 530', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1531, NULL, 3, 'tag2', 'Tin hieu 531', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1532, NULL, 3, 'tag2', 'Tin hieu 532', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1533, NULL, 3, 'tag2', 'Tin hieu 533', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1534, NULL, 3, 'tag2', 'Tin hieu 534', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1535, NULL, 3, 'tag2', 'Tin hieu 535', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1536, NULL, 3, 'tag2', 'Tin hieu 536', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1537, NULL, 3, 'tag2', 'Tin hieu 537', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1538, NULL, 3, 'tag2', 'Tin hieu 538', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1539, NULL, 3, 'tag2', 'Tin hieu 539', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1540, NULL, 3, 'tag2', 'Tin hieu 540', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1541, NULL, 3, 'tag2', 'Tin hieu 541', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1542, NULL, 3, 'tag2', 'Tin hieu 542', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1543, NULL, 3, 'tag2', 'Tin hieu 543', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1544, NULL, 3, 'tag2', 'Tin hieu 544', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1545, NULL, 3, 'tag2', 'Tin hieu 545', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1546, NULL, 3, 'tag2', 'Tin hieu 546', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1547, NULL, 3, 'tag2', 'Tin hieu 547', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1548, NULL, 3, 'tag2', 'Tin hieu 548', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1549, NULL, 3, 'tag2', 'Tin hieu 549', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1550, NULL, 3, 'tag2', 'Tin hieu 550', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1551, NULL, 3, 'tag2', 'Tin hieu 551', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1552, NULL, 3, 'tag2', 'Tin hieu 552', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1553, NULL, 3, 'tag2', 'Tin hieu 553', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1554, NULL, 3, 'tag2', 'Tin hieu 554', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1555, NULL, 3, 'tag2', 'Tin hieu 555', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1556, NULL, 3, 'tag2', 'Tin hieu 556', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1557, NULL, 3, 'tag2', 'Tin hieu 557', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1558, NULL, 3, 'tag2', 'Tin hieu 558', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1559, NULL, 3, 'tag2', 'Tin hieu 559', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1560, NULL, 3, 'tag2', 'Tin hieu 560', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1561, NULL, 3, 'tag2', 'Tin hieu 561', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1562, NULL, 3, 'tag2', 'Tin hieu 562', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1563, NULL, 3, 'tag2', 'Tin hieu 563', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1564, NULL, 3, 'tag2', 'Tin hieu 564', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1565, NULL, 3, 'tag2', 'Tin hieu 565', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1566, NULL, 3, 'tag2', 'Tin hieu 566', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1567, NULL, 3, 'tag2', 'Tin hieu 567', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1568, NULL, 3, 'tag2', 'Tin hieu 568', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1569, NULL, 3, 'tag2', 'Tin hieu 569', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1570, NULL, 3, 'tag2', 'Tin hieu 570', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1571, NULL, 3, 'tag2', 'Tin hieu 571', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1572, NULL, 3, 'tag2', 'Tin hieu 572', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1573, NULL, 3, 'tag2', 'Tin hieu 573', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1574, NULL, 3, 'tag2', 'Tin hieu 574', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1575, NULL, 3, 'tag2', 'Tin hieu 575', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1576, NULL, 3, 'tag2', 'Tin hieu 576', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1577, NULL, 3, 'tag2', 'Tin hieu 577', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1578, NULL, 3, 'tag2', 'Tin hieu 578', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1579, NULL, 3, 'tag2', 'Tin hieu 579', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1580, NULL, 3, 'tag2', 'Tin hieu 580', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1581, NULL, 3, 'tag2', 'Tin hieu 581', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1582, NULL, 3, 'tag2', 'Tin hieu 582', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1583, NULL, 3, 'tag2', 'Tin hieu 583', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1584, NULL, 3, 'tag2', 'Tin hieu 584', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1585, NULL, 3, 'tag2', 'Tin hieu 585', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1586, NULL, 3, 'tag2', 'Tin hieu 586', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1587, NULL, 3, 'tag2', 'Tin hieu 587', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1588, NULL, 3, 'tag2', 'Tin hieu 588', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1589, NULL, 3, 'tag2', 'Tin hieu 589', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1590, NULL, 3, 'tag2', 'Tin hieu 590', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1591, NULL, 3, 'tag2', 'Tin hieu 591', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1592, NULL, 3, 'tag2', 'Tin hieu 592', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1593, NULL, 3, 'tag2', 'Tin hieu 593', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1594, NULL, 3, 'tag2', 'Tin hieu 594', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1595, NULL, 3, 'tag2', 'Tin hieu 595', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1596, NULL, 3, 'tag2', 'Tin hieu 596', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1597, NULL, 3, 'tag2', 'Tin hieu 597', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1598, NULL, 3, 'tag2', 'Tin hieu 598', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1599, NULL, 3, 'tag2', 'Tin hieu 599', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1600, NULL, 3, 'tag2', 'Tin hieu 600', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1601, NULL, 3, 'tag4', 'Tin hieu 601', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1602, NULL, 3, 'tag4', 'Tin hieu 602', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1603, NULL, 3, 'tag4', 'Tin hieu 603', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1604, NULL, 3, 'tag4', 'Tin hieu 604', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1605, NULL, 3, 'tag4', 'Tin hieu 605', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1606, NULL, 3, 'tag4', 'Tin hieu 606', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(1607, NULL, 3, 'tag4', 'Tin hieu 607', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1608, NULL, 3, 'tag4', 'Tin hieu 608', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1609, NULL, 3, 'tag4', 'Tin hieu 609', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1610, NULL, 3, 'tag4', 'Tin hieu 610', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1611, NULL, 3, 'tag4', 'Tin hieu 611', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1612, NULL, 3, 'tag4', 'Tin hieu 612', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1613, NULL, 3, 'tag4', 'Tin hieu 613', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1614, NULL, 3, 'tag4', 'Tin hieu 614', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1615, NULL, 3, 'tag4', 'Tin hieu 615', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1616, NULL, 3, 'tag4', 'Tin hieu 616', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1617, NULL, 3, 'tag4', 'Tin hieu 617', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1618, NULL, 3, 'tag4', 'Tin hieu 618', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1619, NULL, 3, 'tag4', 'Tin hieu 619', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1620, NULL, 3, 'tag4', 'Tin hieu 620', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1621, NULL, 3, 'tag4', 'Tin hieu 621', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1622, NULL, 3, 'tag4', 'Tin hieu 622', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1623, NULL, 3, 'tag4', 'Tin hieu 623', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1624, NULL, 3, 'tag4', 'Tin hieu 624', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1625, NULL, 3, 'tag4', 'Tin hieu 625', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1626, NULL, 3, 'tag4', 'Tin hieu 626', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1627, NULL, 3, 'tag4', 'Tin hieu 627', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1628, NULL, 3, 'tag4', 'Tin hieu 628', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1629, NULL, 3, 'tag4', 'Tin hieu 629', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1630, NULL, 3, 'tag4', 'Tin hieu 630', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1631, NULL, 3, 'tag4', 'Tin hieu 631', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1632, NULL, 3, 'tag4', 'Tin hieu 632', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1633, NULL, 3, 'tag4', 'Tin hieu 633', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1634, NULL, 3, 'tag4', 'Tin hieu 634', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1635, NULL, 3, 'tag4', 'Tin hieu 635', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1636, NULL, 3, 'tag4', 'Tin hieu 636', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1637, NULL, 3, 'tag4', 'Tin hieu 637', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1638, NULL, 3, 'tag4', 'Tin hieu 638', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1639, NULL, 3, 'tag4', 'Tin hieu 639', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1640, NULL, 3, 'tag4', 'Tin hieu 640', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1641, NULL, 3, 'tag4', 'Tin hieu 641', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1642, NULL, 3, 'tag4', 'Tin hieu 642', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1643, NULL, 3, 'tag4', 'Tin hieu 643', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1644, NULL, 3, 'tag4', 'Tin hieu 644', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1645, NULL, 3, 'tag4', 'Tin hieu 645', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1646, NULL, 3, 'tag4', 'Tin hieu 646', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1647, NULL, 3, 'tag4', 'Tin hieu 647', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1648, NULL, 3, 'tag4', 'Tin hieu 648', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1649, NULL, 3, 'tag4', 'Tin hieu 649', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1650, NULL, 3, 'tag4', 'Tin hieu 650', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1651, NULL, 3, 'tag4', 'Tin hieu 651', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1652, NULL, 3, 'tag4', 'Tin hieu 652', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1653, NULL, 3, 'tag4', 'Tin hieu 653', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1654, NULL, 3, 'tag4', 'Tin hieu 654', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1655, NULL, 3, 'tag4', 'Tin hieu 655', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1656, NULL, 3, 'tag4', 'Tin hieu 656', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1657, NULL, 3, 'tag4', 'Tin hieu 657', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1658, NULL, 3, 'tag4', 'Tin hieu 658', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1659, NULL, 3, 'tag4', 'Tin hieu 659', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1660, NULL, 3, 'tag4', 'Tin hieu 660', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1661, NULL, 3, 'tag4', 'Tin hieu 661', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1662, NULL, 3, 'tag4', 'Tin hieu 662', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1663, NULL, 3, 'tag4', 'Tin hieu 663', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1664, NULL, 3, 'tag4', 'Tin hieu 664', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1665, NULL, 3, 'tag4', 'Tin hieu 665', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1666, NULL, 3, 'tag4', 'Tin hieu 666', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1667, NULL, 3, 'tag4', 'Tin hieu 667', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1668, NULL, 3, 'tag4', 'Tin hieu 668', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1669, NULL, 3, 'tag4', 'Tin hieu 669', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1670, NULL, 3, 'tag4', 'Tin hieu 670', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1671, NULL, 3, 'tag4', 'Tin hieu 671', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1672, NULL, 3, 'tag4', 'Tin hieu 672', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1673, NULL, 3, 'tag4', 'Tin hieu 673', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1674, NULL, 3, 'tag4', 'Tin hieu 674', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1675, NULL, 3, 'tag4', 'Tin hieu 675', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1676, NULL, 3, 'tag4', 'Tin hieu 676', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1677, NULL, 3, 'tag4', 'Tin hieu 677', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:26'),
(1678, NULL, 3, 'tag4', 'Tin hieu 678', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:26'),
(1679, NULL, 3, 'tag4', 'Tin hieu 679', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1680, NULL, 3, 'tag4', 'Tin hieu 680', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1681, NULL, 3, 'tag4', 'Tin hieu 681', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1682, NULL, 3, 'tag4', 'Tin hieu 682', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1683, NULL, 3, 'tag4', 'Tin hieu 683', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1684, NULL, 3, 'tag4', 'Tin hieu 684', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1685, NULL, 3, 'tag4', 'Tin hieu 685', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1686, NULL, 3, 'tag4', 'Tin hieu 686', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1687, NULL, 3, 'tag4', 'Tin hieu 687', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1688, NULL, 3, 'tag4', 'Tin hieu 688', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1689, NULL, 3, 'tag4', 'Tin hieu 689', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1690, NULL, 3, 'tag4', 'Tin hieu 690', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1691, NULL, 3, 'tag4', 'Tin hieu 691', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1692, NULL, 3, 'tag4', 'Tin hieu 692', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1693, NULL, 3, 'tag4', 'Tin hieu 693', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1694, NULL, 3, 'tag4', 'Tin hieu 694', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1695, NULL, 3, 'tag4', 'Tin hieu 695', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1696, NULL, 3, 'tag4', 'Tin hieu 696', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1697, NULL, 3, 'tag4', 'Tin hieu 697', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1698, NULL, 3, 'tag4', 'Tin hieu 698', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1699, NULL, 3, 'tag4', 'Tin hieu 699', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1700, NULL, 3, 'tag4', 'Tin hieu 700', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1701, NULL, 3, 'tag4', 'Tin hieu 701', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1702, NULL, 3, 'tag4', 'Tin hieu 702', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1703, NULL, 3, 'tag4', 'Tin hieu 703', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1704, NULL, 3, 'tag4', 'Tin hieu 704', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1705, NULL, 3, 'tag4', 'Tin hieu 705', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1706, NULL, 3, 'tag4', 'Tin hieu 706', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1707, NULL, 3, 'tag4', 'Tin hieu 707', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1708, NULL, 3, 'tag4', 'Tin hieu 708', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1709, NULL, 3, 'tag4', 'Tin hieu 709', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1710, NULL, 3, 'tag4', 'Tin hieu 710', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1711, NULL, 3, 'tag4', 'Tin hieu 711', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1712, NULL, 3, 'tag4', 'Tin hieu 712', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1713, NULL, 3, 'tag4', 'Tin hieu 713', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1714, NULL, 3, 'tag4', 'Tin hieu 714', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1715, NULL, 3, 'tag4', 'Tin hieu 715', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1716, NULL, 3, 'tag4', 'Tin hieu 716', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1717, NULL, 3, 'tag4', 'Tin hieu 717', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1718, NULL, 3, 'tag4', 'Tin hieu 718', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1719, NULL, 3, 'tag4', 'Tin hieu 719', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1720, NULL, 3, 'tag4', 'Tin hieu 720', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1721, NULL, 3, 'tag4', 'Tin hieu 721', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1722, NULL, 3, 'tag4', 'Tin hieu 722', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1723, NULL, 3, 'tag4', 'Tin hieu 723', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1724, NULL, 3, 'tag4', 'Tin hieu 724', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1725, NULL, 3, 'tag4', 'Tin hieu 725', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1726, NULL, 3, 'tag4', 'Tin hieu 726', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1727, NULL, 3, 'tag4', 'Tin hieu 727', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1728, NULL, 3, 'tag4', 'Tin hieu 728', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1729, NULL, 3, 'tag4', 'Tin hieu 729', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1730, NULL, 3, 'tag4', 'Tin hieu 730', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1731, NULL, 3, 'tag4', 'Tin hieu 731', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1732, NULL, 3, 'tag4', 'Tin hieu 732', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1733, NULL, 3, 'tag4', 'Tin hieu 733', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1734, NULL, 3, 'tag4', 'Tin hieu 734', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1735, NULL, 3, 'tag4', 'Tin hieu 735', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1736, NULL, 3, 'tag4', 'Tin hieu 736', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1737, NULL, 3, 'tag4', 'Tin hieu 737', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1738, NULL, 3, 'tag4', 'Tin hieu 738', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1739, NULL, 3, 'tag4', 'Tin hieu 739', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1740, NULL, 3, 'tag4', 'Tin hieu 740', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1741, NULL, 3, 'tag4', 'Tin hieu 741', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1742, NULL, 3, 'tag4', 'Tin hieu 742', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1743, NULL, 3, 'tag4', 'Tin hieu 743', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1744, NULL, 3, 'tag4', 'Tin hieu 744', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1745, NULL, 3, 'tag4', 'Tin hieu 745', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1746, NULL, 3, 'tag4', 'Tin hieu 746', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1747, NULL, 3, 'tag4', 'Tin hieu 747', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1748, NULL, 3, 'tag4', 'Tin hieu 748', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1749, NULL, 3, 'tag4', 'Tin hieu 749', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1750, NULL, 3, 'tag4', 'Tin hieu 750', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1751, NULL, 3, 'tag4', 'Tin hieu 751', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1752, NULL, 3, 'tag4', 'Tin hieu 752', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1753, NULL, 3, 'tag4', 'Tin hieu 753', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1754, NULL, 3, 'tag4', 'Tin hieu 754', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1755, NULL, 3, 'tag4', 'Tin hieu 755', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1756, NULL, 3, 'tag4', 'Tin hieu 756', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1757, NULL, 3, 'tag4', 'Tin hieu 757', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1758, NULL, 3, 'tag4', 'Tin hieu 758', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1759, NULL, 3, 'tag4', 'Tin hieu 759', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1760, NULL, 3, 'tag4', 'Tin hieu 760', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1761, NULL, 3, 'tag4', 'Tin hieu 761', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1762, NULL, 3, 'tag4', 'Tin hieu 762', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1763, NULL, 3, 'tag4', 'Tin hieu 763', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1764, NULL, 3, 'tag4', 'Tin hieu 764', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1765, NULL, 3, 'tag4', 'Tin hieu 765', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1766, NULL, 3, 'tag4', 'Tin hieu 766', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1767, NULL, 3, 'tag4', 'Tin hieu 767', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1768, NULL, 3, 'tag4', 'Tin hieu 768', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1769, NULL, 3, 'tag4', 'Tin hieu 769', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1770, NULL, 3, 'tag4', 'Tin hieu 770', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1771, NULL, 3, 'tag4', 'Tin hieu 771', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1772, NULL, 3, 'tag4', 'Tin hieu 772', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1773, NULL, 3, 'tag4', 'Tin hieu 773', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1774, NULL, 3, 'tag4', 'Tin hieu 774', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1775, NULL, 3, 'tag4', 'Tin hieu 775', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1776, NULL, 3, 'tag4', 'Tin hieu 776', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1777, NULL, 3, 'tag4', 'Tin hieu 777', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1778, NULL, 3, 'tag4', 'Tin hieu 778', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1779, NULL, 3, 'tag4', 'Tin hieu 779', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1780, NULL, 3, 'tag4', 'Tin hieu 780', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1781, NULL, 3, 'tag4', 'Tin hieu 781', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1782, NULL, 3, 'tag4', 'Tin hieu 782', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1783, NULL, 3, 'tag4', 'Tin hieu 783', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1784, NULL, 3, 'tag4', 'Tin hieu 784', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1785, NULL, 3, 'tag4', 'Tin hieu 785', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1786, NULL, 3, 'tag4', 'Tin hieu 786', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1787, NULL, 3, 'tag4', 'Tin hieu 787', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1788, NULL, 3, 'tag4', 'Tin hieu 788', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1789, NULL, 3, 'tag4', 'Tin hieu 789', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1790, NULL, 3, 'tag4', 'Tin hieu 790', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1791, NULL, 3, 'tag4', 'Tin hieu 791', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1792, NULL, 3, 'tag4', 'Tin hieu 792', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1793, NULL, 3, 'tag4', 'Tin hieu 793', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1794, NULL, 3, 'tag4', 'Tin hieu 794', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1795, NULL, 3, 'tag4', 'Tin hieu 795', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1796, NULL, 3, 'tag4', 'Tin hieu 796', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1797, NULL, 3, 'tag4', 'Tin hieu 797', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1798, NULL, 3, 'tag4', 'Tin hieu 798', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1799, NULL, 3, 'tag4', 'Tin hieu 799', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1800, NULL, 3, 'tag4', 'Tin hieu 800', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1801, NULL, 3, 'tag5', 'Tin hieu 801', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1802, NULL, 3, 'tag5', 'Tin hieu 802', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1803, NULL, 3, 'tag5', 'Tin hieu 803', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1804, NULL, 3, 'tag5', 'Tin hieu 804', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1805, NULL, 3, 'tag5', 'Tin hieu 805', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1806, NULL, 3, 'tag5', 'Tin hieu 806', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1807, NULL, 3, 'tag5', 'Tin hieu 807', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1808, NULL, 3, 'tag5', 'Tin hieu 808', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1809, NULL, 3, 'tag5', 'Tin hieu 809', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1810, NULL, 3, 'tag5', 'Tin hieu 810', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1811, NULL, 3, 'tag5', 'Tin hieu 811', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1812, NULL, 3, 'tag5', 'Tin hieu 812', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1813, NULL, 3, 'tag5', 'Tin hieu 813', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1814, NULL, 3, 'tag5', 'Tin hieu 814', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1815, NULL, 3, 'tag5', 'Tin hieu 815', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1816, NULL, 3, 'tag5', 'Tin hieu 816', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1817, NULL, 3, 'tag5', 'Tin hieu 817', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1818, NULL, 3, 'tag5', 'Tin hieu 818', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1819, NULL, 3, 'tag5', 'Tin hieu 819', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1820, NULL, 3, 'tag5', 'Tin hieu 820', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1821, NULL, 3, 'tag5', 'Tin hieu 821', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1822, NULL, 3, 'tag5', 'Tin hieu 822', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1823, NULL, 3, 'tag5', 'Tin hieu 823', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1824, NULL, 3, 'tag5', 'Tin hieu 824', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1825, NULL, 3, 'tag5', 'Tin hieu 825', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1826, NULL, 3, 'tag5', 'Tin hieu 826', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1827, NULL, 3, 'tag5', 'Tin hieu 827', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1828, NULL, 3, 'tag5', 'Tin hieu 828', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1829, NULL, 3, 'tag5', 'Tin hieu 829', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1830, NULL, 3, 'tag5', 'Tin hieu 830', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1831, NULL, 3, 'tag5', 'Tin hieu 831', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1832, NULL, 3, 'tag5', 'Tin hieu 832', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:27'),
(1833, NULL, 3, 'tag5', 'Tin hieu 833', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1834, NULL, 3, 'tag5', 'Tin hieu 834', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1835, NULL, 3, 'tag5', 'Tin hieu 835', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1836, NULL, 3, 'tag5', 'Tin hieu 836', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1837, NULL, 3, 'tag5', 'Tin hieu 837', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:27'),
(1838, NULL, 3, 'tag5', 'Tin hieu 838', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1839, NULL, 3, 'tag5', 'Tin hieu 839', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1840, NULL, 3, 'tag5', 'Tin hieu 840', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1841, NULL, 3, 'tag5', 'Tin hieu 841', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1842, NULL, 3, 'tag5', 'Tin hieu 842', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1843, NULL, 3, 'tag5', 'Tin hieu 843', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1844, NULL, 3, 'tag5', 'Tin hieu 844', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1845, NULL, 3, 'tag5', 'Tin hieu 845', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1846, NULL, 3, 'tag5', 'Tin hieu 846', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1847, NULL, 3, 'tag5', 'Tin hieu 847', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1848, NULL, 3, 'tag5', 'Tin hieu 848', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1849, NULL, 3, 'tag5', 'Tin hieu 849', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1850, NULL, 3, 'tag5', 'Tin hieu 850', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1851, NULL, 3, 'tag5', 'Tin hieu 851', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1852, NULL, 3, 'tag5', 'Tin hieu 852', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1853, NULL, 3, 'tag5', 'Tin hieu 853', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1854, NULL, 3, 'tag5', 'Tin hieu 854', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1855, NULL, 3, 'tag5', 'Tin hieu 855', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1856, NULL, 3, 'tag5', 'Tin hieu 856', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1857, NULL, 3, 'tag5', 'Tin hieu 857', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1858, NULL, 3, 'tag5', 'Tin hieu 858', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1859, NULL, 3, 'tag5', 'Tin hieu 859', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1860, NULL, 3, 'tag5', 'Tin hieu 860', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1861, NULL, 3, 'tag5', 'Tin hieu 861', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1862, NULL, 3, 'tag5', 'Tin hieu 862', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1863, NULL, 3, 'tag5', 'Tin hieu 863', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1864, NULL, 3, 'tag5', 'Tin hieu 864', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1865, NULL, 3, 'tag5', 'Tin hieu 865', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1866, NULL, 3, 'tag5', 'Tin hieu 866', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1867, NULL, 3, 'tag5', 'Tin hieu 867', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1868, NULL, 3, 'tag5', 'Tin hieu 868', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1869, NULL, 3, 'tag5', 'Tin hieu 869', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1870, NULL, 3, 'tag5', 'Tin hieu 870', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1871, NULL, 3, 'tag5', 'Tin hieu 871', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1872, NULL, 3, 'tag5', 'Tin hieu 872', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1873, NULL, 3, 'tag5', 'Tin hieu 873', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1874, NULL, 3, 'tag5', 'Tin hieu 874', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1875, NULL, 3, 'tag5', 'Tin hieu 875', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1876, NULL, 3, 'tag5', 'Tin hieu 876', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1877, NULL, 3, 'tag5', 'Tin hieu 877', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1878, NULL, 3, 'tag5', 'Tin hieu 878', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1879, NULL, 3, 'tag5', 'Tin hieu 879', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1880, NULL, 3, 'tag5', 'Tin hieu 880', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1881, NULL, 3, 'tag5', 'Tin hieu 881', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1882, NULL, 3, 'tag5', 'Tin hieu 882', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1883, NULL, 3, 'tag5', 'Tin hieu 883', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1884, NULL, 3, 'tag5', 'Tin hieu 884', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1885, NULL, 3, 'tag5', 'Tin hieu 885', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1886, NULL, 3, 'tag5', 'Tin hieu 886', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1887, NULL, 3, 'tag5', 'Tin hieu 887', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1888, NULL, 3, 'tag5', 'Tin hieu 888', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1889, NULL, 3, 'tag5', 'Tin hieu 889', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1890, NULL, 3, 'tag5', 'Tin hieu 890', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1891, NULL, 3, 'tag5', 'Tin hieu 891', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1892, NULL, 3, 'tag5', 'Tin hieu 892', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1893, NULL, 3, 'tag5', 'Tin hieu 893', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1894, NULL, 3, 'tag5', 'Tin hieu 894', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1895, NULL, 3, 'tag5', 'Tin hieu 895', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1896, NULL, 3, 'tag5', 'Tin hieu 896', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1897, NULL, 3, 'tag5', 'Tin hieu 897', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1898, NULL, 3, 'tag5', 'Tin hieu 898', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1899, NULL, 3, 'tag5', 'Tin hieu 899', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1900, NULL, 3, 'tag5', 'Tin hieu 900', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1901, NULL, 3, 'tag5', 'Tin hieu 901', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1902, NULL, 3, 'tag5', 'Tin hieu 902', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1903, NULL, 3, 'tag5', 'Tin hieu 903', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1904, NULL, 3, 'tag5', 'Tin hieu 904', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1905, NULL, 3, 'tag5', 'Tin hieu 905', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1906, NULL, 3, 'tag5', 'Tin hieu 906', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1907, NULL, 3, 'tag5', 'Tin hieu 907', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1908, NULL, 3, 'tag5', 'Tin hieu 908', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1909, NULL, 3, 'tag5', 'Tin hieu 909', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1910, NULL, 3, 'tag5', 'Tin hieu 910', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1911, NULL, 3, 'tag5', 'Tin hieu 911', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1912, NULL, 3, 'tag5', 'Tin hieu 912', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1913, NULL, 3, 'tag5', 'Tin hieu 913', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1914, NULL, 3, 'tag5', 'Tin hieu 914', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1915, NULL, 3, 'tag5', 'Tin hieu 915', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1916, NULL, 3, 'tag5', 'Tin hieu 916', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1917, NULL, 3, 'tag5', 'Tin hieu 917', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1918, NULL, 3, 'tag5', 'Tin hieu 918', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1919, NULL, 3, 'tag5', 'Tin hieu 919', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1920, NULL, 3, 'tag5', 'Tin hieu 920', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1921, NULL, 3, 'tag5', 'Tin hieu 921', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1922, NULL, 3, 'tag5', 'Tin hieu 922', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1923, NULL, 3, 'tag5', 'Tin hieu 923', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1924, NULL, 3, 'tag5', 'Tin hieu 924', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1925, NULL, 3, 'tag5', 'Tin hieu 925', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1926, NULL, 3, 'tag5', 'Tin hieu 926', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1927, NULL, 3, 'tag5', 'Tin hieu 927', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1928, NULL, 3, 'tag5', 'Tin hieu 928', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1929, NULL, 3, 'tag5', 'Tin hieu 929', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1930, NULL, 3, 'tag5', 'Tin hieu 930', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1931, NULL, 3, 'tag5', 'Tin hieu 931', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1932, NULL, 3, 'tag5', 'Tin hieu 932', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1933, NULL, 3, 'tag5', 'Tin hieu 933', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1934, NULL, 3, 'tag5', 'Tin hieu 934', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1935, NULL, 3, 'tag5', 'Tin hieu 935', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1936, NULL, 3, 'tag5', 'Tin hieu 936', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1937, NULL, 3, 'tag5', 'Tin hieu 937', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1938, NULL, 3, 'tag5', 'Tin hieu 938', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1939, NULL, 3, 'tag5', 'Tin hieu 939', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1940, NULL, 3, 'tag5', 'Tin hieu 940', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1941, NULL, 3, 'tag5', 'Tin hieu 941', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1942, NULL, 3, 'tag5', 'Tin hieu 942', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1943, NULL, 3, 'tag5', 'Tin hieu 943', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1944, NULL, 3, 'tag5', 'Tin hieu 944', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1945, NULL, 3, 'tag5', 'Tin hieu 945', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1946, NULL, 3, 'tag5', 'Tin hieu 946', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1947, NULL, 3, 'tag5', 'Tin hieu 947', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1948, NULL, 3, 'tag5', 'Tin hieu 948', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1949, NULL, 3, 'tag5', 'Tin hieu 949', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1950, NULL, 3, 'tag5', 'Tin hieu 950', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1951, NULL, 3, 'tag5', 'Tin hieu 951', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1952, NULL, 3, 'tag5', 'Tin hieu 952', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1953, NULL, 3, 'tag5', 'Tin hieu 953', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1954, NULL, 3, 'tag5', 'Tin hieu 954', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1955, NULL, 3, 'tag5', 'Tin hieu 955', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1956, NULL, 3, 'tag5', 'Tin hieu 956', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1957, NULL, 3, 'tag5', 'Tin hieu 957', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1958, NULL, 3, 'tag5', 'Tin hieu 958', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1959, NULL, 3, 'tag5', 'Tin hieu 959', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1960, NULL, 3, 'tag5', 'Tin hieu 960', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1961, NULL, 3, 'tag5', 'Tin hieu 961', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1962, NULL, 3, 'tag5', 'Tin hieu 962', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1963, NULL, 3, 'tag5', 'Tin hieu 963', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1964, NULL, 3, 'tag5', 'Tin hieu 964', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1965, NULL, 3, 'tag5', 'Tin hieu 965', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1966, NULL, 3, 'tag5', 'Tin hieu 966', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1967, NULL, 3, 'tag5', 'Tin hieu 967', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1968, NULL, 3, 'tag5', 'Tin hieu 968', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1969, NULL, 3, 'tag5', 'Tin hieu 969', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1970, NULL, 3, 'tag5', 'Tin hieu 970', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1971, NULL, 3, 'tag5', 'Tin hieu 971', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1972, NULL, 3, 'tag5', 'Tin hieu 972', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1973, NULL, 3, 'tag5', 'Tin hieu 973', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1974, NULL, 3, 'tag5', 'Tin hieu 974', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1975, NULL, 3, 'tag5', 'Tin hieu 975', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1976, NULL, 3, 'tag5', 'Tin hieu 976', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1977, NULL, 3, 'tag5', 'Tin hieu 977', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1978, NULL, 3, 'tag5', 'Tin hieu 978', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1979, NULL, 3, 'tag5', 'Tin hieu 979', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1980, NULL, 3, 'tag5', 'Tin hieu 980', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1981, NULL, 3, 'tag5', 'Tin hieu 981', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1982, NULL, 3, 'tag5', 'Tin hieu 982', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1983, NULL, 3, 'tag5', 'Tin hieu 983', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1984, NULL, 3, 'tag5', 'Tin hieu 984', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1985, NULL, 3, 'tag5', 'Tin hieu 985', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1986, NULL, 3, 'tag5', 'Tin hieu 986', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1987, NULL, 3, 'tag5', 'Tin hieu 987', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1988, NULL, 3, 'tag5', 'Tin hieu 988', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1989, NULL, 3, 'tag5', 'Tin hieu 989', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1990, NULL, 3, 'tag5', 'Tin hieu 990', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1991, NULL, 3, 'tag5', 'Tin hieu 991', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:28'),
(1992, NULL, 3, 'tag5', 'Tin hieu 992', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:28'),
(1993, NULL, 3, 'tag5', 'Tin hieu 993', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1994, NULL, 3, 'tag5', 'Tin hieu 994', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1995, NULL, 3, 'tag5', 'Tin hieu 995', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1996, NULL, 3, 'tag5', 'Tin hieu 996', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1997, NULL, 3, 'tag5', 'Tin hieu 997', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1998, NULL, 3, 'tag5', 'Tin hieu 998', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(1999, NULL, 3, 'tag5', 'Tin hieu 999', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2000, NULL, 3, 'tag5', 'Tin hieu 1000', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2001, NULL, 3, 'tag2', 'Tin hieu 1001', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2002, NULL, 3, 'tag2', 'Tin hieu 1002', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2003, NULL, 3, 'tag2', 'Tin hieu 1003', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2004, NULL, 3, 'tag2', 'Tin hieu 1004', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2005, NULL, 3, 'tag2', 'Tin hieu 1005', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2006, NULL, 3, 'tag2', 'Tin hieu 1006', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2007, NULL, 3, 'tag2', 'Tin hieu 1007', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2008, NULL, 5, 'tag2', 'Tin hieu 507', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2009, NULL, 5, 'tag2', 'Tin hieu 508', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2010, NULL, 5, 'tag2', 'Tin hieu 509', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2011, NULL, 5, 'tag2', 'Tin hieu 510', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2012, NULL, 5, 'tag2', 'Tin hieu 511', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2013, NULL, 5, 'tag2', 'Tin hieu 512', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2014, NULL, 5, 'tag2', 'Tin hieu 513', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2015, NULL, 5, 'tag2', 'Tin hieu 514', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2016, NULL, 5, 'tag2', 'Tin hieu 515', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2017, NULL, 5, 'tag2', 'Tin hieu 516', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2018, NULL, 5, 'tag2', 'Tin hieu 517', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2019, NULL, 5, 'tag2', 'Tin hieu 518', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2020, NULL, 5, 'tag2', 'Tin hieu 519', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2021, NULL, 5, 'tag2', 'Tin hieu 520', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2022, NULL, 5, 'tag2', 'Tin hieu 521', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2023, NULL, 5, 'tag2', 'Tin hieu 522', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2024, NULL, 5, 'tag2', 'Tin hieu 523', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2025, NULL, 5, 'tag2', 'Tin hieu 524', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2026, NULL, 5, 'tag2', 'Tin hieu 525', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2027, NULL, 5, 'tag2', 'Tin hieu 526', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2028, NULL, 5, 'tag2', 'Tin hieu 527', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2029, NULL, 5, 'tag2', 'Tin hieu 528', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2030, NULL, 5, 'tag2', 'Tin hieu 529', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2031, NULL, 5, 'tag2', 'Tin hieu 530', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2032, NULL, 5, 'tag2', 'Tin hieu 531', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2033, NULL, 5, 'tag2', 'Tin hieu 532', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2034, NULL, 5, 'tag2', 'Tin hieu 533', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2035, NULL, 5, 'tag2', 'Tin hieu 534', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2036, NULL, 5, 'tag2', 'Tin hieu 535', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2037, NULL, 5, 'tag2', 'Tin hieu 536', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2038, NULL, 5, 'tag2', 'Tin hieu 537', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2039, NULL, 5, 'tag2', 'Tin hieu 538', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2040, NULL, 5, 'tag2', 'Tin hieu 539', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2041, NULL, 5, 'tag2', 'Tin hieu 540', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2042, NULL, 5, 'tag2', 'Tin hieu 541', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2043, NULL, 5, 'tag2', 'Tin hieu 542', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2044, NULL, 5, 'tag2', 'Tin hieu 543', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2045, NULL, 5, 'tag2', 'Tin hieu 544', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2046, NULL, 5, 'tag2', 'Tin hieu 545', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2047, NULL, 5, 'tag2', 'Tin hieu 546', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2048, NULL, 5, 'tag2', 'Tin hieu 547', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2049, NULL, 5, 'tag2', 'Tin hieu 548', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2050, NULL, 5, 'tag2', 'Tin hieu 549', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2051, NULL, 5, 'tag2', 'Tin hieu 550', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2052, NULL, 5, 'tag2', 'Tin hieu 551', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2053, NULL, 5, 'tag2', 'Tin hieu 552', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2054, NULL, 5, 'tag2', 'Tin hieu 553', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2055, NULL, 5, 'tag2', 'Tin hieu 554', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2056, NULL, 5, 'tag2', 'Tin hieu 555', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2057, NULL, 5, 'tag2', 'Tin hieu 556', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2058, NULL, 5, 'tag2', 'Tin hieu 557', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2059, NULL, 5, 'tag2', 'Tin hieu 558', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2060, NULL, 5, 'tag2', 'Tin hieu 559', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2061, NULL, 5, 'tag2', 'Tin hieu 560', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2062, NULL, 5, 'tag2', 'Tin hieu 561', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2063, NULL, 5, 'tag2', 'Tin hieu 562', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(2064, NULL, 5, 'tag2', 'Tin hieu 563', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2065, NULL, 5, 'tag2', 'Tin hieu 564', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2066, NULL, 5, 'tag2', 'Tin hieu 565', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2067, NULL, 5, 'tag2', 'Tin hieu 566', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2068, NULL, 5, 'tag2', 'Tin hieu 567', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2069, NULL, 5, 'tag2', 'Tin hieu 568', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2070, NULL, 5, 'tag2', 'Tin hieu 569', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2071, NULL, 5, 'tag2', 'Tin hieu 570', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2072, NULL, 5, 'tag2', 'Tin hieu 571', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2073, NULL, 5, 'tag2', 'Tin hieu 572', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2074, NULL, 5, 'tag2', 'Tin hieu 573', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2075, NULL, 5, 'tag2', 'Tin hieu 574', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2076, NULL, 5, 'tag2', 'Tin hieu 575', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2077, NULL, 5, 'tag2', 'Tin hieu 576', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2078, NULL, 5, 'tag2', 'Tin hieu 577', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2079, NULL, 5, 'tag2', 'Tin hieu 578', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2080, NULL, 5, 'tag2', 'Tin hieu 579', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2081, NULL, 5, 'tag2', 'Tin hieu 580', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2082, NULL, 5, 'tag2', 'Tin hieu 581', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2083, NULL, 5, 'tag2', 'Tin hieu 582', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2084, NULL, 5, 'tag2', 'Tin hieu 583', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2085, NULL, 5, 'tag2', 'Tin hieu 584', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2086, NULL, 5, 'tag2', 'Tin hieu 585', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2087, NULL, 5, 'tag2', 'Tin hieu 586', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2088, NULL, 5, 'tag2', 'Tin hieu 587', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2089, NULL, 5, 'tag2', 'Tin hieu 588', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2090, NULL, 5, 'tag2', 'Tin hieu 589', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2091, NULL, 5, 'tag2', 'Tin hieu 590', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2092, NULL, 5, 'tag2', 'Tin hieu 591', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2093, NULL, 5, 'tag2', 'Tin hieu 592', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2094, NULL, 5, 'tag2', 'Tin hieu 593', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2095, NULL, 5, 'tag2', 'Tin hieu 594', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2096, NULL, 5, 'tag2', 'Tin hieu 595', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2097, NULL, 5, 'tag2', 'Tin hieu 596', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2098, NULL, 5, 'tag2', 'Tin hieu 597', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2099, NULL, 5, 'tag2', 'Tin hieu 598', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2100, NULL, 5, 'tag2', 'Tin hieu 599', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2101, NULL, 5, 'tag2', 'Tin hieu 600', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2102, NULL, 5, 'tag2', 'Tin hieu 601', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2103, NULL, 5, 'tag2', 'Tin hieu 602', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2104, NULL, 5, 'tag2', 'Tin hieu 603', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2105, NULL, 5, 'tag2', 'Tin hieu 604', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2106, NULL, 5, 'tag2', 'Tin hieu 605', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2107, NULL, 5, 'tag2', 'Tin hieu 606', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2108, NULL, 5, 'tag2', 'Tin hieu 607', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2109, NULL, 5, 'tag2', 'Tin hieu 608', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2110, NULL, 5, 'tag2', 'Tin hieu 609', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2111, NULL, 5, 'tag2', 'Tin hieu 610', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2112, NULL, 5, 'tag2', 'Tin hieu 611', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2113, NULL, 5, 'tag2', 'Tin hieu 612', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2114, NULL, 5, 'tag2', 'Tin hieu 613', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2115, NULL, 5, 'tag2', 'Tin hieu 614', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2116, NULL, 5, 'tag2', 'Tin hieu 615', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2117, NULL, 5, 'tag2', 'Tin hieu 616', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2118, NULL, 5, 'tag2', 'Tin hieu 617', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2119, NULL, 5, 'tag2', 'Tin hieu 618', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2120, NULL, 5, 'tag2', 'Tin hieu 619', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2121, NULL, 5, 'tag2', 'Tin hieu 620', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2122, NULL, 5, 'tag2', 'Tin hieu 621', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2123, NULL, 5, 'tag2', 'Tin hieu 622', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2124, NULL, 5, 'tag2', 'Tin hieu 623', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2125, NULL, 5, 'tag2', 'Tin hieu 624', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2126, NULL, 5, 'tag2', 'Tin hieu 625', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2127, NULL, 5, 'tag2', 'Tin hieu 626', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2128, NULL, 5, 'tag2', 'Tin hieu 627', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2129, NULL, 5, 'tag2', 'Tin hieu 628', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2130, NULL, 5, 'tag2', 'Tin hieu 629', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2131, NULL, 5, 'tag2', 'Tin hieu 630', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2132, NULL, 5, 'tag2', 'Tin hieu 631', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2133, NULL, 5, 'tag2', 'Tin hieu 632', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2134, NULL, 5, 'tag2', 'Tin hieu 633', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2135, NULL, 5, 'tag2', 'Tin hieu 634', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2136, NULL, 5, 'tag2', 'Tin hieu 635', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2137, NULL, 5, 'tag2', 'Tin hieu 636', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2138, NULL, 5, 'tag2', 'Tin hieu 637', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2139, NULL, 5, 'tag2', 'Tin hieu 638', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2140, NULL, 5, 'tag2', 'Tin hieu 639', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2141, NULL, 5, 'tag2', 'Tin hieu 640', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2142, NULL, 5, 'tag2', 'Tin hieu 641', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2143, NULL, 5, 'tag2', 'Tin hieu 642', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2144, NULL, 5, 'tag2', 'Tin hieu 643', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2145, NULL, 5, 'tag2', 'Tin hieu 644', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2146, NULL, 5, 'tag2', 'Tin hieu 645', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2147, NULL, 5, 'tag2', 'Tin hieu 646', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:29'),
(2148, NULL, 5, 'tag2', 'Tin hieu 647', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2149, NULL, 5, 'tag2', 'Tin hieu 648', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2150, NULL, 5, 'tag2', 'Tin hieu 649', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:29'),
(2151, NULL, 5, 'tag2', 'Tin hieu 650', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2152, NULL, 5, 'tag2', 'Tin hieu 651', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2153, NULL, 5, 'tag2', 'Tin hieu 652', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2154, NULL, 5, 'tag2', 'Tin hieu 653', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2155, NULL, 5, 'tag2', 'Tin hieu 654', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2156, NULL, 5, 'tag2', 'Tin hieu 655', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2157, NULL, 5, 'tag2', 'Tin hieu 656', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2158, NULL, 5, 'tag2', 'Tin hieu 657', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2159, NULL, 5, 'tag2', 'Tin hieu 658', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2160, NULL, 5, 'tag2', 'Tin hieu 659', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2161, NULL, 5, 'tag2', 'Tin hieu 660', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2162, NULL, 5, 'tag2', 'Tin hieu 661', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2163, NULL, 5, 'tag2', 'Tin hieu 662', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2164, NULL, 5, 'tag2', 'Tin hieu 663', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2165, NULL, 5, 'tag2', 'Tin hieu 664', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2166, NULL, 5, 'tag2', 'Tin hieu 665', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2167, NULL, 5, 'tag2', 'Tin hieu 666', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2168, NULL, 5, 'tag2', 'Tin hieu 667', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2169, NULL, 5, 'tag2', 'Tin hieu 668', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2170, NULL, 5, 'tag2', 'Tin hieu 669', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2171, NULL, 5, 'tag2', 'Tin hieu 670', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2172, NULL, 5, 'tag2', 'Tin hieu 671', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2173, NULL, 5, 'tag2', 'Tin hieu 672', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2174, NULL, 5, 'tag2', 'Tin hieu 673', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2175, NULL, 5, 'tag2', 'Tin hieu 674', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2176, NULL, 5, 'tag2', 'Tin hieu 675', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2177, NULL, 5, 'tag2', 'Tin hieu 676', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2178, NULL, 5, 'tag2', 'Tin hieu 677', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2179, NULL, 5, 'tag2', 'Tin hieu 678', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2180, NULL, 5, 'tag2', 'Tin hieu 679', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2181, NULL, 5, 'tag2', 'Tin hieu 680', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2182, NULL, 5, 'tag2', 'Tin hieu 681', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2183, NULL, 5, 'tag2', 'Tin hieu 682', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2184, NULL, 5, 'tag2', 'Tin hieu 683', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2185, NULL, 5, 'tag2', 'Tin hieu 684', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2186, NULL, 5, 'tag2', 'Tin hieu 685', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2187, NULL, 5, 'tag2', 'Tin hieu 686', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2188, NULL, 5, 'tag2', 'Tin hieu 687', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2189, NULL, 5, 'tag2', 'Tin hieu 688', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2190, NULL, 5, 'tag2', 'Tin hieu 689', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2191, NULL, 5, 'tag2', 'Tin hieu 690', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2192, NULL, 5, 'tag2', 'Tin hieu 691', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2193, NULL, 5, 'tag2', 'Tin hieu 692', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2194, NULL, 5, 'tag2', 'Tin hieu 693', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2195, NULL, 5, 'tag2', 'Tin hieu 694', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2196, NULL, 5, 'tag2', 'Tin hieu 695', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2197, NULL, 5, 'tag2', 'Tin hieu 696', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2198, NULL, 5, 'tag2', 'Tin hieu 697', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2199, NULL, 5, 'tag2', 'Tin hieu 698', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2200, NULL, 5, 'tag2', 'Tin hieu 699', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2201, NULL, 5, 'tag4', 'Tin hieu 700', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2202, NULL, 5, 'tag4', 'Tin hieu 701', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2203, NULL, 5, 'tag4', 'Tin hieu 702', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2204, NULL, 5, 'tag4', 'Tin hieu 703', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2205, NULL, 5, 'tag4', 'Tin hieu 704', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2206, NULL, 5, 'tag4', 'Tin hieu 705', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2207, NULL, 5, 'tag4', 'Tin hieu 706', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2208, NULL, 5, 'tag4', 'Tin hieu 707', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2209, NULL, 5, 'tag4', 'Tin hieu 708', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2210, NULL, 5, 'tag4', 'Tin hieu 709', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2211, NULL, 5, 'tag4', 'Tin hieu 710', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2212, NULL, 5, 'tag4', 'Tin hieu 711', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2213, NULL, 5, 'tag4', 'Tin hieu 712', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2214, NULL, 5, 'tag4', 'Tin hieu 713', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2215, NULL, 5, 'tag4', 'Tin hieu 714', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2216, NULL, 5, 'tag4', 'Tin hieu 715', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2217, NULL, 5, 'tag4', 'Tin hieu 716', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2218, NULL, 5, 'tag4', 'Tin hieu 717', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2219, NULL, 5, 'tag4', 'Tin hieu 718', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2220, NULL, 5, 'tag4', 'Tin hieu 719', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2221, NULL, 5, 'tag4', 'Tin hieu 720', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2222, NULL, 5, 'tag4', 'Tin hieu 721', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2223, NULL, 5, 'tag4', 'Tin hieu 722', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2224, NULL, 5, 'tag4', 'Tin hieu 723', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2225, NULL, 5, 'tag4', 'Tin hieu 724', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2226, NULL, 5, 'tag4', 'Tin hieu 725', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2227, NULL, 5, 'tag4', 'Tin hieu 726', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2228, NULL, 5, 'tag4', 'Tin hieu 727', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2229, NULL, 5, 'tag4', 'Tin hieu 728', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2230, NULL, 5, 'tag4', 'Tin hieu 729', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2231, NULL, 5, 'tag4', 'Tin hieu 730', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2232, NULL, 5, 'tag4', 'Tin hieu 731', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2233, NULL, 5, 'tag4', 'Tin hieu 732', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2234, NULL, 5, 'tag4', 'Tin hieu 733', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2235, NULL, 5, 'tag4', 'Tin hieu 734', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2236, NULL, 5, 'tag4', 'Tin hieu 735', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2237, NULL, 5, 'tag4', 'Tin hieu 736', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2238, NULL, 5, 'tag4', 'Tin hieu 737', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2239, NULL, 5, 'tag4', 'Tin hieu 738', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2240, NULL, 5, 'tag4', 'Tin hieu 739', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2241, NULL, 5, 'tag4', 'Tin hieu 740', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2242, NULL, 5, 'tag4', 'Tin hieu 741', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2243, NULL, 5, 'tag4', 'Tin hieu 742', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2244, NULL, 5, 'tag4', 'Tin hieu 743', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2245, NULL, 5, 'tag4', 'Tin hieu 744', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2246, NULL, 5, 'tag4', 'Tin hieu 745', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2247, NULL, 5, 'tag4', 'Tin hieu 746', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2248, NULL, 5, 'tag4', 'Tin hieu 747', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2249, NULL, 5, 'tag4', 'Tin hieu 748', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2250, NULL, 5, 'tag4', 'Tin hieu 749', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2251, NULL, 5, 'tag4', 'Tin hieu 750', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2252, NULL, 5, 'tag4', 'Tin hieu 751', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2253, NULL, 5, 'tag4', 'Tin hieu 752', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2254, NULL, 5, 'tag4', 'Tin hieu 753', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2255, NULL, 5, 'tag4', 'Tin hieu 754', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2256, NULL, 5, 'tag4', 'Tin hieu 755', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2257, NULL, 5, 'tag4', 'Tin hieu 756', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2258, NULL, 5, 'tag4', 'Tin hieu 757', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2259, NULL, 5, 'tag4', 'Tin hieu 758', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2260, NULL, 5, 'tag4', 'Tin hieu 759', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2261, NULL, 5, 'tag4', 'Tin hieu 760', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2262, NULL, 5, 'tag4', 'Tin hieu 761', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2263, NULL, 5, 'tag4', 'Tin hieu 762', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2264, NULL, 5, 'tag4', 'Tin hieu 763', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2265, NULL, 5, 'tag4', 'Tin hieu 764', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2266, NULL, 5, 'tag4', 'Tin hieu 765', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2267, NULL, 5, 'tag4', 'Tin hieu 766', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2268, NULL, 5, 'tag4', 'Tin hieu 767', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2269, NULL, 5, 'tag4', 'Tin hieu 768', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2270, NULL, 5, 'tag4', 'Tin hieu 769', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2271, NULL, 5, 'tag4', 'Tin hieu 770', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2272, NULL, 5, 'tag4', 'Tin hieu 771', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2273, NULL, 5, 'tag4', 'Tin hieu 772', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2274, NULL, 5, 'tag4', 'Tin hieu 773', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2275, NULL, 5, 'tag4', 'Tin hieu 774', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2276, NULL, 5, 'tag4', 'Tin hieu 775', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2277, NULL, 5, 'tag4', 'Tin hieu 776', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2278, NULL, 5, 'tag4', 'Tin hieu 777', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2279, NULL, 5, 'tag4', 'Tin hieu 778', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2280, NULL, 5, 'tag4', 'Tin hieu 779', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2281, NULL, 5, 'tag4', 'Tin hieu 780', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2282, NULL, 5, 'tag4', 'Tin hieu 781', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2283, NULL, 5, 'tag4', 'Tin hieu 782', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2284, NULL, 5, 'tag4', 'Tin hieu 783', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2285, NULL, 5, 'tag4', 'Tin hieu 784', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2286, NULL, 5, 'tag4', 'Tin hieu 785', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2287, NULL, 5, 'tag4', 'Tin hieu 786', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2288, NULL, 5, 'tag4', 'Tin hieu 787', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2289, NULL, 5, 'tag4', 'Tin hieu 788', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2290, NULL, 5, 'tag4', 'Tin hieu 789', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2291, NULL, 5, 'tag4', 'Tin hieu 790', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2292, NULL, 5, 'tag4', 'Tin hieu 791', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2293, NULL, 5, 'tag4', 'Tin hieu 792', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2294, NULL, 5, 'tag4', 'Tin hieu 793', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2295, NULL, 5, 'tag4', 'Tin hieu 794', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2296, NULL, 5, 'tag4', 'Tin hieu 795', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2297, NULL, 5, 'tag4', 'Tin hieu 796', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2298, NULL, 5, 'tag4', 'Tin hieu 797', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2299, NULL, 5, 'tag4', 'Tin hieu 798', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2300, NULL, 5, 'tag4', 'Tin hieu 799', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2301, NULL, 5, 'tag4', 'Tin hieu 800', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2302, NULL, 5, 'tag4', 'Tin hieu 801', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2303, NULL, 5, 'tag4', 'Tin hieu 802', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2304, NULL, 5, 'tag4', 'Tin hieu 803', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2305, NULL, 5, 'tag4', 'Tin hieu 804', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2306, NULL, 5, 'tag4', 'Tin hieu 805', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2307, NULL, 5, 'tag4', 'Tin hieu 806', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2308, NULL, 5, 'tag4', 'Tin hieu 807', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2309, NULL, 5, 'tag4', 'Tin hieu 808', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2310, NULL, 5, 'tag4', 'Tin hieu 809', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:30'),
(2311, NULL, 5, 'tag4', 'Tin hieu 810', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:30'),
(2312, NULL, 5, 'tag4', 'Tin hieu 811', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2313, NULL, 5, 'tag4', 'Tin hieu 812', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2314, NULL, 5, 'tag4', 'Tin hieu 813', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2315, NULL, 5, 'tag4', 'Tin hieu 814', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2316, NULL, 5, 'tag4', 'Tin hieu 815', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2317, NULL, 5, 'tag4', 'Tin hieu 816', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2318, NULL, 5, 'tag4', 'Tin hieu 817', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2319, NULL, 5, 'tag4', 'Tin hieu 818', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2320, NULL, 5, 'tag4', 'Tin hieu 819', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2321, NULL, 5, 'tag4', 'Tin hieu 820', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2322, NULL, 5, 'tag4', 'Tin hieu 821', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2323, NULL, 5, 'tag4', 'Tin hieu 822', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2324, NULL, 5, 'tag4', 'Tin hieu 823', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2325, NULL, 5, 'tag4', 'Tin hieu 824', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2326, NULL, 5, 'tag4', 'Tin hieu 825', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2327, NULL, 5, 'tag4', 'Tin hieu 826', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2328, NULL, 5, 'tag4', 'Tin hieu 827', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2329, NULL, 5, 'tag4', 'Tin hieu 828', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2330, NULL, 5, 'tag4', 'Tin hieu 829', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2331, NULL, 5, 'tag4', 'Tin hieu 830', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2332, NULL, 5, 'tag4', 'Tin hieu 831', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2333, NULL, 5, 'tag4', 'Tin hieu 832', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2334, NULL, 5, 'tag4', 'Tin hieu 833', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2335, NULL, 5, 'tag4', 'Tin hieu 834', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2336, NULL, 5, 'tag4', 'Tin hieu 835', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2337, NULL, 5, 'tag4', 'Tin hieu 836', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2338, NULL, 5, 'tag4', 'Tin hieu 837', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2339, NULL, 5, 'tag4', 'Tin hieu 838', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2340, NULL, 5, 'tag4', 'Tin hieu 839', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2341, NULL, 5, 'tag4', 'Tin hieu 840', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2342, NULL, 5, 'tag4', 'Tin hieu 841', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2343, NULL, 5, 'tag4', 'Tin hieu 842', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2344, NULL, 5, 'tag4', 'Tin hieu 843', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2345, NULL, 5, 'tag4', 'Tin hieu 844', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2346, NULL, 5, 'tag4', 'Tin hieu 845', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2347, NULL, 5, 'tag4', 'Tin hieu 846', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2348, NULL, 5, 'tag4', 'Tin hieu 847', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2349, NULL, 5, 'tag4', 'Tin hieu 848', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2350, NULL, 5, 'tag4', 'Tin hieu 849', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2351, NULL, 5, 'tag4', 'Tin hieu 850', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2352, NULL, 5, 'tag4', 'Tin hieu 851', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2353, NULL, 5, 'tag4', 'Tin hieu 852', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2354, NULL, 5, 'tag4', 'Tin hieu 853', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2355, NULL, 5, 'tag4', 'Tin hieu 854', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2356, NULL, 5, 'tag4', 'Tin hieu 855', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2357, NULL, 5, 'tag4', 'Tin hieu 856', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2358, NULL, 5, 'tag4', 'Tin hieu 857', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2359, NULL, 5, 'tag4', 'Tin hieu 858', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2360, NULL, 5, 'tag4', 'Tin hieu 859', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2361, NULL, 5, 'tag4', 'Tin hieu 860', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2362, NULL, 5, 'tag4', 'Tin hieu 861', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2363, NULL, 5, 'tag4', 'Tin hieu 862', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2364, NULL, 5, 'tag4', 'Tin hieu 863', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2365, NULL, 5, 'tag4', 'Tin hieu 864', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2366, NULL, 5, 'tag4', 'Tin hieu 865', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2367, NULL, 5, 'tag4', 'Tin hieu 866', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2368, NULL, 5, 'tag4', 'Tin hieu 867', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2369, NULL, 5, 'tag4', 'Tin hieu 868', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2370, NULL, 5, 'tag4', 'Tin hieu 869', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2371, NULL, 5, 'tag4', 'Tin hieu 870', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2372, NULL, 5, 'tag4', 'Tin hieu 871', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2373, NULL, 5, 'tag4', 'Tin hieu 872', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2374, NULL, 5, 'tag4', 'Tin hieu 873', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2375, NULL, 5, 'tag4', 'Tin hieu 874', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2376, NULL, 5, 'tag4', 'Tin hieu 875', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2377, NULL, 5, 'tag4', 'Tin hieu 876', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2378, NULL, 5, 'tag4', 'Tin hieu 877', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2379, NULL, 5, 'tag4', 'Tin hieu 878', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2380, NULL, 5, 'tag4', 'Tin hieu 879', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2381, NULL, 5, 'tag4', 'Tin hieu 880', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2382, NULL, 5, 'tag4', 'Tin hieu 881', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2383, NULL, 5, 'tag4', 'Tin hieu 882', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2384, NULL, 5, 'tag4', 'Tin hieu 883', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2385, NULL, 5, 'tag4', 'Tin hieu 884', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2386, NULL, 5, 'tag4', 'Tin hieu 885', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2387, NULL, 5, 'tag4', 'Tin hieu 886', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2388, NULL, 5, 'tag4', 'Tin hieu 887', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2389, NULL, 5, 'tag4', 'Tin hieu 888', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2390, NULL, 5, 'tag4', 'Tin hieu 889', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2391, NULL, 5, 'tag4', 'Tin hieu 890', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2392, NULL, 5, 'tag4', 'Tin hieu 891', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2393, NULL, 5, 'tag4', 'Tin hieu 892', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2394, NULL, 5, 'tag4', 'Tin hieu 893', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2395, NULL, 5, 'tag4', 'Tin hieu 894', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2396, NULL, 5, 'tag4', 'Tin hieu 895', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2397, NULL, 5, 'tag4', 'Tin hieu 896', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2398, NULL, 5, 'tag4', 'Tin hieu 897', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2399, NULL, 5, 'tag4', 'Tin hieu 898', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2400, NULL, 5, 'tag4', 'Tin hieu 899', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2401, NULL, 5, 'tag2', 'Tin hieu 900', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2402, NULL, 5, 'tag2', 'Tin hieu 901', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2403, NULL, 5, 'tag2', 'Tin hieu 902', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2404, NULL, 5, 'tag2', 'Tin hieu 903', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2405, NULL, 5, 'tag2', 'Tin hieu 904', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2406, NULL, 5, 'tag2', 'Tin hieu 905', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2407, NULL, 5, 'tag2', 'Tin hieu 906', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2408, NULL, 5, 'tag2', 'Tin hieu 907', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2409, NULL, 5, 'tag2', 'Tin hieu 908', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2410, NULL, 5, 'tag2', 'Tin hieu 909', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2411, NULL, 5, 'tag2', 'Tin hieu 910', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2412, NULL, 5, 'tag2', 'Tin hieu 911', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2413, NULL, 5, 'tag2', 'Tin hieu 912', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2414, NULL, 5, 'tag2', 'Tin hieu 913', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2415, NULL, 5, 'tag2', 'Tin hieu 914', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2416, NULL, 5, 'tag2', 'Tin hieu 915', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2417, NULL, 5, 'tag2', 'Tin hieu 916', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2418, NULL, 5, 'tag2', 'Tin hieu 917', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2419, NULL, 5, 'tag2', 'Tin hieu 918', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2420, NULL, 5, 'tag2', 'Tin hieu 919', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2421, NULL, 5, 'tag2', 'Tin hieu 920', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2422, NULL, 5, 'tag2', 'Tin hieu 921', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2423, NULL, 5, 'tag2', 'Tin hieu 922', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2424, NULL, 5, 'tag2', 'Tin hieu 923', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2425, NULL, 5, 'tag2', 'Tin hieu 924', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2426, NULL, 5, 'tag2', 'Tin hieu 925', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2427, NULL, 5, 'tag2', 'Tin hieu 926', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2428, NULL, 5, 'tag2', 'Tin hieu 927', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2429, NULL, 5, 'tag2', 'Tin hieu 928', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2430, NULL, 5, 'tag2', 'Tin hieu 929', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2431, NULL, 5, 'tag2', 'Tin hieu 930', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2432, NULL, 5, 'tag2', 'Tin hieu 931', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2433, NULL, 5, 'tag2', 'Tin hieu 932', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2434, NULL, 5, 'tag2', 'Tin hieu 933', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2435, NULL, 5, 'tag2', 'Tin hieu 934', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2436, NULL, 5, 'tag2', 'Tin hieu 935', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2437, NULL, 5, 'tag2', 'Tin hieu 936', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2438, NULL, 5, 'tag2', 'Tin hieu 937', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2439, NULL, 5, 'tag2', 'Tin hieu 938', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2440, NULL, 5, 'tag2', 'Tin hieu 939', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2441, NULL, 5, 'tag2', 'Tin hieu 940', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2442, NULL, 5, 'tag2', 'Tin hieu 941', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2443, NULL, 5, 'tag2', 'Tin hieu 942', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2444, NULL, 5, 'tag2', 'Tin hieu 943', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2445, NULL, 5, 'tag2', 'Tin hieu 944', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2446, NULL, 5, 'tag2', 'Tin hieu 945', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2447, NULL, 5, 'tag2', 'Tin hieu 946', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2448, NULL, 5, 'tag2', 'Tin hieu 947', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2449, NULL, 5, 'tag2', 'Tin hieu 948', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2450, NULL, 5, 'tag2', 'Tin hieu 949', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2451, NULL, 5, 'tag2', 'Tin hieu 950', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2452, NULL, 5, 'tag2', 'Tin hieu 951', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2453, NULL, 5, 'tag2', 'Tin hieu 952', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2454, NULL, 5, 'tag2', 'Tin hieu 953', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2455, NULL, 5, 'tag2', 'Tin hieu 954', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2456, NULL, 5, 'tag2', 'Tin hieu 955', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2457, NULL, 5, 'tag2', 'Tin hieu 956', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2458, NULL, 5, 'tag2', 'Tin hieu 957', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2459, NULL, 5, 'tag2', 'Tin hieu 958', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2460, NULL, 5, 'tag2', 'Tin hieu 959', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2461, NULL, 5, 'tag2', 'Tin hieu 960', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2462, NULL, 5, 'tag2', 'Tin hieu 961', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2463, NULL, 5, 'tag2', 'Tin hieu 962', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:31'),
(2464, NULL, 5, 'tag2', 'Tin hieu 963', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2465, NULL, 5, 'tag2', 'Tin hieu 964', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:31'),
(2466, NULL, 5, 'tag2', 'Tin hieu 965', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2467, NULL, 5, 'tag2', 'Tin hieu 966', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2468, NULL, 5, 'tag2', 'Tin hieu 967', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2469, NULL, 5, 'tag2', 'Tin hieu 968', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2470, NULL, 5, 'tag2', 'Tin hieu 969', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2471, NULL, 5, 'tag2', 'Tin hieu 970', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2472, NULL, 5, 'tag2', 'Tin hieu 971', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2473, NULL, 5, 'tag2', 'Tin hieu 972', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2474, NULL, 5, 'tag2', 'Tin hieu 973', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2475, NULL, 5, 'tag2', 'Tin hieu 974', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2476, NULL, 5, 'tag2', 'Tin hieu 975', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2477, NULL, 5, 'tag2', 'Tin hieu 976', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2478, NULL, 5, 'tag2', 'Tin hieu 977', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2479, NULL, 5, 'tag2', 'Tin hieu 978', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2480, NULL, 5, 'tag2', 'Tin hieu 979', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2481, NULL, 5, 'tag2', 'Tin hieu 980', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2482, NULL, 5, 'tag2', 'Tin hieu 981', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2483, NULL, 5, 'tag2', 'Tin hieu 982', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2484, NULL, 5, 'tag2', 'Tin hieu 983', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2485, NULL, 5, 'tag2', 'Tin hieu 984', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2486, NULL, 5, 'tag2', 'Tin hieu 985', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2487, NULL, 5, 'tag2', 'Tin hieu 986', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2488, NULL, 5, 'tag2', 'Tin hieu 987', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2489, NULL, 5, 'tag2', 'Tin hieu 988', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2490, NULL, 5, 'tag2', 'Tin hieu 989', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2491, NULL, 5, 'tag2', 'Tin hieu 990', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2492, NULL, 5, 'tag2', 'Tin hieu 991', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2493, NULL, 5, 'tag2', 'Tin hieu 992', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2494, NULL, 5, 'tag2', 'Tin hieu 993', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2495, NULL, 5, 'tag2', 'Tin hieu 994', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2496, NULL, 5, 'tag2', 'Tin hieu 995', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2497, NULL, 5, 'tag2', 'Tin hieu 996', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2498, NULL, 5, 'tag2', 'Tin hieu 997', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2499, NULL, 5, 'tag2', 'Tin hieu 998', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2500, NULL, 5, 'tag2', 'Tin hieu 999', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2501, NULL, 5, 'tag2', 'Tin hieu 1000', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2502, NULL, 5, 'tag2', 'Tin hieu 1001', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2503, NULL, 5, 'tag2', 'Tin hieu 1002', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2504, NULL, 5, 'tag2', 'Tin hieu 1003', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2505, NULL, 5, 'tag2', 'Tin hieu 1004', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2506, NULL, 5, 'tag2', 'Tin hieu 1005', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2507, NULL, 5, 'tag2', 'Tin hieu 1006', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2508, NULL, 5, 'tag2', 'Tin hieu 1007', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2509, NULL, 6, 'tag2', 'Tin hieu 507', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2510, NULL, 6, 'tag2', 'Tin hieu 508', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2511, NULL, 6, 'tag2', 'Tin hieu 509', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2512, NULL, 6, 'tag2', 'Tin hieu 510', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2513, NULL, 6, 'tag2', 'Tin hieu 511', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2514, NULL, 6, 'tag2', 'Tin hieu 512', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2515, NULL, 6, 'tag2', 'Tin hieu 513', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2516, NULL, 6, 'tag2', 'Tin hieu 514', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2517, NULL, 6, 'tag2', 'Tin hieu 515', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2518, NULL, 6, 'tag2', 'Tin hieu 516', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2519, NULL, 6, 'tag2', 'Tin hieu 517', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2520, NULL, 6, 'tag2', 'Tin hieu 518', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(2521, NULL, 6, 'tag2', 'Tin hieu 519', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2522, NULL, 6, 'tag2', 'Tin hieu 520', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2523, NULL, 6, 'tag2', 'Tin hieu 521', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2524, NULL, 6, 'tag2', 'Tin hieu 522', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2525, NULL, 6, 'tag2', 'Tin hieu 523', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2526, NULL, 6, 'tag2', 'Tin hieu 524', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2527, NULL, 6, 'tag2', 'Tin hieu 525', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2528, NULL, 6, 'tag2', 'Tin hieu 526', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2529, NULL, 6, 'tag2', 'Tin hieu 527', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2530, NULL, 6, 'tag2', 'Tin hieu 528', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2531, NULL, 6, 'tag2', 'Tin hieu 529', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2532, NULL, 6, 'tag2', 'Tin hieu 530', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2533, NULL, 6, 'tag2', 'Tin hieu 531', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2534, NULL, 6, 'tag2', 'Tin hieu 532', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2535, NULL, 6, 'tag2', 'Tin hieu 533', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2536, NULL, 6, 'tag2', 'Tin hieu 534', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2537, NULL, 6, 'tag2', 'Tin hieu 535', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2538, NULL, 6, 'tag2', 'Tin hieu 536', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2539, NULL, 6, 'tag2', 'Tin hieu 537', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2540, NULL, 6, 'tag2', 'Tin hieu 538', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2541, NULL, 6, 'tag2', 'Tin hieu 539', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2542, NULL, 6, 'tag2', 'Tin hieu 540', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2543, NULL, 6, 'tag2', 'Tin hieu 541', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2544, NULL, 6, 'tag2', 'Tin hieu 542', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2545, NULL, 6, 'tag2', 'Tin hieu 543', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2546, NULL, 6, 'tag2', 'Tin hieu 544', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2547, NULL, 6, 'tag2', 'Tin hieu 545', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2548, NULL, 6, 'tag2', 'Tin hieu 546', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2549, NULL, 6, 'tag2', 'Tin hieu 547', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2550, NULL, 6, 'tag2', 'Tin hieu 548', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2551, NULL, 6, 'tag2', 'Tin hieu 549', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2552, NULL, 6, 'tag2', 'Tin hieu 550', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2553, NULL, 6, 'tag2', 'Tin hieu 551', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2554, NULL, 6, 'tag2', 'Tin hieu 552', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2555, NULL, 6, 'tag2', 'Tin hieu 553', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2556, NULL, 6, 'tag2', 'Tin hieu 554', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2557, NULL, 6, 'tag2', 'Tin hieu 555', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2558, NULL, 6, 'tag2', 'Tin hieu 556', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2559, NULL, 6, 'tag2', 'Tin hieu 557', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2560, NULL, 6, 'tag2', 'Tin hieu 558', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2561, NULL, 6, 'tag2', 'Tin hieu 559', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2562, NULL, 6, 'tag2', 'Tin hieu 560', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2563, NULL, 6, 'tag2', 'Tin hieu 561', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2564, NULL, 6, 'tag2', 'Tin hieu 562', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2565, NULL, 6, 'tag2', 'Tin hieu 563', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2566, NULL, 6, 'tag2', 'Tin hieu 564', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2567, NULL, 6, 'tag2', 'Tin hieu 565', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2568, NULL, 6, 'tag2', 'Tin hieu 566', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2569, NULL, 6, 'tag2', 'Tin hieu 567', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2570, NULL, 6, 'tag2', 'Tin hieu 568', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2571, NULL, 6, 'tag2', 'Tin hieu 569', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2572, NULL, 6, 'tag2', 'Tin hieu 570', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2573, NULL, 6, 'tag2', 'Tin hieu 571', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2574, NULL, 6, 'tag2', 'Tin hieu 572', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2575, NULL, 6, 'tag2', 'Tin hieu 573', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2576, NULL, 6, 'tag2', 'Tin hieu 574', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2577, NULL, 6, 'tag2', 'Tin hieu 575', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2578, NULL, 6, 'tag2', 'Tin hieu 576', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2579, NULL, 6, 'tag2', 'Tin hieu 577', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2580, NULL, 6, 'tag2', 'Tin hieu 578', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2581, NULL, 6, 'tag2', 'Tin hieu 579', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2582, NULL, 6, 'tag2', 'Tin hieu 580', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2583, NULL, 6, 'tag2', 'Tin hieu 581', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2584, NULL, 6, 'tag2', 'Tin hieu 582', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2585, NULL, 6, 'tag2', 'Tin hieu 583', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2586, NULL, 6, 'tag2', 'Tin hieu 584', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2587, NULL, 6, 'tag2', 'Tin hieu 585', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2588, NULL, 6, 'tag2', 'Tin hieu 586', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2589, NULL, 6, 'tag2', 'Tin hieu 587', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2590, NULL, 6, 'tag2', 'Tin hieu 588', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2591, NULL, 6, 'tag2', 'Tin hieu 589', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2592, NULL, 6, 'tag2', 'Tin hieu 590', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2593, NULL, 6, 'tag2', 'Tin hieu 591', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2594, NULL, 6, 'tag2', 'Tin hieu 592', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2595, NULL, 6, 'tag2', 'Tin hieu 593', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2596, NULL, 6, 'tag2', 'Tin hieu 594', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2597, NULL, 6, 'tag2', 'Tin hieu 595', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2598, NULL, 6, 'tag2', 'Tin hieu 596', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2599, NULL, 6, 'tag2', 'Tin hieu 597', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2600, NULL, 6, 'tag2', 'Tin hieu 598', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2601, NULL, 6, 'tag4', 'Tin hieu 599', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2602, NULL, 6, 'tag4', 'Tin hieu 600', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2603, NULL, 6, 'tag4', 'Tin hieu 601', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2604, NULL, 6, 'tag4', 'Tin hieu 602', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2605, NULL, 6, 'tag4', 'Tin hieu 603', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2606, NULL, 6, 'tag4', 'Tin hieu 604', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2607, NULL, 6, 'tag4', 'Tin hieu 605', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2608, NULL, 6, 'tag4', 'Tin hieu 606', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2609, NULL, 6, 'tag4', 'Tin hieu 607', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2610, NULL, 6, 'tag4', 'Tin hieu 608', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:32'),
(2611, NULL, 6, 'tag4', 'Tin hieu 609', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2612, NULL, 6, 'tag4', 'Tin hieu 610', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:32'),
(2613, NULL, 6, 'tag4', 'Tin hieu 611', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2614, NULL, 6, 'tag4', 'Tin hieu 612', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2615, NULL, 6, 'tag4', 'Tin hieu 613', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2616, NULL, 6, 'tag4', 'Tin hieu 614', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2617, NULL, 6, 'tag4', 'Tin hieu 615', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2618, NULL, 6, 'tag4', 'Tin hieu 616', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2619, NULL, 6, 'tag4', 'Tin hieu 617', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2620, NULL, 6, 'tag4', 'Tin hieu 618', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2621, NULL, 6, 'tag4', 'Tin hieu 619', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2622, NULL, 6, 'tag4', 'Tin hieu 620', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2623, NULL, 6, 'tag4', 'Tin hieu 621', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2624, NULL, 6, 'tag4', 'Tin hieu 622', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2625, NULL, 6, 'tag4', 'Tin hieu 623', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2626, NULL, 6, 'tag4', 'Tin hieu 624', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2627, NULL, 6, 'tag4', 'Tin hieu 625', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2628, NULL, 6, 'tag4', 'Tin hieu 626', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2629, NULL, 6, 'tag4', 'Tin hieu 627', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2630, NULL, 6, 'tag4', 'Tin hieu 628', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2631, NULL, 6, 'tag4', 'Tin hieu 629', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2632, NULL, 6, 'tag4', 'Tin hieu 630', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2633, NULL, 6, 'tag4', 'Tin hieu 631', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2634, NULL, 6, 'tag4', 'Tin hieu 632', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2635, NULL, 6, 'tag4', 'Tin hieu 633', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2636, NULL, 6, 'tag4', 'Tin hieu 634', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2637, NULL, 6, 'tag4', 'Tin hieu 635', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2638, NULL, 6, 'tag4', 'Tin hieu 636', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2639, NULL, 6, 'tag4', 'Tin hieu 637', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2640, NULL, 6, 'tag4', 'Tin hieu 638', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2641, NULL, 6, 'tag4', 'Tin hieu 639', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2642, NULL, 6, 'tag4', 'Tin hieu 640', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2643, NULL, 6, 'tag4', 'Tin hieu 641', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2644, NULL, 6, 'tag4', 'Tin hieu 642', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2645, NULL, 6, 'tag4', 'Tin hieu 643', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2646, NULL, 6, 'tag4', 'Tin hieu 644', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2647, NULL, 6, 'tag4', 'Tin hieu 645', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2648, NULL, 6, 'tag4', 'Tin hieu 646', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2649, NULL, 6, 'tag4', 'Tin hieu 647', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2650, NULL, 6, 'tag4', 'Tin hieu 648', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2651, NULL, 6, 'tag4', 'Tin hieu 649', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2652, NULL, 6, 'tag4', 'Tin hieu 650', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2653, NULL, 6, 'tag4', 'Tin hieu 651', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2654, NULL, 6, 'tag4', 'Tin hieu 652', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2655, NULL, 6, 'tag4', 'Tin hieu 653', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2656, NULL, 6, 'tag4', 'Tin hieu 654', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2657, NULL, 6, 'tag4', 'Tin hieu 655', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2658, NULL, 6, 'tag4', 'Tin hieu 656', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2659, NULL, 6, 'tag4', 'Tin hieu 657', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2660, NULL, 6, 'tag4', 'Tin hieu 658', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2661, NULL, 6, 'tag4', 'Tin hieu 659', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2662, NULL, 6, 'tag4', 'Tin hieu 660', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2663, NULL, 6, 'tag4', 'Tin hieu 661', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2664, NULL, 6, 'tag4', 'Tin hieu 662', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2665, NULL, 6, 'tag4', 'Tin hieu 663', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2666, NULL, 6, 'tag4', 'Tin hieu 664', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2667, NULL, 6, 'tag4', 'Tin hieu 665', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2668, NULL, 6, 'tag4', 'Tin hieu 666', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2669, NULL, 6, 'tag4', 'Tin hieu 667', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2670, NULL, 6, 'tag4', 'Tin hieu 668', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2671, NULL, 6, 'tag4', 'Tin hieu 669', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2672, NULL, 6, 'tag4', 'Tin hieu 670', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2673, NULL, 6, 'tag4', 'Tin hieu 671', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2674, NULL, 6, 'tag4', 'Tin hieu 672', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2675, NULL, 6, 'tag4', 'Tin hieu 673', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2676, NULL, 6, 'tag4', 'Tin hieu 674', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2677, NULL, 6, 'tag4', 'Tin hieu 675', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2678, NULL, 6, 'tag4', 'Tin hieu 676', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2679, NULL, 6, 'tag4', 'Tin hieu 677', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2680, NULL, 6, 'tag4', 'Tin hieu 678', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2681, NULL, 6, 'tag4', 'Tin hieu 679', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2682, NULL, 6, 'tag4', 'Tin hieu 680', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2683, NULL, 6, 'tag4', 'Tin hieu 681', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2684, NULL, 6, 'tag4', 'Tin hieu 682', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2685, NULL, 6, 'tag4', 'Tin hieu 683', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2686, NULL, 6, 'tag4', 'Tin hieu 684', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2687, NULL, 6, 'tag4', 'Tin hieu 685', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2688, NULL, 6, 'tag4', 'Tin hieu 686', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2689, NULL, 6, 'tag4', 'Tin hieu 687', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2690, NULL, 6, 'tag4', 'Tin hieu 688', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2691, NULL, 6, 'tag4', 'Tin hieu 689', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2692, NULL, 6, 'tag4', 'Tin hieu 690', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2693, NULL, 6, 'tag4', 'Tin hieu 691', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2694, NULL, 6, 'tag4', 'Tin hieu 692', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2695, NULL, 6, 'tag4', 'Tin hieu 693', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2696, NULL, 6, 'tag4', 'Tin hieu 694', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2697, NULL, 6, 'tag4', 'Tin hieu 695', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2698, NULL, 6, 'tag4', 'Tin hieu 696', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2699, NULL, 6, 'tag4', 'Tin hieu 697', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2700, NULL, 6, 'tag4', 'Tin hieu 698', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2701, NULL, 6, 'tag4', 'Tin hieu 699', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2702, NULL, 6, 'tag4', 'Tin hieu 700', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2703, NULL, 6, 'tag4', 'Tin hieu 701', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2704, NULL, 6, 'tag4', 'Tin hieu 702', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2705, NULL, 6, 'tag4', 'Tin hieu 703', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2706, NULL, 6, 'tag4', 'Tin hieu 704', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2707, NULL, 6, 'tag4', 'Tin hieu 705', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2708, NULL, 6, 'tag4', 'Tin hieu 706', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2709, NULL, 6, 'tag4', 'Tin hieu 707', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2710, NULL, 6, 'tag4', 'Tin hieu 708', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2711, NULL, 6, 'tag4', 'Tin hieu 709', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2712, NULL, 6, 'tag4', 'Tin hieu 710', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2713, NULL, 6, 'tag4', 'Tin hieu 711', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2714, NULL, 6, 'tag4', 'Tin hieu 712', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:33'),
(2715, NULL, 6, 'tag4', 'Tin hieu 713', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:33'),
(2716, NULL, 6, 'tag4', 'Tin hieu 714', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2717, NULL, 6, 'tag4', 'Tin hieu 715', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2718, NULL, 6, 'tag4', 'Tin hieu 716', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2719, NULL, 6, 'tag4', 'Tin hieu 717', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2720, NULL, 6, 'tag4', 'Tin hieu 718', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2721, NULL, 6, 'tag4', 'Tin hieu 719', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2722, NULL, 6, 'tag4', 'Tin hieu 720', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2723, NULL, 6, 'tag4', 'Tin hieu 721', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2724, NULL, 6, 'tag4', 'Tin hieu 722', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2725, NULL, 6, 'tag4', 'Tin hieu 723', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2726, NULL, 6, 'tag4', 'Tin hieu 724', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2727, NULL, 6, 'tag4', 'Tin hieu 725', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2728, NULL, 6, 'tag4', 'Tin hieu 726', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2729, NULL, 6, 'tag4', 'Tin hieu 727', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2730, NULL, 6, 'tag4', 'Tin hieu 728', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2731, NULL, 6, 'tag4', 'Tin hieu 729', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2732, NULL, 6, 'tag4', 'Tin hieu 730', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2733, NULL, 6, 'tag4', 'Tin hieu 731', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2734, NULL, 6, 'tag4', 'Tin hieu 732', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2735, NULL, 6, 'tag4', 'Tin hieu 733', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2736, NULL, 6, 'tag4', 'Tin hieu 734', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2737, NULL, 6, 'tag4', 'Tin hieu 735', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2738, NULL, 6, 'tag4', 'Tin hieu 736', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2739, NULL, 6, 'tag4', 'Tin hieu 737', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2740, NULL, 6, 'tag4', 'Tin hieu 738', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2741, NULL, 6, 'tag4', 'Tin hieu 739', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2742, NULL, 6, 'tag4', 'Tin hieu 740', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2743, NULL, 6, 'tag4', 'Tin hieu 741', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2744, NULL, 6, 'tag4', 'Tin hieu 742', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2745, NULL, 6, 'tag4', 'Tin hieu 743', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2746, NULL, 6, 'tag4', 'Tin hieu 744', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2747, NULL, 6, 'tag4', 'Tin hieu 745', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2748, NULL, 6, 'tag4', 'Tin hieu 746', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2749, NULL, 6, 'tag4', 'Tin hieu 747', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2750, NULL, 6, 'tag4', 'Tin hieu 748', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2751, NULL, 6, 'tag4', 'Tin hieu 749', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2752, NULL, 6, 'tag4', 'Tin hieu 750', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2753, NULL, 6, 'tag4', 'Tin hieu 751', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2754, NULL, 6, 'tag4', 'Tin hieu 752', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2755, NULL, 6, 'tag4', 'Tin hieu 753', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2756, NULL, 6, 'tag4', 'Tin hieu 754', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2757, NULL, 6, 'tag4', 'Tin hieu 755', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2758, NULL, 6, 'tag4', 'Tin hieu 756', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2759, NULL, 6, 'tag4', 'Tin hieu 757', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2760, NULL, 6, 'tag4', 'Tin hieu 758', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2761, NULL, 6, 'tag4', 'Tin hieu 759', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2762, NULL, 6, 'tag4', 'Tin hieu 760', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2763, NULL, 6, 'tag4', 'Tin hieu 761', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2764, NULL, 6, 'tag4', 'Tin hieu 762', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2765, NULL, 6, 'tag4', 'Tin hieu 763', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2766, NULL, 6, 'tag4', 'Tin hieu 764', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2767, NULL, 6, 'tag4', 'Tin hieu 765', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2768, NULL, 6, 'tag4', 'Tin hieu 766', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2769, NULL, 6, 'tag4', 'Tin hieu 767', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2770, NULL, 6, 'tag4', 'Tin hieu 768', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2771, NULL, 6, 'tag4', 'Tin hieu 769', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2772, NULL, 6, 'tag4', 'Tin hieu 770', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2773, NULL, 6, 'tag4', 'Tin hieu 771', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2774, NULL, 6, 'tag4', 'Tin hieu 772', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2775, NULL, 6, 'tag4', 'Tin hieu 773', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2776, NULL, 6, 'tag4', 'Tin hieu 774', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2777, NULL, 6, 'tag4', 'Tin hieu 775', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2778, NULL, 6, 'tag4', 'Tin hieu 776', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2779, NULL, 6, 'tag4', 'Tin hieu 777', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2780, NULL, 6, 'tag4', 'Tin hieu 778', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2781, NULL, 6, 'tag4', 'Tin hieu 779', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2782, NULL, 6, 'tag4', 'Tin hieu 780', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2783, NULL, 6, 'tag4', 'Tin hieu 781', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2784, NULL, 6, 'tag4', 'Tin hieu 782', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2785, NULL, 6, 'tag4', 'Tin hieu 783', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2786, NULL, 6, 'tag4', 'Tin hieu 784', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2787, NULL, 6, 'tag4', 'Tin hieu 785', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2788, NULL, 6, 'tag4', 'Tin hieu 786', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2789, NULL, 6, 'tag4', 'Tin hieu 787', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2790, NULL, 6, 'tag4', 'Tin hieu 788', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2791, NULL, 6, 'tag4', 'Tin hieu 789', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2792, NULL, 6, 'tag4', 'Tin hieu 790', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2793, NULL, 6, 'tag4', 'Tin hieu 791', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2794, NULL, 6, 'tag4', 'Tin hieu 792', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2795, NULL, 6, 'tag4', 'Tin hieu 793', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2796, NULL, 6, 'tag4', 'Tin hieu 794', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2797, NULL, 6, 'tag4', 'Tin hieu 795', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2798, NULL, 6, 'tag4', 'Tin hieu 796', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2799, NULL, 6, 'tag4', 'Tin hieu 797', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2800, NULL, 6, 'tag4', 'Tin hieu 798', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2801, NULL, 6, 'tag1', 'Tin hieu 799', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2802, NULL, 6, 'tag1', 'Tin hieu 800', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2803, NULL, 6, 'tag1', 'Tin hieu 801', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2804, NULL, 6, 'tag1', 'Tin hieu 802', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2805, NULL, 6, 'tag1', 'Tin hieu 803', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2806, NULL, 6, 'tag1', 'Tin hieu 804', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2807, NULL, 6, 'tag1', 'Tin hieu 805', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2808, NULL, 6, 'tag1', 'Tin hieu 806', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2809, NULL, 6, 'tag1', 'Tin hieu 807', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2810, NULL, 6, 'tag1', 'Tin hieu 808', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2811, NULL, 6, 'tag1', 'Tin hieu 809', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2812, NULL, 6, 'tag1', 'Tin hieu 810', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2813, NULL, 6, 'tag1', 'Tin hieu 811', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2814, NULL, 6, 'tag1', 'Tin hieu 812', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2815, NULL, 6, 'tag1', 'Tin hieu 813', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2816, NULL, 6, 'tag1', 'Tin hieu 814', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2817, NULL, 6, 'tag1', 'Tin hieu 815', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2818, NULL, 6, 'tag1', 'Tin hieu 816', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2819, NULL, 6, 'tag1', 'Tin hieu 817', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2820, NULL, 6, 'tag1', 'Tin hieu 818', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2821, NULL, 6, 'tag1', 'Tin hieu 819', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2822, NULL, 6, 'tag1', 'Tin hieu 820', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2823, NULL, 6, 'tag1', 'Tin hieu 821', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2824, NULL, 6, 'tag1', 'Tin hieu 822', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2825, NULL, 6, 'tag1', 'Tin hieu 823', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2826, NULL, 6, 'tag1', 'Tin hieu 824', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2827, NULL, 6, 'tag1', 'Tin hieu 825', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:34'),
(2828, NULL, 6, 'tag1', 'Tin hieu 826', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:34'),
(2829, NULL, 6, 'tag1', 'Tin hieu 827', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2830, NULL, 6, 'tag1', 'Tin hieu 828', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2831, NULL, 6, 'tag1', 'Tin hieu 829', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2832, NULL, 6, 'tag1', 'Tin hieu 830', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2833, NULL, 6, 'tag1', 'Tin hieu 831', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2834, NULL, 6, 'tag1', 'Tin hieu 832', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2835, NULL, 6, 'tag1', 'Tin hieu 833', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2836, NULL, 6, 'tag1', 'Tin hieu 834', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2837, NULL, 6, 'tag1', 'Tin hieu 835', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2838, NULL, 6, 'tag1', 'Tin hieu 836', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2839, NULL, 6, 'tag1', 'Tin hieu 837', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2840, NULL, 6, 'tag1', 'Tin hieu 838', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2841, NULL, 6, 'tag1', 'Tin hieu 839', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2842, NULL, 6, 'tag1', 'Tin hieu 840', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2843, NULL, 6, 'tag1', 'Tin hieu 841', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2844, NULL, 6, 'tag1', 'Tin hieu 842', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2845, NULL, 6, 'tag1', 'Tin hieu 843', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2846, NULL, 6, 'tag1', 'Tin hieu 844', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2847, NULL, 6, 'tag1', 'Tin hieu 845', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2848, NULL, 6, 'tag1', 'Tin hieu 846', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2849, NULL, 6, 'tag1', 'Tin hieu 847', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2850, NULL, 6, 'tag1', 'Tin hieu 848', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2851, NULL, 6, 'tag1', 'Tin hieu 849', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2852, NULL, 6, 'tag1', 'Tin hieu 850', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2853, NULL, 6, 'tag1', 'Tin hieu 851', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2854, NULL, 6, 'tag1', 'Tin hieu 852', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2855, NULL, 6, 'tag1', 'Tin hieu 853', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2856, NULL, 6, 'tag1', 'Tin hieu 854', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2857, NULL, 6, 'tag1', 'Tin hieu 855', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2858, NULL, 6, 'tag1', 'Tin hieu 856', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2859, NULL, 6, 'tag1', 'Tin hieu 857', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2860, NULL, 6, 'tag1', 'Tin hieu 858', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2861, NULL, 6, 'tag1', 'Tin hieu 859', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2862, NULL, 6, 'tag1', 'Tin hieu 860', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2863, NULL, 6, 'tag1', 'Tin hieu 861', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2864, NULL, 6, 'tag1', 'Tin hieu 862', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2865, NULL, 6, 'tag1', 'Tin hieu 863', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2866, NULL, 6, 'tag1', 'Tin hieu 864', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2867, NULL, 6, 'tag1', 'Tin hieu 865', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2868, NULL, 6, 'tag1', 'Tin hieu 866', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2869, NULL, 6, 'tag1', 'Tin hieu 867', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2870, NULL, 6, 'tag1', 'Tin hieu 868', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2871, NULL, 6, 'tag1', 'Tin hieu 869', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2872, NULL, 6, 'tag1', 'Tin hieu 870', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2873, NULL, 6, 'tag1', 'Tin hieu 871', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2874, NULL, 6, 'tag1', 'Tin hieu 872', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2875, NULL, 6, 'tag1', 'Tin hieu 873', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2876, NULL, 6, 'tag1', 'Tin hieu 874', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2877, NULL, 6, 'tag1', 'Tin hieu 875', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2878, NULL, 6, 'tag1', 'Tin hieu 876', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2879, NULL, 6, 'tag1', 'Tin hieu 877', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2880, NULL, 6, 'tag1', 'Tin hieu 878', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2881, NULL, 6, 'tag1', 'Tin hieu 879', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2882, NULL, 6, 'tag1', 'Tin hieu 880', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2883, NULL, 6, 'tag1', 'Tin hieu 881', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2884, NULL, 6, 'tag1', 'Tin hieu 882', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2885, NULL, 6, 'tag1', 'Tin hieu 883', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2886, NULL, 6, 'tag1', 'Tin hieu 884', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2887, NULL, 6, 'tag1', 'Tin hieu 885', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2888, NULL, 6, 'tag1', 'Tin hieu 886', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2889, NULL, 6, 'tag1', 'Tin hieu 887', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2890, NULL, 6, 'tag1', 'Tin hieu 888', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2891, NULL, 6, 'tag1', 'Tin hieu 889', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2892, NULL, 6, 'tag1', 'Tin hieu 890', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2893, NULL, 6, 'tag1', 'Tin hieu 891', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2894, NULL, 6, 'tag1', 'Tin hieu 892', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2895, NULL, 6, 'tag1', 'Tin hieu 893', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2896, NULL, 6, 'tag1', 'Tin hieu 894', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2897, NULL, 6, 'tag1', 'Tin hieu 895', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2898, NULL, 6, 'tag1', 'Tin hieu 896', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2899, NULL, 6, 'tag1', 'Tin hieu 897', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2900, NULL, 6, 'tag1', 'Tin hieu 898', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2901, NULL, 6, 'tag1', 'Tin hieu 899', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2902, NULL, 6, 'tag1', 'Tin hieu 900', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2903, NULL, 6, 'tag1', 'Tin hieu 901', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2904, NULL, 6, 'tag1', 'Tin hieu 902', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2905, NULL, 6, 'tag1', 'Tin hieu 903', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2906, NULL, 6, 'tag1', 'Tin hieu 904', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2907, NULL, 6, 'tag1', 'Tin hieu 905', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2908, NULL, 6, 'tag1', 'Tin hieu 906', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2909, NULL, 6, 'tag1', 'Tin hieu 907', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2910, NULL, 6, 'tag1', 'Tin hieu 908', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2911, NULL, 6, 'tag1', 'Tin hieu 909', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2912, NULL, 6, 'tag1', 'Tin hieu 910', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2913, NULL, 6, 'tag1', 'Tin hieu 911', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2914, NULL, 6, 'tag1', 'Tin hieu 912', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2915, NULL, 6, 'tag1', 'Tin hieu 913', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2916, NULL, 6, 'tag1', 'Tin hieu 914', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2917, NULL, 6, 'tag1', 'Tin hieu 915', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2918, NULL, 6, 'tag1', 'Tin hieu 916', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2919, NULL, 6, 'tag1', 'Tin hieu 917', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2920, NULL, 6, 'tag1', 'Tin hieu 918', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2921, NULL, 6, 'tag1', 'Tin hieu 919', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2922, NULL, 6, 'tag1', 'Tin hieu 920', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2923, NULL, 6, 'tag1', 'Tin hieu 921', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2924, NULL, 6, 'tag1', 'Tin hieu 922', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2925, NULL, 6, 'tag1', 'Tin hieu 923', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2926, NULL, 6, 'tag1', 'Tin hieu 924', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2927, NULL, 6, 'tag1', 'Tin hieu 925', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2928, NULL, 6, 'tag1', 'Tin hieu 926', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2929, NULL, 6, 'tag1', 'Tin hieu 927', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2930, NULL, 6, 'tag1', 'Tin hieu 928', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2931, NULL, 6, 'tag1', 'Tin hieu 929', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2932, NULL, 6, 'tag1', 'Tin hieu 930', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2933, NULL, 6, 'tag1', 'Tin hieu 931', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2934, NULL, 6, 'tag1', 'Tin hieu 932', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2935, NULL, 6, 'tag1', 'Tin hieu 933', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2936, NULL, 6, 'tag1', 'Tin hieu 934', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2937, NULL, 6, 'tag1', 'Tin hieu 935', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2938, NULL, 6, 'tag1', 'Tin hieu 936', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2939, NULL, 6, 'tag1', 'Tin hieu 937', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2940, NULL, 6, 'tag1', 'Tin hieu 938', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2941, NULL, 6, 'tag1', 'Tin hieu 939', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2942, NULL, 6, 'tag1', 'Tin hieu 940', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2943, NULL, 6, 'tag1', 'Tin hieu 941', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2944, NULL, 6, 'tag1', 'Tin hieu 942', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2945, NULL, 6, 'tag1', 'Tin hieu 943', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2946, NULL, 6, 'tag1', 'Tin hieu 944', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2947, NULL, 6, 'tag1', 'Tin hieu 945', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2948, NULL, 6, 'tag1', 'Tin hieu 946', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2949, NULL, 6, 'tag1', 'Tin hieu 947', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2950, NULL, 6, 'tag1', 'Tin hieu 948', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2951, NULL, 6, 'tag1', 'Tin hieu 949', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2952, NULL, 6, 'tag1', 'Tin hieu 950', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2953, NULL, 6, 'tag1', 'Tin hieu 951', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2954, NULL, 6, 'tag1', 'Tin hieu 952', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2955, NULL, 6, 'tag1', 'Tin hieu 953', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2956, NULL, 6, 'tag1', 'Tin hieu 954', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2957, NULL, 6, 'tag1', 'Tin hieu 955', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:35'),
(2958, NULL, 6, 'tag1', 'Tin hieu 956', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2959, NULL, 6, 'tag1', 'Tin hieu 957', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:35'),
(2960, NULL, 6, 'tag1', 'Tin hieu 958', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2961, NULL, 6, 'tag1', 'Tin hieu 959', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2962, NULL, 6, 'tag1', 'Tin hieu 960', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2963, NULL, 6, 'tag1', 'Tin hieu 961', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2964, NULL, 6, 'tag1', 'Tin hieu 962', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2965, NULL, 6, 'tag1', 'Tin hieu 963', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2966, NULL, 6, 'tag1', 'Tin hieu 964', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2967, NULL, 6, 'tag1', 'Tin hieu 965', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2968, NULL, 6, 'tag1', 'Tin hieu 966', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2969, NULL, 6, 'tag1', 'Tin hieu 967', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2970, NULL, 6, 'tag1', 'Tin hieu 968', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2971, NULL, 6, 'tag1', 'Tin hieu 969', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2972, NULL, 6, 'tag1', 'Tin hieu 970', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2973, NULL, 6, 'tag1', 'Tin hieu 971', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2974, NULL, 6, 'tag1', 'Tin hieu 972', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2975, NULL, 6, 'tag1', 'Tin hieu 973', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2976, NULL, 6, 'tag1', 'Tin hieu 974', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2977, NULL, 6, 'tag1', 'Tin hieu 975', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36');
INSERT INTO `signals` (`id`, `admin_id`, `user_id`, `tag`, `title`, `avatar`, `content`, `gallery`, `status`, `result`, `created_at`, `updated_at`) VALUES
(2978, NULL, 6, 'tag1', 'Tin hieu 976', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2979, NULL, 6, 'tag1', 'Tin hieu 977', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2980, NULL, 6, 'tag1', 'Tin hieu 978', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2981, NULL, 6, 'tag1', 'Tin hieu 979', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2982, NULL, 6, 'tag1', 'Tin hieu 980', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2983, NULL, 6, 'tag1', 'Tin hieu 981', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2984, NULL, 6, 'tag1', 'Tin hieu 982', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2985, NULL, 6, 'tag1', 'Tin hieu 983', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2986, NULL, 6, 'tag1', 'Tin hieu 984', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2987, NULL, 6, 'tag1', 'Tin hieu 985', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2988, NULL, 6, 'tag1', 'Tin hieu 986', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2989, NULL, 6, 'tag1', 'Tin hieu 987', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2990, NULL, 6, 'tag1', 'Tin hieu 988', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2991, NULL, 6, 'tag1', 'Tin hieu 989', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2992, NULL, 6, 'tag1', 'Tin hieu 990', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2993, NULL, 6, 'tag1', 'Tin hieu 991', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2994, NULL, 6, 'tag1', 'Tin hieu 992', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2995, NULL, 6, 'tag1', 'Tin hieu 993', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2996, NULL, 6, 'tag1', 'Tin hieu 994', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2997, NULL, 6, 'tag1', 'Tin hieu 995', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(2998, NULL, 6, 'tag1', 'Tin hieu 996', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(2999, NULL, 6, 'tag1', 'Tin hieu 997', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(3000, NULL, 6, 'tag1', 'Tin hieu 998', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(3001, NULL, 6, 'tag2', 'Tin hieu 999', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(3002, NULL, 6, 'tag2', 'Tin hieu 1000', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(3003, NULL, 6, 'tag2', 'Tin hieu 1001', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(3004, NULL, 6, 'tag2', 'Tin hieu 1002', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(3005, NULL, 6, 'tag2', 'Tin hieu 1003', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(3006, NULL, 6, 'tag2', 'Tin hieu 1004', 'avatar', 'content', 'gallery', 2, NULL, NULL, '2022-12-22 00:52:36'),
(3007, NULL, 6, 'tag2', 'Tin hieu 1005', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(3008, NULL, 6, 'tag2', 'Tin hieu 1006', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36'),
(3009, NULL, 6, 'tag2', 'Tin hieu 1007', 'avatar', 'content', 'gallery', 3, NULL, NULL, '2022-12-22 00:52:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statistical`
--

CREATE TABLE `statistical` (
  `id` bigint(20) NOT NULL,
  `total_order_fee` double NOT NULL,
  `total_follow_fee` double NOT NULL,
  `total_deposit` int(11) NOT NULL,
  `total_withdrawn` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscriber_package`
--

CREATE TABLE `subscriber_package` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `expired_at` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` int(20) NOT NULL,
  `user_id` int(20) NOT NULL,
  `code` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets_reply`
--

CREATE TABLE `tickets_reply` (
  `id` int(20) NOT NULL,
  `ticket_id` int(20) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `amount` double NOT NULL,
  `fee` double NOT NULL,
  `detail` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `type`, `amount`, `fee`, `detail`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1000000, 0, 'Nap tien', '2022-12-21 03:06:40', '2022-12-21 03:06:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `avatar` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `vip` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `win_rate` float NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `date_register_master` date DEFAULT NULL,
  `identifier` varchar(255) NOT NULL,
  `referral_code` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `phone`, `email`, `fullname`, `roles`, `avatar`, `password`, `vip`, `status`, `win_rate`, `parent_id`, `date_register_master`, `identifier`, `referral_code`, `updated_at`, `created_at`) VALUES
(3, 'truong', '0999999999', 'truong@gmail.com', 'Tran Truong', 'master', 'avatar', '123', 0, 1, 40, NULL, NULL, 'user1671441987', 'RC1671441987', '2022-12-21 02:09:05', '2022-12-19 02:26:27'),
(5, 'truong1', '0999999998', 'truong1@gmail.com', 'Tran Truong', 'master', 'avatar', '123', 0, 1, 0, NULL, NULL, 'user1671612386', 'RC1671612386', '2022-12-21 01:46:26', '2022-12-21 01:46:26'),
(6, 'truong2', '0999999997', 'truong2@gmail.com', 'Tran Truong', 'master', 'avatar', '123', 0, 1, 50, NULL, NULL, 'user1671612398', 'RC1671612398', '2022-12-21 02:09:05', '2022-12-21 01:46:38'),
(7, 'truong3', '0999999996', 'truong3@gmail.com', 'Tran Truong', 'user', 'avatar', '123', 1, 1, 0, NULL, NULL, 'user1671612423', 'RC1671612423', '2022-12-21 03:02:36', '2022-12-21 01:47:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_bank`
--

CREATE TABLE `user_bank` (
  `id` int(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_user` varchar(255) NOT NULL,
  `bank_number` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_bank`
--

INSERT INTO `user_bank` (`id`, `user_id`, `bank_name`, `bank_user`, `bank_number`, `status`, `updated_at`, `created_at`) VALUES
(1, 3, 'VCB', 'Tran Van Truong', 1015645734, 1, '2022-12-19 02:26:27', '2022-12-19 02:26:27'),
(2, 5, 'VCB', 'Tran Van Truong', 1015645734, 1, '2022-12-21 01:46:26', '2022-12-21 01:46:26'),
(3, 6, 'VCB', 'Tran Van Truong', 1015645734, 1, '2022-12-21 01:46:38', '2022-12-21 01:46:38'),
(4, 7, 'VCB', 'Tran Van Truong', 1015645734, 1, '2022-12-21 01:47:03', '2022-12-21 01:47:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `number_identity_card` varchar(255) DEFAULT NULL,
  `name_identity_card` varchar(255) DEFAULT NULL,
  `image_identity_card` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`id`, `user_id`, `gender`, `birthday`, `number_identity_card`, `name_identity_card`, `image_identity_card`, `address`, `created_at`, `updated_at`) VALUES
(3, 3, 1, '1997-07-01', '221435463', 'TRAN VAN TRUONG', '[\"image1\",\"image2\"]', NULL, '2022-12-19 02:26:27', '2022-12-20 20:16:23'),
(4, 5, 1, '1997-07-01', NULL, NULL, NULL, NULL, '2022-12-21 01:46:26', '2022-12-21 01:46:26'),
(5, 6, 1, '1997-07-01', NULL, NULL, NULL, NULL, '2022-12-21 01:46:38', '2022-12-21 01:46:38'),
(6, 7, 1, '1997-07-01', NULL, NULL, NULL, NULL, '2022-12-21 01:47:03', '2022-12-21 01:47:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_like_signal`
--

CREATE TABLE `user_like_signal` (
  `user_id` int(11) NOT NULL,
  `signal_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `setting_key` varchar(255) NOT NULL,
  `plain_value` longtext NOT NULL,
  `type_input` tinyint(4) NOT NULL,
  `type_data` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_statistic`
--

CREATE TABLE `user_statistic` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `signal_total` int(11) NOT NULL,
  `signal_win` int(11) NOT NULL,
  `signal_loses` int(11) NOT NULL,
  `followers_total` int(11) NOT NULL,
  `followings_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_deposit` double NOT NULL,
  `amount_follow` double NOT NULL,
  `amount_order` double NOT NULL,
  `amount_earning` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `wallet`
--

INSERT INTO `wallet` (`id`, `user_id`, `amount_deposit`, `amount_follow`, `amount_order`, `amount_earning`, `created_at`, `updated_at`) VALUES
(2, 3, 0, 0, 0, 0, '2022-12-19 02:26:27', '2022-12-19 02:26:27'),
(3, 5, 0, 0, 0, 0, '2022-12-21 01:46:26', '2022-12-21 01:46:26'),
(4, 6, 0, 0, 0, 0, '2022-12-21 01:46:38', '2022-12-21 01:46:38'),
(5, 7, 1000000, 0, 0, 0, '2022-12-21 01:47:03', '2022-12-21 03:06:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `license` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_setting`
--
ALTER TABLE `admin_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Chỉ mục cho bảng `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `event_affiliate`
--
ALTER TABLE `event_affiliate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `event_affiliate_rank`
--
ALTER TABLE `event_affiliate_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_affiliate_id` (`event_affiliate_id`),
  ADD KEY `event_afiliate_rank_ibfk_2` (`user_id`);

--
-- Chỉ mục cho bảng `event_master`
--
ALTER TABLE `event_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `event_master_rank`
--
ALTER TABLE `event_master_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_master_id` (`event_master_id`),
  ADD KEY `event_master_rank_ibfk_2` (`user_id`);

--
-- Chỉ mục cho bảng `event_social`
--
ALTER TABLE `event_social`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `event_social_reply`
--
ALTER TABLE `event_social_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_social_id` (`event_social_id`);

--
-- Chỉ mục cho bảng `exchanges`
--
ALTER TABLE `exchanges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `exchanges_vote`
--
ALTER TABLE `exchanges_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exchange_id` (`exchange_id`);

--
-- Chỉ mục cho bảng `follows`
--
ALTER TABLE `follows`
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `author_id` (`admin_id`),
  ADD KEY `news_ibfk_2` (`user_id`);

--
-- Chỉ mục cho bảng `news_advise`
--
ALTER TABLE `news_advise`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_free`
--
ALTER TABLE `order_free`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_packages`
--
ALTER TABLE `order_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_to_signal`
--
ALTER TABLE `order_to_signal`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `signal_id` (`signal_id`);

--
-- Chỉ mục cho bảng `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `register_master`
--
ALTER TABLE `register_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `signals`
--
ALTER TABLE `signals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `statistical`
--
ALTER TABLE `statistical`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscriber_package`
--
ALTER TABLE `subscriber_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_ibfk_1` (`user_id`);

--
-- Chỉ mục cho bảng `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `tickets_reply_ibfk_2` (`user_id`),
  ADD KEY `tickets_reply_ibfk_3` (`admin_id`);

--
-- Chỉ mục cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type` (`type`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `referral_code` (`referral_code`),
  ADD UNIQUE KEY `identifier` (`identifier`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `user_bank`
--
ALTER TABLE `user_bank`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_like_signal`
--
ALTER TABLE `user_like_signal`
  ADD KEY `signal_id` (`signal_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_setting_ibfk_1` (`user_id`),
  ADD KEY `setting_key` (`setting_key`);

--
-- Chỉ mục cho bảng `user_statistic`
--
ALTER TABLE `user_statistic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `admin_setting`
--
ALTER TABLE `admin_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_affiliate`
--
ALTER TABLE `event_affiliate`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_affiliate_rank`
--
ALTER TABLE `event_affiliate_rank`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_master`
--
ALTER TABLE `event_master`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_master_rank`
--
ALTER TABLE `event_master_rank`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_social`
--
ALTER TABLE `event_social`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event_social_reply`
--
ALTER TABLE `event_social_reply`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `exchanges`
--
ALTER TABLE `exchanges`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `exchanges_vote`
--
ALTER TABLE `exchanges_vote`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news_advise`
--
ALTER TABLE `news_advise`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_free`
--
ALTER TABLE `order_free`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_packages`
--
ALTER TABLE `order_packages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `register_master`
--
ALTER TABLE `register_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `signals`
--
ALTER TABLE `signals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3010;

--
-- AUTO_INCREMENT cho bảng `statistical`
--
ALTER TABLE `statistical`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subscriber_package`
--
ALTER TABLE `subscriber_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tickets_reply`
--
ALTER TABLE `tickets_reply`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user_bank`
--
ALTER TABLE `user_bank`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_setting`
--
ALTER TABLE `user_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user_statistic`
--
ALTER TABLE `user_statistic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `deposits`
--
ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `deposits_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `event_affiliate_rank`
--
ALTER TABLE `event_affiliate_rank`
  ADD CONSTRAINT `event_afiliate_rank_ibfk_1` FOREIGN KEY (`event_affiliate_id`) REFERENCES `event_affiliate` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `event_afiliate_rank_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `event_master_rank`
--
ALTER TABLE `event_master_rank`
  ADD CONSTRAINT `event_master_rank_ibfk_1` FOREIGN KEY (`event_master_id`) REFERENCES `event_master` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `event_master_rank_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `event_social_reply`
--
ALTER TABLE `event_social_reply`
  ADD CONSTRAINT `event_social_reply_ibfk_1` FOREIGN KEY (`event_social_id`) REFERENCES `event_social` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `event_social_reply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `exchanges_vote`
--
ALTER TABLE `exchanges_vote`
  ADD CONSTRAINT `exchanges_vote_ibfk_1` FOREIGN KEY (`exchange_id`) REFERENCES `exchanges` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `news_advise`
--
ALTER TABLE `news_advise`
  ADD CONSTRAINT `news_advise` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `order_free`
--
ALTER TABLE `order_free`
  ADD CONSTRAINT `order_free_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `order_packages`
--
ALTER TABLE `order_packages`
  ADD CONSTRAINT `order_packages_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_packages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `order_to_signal`
--
ALTER TABLE `order_to_signal`
  ADD CONSTRAINT `order_to_signal_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_to_signal_ibfk_2` FOREIGN KEY (`signal_id`) REFERENCES `signals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `register_master`
--
ALTER TABLE `register_master`
  ADD CONSTRAINT `register_master_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `register_master_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `signals`
--
ALTER TABLE `signals`
  ADD CONSTRAINT `signals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `signals_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `subscriber_package`
--
ALTER TABLE `subscriber_package`
  ADD CONSTRAINT `subscriber_package_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `subscriber_package_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tickets_reply`
--
ALTER TABLE `tickets_reply`
  ADD CONSTRAINT `tickets_reply_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tickets_reply_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tickets_reply_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_bank`
--
ALTER TABLE `user_bank`
  ADD CONSTRAINT `user_bank_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_like_signal`
--
ALTER TABLE `user_like_signal`
  ADD CONSTRAINT `user_like_signal_ibfk_1` FOREIGN KEY (`signal_id`) REFERENCES `signals` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_like_signal_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `user_setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `user_statistic`
--
ALTER TABLE `user_statistic`
  ADD CONSTRAINT `user_statistic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `withdraws_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
