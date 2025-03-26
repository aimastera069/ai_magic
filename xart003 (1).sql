-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2025-03-25 06:18:24
-- 服务器版本： 8.4.0
-- PHP 版本： 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `xart003`
--

-- --------------------------------------------------------

--
-- 表的结构 `wp_acg_images`
--

CREATE TABLE `wp_acg_images` (
  `id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_acg_settings`
--

CREATE TABLE `wp_acg_settings` (
  `name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_acg_tasks`
--

CREATE TABLE `wp_acg_tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `error_message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `qwen_prompt` longtext COLLATE utf8mb4_unicode_520_ci,
  `qwen_api_response` longtext COLLATE utf8mb4_unicode_520_ci,
  `sd_prompt` longtext COLLATE utf8mb4_unicode_520_ci,
  `sd_api_response` longtext COLLATE utf8mb4_unicode_520_ci,
  `post_api_response` longtext COLLATE utf8mb4_unicode_520_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_ai_nodes`
--

CREATE TABLE `wp_ai_nodes` (
  `id` bigint UNSIGNED NOT NULL,
  `node_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `auth_token` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_heartbeat` datetime DEFAULT CURRENT_TIMESTAMP,
  `registered_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_ai_tasks`
--

CREATE TABLE `wp_ai_tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_payload` text COLLATE utf8mb4_unicode_520_ci,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `result_url` text COLLATE utf8mb4_unicode_520_ci,
  `webhook_url` text COLLATE utf8mb4_unicode_520_ci,
  `retry_count` int UNSIGNED NOT NULL DEFAULT '0',
  `webhook_failed` tinyint(1) NOT NULL DEFAULT '0',
  `webhook_retry_count` int UNSIGNED NOT NULL DEFAULT '0',
  `last_webhook_attempt` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_artist_data`
--

CREATE TABLE `wp_artist_data` (
  `artist_id` int NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `artist_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `source` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- 表的结构 `wp_user_registration_sessions`
--

CREATE TABLE `wp_user_registration_sessions` (
  `session_id` bigint UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_expiry` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `wp_acg_images`
--
ALTER TABLE `wp_acg_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_idx` (`task_id`);

--
-- 表的索引 `wp_acg_settings`
--
ALTER TABLE `wp_acg_settings`
  ADD PRIMARY KEY (`name`);

--
-- 表的索引 `wp_acg_tasks`
--
ALTER TABLE `wp_acg_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_idx` (`status`);

--
-- 表的索引 `wp_ai_nodes`
--
ALTER TABLE `wp_ai_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`node_type`);

--
-- 表的索引 `wp_ai_tasks`
--
ALTER TABLE `wp_ai_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`);

--
-- 表的索引 `wp_artist_data`
--
ALTER TABLE `wp_artist_data`
  ADD PRIMARY KEY (`artist_id`);

--
-- 表的索引 `wp_user_registration_sessions`
--
ALTER TABLE `wp_user_registration_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD UNIQUE KEY `session_id` (`session_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `wp_acg_images`
--
ALTER TABLE `wp_acg_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `wp_acg_tasks`
--
ALTER TABLE `wp_acg_tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `wp_ai_nodes`
--
ALTER TABLE `wp_ai_nodes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `wp_ai_tasks`
--
ALTER TABLE `wp_ai_tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `wp_artist_data`
--
ALTER TABLE `wp_artist_data`
  MODIFY `artist_id` int NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `wp_user_registration_sessions`
--
ALTER TABLE `wp_user_registration_sessions`
  MODIFY `session_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
