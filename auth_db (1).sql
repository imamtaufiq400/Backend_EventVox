-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2023 pada 07.04
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auth_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bidang_user`
--

CREATE TABLE `bidang_user` (
  `id_bidang_user` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_kategori` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE `divisi` (
  `id_divisi` int(10) NOT NULL,
  `nama_divisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `domisili`
--

CREATE TABLE `domisili` (
  `id_domisili` int(10) NOT NULL,
  `kota_provinsi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `promotor` varchar(50) NOT NULL,
  `jenisevent` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `linkmaplokasi` varchar(255) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `quantity` int(99) NOT NULL,
  `deskripsi` varchar(2000) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `event`
--

INSERT INTO `event` (`id`, `uuid`, `name`, `gambar`, `price`, `promotor`, `jenisevent`, `lokasi`, `linkmaplokasi`, `tanggal`, `quantity`, `deskripsi`, `userId`, `createdAt`, `updatedAt`) VALUES
(12, '4402bc33-ae39-42e4-8b15-893c49ec3091', 'Event Konser ColdPlay', '', 250000, '', '', '', '', '', 0, '', 4, '2023-06-12 15:05:41', '2023-06-12 15:05:41'),
(13, 'ab479fc3-6ba9-4a52-b68a-ea4150ebdc40', 'Event Konser ColdPlay', '', 250000, '', '', '', '', '', 0, '', 4, '2023-06-12 15:05:52', '2023-06-12 15:05:52'),
(14, '5c1110dc-492e-4520-bdc2-2037b5f1a16f', 'Event Konser ColdPlay', '', 250000, 'eojfajflajf', '', 'eojfajflajf', '', 'eojfajflajf', 0, '', 1, '2023-06-14 07:02:53', '2023-06-14 07:02:53'),
(15, '1b84ffc9-8256-4549-b330-93579f5e4014', 'Event Konser ColdPlay', '', 250000, 'YangMahaKuasa', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-14 07:03:59', '2023-06-14 07:03:59'),
(17, 'a60de80b-f690-4f03-8e21-7e2121786ab6', 'Event Konser ColdPlay', '', 250000, 'YangMahaKuasa', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-15 07:50:29', '2023-06-15 07:50:29'),
(18, '5618408c-f3a4-4a59-ab18-c93b094bf955', 'Event Konser ColdPlay', '', 250000, 'YangMahaKuasa', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-15 08:28:35', '2023-06-15 08:28:35'),
(19, '7cc40917-b8a3-407a-aa65-2689c20129ce', 'Event Konser ColdPlay 123', '', 300000, 'YangMahaKuasa', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-15 08:30:09', '2023-06-16 03:53:32'),
(20, 'f1532fe1-7db1-4f63-8f84-7d65cce80542', 'Event Konser Kangenband kaliwungu', '', 200000, 'YangMauMauAja', '', 'surabaya', '', '20-10-2024', 0, '', 4, '2023-06-15 08:36:14', '2023-06-15 08:36:14'),
(21, '42b1ad7d-9de4-4d39-be4e-6d3ef16771f6', 'Event Konser Kangenband kaliwungu', '', 200000, 'YangMauMauAja', '', 'surabaya', '', '20-10-2024', 0, '', 4, '2023-06-16 03:49:32', '2023-06-16 03:49:32'),
(22, 'd752bf2f-d0f4-45c2-a123-7ed920a32a8c', 'Event Konser Kangenband kaliwungu', '', 200000, 'YangMauMauAja', '', 'surabaya', '', '20-10-2024', 0, '', 4, '2023-06-16 09:16:32', '2023-06-16 09:16:32'),
(23, '2202eaea-dc5b-4979-a4a7-f484b245dde2', 'Event Konser Kangenband 123 kaliwungu', '', 200000, 'YangMauMauAja', '', 'surabaya', '', '20-10-2024', 0, '', 4, '2023-06-16 09:19:13', '2023-06-16 09:19:13'),
(24, '0cc2697b-5c32-4062-937b-d9a433125a3b', 'Event Konser alditaher', '', 15000, 'YangMauMauAja', '', 'bandung', '', '21-12-2024', 0, '', 5, '2023-06-19 10:21:03', '2023-06-19 10:21:03'),
(25, 'b03e1a1c-3665-4f47-9439-ac8d17a146c2', 'Event Konser For Revenge', '', 10000, 'JadiinAjaDulu', '', 'batam', '', '21-12-2024', 1000, '', 5, '2023-06-20 08:48:19', '2023-06-20 08:48:19'),
(26, '19460b3a-b3bd-43ed-8d73-4906c27dedb5', 'konser', 'event1.jpg', 2000, 'insyaallahbisa', '', 'batam', '', '21-02-2024', 1000, '', 5, '2023-06-23 07:36:57', '2023-06-23 07:36:57'),
(27, 'ccf7b0ec-36d8-4e37-97d6-693824515495', 'konser', 'event1.jpg', 2000, 'insyaallahbisa', 'edukasi', 'batam', 'dbhakdkjajkdsajkd', '21-02-2024', 1000, 'ini adalah event bladksjdahkjdhsadkahkdjkasjdkahfkjjjalsdhjksah', 5, '2023-06-23 08:25:17', '2023-06-23 08:25:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`sid`, `expires`, `data`, `createdAt`, `updatedAt`) VALUES
('0DXm-fLDa2rf5w5RDAc9PhCf_1QIetak', '2023-06-24 04:07:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:07:29', '2023-06-23 04:07:29'),
('0eAyYB_7pt0BFqu0dt1jX-4p2iNEg4DM', '2023-06-24 07:50:12', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:50:12', '2023-06-23 07:50:12'),
('1N5CbsW-88I4NMwQGHDbkf24DxVF5o4z', '2023-06-24 03:59:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:59:16', '2023-06-23 03:59:16'),
('1sgEBUaeFJXssuSOXGHbd_Rf_KriGgwX', '2023-06-24 03:38:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:38:05', '2023-06-23 03:38:05'),
('40pxEQFiHhN0Iwid6fkFKeHGFK3o3X3g', '2023-06-24 04:06:23', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:06:23', '2023-06-23 04:06:23'),
('4IyyiYcqBc9iZbc59KaHwOv-E06jzHyq', '2023-06-24 07:50:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:50:57', '2023-06-23 07:50:57'),
('4jV20dRzqmHk08nltU_CpnlkEq0fM4jQ', '2023-06-24 03:27:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:27:25', '2023-06-23 03:27:25'),
('5eePF81GAwecU_656qrOu08qau5HAX7F', '2023-06-24 08:07:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:07:34', '2023-06-23 08:07:34'),
('5VX7xZIdVv5jxMqcNpnxLambvtz6nZjD', '2023-06-24 08:09:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:09:47', '2023-06-23 08:09:47'),
('6xhmAfpE5zLqfCXYokrWEQIIQjG6LTzH', '2023-06-24 03:30:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:30:25', '2023-06-23 03:30:25'),
('7L35PzzFpqHW-Ei1uVAwBMB5w5n9StLo', '2023-06-24 07:22:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"6fd22e07-9812-4da2-b0ac-0325fa6140d3\",\"me\":5}', '2023-06-23 06:43:09', '2023-06-23 07:22:24'),
('bLI2bywyHzynyKIZ-gR1hA5n4gs36Can', '2023-06-24 07:58:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:58:47', '2023-06-23 07:58:47'),
('bZEI7hcViHKpGovgyt91Fw_hfK92on9l', '2023-06-24 07:54:02', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:54:02', '2023-06-23 07:54:02'),
('B_dEbQDmvdyIhbxvV99WUImiv0rgQsPR', '2023-06-24 03:25:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:25:38', '2023-06-23 03:25:38'),
('c5aaJ-7ntVfP4D5KfrVMb-MYui0fXpE3', '2023-06-24 03:52:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:52:27', '2023-06-23 03:52:27'),
('cDi-f0mdHu4_RACaZJiiJIfBwUKHpKlg', '2023-06-24 03:51:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:51:33', '2023-06-23 03:51:33'),
('COYT397ltdw9IlBx8bpPG-zrdkZ-myVw', '2023-06-24 03:53:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:53:36', '2023-06-23 03:53:36'),
('Cx5l-v4d_g4LTq7uzc61KM_fOfbCjX_O', '2023-06-24 07:45:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:45:32', '2023-06-23 07:45:32'),
('dLPQ08Aztl8O6H3IDLFcAMwcAZuSzOIW', '2023-06-24 03:52:16', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:52:16', '2023-06-23 03:52:16'),
('Ec4sS8pNAAJGHnnSOhUKY6juIykjeJlg', '2023-06-24 04:06:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:06:43', '2023-06-23 04:06:43'),
('epSCYGLU2819kiX-RS6VmmKselqRShHF', '2023-06-24 03:25:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:25:28', '2023-06-23 03:25:28'),
('ezdSZw4c_sBzCx7UI3PyQapmRndHGlXB', '2023-06-24 03:29:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:29:05', '2023-06-23 03:29:05'),
('fdsafy9pakFbDMhLIGiMwxi7UYffKOrO', '2023-06-23 09:27:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:27:18', '2023-06-22 09:27:18'),
('fQpCm-LWo0Ig4ahny3ICJGP6hocQ9_B5', '2023-06-24 07:56:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:56:44', '2023-06-23 07:56:44'),
('gCQSzKWyPCHw6MirP1wVPIbboGsouBJ-', '2023-06-24 04:07:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:07:00', '2023-06-23 04:07:00'),
('GKOzea8BNs3gIWDJS4KN5CGXdU9m1tsf', '2023-06-24 07:54:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:54:40', '2023-06-23 07:54:40'),
('GSntXsLgMkGJiHHtYWUPIybq7uK5iTr7', '2023-06-23 09:27:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:27:50', '2023-06-22 09:27:50'),
('hG2mIiYO-DejlnH0D9-pdyFd13az88y1', '2023-06-23 09:40:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:40:03', '2023-06-22 09:40:03'),
('hhmfXVJ45Ug42AOFMTZlYHC34feuT-lT', '2023-06-23 09:39:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:39:26', '2023-06-22 09:39:26'),
('iY52sJmayCGGiZXpglY4K1AaTi0gORwH', '2023-06-24 03:34:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:34:31', '2023-06-23 03:34:31'),
('JHReSGGRDz8O5-cp_kdCL4JIDiT0E94Z', '2023-06-24 03:21:41', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:21:41', '2023-06-23 03:21:41'),
('jJmDIsxZiX7CDA9pluU7sA_Tjb5QNnrO', '2023-06-24 08:07:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:07:24', '2023-06-23 08:07:24'),
('jSC4mgt5Y5Ba_-_0jor0wWYp5ufYkS2B', '2023-06-24 08:07:59', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:07:59', '2023-06-23 08:07:59'),
('jXYs5i6o6a5btUqmmEfxLG9IQQSdfEhD', '2023-06-23 09:27:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:27:33', '2023-06-22 09:27:33'),
('KBMrM1IL1VrQu-YHQNMpZPWasgOSgGEO', '2023-06-24 08:05:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:05:40', '2023-06-23 08:05:40'),
('LGgfscCi2f6rSkuzJMJ0BTTjpYyWlejq', '2023-06-24 07:52:14', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:52:14', '2023-06-23 07:52:14'),
('LqitpEbiBGUX_oB3ZfRq6UxLzr_l4Wuh', '2023-06-24 04:02:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:02:25', '2023-06-23 04:02:25'),
('N5r3FQ72HkGEpWVB7_hBKCHIxmBd4brG', '2023-06-24 04:08:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:08:15', '2023-06-23 04:08:15'),
('NFolbBMQ81bZpmBLhbvO14TbCrz3Ad4d', '2023-06-24 03:28:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:28:41', '2023-06-23 03:28:41'),
('nHTLP3JTlKiXNNewVRXpwCq4htuPZn7o', '2023-06-24 14:48:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 14:47:58', '2023-06-23 14:48:29'),
('OSQJeubPXlhvLpp8FKh_OY0DmlsrxSF0', '2023-06-24 04:08:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:08:37', '2023-06-23 04:08:37'),
('OuKU2b4V5cyvSNgM8CGn9oGSpG8TBqAE', '2023-06-24 03:42:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:42:27', '2023-06-23 03:42:27'),
('pDrBoF4ZXQbSwdchzliWP89HpNopFcI6', '2023-06-24 08:04:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:04:38', '2023-06-23 08:04:38'),
('qJ7Sj7Ozv-OgO72agneS8D0ReGJVVSbe', '2023-06-24 03:54:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:54:31', '2023-06-23 03:54:31'),
('qNYY3FT9Clce1t4GDlKGSUA1Y657lbfd', '2023-06-24 08:07:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:07:09', '2023-06-23 08:07:09'),
('qvHh_PMI-wlGVHmPUL6x0yy53d8xS8ny', '2023-06-24 08:04:55', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:04:55', '2023-06-23 08:04:55'),
('ryI4AY-tqi_JZZ12WfKwNZAQwGGaE4D_', '2023-06-24 03:32:40', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:32:40', '2023-06-23 03:32:40'),
('R_I4fbHswL0YTtt967Qcty23CjV-yJYb', '2023-06-24 03:32:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:32:50', '2023-06-23 03:32:50'),
('Szzt76TOcS4z8L2kdeEFg_LE6XLJIDel', '2023-06-24 08:00:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:00:26', '2023-06-23 08:00:26'),
('ti-8pj-mGF3uuGpNmTmL2lKHoCkivXu2', '2023-06-24 03:37:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:37:06', '2023-06-23 03:37:06'),
('Tk8sIIFvpVOddHxES1BsDnmfbAjjxrt5', '2023-06-23 09:26:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:26:07', '2023-06-22 09:26:07'),
('tKYJWMjCWOu0qDUBxBE_-Ps66mzWYn1x', '2023-06-24 03:42:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:42:46', '2023-06-23 03:42:46'),
('UAXda8KGjpATOs5_zUeLiUMKHZNRBYOG', '2023-06-24 04:08:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:08:57', '2023-06-23 04:08:57'),
('UgGPPOgPdmsK_6AJKHlDWv8lkXC3sVas', '2023-06-23 09:28:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:28:18', '2023-06-22 09:28:18'),
('uIwAhzsy-6N5_UmIk2nTHIoMH571mS89', '2023-06-24 04:00:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:00:09', '2023-06-23 04:00:09'),
('uLLDp8F8wbTMyZZqZ059d_QODJyYsuNs', '2023-06-24 03:51:24', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:51:24', '2023-06-23 03:51:24'),
('uqz7lkJfvGVcU1UBsYWymmYL141HD7KW', '2023-06-24 14:52:32', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"6fd22e07-9812-4da2-b0ac-0325fa6140d3\",\"me\":5}', '2023-06-19 15:24:36', '2023-06-23 14:52:32'),
('URjMAkgGazG64gPSy21FMGCYhXYvB7Gj', '2023-06-24 04:05:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:05:37', '2023-06-23 04:05:37'),
('vB6zIsSrPljw7V7GGgClrNG36e8mGvrK', '2023-06-24 03:32:35', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:32:35', '2023-06-23 03:32:35'),
('vjqhiH0uHmWfjs3laWCGni5vCdZ2R0Vw', '2023-06-24 08:40:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"6fd22e07-9812-4da2-b0ac-0325fa6140d3\",\"me\":5}', '2023-06-23 07:32:37', '2023-06-23 08:40:57'),
('vlsh-473qYdfrTBaBm7fdaPTflB0ZuAp', '2023-06-23 09:25:36', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-22 09:25:37', '2023-06-22 09:25:37'),
('VM7EioDz4n67YmtnMA7xwH_k4O0cqu02', '2023-06-24 08:02:18', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:02:18', '2023-06-23 08:02:18'),
('W47p6vLaE1RBuUTMecqjV-Ax8Ch3BoQT', '2023-06-24 03:59:43', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:59:43', '2023-06-23 03:59:43'),
('wcoA51dKkWNYhjZcJyduLMd8uWDK6Mys', '2023-06-24 14:27:38', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 14:27:39', '2023-06-23 14:27:39'),
('wgBJ6hzTUIxKH6_ZIvf_G1XMGr_72fOs', '2023-06-24 07:56:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:56:52', '2023-06-23 07:56:52'),
('xJokWUgOHlk0N61ij1724kkuLadV5_0H', '2023-06-24 07:58:34', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:58:35', '2023-06-23 07:58:35'),
('XvpYkD6aPk9pxUUAKcAd6Z4SrEVLopEy', '2023-06-24 08:05:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 08:05:46', '2023-06-23 08:05:46'),
('yExziaKUohoP4eVANfmKZMNgHeT-6Va7', '2023-06-24 08:08:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"1656b93a-7b5a-4fa9-8974-0dbef8fa477f\",\"me\":12}', '2023-06-23 03:25:29', '2023-06-23 08:08:00'),
('yrsLgKoyYky8IXjdGcLcSsnQ5HCjSllp', '2023-06-24 03:35:29', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:35:29', '2023-06-23 03:35:29'),
('zcnm2PfrZl41j8RIQlLFG2H7Sm-biDqe', '2023-06-24 07:53:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 07:53:44', '2023-06-23 07:53:44'),
('ZHJuzxLpOYkfGsdNxyieLb8gjF4kpC9O', '2023-06-24 03:30:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:30:07', '2023-06-23 03:30:07'),
('zKA2A6_0z-m7yJHZDfnD_Gix_t_212yS', '2023-06-24 03:51:50', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:51:50', '2023-06-23 03:51:50'),
('ZtWnZlCmGPte_s5vf3-82Q1oEwFh8q89', '2023-06-24 03:38:48', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:38:48', '2023-06-23 03:38:48'),
('_e-Dwe-p7Dd2kttwgHpAS1MIpNpyn8im', '2023-06-23 09:40:05', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":\"0d87642e-ab84-453e-9f53-8d1066503dab\",\"me\":1}', '2023-06-22 09:10:24', '2023-06-22 09:40:05'),
('_L5zAkeEj7edbt8x9AZR9mxwcg9MBGsO', '2023-06-24 04:09:15', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 04:09:15', '2023-06-23 04:09:15'),
('_LazpYKywGZh81YfsmM03yIqZOrbl4ZH', '2023-06-24 03:31:17', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2023-06-23 03:31:17', '2023-06-23 03:31:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `eventLokasi` varchar(255) NOT NULL,
  `eventTanggal` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `EventId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ticket`
--

INSERT INTO `ticket` (`id`, `uuid`, `number`, `eventName`, `eventLokasi`, `eventTanggal`, `userId`, `createdAt`, `updatedAt`, `EventId`) VALUES
(1, 'bbf69594-544b-4660-8361-c4ca0aeb6b59', '1', 'Event Konser ColdPlay 123', 'Batam, Kepulauan Riau', 20, 1, '2023-06-20 14:37:14', '2023-06-20 14:37:14', NULL),
(2, '7fe7f535-4b14-40f8-8715-a1b30e78be29', '1', 'Event Konser ColdPlay 123', 'Batam, Kepulauan Riau', 20, 1, '2023-06-20 15:39:16', '2023-06-20 15:39:16', NULL),
(3, '427b650f-74ea-41da-8b95-9ca8c80c1173', '2', 'Event Konser ColdPlay 123', 'Batam, Kepulauan Riau', 20, 1, '2023-06-20 15:40:38', '2023-06-20 15:40:38', NULL),
(4, '62ce447b-fe7a-480a-8922-b84cd3b0e178', '4', 'Event Konser ColdPlay 123', 'Batam, Kepulauan Riau', 20, 5, '2023-06-20 16:15:20', '2023-06-20 16:15:20', NULL),
(5, '1a489625-7221-4be7-8967-e29d632c616c', '6', 'Event Konser ColdPlay 123', 'Batam, Kepulauan Riau', 20, 5, '2023-06-21 07:19:23', '2023-06-21 07:19:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(200) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `nomorTelepon` int(99) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `username`, `gambar`, `nomorTelepon`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(1, '0d87642e-ab84-453e-9f53-8d1066503dab', 'Imam Taufiq', '', '', 0, 'admin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$ovhtNTXk/JII45EcKaB2Rw$JFLkocEdevZlz7ue8GWflXPZgC6MHNaFRFU5c+aIM4c', 'admin', '2023-06-11 14:45:09', '2023-06-11 14:45:09'),
(4, '1e574a91-c3ad-49f7-9373-1fa733cc8365', 'Makmum', '', '', 0, 'makmum@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$YZ1shgT9eFElm/wllSvP6w$jKka5NE+J5sPPB1JBrbmPC6TZN2eUjoLHZqhfoHNDzI', 'user', '2023-06-11 15:54:43', '2023-06-11 15:54:43'),
(5, '6fd22e07-9812-4da2-b0ac-0325fa6140d3', 'Makmum versi lima', 'fathur', '', 0, 'makmum123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$O6uERRjMkrGe91x44oEnaw$ImXRIoMzSilOqFNweNA5OXn3ddBsAWqlyBfEh4IHsmA', 'user', '2023-06-19 10:17:15', '2023-06-23 14:45:09'),
(6, '9090747f-7e12-49b3-90a2-d7c292cabc1c', 'fathur rohman 123', 'fathur 123', '', 0, 'fathurrohman123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$uclkWLxhuHjF1OQA2OVLew$p9DoMStC/fd2HG2BhnabHxu0uTObWuVoYu5F5xbgfVI', 'user', '2023-06-21 17:38:11', '2023-06-21 17:38:11'),
(7, '07c1a028-cd95-4497-98e6-60103553e6f1', 'joko', 'joko', '', 0, 'joko@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$GaAosEROLicMrhDFhqzYtA$3RSU/OS9he0HoBlJnEDpsqeRb3vZfddsx046zYpN/lc', 'user', '2023-06-21 17:47:24', '2023-06-21 17:47:24'),
(8, 'd4f4acba-98a1-49b2-bf7c-494a52c7172f', 'fathur rohman 123', 'fathur 123', '', 2147483647, 'fathurrohman123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$fkMWjRdHv6MeShvwJ68KfQ$E6hbTLbGcosY8ZW7nuNXIuOkKSVkiuNLh4RHQdMM7hc', 'user', '2023-06-22 08:58:23', '2023-06-22 08:58:23'),
(9, '762ed666-49d0-40c0-b619-b98f85e36b35', 'fathur rohman 123', 'fathur 123', '', 2147483647, 'fathurrohman123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HwckaRZJGwb/S9j+U5lBYA$xdHbZPn+Hd23PEKNg+jx8np+qc1YdZzja4jOLpSEhjk', 'user', '2023-06-22 09:23:09', '2023-06-22 09:23:09'),
(10, '76656c23-65a7-49f1-8e26-64308c421edf', 'fathur rohman 123', 'fathur 123', '', 2147483647, 'fathurrohman123@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$S/+4n/slN5zqHSrylsi/lA$euJ9asPYguEoioYACJRKc2Zm5NA1h3DgIox0tqH+iWQ', 'promotor', '2023-06-22 09:25:39', '2023-06-22 09:25:39'),
(11, 'cab25df9-8b92-40c8-987f-cbd4536193ac', 'saya', 'saya', '', 812345678, 'sayajuga@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$HmsN4rt6N7NBKGt8tjIpXA$eOXpi+DVfs3U6ppRcsAM0IDt3SX9H8wguXmC4rqspgM', 'promotor', '2023-06-22 09:28:18', '2023-06-22 09:28:18'),
(12, '1656b93a-7b5a-4fa9-8974-0dbef8fa477f', 'joni', 'joni', '', 812345678, 'joni@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$0u1xsLUP+LovQN/Uwann7g$J1xRD3GAlw/yv/QiWgBLJmmoEl07bFSRMoPdCbUVZLg', 'promotor', '2023-06-23 04:08:58', '2023-06-23 04:08:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `volunteer`
--

CREATE TABLE `volunteer` (
  `id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `promotor` varchar(255) NOT NULL,
  `jeniskegiatan` varchar(99) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `linkmaplokasi` varchar(2555) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `quantity` int(99) NOT NULL,
  `deskripsi` varchar(2000) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `volunteer`
--

INSERT INTO `volunteer` (`id`, `uuid`, `name`, `gambar`, `promotor`, `jeniskegiatan`, `lokasi`, `linkmaplokasi`, `tanggal`, `quantity`, `deskripsi`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, '332d59d9-b763-48bb-a076-0ad49cab9a55', 'Volunteer Konser Kangen Band', '', 'YangMahaKuasa', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-19 08:26:08', '2023-06-19 08:26:08'),
(2, 'da68c961-632e-432d-ae1b-55a2d8e1b7bc', 'Volunteer Sapu jalan', '', 'Bismillah Sukses', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 1, '2023-06-19 08:28:05', '2023-06-19 08:28:05'),
(4, 'a9855685-b7cb-4883-b6d4-a7d61b0db233', 'Volunteer Kolpley', '', 'Bismillah Sukses', '', 'Batam, Kepulauan Riau', '', '20-05-2023', 0, '', 4, '2023-06-19 09:19:14', '2023-06-19 09:19:14'),
(5, 'ac975d9c-806a-4065-9f4b-658694ae7302', 'Volunteer alditaher', '', 'Bismillah Sukses', '', 'bandung', '', '21-12-2023', 0, '', 5, '2023-06-19 10:21:48', '2023-06-19 10:21:48'),
(6, 'd613a3d1-d31f-43eb-8172-c8ee790f3179', 'konser', '', 'insyaallahbisa', '', 'batam', '', '21-02-2024', 0, '', 5, '2023-06-23 07:40:13', '2023-06-23 07:40:13'),
(7, '2d6360ab-f42c-4f1d-9f36-5fd083ebb7c7', 'konser', '', 'insyaallahbisa', '', 'batam', '', '21-02-2024', 0, '', 5, '2023-06-23 08:25:10', '2023-06-23 08:25:10'),
(8, '55b4f0ce-66bb-4cc3-a990-dc2c5299370d', 'konser', 'event1.jpg', 'insyaallahbisa', 'sosial', 'batam', 'dbhakdkjajkdsajkd', '21-02-2024', 1000, 'ini adalah event bladksjdahkjdhsadkahkdjkasjdkahfkjjjalsdhjksah', 5, '2023-06-23 08:40:57', '2023-06-23 08:40:57');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indeks untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `EventId` (`EventId`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`EventId`) REFERENCES `event` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `volunteer`
--
ALTER TABLE `volunteer`
  ADD CONSTRAINT `volunteer_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
