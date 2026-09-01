$ErrorActionPreference = "Stop"

# Start MS Word COM object
$word = New-Object -ComObject Word.Application
$word.Visible = $false

$imgPathDiagram = "C:\Users\LENOVO\.gemini\antigravity\brain\832a327f-92bf-4842-8834-04ce89dbf939\diagram_arsitektur_mbg_1785919501773.jpg"

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

    function Add-ImageMarker($caption, $imagePath = $null) {
        if ($imagePath -and (Test-Path $imagePath)) {
            $selection.ParagraphFormat.Alignment = 1 # Center
            $shape = $selection.InlineShapes.AddPicture($imagePath)
            $shape.Width = 420 # Resized width for Word page
            $selection.TypeParagraph()
            
            # Add Caption below image
            $selection.Font.Name = "Calibri"
            $selection.Font.Size = 10
            $selection.Font.Italic = 1
            $selection.Font.Bold = 1
            $selection.Font.Color = 0x88940D
            $selection.TypeText('Gambar: ' + $caption + "`n`n")
            $selection.ParagraphFormat.Alignment = 0 # Left
        } else {
            $range = $selection.Range
            $table = $doc.Tables.Add($range, 1, 1)
            $table.Rows.Alignment = 1 # Center
            $table.Borders.Enable = 1
            $cellRange = $table.Cell(1, 1).Range
            $cellRange.Font.Name = "Calibri"
            $cellRange.Font.Size = 10
            $cellRange.Font.Bold = 1
            $cellRange.Font.Italic = 1
            $cellRange.Font.Color = 0x0677D9 # Amber/Orange (BGR)
            $cellRange.ParagraphFormat.Alignment = 1 # Center
            $cellRange.Text = '[Gambar: ' + $caption + ']'
            
            $selection.SetRange($table.Range.End + 1, $table.Range.End + 1)
            $selection.TypeParagraph()
        }
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
    $doc.Sections.Item(1).Headers.Item(1).Range.Text = 'Manual Book - Sistem Informasi Pencatatan & Edukasi Gizi MBG (Ibu Hamil & Balita)'
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
    $selection.TypeText('MANUAL BOOK APLIKASI' + "`n`n")

    $selection.Font.Size = 20
    $selection.Font.Bold = 1
    $selection.Font.Color = 0x8A3E1E
    $selection.TypeText('SISTEM INFORMASI PENCATATAN DAN EDUKASI GIZI UNTUK MENDUKUNG PROGRAM MAKAN BERGIZI GRATIS (MBG) PADA IBU HAMIL DAN BALITA' + "`n`n")

    $selection.Font.Size = 12
    $selection.Font.Bold = 0
    $selection.Font.Italic = 1
    $selection.Font.Color = 0x63554B
    $selection.TypeText('Panduan Penggunaan Lengkap Web Admin (Kader Posyandu) & Aplikasi Mobile (Pengguna Ibu Hamil/Wali Balita)' + "`n`n")

    $selection.ParagraphFormat.Alignment = 0 # Left
    Add-ImageMarker 'Logo & Banner Resmi Sistem Informasi Pencatatan & Edukasi Gizi MBG'

    Add-P 'Informasi Dokumen Skripsi:'
    Add-Bullet 'Judul Sistem: Sistem Informasi Pencatatan dan Edukasi Gizi MBG'
    Add-Bullet 'Target Pengguna: Admin/Kader Posyandu (Web) dan Ibu Hamil & Balita (Mobile)'
    Add-Bullet 'Teknologi: Laravel Filament Admin Panel & Flutter Mobile App'
    Add-Bullet 'Tanggal Penyusunan: Agustus 2026'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # DAFTAR ISI
    # ----------------------------------------------------
    Add-H1 'DAFTAR ISI'
    Add-P 'Dokumen panduan ini terbagi ke dalam bagian-bagian utama berikut:'
    Add-Bullet '1. Pendahuluan (Deskripsi Aplikasi & Tujuan)'
    Add-Bullet '2. Hak Akses Pengguna (Admin/Kader Posyandu & Pengguna Mobile)'
    Add-Bullet '3. Panduan Web Admin (Login, Dashboard, Data Penerima, Data Menu, Jadwal, Edukasi Gizi, Kehadiran, Cetak Laporan)'
    Add-Bullet '4. Panduan Aplikasi Mobile (Login, Beranda, Jadwal MBG, Menu MBG, Edukasi Gizi, Status Gizi, Profil)'
    Add-Bullet '5. Logout'
    Add-Bullet '6. Pesan Sistem (Notifikasi & Status)'
    Add-Bullet '7. Penutup'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # 1. PENDAHULUAN
    # ----------------------------------------------------
    Add-H1 '1. Pendahuluan'
    
    Add-H2 '1.1 Deskripsi Aplikasi'
    Add-P 'Sistem Informasi Pencatatan dan Edukasi Gizi merupakan aplikasi berbasis web dan mobile yang digunakan untuk mendukung pelaksanaan Program Makan Bergizi Gratis (MBG) bagi ibu hamil dan balita. Aplikasi ini membantu kader Posyandu dalam melakukan pencatatan data, pengelolaan jadwal distribusi, pembuatan laporan, serta memberikan informasi gizi kepada pengguna.'

    Add-H2 '1.2 Tujuan'
    Add-P 'Manual book ini dibuat sebagai panduan penggunaan aplikasi bagi Admin/Kader Posyandu dan pengguna aplikasi mobile agar dapat mengoperasikan seluruh fitur dengan benar.'

    Add-ImageMarker 'Diagram Arsitektur Sistem Informasi Pencatatan & Edukasi Gizi MBG' $imgPathDiagram

    # ----------------------------------------------------
    # 2. HAK AKSES PENGGUNA
    # ----------------------------------------------------
    Add-H1 '2. Hak Akses Pengguna'

    Add-H2 '2.1 Admin/Kader Posyandu (Web)'
    Add-P 'Admin memiliki hak akses penuh pada portal Web Admin untuk:'
    Add-Bullet 'Login ke sistem.'
    Add-Bullet 'Mengelola data penerima MBG (Ibu Hamil & Balita).'
    Add-Bullet 'Mengelola data menu MBG dan rincian kandungan gizi.'
    Add-Bullet 'Mengelola jadwal distribusi makanan bergizi.'
    Add-Bullet 'Mengelola artikel edukasi gizi dan kesehatan.'
    Add-Bullet 'Mengelola data kehadiran penerima saat pembagian.'
    Add-Bullet 'Mencetak laporan (Export PDF & Excel).'

    Add-H2 '2.2 Pengguna (Mobile)'
    Add-P 'Pengguna (Ibu Hamil / Wali Balita) dapat menggunakan aplikasi mobile untuk:'
    Add-Bullet 'Login ke aplikasi.'
    Add-Bullet 'Melihat jadwal pembagian MBG.'
    Add-Bullet 'Melihat menu makanan bergizi.'
    Add-Bullet 'Melihat rincian kandungan gizi makanan.'
    Add-Bullet 'Membaca artikel edukasi gizi.'
    Add-Bullet 'Melihat dan menghitung hasil status gizi (Kalkulator Gizi Balita/Ibu Hamil).'
    Add-Bullet 'Mengubah data profil & password.'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # 3. PANDUAN WEB ADMIN
    # ----------------------------------------------------
    Add-H1 '3. Panduan Web Admin'

    Add-H2 '3.1 Login'
    Add-P 'Langkah-langkah untuk masuk ke sistem:'
    Add-Bullet 'Buka halaman login Web Admin.'
    Add-Bullet 'Masukkan Email terdaftar.'
    Add-Bullet 'Masukkan Password.'
    Add-Bullet 'Klik tombol Login.'
    Add-P 'Output: Admin/Kader Posyandu berhasil masuk ke halaman Dashboard utama.'

    Add-ImageMarker 'Tampilan Halaman Login Web Admin'

    Add-H2 '3.2 Dashboard'
    Add-P 'Halaman Dashboard menampilkan ringkasan informasi berupa:'
    Add-Bullet 'Total penerima MBG (Ibu Hamil & Balita).'
    Add-Bullet 'Total variasi menu MBG.'
    Add-Bullet 'Total jadwal distribusi.'
    Add-Bullet 'Total artikel edukasi gizi.'
    Add-Bullet 'Grafik distribusi makanan bergizi.'

    Add-ImageMarker 'Tampilan Halaman Dashboard Web Admin'

    Add-H2 '3.3 Data Penerima MBG'
    Add-P 'Langkah-langkah untuk menambahkan data penerima MBG:'
    Add-Bullet 'Pilih menu Penerima MBG pada navigasi.'
    Add-Bullet 'Klik tombol Tambah Data.'
    Add-Bullet 'Isi form: Nama, Jenis penerima (Ibu Hamil / Balita), Umur, Alamat, dan Posyandu.'
    Add-Bullet 'Klik Simpan.'
    Add-P 'Fitur yang tersedia: Tambah, Edit, Hapus, dan Cari Data.'

    Add-ImageMarker 'Halaman Kelola Data Penerima MBG (Ibu Hamil & Balita)'

    Add-H2 '3.4 Data Menu MBG'
    Add-P 'Langkah-langkah mengelola menu makanan bergizi:'
    Add-Bullet 'Pilih menu Menu MBG.'
    Add-Bullet 'Klik tombol Tambah Menu.'
    Add-Bullet 'Isi form: Nama Menu, Deskripsi, Kandungan Gizi (Kalori, Protein, Karbohidrat, Lemak, Vitamin), dan Manfaat.'
    Add-Bullet 'Upload Foto makanan.'
    Add-Bullet 'Klik Simpan.'

    Add-ImageMarker 'Form Tambah Data Menu MBG & Input Kandungan Gizi'

    Add-H2 '3.5 Jadwal MBG'
    Add-P 'Langkah-langkah mengatur jadwal pembagian makanan:'
    Add-Bullet 'Masuk ke menu Jadwal MBG.'
    Add-Bullet 'Klik Tambah Jadwal.'
    Add-Bullet 'Isi form: Tanggal, Waktu, Lokasi Posyandu, dan Menu makanan.'
    Add-Bullet 'Klik Simpan.'

    Add-ImageMarker 'Halaman Pengaturan Jadwal Pembagian MBG'

    Add-H2 '3.6 Edukasi Gizi'
    Add-P 'Langkah-langkah mempublikasikan artikel edukasi gizi:'
    Add-Bullet 'Pilih menu Edukasi.'
    Add-Bullet 'Klik Tambah Artikel.'
    Add-Bullet 'Isi form: Judul artikel, Isi Artikel (gizi ibu hamil & balita, pola makan sehat), dan Gambar.'
    Add-Bullet 'Klik Simpan.'

    Add-ImageMarker 'Halaman Kelola Artikel Edukasi Gizi'

    Add-H2 '3.7 Kehadiran Distribusi'
    Add-P 'Langkah-langkah mencatat kehadiran penyaluran makanan:'
    Add-Bullet 'Masuk menu Kehadiran.'
    Add-Bullet 'Pilih Jadwal distribusi yang sesuai.'
    Add-Bullet 'Tandai status penerima: Hadir atau Tidak Hadir.'
    Add-Bullet 'Klik Simpan.'

    Add-ImageMarker 'Halaman Pencatatan Kehadiran Distribusi MBG'

    Add-H2 '3.8 Cetak Laporan'
    Add-P 'Langkah-langkah mencetak laporan rekapitulasi MBG:'
    Add-Bullet 'Pilih menu Laporan.'
    Add-Bullet 'Pilih periode tanggal/bulan laporan.'
    Add-Bullet 'Klik Generate Laporan.'
    Add-Bullet 'Klik Export PDF atau Export Excel untuk mengunduh berkas laporan.'

    Add-ImageMarker 'Halaman Cetak & Export Laporan PDF/Excel'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # 4. PANDUAN APLIKASI MOBILE
    # ----------------------------------------------------
    Add-H1 '4. Panduan Aplikasi Mobile'

    Add-H2 '4.1 Login'
    Add-P 'Langkah-langkah login pengguna (Ibu Hamil / Wali Balita):'
    Add-Bullet 'Buka aplikasi mobile pada smartphone.'
    Add-Bullet 'Masukkan email terdaftar.'
    Add-Bullet 'Masukkan password.'
    Add-Bullet 'Tekan tombol Login.'

    Add-ImageMarker 'Tampilan Halaman Login Aplikasi Mobile'

    Add-H2 '4.2 Beranda'
    Add-P 'Halaman Beranda menyajikan informasi lengkap:'
    Add-Bullet 'Jadwal MBG terbaru.'
    Add-Bullet 'Informasi menu makanan bergizi hari ini.'
    Add-Bullet 'Artikel edukasi gizi terbaru.'
    Add-Bullet 'Ringkasan hasil status gizi.'

    Add-ImageMarker 'Tampilan Halaman Beranda Aplikasi Mobile'

    Add-H2 '4.3 Jadwal MBG'
    Add-P 'Langkah melihat jadwal pembagian makanan:'
    Add-Bullet 'Pilih menu Jadwal MBG.'
    Add-Bullet 'Sistem menampilkan rincian: Tanggal, Jam, Lokasi Posyandu, dan Status distribusi.'

    Add-ImageMarker 'Tampilan Halaman Jadwal Pembagian MBG Mobile'

    Add-H2 '4.4 Menu MBG'
    Add-P 'Pengguna dapat memilih menu Menu MBG untuk melihat detail:'
    Add-Bullet 'Nama makanan.'
    Add-Bullet 'Foto sajian.'
    Add-Bullet 'Kandungan gizi (Protein, Kalori, Fat, Vitamin).'
    Add-Bullet 'Manfaat kesehatan.'
    Add-Bullet 'Total kalori.'

    Add-ImageMarker 'Tampilan Detail Menu MBG & Kandungan Gizi Mobile'

    Add-H2 '4.5 Edukasi'
    Add-P 'Pengguna dapat memilih menu Edukasi untuk membaca artikel seputar:'
    Add-Bullet 'Kebutuhan gizi ibu hamil.'
    Add-Bullet 'Pemenuhan gizi balita.'
    Add-Bullet 'Pola makan sehat keluarga.'
    Add-Bullet 'Tips kesehatan ibu dan anak.'

    Add-ImageMarker 'Tampilan Halaman Edukasi Gizi & Kesehatan Mobile'

    Add-H2 '4.6 Status Gizi'
    Add-P 'Langkah menghitung dan memantau status gizi:'
    Add-Bullet 'Masukkan data: Berat badan (kg), Tinggi/Panjang badan (cm), dan Umur (bulan/tahun).'
    Add-Bullet 'Klik tombol Hitung.'
    Add-Bullet 'Sistem menampilkan hasil status gizi (Normal, Gizi Kurang, Gizi Lebih, dsb) sesuai standar medis yang diinput.'

    Add-ImageMarker 'Tampilan Kalkulator & Hasil Status Gizi Mobile'

    Add-H2 '4.7 Profil'
    Add-P 'Pada halaman Profil, pengguna dapat:'
    Add-Bullet 'Mengubah nama.'
    Add-Bullet 'Mengubah nomor HP.'
    Add-Bullet 'Mengubah password.'
    Add-Bullet 'Melakukan Logout.'

    Add-ImageMarker 'Tampilan Halaman Pengaturan Profil Pengguna Mobile'

    $selection.InsertBreak(7) # Page break

    # ----------------------------------------------------
    # 5. LOGOUT
    # ----------------------------------------------------
    Add-H1 '5. Logout'
    Add-P 'Langkah-langkah keluar dari aplikasi:'
    Add-Bullet 'Klik menu Profil.'
    Add-Bullet 'Pilih tombol Logout.'
    Add-Bullet 'Sistem secara otomatis mengakhiri sesi dan kembali ke halaman Login.'

    Add-ImageMarker 'Konfirmasi Logout Pengguna'

    # ----------------------------------------------------
    # 6. PESAN SISTEM
    # ----------------------------------------------------
    Add-H1 '6. Pesan Sistem'
    Add-P 'Tabel berikut menjelaskan arti dari setiap notifikasi/pesan sistem yang dapat muncul:'

    # Create Table for System Messages
    $range = $selection.Range
    $tablePesan = $doc.Tables.Add($range, 7, 2)
    $tablePesan.Rows.Alignment = 1 # Center
    $tablePesan.Borders.Enable = 1
    
    # Header Row
    $tablePesan.Cell(1, 1).Range.Text = "Pesan Sistem"
    $tablePesan.Cell(1, 1).Range.Font.Bold = 1
    $tablePesan.Cell(1, 1).Shading.BackgroundPatternColor = 0x8A3E1E # Navy BGR
    $tablePesan.Cell(1, 1).Range.Font.Color = 0xFFFFFF

    $tablePesan.Cell(1, 2).Range.Text = "Arti / Keterangan"
    $tablePesan.Cell(1, 2).Range.Font.Bold = 1
    $tablePesan.Cell(1, 2).Shading.BackgroundPatternColor = 0x8A3E1E # Navy BGR
    $tablePesan.Cell(1, 2).Range.Font.Color = 0xFFFFFF

    # Data Rows
    $dataMsg = @(
        @("Login Berhasil", "Pengguna berhasil masuk ke dalam aplikasi."),
        @("Data Berhasil Ditambahkan", "Data baru telah berhasil disimpan ke database."),
        @("Data Berhasil Diubah", "Perubahan data telah berhasil diperbarui."),
        @("Data Berhasil Dihapus", "Data terpilih telah berhasil dihapus dari sistem."),
        @("Gagal Login", "Email atau password yang dimasukkan salah."),
        @("Data Tidak Ditemukan", "Data pencarian yang Anda cari tidak tersedia di sistem.")
    )

    for ($i = 0; $i -lt $dataMsg.Count; $i++) {
        $rowIdx = $i + 2
        $tablePesan.Cell($rowIdx, 1).Range.Text = $dataMsg[$i][0]
        $tablePesan.Cell($rowIdx, 1).Range.Font.Bold = 1
        $tablePesan.Cell($rowIdx, 2).Range.Text = $dataMsg[$i][1]
    }

    $selection.SetRange($tablePesan.Range.End + 1, $tablePesan.Range.End + 1)
    $selection.TypeParagraph()

    # ----------------------------------------------------
    # 7. PENUTUP
    # ----------------------------------------------------
    Add-H1 '7. Penutup'
    Add-P 'Manual Book ini disusun sebagai panduan penggunaan Sistem Informasi Pencatatan dan Edukasi Gizi untuk Mendukung Program Makan Bergizi Gratis (MBG) pada Ibu Hamil dan Balita. Diharapkan pengguna dapat mengoperasikan aplikasi dengan mudah sehingga proses pencatatan, pemantauan, pelaporan, dan penyampaian edukasi gizi dapat berjalan lebih efektif dan efisien.'

    Add-NoteBox 'KONTAK BANTUAN POSYANDU' 'Untuk kendala teknis atau pengaduan sistem informasi gizi Posyandu, silakan hubungi Tim Pengembang / Administrator Sistem melalui email: support@posyandu-mbg.go.id.'

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
    Write-Output "SUCCESS_NO_STUNTING_SAVED"
} finally {
    $word.Quit()
}
