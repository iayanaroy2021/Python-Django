-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2021 at 06:34 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_category`
--

CREATE TABLE `adminapp_category` (
  `id` bigint(20) NOT NULL,
  `cate_name` varchar(150) NOT NULL,
  `cate_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_category`
--

INSERT INTO `adminapp_category` (`id`, `cate_name`, `cate_status`) VALUES
(1, 'Computers', 1),
(2, 'Phone', 1),
(3, 'Home Appliances', 1),
(4, 'Gadgets', 1);

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_country`
--

CREATE TABLE `adminapp_country` (
  `id` bigint(20) NOT NULL,
  `country_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_country`
--

INSERT INTO `adminapp_country` (`id`, `country_name`) VALUES
(1, 'India');

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_manufctr`
--

CREATE TABLE `adminapp_manufctr` (
  `id` bigint(20) NOT NULL,
  `manu_name` varchar(150) NOT NULL,
  `manu_location` varchar(150) NOT NULL,
  `manu_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_manufctr`
--

INSERT INTO `adminapp_manufctr` (`id`, `manu_name`, `manu_location`, `manu_status`) VALUES
(1, 'Acer', 'banglore', 1),
(2, 'Redmi', 'korea', 1),
(3, 'Hp', 'banglore', 1),
(4, 'Lenovo', 'banglore', 1),
(5, 'samsung', 'Kochi', 1),
(6, 'Lg', 'Mysore', 1),
(7, 'canon', 'Japan', 1),
(8, 'boAt', 'korea', 1),
(9, 'Real Me', 'japan', 1),
(10, 'Apple', 'india', 1);

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_product`
--

CREATE TABLE `adminapp_product` (
  `id` bigint(20) NOT NULL,
  `pro_name` varchar(150) NOT NULL,
  `pro_spec` varchar(400) NOT NULL,
  `pro_color` varchar(100) NOT NULL,
  `pro_price` bigint(20) NOT NULL,
  `pro_stock` int(11) NOT NULL,
  `pro_image` varchar(100) NOT NULL,
  `pro_status` int(11) NOT NULL,
  `manuf_id` bigint(20) NOT NULL,
  `protype_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_product`
--

INSERT INTO `adminapp_product` (`id`, `pro_name`, `pro_spec`, `pro_color`, `pro_price`, `pro_stock`, `pro_image`, `pro_status`, `manuf_id`, `protype_id`) VALUES
(1, 'HP new generation', '10th Generation Intel® Core™ i3-1005G1 Processor (4MB Cache, up to 3.4 GHz)\r\n512 GB PCIe® NVMe™ M.2 SSD\r\nStarting at 1.49 kg', 'Grey', 35000, 10, 'images/download.png', 1, 3, 1),
(4, 'Acer-101', 'AMD Ryzen 5 4600H hexa-core processor\r\nWindows 10 Home 64-bit\r\nNVIDIA® GeForce® GTX 1650 with 4 GB GDDR6 memory', 'red', 75000, 25, 'images/acer_primary_image_2_.png', 1, 1, 1),
(5, 'Acer Aspire', 'AMD Ryzen 3-3250U dual-core processor\r\nWindows 10 Home 64-bit\r\nAMD Radeon Graphics\r\n4 GB of onboard DDR4 system memory, upgradable up to 12 GB \r\n1 TB HDD 6.3 cm (2.5-inch) 5400 RPM\r\nSupports up to 1 TB SSD, PCIe Gen3, 8 Gb/s, NVMe\r\n39.6 cm (15.6\") Full HD 1920 x 1080 pixel, high-brightness Acer ComfyView LED-backlit TFT LCD', 'black', 78000, 14, 'images/acer-aspire-3_a315-23-1_2.jpg', 1, 1, 1),
(6, 'Redmi Note 10 Pro', '6GB RAM, 128GB Storage) -120hz Super Amoled Display|64MPwith 5mp Super Tele-Macro', 'Blue', 17000, 12, 'images/shopping.png', 1, 2, 3),
(7, 'Lenovo new10', 'Qualcomm® Snapdragon™ 450 Processor (8 Cores, 8x A53 @1.80 GHz)', 'grey', 9900, 3, 'images/download_1.jpg', 1, 4, 3),
(8, 'Canon c133', 'Up to 30 fps continuous shooting with AF/AE tracking\r\nEye Control AF + New Vehicle Priority AF\r\n6K RAW recording + 4K movie with 6K oversampling', 'Black', 170000, 1, 'images/download_2.jpg', 1, 7, 4),
(9, 'boAt rockers', 'Up to 15H Nonstop Play\r\nStay into the groove and flow in the jam with a nonstop playback of up to 15 hours.', 'black', 899, 12, 'images/download_3.jpg', 1, 8, 9),
(10, 'Mi tv', 'Mi 80 cm (32 inches) HD Ready Android Smart LED TV 4A PRO | L32M5-AL (Black)', 'black', 38900, 12, 'images/71Zl05eSIS._SL1188_.jpg', 1, 2, 10),
(11, 'apple 1123', 'new', 'white', 3, 13000, 'images/shopping_1.png', 1, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `adminapp_producttype`
--

CREATE TABLE `adminapp_producttype` (
  `id` bigint(20) NOT NULL,
  `protype_name` varchar(150) NOT NULL,
  `protype_short` varchar(150) NOT NULL,
  `protype_status` int(11) NOT NULL,
  `cat_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminapp_producttype`
--

INSERT INTO `adminapp_producttype` (`id`, `protype_name`, `protype_short`, `protype_status`, `cat_id`) VALUES
(1, 'Laptop', 'laps', 1, 1),
(2, 'Desktop', 'desktop', 1, 1),
(3, 'Smart Phone', 'phone', 1, 2),
(4, 'camera', 'cam', 1, 4),
(7, 'Refrigerator', 'fridge', 1, 3),
(9, 'Bluetooth Headset', 'headset', 1, 4),
(10, 'Television', 'tv', 1, 3),
(11, 'earpod', 'earpod', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add register', 8, 'add_register'),
(30, 'Can change register', 8, 'change_register'),
(31, 'Can delete register', 8, 'delete_register'),
(32, 'Can view register', 8, 'view_register'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add producttype', 10, 'add_producttype'),
(38, 'Can change producttype', 10, 'change_producttype'),
(39, 'Can delete producttype', 10, 'delete_producttype'),
(40, 'Can view producttype', 10, 'view_producttype'),
(41, 'Can add category', 11, 'add_category'),
(42, 'Can change category', 11, 'change_category'),
(43, 'Can delete category', 11, 'delete_category'),
(44, 'Can view category', 11, 'view_category'),
(45, 'Can add manufctr', 12, 'add_manufctr'),
(46, 'Can change manufctr', 12, 'change_manufctr'),
(47, 'Can delete manufctr', 12, 'delete_manufctr'),
(48, 'Can view manufctr', 12, 'view_manufctr'),
(49, 'Can add country', 13, 'add_country'),
(50, 'Can change country', 13, 'change_country'),
(51, 'Can delete country', 13, 'delete_country'),
(52, 'Can view country', 13, 'view_country'),
(53, 'Can add adreess', 14, 'add_adreess'),
(54, 'Can change adreess', 14, 'change_adreess'),
(55, 'Can delete adreess', 14, 'delete_adreess'),
(56, 'Can view adreess', 14, 'view_adreess'),
(57, 'Can add razor', 15, 'add_razor'),
(58, 'Can change razor', 15, 'change_razor'),
(59, 'Can delete razor', 15, 'delete_razor'),
(60, 'Can view razor', 15, 'view_razor'),
(61, 'Can add razorpay', 16, 'add_razorpay'),
(62, 'Can change razorpay', 16, 'change_razorpay'),
(63, 'Can delete razorpay', 16, 'delete_razorpay'),
(64, 'Can view razorpay', 16, 'view_razorpay'),
(65, 'Can add payment', 17, 'add_payment'),
(66, 'Can change payment', 17, 'change_payment'),
(67, 'Can delete payment', 17, 'delete_payment'),
(68, 'Can view payment', 17, 'view_payment'),
(69, 'Can add order', 18, 'add_order'),
(70, 'Can change order', 18, 'change_order'),
(71, 'Can delete order', 18, 'delete_order'),
(72, 'Can view order', 18, 'view_order'),
(73, 'Can add orderpay', 19, 'add_orderpay'),
(74, 'Can change orderpay', 19, 'change_orderpay'),
(75, 'Can delete orderpay', 19, 'delete_orderpay'),
(76, 'Can view orderpay', 19, 'view_orderpay');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(11, 'adminapp', 'category'),
(13, 'adminapp', 'country'),
(12, 'adminapp', 'manufctr'),
(9, 'adminapp', 'product'),
(10, 'adminapp', 'producttype'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(18, 'payment', 'order'),
(19, 'payment', 'orderpay'),
(17, 'payment', 'payment'),
(15, 'payment', 'razor'),
(16, 'payment', 'razorpay'),
(6, 'sessions', 'session'),
(14, 'userapp', 'adreess'),
(7, 'userapp', 'login'),
(8, 'userapp', 'register');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-23 16:45:48.108812'),
(2, 'auth', '0001_initial', '2021-09-23 16:46:00.361740'),
(3, 'admin', '0001_initial', '2021-09-23 16:46:03.236577'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-09-23 16:46:03.299408'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-23 16:46:03.488244'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-09-23 16:46:04.540193'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-09-23 16:46:04.916603'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-09-23 16:46:05.274526'),
(9, 'auth', '0004_alter_user_username_opts', '2021-09-23 16:46:05.374258'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-09-23 16:46:06.197623'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-09-23 16:46:06.281873'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-09-23 16:46:06.391579'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-09-23 16:46:06.667179'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-09-23 16:46:06.931567'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-09-23 16:46:07.098262'),
(16, 'auth', '0011_update_proxy_permissions', '2021-09-23 16:46:07.158102'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-09-23 16:46:07.321455'),
(18, 'sessions', '0001_initial', '2021-09-23 16:46:08.066993'),
(19, 'userapp', '0001_initial', '2021-09-23 16:46:10.206173'),
(20, 'userapp', '0002_alter_register_usr_gender', '2021-09-23 16:46:10.303496'),
(21, 'userapp', '0003_login_usr_role', '2021-09-23 16:46:10.484469'),
(22, 'userapp', '0004_auto_20210923_2007', '2021-09-23 16:46:11.657411'),
(23, 'userapp', '0005_login_register', '2021-09-23 16:46:14.884498'),
(24, 'adminapp', '0001_initial', '2021-09-23 16:49:00.555053'),
(25, 'adminapp', '0002_country', '2021-09-27 06:27:04.572353'),
(26, 'userapp', '0006_adreess', '2021-09-27 06:51:25.635174'),
(27, 'payment', '0001_initial', '2021-09-29 06:08:18.223118'),
(28, 'payment', '0002_payment', '2021-09-30 14:22:54.563968'),
(29, 'payment', '0003_order', '2021-10-03 17:19:37.396670'),
(30, 'payment', '0004_orderpay', '2021-10-04 06:40:14.361465'),
(31, 'payment', '0005_rename_payment_id_orderpay_paymentid', '2021-10-04 07:28:05.118697'),
(32, 'payment', '0006_rename_paymentid_orderpay_pay', '2021-10-04 07:33:17.117016'),
(33, 'payment', '0007_auto_20211004_1948', '2021-10-04 14:19:39.808572'),
(34, 'userapp', '0007_remove_register_usr_phone', '2021-10-05 06:10:34.273099');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('58k9psjmyidif2hwbxn7jnaevy2q2kls', 'eyJ1c2VyaWQiOjIxfQ:1mY3ny:nRXciVopHgH9cl1eqdNfBjux__bUc2ASZpTZkIr3Grw', '2021-10-20 10:05:42.356191'),
('5ew1vckpf12x1ymjg2z8flg075i31xd6', 'eyJ1c2VyaWQiOjF9:1mX4mM:dtcdTfdLl9Lo3n65G_Evetqdicbuv5jElSjBkVzbrQE', '2021-10-17 16:55:58.011244'),
('73tb5r5tbira2gyhil5bw850zo5t0qmz', 'eyJ1c2VyaWQiOjJ9:1mVvW7:8TwVkzjfgJ2e1OW-RLiNQ_BkVEahiKw3-El3WRZdE1Y', '2021-10-14 12:50:27.593585'),
('82jyjbqumo1knwdh2nguuna2r5jxiwk3', 'eyJ1c2VyaWQiOjF9:1mYDjZ:2Nhm-8SnVQjrlEMnPJeMkEpBOrgdWdqQrP34rz_yFfI', '2021-10-20 20:41:49.771122'),
('8uijctxs150ehp1cm4fi6jiri2gpl0yi', 'eyJ1c2VyaWQiOjJ9:1mUVIr:L6nm4OcHZ_7QW2i-9ugVsSgypKS7TyzN43JZnSIHbRc', '2021-10-10 14:38:53.301451'),
('8uxuixn8hqmftepc05mqp193mlk086q2', 'eyJ1c2VyaWQiOjF9:1mWZtk:jKzDUAlYHbJ5GRDhqiOrLdR2f_pJndffv5lmEavXtL4', '2021-10-16 07:57:32.037773'),
('abqso30caaqt4yl98lr95ojp4qavbqvf', 'eyJ1c2VyaWQiOjF9:1mWZaL:uAdqVCvV0HRlZwIsnR21P3skl0YaS1QJsit2Q1grBLo', '2021-10-16 07:37:29.835495'),
('bbyuwh4df5arw7iqq20if1s1w1vpwo6a', 'eyJ1c2VyaWQiOjJ9:1mVsfe:4KkcVUGdpbxt4nRMLT8-JORH4KWlqRe3OBFK9jFr9kw', '2021-10-14 09:48:06.762009'),
('bj5stv2v448htrnlqvg89pa2ephuvyj9', 'eyJ1c2VyaWQiOjIxfQ:1mYDll:UxAi46QvIq9h47Bpuu-Wt_rXN9_n_RW8mZVFwPYDyw4', '2021-10-20 20:44:05.424379'),
('btnis9fbtd4cnid5mvrq93hpond8hy39', 'eyJ1c2VyaWQiOjF9:1mXIUH:mh2wenEKQWuhZKOwzovlFD9xZCDT4ahKsGRo7J2ymyQ', '2021-10-18 07:34:13.614611'),
('cbk3plek0swqi47sutu471cl143de6uq', 'eyJ1c2VyaWQiOjF9:1mWi2C:m1jPNNPlCGD8BWC52ZfehsR5MtXQjomhAHsofb-_2Ag', '2021-10-16 16:38:48.557020'),
('h8ocmrhnx43jwj9yr9v800gigz0zpd20', 'eyJ1c2VyaWQiOjF9:1mU1sj:6SfetkdIa-rqukMJEU4LETIO1Lx1_qY4n9dRInJaeyc', '2021-10-09 07:13:57.207785'),
('hfxcv323coipftpwthgqs97sw8mc0mz3', 'eyJ1c2VyaWQiOjJ9:1mUidy:TV0vtT-1uJjG2CGn5D3eFw-a0iS1F22WU2VFuVCeOO4', '2021-10-11 04:53:34.523537'),
('hqkvqxs5q33q168sbmfsxcl93esnebvp', 'eyJ1c2VyaWQiOjJ9:1mUnSg:yl2IhUG36B3JdX9rPcoeeYQVKqWi97dTLsKuxjVk-hs', '2021-10-11 10:02:14.084905'),
('kgdr73myvs89m6gq9uwhawqp9fijfrlx', 'eyJ1c2VyaWQiOjF9:1mURU9:UMN2H5-8qS7CoRF3jGdPQnGhtCviyGSzNzPyJJfM6ks', '2021-10-10 10:34:17.571543'),
('li81t6zk4jfcz7y3gfhi54rgyeu019ln', 'eyJ1c2VyaWQiOjF9:1mU1Cy:9XYsJuQdlC9W12qZAlpEguRbvFvg0rDyY6N6VsgJEgA', '2021-10-09 06:30:48.845812'),
('pyfh3x72cb7gx9r86wxb2z85n8unr82p', 'eyJ1c2VyaWQiOjJ9:1mUt9d:Bvih7xwpA_Fn-c-T82-JgdGRxIeuccsPpMhSd-vvMHc', '2021-10-11 16:06:57.784999'),
('r9o5nv0edbdzi4boyhzvbis7a9g2i1yi', 'eyJ1c2VyaWQiOjJ9:1mUVD7:KqQl-rgSybF5qQppAMJt0lh0W3LStjDJdxRo2hMpn4g', '2021-10-10 14:32:57.280248'),
('rjj0h3516tviiej1bd4oerpq6jcbu0cj', 'eyJ1c2VyaWQiOjV9:1mWBAV:gnR2Q0wSyEmXk7k0hBBo18lznc2x_Gcpg26Yu_P3Mu8', '2021-10-15 05:33:11.417401'),
('ry1w49v97b7x3sw6l7xgculq3mjlz2b6', 'eyJ1c2VyaWQiOjF9:1mTg1c:HDfsMYVctqF2UwID3-yKpyJl-7nYYcIK_TGVm8bhi_k', '2021-10-08 07:53:40.240622'),
('snmb6fljx1h9gb43niiimswspxzqdhg0', 'eyJ1c2VyaWQiOjF9:1mXOHq:J8nzxBFtKEjAscY9vVu4rTsz-Zl2MnLiuxnmaRgMxP4', '2021-10-18 13:45:46.514842'),
('szbik0p29vbe1dq5kvs16ynreas54atg', 'eyJ1c2VyaWQiOjJ9:1mVTVM:sKnhIwGCUdgBIo3TNf_bpOfm_CzrOUbFyWnECW_65PE', '2021-10-13 06:55:48.685245'),
('u7z86ftcqxw2p2j6z4solvpi6najcpbc', 'eyJ1c2VyaWQiOjF9:1mWiS6:u-Q6yvs7TRgM9hEskyHtu5xa1-oQLbbnvwPBVbWzp6k', '2021-10-16 17:05:34.886135'),
('uipp531o54rlw0irg4y7ncklkx7hlrnm', 'eyJ1c2VyaWQiOjF9:1mTS3g:affPEfdoHZnELKCfaDlCk1JXKUMOSv8KQP2bp8E-Xyk', '2021-10-07 16:58:52.830175'),
('wp6z9hlxd1ccs45acjhkl2zda22bpqsv', 'eyJ1c2VyaWQiOjJ9:1mVzIV:4gXlbIpGnCE9FSfxWVe-tRfH7T_3UO5UL1AS8ks1h7o', '2021-10-14 16:52:39.135100'),
('xruos63exmp5h4njmuew0aevfsnf1o8k', 'eyJ1c2VyaWQiOjJ9:1mVa1T:FOcmPwokaWSggzBRH_QDVZl8IltklosZoWh1r0zml4c', '2021-10-13 13:53:23.249285'),
('ze9dfudl9tyj4jbiu4woz3n00b6jl7fw', 'eyJ1c2VyaWQiOjJ9:1mVRKq:9aJLSGGjPSZRbuOyLCw7oXdpIr3N8x7AqTpW0nt2Sps', '2021-10-13 04:36:48.869154');

-- --------------------------------------------------------

--
-- Table structure for table `payment_order`
--

CREATE TABLE `payment_order` (
  `id` bigint(20) NOT NULL,
  `order_status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_order`
--

INSERT INTO `payment_order` (`id`, `order_status`) VALUES
(1, 'order confirmed'),
(5, 'Shipped'),
(6, 'Out of delivery'),
(7, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `payment_payment`
--

CREATE TABLE `payment_payment` (
  `id` bigint(20) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `proid_id` bigint(20) NOT NULL,
  `userid_id` bigint(20) NOT NULL,
  `orderstatus_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_payment`
--

INSERT INTO `payment_payment` (`id`, `amount`, `payment_id`, `paid`, `proid_id`, `userid_id`, `orderstatus_id`) VALUES
(13, 75000, 'order_I5zBhBQlRKqWgR', 1, 4, 13, 7),
(14, 17000, 'order_I60TjgTnSMRI9N', 1, 6, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userapp_adreess`
--

CREATE TABLE `userapp_adreess` (
  `id` bigint(20) NOT NULL,
  `ad_state` varchar(150) NOT NULL,
  `ad_adres1` varchar(150) NOT NULL,
  `ad_adres2` varchar(150) NOT NULL,
  `ad_town` varchar(150) NOT NULL,
  `ad_pin` bigint(20) NOT NULL,
  `ad_phone` bigint(20) NOT NULL,
  `ad_countryid_id` bigint(20) NOT NULL,
  `ad_userid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userapp_adreess`
--

INSERT INTO `userapp_adreess` (`id`, `ad_state`, `ad_adres1`, `ad_adres2`, `ad_town`, `ad_pin`, `ad_phone`, `ad_countryid_id`, `ad_userid_id`) VALUES
(7, 'kerala', 'Obere Str. 57', 'aaaaaa', 'ernakulam', 9087, 10300074321, 1, 13),
(8, 'kerala', 'apartment new', 'kochi', 'kochi', 876543, 9087654312, 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `userapp_login`
--

CREATE TABLE `userapp_login` (
  `id` bigint(20) NOT NULL,
  `usr_email` varchar(254) NOT NULL,
  `usr_passw` varchar(150) NOT NULL,
  `usr_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userapp_login`
--

INSERT INTO `userapp_login` (`id`, `usr_email`, `usr_passw`, `usr_role`) VALUES
(1, 'admin', 'admin', 0),
(21, 'ayana123@gmail.com', 'ayana@123', 1),
(22, 'meera@gmail.com', 'meera@123', 1),
(23, 'maria@gmail.com', 'maria@123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userapp_register`
--

CREATE TABLE `userapp_register` (
  `id` bigint(20) NOT NULL,
  `usr_name` varchar(150) NOT NULL,
  `usr_gender` int(11) NOT NULL,
  `usr_loginid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userapp_register`
--

INSERT INTO `userapp_register` (`id`, `usr_name`, `usr_gender`, `usr_loginid_id`) VALUES
(13, 'Ayana Roy', 2, 21),
(14, 'meera ks', 2, 22),
(15, 'maria', 2, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_country`
--
ALTER TABLE `adminapp_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_manufctr`
--
ALTER TABLE `adminapp_manufctr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminapp_product_manuf_id_8c045f99_fk_adminapp_manufctr_id` (`manuf_id`),
  ADD KEY `adminapp_product_protype_id_108bc17e_fk_adminapp_producttype_id` (`protype_id`);

--
-- Indexes for table `adminapp_producttype`
--
ALTER TABLE `adminapp_producttype`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminapp_producttype_cat_id_e7c98553_fk_adminapp_category_id` (`cat_id`);

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- Indexes for table `payment_order`
--
ALTER TABLE `payment_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_payment`
--
ALTER TABLE `payment_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_payment_proid_id_efa8d6ce_fk_adminapp_product_id` (`proid_id`),
  ADD KEY `payment_payment_userid_id_b9212197_fk_userapp_register_id` (`userid_id`),
  ADD KEY `payment_payment_orderstatus_id_6b468c0d_fk_payment_order_id` (`orderstatus_id`);

--
-- Indexes for table `userapp_adreess`
--
ALTER TABLE `userapp_adreess`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userapp_adreess_ad_countryid_id_7e29f5bc_fk_adminapp_country_id` (`ad_countryid_id`),
  ADD KEY `userapp_adreess_ad_userid_id_1b18f169_fk_userapp_register_id` (`ad_userid_id`);

--
-- Indexes for table `userapp_login`
--
ALTER TABLE `userapp_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userapp_register`
--
ALTER TABLE `userapp_register`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userapp_register_usr_loginid_id_300cff88_fk_userapp_login_id` (`usr_loginid_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminapp_category`
--
ALTER TABLE `adminapp_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `adminapp_country`
--
ALTER TABLE `adminapp_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `adminapp_manufctr`
--
ALTER TABLE `adminapp_manufctr`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `adminapp_producttype`
--
ALTER TABLE `adminapp_producttype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payment_order`
--
ALTER TABLE `payment_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_payment`
--
ALTER TABLE `payment_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userapp_adreess`
--
ALTER TABLE `userapp_adreess`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `userapp_login`
--
ALTER TABLE `userapp_login`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `userapp_register`
--
ALTER TABLE `userapp_register`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminapp_product`
--
ALTER TABLE `adminapp_product`
  ADD CONSTRAINT `adminapp_product_manuf_id_8c045f99_fk_adminapp_manufctr_id` FOREIGN KEY (`manuf_id`) REFERENCES `adminapp_manufctr` (`id`),
  ADD CONSTRAINT `adminapp_product_protype_id_108bc17e_fk_adminapp_producttype_id` FOREIGN KEY (`protype_id`) REFERENCES `adminapp_producttype` (`id`);

--
-- Constraints for table `adminapp_producttype`
--
ALTER TABLE `adminapp_producttype`
  ADD CONSTRAINT `adminapp_producttype_cat_id_e7c98553_fk_adminapp_category_id` FOREIGN KEY (`cat_id`) REFERENCES `adminapp_category` (`id`);

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_payment`
--
ALTER TABLE `payment_payment`
  ADD CONSTRAINT `payment_payment_orderstatus_id_6b468c0d_fk_payment_order_id` FOREIGN KEY (`orderstatus_id`) REFERENCES `payment_order` (`id`),
  ADD CONSTRAINT `payment_payment_proid_id_efa8d6ce_fk_adminapp_product_id` FOREIGN KEY (`proid_id`) REFERENCES `adminapp_product` (`id`),
  ADD CONSTRAINT `payment_payment_userid_id_b9212197_fk_userapp_register_id` FOREIGN KEY (`userid_id`) REFERENCES `userapp_register` (`id`);

--
-- Constraints for table `userapp_adreess`
--
ALTER TABLE `userapp_adreess`
  ADD CONSTRAINT `userapp_adreess_ad_countryid_id_7e29f5bc_fk_adminapp_country_id` FOREIGN KEY (`ad_countryid_id`) REFERENCES `adminapp_country` (`id`),
  ADD CONSTRAINT `userapp_adreess_ad_userid_id_1b18f169_fk_userapp_register_id` FOREIGN KEY (`ad_userid_id`) REFERENCES `userapp_register` (`id`);

--
-- Constraints for table `userapp_register`
--
ALTER TABLE `userapp_register`
  ADD CONSTRAINT `userapp_register_usr_loginid_id_300cff88_fk_userapp_login_id` FOREIGN KEY (`usr_loginid_id`) REFERENCES `userapp_login` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
