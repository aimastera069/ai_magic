-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： custsql-ipg113.eigbox.net
-- 生成日期： 2025-03-24 11:13:16
-- 服务器版本： 5.6.51-91.0-log
-- PHP 版本： 7.0.33-0ubuntu0.16.04.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `sweetekconnie46_fvdg_qscsxdpmlak`
--

-- --------------------------------------------------------

--
-- 表的结构 `gpt_responses`
--

CREATE TABLE `gpt_responses` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `replytoken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpt_question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpt_ans` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpt_prompt_json` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `q_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `task_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `task_machine_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'e0184075a5a66a8ff597c7d550a11fc27eb6949cdecb6ff77ea3672825f8254e',
  `article_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `info_template`
--

CREATE TABLE `info_template` (
  `info_id` int(11) NOT NULL,
  `info_name` varchar(255) NOT NULL,
  `info_type` varchar(50) NOT NULL,
  `info_content` text NOT NULL,
  `info_language` varchar(10) NOT NULL DEFAULT 'en',
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `machine_configs`
--

CREATE TABLE `machine_configs` (
  `id` int(11) NOT NULL,
  `machine_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ini_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `machine_errors`
--

CREATE TABLE `machine_errors` (
  `id` int(11) NOT NULL,
  `machine_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `machine_status`
--

CREATE TABLE `machine_status` (
  `id` int(11) NOT NULL,
  `machine_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpu_level` int(1) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `switch` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `machine_status_log`
--

CREATE TABLE `machine_status_log` (
  `id` int(11) NOT NULL,
  `machine_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `error_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `production_log`
--

CREATE TABLE `production_log` (
  `id` int(11) NOT NULL,
  `machine_identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gpt_responses_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordpress_post_ids` text COLLATE utf8mb4_unicode_ci,
  `media_ids` text COLLATE utf8mb4_unicode_ci,
  `woocommerce_product_ids` text COLLATE utf8mb4_unicode_ci,
  `running_time` float NOT NULL,
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `prompt_data`
--

CREATE TABLE `prompt_data` (
  `prompt_id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `positive_prompt` mediumtext COLLATE utf8mb4_unicode_ci,
  `negative_prompt` mediumtext COLLATE utf8mb4_unicode_ci,
  `key_elements` mediumtext COLLATE utf8mb4_unicode_ci,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'HarvardWang',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','disable','pending','trash') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `popularity_count` int(11) DEFAULT '0',
  `market_price` decimal(10,2) DEFAULT '1.00',
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `qr_results`
--

CREATE TABLE `qr_results` (
  `id` int(11) NOT NULL,
  `line_user_id` varchar(255) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `qr_content` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `system_config`
--

CREATE TABLE `system_config` (
  `id` int(11) NOT NULL,
  `config_key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `daily_quota` int(11) DEFAULT '10',
  `remaining_quota` int(11) DEFAULT '10',
  `balance` decimal(10,2) DEFAULT '0.00',
  `user_note` varchar(255) NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT 'https://stores.heatgroups.com',
  `qr_content` varchar(255) DEFAULT NULL,
  `last_reset_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_message_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `user_images`
--

CREATE TABLE `user_images` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_content` mediumtext COLLATE utf8mb4_unicode_ci,
  `image_without_qr` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpt_prompt` mediumtext COLLATE utf8mb4_unicode_ci,
  `gpt_response` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `gpt_responses`
--
ALTER TABLE `gpt_responses`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `info_template`
--
ALTER TABLE `info_template`
  ADD PRIMARY KEY (`info_id`);

--
-- 表的索引 `machine_configs`
--
ALTER TABLE `machine_configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `machine_id` (`machine_id`);

--
-- 表的索引 `machine_errors`
--
ALTER TABLE `machine_errors`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `machine_status`
--
ALTER TABLE `machine_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `machine_id` (`machine_id`);

--
-- 表的索引 `machine_status_log`
--
ALTER TABLE `machine_status_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `production_log`
--
ALTER TABLE `production_log`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `prompt_data`
--
ALTER TABLE `prompt_data`
  ADD PRIMARY KEY (`prompt_id`);

--
-- 表的索引 `qr_results`
--
ALTER TABLE `qr_results`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `system_config`
--
ALTER TABLE `system_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `config_key_unique` (`config_key`);

--
-- 表的索引 `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 表的索引 `user_images`
--
ALTER TABLE `user_images`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `gpt_responses`
--
ALTER TABLE `gpt_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `info_template`
--
ALTER TABLE `info_template`
  MODIFY `info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `machine_configs`
--
ALTER TABLE `machine_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `machine_errors`
--
ALTER TABLE `machine_errors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `machine_status`
--
ALTER TABLE `machine_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `machine_status_log`
--
ALTER TABLE `machine_status_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `production_log`
--
ALTER TABLE `production_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `prompt_data`
--
ALTER TABLE `prompt_data`
  MODIFY `prompt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `qr_results`
--
ALTER TABLE `qr_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `system_config`
--
ALTER TABLE `system_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user_images`
--
ALTER TABLE `user_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
