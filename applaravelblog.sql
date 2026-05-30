-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2026 at 12:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `applaravelblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-admin@example.com|127.0.0.1', 'i:1;', 1779452762),
('laravel-cache-admin@example.com|127.0.0.1:timer', 'i:1779452762;', 1779452762);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Category one', 'cat-one', 'Category one description', '2026-03-17 05:43:18', '2026-03-17 05:43:18'),
(2, 'Category two', 'category-two', 'Category two description', '2026-03-17 05:45:00', '2026-03-17 05:45:00'),
(3, 'category three', 'categoryslug', 'category description', '2026-03-18 04:35:52', '2026-03-18 04:35:52');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `commentable_type` varchar(255) DEFAULT NULL,
  `commentable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `commenter_type` varchar(255) DEFAULT NULL,
  `commenter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply_type` varchar(255) DEFAULT NULL,
  `reply_id` bigint(20) UNSIGNED DEFAULT NULL,
  `text` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `author_type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_pinned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `commentable_type`, `commentable_id`, `commenter_type`, `commenter_id`, `reply_type`, `reply_id`, `text`, `is_approved`, `author_type`, `author_id`, `created_at`, `updated_at`, `is_pinned`) VALUES
(1, 'App\\Models\\Posts\\Post', 2, NULL, 3, NULL, NULL, 'Comment one', 1, NULL, NULL, '2026-03-17 07:43:02', '2026-03-18 04:42:40', 0),
(5, 'App\\Models\\Posts\\Post', 3, NULL, 5, NULL, NULL, 'Test comment', 1, NULL, NULL, '2026-05-22 19:26:12', '2026-05-22 19:26:25', 0),
(6, 'App\\Models\\Posts\\Post', 3, NULL, 5, NULL, 5, 'Test reply', 1, NULL, NULL, '2026-05-22 19:26:38', '2026-05-22 19:26:38', 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filament_comments`
--

CREATE TABLE `filament_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subject_type` varchar(255) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_30_074234_create_categories_table', 1),
(5, '2025_12_30_074235_create_posts_table', 1),
(6, '2025_12_30_075120_create_tags_table', 1),
(7, '2025_12_30_075357_create_post_tag_table', 1),
(8, '2025_12_30_111358_create_seo_table copy', 1),
(9, '2025_12_30_111359_create_seo_table', 1),
(10, '2025_12_31_124013_create_permission_tables', 1),
(11, '2026_01_01_145244_create_post_views_table', 1),
(12, '2026_01_11_122424_create_comments_table', 1),
(13, '2026_01_11_122425_add_is_pinned_column_to_comments_table', 1),
(14, '2026_01_11_122425_create_guests_table', 1),
(15, '2026_01_11_122425_create_reactions_table', 1),
(16, '2026_01_11_122425_drop_guest_columns_from_comments_table', 1),
(17, '2026_02_28_074602_create_admins_table', 1),
(18, '2026_03_17_072830_create_filament_comments_table', 1),
(19, '2026_03_17_072831_add_index_to_subject', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User\\User', 1),
(2, 'App\\Models\\User\\User', 2),
(3, 'App\\Models\\User\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ViewAny:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(2, 'View:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(3, 'Create:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(4, 'Update:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(5, 'Delete:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(6, 'Restore:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(7, 'ForceDelete:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(8, 'ForceDeleteAny:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(9, 'RestoreAny:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(10, 'Replicate:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(11, 'Reorder:Category', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(12, 'ViewAny:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(13, 'View:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(14, 'Create:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(15, 'Update:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(16, 'Delete:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(17, 'Restore:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(18, 'ForceDelete:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(19, 'ForceDeleteAny:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(20, 'RestoreAny:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(21, 'Replicate:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(22, 'Reorder:Comment', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(23, 'ViewAny:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(24, 'View:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(25, 'Create:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(26, 'Update:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(27, 'Delete:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(28, 'Restore:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(29, 'ForceDelete:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(30, 'ForceDeleteAny:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(31, 'RestoreAny:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(32, 'Replicate:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(33, 'Reorder:Post', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(34, 'ViewAny:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(35, 'View:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(36, 'Create:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(37, 'Update:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(38, 'Delete:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(39, 'Restore:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(40, 'ForceDelete:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(41, 'ForceDeleteAny:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(42, 'RestoreAny:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(43, 'Replicate:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(44, 'Reorder:Tag', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(45, 'ViewAny:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(46, 'View:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(47, 'Create:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(48, 'Update:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(49, 'Delete:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(50, 'Restore:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(51, 'ForceDelete:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(52, 'ForceDeleteAny:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(53, 'RestoreAny:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(54, 'Replicate:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(55, 'Reorder:User', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(56, 'ViewAny:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(57, 'View:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(58, 'Create:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(59, 'Update:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(60, 'Delete:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(61, 'Restore:Role', 'admin', '2026-03-17 05:28:58', '2026-03-17 05:28:58'),
(62, 'ForceDelete:Role', 'admin', '2026-03-17 05:28:59', '2026-03-17 05:28:59'),
(63, 'ForceDeleteAny:Role', 'admin', '2026-03-17 05:28:59', '2026-03-17 05:28:59'),
(64, 'RestoreAny:Role', 'admin', '2026-03-17 05:28:59', '2026-03-17 05:28:59'),
(65, 'Replicate:Role', 'admin', '2026-03-17 05:28:59', '2026-03-17 05:28:59'),
(66, 'Reorder:Role', 'admin', '2026-03-17 05:28:59', '2026-03-17 05:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `feature_image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `is_staff_pick` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `body`, `feature_image`, `category_id`, `user_id`, `status`, `is_staff_pick`, `created_at`, `updated_at`) VALUES
(1, 'Post one title', 'post-one', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.</p>', '01KKXPS96HC9ZTGSJ58NYZYMKM.png', 1, 1, 'published', 0, '2026-03-17 05:52:07', '2026-03-17 05:52:07'),
(2, 'Post two title', 'post-two', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet.</p>', '01KKXPZ7FSFST75D0TMD3TR04R.png', 2, 1, 'published', 0, '2026-03-17 05:55:22', '2026-03-17 07:55:13'),
(3, 'Post new', 'post-new', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '01KM05J474EDA0VA868BS2H645.png', 3, 1, 'published', 0, '2026-03-18 04:48:51', '2026-03-18 04:50:41');

-- --------------------------------------------------------

--
-- Table structure for table `post_category`
--

CREATE TABLE `post_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_views`
--

CREATE TABLE `post_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_views`
--

INSERT INTO `post_views` (`id`, `post_id`, `views`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2026-03-17 06:55:43', '2026-03-17 06:55:43'),
(2, 2, 1, '2026-03-17 06:56:07', '2026-03-17 06:56:07'),
(3, 2, 1, '2026-03-17 07:40:40', '2026-03-17 07:40:40'),
(4, 2, 1, '2026-03-17 07:40:49', '2026-03-17 07:40:49'),
(5, 2, 1, '2026-03-17 07:42:33', '2026-03-17 07:42:33'),
(6, 2, 1, '2026-03-17 07:42:40', '2026-03-17 07:42:40'),
(7, 2, 1, '2026-03-17 13:32:59', '2026-03-17 13:32:59'),
(8, 2, 1, '2026-03-17 13:33:18', '2026-03-17 13:33:18'),
(9, 2, 1, '2026-03-17 13:41:02', '2026-03-17 13:41:02'),
(10, 2, 1, '2026-03-17 13:41:16', '2026-03-17 13:41:16'),
(11, 2, 1, '2026-03-17 13:45:37', '2026-03-17 13:45:37'),
(12, 2, 1, '2026-03-17 13:45:49', '2026-03-17 13:45:49'),
(13, 2, 1, '2026-03-17 13:57:29', '2026-03-17 13:57:29'),
(14, 2, 1, '2026-03-17 13:57:42', '2026-03-17 13:57:42'),
(15, 2, 1, '2026-03-17 14:00:15', '2026-03-17 14:00:15'),
(16, 2, 1, '2026-03-17 14:00:28', '2026-03-17 14:00:28'),
(17, 2, 1, '2026-03-17 14:18:55', '2026-03-17 14:18:55'),
(18, 2, 1, '2026-03-17 14:19:35', '2026-03-17 14:19:35'),
(19, 2, 1, '2026-03-17 14:20:09', '2026-03-17 14:20:09'),
(20, 1, 1, '2026-03-17 14:20:20', '2026-03-17 14:20:20'),
(21, 1, 1, '2026-03-17 14:20:33', '2026-03-17 14:20:33'),
(22, 1, 1, '2026-03-17 14:20:43', '2026-03-17 14:20:43'),
(23, 1, 1, '2026-03-17 14:20:50', '2026-03-17 14:20:50'),
(24, 1, 1, '2026-03-17 14:20:58', '2026-03-17 14:20:58'),
(25, 1, 1, '2026-03-17 14:21:06', '2026-03-17 14:21:06'),
(26, 1, 1, '2026-03-17 14:21:13', '2026-03-17 14:21:13'),
(27, 1, 1, '2026-03-17 14:21:21', '2026-03-17 14:21:21'),
(28, 1, 1, '2026-03-17 14:21:30', '2026-03-17 14:21:30'),
(29, 2, 1, '2026-03-17 14:23:00', '2026-03-17 14:23:00'),
(30, 2, 1, '2026-03-17 14:24:31', '2026-03-17 14:24:31'),
(31, 2, 1, '2026-03-17 14:24:51', '2026-03-17 14:24:51'),
(32, 2, 1, '2026-03-18 04:08:58', '2026-03-18 04:08:58'),
(33, 2, 1, '2026-03-18 04:09:22', '2026-03-18 04:09:22'),
(34, 1, 1, '2026-03-18 04:10:43', '2026-03-18 04:10:43'),
(35, 1, 1, '2026-03-18 04:11:09', '2026-03-18 04:11:09'),
(36, 2, 1, '2026-03-18 04:11:37', '2026-03-18 04:11:37'),
(37, 2, 1, '2026-03-18 04:11:43', '2026-03-18 04:11:43'),
(38, 2, 1, '2026-03-18 04:14:47', '2026-03-18 04:14:47'),
(39, 2, 1, '2026-03-18 04:15:01', '2026-03-18 04:15:01'),
(40, 2, 1, '2026-03-18 04:15:59', '2026-03-18 04:15:59'),
(41, 2, 1, '2026-03-18 04:16:06', '2026-03-18 04:16:06'),
(42, 2, 1, '2026-03-18 04:21:52', '2026-03-18 04:21:52'),
(43, 2, 1, '2026-03-18 04:21:59', '2026-03-18 04:21:59'),
(44, 2, 1, '2026-03-18 04:40:35', '2026-03-18 04:40:35'),
(45, 2, 1, '2026-03-18 04:40:44', '2026-03-18 04:40:44'),
(46, 2, 1, '2026-03-18 04:42:01', '2026-03-18 04:42:01'),
(47, 2, 1, '2026-03-18 04:42:11', '2026-03-18 04:42:11'),
(48, 2, 1, '2026-03-18 04:42:56', '2026-03-18 04:42:56'),
(49, 2, 1, '2026-03-18 04:43:06', '2026-03-18 04:43:06'),
(50, 3, 1, '2026-03-18 04:51:53', '2026-03-18 04:51:53'),
(51, 3, 1, '2026-03-18 04:52:02', '2026-03-18 04:52:02'),
(52, 3, 1, '2026-05-07 23:33:25', '2026-05-07 23:33:25'),
(53, 3, 1, '2026-05-07 23:33:29', '2026-05-07 23:33:29'),
(54, 3, 1, '2026-05-07 23:35:45', '2026-05-07 23:35:45'),
(55, 3, 1, '2026-05-07 23:35:50', '2026-05-07 23:35:50'),
(56, 2, 1, '2026-05-07 23:36:09', '2026-05-07 23:36:09'),
(57, 2, 1, '2026-05-07 23:36:13', '2026-05-07 23:36:13'),
(58, 3, 1, '2026-05-10 19:39:55', '2026-05-10 19:39:55'),
(59, 3, 1, '2026-05-10 19:39:56', '2026-05-10 19:39:56'),
(60, 3, 1, '2026-05-10 19:40:18', '2026-05-10 19:40:18'),
(61, 3, 1, '2026-05-10 19:40:20', '2026-05-10 19:40:20'),
(62, 3, 1, '2026-05-22 19:25:56', '2026-05-22 19:25:56'),
(63, 3, 1, '2026-05-22 19:25:58', '2026-05-22 19:25:58'),
(64, 3, 1, '2026-05-22 19:27:00', '2026-05-22 19:27:00'),
(65, 3, 1, '2026-05-22 19:27:01', '2026-05-22 19:27:01'),
(66, 3, 1, '2026-05-22 19:29:04', '2026-05-22 19:29:04'),
(67, 3, 1, '2026-05-22 19:29:06', '2026-05-22 19:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_type` varchar(255) NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'admin', '2026-03-17 05:28:57', '2026-03-17 05:28:57'),
(2, 'Test User', 'admin', '2026-03-17 06:08:29', '2026-03-17 06:08:29'),
(3, 'testone', 'admin', '2026-03-18 05:01:16', '2026-03-18 05:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(23, 3),
(24, 1),
(24, 2),
(24, 3),
(25, 1),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `robots` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `model_id`, `model_type`, `title`, `description`, `author`, `robots`, `created_at`, `updated_at`) VALUES
(1, '1', 'App\\Models\\User\\User', NULL, NULL, NULL, NULL, '2026-03-17 05:30:07', '2026-03-17 05:30:07'),
(2, '1', 'App\\Models\\Tags\\Tag', 'Tag one one', 'Tag one description', 'Tag one author name', 'index, follow', '2026-03-17 05:37:59', '2026-03-17 05:37:59'),
(3, '2', 'App\\Models\\Tags\\Tag', 'Tag two title', 'Tag two description', 'Tag two author name', 'index, follow', '2026-03-17 05:40:23', '2026-03-17 05:40:23'),
(4, '1', 'App\\Models\\Category\\Category', 'Category one slug', 'Category one slug description name', 'Category one slug author name', 'index, follow', '2026-03-17 05:43:18', '2026-03-17 05:43:18'),
(5, '2', 'App\\Models\\Category\\Category', 'Category two slug title', 'Category two slug description name', 'Category two slug author name', 'index, follow', '2026-03-17 05:45:00', '2026-03-17 05:45:00'),
(6, '1', 'App\\Models\\Posts\\Post', 'Post one seo title', 'Post one seo description', 'Post one seo author name', 'index, follow', '2026-03-17 05:52:07', '2026-03-17 05:52:07'),
(7, '2', 'App\\Models\\Posts\\Post', 'Post two slug title', 'Post two slug description', 'Post two author slug name', 'index, follow', '2026-03-17 05:55:22', '2026-03-17 05:55:22'),
(8, '2', 'App\\Models\\User\\User', NULL, NULL, NULL, NULL, '2026-03-17 06:00:56', '2026-03-17 06:00:56'),
(9, '3', 'App\\Models\\User\\User', NULL, NULL, NULL, NULL, '2026-03-17 07:03:50', '2026-03-17 07:03:50'),
(10, '3', 'App\\Models\\Category\\Category', 'category three seo', 'category three description', 'category three author name', 'index, follow', '2026-03-18 04:35:52', '2026-03-18 04:35:52'),
(11, '3', 'App\\Models\\Posts\\Post', 'post three seo title', 'post three description', 'post three author name', 'index, follow', '2026-03-18 04:48:51', '2026-03-18 04:48:51'),
(12, '4', 'App\\Models\\User\\User', NULL, NULL, NULL, NULL, '2026-03-18 04:54:35', '2026-03-18 04:54:35'),
(13, '5', 'App\\Models\\User\\User', NULL, NULL, NULL, NULL, '2026-05-22 19:25:43', '2026-05-22 19:25:43');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tag one', 'tag-one', '2026-03-17 05:37:59', '2026-03-17 05:37:59'),
(2, 'Tag two', 'tag-two', '2026-03-17 05:40:23', '2026-03-17 05:40:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'Qasim Shahzad', 'admin@gmail.com', NULL, '$2y$12$TrwKBx0TqGg6xoClxDIy5OIVWXbx.XpeUL9ODGDs4K8rNyA9i.9LW', NULL, '2026-03-17 05:30:07', '2026-03-17 08:01:48', 'admin'),
(2, 'Test User', 'test@gmail.com', NULL, '$2y$12$sD8nHvdnM0PJcXp.BpEQFO./WXrR6gbg16PNQzn0HuW6jVoEH5s/m', NULL, '2026-03-17 06:00:56', '2026-03-17 06:00:56', 'test@gmail.com'),
(3, 'Qasim Shehzad', 'gaqasim123@gmail.com', NULL, '$2y$12$w8fn4ImPc5bxaH8XmB0sveTUqlXDNvsB.iTGfx17f9X8RRiIfw0oi', NULL, '2026-03-17 07:03:50', '2026-03-17 07:03:50', NULL),
(4, 'Test one', 'testone@gmail.com', NULL, '$2y$12$18ncPJg8K.NSCbkOfvyl6u95z8wlAh5qcNMu.mXBe/QN53kqNpHsO', NULL, '2026-03-18 04:54:35', '2026-03-18 04:54:35', 'testone'),
(5, 'Qasim Shahzad', 'blog@gmail.com', NULL, '$2y$12$2E.6LaZP.iUABkYrUOFnEOSl4zfKIH4AheYrZd27WFRQqm/fE01Qe', NULL, '2026-05-22 19:25:43', '2026-05-22 19:25:43', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  ADD KEY `comments_commenter_type_commenter_id_index` (`commenter_type`,`commenter_id`),
  ADD KEY `comments_reply_type_reply_id_index` (`reply_type`,`reply_id`),
  ADD KEY `comments_is_approved_index` (`is_approved`),
  ADD KEY `comments_reply_id_foreign` (`reply_id`),
  ADD KEY `comments_is_pinned_index` (`is_pinned`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `filament_comments`
--
ALTER TABLE `filament_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `filament_comments_subject_type_subject_id_index` (`subject_type`,`subject_id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_category_post_id_category_id_unique` (`post_id`,`category_id`),
  ADD KEY `post_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `post_views`
--
ALTER TABLE `post_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_views_post_id_foreign` (`post_id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reactions_owner_type_owner_id_index` (`owner_type`,`owner_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filament_comments`
--
ALTER TABLE `filament_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_views`
--
ALTER TABLE `post_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_category`
--
ALTER TABLE `post_category`
  ADD CONSTRAINT `post_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_category_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_views`
--
ALTER TABLE `post_views`
  ADD CONSTRAINT `post_views_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
