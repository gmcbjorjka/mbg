-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2026 at 07:46 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbg_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `summary` text,
  `content` longtext NOT NULL,
  `status` enum('draft','published') DEFAULT 'draft',
  `is_featured` tinyint(1) DEFAULT '0',
  `views` int UNSIGNED DEFAULT '0',
  `reading_time` int UNSIGNED DEFAULT '1',
  `author_id` bigint UNSIGNED DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `category_id`, `title`, `slug`, `thumbnail`, `summary`, `content`, `status`, `is_featured`, `views`, `reading_time`, `author_id`, `published_at`, `created_at`, `updated_at`) VALUES
(2, 6, 'Nasib MBG Kian Memprihatinkan', 'nasib-mbg-kian-memprihatinkan', 'articles/01KYFFW1ZT3ZRXT81X0G6JGSEK.jpg', 'tentang nasib mbg kedepan', '<h1>Nasib MBG Semakin Memprihatinkan</h1><p>Program Makan Bergizi Gratis (MBG) diharapkan menjadi salah satu langkah strategis untuk meningkatkan kualitas gizi masyarakat, khususnya anak-anak sekolah. Program ini membawa harapan besar dalam upaya menekan angka stunting, meningkatkan kesehatan, serta mendukung proses belajar melalui pemenuhan kebutuhan gizi yang lebih baik.</p><p>Namun, dalam pelaksanaannya, berbagai tantangan mulai menjadi perhatian. Di sejumlah daerah, muncul laporan mengenai keterlambatan distribusi makanan, keterbatasan sarana pendukung, hingga kendala koordinasi antar pihak yang terlibat. Kondisi tersebut menyebabkan sebagian penerima manfaat belum dapat merasakan layanan secara optimal.</p><p>Selain itu, aspek pengawasan kualitas makanan juga menjadi hal yang penting. Menu yang disajikan perlu memenuhi standar gizi, diproses secara higienis, dan didistribusikan tepat waktu agar manfaat program benar-benar dirasakan oleh para penerima. Evaluasi yang berkelanjutan menjadi kunci agar setiap kendala dapat segera diperbaiki.</p><p>Di sisi lain, keberhasilan MBG juga sangat bergantung pada sinergi antara pemerintah, penyedia makanan, sekolah, tenaga kesehatan, dan masyarakat. Transparansi dalam pengelolaan anggaran serta keterbukaan informasi mengenai pelaksanaan program dapat meningkatkan kepercayaan publik sekaligus mendorong partisipasi berbagai pihak dalam mengawasi jalannya program.</p><p>Harapan masyarakat tentu sederhana: program yang dirancang untuk meningkatkan kualitas gizi anak bangsa dapat berjalan sesuai tujuan. Setiap tantangan yang muncul seharusnya menjadi bahan evaluasi untuk memperkuat sistem, bukan mengurangi komitmen dalam memberikan layanan terbaik kepada penerima manfaat.</p><p>Pada akhirnya, keberhasilan Program Makan Bergizi Gratis tidak hanya diukur dari banyaknya makanan yang dibagikan, tetapi juga dari kualitas pelaksanaannya, pemerataan manfaat, serta dampaknya terhadap kesehatan dan masa depan generasi Indonesia. Dengan evaluasi dan perbaikan yang berkesinambungan, MBG diharapkan mampu menjadi program yang efektif, tepat sasaran, dan memberi manfaat nyata bagi masyarakat.</p><p><br></p>', 'published', 0, 9, 1, NULL, '2026-07-15 16:16:18', '2026-07-15 02:16:28', '2026-09-01 00:18:42'),
(3, 5, 'Pentingnya Menjaga Kesehatan Ibu Hamil untuk Masa Depan Ibu dan Buah Hati', 'pentingnya-menjaga-kesehatan-ibu-hamil-untuk-masa-depan-ibu-dan-buah-hati', 'articles/01KYFFQ34SPFP214NVA33PAW9C.jpg', 'artikel tentang ibu hamil', '<h2>Pendahuluan</h2><p>Kehamilan merupakan masa yang sangat penting dalam kehidupan seorang perempuan. Selama kurang lebih sembilan bulan, tubuh ibu mengalami berbagai perubahan untuk mendukung pertumbuhan dan perkembangan janin. Oleh karena itu, menjaga kesehatan ibu hamil menjadi hal yang sangat penting agar ibu tetap sehat, proses kehamilan berjalan lancar, serta bayi dapat lahir dalam kondisi sehat dan optimal.</p><h2>Mengapa Kesehatan Ibu Hamil Sangat Penting?</h2><p>Kesehatan ibu hamil tidak hanya berpengaruh pada kondisi ibu, tetapi juga menentukan tumbuh kembang janin di dalam kandungan. Ibu yang mendapatkan asupan gizi yang cukup, rutin memeriksakan kehamilan, serta menerapkan pola hidup sehat memiliki peluang lebih besar untuk melahirkan bayi dengan berat badan normal dan kondisi kesehatan yang baik.</p><p>Sebaliknya, jika kesehatan ibu tidak terjaga, risiko terjadinya berbagai komplikasi seperti anemia, hipertensi dalam kehamilan, diabetes gestasional, persalinan prematur, hingga bayi lahir dengan berat badan rendah dapat meningkat.</p><h2>Cara Menjaga Kesehatan Selama Kehamilan</h2><h3>1. Mengonsumsi Makanan Bergizi Seimbang</h3><p>Ibu hamil membutuhkan nutrisi yang lebih banyak dibandingkan sebelum hamil. Konsumsilah makanan yang mengandung:</p><ul><li>Karbohidrat sebagai sumber energi.</li><li>Protein untuk pertumbuhan janin.</li><li>Sayur dan buah yang kaya vitamin serta mineral.</li><li>Susu atau produk olahan susu sebagai sumber kalsium.</li><li>Makanan yang mengandung zat besi dan asam folat untuk mencegah anemia dan mendukung perkembangan otak janin.</li></ul><p>Hindari makanan mentah, makanan tinggi gula, serta makanan yang mengandung bahan pengawet berlebihan.</p><h3>2. Rutin Melakukan Pemeriksaan Kehamilan (ANC)</h3><p>Pemeriksaan antenatal care (ANC) secara rutin membantu tenaga kesehatan memantau kondisi ibu dan janin. Melalui pemeriksaan ini, berbagai masalah kesehatan dapat dideteksi lebih awal sehingga dapat segera ditangani.</p><p>Pemeriksaan biasanya meliputi:</p><ul><li>Pengukuran tekanan darah.</li><li>Pemeriksaan berat badan.</li><li>Pemeriksaan denyut jantung janin.</li><li>Pemeriksaan laboratorium jika diperlukan.</li><li>Konsultasi mengenai perkembangan kehamilan.</li></ul><h3>3. Mengonsumsi Vitamin Sesuai Anjuran</h3><p>Dokter atau bidan biasanya memberikan suplemen seperti:</p><ul><li>Asam folat.</li><li>Tablet tambah darah (zat besi).</li><li>Kalsium.</li><li>Vitamin D apabila diperlukan.</li></ul><p>Vitamin ini berperan penting dalam mendukung pertumbuhan janin sekaligus menjaga kesehatan ibu.</p><h3>4. Berolahraga Ringan</h3><p>Aktivitas fisik ringan seperti berjalan kaki, yoga khusus ibu hamil, atau senam hamil dapat membantu:</p><ul><li>Melancarkan sirkulasi darah.</li><li>Mengurangi nyeri punggung.</li><li>Menjaga berat badan tetap ideal.</li><li>Mempermudah proses persalinan.</li></ul><p>Lakukan olahraga sesuai rekomendasi tenaga kesehatan.</p><h3>5. Istirahat yang Cukup</h3><p>Tubuh ibu hamil memerlukan waktu istirahat yang lebih banyak. Tidur selama 7–9 jam setiap malam dan beristirahat saat merasa lelah dapat membantu menjaga stamina dan kesehatan selama kehamilan.</p><h3>6. Menjaga Kesehatan Mental</h3><p>Perubahan hormon dapat memengaruhi suasana hati ibu hamil. Dukungan dari suami, keluarga, maupun lingkungan sekitar sangat penting untuk menjaga kesehatan mental. Jika merasa cemas atau stres berkepanjangan, jangan ragu berkonsultasi dengan tenaga kesehatan.</p><h3>7. Menghindari Kebiasaan Berisiko</h3><p>Ibu hamil sebaiknya menghindari:</p><ul><li>Merokok.</li><li>Mengonsumsi minuman beralkohol.</li><li>Menggunakan narkoba.</li><li>Mengonsumsi obat tanpa anjuran dokter.</li><li>Paparan asap rokok dan bahan kimia berbahaya.</li></ul><p>Kebiasaan tersebut dapat meningkatkan risiko gangguan perkembangan janin.</p><h2>Tanda Bahaya yang Perlu Diwaspadai</h2><p>Segera periksakan diri ke fasilitas kesehatan apabila mengalami:</p><ul><li>Perdarahan dari jalan lahir.</li><li>Nyeri perut hebat.</li><li>Demam tinggi.</li><li>Air ketuban keluar sebelum waktunya.</li><li>Gerakan janin berkurang.</li><li>Sakit kepala berat disertai pandangan kabur dan pembengkakan.</li></ul><p>Penanganan yang cepat dapat mencegah komplikasi yang lebih serius.</p><h2>Peran Keluarga dalam Mendukung Kehamilan</h2><p>Menjaga kesehatan ibu hamil bukan hanya tanggung jawab ibu, tetapi juga keluarga. Suami dan anggota keluarga dapat memberikan dukungan dengan:</p><ul><li>Mengingatkan jadwal pemeriksaan kehamilan.</li><li>Membantu menyiapkan makanan bergizi.</li><li>Memberikan dukungan emosional.</li><li>Membantu pekerjaan rumah agar ibu tidak terlalu lelah.</li><li>Menemani saat kontrol ke fasilitas kesehatan.</li></ul><p>Dukungan keluarga yang baik dapat membuat ibu merasa lebih nyaman dan percaya diri selama menjalani kehamilan.</p><h2>Kesimpulan</h2><p>Menjaga kesehatan ibu hamil merupakan investasi penting bagi kesehatan ibu dan masa depan anak. Pola makan bergizi, pemeriksaan kehamilan secara rutin, olahraga ringan, istirahat yang cukup, serta dukungan keluarga menjadi kunci utama untuk menciptakan kehamilan yang sehat. Dengan perhatian dan perawatan yang tepat, risiko komplikasi dapat diminimalkan sehingga ibu dapat menjalani kehamilan dengan nyaman dan bayi memiliki kesempatan tumbuh serta lahir dalam kondisi terbaik.</p><p><br></p>', 'published', 0, 12, 1, 2, '2026-07-16 08:07:49', '2026-07-15 18:07:53', '2026-08-19 02:04:17'),
(4, 9, 'Pentingnya Gizi Seimbang Selama Kehamilan', 'pentingnya-gizi-seimbang-selama-kehamilan', 'articles/01M1BX00ZKDYEFJF6RW3BYS4D7.jpg', 'Kehamilan merupakan masa penting yang membutuhkan perhatian lebih terhadap asupan makanan dan gizi. Gizi yang cukup dan seimbang tidak hanya membantu menjaga kesehatan ibu, tetapi juga mendukung pertumbuhan dan perkembangan janin sejak dalam kandungan.', 'articles/01M1BX0100GZ9J7PTWQBG3N4DQ.pdf', 'published', 0, 1, 1, 2, '2026-08-01 19:33:51', '2026-08-31 05:34:05', '2026-08-31 05:51:10'),
(5, 9, '1000 Hari Pertama Kehidupan Dimulai Sejak Kehamilan', '1000-hari-pertama-kehidupan-dimulai-sejak-kehamilan', 'articles/01M1BXB2DQXAJ2WWPGGZBNFJYE.jpg', '1000 Hari Pertama Kehidupan (1000 HPK) adalah periode penting yang dimulai sejak terbentuknya janin dalam kandungan hingga anak berusia 2 tahun. Masa ini sering disebut sebagai periode emas karena pertumbuhan dan perkembangan anak berlangsung sangat pesat.\n\nPemenuhan gizi yang baik sejak masa kehamilan menjadi salah satu langkah penting untuk mendukung kesehatan ibu dan tumbuh kembang anak.', 'articles/01M1BXB2E1S6QFSBQJS7MFAQ2W.pdf', 'published', 0, 1, 1, 2, '2026-08-01 19:39:47', '2026-08-31 05:40:07', '2026-08-31 05:51:59'),
(6, 9, 'Panduan Lengkap Nutrisi & Pola Makan Sehat Ibu Hamil', 'panduan-lengkap-nutrisi-pola-makan-sehat-ibu-hamil', 'articles/01M1BYEFVFSMSNZV61EYRF6JH1.jpg', 'Memenuhi kebutuhan nutrisi seimbang selama masa kehamilan merupakan pondasi utama bagi kesehatan ibu serta tumbuh kembang janin yang optimal. Asupan gizi yang tepat membantu pembentukan organ vital bayi, menjaga stamina ibu, dan menurunkan risiko komplikasi kehamilan.', 'articles/01M1BYEFVYMP8S8E47DS7P7D0S.pdf', 'published', 0, 1, 1, 2, '2026-08-01 19:59:19', '2026-08-31 05:59:28', '2026-08-31 05:59:31'),
(7, 9, 'Pentingnya Asupan Protein Selama Masa Kehamilan', 'pentingnya-asupan-protein-selama-masa-kehamilan', 'articles/01M1BYPZWNNBHPP9BCVZCC5YAJ.jpeg', 'Protein merupakan makronutrien esensial yang sering disebut sebagai \"blok pembangun\" (building blocks) kehidupan. Selama masa kehamilan, kebutuhan protein harian ibu meningkat signifikan karena tubuh bekerja keras menciptakan sel-sel baru, membentuk jaringan plasenta, serta mendukung pertumbuhan fisik organ janin secara pesat.', 'articles/01M1BYPZX175E21A6VGJWZWXYP.pdf', 'published', 0, 0, 1, 2, '2026-08-01 20:04:00', '2026-08-31 06:04:06', '2026-09-01 00:18:18'),
(8, 9, 'Zat Besi dan Pencegahan Anemia pada Ibu Hamil', 'zat-besi-dan-pencegahan-anemia-pada-ibu-hamil', 'articles/01M1BYY4P1N2087W1WVDG3SHC8.webp', 'Zat besi adalah mineral esensial yang bertugas memproduksi hemoglobin, yaitu protein dalam sel darah merah yang membawa oksigen ke seluruh tubuh ibu dan janin. Selama kehamilan, kebutuhan zat besi meningkat hingga dua kali lipat untuk mendukung pertambahan volume darah ibu serta pembentukan plasenta dan sirkulasi darah janin.', 'articles/01M1BYY4PMV49XQEMY9PNDNMVV.pdf', 'published', 0, 1, 1, 2, '2026-08-01 20:07:55', '2026-08-31 06:08:00', '2026-09-01 00:22:12'),
(9, 9, 'Pentingnya Asam Folat untuk Perkembangan Janin', 'pentingnya-asam-folat-untuk-perkembangan-janin', 'articles/01M1BZ2MVCEXJM5RT276YXWVPG.png', 'Asam folat (vitamin B9 sintesis) dan folat (bentuk alaminya dalam makanan) merupakan mikronutrien paling krusial pada masa prakonsepsi hingga awal kehamilan. Nutrisi ini memegang peran utama dalam pembelahan sel, sintesis DNA, serta pembentukan struktur dasar sistem saraf janin.', 'articles/01M1BZ2MVRT0CWR3AN205WRFVY.pdf', 'published', 0, 0, 1, 2, '2026-08-01 20:09:43', '2026-08-31 06:10:28', '2026-09-01 00:23:19'),
(10, 9, 'Kalsium untuk Kesehatan Ibu dan Pertumbuhan Tulang Janin', 'kalsium-untuk-kesehatan-ibu-dan-pertumbuhan-tulang-janin', 'articles/01M1BZ8GSH9RYSAKSE9P6X4407.jpg', 'Kalsium adalah mineral makro esensial yang paling melimpah di dalam tubuh manusia. Selama masa kehamilan, kalsium memegang peran ganda: menyusun fondasi kerangka tubuh dan gigi janin, sekaligus menjaga kepadatan tulang serta fungsi kardiovaskular ibu.', 'articles/01M1BZ8GSVSMEFW0G0CK8090RD.pdf', 'published', 0, 0, 1, 2, '2026-08-02 20:13:32', '2026-08-31 06:13:40', '2026-09-01 00:24:34'),
(11, 9, 'Kebutuhan Air Selama Kehamilan', 'kebutuhan-air-selama-kehamilan', 'articles/01M1BZDDY69ZZHNJ6YE76TQNTZ.png', 'Air merupakan nutrisi esensial yang kerap terabaikan, padahal perannya sangat vital dalam mendukung seluruh proses biologis selama kehamilan. Sekitar 60–70% tubuh manusia terdiri dari air, dan selama hamil, kebutuhan cairan meningkat signifikan untuk memfasilitasi pertambahan volume darah serta pembentukan lingkungan hidup janin di dalam rahim.', 'articles/01M1BZDDYH83G6X3N2QF16MA6C.pdf', 'published', 0, 0, 1, 2, '2026-08-02 20:16:13', '2026-08-31 06:16:21', '2026-09-01 00:26:05'),
(12, 9, 'Makanan yang Perlu Dibatasi Selama Kehamilan', 'makanan-yang-perlu-dibatasi-selama-kehamilan', 'articles/01M1BZN0EQ60F2TX7NJY9PCEQA.avif', 'Selama masa kehamilan, perubahan sistem imun dan metabolisme membuat tubuh ibu lebih rentan terhadap zat tertentu serta infeksi makanan. Beberapa jenis makanan dan minuman tetap boleh dikonsumsi, namun porsi dan frekuensinya wajib dibatasi secara ketat untuk mencegah komplikasi kehamilan seperti diabetes gestasional, hipertensi, hingga gangguan pertumbuhan janin.', 'articles/01M1BZN0F198YZR5BEBDJEQZ3Z.pdf', 'published', 0, 0, 1, 2, '2026-08-02 20:20:24', '2026-08-31 06:20:30', '2026-09-01 00:27:41'),
(13, 9, 'Tips Mengatasi Mual dan Muntah Saat Hamil', 'tips-mengatasi-mual-dan-muntah-saat-hamil', 'articles/01M1BZV9HY9YP620ZHHND5QPBA.jpg', 'Mual dan muntah pada masa kehamilan—sering disebut morning sickness—adalah kondisi umum yang dialami oleh sekitar 70–80% ibu hamil, terutama pada Trimester Pertama (minggu ke-6 hingga ke-12). Kondisi ini dipicu oleh lonjakan hormon kehamilan (human Chorionic Gonadotropin / hCG dan estrogen), peningkatan sensitivitas indra penciuman, serta relaksasi otot saluran cerna akibat hormon progesteron.', 'articles/01M1BZV9JDE9JVRJDE58CJ7V69.pdf', 'published', 0, 0, 1, 2, '2026-08-02 20:23:49', '2026-08-31 06:23:56', '2026-09-01 00:28:33'),
(14, 9, 'Pentingnya Pemeriksaan Kehamilan Secara Rutin', 'pentingnya-pemeriksaan-kehamilan-secara-rutin', 'articles/01M1BZZZ994T7GN1G6E8GKTKQD.png', 'Pemeriksaan kehamilan rutin atau Antenatal Care (ANC) merupakan serangkaian evaluasi medis berkala yang dilakukan oleh tenaga kesehatan (bidan atau dokter spesialis kandungan). Kunjungan rutin ini bertujuan memantau status kesehatan ibu, memastikan tumbuh kembang janin berlangsung optimal, serta mendeteksi dini potensi komplikasi sebelum berkembang menjadi risiko yang berbahaya.', 'articles/01M1BZZZAB39G3WZY5M0SZ8DNW.pdf', 'published', 0, 0, 1, 2, '2026-08-02 20:26:19', '2026-08-31 06:26:29', '2026-08-31 06:26:29'),
(15, 9, 'Menjaga Berat Badan yang Sehat Selama Kehamilan', 'menjaga-berat-badan-yang-sehat-selama-kehamilan', 'articles/01M1C2NS8SRV8JQ0DWZG838CVW.jpg', 'Kenaikan berat badan selama masa kehamilan merupakan proses biologis yang alami dan menandakan janin berkembang dengan baik. Kunci utamanya bukanlah menahan makan agar tidak gemuk atau makan dengan porsi dobel (\"makan untuk berdua\"), melainkan mencapai pertambahan berat badan yang bertahap, terkontrol, dan sesuai dengan Indeks Massa Tubuh (IMT) sebelum hamil.', 'articles/01M1C2NS96PZSZ48NY1KQ4M6F9.pdf', 'published', 0, 0, 1, 2, NULL, '2026-08-31 07:13:21', '2026-08-31 07:13:21'),
(16, 9, 'Aktivitas Fisik yang Aman untuk Ibu Hamil', 'aktivitas-fisik-yang-aman-untuk-ibu-hamil', 'articles/01M1C33B8W167D3C4M07T3E6GA.jpg', 'Tetap aktif bergerak selama masa kehamilan memberikan banyak manfaat fisik dan mental bagi calon ibu. Selama tidak ada komplikasi medis atau kontraindikasi dari dokter kandungan, olahraga berintensitas sedang sangat dianjurkan untuk mempersiapkan stamina tubuh menjelang proses persalinan serta mempercepat pemulihan pascamelahirkan', 'articles/01M1C33B97XJ7YKRK522BV971X.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:20:40', '2026-08-31 07:20:45', '2026-08-31 07:20:45'),
(17, 9, 'Pentingnya Istirahat dan Tidur yang Cukup Saat Hamil', 'pentingnya-istirahat-dan-tidur-yang-cukup-saat-hamil', 'articles/01M1C3EX8VKB3C1XS4CX2BX2BA.jpg', 'Kebutuhan tidur dan istirahat berkualitas meningkat secara signifikan selama masa kehamilan. Tubuh ibu bekerja tanpa henti untuk membentuk organ janin, membangun jaringan plasenta, dan menyesuaikan perubahan hormon serta peredaran darah. Kurang tidur yang berkepanjangan tidak hanya memicu kelelahan kronis pada ibu, tetapi juga berdampak langsung pada proses tumbuh kembang janin dan kelancaran persalinan.', 'articles/01M1C3EX95Q4VXA8WFCH4D498H.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:26:56', '2026-08-31 07:27:04', '2026-09-01 00:29:00'),
(18, 9, 'Persiapan Persalinan Sejak Masa Kehamilan', 'persiapan-persalinan-sejak-masa-kehamilan', 'articles/01M1C3N4GWJVBSX9KQS0PK5R3A.jpg', 'Mempersiapkan persalinan sejak jauh hari merupakan langkah penting untuk memastikan proses kelahiran berlangsung lancar, aman, dan minim stres. Persiapan yang matang tidak hanya mencakup aspek fisik, tetapi juga kesiapan mental, finansial, administratif, serta perencanaan medis bersama tenaga kesehatan.', 'articles/01M1C3N4HC6X9PS28H19R7Z85N.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:30:21', '2026-08-31 07:30:28', '2026-08-31 07:30:28'),
(19, 10, 'Pentingnya Gizi Seimbang untuk Pertumbuhan Balita', 'pentingnya-gizi-seimbang-untuk-pertumbuhan-balita', 'articles/01M1C47CRP4NKW00T7BYN6XZBP.jpg', 'Usia balita (1–5 tahun) merupakan fase emas (golden age) kedua setelah masa bayi. Pada periode ini, laju pertumbuhan fisik, perkembangan fungsi kognitif otak, dan pembentukan sistem kekebalan tubuh berlangsung sangat cepat. Pemenuhan gizi seimbang harian menjadi penentu utama dalam mencegah gagal tumbuh (stunting), menjaga daya tahan tubuh dari infeksi, serta mengoptimalkan potensi kecerdasan anak di masa depan.', 'articles/01M1C47CS2BXTXP9DFNH4P6MB0.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:40:21', '2026-08-31 07:40:26', '2026-08-31 07:40:26'),
(20, 10, 'Kenali Tanda-Tanda Balita Mendapatkan Gizi yang Cukup', 'kenali-tanda-tanda-balita-mendapatkan-gizi-yang-cukup', 'articles/01M1C4DH3RJFQCS7S3B7TNPQVN.jpg', 'Memastikan balita mendapatkan asupan gizi yang cukup tidak hanya diukur dari seberapa banyak makanan yang dihabiskan, melainkan dari status pertumbuhan fisik, perkembangan motorik, serta tingkat vitalitas sehari-hari. Pemantauan tanda-tanda kecukupan nutrisi secara rutin membantu orang tua memastikan anak tumbuh optimal sekaligus mendeteksi dini risiko malnutrisi atau gagal tumbuh (growth faltering).', 'articles/01M1C4DH432Q629GEQFCCRR1EX.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:43:42', '2026-08-31 07:43:47', '2026-09-01 00:30:22'),
(21, 10, 'Mencegah Stunting Sejak Dini pada Balita', 'mencegah-stunting-sejak-dini-pada-balita', 'articles/01M1C4MSTZSH2CXMCCC5XB7W8A.jpg', 'Stunting adalah gangguan pertumbuhan dan perkembangan anak akibat kekurangan gizi kronis serta infeksi berulang, yang ditandai dengan panjang atau tinggi badan anak berada di bawah standar kurva pertumbuhan WHO (kurang dari -2 standar deviasi / <-2\" SD\" ).\nPencegahan stunting harus dilakukan sedini mungkin karena dampaknya bersifat permanen jika tidak diintervensi sebelum anak berusia 2 tahun (1.000 Hari Pertama Kehidupan).\n', 'articles/01M1C4MSVA1B3HWBRD4V45R1QX.pdf', 'published', 0, 0, 1, 2, '2026-08-02 21:47:37', '2026-08-31 07:47:46', '2026-08-31 07:47:46'),
(22, 10, 'Pentingnya Protein Hewani untuk Tumbuh Kembang Balita', 'pentingnya-protein-hewani-untuk-tumbuh-kembang-balita', 'articles/01M1C51DBBM46TPKWM5J6VEQ0T.jpg', 'Protein hewani merupakan komponen nutrisi paling krusial dalam menu harian balita. Bukti klinis dan pedoman gizi Kementerian Kesehatan RI menegaskan bahwa konsumsi protein hewani memiliki efektivitas jauh lebih tinggi dalam memacu pertumbuhan linier (tinggi badan) dan mencegah gagal tumbuh (stunting) dibandingkan protein nabati.', 'articles/01M1C51DBQDNZPMQH920PZ5RD9.pdf', 'published', 0, 0, 1, 2, '2026-08-03 21:54:31', '2026-08-31 07:54:39', '2026-09-01 00:31:20'),
(23, 10, 'MPASI Bergizi untuk Anak Usia 6–23 Bulan', 'mpasi-bergizi-untuk-anak-usia-6-23-bulan', 'articles/01M1C5CE8KN7C15RF47W4EH1M4.jpg', 'Makanan Pendamping ASI (MPASI) adalah makanan atau minuman bergizi yang diberikan kepada bayi ketika ASI saja tidak lagi mencukupi kebutuhan nutrisinya. Periode usia 6 hingga 23 bulan merupakan jendela kritis (critical window) untuk mencegah gagal tumbuh (stunting), memenuhi kebutuhan zat besi, serta melatih keterampilan oromotorik (mengunyah dan menelan) anak.', 'articles/01M1C5CE91JPVTJVJF6XT17CMV.pdf', 'published', 0, 0, 1, 2, '2026-08-03 22:00:33', '2026-08-31 08:00:40', '2026-08-31 08:00:40'),
(24, 10, 'Panduan Memilih Makanan Sehat untuk Balita', 'panduan-memilih-makanan-sehat-untuk-balita', 'articles/01M1C5PHPWZVVHQBZF0KE5TGXJ.jpg', 'Memilih makanan yang tepat untuk balita (usia 1–5 tahun) merupakan investasi jangka panjang dalam membentuk kebiasaan makan sehat, menjaga imunitas, dan memastikan pertumbuhan fisik serta kognitif berjalan maksimal. Pada fase ini, kapasitas lambung anak masih relatif kecil, sehingga setiap gigitan makanan harus memiliki densitas nutrisi yang tinggi (nutrient-dense).', 'articles/01M1C5PHQ81YRFTDX7JDTQJWET.pdf', 'published', 0, 0, 1, 2, '2026-08-03 22:06:06', '2026-08-31 08:06:12', '2026-08-31 08:06:12'),
(25, 10, 'Jadwal Makan yang Baik untuk Balita', 'jadwal-makan-yang-baik-untuk-balita', 'articles/01M1C5VDHBYFAHQXZRDH93YS4T.jpg', 'Menerapkan jadwal makan yang teratur merupakan bagian fundamental dari feeding rules (aturan pemberian makan). Balita memiliki ukuran lambung yang kecil namun kebutuhan energi yang tinggi, sehingga mereka memerlukan jadwal makan yang terstruktur agar kebutuhan nutrisi harian terpenuhi tanpa memicu masalah makan seperti Gerakan Tutup Mulut (GTM) atau obesitas dini.', 'articles/01M1C5VDHPW4K1BDBS3TYHG0EJ.pdf', 'published', 0, 0, 1, 2, '2026-08-03 22:08:44', '2026-08-31 08:08:51', '2026-08-31 08:08:51'),
(26, 10, 'Manfaat Sayur dan Buah untuk Balita', 'manfaat-sayur-dan-buah-untuk-balita', 'articles/01M1C6CJMMYE3HHAMXE78BHJMH.jpg', 'Sayur dan buah merupakan pilar penting dalam pola makan seimbang balita. Kaya akan serat alami, air, vitamin, mineral, serta antioksidan, kelompok makanan ini berperan langsung dalam menjaga kesehatan saluran cerna, memperkuat daya tahan tubuh, dan menanamkan preferensi rasa sehat sejak usia dini.', 'articles/01M1C6CJN3M3JS5BKA77XN2S7R.pdf', 'published', 0, 0, 1, 2, '2026-08-03 22:17:52', '2026-08-31 08:18:13', '2026-08-31 08:18:13'),
(27, 10, 'Pentingnya Minum Air yang Cukup bagi Balita', 'pentingnya-minum-air-yang-cukup-bagi-balita', 'articles/01M1C7357FY8MB8Y662P4J9KHV.jpg', 'Kebutuhan hidrasi harian pada usia balita (1–5 tahun) sangat krusial karena proporsi air dalam tubuh anak lebih tinggi dibandingkan orang dewasa, yaitu sekitar 65–70%. Balita juga memiliki laju metabolisme yang lebih cepat dan permukaan tubuh yang relatif lebih luas, membuat mereka lebih cepat kehilangan cairan melalui keringat dan pernapasan, terutama saat aktif bergerak atau bermain.', 'articles/01M1C7357V4DWQETF0DA6WX303.pdf', 'published', 0, 0, 1, 2, '2026-08-04 22:30:27', '2026-08-31 08:30:33', '2026-08-31 08:30:33'),
(28, 10, 'Mengenal Berat Badan dan Tinggi Badan Ideal Balita', 'mengenal-berat-badan-dan-tinggi-badan-ideal-balita', 'articles/01M1C847KWSR8SW2SNNTKW966B.jpg', 'Memantau berat badan (BB) dan tinggi badan (TB) secara berkala merupakan indikator paling objektif untuk menilai status gizi dan kesehatan balita. Pertumbuhan fisik yang ideal tidak hanya menandakan anak cukup makan, tetapi juga memastikan proses pematangan organ, perkembangan otak, dan pembentukan sistem imun berjalan sesuai usianya.', 'articles/01M1C847M4KNDJZ0BRCX2EY3KF.pdf', 'published', 0, 0, 1, 2, '2026-08-04 22:48:31', '2026-08-31 08:48:37', '2026-08-31 08:48:37'),
(29, 10, 'Pentingnya Pemantauan Tumbuh Kembang di Posyandu', 'pentingnya-pemantauan-tumbuh-kembang-di-posyandu', 'articles/01M1C8BNJPZ12D73KQ2XTRPW19.jpg', 'Pos Pelayanan Terpadu (Posyandu) merupakan garda terdepan layanan kesehatan berbasis masyarakat yang berfokus pada pemantauan kesehatan ibu dan anak. Kunjungan rutin setiap bulan ke Posyandu sangat penting untuk memastikan setiap balita tumbuh sehat, berkembang sesuai usianya, serta mendapatkan deteksi dini jika terjadi gangguan pertumbuhan seperti stunting atau keterlambatan perkembangan (developmental delay).', 'articles/01M1C8BNJYYAWJKY0PWMT6QMPE.pdf', 'published', 0, 0, 1, 2, '2026-08-04 22:52:35', '2026-08-31 08:52:41', '2026-08-31 08:52:41'),
(30, 10, 'Kenapa Balita Perlu Ditimbang Setiap Bulan', 'kenapa-balita-perlu-ditimbang-setiap-bulan', 'articles/01M1C9079SE88ZA37RVRR24SDR.jpg', 'Penimbangan berat badan balita secara rutin setiap bulan (terutama pada usia 0–24 bulan) merupakan langkah deteksi dini paling sederhana namun krusial dalam dunia kesehatan anak. Berat badan adalah indikator antropometri yang paling sensitif dan paling cepat berubah merespons status kesehatan, asupan nutrisi, maupun adanya infeksi pada anak.', 'articles/01M1C907A4EQ9PRT0GTYRKFM46.pdf', 'published', 0, 0, 1, 2, '2026-08-04 23:03:50', '2026-08-31 09:03:54', '2026-09-01 00:31:54'),
(31, 10, 'Kenali Tanda-Tanda Pertumbuhan Balita yang Perlu Diperhatikan', 'kenali-tanda-tanda-pertumbuhan-balita-yang-perlu-diperhatikan', 'articles/01M1CEDE41QCAYGKVB2ECG9GG9.jpg', 'Memantau laju pertumbuhan fisik balita secara berkala memungkinkan orang tua mendeteksi masalah kesehatan atau defisiensi gizi sedini mungkin. Gangguan pertumbuhan yang tidak segera ditangani dapat berdampak permanen pada tinggi badan dewasa, sistem imun, hingga perkembangan kognitif anak.', 'articles/01M1CEDE4F76M8VMXF86ZMSG8A.pdf', 'published', 0, 0, 1, 2, '2026-09-05 00:38:24', '2026-08-31 10:38:30', '2026-08-31 10:38:30'),
(32, 10, 'Pentingnya Imunisasi bagi Balita', 'pentingnya-imunisasi-bagi-balita', 'articles/01M1CEJ3EN36CWHBWT6CRFV934.jpg', 'Imunisasi merupakan salah satu intervensi kesehatan masyarakat yang paling efektif dan hemat biaya untuk melindungi anak dari berbagai penyakit infeksi berbahaya yang dapat dicegah dengan imunisasi (PD3I). Pada masa balita, sistem kekebalan tubuh anak masih dalam tahap pematangan, sehingga pemberian vaksin sangat krusial untuk melatih tubuh mengenali dan melawan patogen penyebab penyakit berat, kecacatan, hingga kematian.', 'articles/01M1CEJ3F04PS199MSPKDCSAW1.pdf', 'published', 0, 0, 1, 2, '2026-09-05 00:40:57', '2026-08-31 10:41:03', '2026-08-31 10:41:03'),
(33, 10, 'Kenali Gejala Kekurangan Gizi pada Balita', 'kenali-gejala-kekurangan-gizi-pada-balita', 'articles/01M1CF03T3FR6Y6GN5FFPZ3JY9.jpg', 'Kekurangan gizi (malnutrisi) pada balita terjadi ketika tubuh tidak menerima asupan energi, protein, vitamin, atau mineral yang cukup sesuai kebutuhan tumbuh kembangnya. Mengidentifikasi gejala defisiensi gizi sejak stadium awal sangat krusial agar intervensi medis dan perbaikan nutrisi dapat dilakukan sebelum menimbulkan dampak permanen pada perkembangan otak, organ tubuh, dan pertumbuhan fisik anak.', 'articles/01M1CF03THKY1MG8KHEFCQC7Z7.pdf', 'published', 0, 0, 1, 2, '2026-09-05 00:48:36', '2026-08-31 10:48:42', '2026-08-31 10:48:42'),
(34, 10, 'Gizi Kurang pada Balita: Penyebab dan Cara Mencegahnya', 'gizi-kurang-pada-balita-penyebab-dan-cara-mencegahnya', 'articles/01M1CFE0E6EMT6JEB966EN8V3T.jpg', 'Gizi kurang (underweight/wasting) merupakan kondisi ketika asupan zat gizi balita tidak mencukupi kebutuhan metabolisme dan laju pertumbuhan tubuhnya, yang ditandai dengan berat badan menurut umur (BB/U) atau berat badan menurut panjang/tinggi badan (BB/PB atau BB/TB) berada di rentang -3 SD sampai dengan < -2 SD berdasarkan kurva standar WHO/Kemenkes RI.\nKondisi ini merupakan fase peralihan kritis sebelum berkembang menjadi gizi buruk, sehingga pemahaman mengenai akar penyebab dan tindakan pencegahannya menjadi kunci utama menyelamatkan potensi tumbuh kembang anak.\n', 'articles/01M1CFE0EKA8NA5KDEQRENVCG7.pdf', 'published', 0, 0, 1, 2, '2026-09-05 00:56:12', '2026-08-31 10:56:18', '2026-09-01 00:32:54'),
(35, 10, 'Mengenal Stunting dan Cara Mencegahnya', 'mengenal-stunting-dan-cara-mencegahnya', 'articles/01M1CFKM84Z36ZVB9KTH7WF7W1.jpg', 'Stunting adalah kondisi gagal tumbuh pada anak balita akibat kekurangan gizi kronis dan infeksi berulang, terutama pada 1.000 Hari Pertama Kehidupan (HPK)—yaitu sejak masa pembuahan di dalam kandungan hingga anak berusia 2 tahun. Anak dikategorikan stunting jika panjang atau tinggi badannya berada di bawah minus dua standar deviasi (<-2\" SD\" ) dari kurva standar pertumbuhan anak WHO/Kemenkes RI.', 'articles/01M1CFKM8EE8SJPAY2H6CDNN4Q.pdf', 'published', 0, 0, 1, 2, '2026-09-05 00:59:15', '2026-08-31 10:59:22', '2026-08-31 10:59:22'),
(36, 10, 'Peran Orang Tua dalam Mencegah Stunting', 'peran-orang-tua-dalam-mencegah-stunting', 'articles/01M1CG2VNCT5FK0W44HRWSPQKZ.jpg', 'Keluarga, khususnya orang tua, merupakan benteng utama dalam pencegahan stunting pada anak. Pencegahan tidak hanya bergantung pada fasilitas kesehatan atau program pemerintah, melainkan berakar dari keputusan harian yang diambil orang tua di rumah—mulai dari pemilihan bahan pangan, pola asuh, pembiasaan sanitasi, hingga disiplin dalam memantau tumbuh kembang anak secara konsisten.', 'articles/01M1CG2VNN72XQPW49WV085DR3.pdf', 'published', 0, 0, 1, 2, '2026-09-05 01:06:51', '2026-08-31 11:07:41', '2026-08-31 11:07:41'),
(37, 10, '1000 Hari Pertama Kehidupan dan Peran Orang Tua', '1000-hari-pertama-kehidupan-dan-peran-orang-tua', 'articles/01M1CGAY0RKK7JGGY1CERCSW3F.jpg', '1000 Hari Pertama Kehidupan (1000 HPK) adalah periode penting yang dihitung mulai dari saat terbentuknya janin di dalam kandungan (270 hari) hingga anak mencapai usia 2 tahun (730 hari). Periode ini sering disebut sebagai \"Periode Emas\" (Golden Period) atau jendela kesempatan (window of opportunity) karena seluruh fondasi kesehatan fisik, kecerdasan otak, metabolisme tubuh, dan ketahanan imun anak terbentuk pada fase ini.', 'articles/01M1CGAY13D1QQDEX5703SHVVG.pdf', 'published', 0, 0, 1, 2, '2026-09-06 01:11:59', '2026-08-31 11:12:05', '2026-08-31 11:12:05'),
(38, 10, 'Makanan yang Sebaiknya Dibatasi untuk Balita', 'makanan-yang-sebaiknya-dibatasi-untuk-balita', 'articles/01M1CGJZVDEAEA4D11T8J5PVQ3.jpg', 'Kapasitas lambung balita masih relatif kecil, sehingga setiap makanan yang masuk sebaiknya memiliki kepadatan nutrisi yang tinggi (nutrient-dense). Memberikan makanan yang salah atau minim nutrisi tidak hanya mengisi perut dengan kalori kosong (empty calories), tetapi juga dapat mengganggu penyerapan zat gizi penting, merusak preferensi rasa alami anak, serta meningkatkan risiko obesitas, karies gigi, hingga masalah metabolisme jangka panjang.', 'articles/01M1CGJZVR5CZK21F1V674JFBF.pdf', 'published', 0, 0, 1, 2, '2026-09-06 01:16:25', '2026-08-31 11:16:29', '2026-09-01 00:33:20'),
(39, 10, 'Tips Mengatasi Anak yang Susah Makan', 'tips-mengatasi-anak-yang-susah-makan', 'articles/01M1CGRF99VMA8187YFJ5G5PDJ.jpg', 'Fenomena anak susah makan atau Gerakan Tutup Mulut (GTM) merupakan salah satu tantangan paling umum yang dihadapi orang tua pada masa balita. Kondisi ini sering kali dipicu oleh fase perkembangan alami anak (seperti fase neophobia atau takut mencoba makanan baru), kebiasaan makan yang kurang tepat, hingga gangguan kesehatan tertentu.\nPenanganan yang terstruktur dan konsisten sangat penting agar kebutuhan nutrisi anak tetap terpenuhi tanpa menimbulkan trauma saat jam makan.\n', 'articles/01M1CGRF9NFEAD7BGXQP38ZGGC.pdf', 'published', 0, 0, 1, 2, '2026-09-06 01:19:22', '2026-08-31 11:19:29', '2026-08-31 11:19:29'),
(40, 11, 'Apa Itu Program Makan Bergizi Gratis (MBG)?', 'apa-itu-program-makan-bergizi-gratis-mbg', 'articles/01M1DTTWFCDG8TET1XH3AG2QX9.jpg', 'Program Makan Bergizi Gratis (MBG) adalah program strategis nasional pemerintah Indonesia yang bertujuan menyediakan makanan bergizi secara cuma-cuma kepada kelompok sasaran prioritas. Program ini dirancang untuk meningkatkan status gizi masyarakat, menekan angka gagal tumbuh (stunting), meningkatkan kualitas kesehatan fisik dan kecerdasan anak, serta mendukung penguatan sumber daya manusia menuju visi Indonesia Emas.', 'articles/01M1DTTWFVSX8PH2VCG4AW0T56.pdf', 'published', 0, 0, 1, 2, '2026-09-07 13:33:28', '2026-08-31 23:34:48', '2026-08-31 23:34:48'),
(41, 11, 'Program MBG untuk Ibu Hamil dan Balita', 'program-mbg-untuk-ibu-hamil-dan-balita', 'articles/01M1DV506AJ45NZ37D43Y26J18.jpg', 'Program Makan Bergizi Gratis (MBG) menempatkan ibu hamil, ibu menyusui, dan balita sebagai kelompok sasaran prioritas non-sekolah. Intervensi pada fase 1.000 Hari Pertama Kehidupan (HPK) ini dirancang secara khusus untuk mengatasi akar masalah malnutrisi dari hulu guna mencegah kelahiran bayi dengan Berat Badan Lahir Rendah (BBLR) serta menghentikan risiko gagal tumbuh (stunting) sejak dini.', 'articles/01M1DV506MBP9BEEZ113DKVX46.pdf', 'published', 0, 0, 1, 2, '2026-09-07 13:40:06', '2026-08-31 23:40:20', '2026-08-31 23:40:20'),
(42, 11, 'Peran MBG dalam Pencegahan Stunting', 'peran-mbg-dalam-pencegahan-stunting', 'articles/01M1DVABQX560Q4DYXQQJBSJQT.jpg', 'Program Makan Bergizi Gratis (MBG) bertindak sebagai intervensi gizi spesifik berskala nasional yang menargetkan akar penyebab gagal tumbuh (stunting). Dengan mengintervensi titik-titik paling kritis dalam siklus hidup—terutama pada periode 1.000 Hari Pertama Kehidupan (HPK) dan masa pertumbuhan anak—program ini bekerja secara sistematis untuk memutus transmisi kemiskinan nutrisi antargenerasi.', 'articles/01M1DVABR9Z8TYSB2VSDEK2V0A.pdf', 'published', 0, 0, 1, 2, '2026-09-07 13:43:07', '2026-08-31 23:43:15', '2026-08-31 23:43:15'),
(43, 11, 'Pentingnya Gizi Seimbang dalam Program MBG', 'pentingnya-gizi-seimbang-dalam-program-mbg', 'articles/01M1DVPN3GTABTHSHFP34P5B22.jpg', 'Prinsip Gizi Seimbang merupakan fondasi utama dalam pelaksanaan Program Makan Bergizi Gratis (MBG). Program ini tidak sekadar berfokus pada pemenuhan rasa kenyang atau suplai kalori semata, melainkan memastikan proporsi zat gizi makro (karbohidrat, protein, lemak) dan zat gizi mikro (vitamin, mineral, dan cairan) terpenuhi secara proporsional sesuai Angka Kecukupan Gizi (AKG) setiap kelompok sasaran.', 'articles/01M1DVPN3WW5WBT17EHXK6DMCX.pdf', 'published', 0, 0, 1, 2, '2026-09-07 13:49:50', '2026-08-31 23:49:58', '2026-08-31 23:49:58'),
(44, 11, 'Keamanan Pangan dalam Program Makan Bergizi Gratis (MBG)', 'keamanan-pangan-dalam-program-makan-bergizi-gratis-mbg', 'articles/01M1DWSKCDQKE1SJVE7VZKGKSD.jpg', 'Keamanan pangan (food safety) merupakan pilar non-negosiasi dalam pelaksanaan Program Makan Bergizi Gratis (MBG). Makanan yang kaya nutrisi akan kehilangan seluruh manfaat kesehatannya jika terkontaminasi oleh patogen biologis, cemaran kimia, atau benda fisik. Penerapan standar keamanan pangan yang ketat di seluruh rantai pasok—mulai dari pemilihan bahan baku, pengolahan di dapur Satuan Pelayanan Pemenuhan Gizi (SPPG), hingga distribusi ke ruang kelas—menjadi jaminan mutlak untuk mencegah Kejadian Luar Biasa (KLB) keracunan pangan.', 'articles/01M1DWSKCQAG1VWME9JZ6D6JK0.pdf', 'published', 0, 0, 1, 2, '2026-09-07 14:08:37', '2026-09-01 00:09:03', '2026-09-01 00:09:03'),
(45, 11, 'Peran Orang Tua dalam Mendukung Program Makan Bergizi Gratis (MBG)', 'peran-orang-tua-dalam-mendukung-program-makan-bergizi-gratis-mbg', 'articles/01M1DX80VKM4DQXTNRJD53SFGP.jpg', 'Program Makan Bergizi Gratis (MBG) membutuhkan sinergi erat antara sekolah, penyedia makanan di Satuan Pelayanan Pemenuhan Gizi (SPPG), dan keluarga di rumah. Keterlibatan aktif orang tua merupakan kunci utama agar manfaat nutrisi yang diperoleh anak di sekolah dapat diteruskan menjadi pola hidup sehat yang berkelanjutan di lingkungan keluarga.', 'articles/01M1DX80VXFR61WGHNCATM0QN1.pdf', 'published', 0, 0, 1, 2, '2026-09-08 14:16:48', '2026-09-01 00:16:56', '2026-09-01 00:16:56');

-- --------------------------------------------------------

--
-- Table structure for table `beneficiaries`
--

CREATE TABLE `beneficiaries` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beneficiary_categories`
--

CREATE TABLE `beneficiary_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `description` text,
  `icon` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT 'primary',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `icon`, `color`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'Kesehatan', 'kesehatan', 'tentang kesehatan', 'kesehatan', '#a6d2ff', 1, '2026-07-13 02:22:40', '2026-07-13 02:22:40'),
(6, 'mbg', 'mbg', 'tentang mbg', 'mbg', '#36f01f', 1, '2026-07-15 02:12:35', '2026-07-15 02:12:35'),
(7, 'Gizi', 'gizi', 'tentang gizi', 'gizi', '#19d1cc', 1, '2026-07-15 02:17:25', '2026-07-15 02:17:25'),
(9, 'Ibu Hamil', 'ibu-hamilI', 'Kumpulan artikel edukasi mengenai gizi, kesehatan, dan kebutuhan nutrisi selama masa kehamilan untuk mendukung kesehatan ibu dan pertumbuhan janin.', 'ibu_hamil', '#E91E63', 1, '2026-08-31 05:47:20', '2026-08-31 05:47:20'),
(10, 'Balita', 'balita', 'Kumpulan artikel edukasi mengenai gizi, pertumbuhan, perkembangan, pola makan, dan kesehatan anak balita.', 'balita', '#4CAF50', 1, '2026-08-31 05:49:33', '2026-08-31 05:49:33'),
(11, 'MBG', 'mbg.', 'Kumpulan artikel edukasi mengenai Program Makan Bergizi Gratis (MBG), manfaat makanan bergizi, komposisi menu, keamanan pangan, dan pemenuhan kebutuhan gizi.', 'mbg', '#1976D2', 1, '2026-08-31 05:50:44', '2026-08-31 05:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `confirmations`
--

CREATE TABLE `confirmations` (
  `id` bigint UNSIGNED NOT NULL,
  `distribution_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `rating` tinyint DEFAULT NULL,
  `kritik` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `status` enum('menunggu','diterima','ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'menunggu',
  `admin_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `confirmations`
--

INSERT INTO `confirmations` (`id`, `distribution_id`, `user_id`, `rating`, `kritik`, `photo`, `latitude`, `longitude`, `received_at`, `status`, `admin_note`, `created_at`, `updated_at`) VALUES
(2, 3, 9, 5, 'aaaa', 'confirmations/YNUXokBYrFJ19KEd0lBC0bhAZBg3nvEkRZgQgpfX.jpg', '0.00000000', '0.00000000', '2026-07-20 03:52:48', 'diterima', NULL, '2026-07-19 20:52:48', '2026-07-19 20:52:48'),
(3, 5, 9, 5, 'test', 'confirmations/qPSiPLUUG07cSsdrXLoxjg1Mb9gk6fjMkVknbWjz.jpg', '37.42199830', '-122.08400000', '2026-07-22 04:33:02', 'diterima', NULL, '2026-07-21 21:33:02', '2026-07-21 21:33:02'),
(4, 6, 12, 5, 'enakkk', 'confirmations/zZ6mRwjQ6hEqrKoFDRZo3n1m7HAVjklYATrBezHr.jpg', '-6.90751960', '109.14798620', '2026-07-26 15:36:32', 'diterima', NULL, '2026-07-26 08:36:32', '2026-07-26 08:36:32'),
(5, 10, 14, 4, 'kurang asin', 'confirmations/rDcVNE026Y2G9AwgwSiJVctAuetanX6LHJNV8yyX.jpg', '-6.86838860', '109.10645320', '2026-08-04 09:44:34', 'diterima', NULL, '2026-08-04 02:44:34', '2026-08-04 02:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `confirmation_photos`
--

CREATE TABLE `confirmation_photos` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `distributions`
--

CREATE TABLE `distributions` (
  `id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint UNSIGNED DEFAULT NULL,
  `menu_id` bigint UNSIGNED DEFAULT NULL,
  `jumlah_dikirim` int DEFAULT '0',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'persiapan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `distributions`
--

INSERT INTO `distributions` (`id`, `schedule_id`, `menu_id`, `jumlah_dikirim`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(3, 5, 4, 3000, 'Paket 3000 MBG Ibu Hamil', 'dikirim', '2026-07-16 20:41:38', '2026-07-16 20:47:26'),
(4, 6, 5, 100, NULL, 'dikirim', '2026-07-17 02:08:46', '2026-07-17 02:10:56'),
(5, 7, 6, 100, 'Menuju Posyandu melati', 'dikirim', '2026-07-21 20:37:28', '2026-07-21 20:39:52'),
(6, 9, 7, 20, 'posyandu melati', 'dikirim', '2026-07-26 08:17:05', '2026-07-26 08:23:26'),
(7, 10, 8, 12, 'bagikan', 'selesai', '2026-08-04 01:12:13', '2026-08-04 01:23:00'),
(8, 11, 9, 20, 'enak', 'selesai', '2026-08-04 01:30:57', '2026-08-04 01:43:51'),
(9, 12, 10, 20, NULL, 'dikirim', '2026-08-04 01:46:07', '2026-08-04 02:19:06'),
(10, 13, 11, 15, 'enak', 'selesai', '2026-08-04 02:25:10', '2026-08-04 02:35:43'),
(11, 14, 12, 19, NULL, 'dikirim', '2026-08-19 01:52:47', '2026-08-19 02:03:32'),
(12, 15, 13, 0, NULL, 'persiapan', '2026-08-27 08:18:35', '2026-08-27 08:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mbg_menus`
--

CREATE TABLE `mbg_menus` (
  `id` bigint UNSIGNED NOT NULL,
  `schedule_id` bigint UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Menu Hari Ini',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mbg_menus`
--

INSERT INTO `mbg_menus` (`id`, `schedule_id`, `date`, `title`, `image`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 5, '2026-07-20', 'Menu Hari Ini', 'menus/01KXQ2P25C83PXDXKP1EY3QM9R.jpg', 'Menu sehat dengan gizi seimbang', 1, '2026-07-16 20:41:38', '2026-07-16 20:42:21'),
(5, 6, '2026-07-17', 'Menu Hari Ini', 'menus/01KXQND5WHQN9Y8YB3ZHDZF9J3.jpg', 'Menu Sehat', 1, '2026-07-17 02:08:46', '2026-07-17 02:09:33'),
(6, 7, '2026-07-22', 'Menu Hari Ini', 'menus/01KY3YF6J532EHFNTCNV1S9X72.jpg', 'Menu Sehat untuk balita dan ibu hamil', 1, '2026-07-21 20:37:28', '2026-07-21 20:38:50'),
(7, 9, '2026-07-26', 'Menu Hari Ini', 'menus/01KYFG3FK9F7JANNPN3F1Z6CX3.jpg', 'Menu Sehat dengan kandungan gizi seimbang', 1, '2026-07-26 08:17:05', '2026-07-26 08:18:39'),
(8, 10, '2026-08-05', 'Menu Hari Ini', 'menus/01KZ5XR8Q40RRNZ6Z0FSJXC2C9.jpg', 'Tinggi protein, zat besi, vitamin A, dan kalsium untuk mendukung pertumbuhan balita serta kesehatan ibu hamil.', 1, '2026-08-04 01:12:13', '2026-08-04 01:20:29'),
(9, 11, '2026-08-03', 'Menu Hari Ini', NULL, NULL, 1, '2026-08-04 01:30:57', '2026-08-04 01:30:57'),
(10, 12, '2026-08-06', 'Menu Hari Ini', NULL, NULL, 1, '2026-08-04 01:46:07', '2026-08-04 01:46:07'),
(11, 13, '2026-08-04', 'Menu Hari Ini', 'menus/01KZ61H1VQ9CHF5KD65EZGWBQR.jpg', 'Mendukung tumbuh kembang balita, menjaga kesehatan ibu hamil, dan memperkuat tulang serta otot.', 1, '2026-08-04 02:25:10', '2026-08-04 02:26:27'),
(12, 14, '2026-08-19', 'Menu Hari Ini', 'menus/01M0CM3RYZ0PGC12RSSCCE0EKW.jpg', 'Paket makanan bergizi yang terdiri dari nasi putih sebagai sumber karbohidrat, ayam sebagai sumber protein hewani, tumis buncis sebagai sumber serat dan vitamin, tahu sebagai sumber protein nabati, serta stroberi dan susu sebagai pelengkap untuk mendukung kebutuhan gizi ibu hamil dan balita', 1, '2026-08-19 01:52:47', '2026-08-19 02:02:23'),
(13, 15, '2026-08-17', 'Menu Hari Ini', NULL, NULL, 1, '2026-08-27 08:18:35', '2026-08-27 08:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `mbg_menu_benefits`
--

CREATE TABLE `mbg_menu_benefits` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mbg_menu_benefits`
--

INSERT INTO `mbg_menu_benefits` (`id`, `menu_id`, `description`, `sort`, `created_at`, `updated_at`) VALUES
(8, 4, 'Ayam sebagai sumber protein', 1, '2026-07-16 20:43:59', '2026-07-16 20:43:59'),
(9, 4, 'Nasi sebagai sumber karbohidrat', 2, '2026-07-16 20:44:09', '2026-07-16 20:44:09'),
(10, 4, 'Jeruk sebagi sumber vitamin C', 3, '2026-07-16 20:44:20', '2026-07-16 20:44:20'),
(11, 5, 'Ayam Sebagi sumber protein', 1, '2026-07-17 02:10:41', '2026-07-17 02:10:41'),
(12, 6, 'Ayam sebagai sumber protein', 1, '2026-07-21 20:39:27', '2026-07-21 20:39:27'),
(13, 7, 'Ayam sebagi sumber protein', 1, '2026-07-26 08:22:04', '2026-07-26 08:22:04'),
(14, 7, 'Nasi Kuning sebagai sumber karbohidrat', 2, '2026-07-26 08:22:21', '2026-07-26 08:22:42'),
(15, 7, 'Pisang sebagai sumber vitamin', 3, '2026-07-26 08:22:30', '2026-07-26 08:22:54'),
(16, 8, 'Menambah energi, membantu pembentukan otot dan jaringan tubuh, memenuhi kebutuhan vitamin dan mineral, serta menjaga keseimbangan gizi harian.', 1, '2026-08-04 01:21:12', '2026-08-04 01:21:12'),
(17, 9, 'Membantu memenuhi kebutuhan energi, mendukung pertumbuhan balita, memperkuat tulang dan gigi, serta membantu mencegah anemia pada ibu hamil.', 1, '2026-08-04 01:43:12', '2026-08-04 01:43:12'),
(18, 10, 'Mendukung perkembangan otak janin dan balita, meningkatkan daya tahan tubuh, menjaga kesehatan mata, dan melancarkan pencernaan.', 1, '2026-08-04 01:54:21', '2026-08-04 01:54:21'),
(19, 11, 'Mendukung pertumbuhan optimal, menjaga kesehatan tulang dan otot, meningkatkan daya tahan tubuh, serta membantu memenuhi kebutuhan protein dan kalsium.', 1, '2026-08-04 02:35:14', '2026-08-04 02:35:14'),
(20, 12, 'Membantu memenuhi kebutuhan energi, protein, vitamin, mineral, dan serat yang dibutuhkan untuk mendukung pertumbuhan serta menjaga kesehatan ibu dan anak', 1, '2026-08-19 02:02:11', '2026-08-19 02:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `mbg_menu_items`
--

CREATE TABLE `mbg_menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mbg_menu_items`
--

INSERT INTO `mbg_menu_items` (`id`, `menu_id`, `name`, `type`, `sort`, `created_at`, `updated_at`) VALUES
(9, 4, 'Ayam Katsu', 'protein', 1, '2026-07-16 20:42:33', '2026-07-16 20:42:33'),
(10, 4, 'Tempe', 'protein', 2, '2026-07-16 20:42:45', '2026-07-16 20:42:45'),
(11, 4, 'Jeruk', 'buah', 3, '2026-07-16 20:42:52', '2026-07-16 20:42:52'),
(12, 4, 'Nasi', 'karbohidrat', 4, '2026-07-16 20:43:00', '2026-07-16 20:43:00'),
(13, 5, 'Ayam Katsu', 'protein', 1, '2026-07-17 02:09:49', '2026-07-17 02:09:49'),
(14, 5, 'Jeruk', 'buah', 2, '2026-07-17 02:09:57', '2026-07-17 02:09:57'),
(15, 6, 'Ayam Kecap', 'protein', 1, '2026-07-21 20:38:00', '2026-07-21 20:38:00'),
(16, 6, 'Apel', 'buah', 2, '2026-07-21 20:38:09', '2026-07-21 20:38:09'),
(17, 6, 'Nasi', 'karbohidrat', 3, '2026-07-21 20:38:16', '2026-07-21 20:38:16'),
(18, 7, 'Nasi Kuning', 'karbohidrat', 1, '2026-07-26 08:19:01', '2026-07-26 08:19:01'),
(19, 7, 'Ayam', 'protein', 2, '2026-07-26 08:19:13', '2026-07-26 08:19:13'),
(20, 7, 'Sayuran', 'sayuran', 3, '2026-07-26 08:19:22', '2026-07-26 08:19:22'),
(21, 7, 'Pisang', 'buah', 4, '2026-07-26 08:19:35', '2026-07-26 08:19:35'),
(22, 7, 'Telor', 'protein', 5, '2026-07-26 08:19:54', '2026-07-26 08:19:54'),
(23, 7, 'Susu ', 'minuman', 6, '2026-07-26 08:20:06', '2026-07-26 08:20:18'),
(24, 8, 'Nasi', 'karbohidrat', 1, '2026-08-04 01:14:53', '2026-08-04 01:14:53'),
(25, 8, 'Ayam kecap', 'protein', 2, '2026-08-04 01:15:07', '2026-08-04 01:15:07'),
(26, 8, 'Tempe Goreng', 'lainnya', 3, '2026-08-04 01:15:30', '2026-08-04 01:15:30'),
(27, 8, 'Sayur Sop', 'sayuran', 4, '2026-08-04 01:15:45', '2026-08-04 01:15:45'),
(28, 8, 'Semangka', 'buah', 5, '2026-08-04 01:16:06', '2026-08-04 01:16:06'),
(29, 9, 'Nasi ', 'karbohidrat', 1, '2026-08-04 01:33:34', '2026-08-04 01:33:34'),
(30, 9, 'Ayam Bumbu Kuning', 'protein', 2, '2026-08-04 01:33:52', '2026-08-04 01:33:52'),
(31, 9, 'Tumis Bayam', 'sayuran', 3, '2026-08-04 01:35:51', '2026-08-04 01:35:51'),
(32, 9, 'pisang', 'buah', 4, '2026-08-04 01:36:12', '2026-08-04 01:36:12'),
(33, 9, 'susu', 'minuman', 5, '2026-08-04 01:36:24', '2026-08-04 01:36:24'),
(34, 10, 'Nasi', 'karbohidrat', 1, '2026-08-04 01:47:26', '2026-08-04 01:47:26'),
(35, 10, 'Ikan Kembung Bakar', 'protein', 2, '2026-08-04 01:47:59', '2026-08-04 01:47:59'),
(36, 10, 'Sayur Bayam', 'sayuran', 3, '2026-08-04 01:49:23', '2026-08-04 01:49:23'),
(37, 10, 'Pepaya', 'buah', 4, '2026-08-04 01:49:45', '2026-08-04 01:49:45'),
(38, 11, 'Nasi', 'karbohidrat', 1, '2026-08-04 02:26:43', '2026-08-04 02:26:43'),
(39, 11, 'Ikan Tongkol', 'protein', 2, '2026-08-04 02:27:02', '2026-08-04 02:27:02'),
(40, 11, 'Cah Kangkung', 'sayuran', 3, '2026-08-04 02:27:23', '2026-08-04 02:27:23'),
(41, 11, 'Melon', 'buah', 4, '2026-08-04 02:27:42', '2026-08-04 02:27:42'),
(42, 11, 'Susu', 'minuman', 5, '2026-08-04 02:27:56', '2026-08-04 02:27:56'),
(43, 12, 'Nasi Putih', 'karbohidrat', 1, '2026-08-19 01:56:31', '2026-08-19 01:56:31'),
(44, 12, 'Ayam Berbumbu', 'protein', 2, '2026-08-19 01:56:54', '2026-08-19 01:56:54'),
(45, 12, 'Tumis Buncis', 'sayuran', 3, '2026-08-19 01:57:08', '2026-08-19 01:57:08'),
(46, 12, 'Tahu Goreng', 'lainnya', 4, '2026-08-19 01:57:26', '2026-08-19 01:57:26'),
(47, 12, 'Stroberi', 'buah', 5, '2026-08-19 01:57:51', '2026-08-19 01:57:51'),
(48, 12, 'Susu Cokelat', 'minuman', 6, '2026-08-19 01:58:07', '2026-08-19 01:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `mbg_menu_nutritions`
--

CREATE TABLE `mbg_menu_nutritions` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mbg_menu_nutritions`
--

INSERT INTO `mbg_menu_nutritions` (`id`, `menu_id`, `name`, `value`, `sort`, `created_at`, `updated_at`) VALUES
(8, 4, 'Kalori', '550 kkal', 1, '2026-07-16 20:43:21', '2026-07-16 20:43:21'),
(9, 4, 'Vitamin A', '550 kkal', 2, '2026-07-16 20:43:27', '2026-07-16 20:43:27'),
(10, 4, 'Protein', '550 kkal', 3, '2026-07-16 20:43:34', '2026-07-16 20:43:34'),
(11, 5, 'Protein', '550 kkal', 1, '2026-07-17 02:10:14', '2026-07-17 02:10:14'),
(12, 5, 'Kalori', '550 kkal', 2, '2026-07-17 02:10:25', '2026-07-17 02:10:25'),
(13, 6, 'Kalori', '550 kkal', 1, '2026-07-21 20:39:02', '2026-07-21 20:39:02'),
(14, 6, 'Protein', '550 kkal', 2, '2026-07-21 20:39:11', '2026-07-21 20:39:11'),
(15, 7, 'Protein', '550 kkal', 1, '2026-07-26 08:20:46', '2026-07-26 08:21:35'),
(16, 7, 'Karbohidrat', '200 kkal', 2, '2026-07-26 08:21:05', '2026-07-26 08:21:05'),
(17, 8, 'Nasi', '660 kkl', 1, '2026-08-04 01:17:46', '2026-08-04 01:17:46'),
(18, 8, 'Ayam Kecap', '80 g', 2, '2026-08-04 01:18:26', '2026-08-04 01:18:26'),
(19, 8, 'Tempe Goreng', '33 g', 3, '2026-08-04 01:19:03', '2026-08-04 01:19:03'),
(20, 8, 'Sayur Sop', '20 g', 4, '2026-08-04 01:20:10', '2026-08-04 01:20:10'),
(21, 8, 'susu uht full cream', '30 g', 5, '2026-08-04 01:20:24', '2026-08-04 01:20:24'),
(22, 9, 'Nasi', '660 kkl', 1, '2026-08-04 01:38:32', '2026-08-04 01:38:32'),
(23, 9, 'Ayam Bumbu Kuning', '23 g', 2, '2026-08-04 01:40:17', '2026-08-04 01:40:17'),
(24, 9, 'Tumis Bayam', '470 mcg', 3, '2026-08-04 01:41:22', '2026-08-04 01:41:22'),
(25, 9, 'Pisang', '23 g', 4, '2026-08-04 01:42:01', '2026-08-04 01:42:01'),
(26, 9, 'Susu', '6 g', 5, '2026-08-04 01:42:38', '2026-08-04 01:42:38'),
(27, 10, 'Nasi', '42 g', 1, '2026-08-04 01:50:43', '2026-08-04 01:50:43'),
(28, 10, 'Ikan Kembung', '20 g', 3, '2026-08-04 01:52:24', '2026-08-04 01:52:24'),
(29, 10, 'Sayur Bening Bayam', '470 mcg', 2, '2026-08-04 01:52:47', '2026-08-04 01:52:47'),
(30, 10, 'Pepaya', '60 mg', 4, '2026-08-04 01:53:09', '2026-08-04 01:53:09'),
(31, 11, 'Karbohidrat', '42 g', 1, '2026-08-04 02:29:43', '2026-08-04 02:29:43'),
(32, 11, 'Protein', '22 g', 2, '2026-08-04 02:30:17', '2026-08-04 02:30:17'),
(33, 11, 'Vitamin A', '315 mcg', 3, '2026-08-04 02:30:52', '2026-08-04 02:30:52'),
(34, 11, 'Karbohidrat', '8 G', 4, '2026-08-04 02:31:27', '2026-08-04 02:31:27'),
(35, 11, 'Protein', '6 mg', 5, '2026-08-04 02:31:53', '2026-08-04 02:34:41'),
(36, 12, 'kalori', '550 kkal', 1, '2026-08-19 01:59:47', '2026-08-19 01:59:47'),
(37, 12, 'protein', '25 9', 2, '2026-08-19 02:00:13', '2026-08-19 02:00:28'),
(38, 12, 'karbohidrat', '75 9', 3, '2026-08-19 02:00:51', '2026-08-19 02:00:51'),
(39, 12, 'lemak', '18 g', 4, '2026-08-19 02:01:12', '2026-08-19 02:01:12'),
(40, 12, 'Vitamin C', '30 mg', 5, '2026-08-19 02:01:40', '2026-08-19 02:01:40');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_06_19_035544_create_sppgs_table', 1),
(6, '2026_06_19_035551_create_beneficiaries_table', 1),
(7, '2026_06_19_035558_create_beneficiary_categories_table', 1),
(8, '2026_06_19_035603_create_menus_table', 1),
(9, '2026_06_19_035608_create_distributions_table', 1),
(10, '2026_06_19_035613_create_confirmations_table', 1),
(11, '2026_06_19_035619_create_confirmation_photos_table', 1),
(12, '2026_06_19_035623_create_feedback_table', 1),
(13, '2026_06_19_081712_create_reviews_table', 2),
(14, '2026_07_13_070235_create_profiles_table', 3),
(15, '2026_07_16_030017_create_mbg_menus_table', 4),
(16, '2026_07_16_030056_create_mbg_menu_items_table', 5),
(17, '2026_07_16_030125_create_mbg_menu_nutritions_table', 6),
(18, '2026_07_16_030207_create_mbg_menu_benefits_table', 7),
(19, '2026_07_16_060325_create_schedules_table', 8),
(20, '2026_06_25_083302_create_articles_table', 9),
(21, '2026_06_25_083326_create_categories_table', 9),
(22, '2026_07_22_075814_create_password_reset_otps_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_otps`
--

CREATE TABLE `password_reset_otps` (
  `id` bigint UNSIGNED NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NOT NULL,
  `verified` tinyint(1) DEFAULT '0',
  `attempt` int DEFAULT '0',
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_otps`
--

INSERT INTO `password_reset_otps` (`id`, `contact`, `otp`, `reset_token`, `expired_at`, `verified`, `attempt`, `used_at`, `created_at`, `updated_at`) VALUES
(4, '089523018999', '123456', 'Yx8gHXhaquRy1V5XgO0u5U6AwXQxF1cxOfrUkvsc74zsKQfPyQIlzHFwQciq', '2026-08-19 01:49:09', 1, 0, NULL, '2026-08-19 01:44:09', '2026-08-19 01:44:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'mbg-token', '516c78f0f600b5342be6db9fd5ded02e6c5796af22405c496327935924ae4677', '[\"*\"]', NULL, NULL, '2026-06-18 23:39:14', '2026-06-18 23:39:14'),
(2, 'App\\Models\\User', 1, 'mbg-token', '83d9bb53e25b57e8ee38b05c6969d78c79d0a4a3a617994eef212a81129106d3', '[\"*\"]', NULL, NULL, '2026-06-18 23:39:33', '2026-06-18 23:39:33'),
(3, 'App\\Models\\User', 2, 'mbg-token', 'b71cc7f21807d57bae8d8e43274371c2f9742cc8fe71c1479f32a7194483ce05', '[\"*\"]', NULL, NULL, '2026-07-12 21:43:23', '2026-07-12 21:43:23'),
(4, 'App\\Models\\User', 2, 'mbg-token', 'b396d188751f6bf3b0d43b6c6cb5dc8dabf76280513564a943540be7374cb410', '[\"*\"]', NULL, NULL, '2026-07-12 23:37:26', '2026-07-12 23:37:26'),
(5, 'App\\Models\\User', 2, 'mbg-token', 'f4262ece0537f967580db147d0911787bc0f7501836efa1103f816f431b6806b', '[\"*\"]', NULL, NULL, '2026-07-12 23:38:07', '2026-07-12 23:38:07'),
(33, 'App\\Models\\User', 9, 'mbg-mobile', '18a2bd7c1905c05bbb7093f4ae34a3c6c267d9778a1c54cdfc250858c0f9478a', '[\"*\"]', '2026-07-22 00:20:39', NULL, '2026-07-21 23:31:14', '2026-07-22 00:20:39'),
(34, 'App\\Models\\User', 11, 'mbg-mobile', '3d2507cec085c324ced4db071fc559e3675c3cefccbf3284fd940c68718604f6', '[\"*\"]', '2026-07-22 00:27:15', NULL, '2026-07-22 00:25:16', '2026-07-22 00:27:15'),
(35, 'App\\Models\\User', 11, 'mbg-mobile', 'a82bd70b9c88f7c6ccc33745049da6ebc9df44d32c285e2f9cab503f4681b1c6', '[\"*\"]', '2026-07-22 01:16:00', NULL, '2026-07-22 01:15:57', '2026-07-22 01:16:00'),
(36, 'App\\Models\\User', 12, 'mbg-mobile', '1475cdbc6a5dbe81dbeb595d0f2ed431537ec15f1629593e2c87a486cc5f7994', '[\"*\"]', '2026-07-31 22:54:18', NULL, '2026-07-26 08:25:31', '2026-07-31 22:54:18'),
(37, 'App\\Models\\User', 9, 'mbg-mobile', 'd311a152b39841f29496f481fec9950ed115e53eb19ec1ba27d5fd926c3ff62a', '[\"*\"]', '2026-07-31 22:55:03', NULL, '2026-07-31 22:54:57', '2026-07-31 22:55:03'),
(38, 'App\\Models\\User', 9, 'mbg-mobile', '145365f491ec4ebe2502f7c13db00fab52cd0da128ba92e3f4550185728f2302', '[\"*\"]', '2026-07-31 23:27:45', NULL, '2026-07-31 23:23:10', '2026-07-31 23:27:45'),
(39, 'App\\Models\\User', 9, 'mbg-mobile', '611570eabbe5dd2ed84704c04ec13c77af01370f539125727cdaf7d4ce59bb2c', '[\"*\"]', '2026-07-31 23:38:55', NULL, '2026-07-31 23:35:39', '2026-07-31 23:38:55'),
(40, 'App\\Models\\User', 9, 'mbg-mobile', '086a94a566241fb90204381ac5462f8f2523cc67f84db54ac03b00b224d5985d', '[\"*\"]', '2026-08-03 04:57:37', NULL, '2026-07-31 23:43:02', '2026-08-03 04:57:37'),
(41, 'App\\Models\\User', 9, 'mbg-mobile', '7787c73f5660404c1c6d767652ed20ce6c3e0c040cbd6b2f4fee147601bd365c', '[\"*\"]', NULL, NULL, '2026-08-03 11:28:22', '2026-08-03 11:28:22'),
(42, 'App\\Models\\User', 9, 'mbg-mobile', '874ce00c99d454d1d239b8ca65fa1b6e1def68897a37b89a67b644bd9f555eb5', '[\"*\"]', '2026-08-03 11:52:03', NULL, '2026-08-03 11:28:26', '2026-08-03 11:52:03'),
(43, 'App\\Models\\User', 9, 'mbg-mobile', '41012b1a8c4a15d647f1ecd084dccb27d2a0ffb634edeaf774ee8dd246ec1507', '[\"*\"]', '2026-08-03 12:28:11', NULL, '2026-08-03 11:54:44', '2026-08-03 12:28:11'),
(44, 'App\\Models\\User', 13, 'mbg-mobile', 'dd9e008800caa18ca5f608d16e28a94ccf27e5aa697eeb92cd6a7b99d7786f84', '[\"*\"]', '2026-08-04 01:02:57', NULL, '2026-08-04 00:58:39', '2026-08-04 01:02:57'),
(45, 'App\\Models\\User', 9, 'mbg-mobile', '2118b7578ced05bd3e7e5a7c8f30d78018d00e42a7c3e4aced43f4f194915eb5', '[\"*\"]', '2026-08-04 01:07:07', NULL, '2026-08-04 01:06:26', '2026-08-04 01:07:07'),
(46, 'App\\Models\\User', 14, 'mbg-mobile', 'b3a96e4a7d45908d0f4925d80920e643fc8642b8f8e2531830d7288e0019790e', '[\"*\"]', '2026-08-04 02:44:52', NULL, '2026-08-04 01:08:38', '2026-08-04 02:44:52'),
(47, 'App\\Models\\User', 14, 'mbg-mobile', '6b102ba566510eecfdcedeffe29ad83571a2a51c65c974c724df6e3b9b1f9091', '[\"*\"]', '2026-08-05 00:28:21', NULL, '2026-08-04 02:52:22', '2026-08-05 00:28:21'),
(48, 'App\\Models\\User', 14, 'mbg-mobile', 'b697a1313352072b5060180697ce19bca35116da28127a456c7a836ee0184a94', '[\"*\"]', '2026-08-05 01:17:33', NULL, '2026-08-05 01:16:21', '2026-08-05 01:17:33'),
(49, 'App\\Models\\User', 14, 'mbg-mobile', '570fd8370f22ce8be9fde395221d5f396fdb0f5fed3062947f9690a35a837de0', '[\"*\"]', '2026-08-05 01:30:37', NULL, '2026-08-05 01:28:34', '2026-08-05 01:30:37'),
(50, 'App\\Models\\User', 14, 'mbg-mobile', '19bd4e8f49bd2407158682610e821d65a256198013604a4645fb70f30ed5f9a6', '[\"*\"]', '2026-08-19 01:36:36', NULL, '2026-08-19 01:24:49', '2026-08-19 01:36:36'),
(51, 'App\\Models\\User', 15, 'mbg-mobile', '562e70ae40d6ac1e9add36f2e02ab892e09bcc92c653138c12efcbb36c41e4ca', '[\"*\"]', '2026-08-19 01:43:24', NULL, '2026-08-19 01:43:19', '2026-08-19 01:43:24'),
(52, 'App\\Models\\User', 15, 'mbg-mobile', '01cc4ed3e8f24c62c84219aeade14c38d8fe58d1eb074dc0e319b4dfa3ce39f7', '[\"*\"]', '2026-08-26 23:21:59', NULL, '2026-08-19 01:44:49', '2026-08-26 23:21:59');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beneficiary_type` enum('pregnant','toddler_parent') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_gender` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child_birth_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `address`, `birth_date`, `gender`, `beneficiary_type`, `nik`, `photo`, `child_name`, `child_gender`, `child_nik`, `child_birth_date`, `created_at`, `updated_at`) VALUES
(2, 9, 'Tarub', '1991-07-16', 'female', 'pregnant', '333333', 'profile/hhs27dzLdWqpWuWO2pJv5pLSFWbt5sKXhc92DhzA.jpg', NULL, NULL, NULL, '2026-05-06', '2026-07-13 00:29:24', '2026-08-04 01:07:03'),
(3, 10, 'Tarub', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15 18:31:32', '2026-07-15 18:31:32'),
(4, 5, NULL, NULL, NULL, 'pregnant', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15 18:43:40', '2026-08-03 06:06:48'),
(5, 11, 'Tegal', '1994-07-01', 'female', 'toddler_parent', '3328120200500001', NULL, 'Ridho', 'male', '332812081207612004', '2026-02-10', '2026-07-22 00:23:24', '2026-08-03 06:37:50'),
(6, 12, 'Tarub', '2026-07-07', 'female', 'toddler_parent', '3328120019400001', 'profile/KkTUqF6g914v80HWcVuOqhwbyvYg4mRjvQApy2Ls.jpg', 'Syifa', 'female', '332812081207612005', '2026-04-14', '2026-07-26 08:24:55', '2026-08-03 10:02:26'),
(7, 13, 'DS bongkok', NULL, NULL, 'toddler_parent', NULL, NULL, NULL, NULL, NULL, '2026-06-04', '2026-08-04 00:49:24', '2026-08-04 00:51:48'),
(8, 14, 'ds bongkok', '2026-04-08', NULL, 'pregnant', NULL, NULL, NULL, NULL, NULL, '2026-08-05', '2026-08-04 01:07:49', '2026-08-05 01:17:28'),
(9, 15, 'ds Larangan', NULL, NULL, 'pregnant', NULL, NULL, NULL, NULL, NULL, '2026-12-06', '2026-08-19 01:41:31', '2026-08-19 01:42:42');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('mbg','posyandu') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `type`, `date`, `title`, `start_time`, `end_time`, `location`, `address`, `image`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(5, 'mbg', '2026-07-20', 'Pembagian MBG Hari Ini', '10:00:00', '12:00:00', 'Posyandu Melati', 'Desa Tarub', 'schedules/01KXQ2MR1H6KD0F4KTSF82CTKH.jpg', 'Pegian MBG untuk Ibu Hamil', 1, '2026-07-16 20:41:38', '2026-07-16 20:41:38'),
(6, 'mbg', '2026-07-17', 'Pembagian MBG Hari Ini', '16:07:00', '17:08:00', 'Posyandu Melati', 'Desa Tarub', 'schedules/01KXQNBQY0A5A1TM001J1JQ2S7.jpg', 'Pembagian MBG Ibu Hamil', 1, '2026-07-17 02:08:46', '2026-07-17 02:08:46'),
(7, 'mbg', '2026-07-22', 'Pembagian MBG Posyandu Melati', '10:00:00', '11:00:00', 'Posyandu Melati', 'Desa Tarub', 'schedules/01KY3YCPSB17P1WMV5C8R85ZEQ.jpg', 'Pembagian MBG di Posyandu Melati', 1, '2026-07-21 20:37:28', '2026-07-21 20:37:28'),
(8, 'posyandu', '2026-07-23', 'Pembagian MBG Posyandu Melati', '09:00:00', '10:00:00', 'Posyandu Melati', 'Desa Tarub', 'schedules/01KY46M5FPE8PAMQ0EBJYS23PS.jpg', 'Imunisasi', 1, '2026-07-21 23:01:21', '2026-07-21 23:01:21'),
(9, 'mbg', '2026-07-26', 'Pembagian MBG Posyandu Melati', '10:00:00', '12:00:00', 'Posyandu Melati', 'Desa Tarub Kecamatan Tarub', 'schedules/01KYFG0KD0N3EQEG8MJ3CA6M2S.jpg', 'Pembagian MBG di Posyandu', 1, '2026-07-26 08:17:05', '2026-07-26 08:17:05'),
(10, 'mbg', '2026-08-05', 'pembagian MBG di Posyandu Ipus', '08:10:00', '10:10:00', 'Posyandu Ipus', 'ds bongkok karang asem', 'schedules/01KZ5X94NN7PJDZ3EJC6MXM4V5.jpg', 'kegiatan harian', 1, '2026-08-04 01:12:13', '2026-08-04 01:27:52'),
(11, 'mbg', '2026-08-03', 'pembagian MBG di Posyandu Ipus', '09:29:00', '10:30:00', 'Posyandu Ipus', 'ds bongkok karang asem', 'schedules/01KZ5YBE39KSJ0NAFDAAZANRYR.jpg', 'pembagian mbg', 1, '2026-08-04 01:30:57', '2026-08-04 01:30:57'),
(12, 'mbg', '2026-08-06', 'pembagian MBG di Posyandu Ipus', '08:45:00', '10:45:00', 'Posyandu Ipus', 'ds bongkok', 'schedules/01KZ5Z7730EK2F1KF7D0WAJF34.jpg', 'pembagian mbg', 1, '2026-08-04 01:46:07', '2026-08-04 01:46:07'),
(13, 'mbg', '2026-08-04', 'pembagian MBG di Posyandu Ipus', '08:30:00', '10:30:00', 'Posyandu Ipus', 'ds bongkok karang asem', 'schedules/01KZ61EPPPCY39M4FV8XB79RMW.jpg', 'pembagian mbg', 1, '2026-08-04 02:25:10', '2026-08-04 02:25:10'),
(14, 'mbg', '2026-08-19', 'pembagian MBG di Posyandu Ipus', '21:52:00', '22:52:00', 'Posyandu Ipus', 'desa bongkok karang asem rt 02 rw 01', NULL, NULL, 1, '2026-08-19 01:52:47', '2026-08-19 01:52:47'),
(15, 'mbg', '2026-08-17', 'Pembagian MBG Ibu Hamil dan Balita', '08:00:00', '11:00:00', 'posyandu mawar sumurpanggang', 'Jl. Abdul Syukur RT 001 RW 002, Kel Margadana , Kec Margadana, Kota Tegal', NULL, NULL, 1, '2026-08-27 08:18:35', '2026-08-27 08:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `sppgs`
--

CREATE TABLE `sppgs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `posyandu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sppgs`
--

INSERT INTO `sppgs` (`id`, `name`, `address`, `posyandu_name`, `created_at`, `updated_at`) VALUES
(1, 'SATUAN PELAYANAN PEMENUHAN GIZI MARGADANA 01', 'JL. Abdul Syukur RT:05 RW013, Kel. Margadana, Kec. Margadana, Kota Tegal', 'Mawar Sumur Panggang', '2026-08-03 05:46:36', '2026-08-03 05:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super_admin','admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Super Admin', 'superadmin@example.com', '08123456789', '$2y$12$7b2xKYiU.zZXMeqiVtur0.1fwPCNwC8QCXCiaNMEU8yFzj6ph9urm', 'super_admin', 'active', '2026-06-24 23:38:27', '2026-06-25 01:11:13'),
(4, 'admin', 'admin@example.com', NULL, '$2y$12$lWiAG4qY2sAIJUbQiNpwqufgK0Y.uu0DB3JyUPmwzSCZzMpmvap5C', 'admin', 'inactive', '2026-06-25 00:14:06', '2026-06-25 00:14:06'),
(5, 'Vita', 'vita@example.com', NULL, '$2y$12$850iVarqv9ErnbQA.81VtuPIT0JmfatP5ekx.7LseNrNj03L6Rcfm', 'user', 'active', '2026-06-25 00:15:09', '2026-07-15 18:43:41'),
(9, 'Vita Dhea', 'vitadhea@example.com', '082123456789', '$2y$12$ePnsbBL8BMmEJ.Vvr3tg8uq8QrDbnZpE1l.Te2aSNfNBZBa6tnIjG', 'user', 'active', '2026-07-13 00:29:24', '2026-08-04 01:06:07'),
(10, 'Andi', 'admin2@example.com', '0856974521', '$2y$12$seq5fFBOPcRjYWjrcgLcN.SAGUMBlMeor9Yp0hz6ZeX8yXE8Ouy6C', 'admin', 'active', '2026-07-15 18:31:32', '2026-07-15 18:31:32'),
(11, 'Putri', 'putri@gmail.com', '08123456788', '$2y$12$AP1v/cFPBUOO/YCWmmuOrupyrGW/zyKS/peLRqvfBcVfPYHKENESC', 'user', 'active', '2026-07-22 00:23:24', '2026-07-22 01:15:40'),
(12, 'Putri', 'putri2@gmail.com', '08212345678', '$2y$12$5GflBtrXwPSaYVpB1Ab7ZOE083tHKmBMDo1.ULjWCPH9lQbOetrE6', 'user', 'active', '2026-07-26 08:24:55', '2026-07-26 08:34:17'),
(13, 'jesie', NULL, '087825887649', '$2y$12$iX82wwGdgw2kATkmNkj87OANxRVs9.Zw66nuV3A5kTiIamqIOKPBi', 'user', 'active', '2026-08-04 00:49:24', '2026-08-04 00:51:48'),
(14, 'jesie atmaja', 'jesi@gmail.com', '087744682278', '$2y$12$xr3zkV32b6AWP161H5LMb.NRVtxAP7yJxzQFHgZHAmGmwiuCnNhlG', 'user', 'active', '2026-08-04 01:07:49', '2026-08-19 01:24:29'),
(15, 'ratna santika', NULL, '089523018999', '$2y$12$iAdgC5giEh0SnyJVwr8LWuOcxSzGhbkC1IcQZY.C8DwlnSv3sxa.K', 'user', 'active', '2026-08-19 01:41:31', '2026-08-19 01:42:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `status` (`status`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `published_at` (`published_at`),
  ADD KEY `fk_articles_category` (`category_id`);

--
-- Indexes for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beneficiary_categories`
--
ALTER TABLE `beneficiary_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_confirmation_user` (`user_id`);

--
-- Indexes for table `confirmation_photos`
--
ALTER TABLE `confirmation_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distributions`
--
ALTER TABLE `distributions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_distributions_schedule_id` (`schedule_id`),
  ADD KEY `idx_distributions_menu_id` (`menu_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mbg_menus`
--
ALTER TABLE `mbg_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mbg_menus_schedule_id` (`schedule_id`);

--
-- Indexes for table `mbg_menu_benefits`
--
ALTER TABLE `mbg_menu_benefits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mbg_menu_benefits_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `mbg_menu_items`
--
ALTER TABLE `mbg_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mbg_menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `mbg_menu_nutritions`
--
ALTER TABLE `mbg_menu_nutritions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mbg_menu_nutritions_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_contact` (`contact`),
  ADD KEY `idx_reset_token` (`reset_token`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profiles_nik_unique` (`nik`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sppgs`
--
ALTER TABLE `sppgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `beneficiaries`
--
ALTER TABLE `beneficiaries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `beneficiary_categories`
--
ALTER TABLE `beneficiary_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `confirmations`
--
ALTER TABLE `confirmations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `confirmation_photos`
--
ALTER TABLE `confirmation_photos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distributions`
--
ALTER TABLE `distributions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mbg_menus`
--
ALTER TABLE `mbg_menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mbg_menu_benefits`
--
ALTER TABLE `mbg_menu_benefits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mbg_menu_items`
--
ALTER TABLE `mbg_menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `mbg_menu_nutritions`
--
ALTER TABLE `mbg_menu_nutritions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sppgs`
--
ALTER TABLE `sppgs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_articles_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `confirmations`
--
ALTER TABLE `confirmations`
  ADD CONSTRAINT `fk_confirmation_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `distributions`
--
ALTER TABLE `distributions`
  ADD CONSTRAINT `fk_distributions_menu` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_distributions_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mbg_menus`
--
ALTER TABLE `mbg_menus`
  ADD CONSTRAINT `fk_mbg_menus_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mbg_menu_benefits`
--
ALTER TABLE `mbg_menu_benefits`
  ADD CONSTRAINT `mbg_menu_benefits_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mbg_menu_items`
--
ALTER TABLE `mbg_menu_items`
  ADD CONSTRAINT `mbg_menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mbg_menu_nutritions`
--
ALTER TABLE `mbg_menu_nutritions`
  ADD CONSTRAINT `mbg_menu_nutritions_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `mbg_menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
