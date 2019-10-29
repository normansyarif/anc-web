-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 29, 2019 at 03:57 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anc`
--

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `chat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pertanyaan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `pertanyaan`, `jawaban`, `created_at`, `updated_at`) VALUES
(1, '“Jika perut saya mulas seperti akan buang air besar, apakah itu pertanda bayi saya akan segera lahir?”', 'Belum tentu! Sakit buang air besar dan sakit ketika akan melahirkan tentu saja beda. Rasa mulas ketika melahirkan biasanya berlangsung secara progresif dan berlangsung setiap 10 menit sekali disertai dengan lendir dan darah. Rasa nyeri pada awalnya akan terasa pada bagian atas perut kemudian menjalar ke bagian bawah perut, bahkan ke arah bawah punggung dan belakang pinggang.', NULL, '2019-10-28 13:37:06'),
(5, '“Jika saya berhubungan intim pada bulan ke-9, apakah dokter atau bidan yang menangani saya akan mengetahui hal tersebut?”', 'Tentu saja tidak! Sekalipun usia kandungan Anda menginjak 9 bulan. Tetapi jika kehamilan Anda mengalami kelainan seperti letak plasenta berada di bawah atau pernah mengalami kontraksi dini, sebaiknya Anda tidak melakukan hubungan intim. Kandungan sperma yang bernama prostagladin dapat menimbulkan kontraksi, khususnya pada ibu-ibu yang sensitif dengan kandungan sperma tersebut.', '2019-10-28 03:10:19', '2019-10-28 13:36:40'),
(28, '“Puting saya terasa bengkak dan keras. Apa yang terjadi dengan payudara saya?”', 'Kondisi ini merupakan hal yang wajar. Payudara memang sudah membengkak pada bulan ketiga. Itu semua karena mekanisme hormonal estrogen dan progesteron sudah mulai meningkat dan otomatis akan memperbesar kelenjar payudara. Anda bisa mengompresnya dengan air hangat untuk mengurangi rasa sakit. Semua rasa sakit itu akan hilang usai melahirkan.', '2019-10-28 13:37:30', '2019-10-28 13:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forum_responses`
--

CREATE TABLE `forum_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `respon` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_09_003614_rename_email_to_user_number', 1),
(4, '2019_09_06_102859_remove_unncessary_columns_from_users', 2),
(5, '2019_10_19_223407_add_extra_fields_to_user', 3),
(6, '2019_10_20_090534_create_serba_serbi_table', 4),
(7, '2019_10_20_090548_create_forum_table', 4),
(8, '2019_10_20_090602_create_faq_table', 4),
(9, '2019_10_20_090939_create_forum_responses_table', 4),
(10, '2019_10_20_113045_add_photo_to_users', 5),
(11, '2019_10_21_161541_add_tanggal_lahir_to_user', 6),
(12, '2019_10_24_215226_create_chats_table', 7),
(13, '2019_10_27_205455_add_read_to_chats', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serba_serbi`
--

CREATE TABLE `serba_serbi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `konten` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mhs` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `serba_serbi`
--

INSERT INTO `serba_serbi` (`id`, `judul`, `konten`, `mhs`, `created_at`, `updated_at`) VALUES
(4, 'Video USG', '<iframe width=\"100%\" height=\"250px\" src=\"https://www.youtube.com/embed/6K9acnTYKzc\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2019-10-28 10:24:10', '2019-10-28 10:24:10'),
(5, 'Keluhan yang Sering Timbul Selama Hamil dan Cara Mengatasi', '<h6>Nafsu Makan Hilang</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Perubahan hormonal</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Motivasi diri ibu untuk memberikan nutrisi untuk bayi ibu. Kehamilan adalah karunia, tidak semua wanita diberi karunia untuk dapat hamil, sehingga diperlukan tanggung jawab untuk menerimanya.</li>\r\n          <li>Istimewanya hamil adalah terdapat makhluk hidup (janin) yang 100% tergantung ibunya</li>\r\n        </ol>\r\n\r\n        <h6>Mual dan Muntah (morning sickness)</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Hormonal, biasanya pada 3 bulan pertama, dapat terjadi kapan saja, pagi atau malam hari.</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Makan dengan porsi sedikit namun sering</li>\r\n          <li>Hindari makanan yang membuat ibu mual/muntah</li>\r\n          <li>Perbanyak minum diantara makan, jangan minum digabung dengan makan, karena akan membuat labung ibu terasa sangat penuh</li>\r\n          <li>Batasi kafein dan jangan meminum alcohol</li>\r\n          <li>Makanan kecil kering (biskuit, crackers, roti kering) sebelum bangun dari tempat tidur</li>\r\n          <li>Hindari makanan yang berlemak, berbumbu banyak, dan sukar dicerna</li>\r\n          <li>Bila keluhan menetap dapat dibantu dengan obat-obatan dengan terlebih dahulu konsultasi ke dokter. </li>\r\n        </ol>\r\n\r\n        <h6>Ngidam (pica)</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Tidak diketahui, diduga berhubungan dengan hormonal, tidak berbahaya dan akan hilang dengan dukungan lingkungan serta penerimaan kehamilan yang wajar</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Boleh diupayakan makan makanan yang diinginkan tersebut, tapi ibu harus tepat diet yang seimbang</li>\r\n          <li>Jangan makan makanan yang membahayakan janin ibu</li>\r\n        </ol>\r\n\r\n        <h6>Rasa penuh atau perut terbakar/gangguan pencernaan lainnya</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Bayi yang semakin lama semakin besar, menekan lambung ibu sehingga isi lambung terdorong ke atas.</li>\r\n        	<li>Perubahan hormon selama kehamilan menyebabkan lambatnya gerakan peristaltik usus, sehingga memperlambat waktu pengosongan lambung</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Hindari makanan yang menyebabkan ibu merasa kurang nyaman</li>\r\n          <li>Kurangi kafein</li>\r\n          <li>Posisi tubuh yang baik akan membantu pencernaan</li>\r\n          <li>Berjalan-jalan setelah makan, jangan berbaring 2 jam setelah makan</li>\r\n          <li>Kepala lebih tinggi (diganjal) ketika sedang tidur</li>\r\n          <li>Apabila ibu sebelumnya mempunyai penyakit maag/gastritis boleh memakai obat-obatan yang sebelumnya biasa dipakai, dengan terlebih dahulu konsultasi ke dokter</li>\r\n        </ol>\r\n\r\n        <h6>Sembelit</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Perubahan hormon selama kehamilan menyebabkan lambatnya gerakan peristaltik usus dan bayi yang semakin besar akan menekan usus</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Makan makanan berserat dan banyak minum (minimal 8 gelas sehari)</li>\r\n          <li>Olahraga teratur</li>\r\n          <li>Jangan minum obat pencahar</li>\r\n        </ol>\r\n\r\n        <h6>Cepat lelah</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Pertumbuhan hormonal</li>\r\n        	<li>Pertumbuhan janin yang membutuhkan energi dan kalori lebih</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Cukup beristirahat</li>\r\n          <li>Makan makanan dengan nutrisi seimbang dan jumlah yang cukup</li>\r\n          <li>Olahraga secara teratur</li>\r\n          <li>Kurangi kopi dan kafein</li>\r\n        </ol>\r\n\r\n        <h6>Sakit kepala/ pingsan</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Pada saat hamil, darah dalam tubuh ibu bertambah dan mengalir secara perlahan</li>\r\n        	<li>Perubahan posisi yang mendadak dapat menyebabkan pusing</li>\r\n        	<li>Bayi dapat menekan pembuluh darah besar ketika ibu berbaring terlentang</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Bangun perlahan-lahan</li>\r\n          <li>Ubah posisi secara perlahan-lahan</li>\r\n          <li>Berbaring miring kekiri</li>\r\n        </ol>\r\n\r\n        <h6>Nyeri bokong/ nyeri pinggang</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Poros tulang belakang sudah mulai berubah sehingga ibu cepat merasa sakit pinggang bila duduk atau berdiri lama, mulai dirasakan pada trimester kedua</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Perbanyak istirahat</li>\r\n          <li>Pertahankan posisi tubuh yang baik</li>\r\n        </ol>\r\n\r\n        <h6>Kebas pada tangan/ mati rasa dan kram pada kaki</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Serabut syaraf pada kaki tertekan</li>\r\n        	<li>Dapat disebabkan karena berdiri lama</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Hindari berdiri dalam waktu lama</li>\r\n          <li>Usahakan untuk beristirahat</li>\r\n          <li>Lakukan peregangan pada otot betis</li>\r\n          <li>Pijat kaki</li>\r\n          <li>Dapat diberi kalsium atau tambahan vitamin lainnya jika diduga karena kekurangan vitamin/mineral</li>\r\n        </ol>\r\n\r\n        <h6>Sering kencing</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Janin yang semakin membesar menekan kandung kemih</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Jangan mengurangi drama</li>\r\n          <li>Kurangi kopi</li>\r\n          <li>Latih otot-otot pingul ibu dengan melakukan senam keggel</li>\r\n        </ol>\r\n\r\n        <h6>Bengkak kaki</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Kelebihan cairan pada tubuh ibu</li>\r\n        	<li>Pembuluh darah dipangkal paha tertekan oleh berat bayi yang semakin besar</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Angkat kaki ibu (tempatkan pada posisi lebih tinggi dari kepala/ jantung)</li>\r\n          <li>Ibu harus selalu merubah posisi setiap 30 menit – 1 jam</li>\r\n          <li>Berjalan dan melakukan peregangan pada kaki dapat memperbaiki aliran darah</li>\r\n        </ol>\r\n\r\n        <div class=\"alert\">\r\n        	<p><strong>HATI-HATI</strong>: bengkak kaki yang disertai peningkatan tekanan darah dapat merupakan tanda preeklampsia (hipertensi dalam  kehamilan) yang membahaykan bagi ibu dan janin.</p>\r\n        </div>\r\n\r\n        <h6>Perubahan pada payudara</h6>\r\n        <p>Payudara sering terasa bengkak dan lebih nyeri, daerah di sekitar puting sering menjadi lebih hitam. Pembuluh darah sering lebih terlihat, kadang-kadang terdapat garis kehamilan berwarna ungu kemerahan.</p>\r\n\r\n        <h6>Varises</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Penyebab hormonal</li>\r\n        	<li>Akan lebih berat jika sebelum hamil sudah mengalami hal ini</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Gunakan stocking khusus untuk varises</li>\r\n          <li>Hindari berdiri dalam waktu lama</li>\r\n          <li>Jangan silangkan kaki</li>\r\n          <li>Beristirahat denan meletakkan kaki lenih tinggi dari kepala beberapa kali sehari</li>\r\n        </ol>\r\n\r\n        <h6>Wasir (hemorrhoid, ambeien)</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Penekanan pada pembuluh darah daerah anus</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Usahakan untuk tidak duduk dan atau beridir terlalu lama</li>\r\n          <li>Berbaring kearah kiri</li>\r\n          <li>Latihan keggel</li>\r\n          <li>Kompres air, atau hemoroid cream dapat membantu</li>\r\n          <li>Jika terjadi perdarahan, terutama dalam jumlah banyak, segera hubungi dokter.</li>\r\n        </ol>\r\n\r\n        <h6>Perasaan cemas</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Kurang paham dengan perubahan yang terjadi sehubungan dengan kehamilanny</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Perlu dukungan mental dari suami dan lingkungan keluarga</li>\r\n          <li>Menyadari bahwa kehamilan adalah suatu hal yang wajar dialami oleh makhluk hidup, tidak hanya manusia saja.</li>\r\n          <li>Menyadari bahwa sebagian besar ibu dapat melalui kehamilan dan persalinan dengan hasil yang baik, ibu dan anak selamat.</li>\r\n        </ol>\r\n\r\n        <h6>Sulit tidur</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <ol>\r\n        	<li>Biasanya karena perasaan cemas</li>\r\n        	<li>Posisi tidur yang tidak nyaman</li>\r\n        	<li>Terganggu buang air kecil semalaman</li>\r\n        </ol>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <ol>\r\n          <li>Usahakan untuk tenang, makan makanan ringan sebelum tidur</li>\r\n          <li>Tidur dengan posisi nyaman, dapat diganjal dengan bantal</li>\r\n          <li>Jangan biasakan minum obat tidur</li>\r\n          <li>Minum banyak sampai sore hari sesuai yamg dianjurkan, malam hari dikurangi.</li>\r\n        </ol>\r\n\r\n        <h6>Nyeri tulang iga</h6>\r\n        <p><strong>Penyebab</strong></p>\r\n        <p>Dirasakan karena Rahim sedang berkembang semakin membesar seiring pekembangan janin dan pembesaran rongga perut mendesak iga-iga</p>\r\n\r\n        <p><strong>Cara mengatasi</strong></p>\r\n        <p>Jika kehamilan sudah mencapai usia 37 minggu bagian terendah anak sudah masuk ronhgga panggul, keadaan ini akan berkurang dengan sendirinya</p>\r\n\r\n        <h6>Kelainan pada kulit</h6>\r\n        <ol>\r\n        	<li>Gatal-gatal pada kulit, bintik bintik hitam pada muka, pertumbuhan seperti tahi lalat pada leher, jerawat yang banyak, eksem dan lain-lain</li>\r\n        	<li>Garis kehamilan sering timbul pada kulit perut, payudara, paha atau betis. Pada hamil pertama warnanya merah kebiruan (ungu), lama-lama garis itu menjadi putih, akan tetapi pada kehamilan garis kehamilan dapat timbul lagi.</li>\r\n        </ol>\r\n\r\n\r\n        <h6 class=\"yellow\">Penting untuk diingat!</h6>\r\n        <div class=\"alert\">\r\n          <ol>\r\n            <li>Pada trimester I, perubahan pada tubuh ibu belum nyata, sedangkan janin yang dikandung bernibah dan berkembang dengan sangat cepat</li>\r\n            <li>Berat badan ibu dapat berkurang, terutama pada ibu yang mengalami mual dan muntah</li>\r\n            <li>Perubahan pada perut baru dapat terlihat setelah kehamilan trimester II</li>\r\n            <li>Ibu akan mengalami banyak perubahan selama waktu trimester III</li>\r\n            <li>Keadaan yang membahayakan kehamilan:\r\n              <ul>\r\n                <li>Mual dan muntah berlebihan (hyperemesis gravidarum)</li>\r\n                <li>Perdarahan pada jalan lahir, dianggap sebagai ancaman keguguran</li>\r\n                <li>Hamil anggur</li>\r\n                <li>Kehamilan diluar kandungan</li>\r\n              </ul>\r\n            </li>\r\n            <li>Perhatikan asupan nutrisi yang baik selama hamil</li>\r\n            <li>Ada beberapa hal harus diperhatikan bagi ibu hamil dan bekerja</li>\r\n            <li>Ibu hamil sebaiknya berolahraga agar tetap bugar</li>\r\n            <li>Perhatikan waktu yang tepat untuk bepergian</li>\r\n            <li>Gunakan sabuk pengaman saat berkendara. Sabuk pengaman tidak akan mencederai bayi ibu.</li>\r\n          </ol>\r\n        </div>', 0, '2019-10-28 10:25:50', '2019-10-28 10:25:50'),
(6, 'Tanda-tanda Kehamilan', '<h6>Tanda “dugaan hamil”</h6>\r\n        <p>Seorang wanita diduga hamil jika ia telambat haid disertai dengan gejala-gejala berikut :</p>\r\n\r\n        <ol>\r\n          <li>Rasa tidak enak pada perut, mual, muntah dan cepat lelah</li>\r\n          <li>Buah dada terasa penuh dan besar, perubahan kulit menjadi lebih gelap didaerah puting susu dan kulit sekitarnya (areola)</li>\r\n          <li>Pada beberapa orang dapat muncul bintik-bintik kehitaman pada wajah (chloasma)</li>\r\n          <li>Garis putih tipis (linea alba) yang terdapat antara pusar dan tulang kemaluan (os.pubis), akan menghitam, disebut linea nigra, garis hitam sampai ungu tersebut dapat timbul pula dipaha, perut, betis, dan payudara pada usia kehamilan lebih lanjut, biasanya lebih mula trimester kedua yang disebut garis kehamilan (striae gravidarum)</li>\r\n          <li>Pada kehamilan lebih lanjut, terdapat keluhan sering kencing, sulit buang air besar.</li>\r\n        </ol>\r\n\r\n        <h6>Tanda pasti hamil</h6>\r\n        <p>Untuk menegakkan diagnosis atau memastikan bahwa seorang wanita sedang hamil atau tidak, ada beberapa hal yang dapat dilakukan :</p>\r\n        <ol>\r\n        	<li>Menggunakan alat uji kehamilan yang biasa dibeli diapotik </li>\r\n        	<li>melakukan uji laboratorium terhadap air kemih.</li>\r\n        	<li>Melihat adanya tanda-tanda objektif maupun subjektif.\r\n        		<p>Tanda objektif:</p>\r\n        		<ul>\r\n        			<li>Melihat adanya kantong janin melalui pemeriksaan USG (ultrasonografi), dapat terlihat mulai usia kehamilan sekitar 5-6 minggu.</li>\r\n        			<li>Mendengar denyut jantung janin, dengan alat bantu Doppler saat usia kehamilan lebih dari 10 minggu.</li>\r\n        		</ul>\r\n        		<p>Tanda subjektif:</p>\r\n        		<p>Ibu dapat merasakan atau melihat gerakan janin yang dikandungnya setelah janin berusia 4 bulan.</p>\r\n        	</li>\r\n        </ol>\r\n\r\n        <h6 class=\"yellow\">Penting untuk diingat!</h6>\r\n        <div class=\"alert\">\r\n          <ol>\r\n            <li>Ada perbedaan perhitungan umur kehamilan antara dokter perhitungan orang awam</li>\r\n            <li>Tanda kehamilan terdiri dari tanda objektif dan subjektif</li>\r\n            <li>Memeriksakan kehamilan sangat penting untuk mendeteksi secara dini adanya kelainan kehamilan</li>\r\n            <li>Pemeriksaan kehamilan minimal dilakukan masing-masing 1 kali pada trimester I dan II, 2 kali pada trimester III</li>\r\n            <li>Sebagian kehamilan dapat berisiko tinggi diperkirakan berdasarakan usia, jumlah paritas, tinggi badan, riwayat penyakit sebelumnya dan riwayat kehamilan sebelumnya.</li>\r\n          </ol>\r\n        </div>', 0, '2019-10-28 10:29:35', '2019-10-28 10:29:35'),
(7, 'Persiapan Kehamilan', '<ol>\r\n          <li>Persiapan kehamilan sebaiknya dilakukan untuk setiap kehamilan, tidak hanya anak pertama saja.</li>\r\n          <li>Perlu diperhatikan jarak antara kehamilan, agar ibu memiliki cukup waktu untuk membesarkan anak dengan baik dan memulihkan kondisi ibu dalam keadaan yang optimal, sebelum hamil berikutnya. Disarankan untuk mengatur jarak antara persalinan terakhir dan kehamilan selama 2-3 tahun.</li>\r\n        </ol>\r\n        \r\n        <h6>Persiapan fisik untuk hamil</h6>\r\n        <p>Selain usia, perhatikan juga kesiapan ibu secara mental dan material. Hadirnya anggota baru dalam keluarga akan menambah pengeluaran bulanan. Ini perlu diperhatikan agar orang tua dapat merencanakan penegluaran yang berhubungan kehamilan, persalinan dan hal-hal lain yang menunjang keberhasilan dalam mengahsilkan penerus yang berkualitas.</p>\r\n        <p>Dari orang tua yang baik diharapkan dapat dihasilkan keturunan yang baik pula. Karena itu jugalah kesehatan itu sebelum, dengan cara:</p>\r\n\r\n        <ol>\r\n          <li>Menghentikan kebiasaan yang tidak baik, seperti mengkonsumsi makanan tidak sehat seperti makanan dengan zat pengawet, zat pewarna, junkfood. Mulailah dengan pola makan yang baik, makan-makanan yang bergizi dan meningkatkan asupan asam folat untuk mencegah beberapa cacat bawaan dan mencegah anemia. Asam folat ini mudah didapatkan dalam makanan sehari-hari pada sayuran berdaun hijau tua, contohnya: ayam, brokoli, kangkung, stroberi dan sebagainya.</li>\r\n          <li>Memperhatikan berat badan ibu sebelum hamil, agar mencapai berat badan ideal, karena saat hamil bukan saat yang tepat bagi ibu untuk berdiet.</li>\r\n          <li>Olahraga secara teratur</li>\r\n          <li>Hentikan alcohol, rokok dan obat-obatan terlarang saat ini juga. Mengunjungi dokter untuk pemeriksaan kesehatan dan menanyakan tentang obatan yang aman untuk digunakan selama kehamilan, terutama jika ibu memiliki masalah kesehatan yang kronis sebelumnya, seprti TBC paru, kencing manis, hepatitis, AIDS dan penyakit lainnya.</li>\r\n          <li>Melakukan pemeriksaan sebelum hamil, seperti:\r\n            <ul>\r\n              <li>Pemeriksaan laboratorium rutin untuk mendeteksi anemia dan mengetahui keadaan kesehatan secara umum karena kehamilan dapat memberatkan kesehatan ibu dan sebaliknya kesehatan ibu dapat mempengaruhi kesehatan janin.</li>\r\n              <li>Pap’s smear</li>\r\n              <li>Golongan darah</li>\r\n              <li>Pemeriksaan lain apabila diperlukan seperti toksoplasma pada mereka yang memelihara kucing, senang mengkonsumsi daging setengah matang atau lalapan mentah.</li>\r\n            </ul>\r\n          </li>\r\n        </ol>', 0, '2019-10-28 10:37:46', '2019-10-28 10:37:46'),
(8, 'Saat yang Baik untuk Hamil', '<p>Seorang wanita sebaiknya hamil pada usia 20-30 tahun. Pada usia tersebut alat reproduksi berfungsi optimal untuk hamil, seiring dengan kesiapan mental untuk menjadi ibu.</p>\r\n        \r\n        <h6>Ibu berumur kurang dari 20 tahun</h6>\r\n        <p>Sebaiknya menunda kehamilan dulu. Semakin muda umur saat kehamilan, risiko kesehatan ibu semakin meningkat, misalnya terjadi hieprtensi dalam kehamilan, anemia, gangguan pertumbuhan janin atau melahirkan bayi premature. Ketidaksesuaian panggul dengan kepala janin juga lebih sering didapatkan pada ibu usia sangat muda.</p>\r\n\r\n        <h6>Ibu berumur 30-35 tahun</h6>\r\n        <p>Kehamilan pada usia ini harus lebih diawasi oleh dokter, risiko masalah kesehatan yang dihadapinya akan semakin meningkat seiring dengan bertambahnya usia ibu saat hamil</p>\r\n\r\n        <h6>Ibu berumur lebih dari 35 tahun</h6>\r\n        <p>Kehamilan pada umur lebih dari 35 tahun merupakan kehamilan berisiko tinggi. Semakin lanjut usia saat hamil, risiko mendapatkan kesulitan saat kehamilan, persalinan maupun masa nifas akan meningkat. Kejadian hipertensi dalam kehamilan dan kelainan sistem jantung/pembuluh darah akan meningkat. Pada usia ini kemungkinan ibu melahirkan janin dengan kelainan genetic, terutama meningkatkan kejadian sindroma down. Anak-anak yang terlahir dengan sindroma ini akan mengalami keterbelakangan mental dan beberapa kelainan fisik.</p>\r\n\r\n        <h6 class=\"yellow\">Penting untuk diingat!</h6>\r\n        <div class=\"alert\">\r\n          <ol>\r\n            <li>Rencanakan setiap kehamilan oleh anda berdua</li>\r\n            <li>Usia yang baik untuk hamil adalah antara usia 20-30tahun, bila umur ibu …</li>\r\n            <table>\r\n              <tr>\r\n                <td width=\"30%\">< 20 tahun</td>\r\n                <td>Tunda rencana untuk hamil</td>\r\n              </tr>\r\n              <tr>\r\n                <td>20-30 tahun</td>\r\n                <td>Baik untuk merencanakan kehamilan risiko rendah</td>\r\n              </tr>\r\n              <tr>\r\n                <td>31-35 tahun</td>\r\n                <td>Kehamilan risiko sedang</td>\r\n              </tr>\r\n              <tr>\r\n                <td>> 35 tahun</td>\r\n                <td>Kehamilan risiko tinggi</td>\r\n              </tr>\r\n            </table>\r\n            <li>Jarak antara kehamilan yang baik adalah 2-3 tahun</li>\r\n            <li>Biasakan hidup sehat</li>\r\n            <li>Berkonsultasikan dengan dokter spesialis penyakit dalam jika ibu memiliki masalah kesehatan khusus (hipertensi, diabetes mellitus, asma, TBC paru).</li>\r\n            <li>Hentikan merokok</li>\r\n          </ol>\r\n        </div>', 0, '2019-10-28 10:38:56', '2019-10-28 10:38:56'),
(9, 'Merencanakan Kehamilan', '<p>Mempunyai keturunan adalah suatu pengalaman besar yang indah dalam kehidupan berkeluarga. Diperlukan persiapan yang matang dengan merencanakan kehamilan yang baik sejak awal, karena masa kehamilan 9 bulan tersebut merupakan saat-saat terpenting untuk menghailkan generasi penerus yang berkualitas. Selain itu, anda berdua akan lebih siap menghadapi masa-masa kehamilan dan persalinan.</p>\r\n        \r\n        <h6>Sering kontrol ke dokter</h6>\r\n        <p>Langkah pertama yang harus dilakukan saat merencanakan kehamilan adalah mengunjungi dokter bersama suami Ibu. Anda perlu tahu apakah dinding rahim ibu sudah cukup kuat untuk mengandung seorang bayi</p>\r\n\r\n        <h6>Meningkatkan konsumsi asam folat</h6>\r\n        <p>Ketika ibu merencanakan kehamilan, sudah pasti  harus mengubah pola hidup ibu. Ibu harus banyak mengonsumsi makanan sehat termasuk meningkatkan asam folat yang masuk dalam tubuh. Perempuan yang merencanakan untuk hamil harus mempunyai kadar asam folat yang cukup di dalam tubuhnya, sehingga calon bayi akan sehat dalam kandungan.</p>\r\n\r\n        <h6>Meninggalkan hal-hal yang buruk</h6>\r\n        <p>Kalau Ibu sudah yakin untuk menimang seorang bayi, penting bagi ibu dan suami untuk meninggalkan kebiasaan buruk. Apalagi jika ibu dan suami adalah pecandu rokok dan alkohol.</p>\r\n\r\n        <h6>Selalu hidup sehat</h6>\r\n        <p>Mengonsumsi makanan sehat seperti sayuran, daging dan makanan yang mengandung protein.</p>\r\n\r\n        <h6>Kurangi meminum kopi</h6>\r\n        <p>Jangan juga mengonsumsi minuman lain yang mengandung kafein.</p>\r\n\r\n        <h6>Koreksi berat badan</h6>\r\n        <p>Terlalu gemuk atau terlalu kurus juga tak baik saat hamil.</p>\r\n        \r\n        <h6>Sering memakan ikan</h6>\r\n        <p>Kalau Ibu adalah pencinta ikan-ikanan, Ibu harus memperhatikan ikan apa saja yang ibu konsumsi. Beberapa penelitian mengatakan, ikan terbaik untuk dikonsumsi saat hamil adalah ikan salmon.</p>\r\n\r\n        <h6>Perbanyak olahraga</h6>\r\n        <p>Olahraga yang cukup dan teratur sangat penting untuk membuat tubuh ibu sehat. Tubuh yang sehat sangat dibutuhkan saat hamil nanti.</p>\r\n\r\n        <h6>Menjaga kesehatan mulut</h6>\r\n        <p>Usahakan kesehatan mulut selalu dijaga. Kalau bisa konsultasikan juga kesehatan mulut Anda pada dokter. Wanita hamil akan lebih sering mengalami masalah kesehatan mulut karena adanya perubahan hormon pada tubuh.</p>\r\n\r\n        <h6>Selalu mengecek kesehatan</h6>\r\n        <p>Sangat penting bagi ibu dan suami mengecek kesehatan kedokter secara berkala</p>\r\n        \r\n        <h6>Mengetahui masa subur ibu</h6>\r\n        <p>Ibu harus tahu kapan masa subur Anda. Hal ini akan membantu supaya ibu mempunyai kesempatan yang lebih besar untuk hamil.</p>', 0, '2019-10-28 10:39:58', '2019-10-28 10:39:58'),
(10, 'Panduan Gerakan Senam Hamil', '<img class=\"pl-5 pr-5\" src=\"/images/senam1.png\">\r\n\r\n<h6>Duduk Bersila (Gambar 1)</h6>\r\n<p>Gerakan ini merupakan gerakan dasar senam hamil. duduk bersila merupakan posisi paling aman untuk ibu hamil karena tidak ada penekanan pada perut.Gerakan duduk bersila dikombinasikan dengan pemanasan, ingat posisi duduk bersila anda harus tegak. Berikut pemanasan yang bisa anda lakukan dengan gerakan ini:</p>\r\n<ul>\r\n  <li>Duduk bersila tegak seperti hendak melakukan yoga</li>\r\n  <li>Atur pernapasan</li>\r\n  <li>Gelengkan kepala kanan dan kiri sebanyak 4 kali</li>\r\n  <li>Tengok kanan dan kiri sebanyak 4 kali</li>\r\n  <li>Menunduk dan menengadahkan kepala sebanyak 4 kali</li>\r\n  <li>Lakukan gerakan tersebut sambil mengatur pernapasan dengan baik, cara mengatur  pernapasan saat olahraga agar tidak ngos-ngosan adalah tarik nafas - tahan nafas - buang nafas</li>\r\n  <li>Gerakan ini sangat disarankan untuk dilakukan sehari-hari, meskipun tidak dipadupadankan dengan gerakan senam lainnya</li>\r\n</ul>\r\n\r\n<img class=\"pl-5 pr-5\" src=\"/images/senam2.png\">\r\n<img class=\"pl-5 pr-5\" src=\"/images/senam3.png\">\r\n<img class=\"pl-5 pr-5\" src=\"/images/senam4.png\">\r\n\r\n<h6>Melenturkan Lengan dan Mengencangkan Payudara (Gambar 2, 3 dan 4)</h6>\r\n<p>Gerakan senam untuk ibu hamil yang kedua adalah memutar lengan dan mengencangkan payudara. Berikut gerakan yang bisa anda lakukan dengan gerakan ini:</p>\r\n<ul>\r\n  <li>Masih dalam posisi duduk bersila </li>\r\n  <li>Letakkan jari-jari pada bahu</li>\r\n  <li>Kemudian putar-putarlah ke depan dan ke belakang secara bergantian</li>\r\n  <li>Masih dalam posisi jari-jari berada di bahu</li>\r\n  <li>Gerakkan lengan ke arah depan sehingga kedua lengan menjepit payudara ke atas Lalu kembali ke posisi semula</li>\r\n  <li>Lakukan gerakan ini sebanyak 8 kali.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam5.png\">\r\n<img src=\"/images/senam6.png\">\r\n<img src=\"/images/senam7.png\">\r\n\r\n<h6>Gerakan Rileksasi (Gambar 5, 6 dan 7)</h6>\r\n<p>Gerakan senam untuk ibu hamil yang ketiga adalah melakukan gerakan rileksasi. Berikut gerakan yang bisa anda lakukan dengan gerakan ini:</p>\r\n<ul>\r\n  <li>Tidurlah dalam posisi miring. </li>\r\n  <li>Sangga kepala dengan bantal yang lembut. </li>\r\n  <li>Tekuk kaki bagian atas, kaki bagian bawah lurus. </li>\r\n  <li>Tarik napas dan hembuskan melalui mulut. </li>\r\n  <li>Lalu, lakukan gerakan senam untuk ibu hamil dengan mengangkat kaki bagian atas setinggi pinggul. Kemudian turunkan.</li>\r\n  <li>Kemudian dilanjutkan dengan mengangkat kaki atas dan tekuk ke arah perut. Lalu kembali ke posisi semula, yaitu sejajar dengan posisi kaki bawah yang lurus. </li>\r\n  <li>Lakukan sebanyak 8 kali bergantian antara kakai kanan dan kaki kiri.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam8.png\">\r\n<img src=\"/images/senam9.png\">\r\n<img src=\"/images/senam10.png\">\r\n\r\n<h6>Gerakan Pergelangan Kaki dan Mengayuh (Gambar 8, 9 dan 10)</h6>\r\n<p>Gerakan senam untuk ibu hamil yang berikutnya adalah melakukan gerakan pergelangan kaki dan mengayuh. Berikut gerakan yang bisa anda lakukan dengan gerakan ini:</p>\r\n<ul>\r\n  <li>Posisi tubuh terlentang, kedua kaki lurus. </li>\r\n  <li>Tekanlah jari-jari kaki ke bawah lalu luruskan kembali. Putar pergelangan kaki dari arah kanan ke ke kiri. Lakukan sebaliknya. </li>\r\n  <li>Lanjutkan senam untuk ibu hamil dengan gerakan seolah-olah sedang mengayuh sepeda. </li>\r\n  <li>Kedua tangan rileks di samping tubuh. </li>\r\n  <li>Lakukan sebanyak 8 kali.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam11.png\">\r\n<img src=\"/images/senam12.png\">\r\n\r\n<h6>Gerakan Otot Panggul (Gambar 11 dan 12)</h6>\r\n<p>Gerakan ini bertujuan untuk melemaskan otot panggul agar siap menghadapi persalinan. Kekuatan otot panggul sangat dibutuhkan ibu hamil untuk mengejan saat proses persalinan berlangsung. Berikut contoh gerakannya:</p>\r\n<ul>\r\n  <li>Posisikan tubuh ibu hamil berbaring</li>\r\n  <li>Kedua kaki ditekuk dan tangan diletakkan disamping tubuh</li>\r\n  <li>Tarik nafas dan tahan selama beberapa menit</li>\r\n  <li>kencangkan otot panggul selama menahan nafas dengan cara mengangkat panggul keatas</li>\r\n  <li>Hembuskan nafas secara perlahan kemudian kembalikan panggul ke posisi semula ulangi sebanyak 4 kali.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam13.png\">\r\n<img src=\"/images/senam14.png\">\r\n<img src=\"/images/senam15.png\">\r\n\r\n<h6>Latihan Membran (Gambar 13, 14 dan 15)</h6>\r\n<p>Gerakan senam untuk ibu hamil yang berikutnya adalah melakukan gerakan membran. Berikut gerakan yang bisa anda lakukan dengan gerakan ini:</p>\r\n<ul>\r\n  <li>Posisi tidur terlentang, rangkul paha dengan tangan sampai siku. </li>\r\n  <li>Lakukan dengan posisi miring ke kiri dan ke kanan. </li>\r\n  <li>Lanjutkan dengan posisi terlentang, rangkul kedua paha dengan tangan sampai siku. Sambil menarik napas angkat kepala, pandangan ke perut. Lalu hembuskan napas. </li>\r\n  <li>Lanjutkan dengan memegang pergelangan kaki (sesuai kemampuan/tidak sampai tidak apa-apa). </li>\r\n  <li>Lakukan gerakan ini sebanyak 8 kali.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam16.png\">\r\n<img src=\"/images/senam17.png\">\r\n\r\n<h6>Gerakan Melenturkan Punggung (Gambar 16 dan 17)</h6>\r\n<p>Posisi badan sikap merangkak, tangan sejajar dengan bahu, sumbu badan menjadi 4 yaitu pada kedua tangan dan lutut, kemudian posisikan sejajar dengan lantai. Setelah itu kombinasikan dengan gerakan  berikut: </p>\r\n<ul>\r\n  <li>Menundukkan kepala sampai terlihat perut bagian bawah</li>\r\n  <li>Angkat pinggang sambil mengempiskan perut dan mengerutkan liang dubur </li>\r\n  <li>urunkan pinggang dengan mengangkat kepala sambil melemaskan otot-otot perut dan panggul</li>\r\n  <li>Lakukan gerakan ini sebanyak 8 kali.</li>\r\n</ul>\r\n\r\n<img src=\"/images/senam18.png\">\r\n\r\n<h6>Gerakan Anti Sunsang (Gambar 18)</h6>\r\n<p>Gerakan ini sangat dianjurkan apabila sudah menginjak usia kehamilan 7 bulan atau diketahui diagnosa pemeriksaan kehamilan letak sungsang. Lakukan gerakan ini setiap hari lebih baik, meskipun tidak dengan gerakan senam hamil lainnya. Berikut contoh gerakannya:</p>\r\n<ul>\r\n  <li>Posisi ibu hamil seperti sujud, dengan tangan diletakkan disamping kepala, kemudian kepala menoleh ke arah kiri dan kanan</li>\r\n  <li>Tahan selama 1 menit kemudian bangun seperti posisi merangkak </li>\r\n  <li>Lakukan gerakan ini sebanyak 8 kali atau sesering mungkin, sesuai kebutuhan, kemudian tingkatkan durasi sampai mampu menahan 5 menit.</li>\r\n</ul>\r\n</div>', 0, '2019-10-28 10:25:30', '2019-10-28 10:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `awal_hamil` date DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `tipe`, `awal_hamil`, `photo`, `tanggal_lahir`) VALUES
(1, 'Dr. dr. Herlambang, Sp.OG-KFM', 'herlambang', '$2y$12$agOrn5pI7UhMGSKuO9/ZleBvxRHmcLarunF04rTK2u8jiFAGFTmQG', '3', NULL, NULL, '2019-10-01'),
(2, 'Administrator', 'admin', '$2y$12$VXtwUbQkWRjvrRTPzRbdFuIw7LRbT/rXUvgJigdIE8f0s/gV51sfK', '4', NULL, NULL, NULL),
(18, 'Norman', 'norman', '$2y$10$YNAU.QG/roGKah7l9DjUl.bEsyAi8HTiH8DL8ShG.BMbb.i8arwOm', '1', '2019-10-14', NULL, '2019-10-31'),
(19, 'Yulia', 'yulia', '$2y$10$F920kEXwYoWKtFS9Isl6yOQxlHWLk762aaU5HzeQjHn0m38TUUMbW', '1', '2019-10-09', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forum_responses`
--
ALTER TABLE `forum_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `serba_serbi`
--
ALTER TABLE `serba_serbi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forum_responses`
--
ALTER TABLE `forum_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `serba_serbi`
--
ALTER TABLE `serba_serbi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
