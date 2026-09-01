$ErrorActionPreference = "Stop"

# Start MS Word COM object
$word = New-Object -ComObject Word.Application
$word.Visible = $false

try {
    $doc = $word.Documents.Add()
    $selection = $word.Selection

    # Helper functions for adding formatted elements
    function Add-H1($text) {
        $selection.Style = "Heading 1"
        $selection.Font.Name = "Calibri"
        $selection.Font.Size = 18
        $selection.Font.Bold = 1
        $selection.Font.Color = 0x8A3E1E # Navy (BGR)
        $selection.ParagraphFormat.SpaceBefore = 18
        $selection.ParagraphFormat.SpaceAfter = 8
        $selection.TypeText($text)
        $selection.TypeParagraph()
    }

    function Add-H2($text) {
        $selection.Style = "Heading 2"
        $selection.Font.Name = "Calibri"
        $selection.Font.Size = 14
        $selection.Font.Bold = 1
        $selection.Font.Color = 0x88940D # Teal (BGR)
        $selection.ParagraphFormat.SpaceBefore = 14
        $selection.ParagraphFormat.SpaceAfter = 6
        $selection.TypeText($text)
        $selection.TypeParagraph()
    }

    function Add-H3($text) {
        $selection.Style = "Heading 3"
        $selection.Font.Name = "Calibri"
        $selection.Font.Size = 12
        $selection.Font.Bold = 1
        $selection.Font.Color = 0x514137
        $selection.ParagraphFormat.SpaceBefore = 10
        $selection.ParagraphFormat.SpaceAfter = 4
        $selection.TypeText($text)
        $selection.TypeParagraph()
    }

    function Add-P($text) {
        $selection.Style = "Normal"
        $selection.Font.Name = "Calibri"
        $selection.Font.Size = 11
        $selection.Font.Bold = 0
        $selection.Font.Color = 0x37291F
        $selection.ParagraphFormat.SpaceBefore = 0
        $selection.ParagraphFormat.SpaceAfter = 6
        $selection.ParagraphFormat.LineSpacingRule = 0
        $selection.TypeText($text)
        $selection.TypeParagraph()
    }

    function Add-Bullet($text) {
        $selection.Style = "Normal"
        $selection.Font.Name = "Calibri"
        $selection.Font.Size = 11
        $selection.Font.Bold = 0
        $selection.Font.Color = 0x37291F
        $selection.ParagraphFormat.SpaceBefore = 0
        $selection.ParagraphFormat.SpaceAfter = 3
        $selection.TypeText('  •  ' + $text)
        $selection.TypeParagraph()
    }

    function Add-ImageMarker($caption) {
        $range = $selection.Range
        $table = $doc.Tables.Add($range, 1, 1)
        $table.Rows.Alignment = 1 # Center
        $table.Borders.Enable = 1
        $cellRange = $table.Cell(1, 1).Range
        $cellRange.Font.Name = "Calibri"
        $cellRange.Font.Size = 10
        $cellRange.Font.Bold = 1
        $cellRange.Font.Italic = 1
        $cellRange.Font.Color = 0x0677D9 # Amber/Orange
        $cellRange.ParagraphFormat.Alignment = 1 # Center
        $cellRange.Text = '[Gambar: ' + $caption + ']'
        
        $selection.SetRange($table.Range.End + 1, $table.Range.End + 1)
        $selection.TypeParagraph()
    }

    function Add-NoteBox($title, $text) {
        $range = $selection.Range
        $table = $doc.Tables.Add($range, 1, 1)
        $table.Rows.Alignment = 1 # Center
        $table.Borders.Enable = 1
        $cellRange = $table.Cell(1, 1).Range
        $cellRange.Font.Name = "Calibri"
        $cellRange.Font.Size = 10
        $cellRange.Font.Color = 0xAF401E
        $cellRange.Text = '[ ' + $title + ' ]' + "`n" + $text
        
        $selection.SetRange($table.Range.End + 1, $table.Range.End + 1)
        $selection.TypeParagraph()
    }

    # Header & Footer setup
    $doc.Sections.Item(1).Headers.Item(1).Range.Text = 'Manual Book - Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG)'
    $doc.Sections.Item(1).Headers.Item(1).Range.Font.Size = 9
    $doc.Sections.Item(1).Headers.Item(1).Range.Font.Italic = 1
    $doc.Sections.Item(1).Headers.Item(1).Range.Font.Color = 0x80726B
    $doc.Sections.Item(1).Headers.Item(1).Range.ParagraphFormat.Alignment = 2 # Right

    # ----------------------------------------------------
    # COVER PAGE
    # ----------------------------------------------------
    $selection.ParagraphFormat.Alignment = 1 # Center
    $selection.Font.Name = "Calibri"
    $selection.Font.Size = 14
    $selection.Font.Bold = 1
    $selection.Font.Color = 0x88940D
    $selection.TypeText('MANUAL BOOK / PANDUAN PENGGUNA' + "`n")

    $selection.Font.Size = 22
    $selection.Font.Bold = 1
    $selection.Font.Color = 0x8A3E1E
    $selection.TypeText('SISTEM MANAJEMEN & PEMANTAUAN' + "`n" + 'MAKAN BERGIZI GRATIS' + "`n")

    $selection.Font.Size = 18
    $selection.TypeText('(SMPM MBG)' + "`n`n")

    $selection.Font.Size = 12
    $selection.Font.Bold = 0
    $selection.Font.Italic = 1
    $selection.Font.Color = 0x63554B
    $selection.TypeText('Panduan Penggunaan Lengkap Web Admin Panel & Aplikasi Mobile' + "`n`n")

    $selection.ParagraphFormat.Alignment = 0 # Left
    Add-ImageMarker 'Logo & Banner Resmi Sistem Makan Bergizi Gratis (SMPM MBG)'

    Add-P 'Informasi Dokumen:'
    Add-Bullet 'Versi Aplikasi: 1.0.0 (Latest Release)'
    Add-Bullet 'Modul Terkait: Laravel Filament Web Admin Panel & Flutter Mobile App'
    Add-Bullet 'Tanggal Penyusunan: Agustus 2026'
    Add-Bullet 'Target Pengguna: Administrator, Petugas SPPG/Lapangan, Siswa, & Wali Penerima Manfaat'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # DAFTAR ISI
    # ----------------------------------------------------
    Add-H1 'DAFTAR ISI'
    Add-P 'Dokumen panduan ini terbagi ke dalam 5 bagian utama:'
    Add-Bullet 'BAB 1: PENDAHULUAN & GAMBARAN UMUM SISTEM'
    Add-Bullet 'BAB 2: PANDUAN PENGGUNA - WEB ADMIN PANEL (LARAVEL FILAMENT)'
    Add-Bullet 'BAB 3: PANDUAN PENGGUNA - APLIKASI MOBILE (FLUTTER APP)'
    Add-Bullet 'BAB 4: TROUBLESHOOTING & FREQUENTLY ASKED QUESTIONS (FAQ)'
    Add-Bullet 'BAB 5: KETENTUAN & LAYANAN BANTUAN'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # BAB 1
    # ----------------------------------------------------
    Add-H1 'BAB 1: PENDAHULUAN & GAMBARAN UMUM SISTEM'
    
    Add-H2 '1.1 Latar Belakang & Tujuan Sistem'
    Add-P 'Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG) dikembangkan untuk mendukung transparansi, efisiensi, dan ketepatan sasaran dalam program pembagian makanan bergizi gratis. Sistem ini menghubungkan pengelola pusat/petugas SPPG dengan para penerima manfaat (seperti siswa sekolah, balita, ibu hamil, dan ibu menyusui) secara real-time.'
    Add-P 'Tujuan utama dari aplikasi ini mencakup:'
    Add-Bullet 'Memastikan distribusi makanan bergizi tepat jadwal dan tepat sasaran.'
    Add-Bullet 'Menyediakan transparansi informasi kandungan gizi (kalori, protein, karbohidrat, lemak, vitamin) bagi setiap menu yang disajikan.'
    Add-Bullet 'Memudahkan proses verifikasi penerimaan makanan di lapangan menggunakan teknologi Geo-tagging (GPS) dan bukti foto kamera.'
    Add-Bullet 'Mengumpulkan umpan balik (rating & ulasan) langsung dari penerima manfaat guna menjaga kualitas layanan dan makanan.'

    Add-H2 '1.2 Arsitektur Sistem'
    Add-P 'Sistem SMPM MBG terdiri dari 2 komponen utama yang saling terintegrasi via RESTful API Sanctum:'
    Add-Bullet 'Web Admin Panel (Laravel Filament): Platform berbasis web yang digunakan oleh Administrator dan Petugas SPPG untuk mengelola data master, jadwal, menu makanan, verifikasi penerimaan, dan edukasi gizi.'
    Add-Bullet 'Aplikasi Mobile (Flutter App): Platform berbasis mobile (Android/iOS) yang digunakan oleh Siswa / Wali / Penerima Manfaat untuk menerima notifikasi menu, jadwal pembagian, melakukan verifikasi foto & lokasi GPS, memberikan ulasan, serta mengakses artikel edukasi gizi.'

    Add-ImageMarker 'Diagram Arsitektur Integrasi Web Admin Panel Laravel Filament & Aplikasi Mobile Flutter'

    Add-H2 '1.3 Hak Akses & Peran Pengguna (User Roles)'
    Add-P 'Hak akses dalam sistem dibagi menjadi 3 kategori utama:'
    Add-Bullet 'Super Admin / Admin: Akses penuh Web Admin Panel untuk mengelola data master, user, menu, jadwal, verifikasi, artikel, dan ekspor laporan.'
    Add-Bullet 'Petugas / SPPG: Akses Web Admin & Mobile untuk mengelola jadwal distribusi, input menu harian, serta konfirmasi status penyaluran makanan.'
    Add-Bullet 'Penerima Manfaat (Siswa/Wali): Akses Aplikasi Mobile untuk melihat menu harian & nutrisi, mengirim konfirmasi penerimaan (foto + GPS), mengisi ulasan, dan membaca artikel.'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # BAB 2
    # ----------------------------------------------------
    Add-H1 'BAB 2: PANDUAN PENGGUNA - WEB ADMIN PANEL (LARAVEL FILAMENT)'

    Add-H2 '2.1 Akses & Authentikasi Admin'
    Add-P 'Untuk mengakses Web Admin Panel SMPM MBG, buka peramban web (Google Chrome / Mozilla Firefox / Microsoft Edge) dan ketikkan alamat URL Admin Panel.'
    Add-Bullet 'Buka browser dan kunjungi alamat URL Web Admin.'
    Add-Bullet 'Masukkan Email dan Password akun Administrator.'
    Add-Bullet 'Klik tombol Sign In / Masuk.'

    Add-ImageMarker 'Form Login Web Admin Panel (Filament Authentication)'
    Add-NoteBox 'PETUNJUK PENTING' 'Pastikan akun Anda sudah didaftarkan sebagai Admin oleh Super Admin. Jika lupa kata sandi, hubungi Tim IT Administrator Sistem.'

    Add-H2 '2.2 Dashboard Analitik & Ringkasan Utama'
    Add-P 'Setelah berhasil masuk, Anda akan diarahkan ke halaman Dashboard Utama. Dashboard ini menyajikan ringkasan eksekutif secara real-time:'
    Add-Bullet 'Widget Total Penerima Manfaat: Jumlah siswa/penerima terdaftar.'
    Add-Bullet 'Widget Menu MBG Aktif: Jumlah variasi menu makanan bergizi yang siap disalurkan.'
    Add-Bullet 'Widget Verifikasi Hari Ini: Jumlah laporan konfirmasi penerimaan makanan yang telah masuk dari mobile.'
    Add-Bullet 'Chart / Grafik Distribusi: Pemantauan persentase penyaluran makanan per kategori/sekolah.'

    Add-ImageMarker 'Tampilan Dashboard Analitik & Ringkasan Statistik Web Admin Panel'

    Add-H2 '2.3 Kelola Pengguna & Hak Akses (User Management)'
    Add-P 'Modul ini memungkinkan Admin untuk mengelola akun seluruh pengguna sistem (baik akun Admin, Petugas, maupun Pengguna Mobile).'
    Add-H3 'Langkah Mengelola Pengguna:'
    Add-Bullet 'Pilih menu Users / Pengguna pada sidebar navigasi sebelah kiri.'
    Add-Bullet 'Klik tombol + New User untuk menambah pengguna baru.'
    Add-Bullet 'Isi form data user: Nama Lengkap, Email, Password, Nomor Telepon, dan Role.'
    Add-Bullet 'Klik Create untuk menyimpan data.'
    Add-Bullet 'Gunakan tombol Edit untuk mengubah data atau Delete untuk menghapus pengguna.'

    Add-ImageMarker 'Halaman Kelola Data Pengguna & Form Tambah User Baru'

    Add-H2 '2.4 Kelola Penerima Manfaat (Beneficiaries)'
    Add-P 'Modul Penerima Manfaat digunakan untuk mencatat identitas detail penerima program Makan Bergizi Gratis (misalnya data siswa per sekolah atau sasaran masyarakat).'
    Add-Bullet 'Kategori Penerima: SD, SMP, SMA/SMK, Ibu Hamil, Ibu Menyusui, dan Balita.'
    Add-Bullet 'Detail Informasi: Nama, NIK/NISN, Tempat/Tanggal Lahir, Alamat, dan Kategori Spesifik.'

    Add-ImageMarker 'Halaman Kelola Data Penerima Manfaat & Tabel Daftar Siswa/Penerima'

    Add-H2 '2.5 Kelola Menu Makan Bergizi Gratis (MBG Menu)'
    Add-P 'Menu MBG merupakan inti dari informasi makanan bergizi yang disajikan. Admin wajib menginput informasi komprehensif terkait makanan yang akan didistribusikan.'
    Add-H3 'Komponen Input Menu:'
    Add-Bullet 'Informasi Umum: Nama Menu, Deskripsi, Foto Makanan, dan Kategori.'
    Add-Bullet 'Informasi Gizi (Nutrisi): Jumlah Kalori (kcal), Protein (gram), Karbohidrat (gram), Lemak (gram), Serat, dan Vitamin.'
    Add-Bullet 'Komposisi / Bahan Makanan: Rincian bahan alami yang digunakan.'
    Add-Bullet 'Manfaat Kesehatan: Penjelasan singkat khasiat gizi menu tersebut bagi tumbuh kembang anak.'

    Add-ImageMarker 'Form Input Menu MBG beserta Rincian Nilai Gizi & Bahan Makanan'

    Add-H2 '2.6 Penjadwalan Pembagian Makanan (Schedule Resource)'
    Add-P 'Melalui fitur Penjadwalan, Admin / Petugas dapat menetapkan menu apa yang akan didistribusikan ke lokasi sasaran pada tanggal tertentu.'
    Add-Bullet 'Pilih menu Schedules / Jadwal MBG.'
    Add-Bullet 'Klik Create Schedule.'
    Add-Bullet 'Tentukan Tanggal Distribusi, Pilih Menu MBG yang akan dibagikan, serta Pilih Sekolah / Lokasi Tujuan.'
    Add-Bullet 'Simpan jadwal. Jadwal ini akan otomatis muncul pada aplikasi mobile pengguna.'

    Add-ImageMarker 'Tabel Penjadwalan Distribusi Makanan Bergizi Gratis'

    Add-H2 '2.7 Monitoring Verifikasi & Konfirmasi Penerimaan'
    Add-P 'Fitur Verifikasi merupakan modul kontrol kualitas terpenting untuk mengecek laporan penerimaan makanan yang dikirimkan oleh pengguna melalui aplikasi mobile.'
    Add-H3 'Prosedur Verifikasi oleh Admin:'
    Add-Bullet 'Masuk ke menu Confirmations / Verifikasi Penerimaan.'
    Add-Bullet 'Pilih laporan verifikasi yang masuk dari penerima.'
    Add-Bullet 'Periksa Bukti Foto Makanan yang diunggah oleh penerima.'
    Add-Bullet 'Cek Koordinat GPS & Peta Lokasi untuk memastikan pengambilan dilakukan di lokasi sasaran.'
    Add-Bullet 'Cek Catatan Kondisi Makanan (misal: Makanan diterima rapi dan hangat).'
    Add-Bullet 'Ubah status menjadi Verified / Approved (Disetujui) atau Rejected (Ditolak jika foto tidak sesuai/fiktif).'

    Add-ImageMarker 'Halaman Detail Verifikasi Penerimaan (Bukti Foto, Tanggal/Waktu, & Peta Lokasi GPS)'

    Add-H2 '2.8 Kelola Artikel Edukasi Gizi (Article Resource)'
    Add-P 'Admin dapat menerbitkan artikel edukasi mengenai gizi seimbang, pola hidup sehat, dan pentingnya sarapan bergizi.'
    Add-Bullet 'Fitur mencakup: Judul Artikel, Kategori, Gambar Utama, Isi Konten Artikel, dan Status Publikasi.'

    Add-ImageMarker 'Halaman Kelola Artikel Edukasi Gizi & Kesehatan'

    Add-H2 '2.9 Kelola Ulasan & Rating Makanan (Menu Rating)'
    Add-P 'Admin dapat melihat seluruh penilaian bintang (1-5) dan komentar ulasan rasa/kualitas makanan dari penerima manfaat sebagai bahan evaluasi dapur SPPG.'

    Add-ImageMarker 'Tabel Pengelolaan Ulasan & Rating Makanan dari Pengguna'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # BAB 3
    # ----------------------------------------------------
    Add-H1 'BAB 3: PANDUAN PENGGUNA - APLIKASI MOBILE (FLUTTER APP)'

    Add-H2 '3.1 Persyaratan Perangkat & Izin Akses'
    Add-P 'Aplikasi Mobile MBG dapat dijalankan pada smartphone Android (minimal versi 7.0 Nougat) dan iOS (minimal iOS 12.0).'
    Add-P 'Saat pertama kali dibuka, aplikasi membutuhkan izin akses berikut:'
    Add-Bullet 'Camera (Kamera): Diperlukan untuk mengambil foto bukti fisik penerimaan makanan secara real-time.'
    Add-Bullet 'Location / GPS (Lokasi): Diperlukan untuk mencatat titik koordinat presisi lokasi penerimaan makanan.'
    Add-Bullet 'Storage / Media: Diperlukan untuk menyimpan sementara file foto bukti sebelum diunggah.'

    Add-H2 '3.2 Pendaftaran & Authentikasi Akun Mobile'
    Add-H3 'A. Form Pendaftaran (Register):'
    Add-P 'Penerima manfaat yang belum memiliki akun dapat melakukan registrasi mandiri.'
    Add-Bullet 'Buka aplikasi MBG pada smartphone.'
    Add-Bullet 'Pilih menu Daftar Akun Baru.'
    Add-Bullet 'Isi data: Nama Lengkap, Email, Nomor Telepon, Password, dan Kategori Penerima.'
    Add-Bullet 'Klik Daftar.'

    Add-ImageMarker 'Tampilan Halaman Registrasi & Form Login Aplikasi Mobile'

    Add-H3 'B. Lupa Password & Verifikasi OTP:'
    Add-P 'Jika pengguna lupa kata sandi, klik Lupa Password?, masukkan email terdaftar, dan masukkan 6 digit kode OTP yang dikirimkan untuk mereset kata sandi.'

    Add-ImageMarker 'Tampilan Halaman Input Kode OTP & Reset Password Mobile'

    Add-H2 '3.3 Dashboard Utama Aplikasi Mobile'
    Add-P 'Setelah login, pengguna disuguhkan Dashboard interaktif dengan berbagai card informasi:'
    Add-Bullet 'Card Menu Hari Ini: Menampilkan foto dan nama menu makanan yang dijadwalkan dibagikan hari ini.'
    Add-Bullet 'Ringkasan Nutrisi: Menampilkan total kalori dan protein dari menu hari ini.'
    Add-Bullet 'Tombol Cepat Konfirmasi Terima MBG: Akses langsung untuk melaporkan penerimaan makanan.'
    Add-Bullet 'Banner Edukasi: Artikel gizi terbaru.'

    Add-ImageMarker 'Tampilan Dashboard Utama Aplikasi Mobile (Status Menu Hari Ini & Akses Cepat)'

    Add-H2 '3.4 Fitur Verifikasi & Konfirmasi Penerimaan MBG (Fitur Utama)'
    Add-P 'Fitur ini merupakan fitur paling vital bagi penerima manfaat untuk mengonfirmasi bahwa makanan telah diterima dengan baik.'
    Add-H3 'Langkah-Langkah Mengirim Bukti Penerimaan:'
    Add-Bullet 'Dari Dashboard atau Tab Navigasi, tekan tombol Terima MBG / Konfirmasi Penerimaan.'
    Add-Bullet 'Tekan ikon kamera untuk mengambil Foto Bukti Makanan yang diterima secara langsung.'
    Add-Bullet 'Pastikan GPS smartphone aktif. Aplikasi akan mendeteksi Lokasi & Alamat secara otomatis.'
    Add-Bullet 'Pilih Kondisi Makanan (Layak / Baik / Kurang Baik).'
    Add-Bullet 'Tambahkan Catatan Singkat jika ada (misal: Lauk lengkap dan segar).'
    Add-Bullet 'Tekan tombol Kirim Verifikasi.'
    Add-Bullet 'Tunggu hingga muncul notifikasi sukses.'

    Add-ImageMarker 'Form Konfirmasi Penerimaan MBG (Upload Foto Kamera real-time & Pin Point GPS Location)'
    Add-ImageMarker 'Pop-up / Dialog Notifikasi Berhasil Mengirim Verifikasi Makanan'

    Add-NoteBox 'PERHATIAN PENTING' 'Pengambilan foto bukti harus dilakukan secara langsung menggunakan kamera aplikasi (bukan mengambil dari galeri lama) untuk menjamin keabsahan laporan.'

    Add-H2 '3.5 Detail Menu MBG, Nutrisi & Pemberian Ulasan'
    Add-P 'Pengguna dapat mengetuk card menu untuk melihat informasi gizi lengkap serta memberikan feedback.'
    Add-Bullet 'Rincian Gizi: Kalori, Protein, Karbohidrat, Lemak, Vitamin A/C, Kalsium, Besi.'
    Add-Bullet 'Form Rating & Ulasan: Pengguna dapat memberi bintang (1-5) dan menuliskan komentar pengalaman rasa makanan.'

    Add-ImageMarker 'Halaman Detail Nutrisi Menu MBG & Form Penilaian/Ulasan Makanan'

    Add-H2 '3.6 Jadwal Pembagian & Riwayat Konfirmasi'
    Add-Bullet 'Tab Jadwal: Menampilkan kalender dan daftar menu yang akan dibagikan pada hari-hari mendatang.'
    Add-Bullet 'Tab Riwayat: Menampilkan daftar seluruh konfirmasi penerimaan yang pernah dikirimkan beserta statusnya (Verified / Pending).'

    Add-ImageMarker 'Tampilan Halaman Jadwal Pembagian Makanan & Riwayat Konfirmasi Penerimaan'

    Add-H2 '3.7 Artikel Edukasi Gizi & Pusat Bantuan'
    Add-P 'Pengguna dapat membaca artikel kesehatan gizi dan menggunakan fitur pencarian. Halaman Pusat Bantuan (Help Center) menyajikan FAQ dan nomor Kontak Pengaduan jika terjadi kendala pada makanan.'

    Add-ImageMarker 'Tampilan Halaman Artikel Edukasi Gizi & Halaman Pusat Bantuan / FAQ'

    Add-H2 '3.8 Pengaturan Akun, Keamanan & Notifikasi'
    Add-Bullet 'Ubah Profil: Memperbarui nama, foto profil, dan nomor HP.'
    Add-Bullet 'Ubah Password: Mengganti kata sandi demi keamanan akun.'
    Add-Bullet 'Pengaturan Notifikasi: Mengaktifkan/mematikan pengingat jadwal pembagian makanan.'

    Add-ImageMarker 'Tampilan Halaman Pengaturan Profil & Keamanan Akun'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # BAB 4
    # ----------------------------------------------------
    Add-H1 'BAB 4: TROUBLESHOOTING & FREQUENTLY ASKED QUESTIONS (FAQ)'

    Add-H2 '4.1 Masalah Login & Akun'
    Add-P 'Q: Saya lupa kata sandi akun mobile, apa yang harus dilakukan?'
    Add-P 'A: Pilih menu Lupa Password pada halaman login, masukkan email Anda, dan periksa kode OTP yang dikirimkan. Masukkan OTP tersebut untuk membuat password baru.'
    Add-P 'Q: Akun terblokir atau tidak bisa masuk Web Admin Panel?'
    Add-P 'A: Pastikan penulisan email dan password sudah benar. Jika tetap gagal, hubungi Super Admin untuk melakukan reset kata sandi.'

    Add-H2 '4.2 Masalah Verifikasi & Kamera / GPS'
    Add-P 'Q: Mengapa lokasi GPS tidak terdeteksi saat mengonfirmasi penerimaan makanan?'
    Add-P 'A: Pastikan fitur GPS / Location Services pada smartphone Anda sudah diaktifkan dan berikan izin Allow Location Access untuk aplikasi MBG.'
    Add-P 'Q: Aplikasi tidak bisa membuka kamera saat mengambil foto bukti?'
    Add-P 'A: Buka Pengaturan Smartphone -> Aplikasi -> MBG Mobile -> Izin (Permissions) -> Aktifkan Izin Kamera.'

    Add-H2 '4.3 Masalah Jaringan & Upload Bukti'
    Add-P 'Q: Mengapa pengiriman konfirmasi penerimaan gagal / loading lama?'
    Add-P 'A: Pastikan sambungan internet (Wi-Fi atau Data Seluler) stabil. Jika sinyal lemah, coba cari lokasi dengan sinyal lebih baik lalu tekan tombol kirim ulang.'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # BAB 5
    # ----------------------------------------------------
    Add-H1 'BAB 5: KETENTUAN & LAYANAN BANTUAN'
    Add-P 'Dokumen Manual Book ini disusun sebagai panduan resmi operasional Sistem Manajemen & Pemantauan Makan Bergizi Gratis (SMPM MBG). Dengan mengikuti petunjuk pengoperasian yang ada dalam dokumen ini, diharapkan penyaluran program makan bergizi gratis dapat berjalan dengan tertib, terukur, dan transparan.'

    Add-NoteBox 'KONTAK LAYANAN BANTUAN' 'Untuk informasi lebih lanjut, pengajuan bantuan teknis, atau pelaporan kendala sistem, silakan hubungi Tim Layanan Bantuan / Helpdesk SMPM MBG melalui email: support@smpm-mbg.go.id atau WhatsApp Call Center: +62 812-3456-7890.'

    # Save Native Files
    $pathDocx = "C:\Users\LENOVO\Desktop\Manual_Book_SMPM_MBG.docx"
    $pathDoc  = "C:\Users\LENOVO\Desktop\Manual_Book_SMPM_MBG.doc"
    $pathBackendDocx = "C:\Users\LENOVO\Desktop\mbg-backend\Manual_Book_SMPM_MBG.docx"
    $pathBackendDoc  = "C:\Users\LENOVO\Desktop\mbg-backend\Manual_Book_SMPM_MBG.doc"
    $pathArtifactDocx = "C:\Users\LENOVO\.gemini\antigravity\brain\832a327f-92bf-4842-8834-04ce89dbf939\Manual_Book_SMPM_MBG.docx"
    $pathArtifactDoc  = "C:\Users\LENOVO\.gemini\antigravity\brain\832a327f-92bf-4842-8834-04ce89dbf939\Manual_Book_SMPM_MBG.doc"

    # Save as DOCX (wdFormatXMLDocument = 12)
    $doc.SaveAs([ref]$pathDocx, [ref]12)
    $doc.SaveAs([ref]$pathBackendDocx, [ref]12)
    $doc.SaveAs([ref]$pathArtifactDocx, [ref]12)

    # Save as DOC (wdFormatDocument = 0)
    $doc.SaveAs([ref]$pathDoc, [ref]0)
    $doc.SaveAs([ref]$pathBackendDoc, [ref]0)
    $doc.SaveAs([ref]$pathArtifactDoc, [ref]0)

    $doc.Close()
    Write-Output "SUCCESS_NATIVE_SAVED"
} finally {
    $word.Quit()
}
