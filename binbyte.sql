-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2023 at 01:34 PM
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
-- Database: `binbyte`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add customer', 6, 'add_customer'),
(22, 'Can change customer', 6, 'change_customer'),
(23, 'Can delete customer', 6, 'delete_customer'),
(24, 'Can view customer', 6, 'view_customer'),
(25, 'Can add vendor', 7, 'add_vendor'),
(26, 'Can change vendor', 7, 'change_vendor'),
(27, 'Can delete vendor', 7, 'delete_vendor'),
(28, 'Can view vendor', 7, 'view_vendor'),
(29, 'Can add masterlist', 8, 'add_masterlist'),
(30, 'Can change masterlist', 8, 'change_masterlist'),
(31, 'Can delete masterlist', 8, 'delete_masterlist'),
(32, 'Can view masterlist', 8, 'view_masterlist'),
(33, 'Can add brand', 9, 'add_brand'),
(34, 'Can change brand', 9, 'change_brand'),
(35, 'Can delete brand', 9, 'delete_brand'),
(36, 'Can view brand', 9, 'view_brand'),
(37, 'Can add cpu', 10, 'add_cpu'),
(38, 'Can change cpu', 10, 'change_cpu'),
(39, 'Can delete cpu', 10, 'delete_cpu'),
(40, 'Can view cpu', 10, 'view_cpu'),
(41, 'Can add gen', 11, 'add_gen'),
(42, 'Can change gen', 11, 'change_gen'),
(43, 'Can delete gen', 11, 'delete_gen'),
(44, 'Can view gen', 11, 'view_gen'),
(45, 'Can add hdd', 12, 'add_hdd'),
(46, 'Can change hdd', 12, 'change_hdd'),
(47, 'Can delete hdd', 12, 'delete_hdd'),
(48, 'Can view hdd', 12, 'view_hdd'),
(49, 'Can add new condition', 13, 'add_newcondition'),
(50, 'Can change new condition', 13, 'change_newcondition'),
(51, 'Can delete new condition', 13, 'delete_newcondition'),
(52, 'Can view new condition', 13, 'view_newcondition'),
(53, 'Can add ram', 14, 'add_ram'),
(54, 'Can change ram', 14, 'change_ram'),
(55, 'Can delete ram', 14, 'delete_ram'),
(56, 'Can view ram', 14, 'view_ram'),
(57, 'Can add screen', 15, 'add_screen'),
(58, 'Can change screen', 15, 'change_screen'),
(59, 'Can delete screen', 15, 'delete_screen'),
(60, 'Can view screen', 15, 'view_screen'),
(61, 'Can add speed', 16, 'add_speed'),
(62, 'Can change speed', 16, 'change_speed'),
(63, 'Can delete speed', 16, 'delete_speed'),
(64, 'Can view speed', 16, 'view_speed'),
(65, 'Can add type', 17, 'add_type'),
(66, 'Can change type', 17, 'change_type'),
(67, 'Can delete type', 17, 'delete_type'),
(68, 'Can view type', 17, 'view_type'),
(69, 'Can add templist', 18, 'add_templist'),
(70, 'Can change templist', 18, 'change_templist'),
(71, 'Can delete templist', 18, 'delete_templist'),
(72, 'Can view templist', 18, 'view_templist'),
(73, 'Can add stockout', 19, 'add_stockout'),
(74, 'Can change stockout', 19, 'change_stockout'),
(75, 'Can delete stockout', 19, 'delete_stockout'),
(76, 'Can view stockout', 19, 'view_stockout'),
(77, 'Can add dcustomer', 20, 'add_dcustomer'),
(78, 'Can change dcustomer', 20, 'change_dcustomer'),
(79, 'Can delete dcustomer', 20, 'delete_dcustomer'),
(80, 'Can view dcustomer', 20, 'view_dcustomer'),
(81, 'Can add product', 21, 'add_product'),
(82, 'Can change product', 21, 'change_product'),
(83, 'Can delete product', 21, 'delete_product'),
(84, 'Can view product', 21, 'view_product'),
(85, 'Can add temp', 22, 'add_temp'),
(86, 'Can change temp', 22, 'change_temp'),
(87, 'Can delete temp', 22, 'delete_temp'),
(88, 'Can view temp', 22, 'view_temp'),
(89, 'Can add mode', 23, 'add_mode'),
(90, 'Can change mode', 23, 'change_mode'),
(91, 'Can delete mode', 23, 'delete_mode'),
(92, 'Can view mode', 23, 'view_mode'),
(93, 'Can add narations', 24, 'add_narations'),
(94, 'Can change narations', 24, 'change_narations'),
(95, 'Can delete narations', 24, 'delete_narations'),
(96, 'Can view narations', 24, 'view_narations'),
(97, 'Can add orders', 25, 'add_orders'),
(98, 'Can change orders', 25, 'change_orders'),
(99, 'Can delete orders', 25, 'delete_orders'),
(100, 'Can view orders', 25, 'view_orders'),
(101, 'Can add agents_ records', 26, 'add_agents_records'),
(102, 'Can change agents_ records', 26, 'change_agents_records'),
(103, 'Can delete agents_ records', 26, 'delete_agents_records'),
(104, 'Can view agents_ records', 26, 'view_agents_records'),
(105, 'Can add expense', 27, 'add_expense'),
(106, 'Can change expense', 27, 'change_expense'),
(107, 'Can delete expense', 27, 'delete_expense'),
(108, 'Can view expense', 27, 'view_expense'),
(109, 'Can add expense_description', 28, 'add_expense_description'),
(110, 'Can change expense_description', 28, 'change_expense_description'),
(111, 'Can delete expense_description', 28, 'delete_expense_description'),
(112, 'Can view expense_description', 28, 'view_expense_description'),
(113, 'Can add supplier orders', 29, 'add_supplierorders'),
(114, 'Can change supplier orders', 29, 'change_supplierorders'),
(115, 'Can delete supplier orders', 29, 'delete_supplierorders'),
(116, 'Can view supplier orders', 29, 'view_supplierorders'),
(117, 'Can add custom permission', 30, 'add_custompermission'),
(118, 'Can change custom permission', 30, 'change_custompermission'),
(119, 'Can delete custom permission', 30, 'delete_custompermission'),
(120, 'Can view custom permission', 30, 'view_custompermission'),
(121, 'Can add module', 31, 'add_module'),
(122, 'Can change module', 31, 'change_module'),
(123, 'Can delete module', 31, 'delete_module'),
(124, 'Can view module', 31, 'view_module'),
(125, 'Can add type code', 32, 'add_typecode'),
(126, 'Can change type code', 32, 'change_typecode'),
(127, 'Can delete type code', 32, 'delete_typecode'),
(128, 'Can view type code', 32, 'view_typecode'),
(129, 'Can add user', 33, 'add_user'),
(130, 'Can change user', 33, 'change_user'),
(131, 'Can delete user', 33, 'delete_user'),
(132, 'Can view user', 33, 'view_user'),
(133, 'Can add subscription', 34, 'add_subscription'),
(134, 'Can change subscription', 34, 'change_subscription'),
(135, 'Can delete subscription', 34, 'delete_subscription'),
(136, 'Can view subscription', 34, 'view_subscription'),
(137, 'Can add accessory', 35, 'add_accessory'),
(138, 'Can change accessory', 35, 'change_accessory'),
(139, 'Can delete accessory', 35, 'delete_accessory'),
(140, 'Can view accessory', 35, 'view_accessory'),
(141, 'Can add accessory desc', 36, 'add_accessorydesc'),
(142, 'Can change accessory desc', 36, 'change_accessorydesc'),
(143, 'Can delete accessory desc', 36, 'delete_accessorydesc'),
(144, 'Can view accessory desc', 36, 'view_accessorydesc');

-- --------------------------------------------------------

--
-- Table structure for table `dcustomer`
--

CREATE TABLE `dcustomer` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `user_created_at` varchar(200) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `id_no` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `invono` varchar(200) DEFAULT NULL,
  `d_type` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `mode` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(35, 'main', 'accessory'),
(36, 'main', 'accessorydesc'),
(26, 'main', 'agents_records'),
(9, 'main', 'brand'),
(10, 'main', 'cpu'),
(6, 'main', 'customer'),
(20, 'main', 'dcustomer'),
(27, 'main', 'expense'),
(28, 'main', 'expense_description'),
(11, 'main', 'gen'),
(12, 'main', 'hdd'),
(8, 'main', 'masterlist'),
(23, 'main', 'mode'),
(24, 'main', 'narations'),
(13, 'main', 'newcondition'),
(25, 'main', 'orders'),
(21, 'main', 'product'),
(14, 'main', 'ram'),
(15, 'main', 'screen'),
(16, 'main', 'speed'),
(19, 'main', 'stockout'),
(29, 'main', 'supplierorders'),
(22, 'main', 'temp'),
(18, 'main', 'templist'),
(17, 'main', 'type'),
(7, 'main', 'vendor'),
(5, 'sessions', 'session'),
(30, 'users', 'custompermission'),
(31, 'users', 'module'),
(34, 'users', 'subscription'),
(32, 'users', 'typecode'),
(33, 'users', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-29 10:45:48.425037'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-12-29 10:45:48.472010'),
(3, 'auth', '0001_initial', '2023-12-29 10:45:48.622923'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-12-29 10:45:48.655904'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-12-29 10:45:48.660901'),
(6, 'auth', '0004_alter_user_username_opts', '2023-12-29 10:45:48.666898'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-12-29 10:45:48.670895'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-12-29 10:45:48.672894'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-12-29 10:45:48.676892'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-12-29 10:45:48.681889'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-12-29 10:45:48.687886'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-12-29 10:45:48.695881'),
(13, 'auth', '0011_update_proxy_permissions', '2023-12-29 10:45:48.701878'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-12-29 10:45:48.705876'),
(15, 'users', '0001_initial', '2023-12-29 10:45:49.094652'),
(16, 'admin', '0001_initial', '2023-12-29 10:45:49.167609'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-12-29 10:45:49.178603'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-29 10:45:49.186599'),
(19, 'main', '0001_initial', '2023-12-29 10:45:49.193595'),
(20, 'main', '0002_vendor', '2023-12-29 10:45:49.200593'),
(21, 'main', '0003_masterlist', '2023-12-29 10:45:49.266554'),
(22, 'main', '0004_brand_cpu_gen_hdd_newcondition_ram_screen_speed_type', '2023-12-29 10:45:49.320522'),
(23, 'main', '0005_rename_distributor_masterlist_supplier_and_more', '2023-12-29 10:45:49.858212'),
(24, 'main', '0006_templist', '2023-12-29 10:45:49.897189'),
(25, 'main', '0007_masterlist_price_templist_price', '2023-12-29 10:45:49.914180'),
(26, 'main', '0008_templist_sub_total_alter_templist_price_and_more', '2023-12-29 10:45:50.193019'),
(27, 'main', '0009_masterlist_sub_total_masterlist_terms_templist_terms_and_more', '2023-12-29 10:45:50.364920'),
(28, 'main', '0010_stockout', '2023-12-29 10:45:50.405896'),
(29, 'main', '0011_dcustomer_product', '2023-12-29 10:45:50.447872'),
(30, 'main', '0012_templist_d_type', '2023-12-29 10:45:50.459866'),
(31, 'main', '0013_temp', '2023-12-29 10:45:50.497844'),
(32, 'main', '0014_temp_is_active_templist_is_active', '2023-12-29 10:45:50.524828'),
(33, 'main', '0015_masterlist_random_stockout_random_temp_random_and_more', '2023-12-29 10:45:50.565804'),
(34, 'main', '0016_masterlist_brand_stockout_brand', '2023-12-29 10:45:50.586793'),
(35, 'main', '0017_masterlist_gen_stockout_gen', '2023-12-29 10:45:50.608781'),
(36, 'main', '0018_masterlist_speed_stockout_speed', '2023-12-29 10:45:50.630767'),
(37, 'main', '0019_masterlist_screen_stockout_screen', '2023-12-29 10:45:50.654579'),
(38, 'main', '0020_masterlist_comment_stockout_comment', '2023-12-29 10:45:50.679564'),
(39, 'main', '0021_mode', '2023-12-29 10:45:50.687561'),
(40, 'main', '0022_dcustomer_mode', '2023-12-29 10:45:50.697554'),
(41, 'main', '0023_product_amount_product_mode', '2023-12-29 10:45:50.716543'),
(42, 'main', '0024_masterlist_datedelivered_stockout_datedelivered_and_more', '2023-12-29 10:45:50.765187'),
(43, 'main', '0025_narations', '2023-12-29 10:45:50.809119'),
(44, 'main', '0026_narations_status', '2023-12-29 10:45:50.830108'),
(45, 'main', '0027_alter_templist_serialno', '2023-12-29 10:45:50.844100'),
(46, 'main', '0028_orders', '2023-12-29 10:45:50.852096'),
(47, 'main', '0029_temp_brand', '2023-12-29 10:45:50.867087'),
(48, 'main', '0030_templist_brand', '2023-12-29 10:45:50.884076'),
(49, 'main', '0031_templist_gen', '2023-12-29 10:45:50.896795'),
(50, 'main', '0032_agents_records', '2023-12-29 10:45:50.938781'),
(51, 'main', '0033_orders_unique_key', '2023-12-29 10:45:50.945777'),
(52, 'main', '0034_agents_records_random_orders_random', '2023-12-29 10:45:50.962767'),
(53, 'main', '0035_agents_records_date', '2023-12-29 10:45:50.980757'),
(54, 'main', '0036_orders_total_amount', '2023-12-29 10:45:50.987128'),
(55, 'main', '0037_expense', '2023-12-29 10:45:51.036100'),
(56, 'main', '0038_expense_description_alter_expense_description', '2023-12-29 10:45:51.247869'),
(57, 'main', '0039_alter_product_sold_to', '2023-12-29 10:45:51.581677'),
(58, 'main', '0040_supplierorders_alter_orders_date', '2023-12-29 10:45:51.594669'),
(59, 'main', '0041_narations_order_type', '2023-12-29 10:45:51.610660'),
(60, 'main', '0042_rename_price_masterlist_bprice_and_more', '2023-12-29 10:45:51.703120'),
(61, 'main', '0043_agents_records_refund_amound_and_more', '2023-12-29 10:45:51.733731'),
(62, 'main', '0044_product_brpice', '2023-12-29 10:46:22.563224'),
(63, 'main', '0045_remove_product_brpice', '2023-12-29 10:46:22.738907'),
(64, 'main', '0046_product_brpice', '2023-12-29 10:46:22.791646'),
(65, 'main', '0047_rename_brpice_product_stockout', '2023-12-29 10:46:22.982628'),
(66, 'main', '0048_remove_product_stockout_product_bprice', '2023-12-29 10:46:23.165522'),
(67, 'sessions', '0001_initial', '2023-12-29 10:46:23.189348'),
(68, 'users', '0002_subscription', '2023-12-29 10:46:23.236237'),
(69, 'main', '0049_accessory_temp_screen_templist_screen_accessorydesc', '2023-12-30 07:41:56.528442'),
(70, 'main', '0050_accessory_qty_delete_accessorydesc', '2023-12-30 09:29:15.151840'),
(71, 'main', '0051_accessory_bprice_accessory_sprice', '2023-12-30 09:44:55.096627'),
(72, 'main', '0052_accessory_supplier', '2023-12-30 10:21:10.844254');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('g0nplhn2ztyb7ehgxj2ip7r3t9z40prb', '.eJxVjDsOwjAQRO_iGll2zGYxHYiGIlzBWn-WBIgj5VMh7k4spYByZt68t3C0zK1bpjS6Loqj0GL323kKz5TLEB-U74MMQ57HzsuCyG2dZDPE9Dpv7J-gpald31QbfUBgNGCjCjWAVb5K-4qYtAJlggVmTAwWWVeIQUEEozwSe4NplRbdajpdmutti5n6VKrYd1l8vszCQcc:1rJARr:53JzQefi9qjXwjN3Z34oqKoofEhYYIrE5M0R7T8InTc', '2023-12-29 13:50:39.939592'),
('god1vcog54zyaolwwf5mgbg7yy5di5ad', '.eJxVjDsOwjAQRO_iGll2zGYxHYiGIlzBWn-WBIgj5VMh7k4spYByZt68t3C0zK1bpjS6Loqj0GL323kKz5TLEB-U74MMQ57HzsuCyG2dZDPE9Dpv7J-gpald31QbfUBgNGCjCjWAVb5K-4qYtAJlggVmTAwWWVeIQUEEozwSe4NplRbdajpdmutti5n6VKrYd1l8vszCQcc:1rJDGt:s5oNp05dBO-H0smKUpeVzOKWYMJho2vEOE8mxtCa1l4', '2023-12-29 16:51:31.830662'),
('lsg1up03s0lg2rsfusotgilfwzjpbpx9', '.eJxVjDsOwjAQRO_iGll2zGYxHYiGIlzBWn-WBIgj5VMh7k4spYByZt68t3C0zK1bpjS6Loqj0GL323kKz5TLEB-U74MMQ57HzsuCyG2dZDPE9Dpv7J-gpald31QbfUBgNGCjCjWAVb5K-4qYtAJlggVmTAwWWVeIQUEEozwSe4NplRbdajpdmutti5n6VKrYd1l8vszCQcc:1rJX6W:6XBOv2oLbBOsqFSoAryEBxlVHlVl7_FKKj8rvNUvZ-s', '2023-12-30 14:02:08.608756'),
('ype8jcsazrzmoer4tutasoih1q678w50', '.eJxVjDsOwjAQRO_iGll2zGYxHYiGIlzBWn-WBIgj5VMh7k4spYByZt68t3C0zK1bpjS6Loqj0GL323kKz5TLEB-U74MMQ57HzsuCyG2dZDPE9Dpv7J-gpald31QbfUBgNGCjCjWAVb5K-4qYtAJlggVmTAwWWVeIQUEEozwSe4NplRbdajpdmutti5n6VKrYd1l8vszCQcc:1rJTwi:GMGJqgjz4hvnddZQIX0zWvLcOpOF4WiWZNLz_B7X1ok', '2023-12-30 10:39:48.258875');

-- --------------------------------------------------------

--
-- Table structure for table `main_accessory`
--

CREATE TABLE `main_accessory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `date` date NOT NULL,
  `qty` int(11) NOT NULL,
  `bprice` double NOT NULL,
  `sprice` double NOT NULL,
  `supplier_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_accessory`
--

INSERT INTO `main_accessory` (`id`, `name`, `date`, `qty`, `bprice`, `sprice`, `supplier_id`) VALUES
(5, 'Ps4 dual shock', '2023-12-30', 7, 2000, 2500, 2),
(6, 'Cursor Ups 700VA', '2023-12-30', 0, 0, 0, NULL),
(7, 'Cursor Ups 850VA', '2023-12-30', 0, 0, 0, NULL),
(8, 'Cursor Ups 1200VA', '2023-12-30', 0, 0, 0, NULL),
(9, 'Cursor Ups 2200VA', '2023-12-30', 0, 0, 0, NULL),
(10, '3.5 Hdd External case', '2023-12-30', 9, 900, 1500, 2),
(13, 'AOC Km-410 gaming keyboard & Mouse', '2023-12-30', 4, 0, 0, 2),
(14, 'Laptop stand', '2023-12-30', 0, 0, 0, NULL),
(15, 'Laptop stand Multi', '2023-12-30', 2, 0, 0, 2),
(16, 'Office Point 6-way', '2023-12-30', 0, 0, 0, NULL),
(17, 'Hp gaming headset H120', '2023-12-30', 0, 0, 0, NULL),
(18, 'Hp gaming headset H100', '2023-12-30', 0, 0, 0, NULL),
(19, 'Hp bt200 Headsets', '2023-12-30', 0, 0, 0, NULL),
(20, 'Hp speakers x360', '2023-12-30', 0, 0, 0, NULL),
(21, 'Lenovo speakers', '2023-12-30', 0, 0, 0, NULL),
(22, 'Kisonil Speakers, v360', '2023-12-30', 0, 0, 0, NULL),
(23, 'Rechargeable  Mouse', '2023-12-30', 0, 0, 0, NULL),
(24, 'Bluetooth rechargeable  Mouse', '2023-12-30', 0, 0, 0, NULL),
(25, 'Hp mouse, x500', '2023-12-30', 0, 0, 0, NULL),
(26, 'Hp gaming mouse M160', '2023-12-30', 0, 0, 0, NULL),
(27, 'Hp gaming mouse M100', '2023-12-30', 0, 0, 0, NULL),
(28, 'Hp gaming mouse M150', '2023-12-30', 0, 0, 0, NULL),
(29, 'Hp gaming mouse M200', '2023-12-30', 0, 0, 0, NULL),
(30, 'Hp gaming mouse M220', '2023-12-30', 0, 0, 0, NULL),
(31, 'Hp gaming mouse M270', '2023-12-30', 0, 0, 0, NULL),
(32, 'Hp gaming mouse M260', '2023-12-30', 0, 0, 0, NULL),
(33, 'Meetion Mouse wired', '2023-12-30', 0, 0, 0, NULL),
(34, 'Meetion Mouse wireless', '2023-12-30', 0, 0, 0, NULL),
(35, 'V5 gaming mouse', '2023-12-30', 0, 0, 0, NULL),
(36, 'logitech Keyboard k400 plus', '2023-12-30', 0, 0, 0, NULL),
(37, 'logitech Keyboard/mouse mk270', '2023-12-30', 0, 0, 0, NULL),
(38, 'Logitech keyboard/mouse mk290', '2023-12-30', 0, 0, 0, NULL),
(39, 'logitech Keyboard mk220', '2023-12-30', 0, 0, 0, NULL),
(40, 'logitech wireless mouse m190', '2023-12-30', 0, 0, 0, NULL),
(41, 'logitech mouse m171', '2023-12-30', 0, 0, 0, NULL),
(43, 'logitech mouse m191', '2023-12-30', 0, 0, 0, NULL),
(44, 'TWolf v-12 wired mouse', '2023-12-30', 0, 0, 0, NULL),
(45, 'TWolf Q4 Wireless mouse', '2023-12-30', 0, 0, 0, NULL),
(46, 'Salar headsets A500', '2023-12-30', 0, 0, 0, NULL),
(47, 'Tucci headsets', '2023-12-30', 0, 0, 0, NULL),
(48, 'Hp scanner', '2023-12-30', 0, 0, 0, NULL),
(49, 'Hp thermal printer 58mm', '2023-12-30', 0, 0, 0, NULL),
(50, 'Tenda router N300-F3', '2023-12-30', 0, 0, 0, NULL),
(51, 'TPlink 3420 39/49 router', '2023-12-30', 0, 0, 0, NULL),
(52, 'Hdmi spitter 4x', '2023-12-30', 0, 0, 0, NULL),
(53, 'omen by hp headset', '2023-12-30', 0, 0, 0, NULL),
(54, 'Display 2 hdmi cable', '2023-12-30', 0, 0, 0, NULL),
(55, 'Portable thermal printer', '2023-12-30', 0, 0, 0, NULL),
(56, 'Jakemy JM - 8101 33 in 1', '2023-12-30', 25, 0, 0, 2),
(57, 'Jakemy JM - 8139 47 in 1', '2023-12-30', 14, 0, 0, 2),
(58, 'Tplink 16 port gigabit', '2023-12-30', 0, 0, 0, NULL),
(59, 'Hdmi spitter 1x2', '2023-12-30', 0, 0, 0, NULL),
(60, 'Hdmi spitter 1x8', '2023-12-30', 0, 0, 0, NULL),
(61, 'Elimutabs ET05', '2023-12-30', 0, 0, 0, NULL),
(62, 'Elimutabs ET04', '2023-12-30', 0, 0, 0, NULL),
(63, 'Foam cleaning agents', '2023-12-30', 0, 0, 0, NULL),
(64, 'Amaya USB charger', '2023-12-30', 0, 0, 0, NULL),
(65, 'Impact punch down tool', '2023-12-30', 0, 0, 0, NULL),
(66, 'Amaya usb cable normal', '2023-12-30', 0, 0, 0, NULL),
(67, 'Amaya type-c cable', '2023-12-30', 0, 0, 0, NULL),
(68, 'Amaya earphones', '2023-12-30', 0, 0, 0, NULL),
(69, 'Hp body cam', '2023-12-30', 0, 0, 0, NULL),
(70, 'Lenovo tab m7', '2023-12-30', 0, 0, 0, NULL),
(71, 'Toshiba 2TB external hdd', '2023-12-30', 0, 0, 0, NULL),
(72, 'Transcend 4TB external hdd', '2023-12-30', 0, 0, 0, NULL),
(73, 'Lexar 512ssd Nvme ussd', '2023-12-30', 0, 0, 0, NULL),
(74, '256 ssd 2.5 lexar ssd', '2023-12-30', 0, 0, 0, NULL),
(75, '128 GB 2.5 lexar ssd', '2023-12-30', 0, 0, 0, NULL),
(76, '16 GB usb drive lexar', '2023-12-30', 0, 0, 0, NULL),
(77, '32 GB sandisk 3.0', '2023-12-30', 0, 0, 0, NULL),
(78, '64 GB lexar 2.0', '2023-12-30', 0, 0, 0, NULL),
(79, '64 GB sandisk 3.0', '2023-12-30', 0, 0, 0, NULL),
(80, 'Patch cord', '2023-12-30', 0, 0, 0, NULL),
(81, 'USB to external', '2023-12-30', 0, 0, 0, NULL),
(82, 'Bluetooth dongle 5.0', '2023-12-30', 0, 0, 0, NULL),
(83, 'Printer cable 5m', '2023-12-30', 0, 0, 0, NULL),
(84, 'Printer cable 10m', '2023-12-30', 0, 0, 0, NULL),
(85, 'HDMI cable 5m', '2023-12-30', 0, 0, 0, NULL),
(86, 'HDMI cable 3m', '2023-12-30', 0, 0, 0, NULL),
(87, 'Printer cable 1.5m', '2023-12-30', 0, 0, 0, NULL),
(88, 'CMOS battery', '2023-12-30', 0, 0, 0, NULL),
(89, 'USB hub 3.0', '2023-12-30', 0, 0, 0, NULL),
(90, 'Type-c to hdmi 8 in 1', '2023-12-30', 0, 0, 0, NULL),
(91, 'USB to HDMI', '2023-12-30', 0, 0, 0, NULL),
(92, 'Mouse pads', '2023-12-30', 0, 0, 0, NULL),
(93, '10 inches sleeve bags', '2023-12-30', 0, 0, 0, NULL),
(94, '8port switch', '2023-12-30', 0, 0, 0, NULL),
(95, 'Tenda 4g -LTE Mi-Fi', '2023-12-30', 0, 0, 0, NULL),
(96, '14\" sleeve bags', '2023-12-30', 0, 0, 0, NULL),
(97, 'Candy hdd', '2023-12-30', 0, 0, 0, NULL),
(98, 'Quick heal internet security 2 users', '2023-12-30', 0, 0, 0, NULL),
(99, 'Face plates douple', '2023-12-30', 0, 0, 0, NULL),
(100, 'Quick heal internet security 3 users', '2023-12-30', 0, 0, 0, NULL),
(101, 'Quick heal internet security 5 users', '2023-12-30', 0, 0, 0, NULL),
(102, 'Toners | Catridge', '2023-12-30', 0, 0, 0, NULL),
(103, 'Blower 750watts', '2023-12-30', 9, 1000, 1500, 2);

-- --------------------------------------------------------

--
-- Table structure for table `main_agents_records`
--

CREATE TABLE `main_agents_records` (
  `id` bigint(20) NOT NULL,
  `units` int(11) DEFAULT NULL,
  `returned_units` int(11) NOT NULL,
  `commission` double DEFAULT NULL,
  `name_id` bigint(20) DEFAULT NULL,
  `random` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `refund_amound` int(11) NOT NULL,
  `sales_revenue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_brand`
--

CREATE TABLE `main_brand` (
  `id` bigint(20) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_brand`
--

INSERT INTO `main_brand` (`id`, `brand`, `created_at`) VALUES
(1, 'hp', '2023-12-29'),
(2, 'Dell', '2023-12-29'),
(3, 'Acer', '2023-12-29'),
(4, 'Lenovo', '2023-12-29'),
(5, 'Samsung', '2023-12-29'),
(6, 'Fujitsu', '2023-12-29'),
(7, 'Toshiba', '2023-12-29'),
(8, 'Asus', '2023-12-29'),
(9, 'Mix', '2023-12-29'),
(10, 'Apple', '2023-12-29'),
(11, 'Philips', '2023-12-29'),
(12, 'Viewsonic', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_cpu`
--

CREATE TABLE `main_cpu` (
  `id` bigint(20) NOT NULL,
  `cpu` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_cpu`
--

INSERT INTO `main_cpu` (`id`, `cpu`, `created_at`) VALUES
(1, 'Intel Core i3', '2023-12-29'),
(2, 'Intel Core i5', '2023-12-29'),
(3, 'Intel Core i7', '2023-12-29'),
(4, 'Intel Core i9', '2023-12-29'),
(5, 'Intel Celeron', '2023-12-29'),
(6, 'Intel Pentium', '2023-12-29'),
(7, 'AMD 3020e', '2023-12-29'),
(8, 'AMD Athlon', '2023-12-29'),
(9, 'AMD Ryzen 3', '2023-12-29'),
(10, 'AMD Ryzen 5', '2023-12-29'),
(11, 'AMD Ryzen 7', '2023-12-29'),
(12, 'AMD Ryzen 9', '2023-12-29'),
(13, 'Intel Xeon', '2023-12-29'),
(14, 'Intel Core m', '2023-12-29'),
(15, 'Intel Core m3', '2023-12-29'),
(16, 'Intel Core m5', '2023-12-29'),
(17, 'Intel Core m7', '2023-12-29'),
(18, 'AMD A4', '2023-12-29'),
(19, 'AMD A6', '2023-12-29'),
(20, 'AMD A8', '2023-12-29'),
(21, 'AMD A9', '2023-12-29'),
(22, 'AMD A10', '2023-12-29'),
(23, 'AMD A12', '2023-12-29'),
(24, 'KX', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_customer`
--

CREATE TABLE `main_customer` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `user_created_at` varchar(200) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `id_no` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `invono` varchar(200) DEFAULT NULL,
  `date_joined` date NOT NULL,
  `id_document` varchar(200) DEFAULT NULL,
  `pin_document` varchar(200) DEFAULT NULL,
  `registration_document` varchar(200) DEFAULT NULL,
  `l_document` varchar(200) DEFAULT NULL,
  `business_document` varchar(200) DEFAULT NULL,
  `location_document` varchar(200) DEFAULT NULL,
  `other_document` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_expense`
--

CREATE TABLE `main_expense` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `description_id` bigint(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `name_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_expense_description`
--

CREATE TABLE `main_expense_description` (
  `id` bigint(20) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_expense_description`
--

INSERT INTO `main_expense_description` (`id`, `description`) VALUES
(1, 'Broker'),
(2, 'Lunch'),
(3, 'Rent, utilities (electricity, water), and maintenance.'),
(4, 'Regular upkeep of tools and equipment.');

-- --------------------------------------------------------

--
-- Table structure for table `main_gen`
--

CREATE TABLE `main_gen` (
  `id` bigint(20) NOT NULL,
  `gen` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_gen`
--

INSERT INTO `main_gen` (`id`, `gen`, `created_at`) VALUES
(1, '1st Gen', '2023-12-29'),
(2, '2nd Gen', '2023-12-29'),
(3, '3rd Gen', '2023-12-29'),
(4, '4th Gen', '2023-12-29'),
(5, '5th Gen', '2023-12-29'),
(6, '6th Gen', '2023-12-29'),
(7, '7th Gen', '2023-12-29'),
(8, '8th Gen', '2023-12-29'),
(9, '9th Gen', '2023-12-29'),
(10, '10th Gen', '2023-12-29'),
(11, '11th Gen', '2023-12-29'),
(12, '12th Gen', '2023-12-29'),
(13, 'AMD', '2023-12-29'),
(14, 'U6780A', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_hdd`
--

CREATE TABLE `main_hdd` (
  `id` bigint(20) NOT NULL,
  `hdd` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_hdd`
--

INSERT INTO `main_hdd` (`id`, `hdd`, `created_at`) VALUES
(1, '16', '2023-12-29'),
(2, '32', '2023-12-29'),
(3, '64', '2023-12-29'),
(4, '128', '2023-12-29'),
(5, '180', '2023-12-29'),
(6, '250', '2023-12-29'),
(7, '256', '2023-12-29'),
(8, '360', '2023-12-29'),
(9, '500', '2023-12-29'),
(10, '512', '2023-12-29'),
(11, '640', '2023-12-29'),
(12, '750', '2023-12-29'),
(13, '960', '2023-12-29'),
(14, '1000', '2023-12-29'),
(15, '1024', '2023-12-29'),
(16, '2000', '2023-12-29'),
(17, '3000', '2023-12-29'),
(18, '4000', '2023-12-29'),
(19, '6000', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_masterlist`
--

CREATE TABLE `main_masterlist` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `ram` varchar(200) DEFAULT NULL,
  `hdd` varchar(200) DEFAULT NULL,
  `daterecieved` date DEFAULT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `dels` varchar(200) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `bprice` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `terms` varchar(200) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `gen` varchar(200) DEFAULT NULL,
  `speed` varchar(200) DEFAULT NULL,
  `screen` varchar(200) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `datedelivered` date DEFAULT NULL,
  `sprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_masterlist`
--

INSERT INTO `main_masterlist` (`id`, `type`, `unit_price`, `serialno`, `model`, `cpu`, `ram`, `hdd`, `daterecieved`, `qty`, `total`, `dels`, `vat`, `supplier_id`, `bprice`, `sub_total`, `terms`, `random`, `brand`, `gen`, `speed`, `screen`, `comment`, `datedelivered`, `sprice`) VALUES
(1, 'Laptop', NULL, '5CG2070LSN', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(2, 'Laptop', NULL, '5CG20700CW', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(3, 'Laptop', NULL, '5CG2061W1G', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(4, 'Laptop', NULL, '5CG1422K8X', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(5, 'Laptop', NULL, '5CG20700KG', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(6, 'Laptop', NULL, '5CG2071GT2', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(7, 'Laptop', NULL, '5CG2070M0F', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(8, 'Laptop', NULL, '5CG2073D47', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(9, 'Laptop', NULL, '5CG20700TL', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(10, 'Laptop', NULL, '5CG2070LQC', '830 G8', 'Intel Core i5', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(11, 'Laptop', NULL, '5CG24822HT', '830 G8', 'Intel Core i7', '512', '16', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(12, 'Laptop', NULL, '5CD011863M', '1030 G4', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(13, 'Laptop', NULL, '5CD0029NMJ', '1030 G4', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(14, 'Laptop', NULL, '5CD0096QM6', '1030 G4', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(15, 'Laptop', NULL, '5CD943344T', '1030 G4', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(16, 'Laptop', NULL, '5CG85247C9', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(17, 'Laptop', NULL, '5CG85010ZQ', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(18, 'Laptop', NULL, '5CG85247HS', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(19, 'Laptop', NULL, '5CG8501019', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(20, 'Laptop', NULL, '5CG85012MQ', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(21, 'Laptop', NULL, '5CG8501174', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(22, 'Laptop', NULL, '5CG85010GS', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(23, 'Laptop', NULL, '5CG85010KF', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(24, 'Laptop', NULL, '5CG025097V', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(25, 'Laptop', NULL, '5CG85247SJ', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(26, 'Laptop', NULL, '5CG85012LL', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(27, 'Laptop', NULL, '5CG02509FQ', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(28, 'Laptop', NULL, '5CG90210SC', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(29, 'Laptop', NULL, '5CG85011HP', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(30, 'Laptop', NULL, '5CG85013C6', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(31, 'Laptop', NULL, '5CG85011BS', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(32, 'Laptop', NULL, '5CG85012CL', '830 G5 touch screen', 'Intel Core i5', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(33, 'Laptop', NULL, '5CG8393C4J', 'probook x360', 'Intel Core m3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(34, 'Laptop', NULL, '5CG93020Q2', 'probook x360', 'Intel Core m3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(35, 'Laptop', NULL, '5CG9301WCZ', 'probook x360', 'Intel Core m3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(36, 'Laptop', NULL, '8CG71826MB', 'probook 11  G2 T.S', 'Intel Core i3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(37, 'Laptop', NULL, '8CG7215C2Q', 'probook 11  G2 T.S', 'Intel Core i3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(38, 'Laptop', NULL, '8CG7215X3G', 'probook 11  G2 T.S', 'Intel Core i3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(39, 'Laptop', NULL, '8CG7183VFL', 'probook 11  G2 T.S', 'Intel Core i3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(40, 'Laptop', NULL, '8CG7215C02', 'probook 11  G2 T.S', 'Intel Core i3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(41, 'Laptop', NULL, '5CG9133H6L', '840 G5', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(42, 'Laptop', NULL, '5CG6390PMW', '840 G3 ', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(43, 'Laptop', NULL, '5CG8053Y6V', '840 G3 ', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(44, 'Laptop', NULL, '5CG8394Z8M', '840 G3 ', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(45, 'Laptop', NULL, '5CG736408J', '840 G3 ', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(46, 'Laptop', NULL, '5CG7313X3D', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(47, 'Laptop', NULL, '5CG7431LPK', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(48, 'Laptop', NULL, '5CG74914XT', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(49, 'Laptop', NULL, '5CG7425JM5', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(50, 'Laptop', NULL, '8CG61806K0', '1040 G2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(51, 'Laptop', NULL, '8CG6031QPH', '1040 G2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(52, 'Laptop', NULL, '5CG7080KN9', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(53, 'Laptop', NULL, '5CG7252Q27', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(54, 'Laptop', NULL, '5CG80650CZ', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(55, 'Laptop', NULL, '5CG80124BC', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(56, 'Laptop', NULL, '5CG736169K', '745', 'AMD A10', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(57, 'Laptop', NULL, '5CG9181Y9M', '840 G5 T.S', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(58, 'Laptop', NULL, '5CG8516WHJ', '840 G5 T.S', 'Intel Core i7', '16384', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(59, 'Laptop', NULL, 'FVFYG8A4J1WK', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(60, 'Laptop', NULL, 'C1MS589RH3QD', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(61, 'Laptop', NULL, 'FVFYHDB5J1WK', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(62, 'Laptop', NULL, 'FVFW71D9J1WK', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(63, 'Laptop', NULL, 'FVFW100NJ1WD', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(64, 'Laptop', NULL, 'FVFT31P0H3QD', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(65, 'Laptop', NULL, 'C1MTNDRFJ1WK', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(66, 'Laptop', NULL, 'C02LH0SYFGYY', 'Macbook pro A1502', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(67, 'Laptop', NULL, 'C02N9SFUG3QJ', 'Macbook pro A1502', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(68, 'Laptop', NULL, 'C02NT7ULG3QK', 'Macbook pro A1502', 'Intel Core i5', '8192', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(69, 'Laptop', NULL, 'C02L32DXFFT0', 'Macbook pro A1398', 'Intel Core i7', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(70, 'Laptop', NULL, 'C1MKWQPQDTY3', 'MACBOOK PRO A1278', 'Intel Core i5', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(71, 'Laptop', NULL, 'C02H6D75DJWT', 'Macbook Air A1369', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(72, 'Laptop', NULL, 'C1MQF7VUG940', 'Macbook Air A1466', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(73, 'Laptop', NULL, 'C1MQH6APG944', 'Macbook Air A1466', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(74, 'Laptop', NULL, 'C02MMBYRG086', 'Macbook Air A1466', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(75, 'Laptop', NULL, 'C02NHBJRG086', 'Macbook Air A1466', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(76, 'Laptop', NULL, 'C02NNA3KG086', 'Macbook Air A1466', 'Intel Core i5', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(77, 'Laptop', NULL, '5CD206BJDM', '14S', 'AMD Ryzen 5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(78, 'Laptop', NULL, 'C02HX3EYDKQ2', 'Macbook pro A1398', 'Intel Core i7', '8192', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(79, 'Laptop', NULL, 'C02CK3A7MD6N', 'Macbook pro A2141', 'Intel Core i9', '16384', '1000', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(80, 'Laptop', NULL, 'FVFXN66QJK7C', 'Macbook Air A1932', 'Intel Core i7', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Apple', 'None', 'None', 'None', 'None', NULL, 0.00),
(81, 'Laptop', NULL, '5CG8393BQM', 'probook 11  G2 T.S', 'Intel Core m3', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(82, 'Laptop', NULL, 'CND8193JV2', 'Zbook 17', 'Intel Core i7', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(83, 'Laptop', NULL, 'CND8333ZG8', 'Zbook 17', 'Intel Core i7', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(84, 'Laptop', NULL, 'CND9051P2K', 'Zbook 17', 'Intel Core i7', '16384', '512', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(85, 'Laptop', NULL, 'WXS0962', 'Latitude 3190', 'Intel Celeron', '4096', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Dell', 'None', 'None', 'None', 'None', NULL, 0.00),
(86, 'Laptop', NULL, 'MP181AM0', 'Yoga 260', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(87, 'Laptop', NULL, '5CG5241YPB', '1020 G1 ', 'Intel Core m5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(88, 'Laptop', NULL, '5CG5310278', '1020 G1 ', 'Intel Core m5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(89, 'Laptop', NULL, ' 5CG5324Y7S', '1020 G1 ', 'Intel Core m5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(90, 'Laptop', NULL, 'MP16L0ZC', 'Yoga 260', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(91, 'Laptop', NULL, 'MP16XALE', 'Yoga 260', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(92, 'Laptop', NULL, '5CG5324YTT', '1020 G1', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(93, 'Laptop', NULL, '5CG53250BG', '1020 G1', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(94, 'Laptop', NULL, '1S20J2S0TQ00LR0AP6JZ', 'Thinkpad 13', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(95, 'Laptop', NULL, 'PC053CYJ', 'Thinkpad T450S', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(96, 'Laptop', NULL, 'PC053BWH', 'Thinkpad T450S', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(97, 'Laptop', NULL, 'PC0576RN', 'Thinkpad T450S', 'Intel Core i5', '8192', '128', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(98, 'Laptop', NULL, 'PC04XP1E', 'T450S', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(99, 'Laptop', NULL, 'MP16WXWC', 'Thinkpad Yoga 370', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(100, 'Laptop', NULL, 'MP1CSWQP', 'Thinkpad Yoga 370', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(101, 'Laptop', NULL, 'PC0VD95L', 'X270', 'Intel Core i5', '8192', '500', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'Lenovo', 'None', 'None', 'None', 'None', NULL, 0.00),
(102, 'Laptop', NULL, '5CG8363F4L', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(103, 'Laptop', NULL, '5CG9105RRN', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(104, 'Laptop', NULL, '5CG82476J1', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(105, 'Laptop', NULL, '5CG9105L95', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(106, 'Laptop', NULL, '5CG8495PY2', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(107, 'Laptop', NULL, '5CG9106Q3W', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(108, 'Laptop', NULL, '5CG8423ZBC', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(109, 'Laptop', NULL, '5CG9103749', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(110, 'Laptop', NULL, '5CG91041FP', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(111, 'Laptop', NULL, '5CG9103825', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(112, 'Laptop', NULL, '5CG9105MWK', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(113, 'Laptop', NULL, '5CG9106TD6', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(114, 'Laptop', NULL, '5CG9105MSK', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(115, 'Laptop', NULL, '5CG8454D5W', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(116, 'Laptop', NULL, '5CG84447HP', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(117, 'Laptop', NULL, '5CG9102XR1', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(118, 'Laptop', NULL, '5CG9105Q0P', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(119, 'Laptop', NULL, '5CG91030WH', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(120, 'Laptop', NULL, '5CG910442Z', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(121, 'Laptop', NULL, '5CG9105S33', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(122, 'Laptop', NULL, '5CG913313V', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(123, 'Laptop', NULL, '5CG9102W0F', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(124, 'Laptop', NULL, '5CG9130443', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(125, 'Laptop', NULL, '5CG9106WZ4', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(126, 'Laptop', NULL, '5CG91038JK', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(127, 'Laptop', NULL, '5CG91034S0', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(128, 'Laptop', NULL, '5CG9105NWT', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(129, 'Laptop', NULL, '5CG9107336', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(130, 'Laptop', NULL, '5CG9034Z68', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(131, 'Laptop', NULL, '5CG9122VM7', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(132, 'Laptop', NULL, '5CG9094K8Y', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(133, 'Laptop', NULL, '5CG9106S4Q', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(134, 'Laptop', NULL, '5CG8475HM3', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(135, 'Laptop', NULL, '5CG9105PR8', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(136, 'Laptop', NULL, '5CG8495VBB', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(137, 'Laptop', NULL, '5CG9102XTY', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(138, 'Laptop', NULL, '5CG8463GLM', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(139, 'Laptop', NULL, '5CG91300GH', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(140, 'Laptop', NULL, '5CG9129580', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(141, 'Laptop', NULL, '5CG8465KFD', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(142, 'Laptop', NULL, '5CG91034D8', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(143, 'Laptop', NULL, '5CG91335F5', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(144, 'Laptop', NULL, '5CG91070V3', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(145, 'Laptop', NULL, '5CG91044NT', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(146, 'Laptop', NULL, '5CG91336FS', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(147, 'Laptop', NULL, '5CG8463FZC', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(148, 'Laptop', NULL, '5CG8495GZW', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(149, 'Laptop', NULL, '5CG9094KDL', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(150, 'Laptop', NULL, '5CG91332JJ', 'Elite x2 1012 g2', 'Intel Core i5', '8192', '256', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 0.00, 0.00, 'Admin', 'None', 'hp', 'None', 'None', 'None', 'None', NULL, 0.00),
(151, 'Monitor', NULL, '0TUU', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 10000.00),
(152, 'Monitor', NULL, 'A00', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 10000.00),
(153, 'Monitor', NULL, 'CN0J672H6418093N0YTL', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 10000.00),
(154, 'Monitor', NULL, '2QDL', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 10000.00),
(155, 'Monitor', NULL, 'CN0TH63846633681AGGU', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 10000.00),
(156, 'Monitor', NULL, 'CN0C182J744458BQCE7L', '1708FPT', '', '', '', '2023-12-30', 'None', NULL, 'None', 480.00, 2, 3000.00, 3480.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 4000.00),
(157, 'Monitor', NULL, 'CN07J5CN7444518RBWUL', 'P2210G', '', '', '', '2023-12-30', 'None', NULL, 'None', 480.00, 2, 4000.00, 3480.00, 'Admin', 'None', 'Dell', '', 'None', '22\"', 'None', NULL, 4000.00),
(158, 'Monitor', NULL, 'CN012MWY641803B8011U', 'E2014HC', '', '', '', '2023-12-30', 'None', NULL, 'None', 480.00, 2, 3000.00, 3480.00, 'Admin', 'None', 'Dell', '', 'None', '20\"', 'None', NULL, 4000.00),
(159, 'Monitor', NULL, '25JY', 'E1911F', '', '', '', '2023-12-30', 'None', NULL, 'None', 480.00, 2, 3000.00, 3480.00, 'Admin', 'None', 'Dell', '', 'None', '17\"', 'None', NULL, 4000.00),
(160, 'Monitor', NULL, '3GC7Q2', 'E2417H', '', '', '', '2023-12-30', 'None', NULL, 'None', 960.00, 2, 6000.00, 6960.00, 'Admin', 'None', 'Dell', '', 'None', '22\"', 'None', NULL, 6000.00),
(161, 'Monitor', NULL, 'CNC83900ZY', 'LP2275W', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'hp', '', 'None', '22\"', 'None', NULL, 5000.00),
(162, 'Monitor', NULL, 'CN0R9R0174445592CULL', 'P2314TT', '', '', '', '2023-12-30', 'None', NULL, 'None', 1280.00, 2, 8000.00, 9280.00, 'Admin', 'None', 'Dell', '', 'None', '24\"', 'None', NULL, 1000.00),
(163, 'Monitor', NULL, 'VN694620', '', '', '', '', '2023-12-30', 'None', NULL, 'None', 960.00, 2, 6000.00, 6960.00, 'Admin', 'None', 'Lenovo', '', 'None', '24\"', 'None', NULL, 5000.00),
(164, 'Monitor', NULL, 'VNAOZA8H', 'T2254PC', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(165, 'Monitor', NULL, 'V5526845', 'E2223s', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(166, 'Monitor', NULL, 'V54884489', 'E2223s', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(167, 'Monitor', NULL, 'V5526968', 'E2223s', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(168, 'Monitor', NULL, 'V5526825', 'E2223s', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(169, 'Monitor', NULL, 'V5526975', 'E2223s', '', '', '', '2023-12-29', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 5000.00),
(170, 'Monitor', NULL, 'V5282175', 'E2223s', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Lenovo', '', 'None', '22\"', 'None', NULL, 9000.00),
(171, 'Monitor', NULL, '71XMR03', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 9000.00),
(172, 'Monitor', NULL, 'H7QFHZ2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 9000.00),
(173, 'Monitor', NULL, 'JBTMR03', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 9000.00),
(174, 'Monitor', NULL, 'F4QFHZ2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(175, 'Monitor', NULL, 'FXNFHZ2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(176, 'Monitor', NULL, 'FPXMR03', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(177, 'Monitor', NULL, '3FXMR03', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(178, 'Monitor', NULL, '1DNGHZ2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(179, 'Monitor', NULL, '3MWJ3V2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(180, 'Monitor', NULL, 'B4PGHZ2', 'P2319H', '', '', '', '2023-12-29', 'None', NULL, 'None', 0.00, 2, 5000.00, 0.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 0.00),
(181, 'Allinone', NULL, 'FZMR1H2', 'Optiplex 3240', 'Intel Core i3', '8192', '500', '2023-12-30', 'None', NULL, 'None', 3520.00, 2, 22000.00, 25520.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '22\"', 'None', NULL, 25000.00),
(182, 'Allinone', NULL, 'FDK1DH2', 'Optiplex 3240', 'Intel Core i3', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2240.00, 2, 14000.00, 16240.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '22\"', 'None', NULL, 18000.00),
(183, 'Allinone', NULL, '361GB02', '7440', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 3520.00, 2, 22000.00, 25520.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '22\"', 'None', NULL, 25000.00),
(184, 'Allinone', NULL, 'FZNM1H2', '3240', 'Intel Core i3', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '22\"', 'None', NULL, 20000.00),
(185, 'Allinone', NULL, '421GB02', '7470', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 20000.00),
(186, 'Allinone', NULL, '7MMXHB2', '3240', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '23\"', 'None', NULL, 20000.00),
(187, 'Allinone', NULL, '7N0YHB2', '3240', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '23\"', 'None', NULL, 20000.00),
(188, 'Allinone', NULL, 'FZKR1H2', '3240', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '6th Gen', 'None', '23\"', 'None', NULL, 20000.00),
(189, 'Allinone', NULL, '9HZ3JL2', '5250', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '7th Gen', 'None', '23\"', 'None', NULL, 20000.00),
(190, 'Allinone', NULL, '4Z3JR222', '9030', 'Intel Core i5', '8192', '500', '2023-12-30', 'None', NULL, 'None', 2400.00, 2, 15000.00, 17400.00, 'Admin', 'None', 'Dell', '4th Gen', 'None', '23\"', 'None', NULL, 20000.00),
(191, 'Allinone', NULL, '5CLWMK2', '3030OPITEX', 'Intel Core i3', '4096', '500', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '4th Gen', 'None', '12\"', 'None', NULL, 3500.00),
(192, 'Allinone', NULL, '5CN3NK2', '3030OPITEX', 'Intel Core i3', '4096', '500', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '4th Gen', 'None', '12\"', 'None', NULL, 3500.00),
(193, 'Allinone', NULL, '5CX3NK2', '3030OPITEX', 'Intel Core i3', '4096', '500', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '4th Gen', 'None', '12\"', 'None', NULL, 3500.00),
(194, 'Allinone', NULL, '5C74NK2', '3030OPITEX', 'Intel Core i3', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '12\"', 'None', NULL, 3500.00),
(195, 'Monitor', NULL, 'CN0W8VY97426122K1M8U', 'ST2420LD', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '23\"', 'None', NULL, 3500.00),
(196, 'Monitor', NULL, '2TF622009T', 'T310', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 7000.00, 2900.00, 'Admin', 'None', 'hp', '', 'None', '23\"', 'None', NULL, 8000.00),
(197, 'Monitor', NULL, '0166H4MCA10512L', 'S22P35TH', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Samsung', '', 'None', '22\"', 'None', NULL, 3500.00),
(198, 'Monitor', NULL, '3CM3400KD9', 'Pavilion 23F', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 10000.00, 2900.00, 'Admin', 'None', 'hp', '', 'None', '23\"', 'None', NULL, 12000.00),
(199, 'Monitor', NULL, 'AOC', 'AOC', '', '', '', '2023-12-30', 'None', NULL, 'None', 400.00, 2, 2500.00, 2900.00, 'Admin', 'None', 'Dell', '', 'None', '22\"', 'None', NULL, 3500.00),
(200, 'Monitor', NULL, 'CN0YN68N742611B80JCM', 'P2212HP', '', '', '', '2023-12-30', 'None', NULL, 'None', 640.00, 2, 4000.00, 4640.00, 'Admin', 'None', 'Dell', '', 'None', '22\"', 'None', NULL, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `main_mode`
--

CREATE TABLE `main_mode` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_mode`
--

INSERT INTO `main_mode` (`id`, `name`, `created_at`) VALUES
(1, 'M-pesa', '2023-12-30'),
(2, 'Cash', '2023-12-30'),
(3, 'Bank', '2023-12-30'),
(4, 'Credit', '2023-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `main_narations`
--

CREATE TABLE `main_narations` (
  `id` bigint(20) NOT NULL,
  `naration` varchar(200) DEFAULT NULL,
  `date` date NOT NULL,
  `balance` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `order_type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_narations`
--

INSERT INTO `main_narations` (`id`, `naration`, `date`, `balance`, `amount`, `vendor_id`, `status`, `order_type`) VALUES
(1, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(2, 'restock', '2023-12-29', 0, 0, 2, 1, 'Credit'),
(3, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(4, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(5, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(6, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(7, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(8, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(9, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(10, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(11, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(12, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(13, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(14, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(15, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(17, 'restock', '2023-12-29', 0, 0, 2, 1, 'Debit'),
(18, 'restock', '2023-12-30', 0, 0, 2, 1, 'Debit'),
(19, 'restock', '2023-12-30', 0, 0, 2, 1, 'Debit');

-- --------------------------------------------------------

--
-- Table structure for table `main_newcondition`
--

CREATE TABLE `main_newcondition` (
  `id` bigint(20) NOT NULL,
  `conditions` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_newcondition`
--

INSERT INTO `main_newcondition` (`id`, `conditions`, `created_at`) VALUES
(1, 'Used', '2023-12-29'),
(2, 'Refurb', '2023-12-29'),
(3, 'New', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_orders`
--

CREATE TABLE `main_orders` (
  `id` bigint(20) NOT NULL,
  `order_type` varchar(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unique_key` varchar(200) DEFAULT NULL,
  `random` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_orders`
--

INSERT INTO `main_orders` (`id`, `order_type`, `name`, `amount`, `date`, `unique_key`, `random`, `total_amount`) VALUES
(1, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(2, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(3, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(4, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(5, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(6, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(7, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(8, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(9, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(10, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(11, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(12, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(13, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(14, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(15, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(16, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, NULL),
(17, 'Debit', 'Restock', 0, '2023-12-30', NULL, NULL, NULL),
(18, 'Debit', 'Restock', 0, '2023-12-30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_ram`
--

CREATE TABLE `main_ram` (
  `id` bigint(20) NOT NULL,
  `ram` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_ram`
--

INSERT INTO `main_ram` (`id`, `ram`, `created_at`) VALUES
(1, '512', '2023-12-29'),
(2, '1024', '2023-12-29'),
(3, '2048', '2023-12-29'),
(4, '3072', '2023-12-29'),
(5, '4096', '2023-12-29'),
(6, '8192', '2023-12-29'),
(7, '16384', '2023-12-29'),
(8, '32768', '2023-12-29'),
(9, '65536', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_screen`
--

CREATE TABLE `main_screen` (
  `id` bigint(20) NOT NULL,
  `screen` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_screen`
--

INSERT INTO `main_screen` (`id`, `screen`, `created_at`) VALUES
(1, '10\"', '2023-12-29'),
(2, '11\"', '2023-12-29'),
(3, '12\"', '2023-12-29'),
(4, '13\"', '2023-12-29'),
(5, '14\"', '2023-12-29'),
(6, '15\"', '2023-12-29'),
(7, '16\"', '2023-12-29'),
(8, '17\"', '2023-12-29'),
(9, '19\"', '2023-12-29'),
(10, '20\"', '2023-12-29'),
(11, '21\"', '2023-12-29'),
(12, '22\"', '2023-12-29'),
(13, '23\"', '2023-12-29'),
(14, '24\"', '2023-12-29'),
(15, '25\"', '2023-12-29'),
(16, '27\"', '2023-12-29'),
(17, '28\"', '2023-12-29'),
(18, '29\"', '2023-12-29'),
(19, '30\"', '2023-12-29'),
(20, '32\"', '2023-12-29'),
(21, '34\"', '2023-12-29'),
(22, '42\"', '2023-12-29'),
(23, '43', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_speed`
--

CREATE TABLE `main_speed` (
  `id` bigint(20) NOT NULL,
  `speed` varchar(200) DEFAULT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_speed`
--

INSERT INTO `main_speed` (`id`, `speed`, `created_at`) VALUES
(1, '1.0', '2023-12-29'),
(2, '1.2', '2023-12-29'),
(3, '1.6', '2023-12-29'),
(4, '1.8', '2023-12-29'),
(5, '2.0', '2023-12-29'),
(6, '2.1', '2023-12-29'),
(7, '2.2', '2023-12-29'),
(8, '2.3', '2023-12-29'),
(9, '2.4', '2023-12-29'),
(10, '2.5', '2023-12-29'),
(11, '2.6', '2023-12-29'),
(12, '2.7', '2023-12-29'),
(13, '2.8', '2023-12-29'),
(14, '2.9', '2023-12-29'),
(15, '3.0', '2023-12-29'),
(16, '3.2', '2023-12-29'),
(17, '3.4', '2023-12-29'),
(18, '3.6', '2023-12-29'),
(19, '3.5', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_stockout`
--

CREATE TABLE `main_stockout` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `ram` varchar(200) DEFAULT NULL,
  `hdd` varchar(200) DEFAULT NULL,
  `daterecieved` date DEFAULT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `dels` varchar(200) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `bprice` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `terms` varchar(200) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `gen` varchar(200) DEFAULT NULL,
  `speed` varchar(200) DEFAULT NULL,
  `screen` varchar(200) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `datedelivered` date DEFAULT NULL,
  `sprice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_supplierorders`
--

CREATE TABLE `main_supplierorders` (
  `id` bigint(20) NOT NULL,
  `order_type` varchar(10) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unique_key` varchar(200) DEFAULT NULL,
  `random` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_supplierorders`
--

INSERT INTO `main_supplierorders` (`id`, `order_type`, `name`, `amount`, `date`, `unique_key`, `random`, `total_amount`) VALUES
(1, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(2, 'Credit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(3, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(4, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(5, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(6, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(7, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(8, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(9, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(10, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(11, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(12, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(13, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(14, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(15, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(16, 'Debit', 'Restock', 0, '2023-12-29', NULL, NULL, 0),
(17, 'Debit', 'Restock', 128500, '2023-12-30', NULL, NULL, 0),
(18, 'Debit', 'Restock', 201500, '2023-12-30', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `main_temp`
--

CREATE TABLE `main_temp` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `ram` varchar(200) DEFAULT NULL,
  `hdd` varchar(200) DEFAULT NULL,
  `daterecieved` date DEFAULT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `dels` varchar(200) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `bprice` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `terms` varchar(200) DEFAULT NULL,
  `d_type` varchar(200) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `random` varchar(200) DEFAULT NULL,
  `datedelivered` date DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `sprice` decimal(10,2) DEFAULT NULL,
  `screen` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_templist`
--

CREATE TABLE `main_templist` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) DEFAULT NULL,
  `serialno` varchar(200) DEFAULT NULL,
  `model` varchar(200) DEFAULT NULL,
  `cpu` varchar(200) DEFAULT NULL,
  `ram` varchar(200) DEFAULT NULL,
  `hdd` varchar(200) DEFAULT NULL,
  `daterecieved` date DEFAULT NULL,
  `qty` varchar(200) DEFAULT NULL,
  `dels` varchar(200) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `vat` decimal(10,2) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  `bprice` decimal(10,2) DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `terms` varchar(200) DEFAULT NULL,
  `d_type` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `random` varchar(200) DEFAULT NULL,
  `datedelivered` date DEFAULT NULL,
  `brand` varchar(200) DEFAULT NULL,
  `gen` varchar(200) DEFAULT NULL,
  `sprice` decimal(10,2) DEFAULT NULL,
  `screen` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_type`
--

CREATE TABLE `main_type` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_type`
--

INSERT INTO `main_type` (`id`, `type`, `created_at`) VALUES
(1, 'Laptop', '2023-12-29'),
(2, 'Desktop', '2023-12-29'),
(3, 'Allinone', '2023-12-29'),
(4, 'Smartphone', '2023-12-29'),
(5, 'HDD 2.5', '2023-12-29'),
(6, 'HDD 3.5', '2023-12-29'),
(7, 'SSD', '2023-12-29'),
(8, 'Macbook', '2023-12-29'),
(9, 'iMac', '2023-12-29'),
(10, 'Lcd', '2023-12-29'),
(11, 'RAM', '2023-12-29'),
(15, 'Scrap', '2023-12-29'),
(16, 'Discount', '2023-12-29'),
(17, 'OTHERS', '2023-12-29'),
(18, 'Monitor', '2023-12-29'),
(19, 'P.O.S', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `main_vendor`
--

CREATE TABLE `main_vendor` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `user_created_at` varchar(200) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `id_no` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `invono` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_vendor`
--

INSERT INTO `main_vendor` (`id`, `fname`, `lname`, `phone`, `location`, `email`, `user_created_at`, `random`, `username`, `id_no`, `status`, `invono`) VALUES
(2, 'restock', 'restock', '', '', 'restock@restock.com', NULL, NULL, 'Restock', '', NULL, NULL),
(3, 'westhome', 'hub', '', 'Nairobi', 'westhome@gmail.com', NULL, NULL, 'westhome hub', '', NULL, NULL),
(4, 'smartsoft', 'smartsoft', '', 'Nairobi', 'smartsoft@gmail.com', NULL, NULL, 'Smartsoft ', '', NULL, NULL),
(5, 'Adepta ', 'technologies', '', '', 'adepta@gmail.com', NULL, NULL, 'Adepta Technologies', '', NULL, NULL),
(6, 'TT', 'TTGlobal', '', 'Nairobi', 'ttglobal@gmail.com', NULL, NULL, 'TT Global', '', NULL, NULL),
(7, 'Home', 'Stock', '', 'Nairobi', 'homestock@gmail.com', NULL, NULL, 'Home Stock', '', NULL, NULL),
(8, 'ICT ', 'Solutions', '', 'Nairobi', 'ict@solutions.com', NULL, NULL, 'ICT Solutions', '', NULL, NULL),
(9, 'Alcoa', 'Bussiness', '', 'Nairobi', 'alcom@gmail.com', NULL, NULL, 'Alcoa Business ', '', NULL, NULL),
(10, 'amon', 'Services', '', 'Nairobi', 'amon@gmail.com', NULL, NULL, 'Amon Suppliers Services', '', NULL, NULL),
(13, 'KELVIN NGA\'NGA\'', 'nan', '727940410', 'NAIROBI', 'avytechcomputers@gmail.com', ' ', ' ', 'AVYTECH COMPUTERS', '-', ' ', ' '),
(14, '-', 'nan', '0', 'nan', 'ALNAFEACARGO@GMAIL.COM', ' ', ' ', 'AL NAFEA CARGO LTD', '-', ' ', ' '),
(15, 'ABDIKANI ', 'BIRIK', '710777771', 'NAIROBI', 'allinonetechnologylimited@yahoo.com', ' ', ' ', 'ALL IN ONE TECHNOLOGY LTD', '33525858', ' ', ' '),
(16, 'IRUNGU MWANGI', 'nan', '725209271', 'NAIROBI', '', ' ', ' ', 'BEST SELLER ', '23725808', ' ', ' '),
(17, 'FRANCIS ', 'NGUGI ', '722845751', 'NAIROBI', '', ' ', ' ', 'BEST BARGAIN', 'nan', ' ', ' '),
(18, 'ANN NJOKI', 'nan', '725064705', 'nan', '-', ' ', ' ', 'BEST IT HUB', '35045416', ' ', ' '),
(19, 'YVONNE ', 'RESIAN', '0', 'NAIROBI', '', ' ', ' ', 'BEST BUDGET', '32085409', ' ', ' '),
(20, 'GEOFFREY KENYONI ', 'nan', '722242815', 'NAIROBI', '', ' ', ' ', 'BEST BUY', '22569127', ' ', ' '),
(21, 'TONY ', '', '720721761', 'NAIROBI', 'beyuzcomm@gmail.com', ' ', ' ', 'BEYUZ COMMUNICATION ', '23609455', ' ', ' '),
(22, 'PETER MUCHINJU ', 'nan', '722450610', 'NAIROBI', 'bigsmartdeals@gmail.com', ' ', ' ', 'BIGMAN COMPUTERS ', '26161655', ' ', ' '),
(23, 'ALEX ', '', '721291452', 'NAIROBI', '', ' ', ' ', 'BLUEBOX SYSTEMS ', '27722095', ' ', ' '),
(24, 'VICTOR ', 'BOTTO', '722538588', 'NAIROBI', 'info@bovic.co.ke', ' ', ' ', 'BOVIC ELECTRONICS', '24302717', ' ', ' '),
(25, 'MARY ', 'MWEMA ', '728733564', 'NAIROBI', 'brimatventuresltd@gmail.com', ' ', ' ', 'BRIMAT VENTURES ', '23375684', ' ', ' '),
(26, 'BERNARD ', 'nan', '703573274', 'NAIROBI', '', ' ', ' ', 'B-TECH SOLUTION', '32421874', ' ', ' '),
(27, 'JOSEPH ', 'MUNENE', '728248008', 'NAIROBI', '', ' ', ' ', 'BULLS COMPUTER', '24268412', ' ', ' '),
(28, 'MARY ', 'KIMANI', '724201713', 'NAIROBI', 'celinamary36@gmail.com', ' ', ' ', 'BUY MO COMPUTER', '27709097', ' ', ' '),
(29, 'NICOLE ', 'NABWIRWA', '727009690', 'NAIROBI', '', ' ', ' ', 'CAPITAL ICT LTD', '3359332', ' ', ' '),
(30, 'CALEB ', 'OYARO', '737022374', 'NAIROBI', 'caleb@calstechhouse.co.ke', ' ', ' ', 'CALSTECH HOUSE', '27632999', ' ', ' '),
(31, 'MEHUL', 'PATEL', '788999991', 'nan', 'international@cecypo.com', ' ', ' ', 'CECYPO LIMITED ', '258876', ' ', ' '),
(32, 'KEVIN', 'nan', '722664245', 'NAIROBI', 'cssfocus@yahoo.com', ' ', ' ', 'CENTURY SOFT SYSTEM', 'nan', ' ', ' '),
(33, 'STEPHEN ', 'NJUGUNA', '702377277', 'NAIROBI', 'info@cencom.co.ke', ' ', ' ', 'CENTRAL COMPUTER ', '23430256', ' ', ' '),
(34, 'SOFIA ', 'WAITHIRA', '725620206', 'NAIROBI', 'techsofi@gmail.com', ' ', ' ', 'CIANDATECH SUPPLIES LTD ', '24537540', ' ', ' '),
(35, 'JOSEPH ', 'MUTHIGA', '725904426', 'NAIROBI', 'contrivancecolimited@yahoo.com', ' ', ' ', 'CONTRIVANCE LIMITED', '24139940', ' ', ' '),
(36, 'JOHN ', 'KIGUTA', '721551212', 'NAKURU', 'COMLINKSLTD@GMAIL.COM', ' ', ' ', 'COMLINKS INVESTMENTS', 'nan', ' ', ' '),
(37, 'VIKRAM ', 'nan', '0', 'NAIROBI', '', ' ', ' ', 'CLASSIC FOREX', 'nan', ' ', ' '),
(38, 'BRIAN ', 'MUSEE', '721489376', 'NAIROBI', 'brian@computerlinksltd.com', ' ', ' ', 'COMPUTER LINKS DISTRIBUTORS LTD', '23704743', ' ', ' '),
(39, 'IRENE ', 'nan', '722287698', 'NAIROBI', 'info@compnetadvisory.com', ' ', ' ', 'COMPNET TECHNOLOGY ', '22652569', ' ', ' '),
(40, 'LAWRENCE ', 'KITONGA ', '722668751', 'NAIROBI', 'comtrendsc@yahoo.com', ' ', ' ', 'COMTRENDS ENTERPRISES', '22143175', ' ', ' '),
(41, 'JOHN ', 'NJOROGE ', '723156157', 'THIKA', 'nyagz@yahoo.com', ' ', ' ', 'COMPOINT TECHNOLOGIES ', '8633535', ' ', ' '),
(42, 'ABDIKADIR ', 'ABDI OSMAN', '705105000', 'NAIROBI', 'compsytechnology@yahoo.com', ' ', ' ', 'COMPSYS TECHNOLOGY ', '33308786', ' ', ' '),
(43, 'TOM ', 'MUSILI', '722618788', 'nan', '', ' ', ' ', 'COMPUTER FOR SCHOOLS KENYA ', '1698001', ' ', ' '),
(44, 'LYDIA', 'nan', '721770351', 'NAIROBI', '', ' ', ' ', 'COMPUTER GARAGE', '22296269', ' ', ' '),
(45, 'GEORGE ', 'NJOROGE', '727539257', 'NAIROBI', 'info@crediblesystems.co.ke', ' ', ' ', 'CREDIBLE SYSTEMS LTD', '22176301', ' ', ' '),
(46, 'ABRAHAM', 'nan', '722437748', 'NAIROBI', 'info@cic-ke.co.ke', ' ', ' ', 'COOPER ISLAND', '29227845', ' ', ' '),
(47, 'DANIEL ', 'GITAU', '722801359', 'NAIROBI', '', ' ', ' ', 'DANTECH SYSTEMS', '12420893', ' ', ' '),
(48, 'EDWIN', 'nan', '723391572', 'NAIROBI', '', ' ', ' ', 'DEED PC COLLECTIVE', '30171465', ' ', ' '),
(49, 'JAMES ', 'NG\'ANG\'A', '703259513', 'NAIROBI', '', ' ', ' ', 'DEE & GEE ELCTRONICS LTD', '29978362', ' ', ' '),
(50, 'GIDRAF ', 'MUIGAI NGUGI', '720325734', 'NAIROBI', '', ' ', ' ', 'DELLTECH SYSTEMS SOLUTIONS', '23749396', ' ', ' '),
(51, 'NELSON ', 'AJUMBO', '726717359', 'NAIROBI', 'degeostechnology@gmail.com', ' ', ' ', 'DEGEOS TECHNOLOGY', '27663130', ' ', ' '),
(52, 'KORIR', 'nan', '720499767', 'NAIROBI', 'DEMACCOSYSTEMSLTD@GMAIL.COM', ' ', ' ', 'DEMACCO SYSTEMS LTD', '28622592', ' ', ' '),
(53, 'AMOS ', 'KIIGE', '720347198', 'ELDORET', '', ' ', ' ', 'DELACOMP SOLUTION', '22221931', ' ', ' '),
(54, 'nan', 'nan', '0', 'NAIROBI', 'khider.adam@hotmail.com', ' ', ' ', 'DINOS PIZZA LTD', 'nan', ' ', ' '),
(55, 'HEZRON', 'KEVIN', '0', 'NAIROBI', 'INFO@DIGITALALLIANCE.CO.KE', ' ', ' ', 'DIGITAL ALLIANCE LIMITED', '26070457', ' ', ' '),
(56, 'CHRISTOPHER WAMBUA ', 'nan', '720050294', 'nan', 'digitecomputersolutions@gmail.com', ' ', ' ', 'DIGITECH COMPUTER SOLUTIONS', '25337066', ' ', ' '),
(57, 'KOBIMO ', 'nan', '722263200', 'NAIROBI', '', ' ', ' ', 'DIGITAL LOOP ', '7227408', ' ', ' '),
(58, 'WALTER ', 'OKOTH', '722866440', 'NAIROBI', 'info@digitalprecisions.com', ' ', ' ', 'DIGITAL PRECEISION (K) LIMITED', '13605373', ' ', ' '),
(59, 'MAULIK ', 'PATEL ', '734709787', 'NAIROBI', 'MAULIK_80@HOTMAIL.COM', ' ', ' ', 'DIGIX SERVICES ', '2764441', ' ', ' '),
(60, 'SADIA', 'nan', '727341825', 'NAIROBI', 'divinehitech@gmail.com', ' ', ' ', 'DIVINE ITECH ENTERPRISES', '27970120', ' ', ' '),
(61, 'RAHIM ', 'PARKAR', '722300300', 'NAIROBI', 'dixonsoperation@gmail.com', ' ', ' ', 'DIXONS ELECTRONICS', '31606959', ' ', ' '),
(62, 'ERASTUS', 'KIBET', '707120628', 'NAIROBI', 'doubleeelectronics015@gmail.com', ' ', ' ', 'DOUBLE LEE ELECTRONICS ', '29933814', ' ', ' '),
(63, 'ZAKARIA ', 'nan', '721105232', 'nan', 'easypointcomputersltd@gmail.com', ' ', ' ', 'EASY POINT ', '28778888', ' ', ' '),
(64, 'EDISON OSINDE', 'nan', '712891599', 'nan', 'info@editechsolns.co.ke', ' ', ' ', 'EDITECH DIGITAL SOLUTIONS ', '28396831', ' ', ' '),
(65, 'SIMON NJOGU', 'nan', '722254172', 'nan', '-', ' ', ' ', 'EXTRA IT SOLUTIONS', '22768752', ' ', ' '),
(66, 'EDWIN NGANYI', 'nan', '717040531', 'nan', 'ENNGANYI@GMAIL.COM', ' ', ' ', 'ELITE LEGIT SERVICE', '34458114', ' ', ' '),
(67, 'DENNIS ', 'OTIENO ', '713441634', 'NAIROBI', '', ' ', ' ', 'ELECTIKA COMPUTERS ', '28819481', ' ', ' '),
(68, 'CHARLES ', 'MAINA ', '716886215', 'NAIROBI', 'charles@elevatustechnologies.co.ke', ' ', ' ', 'ELEVATUS TECHNOLOGY ', '24712847', ' ', ' '),
(69, 'MERCY', 'nan', '728080444', 'nan', '-', ' ', ' ', 'EPIC TECH ', '25946714', ' ', ' '),
(70, 'JEFF ', 'GATHOGO', '727487326', 'NAIROBI', 'KELVIN@EVERCOMPS.CO.KE', ' ', ' ', 'EVERCOMPS TECHNOLOGY', '28580320', ' ', ' '),
(71, 'ISAAC MWANGI', 'nan', '722385853', 'nan', 'everestcomputersys@gmail.com', ' ', ' ', 'EVEREST COMPUTER SYSTEM', '25692423', ' ', ' '),
(72, 'ABDULL HAJI', 'nan', '722134494', 'nan', 'fareastelectronics2016@gmail.com', ' ', ' ', 'FAR EAST ELECTRONICS LIMITED', '27941078', ' ', ' '),
(73, 'JOSEPH NJOROGE ', 'nan', '722893186', 'nan', 'fgeecomputerslimited@gmail.com', ' ', ' ', 'FGEE COMPUTER ', '22112592', ' ', ' '),
(74, 'MR.MAURICE ODARO', 'nan', '720708467', 'nan', 'sales@fibercom.co.ke', ' ', ' ', 'FIBERCOM TECHNOLOGIES LTD', '22468272', ' ', ' '),
(75, 'MARGRET', '', '724885788', 'NAIROBI', '', ' ', ' ', 'ANGEL TECH', '27413437', ' ', ' '),
(76, 'WILSON WANJAMA', 'nan', '790732244', 'nan', 'info@flytech.co.ke', ' ', ' ', 'FLYTECH ', '29597383', ' ', ' '),
(78, 'GEORGE NJAU', 'nan', '721372492', 'nan', '-', ' ', ' ', 'FRANK TRADERS', '24649311', ' ', ' '),
(79, 'DOMINIC', 'nan', '717421267', 'NAIROBI', 'Dominc@gadgetconnet.com', ' ', ' ', 'GADGET CONNECT', '28401598', ' ', ' '),
(80, 'DAVID  ', 'nan', '727696334', 'NAIROBI', '', ' ', ' ', 'GALWAY COMPUTER', '27900395', ' ', ' '),
(81, 'MWAURA', 'nan', '722794357', 'nan', '-', ' ', ' ', 'GENERATION TECHNOLOGIES LIMITED', 'nan', ' ', ' '),
(82, 'AHMED GESEY', 'nan', '713521126', 'nan', 'gestechlimited@gmail.com', ' ', ' ', 'GESTECH LIMITED', '484801634', ' ', ' '),
(83, 'DENIS CHIIRA', 'nan', '780946399', 'nan', 'computersgic@gmail.com', ' ', ' ', 'GIC COMPUTERS', '30031165', ' ', ' '),
(84, 'PATRICK KIMAINA', 'nan', '720936482', 'nan', '-', ' ', ' ', 'GIGALINK', '22435489', ' ', ' '),
(85, 'PETER GATHENYA', 'nan', '723464410', 'nan', 'gigatechsys@gmail.com', ' ', ' ', 'GIGATECH SYSTEMS', '23429462', ' ', ' '),
(86, 'SAMUEL IMBUCHI', 'nan', '723464410', 'nan', 'gigatech.ke@mail.com', ' ', ' ', 'GIGATECH TECHNOLOGIES', '22142765', ' ', ' '),
(87, 'CORNELIUS NGURE', 'nan', '715984360', 'nan', 'GIGAWARECONCEPTS@GMAIL.COM', ' ', ' ', 'GIGAWARE CINCEOTS LIMITED', '26706703', ' ', ' '),
(88, 'FREDRICK ', 'SAOKE', '712875783', 'KAKAMEGA', 'fredsaoke@gmail.com', ' ', ' ', 'GOFLINKS COMMUNICATIONS', '25376972', ' ', ' '),
(89, 'GEORGE MATHU', 'nan', '720475352', 'nan', '-', ' ', ' ', 'GM ELECTRONICS TANZANIA', '20867626', ' ', ' '),
(90, 'HAFIDH MALIK', 'nan', '729680058', 'nan', 'hafisoftpcsolution@gmail.com', ' ', ' ', 'HAFISOFT PC SOLUTIONS', '26957732', ' ', ' '),
(91, 'ASHA', 'nan', '728011888', 'nan', '-', ' ', ' ', 'HAMZA TECHNOLOGIES', '8052259', ' ', ' '),
(92, 'HASSAN MURIUNGI', 'nan', '722943232', 'nan', '-', ' ', ' ', 'HAMANZI WORLD LINK AGENCY', '24546586', ' ', ' '),
(93, 'PETER', 'nan', '723026474', 'nan', 'HISPECSINNOVATIVESOLUTIONS@GMAIL.COM', ' ', ' ', 'HI-SPECS INNOVATIVE SOLUTIONS LTD', '21995334', ' ', ' '),
(94, 'HAM WESONGA', 'nan', '722877904', 'nan', '-', ' ', ' ', 'HANDYMANNE (K) LTD', '22715514', ' ', ' '),
(95, 'MR.SINGH', 'nan', '735405060', 'nan', '-', ' ', ' ', 'HYDROMATICS', '-', ' ', ' '),
(96, 'ABDIKADIR', 'ISMAIL', '722486168', 'NAIROBI', 'hopelinksytemsltd@yahoo.com', ' ', ' ', 'HOPELINK SYSTEM', '23820845', ' ', ' '),
(97, 'IDRUS HASSAN ', 'nan', '724946696', 'nan', '-', ' ', ' ', 'ICOM COMPUTERS AND ACCESSORIES', '30292706', ' ', ' '),
(98, 'INNOCENT MINDE', 'nan', '721705985', 'nan', 'info@innocentm@iconet.co.ke ', ' ', ' ', 'ICONET SOLUTION LIMITED', '20637547', ' ', ' '),
(99, 'DORIS ANGECHI', 'nan', '721382232', 'nan', '-', ' ', ' ', 'INET COMPUTER ', '23684696', ' ', ' '),
(100, 'JUDY NJERI ', 'nan', '724404826', 'nan', '-', ' ', ' ', 'INTERGLOBAL TECHNOLOGIES ', '23637810', ' ', ' '),
(101, 'TOM ', 'nan', '721880880', 'nan', '-', ' ', ' ', 'INTERWORLD OFFICE SOLUTION ', '14494670', ' ', ' '),
(102, 'LIVINGTONE AMUNGA', 'nan', '702554900', 'nan', '-', ' ', ' ', 'JAYSTONE TECHNOLOGY', '27143765', ' ', ' '),
(103, 'JOHN MWIRIGI', 'nan', '711772935', 'nan', '-', ' ', ' ', 'JOMAIN COMP VILLA LTD', '27622830', ' ', ' '),
(104, 'JONAH KALE', 'nan', '727782805', 'nan', '-', ' ', ' ', 'KALETECH COMPUTERS', '24700415', ' ', ' '),
(105, 'PATRICK ', 'nan', '722953749', 'nan', 'karakimofficeequipment@gmail.com', ' ', ' ', 'KARAKIM OFFICE EQUIPMENT LTS', '23571368', ' ', ' '),
(106, 'AHMED HANAFI', 'nan', '724518924', 'nan', 'kanalelectronics2030@gmail.com', ' ', ' ', 'KANAL ELECTRONICS LTD', '33573937', ' ', ' '),
(108, 'JOHN TITUS', 'nan', '721334089', 'nan', '-', ' ', ' ', 'KISUMU ICT SOLUTIONS', '22218212', ' ', ' '),
(109, 'MR.MARTIN KAMAU', 'nan', '727003622', 'nan', '-', ' ', ' ', 'KINDMART ENTERPRISES', '28129100', ' ', ' '),
(110, 'VERONICA WANGARI', 'nan', '726513096', 'nan', '-', ' ', ' ', 'KINGS PAPER WORKS', '28079999', ' ', ' '),
(111, 'KENNEDY MUCHIRI', 'nan', '706341411', 'nan', '-', ' ', ' ', 'KMAX SOLUTION ', '30028289', ' ', ' '),
(113, 'NAAMAN ANJICHI', 'nan', '798300001', 'nan', '-', ' ', ' ', 'LANTECH TECHNOLOGIES', '30444652', ' ', ' '),
(114, 'MAHMUD', 'nan', '728979871', 'NAIROBI', '', ' ', ' ', 'LASTECH LIMITED', '32439302', ' ', ' '),
(115, 'JOSEPHINE', 'NJERI', '721524219', 'NAIROBI', 'SALES@LANTECHCOMPS.COM', ' ', ' ', 'LANTECHNICS COMPUTERS', '20364835', ' ', ' '),
(116, 'DICKSON MWAURA', 'nan', '722898439', 'nan', 'leverageenterprises1@gmail.com', ' ', ' ', 'LEVERAGE ENTERPRISES', '13099688', ' ', ' '),
(117, 'MR.SINGH', 'nan', '73540560', 'nan', 'LEDMATIXLTD@GMAIL.COM', ' ', ' ', 'LEDMATIX LIMITED', 'nan', ' ', ' '),
(118, 'HASSAN ', 'nan', '707122637', 'nan', '-', ' ', ' ', 'LIBAAN COMPUTERS ', '31085260', ' ', ' '),
(119, 'HASSAN MOHAMMED ', 'nan', '726930252', 'nan', 'LIBAANITLINKSERVICES@GMAIL.COM', ' ', ' ', 'LIBAAN IT LINK ', '31085260', ' ', ' '),
(120, 'MACHARIA PATRICK', 'nan', '723280521', 'nan', '-', ' ', ' ', 'LIGHTWAVE COMPUTERS', '11396642', ' ', ' '),
(121, 'MR.MICHAEL ONYANGO ', 'nan', '722178138', 'nan', '-', ' ', ' ', 'LINK TECH COMPUTER SOLUTION', '20308124', ' ', ' '),
(122, 'MR.DUNCAN NGUGI', 'nan', '721892680', 'nan', 'litepriceelectonics@gmail.com', ' ', ' ', 'LITE PRICE ELECTRONICS LIMITED', '22756648', ' ', ' '),
(123, 'JOSEPHINE ', 'nan', '721524219', 'nan', 'nan', ' ', ' ', 'LIFEWAYS INVESTMENTS', '20364995', ' ', ' '),
(124, 'GEORGE MUTHOKI', 'nan', '729051500', 'nan', '-', ' ', ' ', 'LIMPID SOLUTIONS', '26682832', ' ', ' '),
(125, 'PAULINE WAMBUI', 'nan', '725099543', 'nan', 'lintech_@gmail.com', ' ', ' ', 'LINTECH SMART SOLUTIONS', '27298249', ' ', ' '),
(126, 'CAROLINE BAHATI', 'nan', '727991965', 'nan', '-', ' ', ' ', 'LINNS TECH ', '29751511', ' ', ' '),
(127, 'JAMES WANJOHI', 'nan', '723518401', 'nan', 'lincplatinum@gmail.com', ' ', ' ', 'LINCON PLATINUM COMPUTERS', '25159470', ' ', ' '),
(128, 'KIPNGETICH ', 'NGENO', '720629970', 'KERICHO', 'LILANCOMPUTERSLIMITED@GMAIL.COM', ' ', ' ', 'LILAN COMPUTERS LIMITED', '23654794', ' ', ' '),
(129, 'GIDEON KIPROTICH', 'nan', '710810310', 'nan', '-', ' ', ' ', 'LUCKYMAN ENTERPRISES', '14599784', ' ', ' '),
(130, 'CAZENTER LUKALALA', 'nan', '722326537', 'nan', '-', ' ', ' ', 'LUKSWARE TECHNOLOGIES & TRADING COMPANY LTD', '-', ' ', ' '),
(131, 'JOHN ACHARIA', 'nan', '720421575', 'nan', '-', ' ', ' ', 'MACHA TECH ', '22264707', ' ', ' '),
(132, 'FRANCIS MUIGAI ', 'nan', '721543716', 'nan', 'mafraqent@gmail.com', ' ', ' ', 'MAFRAQ ENTERPRISES LIMITED ', '14572546', ' ', ' '),
(133, 'MARGRET', 'nan', '721308538', 'nan', '-', ' ', ' ', 'MARVEL AFRICA', '37354962', ' ', ' '),
(134, 'PAUL WANJAU', 'nan', '721763735', 'nan', '-', ' ', ' ', 'MARKSONIC SYSTEMS LIMITED', '22997687', ' ', ' '),
(135, 'NJOROGE ', 'nan', '721671700', 'nan', 'marksonicltd@gmail.com', ' ', ' ', 'MARKSONIC COMPUTER ', '22515900', ' ', ' '),
(136, 'PHILIP ', 'RUTTOH', '712209422', 'nan', 'mcphilipsdigital@gmail.com', ' ', ' ', 'MCPHILIPS DIGITAL ', '27072485', ' ', ' '),
(137, 'PAULINE ', 'nan', '722642617', 'nan', '-', ' ', ' ', 'MICROCARE COMPUTERS  ', '20380474', ' ', ' '),
(138, 'VANITA ', 'nan', '722528234', 'nan', '-', ' ', ' ', 'MICROCITY (K) LIMITED ', '10135858', ' ', ' '),
(139, 'LILIAN WANJAMA', 'nan', '722236086', 'nan', 'MICROSEMILTD@GMAIL.COM', ' ', ' ', 'MICROSEMI SUPPLIES LIMITED', '22670999', ' ', ' '),
(140, 'FAZLE ABBAS ', 'nan', '733794707', 'nan', 'fazle@mit.co.ke', ' ', ' ', 'MICROSKILLS INFO TECH ', '213602', ' ', ' '),
(141, 'SAMEER RAJAN ', 'nan', '729000029', 'nan', '-', ' ', ' ', 'MICROTECH IT SOLUTION', '30972969', ' ', ' '),
(142, 'MICHAEL ', 'nan', '721628545', 'nan', '-', ' ', ' ', 'MICTOUCH TECHNOLOGY ', '25373572', ' ', ' '),
(143, 'AHMED MAALIM', 'nan', '720833383', 'nan', '-', ' ', ' ', 'MIAMI LINK SOLUTIONS LTD', '29723794', ' ', ' '),
(144, 'BETTI', 'nan', '716726901', 'nan', 'mogansupplies@yahoo.com', ' ', ' ', 'MOGAN SUPPLIES', '27722094', ' ', ' '),
(145, 'IAN KIPKEMOI', 'nan', '792444700', 'nan', 'mobilehubkenya@gmail.com', ' ', ' ', 'MOBILE HUB KENYA TECHNOLOGIES LIMITED', '31558686', ' ', ' '),
(146, 'MOHAMMED', 'nan', '722394469', 'nan', '-', ' ', ' ', 'MOHJA BUSINESS ', '13699275', ' ', ' '),
(147, 'BERNARD ', 'nan', '715804139', 'nan', '-', ' ', ' ', 'MOMBASA COMPUTER ', '29758656', ' ', ' '),
(148, 'BENSON KAMAU ', 'nan', '722761654', 'nan', '-', ' ', ' ', 'MONETS SYSTEMS LTD', '21561969', ' ', ' '),
(149, 'SAM', 'nan', '721957976', 'nan', '-', ' ', ' ', 'MOON TECH ', '14686410', ' ', ' '),
(150, 'AMOS MWANGI ', 'nan', '724552646', 'nan', '-', ' ', ' ', 'MOON TECH TWO ', '24020525', ' ', ' '),
(151, 'PETER KAGIA ', 'nan', '715719413', 'nan', '-', ' ', ' ', 'MOONLIGHT TECHNOLOGIES ', '29365565', ' ', ' '),
(152, 'MICHAEL MWAURA ', 'nan', '720403222', 'nan', 'msafiri@msafirionline.com', ' ', ' ', 'MSAFIRI ONLINE LIMITED', '22215261', ' ', ' '),
(153, 'ANTHONY MWANGI', 'nan', '703451012', 'nan', '-', ' ', ' ', 'MTECH NETWORKS LTD', '28647106', ' ', ' '),
(154, 'MOHAMUD MOHAMMED ', 'nan', '708126699', 'nan', '-', ' ', ' ', 'MTVS ELECTRONICS ', '27351109', ' ', ' '),
(155, 'JAMES WAHOME', 'nan', '0727925772', 'nan', 'nephicglobal@gmail.com', ' ', ' ', 'NEPHIC GLOBAL AGENCIES', '24901610', ' ', ' '),
(156, 'ELIZABETH WANJIKU', 'nan', '794814381', 'nan', '-', ' ', ' ', 'NAIROBI COMPUTER ', '26976931', ' ', ' '),
(157, 'MOSES MUGWIMI NGURU ', 'nan', '724139588', 'nan', '-', ' ', ' ', 'NAIROBI COMPUTER SHOP', '25509322', ' ', ' '),
(158, 'JOSIAH NICHOLAS', 'nan', '0', 'nan', 'nimbatechnologies@gmaill.com', ' ', ' ', 'NIMBA TECHNOLOGIES LTD', '23896861', ' ', ' '),
(159, 'SULEIMAN ABDULLAHI', 'nan', '707655555', 'nan', 'netcomdata@gmail.com', ' ', ' ', 'NETCOM DATA SOLUTIONS ', 'nan', ' ', ' '),
(160, 'JOSEPH ', 'NJOROGE ', '721276946', 'KITALE', '', ' ', ' ', 'NASHOTECH SYSTEMS ', '-', ' ', ' '),
(161, 'NEMWEL', 'nan', '725513518', 'nan', '-', ' ', ' ', 'NEMTECH COMPUTERS', '28484622', ' ', ' '),
(162, 'PETER', 'nan', '723630631', 'NAIROBI', 'TAX.ONETECHCOMPS@YAHOO.COM', ' ', ' ', 'ONETECH COMPUTERS LIMITED', '22729614', ' ', ' '),
(163, 'KENNEDY NTHIGA', 'nan', '724321216', 'nan', 'orifonltd@gmail.com', ' ', ' ', 'ORIFON LIMITED', '24746228', ' ', ' '),
(164, 'ROBERT WAITHAKA KAMA', 'nan', '725894934', 'nan', '-', ' ', ' ', 'ONLINE COMPUTER MALL', '24698039', ' ', ' '),
(165, 'MIRE ALI', 'nan', '722520907', 'nan', '-', ' ', ' ', 'OMAN ELECTRONICS', '5408604', ' ', ' '),
(166, 'BENSON ', 'MIRICHO', '726108644', '', '', ' ', ' ', 'PAVILLION TECHNLOGY', '2364947', ' ', ' '),
(167, 'SHAGUFTA DATOO ', 'nan', '719213665', 'nan', 'HUSEIN@PALLADIUMELECTRONICS.CO.KE', ' ', ' ', 'PALLADIUM ELECTRONICS ', '100937744', ' ', ' '),
(168, 'LYDIA MUTHEU MWANIA', 'nan', '728871588', 'nan', '-', ' ', ' ', 'PC 2 GO LIMITED', '29046032', ' ', ' '),
(169, 'PHILEMON ', 'KIPKOECH ', '720499767', '', 'PHTORENT@GMAIL.COM', ' ', ' ', 'PHTORRENTS TEHNOLOGIES LTD', '28622592', ' ', ' '),
(170, 'MR.CHARLES NJUGUNA', 'nan', '725334828', 'nan', '-', ' ', ' ', 'PHOTON QUEST TECHNOLOGIES ', '24996184', ' ', ' '),
(171, 'LUCAS ABWENJE', 'nan', '724338108', 'nan', '-', ' ', ' ', 'PISHAVILLA INVESTMENT', '25110229', ' ', ' '),
(172, 'UJJWAL RAWAL', 'nan', '731555574', 'nan', 'info@pragatenterprises.com', ' ', ' ', 'PRAGAT ENTERPISES', 'nan', ' ', ' '),
(173, 'EDWARD', 'nan', '727061728', 'nan', 'qoceptscape@gmail.com', ' ', ' ', 'QOCEPT SCAPE LIMITED', '3031983', ' ', ' '),
(174, 'JAMES KINUTHIA ', 'nan', '722912721', 'nan', 'rexsupplies@gmail.com', ' ', ' ', 'REX SOLUTION ', '22180284', ' ', ' '),
(175, 'MR.ROBERT MWANGI ', 'nan', '724481212', 'nan', 'rewardcomps@gmail.com', ' ', ' ', 'REWARD COMPUTERS', '11613752', ' ', ' '),
(176, 'MOHAMED OMAR HASSAN', 'nan', '721292754', 'nan', '-', ' ', ' ', 'RIHAM TECHNOLOGY', '28030739', ' ', ' '),
(177, 'ROY NGUGI', 'nan', '722637296', 'nan', '-', ' ', ' ', 'ROBOTRONICS DIGITAL ', '24168175', ' ', ' '),
(178, 'SAMUEL', ' NGUGI KAMAU ', '722304510', '', '', ' ', ' ', 'ROHAN TECHNOLOGY', '21967586', ' ', ' '),
(179, 'RONALD ', 'nan', '700301269', 'nan', 'rondamotechnologies@gmail.com', ' ', ' ', 'RONDAMO TECHNOLOGIES', '27604366', ' ', ' '),
(180, 'KENNEDY KIPRONO KIGE', 'nan', '724404935', 'nan', '-', ' ', ' ', 'ROYAL TECH ', '31406404', ' ', ' '),
(181, 'DERRICK RONO ', 'nan', '729417694', 'nan', 'info@sarukdigital.co.ke', ' ', ' ', 'SARUK DIGITAL ', '26674543', ' ', ' '),
(182, 'BHAVIK SHAH', 'nan', '724599578', 'nan', '-', ' ', ' ', 'SHAH TECHNOLOGY', '35451954', ' ', ' '),
(183, 'ABDIFATAH HUSSEIN ', 'nan', '722916786', 'nan', '-', ' ', ' ', 'SILVERLAKE ELECRONICS LTD', '29705658', ' ', ' '),
(184, 'HENRY ', 'nan', '725604549', 'nan', 'sales@skyheight.co.ke', ' ', ' ', 'SKYHEIGHT TECHNOLOGIES ', '25512184', ' ', ' '),
(185, 'OMAR', 'nan', '726949494', 'nan', '-', ' ', ' ', 'SMART SOFT TECHNOLOGIES', '21029995', ' ', ' '),
(186, 'FELIX KIMUTAI', 'nan', '704045391', 'nan', '-', ' ', ' ', 'SOMETHING TECHNOLOGIES', '31859910', ' ', ' '),
(187, 'MAHIRA ', 'JABEEN ', '703826691', '', 'sales@speedtechafricom.com', ' ', ' ', 'SPEEDTECH AFRICA ', '25016452', ' ', ' '),
(188, 'NAOMI ', 'MBURU ', '722761617', 'NAIROBI', '', ' ', ' ', 'STALLION SYSTEMS ', '8989201', ' ', ' '),
(189, 'ANTONY OKOTH', 'nan', '720384084', 'nan', 'starcomss@yahoo.co.ke', ' ', ' ', 'STARCOM SYSTEM SOLUTIONS LTD', '9222735', ' ', ' '),
(190, 'MOHAMMED ', 'nan', '724850005', 'nan', '-', ' ', ' ', 'START-UP COMPUTER ', '34429536', ' ', ' '),
(191, 'STANSCILUS KOMU', 'nan', '727455855', 'nan', '-', ' ', ' ', 'STANLEE TECHNOLOGIES', '26558541', ' ', ' '),
(192, 'STEVEN ', 'nan', '722435600', 'nan', '-', ' ', ' ', 'STEWAN COMPUTERS ', '11250897', ' ', ' '),
(193, 'ANTONY ', 'KIMANI', '721116777', '', '', ' ', ' ', 'SUMMIT MOBILE LTD', '25159656', ' ', ' '),
(194, 'SHAIKH ABUBAKAR', 'nan', '708777941', 'nan', '-', ' ', ' ', 'STARFOX TECHNOLOGY', '856528', ' ', ' '),
(195, 'GEORGE MWENDWA ', 'nan', '704164320', 'nan', '-', ' ', ' ', 'SUPREME KENYA LIMITED', '29436677', ' ', ' '),
(196, 'MR.MARTIN ', 'nan', '725631358', 'nan', 'info@spootechsuplliers.co.ke', ' ', ' ', 'SPOTTECH SUPPLIERS', '23844124', ' ', ' '),
(197, 'CHARITY WAMUGO THUO', 'nan', '724215711', 'nan', '-', ' ', ' ', 'SPACE AGE TECHNOLOGIES', '222145741', ' ', ' '),
(198, 'DANSON MUTINDA', 'nan', '721669098', 'nan', 'info@tarakilishisolutions.com', ' ', ' ', 'TARAKILISHI SOLUTIONS LTD', '23680529', ' ', ' '),
(199, 'SIMON ', 'nan', '720035553', 'nan', '-', ' ', ' ', 'TAITANICOM SYSTEMS ', '25704835', ' ', ' '),
(200, 'MOHAMMED ALI ', 'nan', '711888364', 'nan', '-', ' ', ' ', 'TAYCOM ELECTRONICS LIMITED', '10349784', ' ', ' '),
(201, 'MR.PATRICK', 'nan', '721784767', 'nan', '-', ' ', ' ', 'TECHBUYZ TECHNOLOGY LIMITED', '22661664', ' ', ' '),
(202, 'nan', 'nan', '0', 'nan', 'INFO@TECHNOHUBDIGITALSOLUTIONS.CO.KE', ' ', ' ', 'TECHNOHUB DIGITAL SOLUTIONS LIMITED', 'nan', ' ', ' '),
(203, 'SHADRACK', ' OTIENO ', '721154253', 'KISUMU', '', ' ', ' ', 'TECHNO BROTHERS ENTERPRISES ', '24244284', ' ', ' '),
(204, 'PAUL KARANJA', 'nan', '722988550', 'nan', '-', ' ', ' ', 'TERRITORIES TECHNOLOGIES LTD', '11773827', ' ', ' '),
(205, 'JOHN ', 'MULEE', '728217571', '', '', ' ', ' ', 'ALMATECHSAVY SOLUTION', '27905057', ' ', ' '),
(206, 'STEVEN ', 'nan', '736769669', 'nan', '-', ' ', ' ', 'TEXAS ENGINEERING ', '14400341', ' ', ' '),
(207, 'NAHASHON MUCHAI ', 'nan', '721475574', 'nan', 'nan', ' ', ' ', 'TOSHIBA MAX LTD ', '-', ' ', ' '),
(208, 'JOHN KAMAU', 'nan', '729604404', 'nan', 'trekstarenterprises@gmail.com', ' ', ' ', 'TREKSTAR ENTERPRISES', '30264268', ' ', ' '),
(209, 'PATRICK ', '', '721472959', 'MOMBASA', '', ' ', ' ', 'GRAND COMPUTER STORE LTD', '24434756', ' ', ' '),
(210, 'HUSSEIN ', 'nan', '721779736', 'nan', '-', ' ', ' ', 'UTUMISHI ELECTRONICS ', '33292701', ' ', ' '),
(211, 'POLLYNE ', 'MBUGUA', '722642617', '', 'sale@microcare.co.ke', ' ', ' ', 'UNITED MICRO-CARE SYSTEMS LTD', '', ' ', ' '),
(212, 'NIMISHA JAYANTILAL', 'nan', '736867041', 'nan', '-', ' ', ' ', 'UNIVERSAL TECHNOLOGIES LIMITED', '21500565', ' ', ' '),
(213, 'MARTIN CHERUIYOT', 'nan', '721239556', 'nan', 'VENICEACOUSTICSKENYA@GMAIL.COM', ' ', ' ', 'VENICE ACOUSTICS LIMITED', '23482815', ' ', ' '),
(214, 'ABUBAKAR ', 'nan', '729167172', 'nan', '-', ' ', ' ', 'VALUENET TECHNOLOGIES ', '23964932', ' ', ' '),
(215, 'MR.WAMBUA MUTUNGWA', 'nan', '720764076', 'nan', 'wavenetcs@gmail.com ', ' ', ' ', 'WAVENET COMPUTER', '21903057', ' ', ' '),
(216, 'JOSEPH', 'nan', '726817035', 'nan', '-', ' ', ' ', 'WISELINK', '27267433', ' ', ' '),
(217, 'BIBIANA WANJIRU', 'nan', '722404048', 'nan', 'bngotho@wondertechnologies.co.ke', ' ', ' ', 'WONDER TECHNOLOGIES LTD', '11250277', ' ', ' '),
(218, 'JOHN ', 'nan', '722777787', 'nan', 'jm@wodex.co.ke', ' ', ' ', 'WODEX TECHNOLOGIES ', '11254054', ' ', ' '),
(219, 'WILSON ', 'MBECHE', '716297960', '', '', ' ', ' ', 'WYMORE IT SOLUTIONS', '31845712', ' ', ' '),
(220, 'AUGUSTIN ', 'nan', '721420096', 'NAIROBI', 'info@yellowappletechnologies.co.ke', ' ', ' ', 'YELLOW APPLE TECHNOLOGIES ', '24532276', ' ', ' '),
(221, 'JOE MUTHIGA ', 'nan', '724904426', 'nan', '-', ' ', ' ', 'ZILAFRIC LIMITED', '24139940', ' ', ' '),
(222, 'GODFREY ', 'MWANGI', '714565180', '', 'zurisoln@gmail.com', ' ', ' ', 'ZURI DIGITAL SOLUTIONS', 'nan', ' ', ' '),
(223, 'AHMED HAJI', 'nan', '743984154', 'nan', 'ZAKHIRLIMITED@GMAIL.COM', ' ', ' ', 'ZAKHIR LIMITED', 'nan', ' ', ' '),
(224, 'SOLOMON', 'GACHUGU', '721698119', 'NAKURU', '', ' ', ' ', 'DATACOM SYSTEMS', 'nan', ' ', ' '),
(226, 'ERICK', 'OMONDI', '710239697', 'MOMBASA', 'nan', ' ', ' ', 'AREEDO COMPUTERS', '28170566', ' ', ' '),
(227, 'Joseph', 'Muthama', '720970484', 'NAIROBI', 'info@chipsetcomputersystems.co.ke', ' ', ' ', 'CHIPSET COMPUTERS', '25151178', ' ', ' '),
(228, 'HANNAH', 'MUTHONI', '723372418', 'NAIROBI', '', ' ', ' ', 'BENHAN COMPUTERS', 'nan', ' ', ' '),
(229, 'DAN ', 'ODHIAMBO', '727523040', 'KISUMU', '', ' ', ' ', 'BRITCOM TECHNOLOGY', 'nan', ' ', ' '),
(230, 'Sekangi ', 'Ventures', '713404932', 'nan', 'nan', ' ', ' ', 'SEKANGI INTERNATIONAL LTD', 'nan', ' ', ' '),
(231, 'RUDI', '', '0720336197', 'KISUMU', '', ' ', ' ', 'BRIGHT STAR', 'nan', ' ', ' '),
(232, 'STELLA', '', '0723741839', 'Eldoret', '', ' ', ' ', 'MASTER TECH', 'nan', ' ', ' '),
(233, 'VICTOR', '', '0710681533', 'MERU', '', ' ', ' ', 'VEDIT NETWORKS', 'nan', ' ', ' '),
(234, 'JOSHUA', 'KORIR', '0721773236', 'ELDORET', '', ' ', ' ', 'LINCOM ELECTRONICS', 'nan', ' ', ' '),
(235, 'TRUSHIT', 'DEVI', '0721301631', 'NAKURU', '', ' ', ' ', 'DEVISTATIONERS', '', ' ', ' '),
(236, 'KILIFF', 'COMPUTERS', '0', 'nan', 'nan', ' ', ' ', 'KILIFFCOM COMPUTERS', 'nan', ' ', ' '),
(237, 'LINCET', 'COMPUTERS', '0', 'nan', 'nan', ' ', ' ', 'LINCET COMPUTERS', 'nan', ' ', ' '),
(238, 'HARGY ', '', '0798540769', 'MOMBASA', '', ' ', ' ', 'HARGY TECHNOLOGY', 'nan', ' ', ' '),
(239, 'ALVIC', 'COMPUTERS', '0790933811', 'ELDORET', 'alvic@test.com', ' ', ' ', 'ALVIC COMPUTERS', 'nan', ' ', ' '),
(240, 'RASAMA ', 'COMPUTERS', '0722263205', 'KAKAMEGA', '', ' ', ' ', 'RASAMA COMPUTERS', 'nan', ' ', ' '),
(241, 'MAURICE', 'ODARO', '0720708467', 'ELDORET', '', ' ', ' ', 'FIRECOM COMPUTERS', 'nan', ' ', ' '),
(243, 'JAMES', 'KAGEMA', '721548355', 'NAIROBI', 'nan', ' ', ' ', 'SMARTSOL TECHNOLOGIES', '23132335', ' ', ' '),
(244, 'SAMAR', 'TECH', '0', 'nan', 'nan', ' ', ' ', 'SAMARTECH COMP SOLUTIONS', 'nan', ' ', ' '),
(245, 'JAMES', '', '0722868851', 'NAIROBI', '', ' ', ' ', 'GOOD SHEPHERED COMPUTERS', 'nan', ' ', ' '),
(246, 'WINKELL', 'TECHNOLOGY', '0', 'NAIROBI', 'nan', ' ', ' ', 'WINKELL TECHNOLOGY', 'nan', ' ', ' '),
(247, 'ABBAS', 'NEW GEN', '0', 'NAIROBI', 'nan', ' ', ' ', 'NEW GEN COMPUTERS', 'nan', ' ', ' '),
(248, 'SOLOMON', 'SOLONGO', '722441772', 'NAIROBI', 'nan', ' ', ' ', 'SMARTLAN COMPUTERS', 'nan', ' ', ' '),
(249, 'BECKY', 'CHESIRE', '717555303', 'JAMIA MALL NAIROBI', 'nan', ' ', ' ', 'LISH COMMUNICATION', '11766277', ' ', ' '),
(250, 'BISNNU', '', '707493888', 'NAIROBI', '', ' ', ' ', 'CLOUD DISTRIBUTORS', 'nan', ' ', ' '),
(251, 'Kevin', 'Odera', '722664245', 'KISUMU ', '', ' ', ' ', 'KEVIN ODERA', 'nan', ' ', ' '),
(252, 'Dennis Augistine', 'Onyango', '722978540', 'Kilimani Nairobi', 'onyangofxmail@gmail.com', ' ', ' ', 'Dennis A. Onyango', '22298783', ' ', ' '),
(253, 'EVANS', 'KIMUTAI', '723909065', 'NAIROBI', 'evanskimutai38@gmail.com', ' ', ' ', 'MESHEV TECHNOLOGIES', '29679185', ' ', ' '),
(254, 'JOHN KAMAU', 'KARANJA', '715516421', 'MOI AVENUE NAIROBI', 'info@computexitsolutions.com', ' ', ' ', 'COMPUTEX IT SOLUTIONS', '28062303', ' ', ' '),
(255, 'SELINE', 'KIMANI', '721167395', 'NAIROBI', 'selinegitau@gmail.com', ' ', ' ', 'COMPUTER FOR RESALE', '23525075', ' ', ' '),
(256, 'Steve', 'Otieno', '722957632', 'NAIROBI WEST', 'info@otleo.ke', ' ', ' ', 'OTLEO ENTERPRISES', '21801721', ' ', ' '),
(257, 'Samuel', 'Omondi', '733272270', 'Kileleshwa Nairobi', 'fourthright@gmail.com', ' ', ' ', 'FOURTHRIGHT TECHONOLOGIES LIMITED', '21429927', ' ', ' '),
(258, 'Janet', 'Rono', '722892412', 'NAIROBI', 'info@innovativecomputers.co.ke', ' ', ' ', 'INNOVATIVE COMPUTERS', '20673372', ' ', ' '),
(259, 'SIMON KAMAU', 'NJOROGE', '729699612', 'TOM MBOYA STREET', 'ritesenterprises@gmail.com', ' ', ' ', 'RITES ENTERPRISES', '27135220', ' ', ' '),
(260, 'KEN', 'RONO', '721296360', 'NAKURU', 'info@emergingcomputers.com', ' ', ' ', 'EMERGING COMPUTERS', '20673372', ' ', ' '),
(261, 'nan', 'nan', '720277999', 'NAIROBI', 'nan', ' ', ' ', 'HIKVISION', 'nan', ' ', ' '),
(262, 'SURESH', 'PARMAR', '722524888', 'WESTLANDS', 'suresh@aoneafrica.com', ' ', ' ', 'ADVANCEONE', '1684856', ' ', ' '),
(263, 'ELIAS', 'MUREITHI', '722339113', 'NAIROBI', 'enryqm@gmail.com', ' ', ' ', 'APPLE PRODUCTS', '25115451', ' ', ' '),
(264, 'BERNARD ', 'GICHIA', '722805895', 'NAIROBI', 'bernard@gitech.co.ke', ' ', ' ', 'GITECH COMPUTER SYSTEMS', '10895975', ' ', ' '),
(265, 'RAVINDRA', 'KUMAR', '742407938', 'NAIROBI', 'techatfirstcall@gmail.com', ' ', ' ', 'FIRSTCALL TECHNOLOGY', '10203695', ' ', ' '),
(266, 'XINHUI', 'WEI', '799008123', 'NAIROBI', '370530415@QQ.COM', ' ', ' ', 'HI FASHION TRADE', 'A10041020', ' ', ' '),
(267, 'BONFACE', 'KURIA', '711258051', 'NAIROBI', 'techovantsolutions@gmail.com', ' ', ' ', 'TECHOVANT', '28472592', ' ', ' '),
(268, 'CATHERINE', 'WAITHERU', '700140616', 'NAIROBI', 'info@shekamitechnologies.co.ke', ' ', ' ', 'SHEKAMI TECHNOLOGIES LTD', '29734448', ' ', ' '),
(269, 'COLLINS', 'NGUGI', '727623795', 'NAIROBI', 'collinsngugi2010@gmail.com', ' ', ' ', 'MEGAN COMPUTER', '25135123', ' ', ' '),
(270, 'MR BADAL ', 'PATEL', '720131414', 'NAIROBI', 'maxproltdkenya@gmail.com', ' ', ' ', 'MAXPRO LTD', '36930219', ' ', ' '),
(271, 'ERICK', 'MWENDA', '792758560', 'NAIROBI', 'smartcomputerske626@gmail.com', ' ', ' ', 'SMARTCOMPUTERSKE TECHNOLOGIES', '33695214', ' ', ' '),
(272, 'CHACHA', 'MAROA', '706821486', 'NAIROBI', 'cmaroa24@gmail.com', ' ', ' ', 'BOONS COMPUTER', '35785162', ' ', ' '),
(273, 'EDWARD', 'NJENGA', '734139465', 'KABETE', 'monjotronic@outlook.com', ' ', ' ', 'MONJOTRONIC SOLUTIONS', '30423680', ' ', ' '),
(274, 'MOHAMMED', 'HUSSEIN', '723066333', 'NAIROBI', 'worldtechjamia@gmail.com', ' ', ' ', 'WORLD TECH', '25871676', ' ', ' '),
(275, 'SIMON', 'BARONGO', '702782158', 'KISII', 'simo88811@gmail.com', ' ', ' ', 'MACHANAM LTD', '24609491', ' ', ' '),
(276, 'ANTHONY', 'GATIMU', '716171375', 'NAIROBI-PIONEER HOUS', 'gathimu.anthony@gmail.com', ' ', ' ', 'TOP SILICON SYSTEMS', '27983531', ' ', ' '),
(277, 'ABDIRASHID', 'ELMI', '722999773', 'NAIROBI-TRUST BUILDI', 'abdirashidelmi2020@gmail.com', ' ', ' ', 'RAASHCOM', '35898206', ' ', ' '),
(278, 'ESTHER', 'KAMAKYA', '721884102', 'NAIROBI', 'essykamakya@gmail.com', ' ', ' ', 'TRONOMY', '23844727', ' ', ' '),
(279, 'PRABHDIT', 'SINGH', '768168448', 'NAIROBI', 'prabhditsagoo.ps@gmail.com', ' ', ' ', 'KENYA HYDRAULICS LTD', '40522017', ' ', ' '),
(280, 'ANTHONY', 'MAINA', '720008174', 'NAIROBI', 'info@mactechshop.co.ke', ' ', ' ', 'MAC TECH', '26808878', ' ', ' '),
(281, 'PAUL', 'MBUGUA', '720615045', 'NAIROBI', 'flashworldcoms@gmail.com', ' ', ' ', 'FLASHWORLD ENTERPRISES LTD', '23538884', ' ', ' '),
(282, 'NAURI', 'MWEI', '720577723', 'NAIROBI', 'naurimwei@gmail.com', ' ', ' ', 'RENATA DIGITAL SERVICES', '26465361', ' ', ' '),
(283, 'DENNIS', 'OMITO', '720314757', 'KAREN', 'omito@eofisi.com', ' ', ' ', 'DENNIS OMITO', '22558532', ' ', ' '),
(284, 'YUSUF', 'SHABBIR', '736000688', 'NAIROBI', 'yusuf@marjaancomputers.com', ' ', ' ', 'MARJAN COMPUTER', '28307920', ' ', ' '),
(285, 'JACQUIE', 'WAKINI', '734669599', 'NAIROBI', 'info@digitonia.co.ke', ' ', ' ', 'DIGITONIA SYSTEMS', '22543717', ' ', ' '),
(286, 'ISSAQ', 'nan', '720337673', 'NAIROBI', '', ' ', ' ', 'COMPUTERPLANET', 'nan', ' ', ' '),
(287, 'ENOCK', 'GITONGA', '720176002', 'WESTLANDS', 'enock@laptopcare.co.ke', ' ', ' ', 'LAPTOP CARE LTD', '27857563', ' ', ' '),
(288, 'EUNICE', 'WANZA', '722818885', 'KILIMANI', 'nan', ' ', ' ', 'EUNICE WANZA', '10811627', ' ', ' '),
(289, 'SAMUEL', 'LUYO', '701694469', 'NAIROBI', 'nan', ' ', ' ', 'EPILINK', '29209988', ' ', ' '),
(290, 'ABDI', 'MABROOK', '0', 'nan', 'nan', ' ', ' ', 'MABROOK TECHNOLOGY', 'nan', ' ', ' '),
(291, 'Emily', 'Ema', '722648364', 'NAIROBI', '', ' ', ' ', 'Business Prestige Computer Services', '21798049', ' ', ' '),
(292, 'Francis', 'Njogu', '706777709', 'NAIROBI', 'nan', ' ', ' ', 'FARAHMA COMPUTERS', '30075050', ' ', ' '),
(293, 'Maryann ', 'Kimani', '722957627', 'NAIROBI', 'amakltd2015@gmail.com', ' ', ' ', 'AMAK COMPUTERS', '20763564', ' ', ' '),
(294, 'STEPHEN', 'NJOROGE', '729865076', 'OLD NATION BUILDING ', 'Wistantec@gmail.com', ' ', ' ', 'WISTAN TECHNOLOGIES', '28390356', ' ', ' '),
(295, 'GHULEIM', 'ISSAC ABDI', '700273386', 'SOUTH B', 'MEDPEARLHEALTHCARE@GMAIL.COM', ' ', ' ', 'MEDPEARL HEALTHCARE SERVICES LTD', '26055689', ' ', ' '),
(296, 'KARANJA', 'nan', '722855670', 'NAIROBI', 'nan', ' ', ' ', 'ONE WORLD TECHNOLOGY', 'nan', ' ', ' '),
(297, 'MARTIN', 'NJERU', '0720635023', 'NAIROBI', '', ' ', ' ', 'FAHAVI ELECTRONICS', '', ' ', ' '),
(298, 'SARAH', 'TINDO', '254725983592', 'NAIROBI', '', ' ', ' ', 'BEST MERGE', '', ' ', ' '),
(299, 'FREDRICK', 'MUSYOKI', '0722681956', 'NAIROBI', '', ' ', ' ', 'DISKTECH SYSTEMS', '', ' ', ' '),
(300, 'Peter ', 'Muwangi', '0722916326', 'Platinum Plaza', 'Intelglobalsup@gmail.com', ' ', ' ', 'INTELLECTUAL GLOBAL SUPPLIES', '21842751', ' ', ' '),
(301, 'EKIRAPA', 'ANDREW', '254725852840', 'Nairobi', 'junctionforexbureaultd@gmail.com', ' ', ' ', 'JUNCTION FOREX', '11582819', ' ', ' '),
(302, 'Paul Kamau ', 'Macharia', '25402639451', 'Bazaar , Moi Avene', 'Realtech289@gmail.com', ' ', ' ', 'Spark Bridge Investment ', '29993067', ' ', ' '),
(303, 'DOMINIC', 'KIMANI', '254722808068', 'NAIROBI', '', ' ', ' ', 'DATA ENGINEERING', '21583121', ' ', ' '),
(304, 'TITO', '', '0713232310', 'NAIROBI', '', ' ', ' ', 'BLUE PITCH LTD', '', ' ', ' '),
(305, 'MR. AFZAL', '', '', '', '', ' ', ' ', 'MR. AFZAL- ACE', '', ' ', ' '),
(306, 'JOHN', 'MBURU', '0726672141', 'NAIROBI', '', ' ', ' ', 'NORTH BRIDGE COMPUTERS', '-', ' ', ' '),
(307, 'MOHAMED DEK', 'ABDI', '0718307726', 'NAIROBI', '', ' ', ' ', 'WARSEN ELECTRONICS', '', ' ', ' '),
(308, 'AKBAR', '', '0762890980', 'NAIROBI', '', ' ', ' ', 'MR AKBAR', '', ' ', ' '),
(310, 'PAUL', 'MWEAI', '0718556677', '', '', ' ', ' ', 'LIL MWAE TECHWORLD', '', ' ', ' '),
(311, 'HAPINESS', 'CHEPKEMOI', '0714786080', 'NAIROBI', '', ' ', ' ', 'HAPPYKIP COMPUTER', '', ' ', ' '),
(312, 'JACK ', 'NJOROGE', '254716077031', 'NAIROBI', '', ' ', ' ', 'ALL COVERED SOLUTION', '', ' ', ' '),
(313, 'ZIA ', 'MUHAMMAD ASIM', '0714032225', 'NAIROBI', '', ' ', ' ', 'VPRO TRADERS', '750121', ' ', ' '),
(314, 'MARGARET ', 'KARIUKI', '254725593782', 'NAIROBI', '', ' ', ' ', 'LISHERT COMPUTER SOLUTIONS', '', ' ', ' '),
(315, 'LEWIS', 'NDERITU', '254722300495', 'NAIROBI', '', ' ', ' ', 'BLUE ARC COMPUTER SOLUTIONS', '', ' ', ' '),
(316, 'KENNETH', 'MBOYA', '254721176305', 'NAIROBI', '', ' ', ' ', 'COHERENT SOLUTION', '', ' ', ' '),
(317, '', '', '', 'MOMBASA', '', ' ', ' ', 'RTW SHIPPING', '', ' ', ' '),
(318, 'ABRAHAM', 'CHESIRE', '254727847843', 'NAIROBI', '', ' ', ' ', 'ANDTEL ENTERPRISE', '28507144', ' ', ' '),
(319, 'ABDULLAHI', 'HUSSIEN', '', 'NAIROBI', '', ' ', ' ', 'DUWANE NAFUU TRADERS LTD', '24998679', ' ', ' '),
(320, 'MAINA', 'IBRAHIM', '0722898063', 'NAIROBI', '', ' ', ' ', 'HAUTECH BUSINESS SYSTEMS', '7635406', ' ', ' '),
(321, 'BRIAN', 'KYALO', '0715300895', 'NAIROBI', '', ' ', ' ', 'BRYBELL MASTER LTD', '', ' ', ' '),
(322, 'Mr. Azeem', 'Mr. Azeem', '', 'Nairobi', '', ' ', ' ', 'Mr. Azeem', '', ' ', ' '),
(323, '', '', '', '', '', ' ', ' ', 'Tokyo Computer Solutions', '', ' ', ' '),
(324, 'Esther', '', '0708812020', 'Nairobi', '', ' ', ' ', 'Mentor System', '', ' ', ' '),
(325, 'CAROLINE', '', '0728883063', 'NAIROBI', '', ' ', ' ', 'TECHWAIT ENTERPRISES', '', ' ', ' '),
(326, 'Isaac', 'Afzal', '0759740061', '', '', ' ', ' ', 'PLATO COMPUTERS', '29971472', ' ', ' '),
(327, 'AMOS', '', '0708852521', 'NAIROBI', '', ' ', ' ', 'MASCOM INTERNATIONAL', '', ' ', ' '),
(328, 'HENRY', 'KAMAU', '0723786193', 'NAIROBI', 'HENRY.KAMAU@GMAIL.COM', ' ', ' ', 'TECHNO SOURCE', '13690536', ' ', ' '),
(329, '', '', '', '', '', ' ', ' ', 'Tim Technology', '', ' ', ' '),
(330, '', '', '0722817592', '', '', ' ', ' ', 'BREYEN GEAR', '', ' ', ' '),
(331, 'Allan', 'Olotch', '0721574747', 'Nairobi', 'Allan@bellenorthedynamics.com', ' ', ' ', 'Bellenorthe Dynamics', '22903181', ' ', ' '),
(332, 'FAROOQ ', '', '0714900639', 'BUSIA', '', ' ', ' ', 'FAROOQ VENTURES', '', ' ', ' '),
(333, 'EYNASH', 'HUSSEIN', '0725299288', 'NAIROBI', '', ' ', ' ', 'TELE WORLD', '33255219', ' ', ' '),
(334, 'HARRISON', 'KIMANI', '0720889450', '', '', ' ', ' ', 'EMERGING COMMUNICATIONS', '21398786', ' ', ' '),
(335, 'KIPLAVATT', 'KOSKEI', '0711800099', 'KITALE', '', ' ', ' ', 'EASY BROAD BAND', '21574287', ' ', ' '),
(336, 'JOSEPH', 'KAMAU', '0710757760', 'NAIROBI', '', ' ', ' ', 'FIRESIDE COMMUNICATIONS', '', ' ', ' '),
(337, 'NOELLE ', 'HERERIMANA', '0705721562', 'NAIROBI', '', ' ', ' ', 'NOVELTY TECHNOLOGY', 'PC278244', ' ', ' '),
(338, 'PAUL', 'NJOROGE', '0725627685', 'NAIROBI', '', ' ', ' ', 'FAB TECH', '24550318', ' ', ' '),
(339, 'STEPHEN', '', '254722665480', '', '', ' ', ' ', 'ASTON COMPUTERS', '', ' ', ' '),
(340, 'GEORGE', 'THUO', '721505959', 'NAIROBI', '', ' ', ' ', 'SYNOVATE TECHNOLOGIES', '23466532', ' ', ' '),
(341, 'Jackson', 'Magowi', '0737830726', 'Nairobi', '', ' ', ' ', 'SPRUCEUP AFrica', '27427784', ' ', ' '),
(342, '', '', '', '', '', ' ', ' ', 'MOMBASA LOGISTICS', '', ' ', ' '),
(343, 'Joseph', 'Ndungu', '0727411175', 'Nairobi', '', ' ', ' ', 'VUMI TECH', '27869341', ' ', ' '),
(344, 'BONFACE', 'MBUVUA', '0752854211', 'NAIROBI', '', ' ', ' ', 'OPEN DATA', '37030632', ' ', ' '),
(345, 'ROBERT', 'THUO', '0746211100', 'NAIROBI', '', ' ', ' ', 'ZAYRE VENTUREA', '33967467', ' ', ' '),
(346, 'JOSEPH', '', '', '', '', ' ', ' ', 'DATAMAX CONSULTANCY LTD', '', ' ', ' '),
(347, 'ANTONY', 'KENNEDY', '0726514849', '', '', ' ', ' ', 'DIGISCOPE BUSINESS SOLUTIONS', '27438701', ' ', ' '),
(348, '', '', '0719671815', 'MOMBASA', '', ' ', ' ', 'RR ELECTRONICS', '', ' ', ' '),
(349, 'VIRGINIA ', 'NYAMBURA', '0712658747', 'NAIROBI', '', ' ', ' ', 'LEAKSTAR SOLUTION', '', ' ', ' '),
(350, 'SAMSON', 'JUMA', '0727512657', 'KISSI', '', ' ', ' ', 'BOMA TECHNOLOGY', '', ' ', ' '),
(351, '', '', '', '', '', ' ', ' ', 'MC TRADING', '', ' ', ' '),
(352, 'MARTIN', 'NYAGA', '0722808874', 'NAIROBI', '', ' ', ' ', 'MICKMART COMPUTER', '20329250', ' ', ' '),
(353, 'BHAVIN', '', '0733443611', 'KISUMU', '', ' ', ' ', 'CYBENE TECHNOLOGIES', '', ' ', ' '),
(354, 'JAMES', 'KARANJA', '0722977616', 'NAIROBI', '', ' ', ' ', 'JIMITEX COMPUTER', '', ' ', ' '),
(355, 'alex', 'mugambi', '254722981781', 'NAKURU', '', ' ', ' ', 'XIAM SOLUTIONS', '', ' ', ' '),
(356, 'DANIEL', 'MUIGAI', '0720390976', 'NAIROBI', '', ' ', ' ', 'TAKAMORI COMPUTERS', '', ' ', ' '),
(357, 'MERCY ', 'M. MWANGI', '0711725536', 'NAIROBI', '', ' ', ' ', 'BEEASHARA', '', ' ', ' '),
(358, 'KAL', 'MATHARU', '254708804883', '', '', ' ', ' ', 'KULMAN GROUP', '', ' ', ' '),
(359, 'MARY', 'NJERI', '0720037129', 'NAIROBI', '', NULL, NULL, 'TECHBARM TECHNOLOGIES', '23408397', NULL, NULL),
(360, 'VICENT NJENGA', 'WAINAINA', '0720716487', 'NAIROBI', '', NULL, NULL, 'COMPUTER HAVEN', '29577418', NULL, NULL),
(361, 'Cash', 'Sales', '', '', '', NULL, NULL, 'Cash Sales', '', NULL, NULL),
(362, 'COLLINS', 'KIBET', '254702953683', 'NAIROBI', '', NULL, NULL, 'CONSOLTECH SOLUTIONS LIMITED', '', NULL, NULL),
(363, 'MICHALE', 'MWENESI', '0723453515', 'NAIROBI', '', NULL, NULL, 'TECHLAB', '24857534', NULL, NULL),
(364, 'HAGGAI', 'WAMBISI', '0719270111', 'NAIROBI', '', NULL, NULL, 'INTELLSPARK LIMITED', '28825288', NULL, NULL),
(365, 'KENNETH', 'NJUGUNA', '0723511949', '', '', NULL, NULL, 'EAST SCOPE VENTURE LTD', '23474539', NULL, NULL),
(366, 'JHON', 'NDIRITU', '0728265383', 'NAIROBI', '', NULL, NULL, 'WAIN GROUP LIMITED', '25386998', NULL, NULL),
(367, 'ISABEL', 'KARINI', '07122152422', 'EMBU', '', NULL, NULL, 'CASEED COMPUTERS', '29468242', NULL, NULL),
(368, 'JHON', 'BAPISTA', '0726201714', 'NAIROBI', '', NULL, NULL, 'GRIND GROUP', '23423309516', NULL, NULL),
(369, 'MICHAEL', 'TUMO', '722550393', 'ELDORET', 'TEST@admin.com', NULL, NULL, 'FUTURETECH COMPUTER', '', NULL, NULL),
(370, 'NANCY', 'KHAONGO', '24736139', 'ELDORET', 'KANJCOM@COM', NULL, NULL, 'KANJICOM ENTERPRISES', '', NULL, NULL),
(371, 'ALE=BERT', 'ATAMBO', '0728447125', 'NAIROBI', 'KOMPUTALAB@GMAIL.COM', NULL, NULL, 'KOMPUTA LAB', '20313345', NULL, NULL),
(372, 'Repairs', 'replacements', '', '', 'ttg@gmail.com', NULL, NULL, 'Company Use', '', NULL, NULL),
(373, 'KORIR', 'RYAN', '0720499767', 'NAIROBO', 'RYANKIPKOECH@GMAIL.COM', NULL, NULL, 'DEMACCO SYSTEM', '28622592', NULL, NULL),
(374, 'KEVIN', 'OMONDI', '0726483271', 'KISUMU', 'MICRON@GMAIL.COM', NULL, NULL, 'MICRON TRADING', '', NULL, NULL),
(375, 'DANIEL', 'MWAURA', '0723209856', 'NAIROBI', 'MWAURADAN@GMAIL.COM', NULL, NULL, 'DILATECH SOLUTION', '25076071', NULL, NULL),
(1200, 'SAMMY ', 'nan', '722826245', 'NAIROBI', 'sammy@arcticcomputershop.com', ' ', ' ', 'ARCTIC COMPUTER SHOP ', '21763892', ' ', ' '),
(3000, 'ERICK ', 'MBATIA', '718964946', 'NAIROBI', 'ATOZSUPPLIERSLIMITED@YAHOO.COM', ' ', ' ', 'A TO Z COMPUTERS ', '23304983', ' ', ' '),
(4000, 'JAMES ', 'KARIUKI', '716200000', 'NAIROBI', '', ' ', ' ', 'ACE PRESTIGE AUTO LTD', '21895351', ' ', ' '),
(5000, 'JAMES ', 'MAJIWA', '724649646', 'nan', 'olagojames83@gmail.com', ' ', ' ', 'ACHIEVERS COMPUTER', '23788632', ' ', ' '),
(6000, 'ABDIKANI BIRIK', 'nan', '712390003', 'nan', 'araaletech@gmail.com', ' ', ' ', 'ARAALE TECH', '33525858', ' ', ' '),
(7000, 'GEORGE ', 'THAIRU', '722513640', 'NAIROBI', 'info@asterltd.com', ' ', ' ', 'ASTER LIMITED', '3475464', ' ', ' '),
(9000, 'MARK ', 'nan', '724488658', 'nan', '-', ' ', ' ', 'ABUNDANT COMPUTER ', '23583671', ' ', ' '),
(10000, 'OMAR ', 'DARIQ', '716800008', 'NAIROBI', '', ' ', ' ', 'ACACIA TECHNOLOGIES', '391829', ' ', ' '),
(11000, 'PETER', 'KABURU', '721863639', 'NAIROBI', 'kelvin@anchortechnologies.co.ke', ' ', ' ', 'ANCHOR TECHNOLOGIES', '25169029', ' ', ' '),
(80000, 'ALEX ', 'KAMAITHA', '722290216', 'NAIROBI', '', ' ', ' ', 'ALETECH SOLUTION', '22241363', ' ', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(200) DEFAULT NULL,
  `lname` varchar(200) DEFAULT NULL,
  `vendor` varchar(200) DEFAULT NULL,
  `customer` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `username` varchar(200) DEFAULT NULL,
  `user_name` varchar(200) DEFAULT NULL,
  `id_no` varchar(200) DEFAULT NULL,
  `document` varchar(200) DEFAULT NULL,
  `ref` varchar(200) DEFAULT NULL,
  `random` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `delvnote` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `date` varchar(200) DEFAULT NULL,
  `invono` varchar(200) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `sold_to` varchar(200) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `mode` varchar(200) NOT NULL,
  `bprice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_custompermission`
--

CREATE TABLE `users_custompermission` (
  `id` bigint(20) NOT NULL,
  `action` varchar(50) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `type_code_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_custompermission`
--

INSERT INTO `users_custompermission` (`id`, `action`, `module_id`, `type_code_id`) VALUES
(1, 'create', 1, 1),
(2, 'read', 1, 2),
(3, 'update', 1, 3),
(4, 'delete', 1, 4),
(5, 'create', 2, 5),
(6, 'read', 2, 6),
(7, 'update', 2, 7),
(8, 'delete', 2, 8),
(9, 'create', 2, 9),
(10, 'read', 2, 10),
(11, 'update', 2, 11),
(12, 'create', 3, 12),
(13, 'read', 3, 13),
(14, 'update', 3, 14),
(15, 'delete', 3, 15),
(16, 'create', 4, 16),
(17, 'read', 4, 17),
(18, 'update', 4, 18),
(19, 'delete', 4, 19),
(20, 'create', 5, 20),
(21, 'read', 5, 21),
(22, 'update', 5, 22),
(23, 'delete', 5, 23),
(24, 'create', 5, 24),
(25, 'read', 5, 25),
(26, 'update', 5, 26),
(27, 'create', 6, 27),
(28, 'read', 6, 28),
(29, 'update', 6, 29),
(30, 'delete', 6, 30),
(31, 'create', 6, 31),
(32, 'read', 6, 32),
(33, 'update', 6, 33),
(34, 'read', 6, 34),
(35, 'create', 7, 35),
(36, 'read', 7, 36),
(37, 'update', 7, 37),
(38, 'delete', 7, 38),
(39, 'read', 7, 39),
(40, 'create', 8, 40),
(41, 'read', 8, 41),
(42, 'update', 8, 42),
(43, 'delete', 8, 43),
(44, 'create', 8, 44),
(45, 'read', 8, 45),
(46, 'update', 8, 46),
(47, 'create', 9, 47),
(48, 'read', 9, 48),
(49, 'update', 9, 49),
(50, 'delete', 9, 50),
(51, 'create', 10, 51),
(52, 'read', 10, 52),
(53, 'update', 10, 53),
(54, 'delete', 10, 54),
(55, 'create', 11, 55),
(56, 'read', 11, 56),
(57, 'update', 11, 57),
(58, 'delete', 11, 58),
(59, 'create', 12, 59),
(60, 'read', 12, 60),
(61, 'update', 12, 61),
(62, 'delete', 12, 62),
(63, 'create', 12, 63),
(64, 'read', 12, 64),
(65, 'update', 12, 65),
(66, 'create', 13, 66),
(67, 'read', 13, 67),
(68, 'update', 13, 68),
(69, 'delete', 13, 69),
(70, 'create', 13, 70),
(71, 'read', 13, 71),
(72, 'update', 13, 72),
(73, 'create', 14, 73),
(74, 'read', 14, 74),
(75, 'update', 14, 75),
(76, 'delete', 14, 76),
(77, 'create', 14, 77),
(78, 'read', 14, 78),
(79, 'update', 14, 79),
(80, 'create', 15, 80),
(81, 'read', 15, 81),
(82, 'update', 15, 82),
(83, 'delete', 15, 83),
(84, 'create', 15, 84),
(85, 'read', 15, 85),
(86, 'update', 15, 86),
(87, 'create', 16, 87),
(88, 'read', 16, 88),
(89, 'update', 16, 89),
(90, 'delete', 16, 90),
(91, 'create', 16, 91),
(92, 'read', 16, 92),
(93, 'update', 16, 93),
(94, 'create', 17, 94),
(95, 'read', 17, 95),
(96, 'update', 17, 96),
(97, 'delete', 17, 97),
(98, 'create', 17, 98),
(99, 'read', 17, 99),
(100, 'update', 17, 100),
(101, 'read', 17, 101),
(102, 'create', 18, 102),
(103, 'read', 18, 103),
(104, 'update', 18, 104),
(105, 'delete', 18, 105),
(106, 'create', 18, 106),
(107, 'read', 18, 107),
(108, 'update', 18, 108),
(109, 'read', 18, 109),
(110, 'create', 19, 110),
(111, 'read', 19, 111),
(112, 'update', 19, 112),
(113, 'delete', 19, 113),
(114, 'create', 20, 114),
(115, 'read', 20, 115),
(116, 'update', 20, 116),
(117, 'delete', 20, 117),
(118, 'create', 21, 118),
(119, 'read', 21, 119),
(120, 'update', 21, 120),
(121, 'delete', 21, 121),
(122, 'read', 21, 122),
(123, 'create', 22, 123),
(124, 'read', 22, 124),
(125, 'update', 22, 125),
(126, 'delete', 22, 126),
(127, 'read', 22, 127),
(128, 'create', 23, 128),
(129, 'read', 23, 129),
(130, 'update', 23, 130),
(131, 'delete', 23, 131),
(132, 'create', 24, 132),
(133, 'read', 24, 133),
(134, 'update', 24, 134),
(135, 'delete', 24, 135),
(136, 'read', 24, 136);

-- --------------------------------------------------------

--
-- Table structure for table `users_module`
--

CREATE TABLE `users_module` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `view_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_module`
--

INSERT INTO `users_module` (`id`, `name`, `view_name`) VALUES
(1, 'Stock adjustments', NULL),
(2, 'Stock verification', NULL),
(3, 'Accessories', 'accessories_view_name'),
(4, 'Stock in', NULL),
(5, 'Stock out', NULL),
(6, 'Faulty in', NULL),
(7, 'Warranty in', NULL),
(8, 'Warranty out', NULL),
(9, 'Users', 'user_view_name'),
(10, 'Staff', 'staff_view_name'),
(11, 'Vendors', 'vendors_view_name'),
(12, 'Delivery notes', 'delivery_notes_view_name'),
(13, 'Exchange notes', NULL),
(14, 'Warranty notes', 'warranty_notes_view_name'),
(15, 'Credit notes', 'credit_notes_view_name'),
(16, 'Sales', NULL),
(17, 'Download speadsheet', NULL),
(18, 'Barcodes', NULL),
(19, 'Jobcards', NULL),
(20, 'Previous rcvd', NULL),
(21, 'Faulty in status', NULL),
(22, 'Warranty in status', NULL),
(23, 'Lab report', NULL),
(24, 'Cards', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_subscription`
--

CREATE TABLE `users_subscription` (
  `id` bigint(20) NOT NULL,
  `plan` varchar(10) NOT NULL,
  `expiration_date` date NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_subscription`
--

INSERT INTO `users_subscription` (`id`, `plan`, `expiration_date`, `user_id`) VALUES
(1, 'basic', '2024-01-05', 1),
(2, 'basic', '2024-01-05', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users_typecode`
--

CREATE TABLE `users_typecode` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_typecode`
--

INSERT INTO `users_typecode` (`id`, `code`, `description`) VALUES
(1, 'ADMIN', 'Can create stock adjustments'),
(2, 'ADMIN', 'Can read stock adjustments'),
(3, 'ADMIN', 'Can update stock adjustments'),
(4, 'ADMIN', 'Can delete stock adjustments'),
(5, 'ADMIN', 'Can create stock verification'),
(6, 'ADMIN', 'Can read stock verification'),
(7, 'ADMIN', 'Can update stock verification'),
(8, 'ADMIN', 'Can delete stock verification'),
(9, 'SALES', 'Can create stock verification'),
(10, 'SALES', 'Can read stock verification'),
(11, 'SALES', 'Can update stock verification'),
(12, 'ADMIN', 'Can create accessories'),
(13, 'ADMIN', 'Can read accessories'),
(14, 'ADMIN', 'Can update accessories'),
(15, 'ADMIN', 'Can delete accessories'),
(16, 'ADMIN', 'Can create stock in'),
(17, 'ADMIN', 'Can read stock in'),
(18, 'ADMIN', 'Can update stock in'),
(19, 'ADMIN', 'Can delete stock in'),
(20, 'ADMIN', 'Can create stock out'),
(21, 'ADMIN', 'Can read stock out'),
(22, 'ADMIN', 'Can update stock out'),
(23, 'ADMIN', 'Can delete stock out'),
(24, 'SALES', 'Can create stock out'),
(25, 'SALES', 'Can read stock out'),
(26, 'SALES', 'Can update stock out'),
(27, 'ADMIN', 'Can create faulty in'),
(28, 'ADMIN', 'Can read faulty in'),
(29, 'ADMIN', 'Can update faulty in'),
(30, 'ADMIN', 'Can delete faulty in'),
(31, 'SALES', 'Can create faulty in'),
(32, 'SALES', 'Can read faulty in'),
(33, 'SALES', 'Can update faulty in'),
(34, 'TECHNICIAN', 'Can read faulty in'),
(35, 'ADMIN', 'Can create warranty in'),
(36, 'ADMIN', 'Can read warranty in'),
(37, 'ADMIN', 'Can update warranty in'),
(38, 'ADMIN', 'Can delete warranty in'),
(39, 'TECHNICIAN', 'Can read warranty in'),
(40, 'ADMIN', 'Can create warranty out'),
(41, 'ADMIN', 'Can read warranty out'),
(42, 'ADMIN', 'Can update warranty out'),
(43, 'ADMIN', 'Can delete warranty out'),
(44, 'SALES', 'Can create warranty out'),
(45, 'SALES', 'Can read warranty out'),
(46, 'SALES', 'Can update warranty out'),
(47, 'ADMIN', 'Can create users'),
(48, 'ADMIN', 'Can read users'),
(49, 'ADMIN', 'Can update users'),
(50, 'ADMIN', 'Can delete users'),
(51, 'ADMIN', 'Can create staff'),
(52, 'ADMIN', 'Can read staff'),
(53, 'ADMIN', 'Can update staff'),
(54, 'ADMIN', 'Can delete staff'),
(55, 'ADMIN', 'Can create vendors'),
(56, 'ADMIN', 'Can read vendors'),
(57, 'ADMIN', 'Can update vendors'),
(58, 'ADMIN', 'Can delete vendors'),
(59, 'ADMIN', 'Can create delivery notes'),
(60, 'ADMIN', 'Can read delivery notes'),
(61, 'ADMIN', 'Can update delivery notes'),
(62, 'ADMIN', 'Can delete delivery notes'),
(63, 'SALES', 'Can create delivery notes'),
(64, 'SALES', 'Can read delivery notes'),
(65, 'SALES', 'Can update delivery notes'),
(66, 'ADMIN', 'Can create exchange notes'),
(67, 'ADMIN', 'Can read exchange notes'),
(68, 'ADMIN', 'Can update exchange notes'),
(69, 'ADMIN', 'Can delete exchange notes'),
(70, 'SALES', 'Can create exchange notes'),
(71, 'SALES', 'Can read exchange notes'),
(72, 'SALES', 'Can update exchange notes'),
(73, 'ADMIN', 'Can create warranty notes'),
(74, 'ADMIN', 'Can read warranty notes'),
(75, 'ADMIN', 'Can update warranty notes'),
(76, 'ADMIN', 'Can delete warranty notes'),
(77, 'SALES', 'Can create warranty notes'),
(78, 'SALES', 'Can read warranty notes'),
(79, 'SALES', 'Can update warranty notes'),
(80, 'ADMIN', 'Can create credit notes'),
(81, 'ADMIN', 'Can read credit notes'),
(82, 'ADMIN', 'Can update credit notes'),
(83, 'ADMIN', 'Can delete credit notes'),
(84, 'SALES', 'Can create credit notes'),
(85, 'SALES', 'Can read credit notes'),
(86, 'SALES', 'Can update credit notes'),
(87, 'ADMIN', 'Can create sales'),
(88, 'ADMIN', 'Can read sales'),
(89, 'ADMIN', 'Can update sales'),
(90, 'ADMIN', 'Can delete sales'),
(91, 'SALES', 'Can create sales'),
(92, 'SALES', 'Can read sales'),
(93, 'SALES', 'Can update sales'),
(94, 'ADMIN', 'Can create download speadsheet'),
(95, 'ADMIN', 'Can read download speadsheet'),
(96, 'ADMIN', 'Can update download speadsheet'),
(97, 'ADMIN', 'Can delete download speadsheet'),
(98, 'SALES', 'Can create download speadsheet'),
(99, 'SALES', 'Can read download speadsheet'),
(100, 'SALES', 'Can update download speadsheet'),
(101, 'TECHNICIAN', 'Can read download speadsheet'),
(102, 'ADMIN', 'Can create barcodes'),
(103, 'ADMIN', 'Can read barcodes'),
(104, 'ADMIN', 'Can update barcodes'),
(105, 'ADMIN', 'Can delete barcodes'),
(106, 'SALES', 'Can create barcodes'),
(107, 'SALES', 'Can read barcodes'),
(108, 'SALES', 'Can update barcodes'),
(109, 'TECHNICIAN', 'Can read barcodes'),
(110, 'ADMIN', 'Can create jobcards'),
(111, 'ADMIN', 'Can read jobcards'),
(112, 'ADMIN', 'Can update jobcards'),
(113, 'ADMIN', 'Can delete jobcards'),
(114, 'ADMIN', 'Can create previous rcvd'),
(115, 'ADMIN', 'Can read previous rcvd'),
(116, 'ADMIN', 'Can update previous rcvd'),
(117, 'ADMIN', 'Can delete previous rcvd'),
(118, 'ADMIN', 'Can create faulty in status'),
(119, 'ADMIN', 'Can read faulty in status'),
(120, 'ADMIN', 'Can update faulty in status'),
(121, 'ADMIN', 'Can delete faulty in status'),
(122, 'TECHNICIAN', 'Can read faulty in status'),
(123, 'ADMIN', 'Can create warranty in status'),
(124, 'ADMIN', 'Can read warranty in status'),
(125, 'ADMIN', 'Can update warranty in status'),
(126, 'ADMIN', 'Can delete warranty in status'),
(127, 'TECHNICIAN', 'Can read warranty in status'),
(128, 'ADMIN', 'Can create lab report'),
(129, 'ADMIN', 'Can read lab report'),
(130, 'ADMIN', 'Can update lab report'),
(131, 'ADMIN', 'Can delete lab report'),
(132, 'ADMIN', 'Can create cards'),
(133, 'ADMIN', 'Can read cards'),
(134, 'ADMIN', 'Can update cards'),
(135, 'ADMIN', 'Can delete cards'),
(136, 'TECHNICIAN', 'Can read cards');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`id`, `password`, `type`, `email`, `firstname`, `username`, `lastname`, `is_staff`, `is_superuser`, `is_active`, `last_login`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$Oa4iuTV5lL3WyGhbPRmi3g$vo3VrYjUmo2jFJDgrWukCrGEK9ifs5PhU6eXGbCaGmc=', 'ADMIN', 'test@admin.com', 'Admin', 'Admin', 'Admin', 1, 1, 1, '2023-12-30 11:02:08.606308', '2023-12-29 10:46:23.990002'),
(2, 'pbkdf2_sha256$720000$hFUonQMkHgL1XXq6KwJOQQ$uTVkHNEtlJ/vksu3ZG/ydl0olOCkfia8mGbMPNZeaMU=', 'SALES', 'test@sales.com', 'Maina', 'sales', 'Test', 0, 0, 1, '2023-12-29 10:48:37.620456', '2023-12-29 10:46:24.703592');

-- --------------------------------------------------------

--
-- Table structure for table `users_user_custom_permissions`
--

CREATE TABLE `users_user_custom_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `custompermission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_user_custom_permissions`
--

INSERT INTO `users_user_custom_permissions` (`id`, `user_id`, `custompermission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(110, 1, 110),
(111, 1, 111),
(112, 1, 112),
(113, 1, 113),
(114, 1, 114),
(115, 1, 115),
(116, 1, 116),
(117, 1, 117),
(118, 1, 118),
(119, 1, 119),
(120, 1, 120),
(121, 1, 121),
(123, 1, 123),
(124, 1, 124),
(125, 1, 125),
(126, 1, 126),
(128, 1, 128),
(129, 1, 129),
(130, 1, 130),
(131, 1, 131),
(132, 1, 132),
(133, 1, 133),
(134, 1, 134),
(135, 1, 135),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(24, 2, 24),
(25, 2, 25),
(26, 2, 26),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(44, 2, 44),
(45, 2, 45),
(46, 2, 46),
(63, 2, 63),
(64, 2, 64),
(65, 2, 65),
(70, 2, 70),
(71, 2, 71),
(72, 2, 72),
(77, 2, 77),
(78, 2, 78),
(79, 2, 79),
(84, 2, 84),
(85, 2, 85),
(86, 2, 86),
(91, 2, 91),
(92, 2, 92),
(93, 2, 93),
(98, 2, 98),
(99, 2, 99),
(100, 2, 100),
(106, 2, 106),
(107, 2, 107),
(108, 2, 108);

-- --------------------------------------------------------

--
-- Table structure for table `users_user_groups`
--

CREATE TABLE `users_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_user_user_permissions`
--

CREATE TABLE `users_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `dcustomer`
--
ALTER TABLE `dcustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `main_accessory`
--
ALTER TABLE `main_accessory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_accessory_supplier_id_4b80ad16_fk_main_vendor_id` (`supplier_id`);

--
-- Indexes for table `main_agents_records`
--
ALTER TABLE `main_agents_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_agents_records_name_id_f1b3a423_fk_users_user_id` (`name_id`);

--
-- Indexes for table `main_brand`
--
ALTER TABLE `main_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_cpu`
--
ALTER TABLE `main_cpu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_customer`
--
ALTER TABLE `main_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_expense`
--
ALTER TABLE `main_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_expense_name_id_9cf9f6ce_fk_users_user_id` (`name_id`),
  ADD KEY `main_expense_description_id_ab931b4f` (`description_id`);

--
-- Indexes for table `main_expense_description`
--
ALTER TABLE `main_expense_description`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_gen`
--
ALTER TABLE `main_gen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_hdd`
--
ALTER TABLE `main_hdd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_masterlist`
--
ALTER TABLE `main_masterlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_masterlist_supplier_id_7924e77e_fk_main_vendor_id` (`supplier_id`);

--
-- Indexes for table `main_mode`
--
ALTER TABLE `main_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_narations`
--
ALTER TABLE `main_narations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_narations_vendor_id_ebb0ef19_fk_main_vendor_id` (`vendor_id`);

--
-- Indexes for table `main_newcondition`
--
ALTER TABLE `main_newcondition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_orders`
--
ALTER TABLE `main_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_ram`
--
ALTER TABLE `main_ram`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_screen`
--
ALTER TABLE `main_screen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_speed`
--
ALTER TABLE `main_speed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_stockout`
--
ALTER TABLE `main_stockout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_stockout_supplier_id_b7abb31b_fk_main_vendor_id` (`supplier_id`);

--
-- Indexes for table `main_supplierorders`
--
ALTER TABLE `main_supplierorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_temp`
--
ALTER TABLE `main_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_temp_supplier_id_95ba35a7_fk_main_vendor_id` (`supplier_id`);

--
-- Indexes for table `main_templist`
--
ALTER TABLE `main_templist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `main_templist_serialno_a9ba3eb2_uniq` (`serialno`),
  ADD KEY `main_templist_supplier_id_41de5851_fk_main_vendor_id` (`supplier_id`);

--
-- Indexes for table `main_type`
--
ALTER TABLE `main_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_vendor`
--
ALTER TABLE `main_vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_custompermission`
--
ALTER TABLE `users_custompermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_custompermission_module_id_type_code_id_a_9c1bb611_uniq` (`module_id`,`type_code_id`,`action`),
  ADD KEY `users_custompermissi_type_code_id_b7f3b155_fk_users_typ` (`type_code_id`);

--
-- Indexes for table `users_module`
--
ALTER TABLE `users_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_subscription`
--
ALTER TABLE `users_subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_subscription_user_id_d9433bee_fk_users_user_id` (`user_id`);

--
-- Indexes for table `users_typecode`
--
ALTER TABLE `users_typecode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_user_custom_permissions`
--
ALTER TABLE `users_user_custom_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_custom_permis_user_id_custompermission_2b172e9b_uniq` (`user_id`,`custompermission_id`),
  ADD KEY `users_user_custom_pe_custompermission_id_5ce42e78_fk_users_cus` (`custompermission_id`);

--
-- Indexes for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_groups_user_id_group_id_b88eab82_uniq` (`user_id`,`group_id`),
  ADD KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_user_user_permissions_user_id_permission_id_43338c45_uniq` (`user_id`,`permission_id`),
  ADD KEY `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `dcustomer`
--
ALTER TABLE `dcustomer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `main_accessory`
--
ALTER TABLE `main_accessory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `main_agents_records`
--
ALTER TABLE `main_agents_records`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_brand`
--
ALTER TABLE `main_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `main_cpu`
--
ALTER TABLE `main_cpu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `main_customer`
--
ALTER TABLE `main_customer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_expense`
--
ALTER TABLE `main_expense`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_expense_description`
--
ALTER TABLE `main_expense_description`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_gen`
--
ALTER TABLE `main_gen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `main_hdd`
--
ALTER TABLE `main_hdd`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_masterlist`
--
ALTER TABLE `main_masterlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `main_mode`
--
ALTER TABLE `main_mode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `main_narations`
--
ALTER TABLE `main_narations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_newcondition`
--
ALTER TABLE `main_newcondition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `main_orders`
--
ALTER TABLE `main_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `main_ram`
--
ALTER TABLE `main_ram`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `main_screen`
--
ALTER TABLE `main_screen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `main_speed`
--
ALTER TABLE `main_speed`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_stockout`
--
ALTER TABLE `main_stockout`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_supplierorders`
--
ALTER TABLE `main_supplierorders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `main_temp`
--
ALTER TABLE `main_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_templist`
--
ALTER TABLE `main_templist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `main_type`
--
ALTER TABLE `main_type`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `main_vendor`
--
ALTER TABLE `main_vendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80001;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_custompermission`
--
ALTER TABLE `users_custompermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `users_module`
--
ALTER TABLE `users_module`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users_subscription`
--
ALTER TABLE `users_subscription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_typecode`
--
ALTER TABLE `users_typecode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_user_custom_permissions`
--
ALTER TABLE `users_user_custom_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=653;

--
-- AUTO_INCREMENT for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `main_accessory`
--
ALTER TABLE `main_accessory`
  ADD CONSTRAINT `main_accessory_supplier_id_4b80ad16_fk_main_vendor_id` FOREIGN KEY (`supplier_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `main_agents_records`
--
ALTER TABLE `main_agents_records`
  ADD CONSTRAINT `main_agents_records_name_id_f1b3a423_fk_users_user_id` FOREIGN KEY (`name_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `main_expense`
--
ALTER TABLE `main_expense`
  ADD CONSTRAINT `main_expense_description_id_ab931b4f_fk_main_expe` FOREIGN KEY (`description_id`) REFERENCES `main_expense_description` (`id`),
  ADD CONSTRAINT `main_expense_name_id_9cf9f6ce_fk_users_user_id` FOREIGN KEY (`name_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `main_masterlist`
--
ALTER TABLE `main_masterlist`
  ADD CONSTRAINT `main_masterlist_supplier_id_7924e77e_fk_main_vendor_id` FOREIGN KEY (`supplier_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `main_narations`
--
ALTER TABLE `main_narations`
  ADD CONSTRAINT `main_narations_vendor_id_ebb0ef19_fk_main_vendor_id` FOREIGN KEY (`vendor_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `main_stockout`
--
ALTER TABLE `main_stockout`
  ADD CONSTRAINT `main_stockout_supplier_id_b7abb31b_fk_main_vendor_id` FOREIGN KEY (`supplier_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `main_temp`
--
ALTER TABLE `main_temp`
  ADD CONSTRAINT `main_temp_supplier_id_95ba35a7_fk_main_vendor_id` FOREIGN KEY (`supplier_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `main_templist`
--
ALTER TABLE `main_templist`
  ADD CONSTRAINT `main_templist_supplier_id_41de5851_fk_main_vendor_id` FOREIGN KEY (`supplier_id`) REFERENCES `main_vendor` (`id`);

--
-- Constraints for table `users_custompermission`
--
ALTER TABLE `users_custompermission`
  ADD CONSTRAINT `users_custompermissi_type_code_id_b7f3b155_fk_users_typ` FOREIGN KEY (`type_code_id`) REFERENCES `users_typecode` (`id`),
  ADD CONSTRAINT `users_custompermission_module_id_15bf3862_fk_users_module_id` FOREIGN KEY (`module_id`) REFERENCES `users_module` (`id`);

--
-- Constraints for table `users_subscription`
--
ALTER TABLE `users_subscription`
  ADD CONSTRAINT `users_subscription_user_id_d9433bee_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_custom_permissions`
--
ALTER TABLE `users_user_custom_permissions`
  ADD CONSTRAINT `users_user_custom_pe_custompermission_id_5ce42e78_fk_users_cus` FOREIGN KEY (`custompermission_id`) REFERENCES `users_custompermission` (`id`),
  ADD CONSTRAINT `users_user_custom_permissions_user_id_48241139_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_groups`
--
ALTER TABLE `users_user_groups`
  ADD CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);

--
-- Constraints for table `users_user_user_permissions`
--
ALTER TABLE `users_user_user_permissions`
  ADD CONSTRAINT `users_user_user_perm_permission_id_0b93982e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
