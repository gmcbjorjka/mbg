<?php

require __DIR__ . '/vendor/autoload.php';

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\SimpleType\Jc;
use PhpOffice\PhpWord\SimpleType\JcTable;
use PhpOffice\PhpWord\Style\Language;
use PhpOffice\PhpWord\Style\Table as TableStyle;

$phpWord = new PhpWord();

// Set default font
$phpWord->setDefaultFontName('Calibri');
$phpWord->setDefaultFontSize(11);

// Define custom styles
$primaryColor = '1E3A8A'; // Navy Blue
$secondaryColor = '0D9488'; // Teal
$darkTextColor = '1F2937';
$lightBgColor = 'F3F4F6';
$calloutBgColor = 'EFF6FF';
$imgMarkerColor = 'D97706'; // Amber / Orange for Image Markers

// Paragraph & Heading Styles
$phpWord->addTitleStyle(1, ['name' => 'Calibri', 'size' => 24, 'bold' => true, 'color' => $primaryColor], ['spaceAfter' => 240, 'alignment' => Jc::CENTER]);
$phpWord->addTitleStyle(2, ['name' => 'Calibri', 'size' => 16, 'bold' => true, 'color' => $primaryColor], ['spaceBefore' => 240, 'spaceAfter' => 120]);
$phpWord->addTitleStyle(3, ['name' => 'Calibri', 'size' => 13, 'bold' => true, 'color' => $secondaryColor], ['spaceBefore' => 180, 'spaceAfter' => 60]);

// Section
$section = $phpWord->addSection([
    'marginTop' => 1440, // 1 inch
    'marginBottom' => 1440,
    'marginLeft' => 1440,
    'marginRight' => 1440,
]);

// Header & Footer
$header = $section->addHeader();
$header->addParagraphStyle('hRight', ['alignment' => Jc::RIGHT]);
$header->addText('Manual Book - Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG)', ['size' => 9, 'italic' => true, 'color' => '6B7280'], 'hRight');

$footer = $section->addFooter();
$footer->addParagraphStyle('fCenter', ['alignment' => Jc::CENTER]);
$footer->addText('Halaman ', ['size' => 9, 'color' => '6B7280'], 'fCenter');
$footer->addPreserveText('{PAGE}', ['size' => 9, 'color' => '6B7280'], 'fCenter');

// Helper functions for adding formatted elements
function addHeading1($section, $text) {
    global $primaryColor;
    $section->addText($text, ['size' => 18, 'bold' => true, 'color' => $primaryColor], ['spaceBefore' => 300, 'spaceAfter' => 120]);
}

function addHeading2($section, $text) {
    global $secondaryColor;
    $section->addText($text, ['size' => 14, 'bold' => true, 'color' => $secondaryColor], ['spaceBefore' => 200, 'spaceAfter' => 80]);
}

function addHeading3($section, $text) {
    $section->addText($text, ['size' => 12, 'bold' => true, 'color' => '374151'], ['spaceBefore' => 140, 'spaceAfter' => 60]);
}

function addParagraph($section, $text) {
    $section->addText($text, ['size' => 11, 'color' => '1F2937'], ['spaceBefore' => 40, 'spaceAfter' => 100, 'lineSpacing' => 1.15]);
}

function addBullet($section, $text, $depth = 0) {
    $section->addListItem($text, $depth, ['size' => 11, 'color' => '1F2937'], null, ['spaceBefore' => 20, 'spaceAfter' => 40, 'lineSpacing' => 1.15]);
}

function addImageMarker($section, $caption) {
    global $imgMarkerColor;
    $table = $section->addTable([
        'borderColor' => $imgMarkerColor,
        'borderSize' => 8,
        'cellMargin' => 120,
        'alignment' => JcTable::CENTER,
        'width' => 100 * 50
    ]);
    $table->addRow();
    $cell = $table->addCell(9000, ['bgColor' => 'FFFBEB']);
    $cell->addText('[Gambar: ' . $caption . ']', [
        'size' => 10,
        'bold' => true,
        'italic' => true,
        'color' => $imgMarkerColor
    ], ['alignment' => Jc::CENTER, 'spaceBefore' => 60, 'spaceAfter' => 60]);
}

function addNoteBox($section, $text, $title = 'PETUNJUK PENTING') {
    $table = $section->addTable([
        'borderColor' => '3B82F6',
        'borderSize' => 10,
        'cellMargin' => 140,
        'alignment' => JcTable::CENTER
    ]);
    $table->addRow();
    $cell = $table->addCell(9000, ['bgColor' => 'EFF6FF']);
    $cell->addText('📌 ' . $title, ['size' => 10, 'bold' => true, 'color' => '1D4ED8'], ['spaceBefore' => 40, 'spaceAfter' => 40]);
    $cell->addText($text, ['size' => 10, 'color' => '1E40AF'], ['spaceBefore' => 40, 'spaceAfter' => 40, 'lineSpacing' => 1.15]);
}

// COVER PAGE
$section->addText('MANUAL BOOK / PANDUAN PENGGUNA', ['size' => 14, 'bold' => true, 'color' => $secondaryColor], ['alignment' => Jc::CENTER, 'spaceBefore' => 400]);
$section->addText('SISTEM MANAJEMEN & PEMANTAUAN MAKAN BERGIZI GRATIS', ['size' => 22, 'bold' => true, 'color' => $primaryColor], ['alignment' => Jc::CENTER, 'spaceBefore' => 100, 'spaceAfter' => 100]);
$section->addText('(SMPM MBG)', ['size' => 18, 'bold' => true, 'color' => $primaryColor], ['alignment' => Jc::CENTER, 'spaceAfter' => 300]);

$section->addText('Panduan Penggunaan Lengkap Web Admin Panel & Aplikasi Mobile', ['size' => 12, 'italic' => true, 'color' => '4B5563'], ['alignment' => Jc::CENTER, 'spaceAfter' => 600]);

addImageMarker($section, 'Logo & Banner Resmi Sistem Makan Bergizi Gratis (SMPM MBG)');

$section->addTextBreak(3);

$tableCover = $section->addTable(['alignment' => JcTable::CENTER]);
$tableCover->addRow();
$cellMeta = $tableCover->addCell(9000, ['bgColor' => 'F3F4F6']);
$cellMeta->addText('Informasi Dokumen:', ['size' => 10, 'bold' => true, 'color' => '374151']);
$cellMeta->addText('• Versi Aplikasi: 1.0.0 (Latest Release)', ['size' => 10, 'color' => '4B5563']);
$cellMeta->addText('• Modul Terkait: Laravel Filament Web Admin Panel & Flutter Mobile App', ['size' => 10, 'color' => '4B5563']);
$cellMeta->addText('• Tanggal Penyusunan: Agustus 2026', ['size' => 10, 'color' => '4B5563']);
$cellMeta->addText('• Target Pengguna: Administrator, Petugas SPPG/Lapangan, Siswa, & Wali Penerima Manfaat', ['size' => 10, 'color' => '4B5563']);

$section->addPageBreak();

// DAFTAR ISI SINTETIS
addHeading1($section, 'DAFTAR ISI');
addParagraph($section, 'Dokumen panduan ini terbagi ke dalam 5 bagian utama:');
addBullet($section, 'BAB 1: PENDAHULUAN & GAMBARAN UMUM SISTEM');
addBullet($section, 'BAB 2: PANDUAN PENGGUNA - WEB ADMIN PANEL (LARAVEL FILAMENT)');
addBullet($section, 'BAB 3: PANDUAN PENGGUNA - APLIKASI MOBILE (FLUTTER APP)');
addBullet($section, 'BAB 4: TROUBLESHOOTING & FREQUENTLY ASKED QUESTIONS (FAQ)');
addBullet($section, 'BAB 5: KETENTUAN & LAYANAN BANTUAN');

$section->addTextBreak(1);

// ==========================================
// BAB 1: PENDAHULUAN
// ==========================================
addHeading1($section, 'BAB 1: PENDAHULUAN & GAMBARAN UMUM SISTEM');

addHeading2($section, '1.1 Latar Belakang & Tujuan Sistem');
addParagraph($section, 'Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG) dikembangkan untuk mendukung transparansi, efisiensi, dan ketepatan sasaran dalam program pembagian makanan bergizi gratis. Sistem ini menghubungkan pengelola pusat/petugas SPPG dengan para penerima manfaat (seperti siswa sekolah, balita, ibu hamil, dan ibu menyusui) secara real-time.');
addParagraph($section, 'Tujuan utama dari aplikasi ini mencakup:');
addBullet($section, '1. Memastikan distribusi makanan bergizi tepat jadwal dan tepat sasaran.');
addBullet($section, '2. Menyediakan transparansi informasi kandungan gizi (kalori, protein, karbohidrat, lemak, vitamin) bagi setiap menu yang disajikan.');
addBullet($section, '3. Memudahkan proses verifikasi penerimaan makanan di lapangan menggunakan teknologi Geo-tagging (GPS) dan bukti foto kamera.');
addBullet($section, '4. Mengumpulkan umpan balik (rating & ulasan) langsung dari penerima manfaat guna menjaga kualitas layanan dan makanan.');

addHeading2($section, '1.2 Arsitektur Sistem');
addParagraph($section, 'Sistem SMPM MBG terdiri dari 2 komponen utama yang saling terintegrasi via RESTful API Sanctum:');
addBullet($section, '1. Web Admin Panel (Laravel Filament): Platform berbasis web yang digunakan oleh Administrator dan Petugas SPPG untuk mengelola data master, jadwal, menu makanan, verifikasi penerimaan, dan edukasi gizi.');
addBullet($section, '2. Aplikasi Mobile (Flutter App): Platform berbasis mobile (Android/iOS) yang digunakan oleh Siswa / Wali / Penerima Manfaat untuk menerima notifikasi menu, jadwal pembagian, melakukan verifikasi foto & lokasi GPS, memberikan ulasan, serta mengakses artikel edukasi gizi.');

addImageMarker($section, 'Diagram Arsitektur Integrasi Web Admin Panel Laravel Filament & Aplikasi Mobile Flutter');

addHeading2($section, '1.3 Hak Akses & Peran Pengguna (User Roles)');
$tableRole = $section->addTable(['borderColor' => 'D1D5DB', 'borderSize' => 6, 'cellMargin' => 100, 'alignment' => JcTable::CENTER]);
$tableRole->addRow();
$tableRole->addCell(2500, ['bgColor' => $primaryColor])->addText('Peran (Role)', ['bold' => true, 'color' => 'FFFFFF']);
$tableRole->addCell(3000, ['bgColor' => $primaryColor])->addText('Platform Access', ['bold' => true, 'color' => 'FFFFFF']);
$tableRole->addCell(3500, ['bgColor' => $primaryColor])->addText('Wewenang & Fitur Utama', ['bold' => true, 'color' => 'FFFFFF']);

$tableRole->addRow();
$tableRole->addCell(2500)->addText('Super Admin / Admin', ['bold' => true]);
$tableRole->addCell(3000)->addText('Web Admin Panel');
$tableRole->addCell(3500)->addText('Akses penuh ke seluruh data master, user, menu, jadwal, verifikasi, artikel, dan ekspor laporan.');

$tableRole->addRow();
$tableRole->addCell(2500)->addText('Petugas / SPPG', ['bold' => true]);
$tableRole->addCell(3000)->addText('Web Admin & Mobile');
$tableRole->addCell(3500)->addText('Pengelolaan jadwal distribusi, input menu harian, serta konfirmasi status penyaluran makanan.');

$tableRole->addRow();
$tableRole->addCell(2500)->addText('Penerima Manfaat (Siswa/Wali)', ['bold' => true]);
$tableRole->addCell(3000)->addText('Aplikasi Mobile');
$tableRole->addCell(3500)->addText('Melihat menu harian & nutrisi, mengirim konfirmasi penerimaan (foto + GPS), mengisi ulasan, dan membaca artikel.');

$section->addPageBreak();

// ==========================================
// BAB 2: WEB ADMIN PANEL (LARAVEL FILAMENT)
// ==========================================
addHeading1($section, 'BAB 2: PANDUAN PENGGUNA - WEB ADMIN PANEL (LARAVEL FILAMENT)');

addHeading2($section, '2.1 Akses & Authentikasi Admin');
addParagraph($section, 'Untuk mengakses Web Admin Panel SMPM MBG, buka peramban web (Google Chrome / Mozilla Firefox / Microsoft Edge) dan ketikkan alamat URL Admin Panel.');
addBullet($section, '1. Buka browser dan kunjungi alamat URL Web Admin.');
addBullet($section, '2. Masukkan Email dan Password akun Administrator.');
addBullet($section, '3. Klik tombol "Sign In" / "Masuk".');

addImageMarker($section, 'Form Login Web Admin Panel (Filament Authentication)');

addNoteBox($section, 'Pastikan akun Anda sudah didaftarkan sebagai Admin oleh Super Admin. Jika lupa kata sandi, hubungi Tim IT Administrator Sistem.');

addHeading2($section, '2.2 Dashboard Analitik & Ringkasan Utama');
addParagraph($section, 'Setelah berhasil masuk, Anda akan diarahkan ke halaman Dashboard Utama. Dashboard ini menyajikan ringkasan eksekutif secara real-time:');
addBullet($section, '• Widget Total Penerima Manfaat: Jumlah siswa/penerima terdaftar.');
addBullet($section, '• Widget Menu MBG Aktif: Jumlah variasi menu makanan bergizi yang siap disalurkan.');
addBullet($section, '• Widget Verifikasi Hari Ini: Jumlah laporan konfirmasi penerimaan makanan yang telah masuk dari mobile.');
addBullet($section, '• Chart / Grafik Distribusi: Pemantauan persentase penyaluran makanan per kategori/sekolah.');

addImageMarker($section, 'Tampilan Dashboard Analitik & Ringkasan Statistik Web Admin Panel');

addHeading2($section, '2.3 Kelola Pengguna & Hak Akses (User Management)');
addParagraph($section, 'Modul ini memungkinkan Admin untuk mengelola akun seluruh pengguna sistem (baik akun Admin, Petugas, maupun Pengguna Mobile).');
addHeading3($section, 'Langkah Mengelola Pengguna:');
addBullet($section, '1. Pilih menu "Users" / "Pengguna" pada sidebar navigasi sebelah kiri.');
addBullet($section, '2. Klik tombol "+ New User" untuk menambah pengguna baru.');
addBullet($section, '3. Isi form data user: Nama Lengkap, Email, Password, Nomor Telepon, dan Role.');
addBullet($section, '4. Klik "Create" untuk menyimpan data.');
addBullet($section, '5. Gunakan tombol "Edit" untuk mengubah data atau "Delete" untuk menghapus pengguna.');

addImageMarker($section, 'Halaman Kelola Data Pengguna & Form Tambah User Baru');

addHeading2($section, '2.4 Kelola Penerima Manfaat (Beneficiaries)');
addParagraph($section, 'Modul Penerima Manfaat digunakan untuk mencatat identitas detail penerima program Makan Bergizi Gratis (misalnya data siswa per sekolah atau sasaran masyarakat).');
addBullet($section, '• Kategori Penerima: SD, SMP, SMA/SMK, Ibu Hamil, Ibu Menyusui, dan Balita.');
addBullet($section, '• Detail Informasi: Nama, NIK/NISN, Tempat/Tanggal Lahir, Alamat, dan Kategori Spesifik.');

addImageMarker($section, 'Halaman Kelola Data Penerima Manfaat & Tabel Daftar Siswa/Penerima');

addHeading2($section, '2.5 Kelola Menu Makan Bergizi Gratis (MBG Menu)');
addParagraph($section, 'Menu MBG merupakan inti dari informasi makanan bergizi yang disajikan. Admin wajib menginput informasi komprehensif terkait makanan yang akan didistribusikan.');
addHeading3($section, 'Komponen Input Menu:');
addBullet($section, '1. Informasi Umum: Nama Menu, Deskripsi, Foto Makanan, dan Kategori.');
addBullet($section, '2. Informasi Gizi (Nutrisi): Jumlah Kalori (kcal), Protein (gram), Karbohidrat (gram), Lemak (gram), Serat, dan Vitamin.');
addBullet($section, '3. Komposisi / Bahan Makanan: Rincian bahan alami yang digunakan.');
addBullet($section, '4. Manfaat Kesehatan: Penjelasan singkat khasiat gizi menu tersebut bagi tumbuh kembang anak.');

addImageMarker($section, 'Form Input Menu MBG beserta Rincian Nilai Gizi & Bahan Makanan');

addHeading2($section, '2.6 Penjadwalan Pembagian Makanan (Schedule Resource)');
addParagraph($section, 'Melalui fitur Penjadwalan, Admin / Petugas dapat menetapkan menu apa yang akan didistribusikan ke lokasi sasaran pada tanggal tertentu.');
addBullet($section, '1. Pilih menu "Schedules" / "Jadwal MBG".');
addBullet($section, '2. Klik "Create Schedule".');
addBullet($section, '3. Tentukan Tanggal Distribusi, Pilih Menu MBG yang akan dibagikan, serta Pilih Sekolah / Lokasi Tujuan.');
addBullet($section, '4. Simpan jadwal. Jadwal ini akan otomatis muncul pada aplikasi mobile pengguna.');

addImageMarker($section, 'Tabel Penjadwalan Distribusi Makanan Bergizi Gratis');

addHeading2($section, '2.7 Monitoring Verifikasi & Konfirmasi Penerimaan');
addParagraph($section, 'Fitur Verifikasi merupakan modul kontrol kualitas terpenting untuk mengecek laporan penerimaan makanan yang dikirimkan oleh pengguna melalui aplikasi mobile.');
addHeading3($section, 'Prosedur Verifikasi oleh Admin:');
addBullet($section, '1. Masuk ke menu "Confirmations" / "Verifikasi Penerimaan".');
addBullet($section, '2. Pilih laporan verifikasi yang masuk dari penerima.');
addBullet($section, '3. Periksa Bukti Foto Makanan yang diunggah oleh penerima.');
addBullet($section, '4. Cek Koordinat GPS & Peta Lokasi untuk memastikan pengambilan dilakukan di lokasi sasaran.');
addBullet($section, '5. Cek Catatan Kondisi Makanan (misal: "Makanan diterima rapi dan hangat").');
addBullet($section, '6. Ubah status menjadi "Verified / Approved" (Disetujui) atau "Rejected" (Ditolak jika foto tidak sesuai/fiktif).');

addImageMarker($section, 'Halaman Detail Verifikasi Penerimaan (Bukti Foto, Tanggal/Waktu, & Peta Lokasi GPS)');

addHeading2($section, '2.8 Kelola Artikel Edukasi Gizi (Article Resource)');
addParagraph($section, 'Admin dapat menerbitkan artikel edukasi mengenai gizi seimbang, pola hidup sehat, dan pentingnya sarapan bergizi.');
addBullet($section, '• Fitur mencakup: Judul Artikel, Kategori, Gambar Utama, Isi Konten Artikel, dan Status Publikasi.');

addImageMarker($section, 'Halaman Kelola Artikel Edukasi Gizi & Kesehatan');

addHeading2($section, '2.9 Kelola Ulasan & Rating Makanan (Menu Rating)');
addParagraph($section, 'Admin dapat melihat seluruh penilaian bintang (1-5) dan komentar ulasan rasa/kualitas makanan dari penerima manfaat sebagai bahan evaluasi dapur SPPG.');

addImageMarker($section, 'Tabel Pengelolaan Ulasan & Rating Makanan dari Pengguna');

$section->addPageBreak();

// ==========================================
// BAB 3: APLIKASI MOBILE (FLUTTER APP)
// ==========================================
addHeading1($section, 'BAB 3: PANDUAN PENGGUNA - APLIKASI MOBILE (FLUTTER APP)');

addHeading2($section, '3.1 Persyaratan Perangkat & Izin Akses');
addParagraph($section, 'Aplikasi Mobile MBG dapat dijalankan pada smartphone Android (minimal versi 7.0 Nougat) dan iOS (minimal iOS 12.0).');
addParagraph($section, 'Saat pertama kali dibuka, aplikasi membutuhkan izin akses berikut:');
addBullet($section, '• Camera (Kamera): Diperlukan untuk mengambil foto bukti fisik penerimaan makanan secara real-time.');
addBullet($section, '• Location / GPS (Lokasi): Diperlukan untuk mencatat titik koordinat presisi lokasi penerimaan makanan.');
addBullet($section, '• Storage / Media: Diperlukan untuk menyimpan sementara file foto bukti sebelum diunggah.');

addHeading2($section, '3.2 Pendaftaran & Authentikasi Akun Mobile');
addHeading3($section, 'A. Form Pendaftaran (Register):');
addParagraph($section, 'Penerima manfaat yang belum memiliki akun dapat melakukan registrasi mandiri.');
addBullet($section, '1. Buka aplikasi MBG pada smartphone.');
addBullet($section, '2. Pilih menu "Daftar Akun Baru".');
addBullet($section, '3. Isi data: Nama Lengkap, Email, Nomor Telepon, Password, dan Kategori Penerima.');
addBullet($section, '4. Klik "Daftar".');

addImageMarker($section, 'Tampilan Halaman Registrasi & Form Login Aplikasi Mobile');

addHeading3($section, 'B. Lupa Password & Verifikasi OTP:');
addParagraph($section, 'Jika pengguna lupa kata sandi, klik "Lupa Password?", masukkan email terdaftar, dan masukkan 6 digit kode OTP yang dikirimkan untuk mereset kata sandi.');

addImageMarker($section, 'Tampilan Halaman Input Kode OTP & Reset Password Mobile');

addHeading2($section, '3.3 Dashboard Utama Aplikasi Mobile');
addParagraph($section, 'Setelah login, pengguna disuguhkan Dashboard interaktif dengan berbagai card informasi:');
addBullet($section, '• Card Menu Hari Ini: Menampilkan foto dan nama menu makanan yang dijadwalkan dibagikan hari ini.');
addBullet($section, '• Ringkasan Nutrisi: Menampilkan total kalori dan protein dari menu hari ini.');
addBullet($section, '• Tombol Cepat "Konfirmasi Terima MBG": Akses langsung untuk melaporkan penerimaan makanan.');
addBullet($section, '• Banner Edukasi: Artikel gizi terbaru.');

addImageMarker($section, 'Tampilan Dashboard Utama Aplikasi Mobile (Status Menu Hari Ini & Akses Cepat)');

addHeading2($section, '3.4 Fitur Verifikasi & Konfirmasi Penerimaan MBG (Fitur Utama)');
addParagraph($section, 'Fitur ini merupakan fitur paling vital bagi penerima manfaat untuk mengonfirmasi bahwa makanan telah diterima dengan baik.');
addHeading3($section, 'Langkah-Langkah Mengirim Bukti Penerimaan:');
addBullet($section, '1. Dari Dashboard atau Tab Navigasi, tekan tombol "Terima MBG" / "Konfirmasi Penerimaan".');
addBullet($section, '2. Tekan ikon kamera untuk mengambil Foto Bukti Makanan yang diterima secara langsung.');
addBullet($section, '3. Pastikan GPS smartphone aktif. Aplikasi akan mendeteksi Lokasi & Alamat secara otomatis.');
addBullet($section, '4. Pilih Kondisi Makanan (Layak / Baik / Kurang Baik).');
addBullet($section, '5. Tambahkan Catatan Singkat jika ada (misal: "Lauk lengkap dan segar").');
addBullet($section, '6. Tekan tombol "Kirim Verifikasi".');
addBullet($section, '7. Tunggu hingga muncul notifikasi sukses.');

addImageMarker($section, 'Form Konfirmasi Penerimaan MBG (Upload Foto Kamera real-time & Pin Point GPS Location)');

addImageMarker($section, 'Pop-up / Dialog Notifikasi Berhasil Mengirim Verifikasi Makanan');

addNoteBox($section, 'Pengambilan foto bukti harus dilakukan secara langsung menggunakan kamera aplikasi (bukan mengambil dari galeri lama) untuk menjamin keabsahan laporan.');

addHeading2($section, '3.5 Detail Menu MBG, Nutrisi & Pemberian Ulasan');
addParagraph($section, 'Pengguna dapat mengetuk card menu untuk melihat informasi gizi lengkap serta memberikan feedback.');
addBullet($section, '• Rincian Gizi: Kalori, Protein, Karbohidrat, Lemak, Vitamin A/C, Kalsium, Besi.');
addBullet($section, '• Form Rating & Ulasan: Pengguna dapat memberi bintang (1-5) dan menuliskan komentar pengalaman rasa makanan.');

addImageMarker($section, 'Halaman Detail Nutrisi Menu MBG & Form Penilaian/Ulasan Makanan');

addHeading2($section, '3.6 Jadwal Pembagian & Riwayat Konfirmasi');
addBullet($section, '• Tab Jadwal: Menampilkan kalender dan daftar menu yang akan dibagikan pada hari-hari mendatang.');
addBullet($section, '• Tab Riwayat: Menampilkan daftar seluruh konfirmasi penerimaan yang pernah dikirimkan beserta statusnya (Verified / Pending).');

addImageMarker($section, 'Tampilan Halaman Jadwal Pembagian Makanan & Riwayat Konfirmasi Penerimaan');

addHeading2($section, '3.7 Artikel Edukasi Gizi & Pusat Bantuan');
addParagraph($section, 'Pengguna dapat membaca artikel kesehatan gizi dan menggunakan fitur pencarian.');
addParagraph($section, 'Halaman Pusat Bantuan (Help Center) menyajikan FAQ dan nomor Kontak Pengaduan jika terjadi kendala pada makanan.');

addImageMarker($section, 'Tampilan Halaman Artikel Edukasi Gizi & Halaman Pusat Bantuan / FAQ');

addHeading2($section, '3.8 Pengaturan Akun, Keamanan & Notifikasi');
addBullet($section, '• Ubah Profil: Memperbarui nama, foto profil, dan nomor HP.');
addBullet($section, '• Ubah Password: Mengganti kata sandi demi keamanan akun.');
addBullet($section, '• Pengaturan Notifikasi: Mengaktifkan/mematikan pengingat jadwal pembagian makanan.');

addImageMarker($section, 'Tampilan Halaman Pengaturan Profil & Keamanan Akun');

$section->addPageBreak();

// ==========================================
// BAB 4: TROUBLESHOOTING & FAQ
// ==========================================
addHeading1($section, 'BAB 4: TROUBLESHOOTING & FREQUENTLY ASKED QUESTIONS (FAQ)');

addHeading2($section, '4.1 Masalah Login & Akun');
addParagraph($section, 'Q: Saya lupa kata sandi akun mobile, apa yang harus dilakukan?');
addParagraph($section, 'A: Pilih menu "Lupa Password" pada halaman login, masukkan email Anda, dan periksa kode OTP yang dikirimkan. Masukkan OTP tersebut untuk membuat password baru.');

addParagraph($section, 'Q: Akun terblokir atau tidak bisa masuk Web Admin Panel?');
addParagraph($section, 'A: Pastikan penulisan email dan password sudah benar (perhatikan huruf besar/kecil). Jika tetap gagal, hubungi Super Admin untuk melakukan reset kata sandi.');

addHeading2($section, '4.2 Masalah Verifikasi & Kamera / GPS');
addParagraph($section, 'Q: Mengapa lokasi GPS tidak terdeteksi saat mengonfirmasi penerimaan makanan?');
addParagraph($section, 'A: Pastikan fitur GPS / Location Services pada smartphone Anda sudah diaktifkan dan berikan izin "Allow Location Access" untuk aplikasi MBG.');

addParagraph($section, 'Q: Aplikasi tidak bisa membuka kamera saat mengambil foto bukti?');
addParagraph($section, 'A: Buka Pengaturan Smartphone -> Aplikasi -> MBG Mobile -> Izin (Permissions) -> Aktifkan Izin Kamera.');

addHeading2($section, '4.3 Masalah Jaringan & Upload Bukti');
addParagraph($section, 'Q: Mengapa pengiriman konfirmasi penerimaan gagal / loading lama?');
addParagraph($section, 'A: Pastikan sambungan internet (Wi-Fi atau Data Seluler) stabil. Jika sinyal lemah, coba cari lokasi dengan sinyal lebih baik lalu tekan tombol kirim ulang.');

$section->addPageBreak();

// ==========================================
// BAB 5: PENUTUP & LAYANAN BANTUAN
// ==========================================
addHeading1($section, 'BAB 5: PENUTUP & KETENTUAN LAYANAN');

addParagraph($section, 'Dokumen Manual Book ini disusun sebagai panduan resmi operasional Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG). Dengan mengikuti petunjuk pengoperasian yang ada dalam dokumen ini, diharapkan penyaluran program makan bergizi gratis dapat berjalan dengan tertib, terukur, dan transparan.');

addNoteBox($section, 'Untuk informasi lebih lanjut, pengajuan bantuan teknis, atau pelaporan kendala sistem, silakan hubungi Tim Layanan Bantuan / Helpdesk SMPM MBG melalui email: support@smpm-mbg.go.id atau WhatsApp Call Center: +62 812-3456-7890.', 'KONTAK LAYANAN BANTUAN');

// Function to save document properly without corrupting ZipArchive
function saveDocFile($phpWord, $filePath) {
    $tempFile = sys_get_temp_dir() . '/temp_' . md5(uniqid()) . '.docx';
    $writer = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
    $writer->save($tempFile);
    copy($tempFile, $filePath);
    @unlink($tempFile);
}

// Save Documents (.docx and .doc)
$fileNameDocx = 'Manual_Book_SMPM_MBG.docx';
$fileNameDoc = 'Manual_Book_SMPM_MBG.doc';

$desktopDir = 'C:/Users/LENOVO/Desktop/';
$backendDir = 'c:/Users/LENOVO/Desktop/mbg-backend/';
$artifactDir = 'C:/Users/LENOVO/.gemini/antigravity/brain/832a327f-92bf-4842-8834-04ce89dbf939/';

saveDocFile($phpWord, $desktopDir . $fileNameDocx);
saveDocFile($phpWord, $desktopDir . $fileNameDoc);
saveDocFile($phpWord, $backendDir . $fileNameDocx);
saveDocFile($phpWord, $backendDir . $fileNameDoc);
saveDocFile($phpWord, $artifactDir . $fileNameDocx);
saveDocFile($phpWord, $artifactDir . $fileNameDoc);

echo "SUCCESS: Re-created $fileNameDocx and $fileNameDoc properly in Desktop, mbg-backend, and artifacts directory.\n";
