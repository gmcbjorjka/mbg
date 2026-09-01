<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kode OTP Verifikasi</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            color: #333333;
        }
        .container {
            max-width: 540px;
            margin: 30px auto;
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        .header {
            background: linear-gradient(135deg, #10B981, #059669);
            color: #ffffff;
            text-align: center;
            padding: 30px 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }
        .content {
            padding: 30px 25px;
            line-height: 1.6;
        }
        .greeting {
            font-size: 16px;
            margin-bottom: 15px;
        }
        .otp-box {
            background-color: #f0fdf4;
            border: 2px dashed #10B981;
            border-radius: 10px;
            text-align: center;
            padding: 20px;
            margin: 25px 0;
        }
        .otp-code {
            font-size: 36px;
            font-weight: 800;
            letter-spacing: 8px;
            color: #047857;
            margin: 0;
        }
        .otp-label {
            font-size: 13px;
            color: #6b7280;
            margin-top: 5px;
        }
        .notice {
            background-color: #fffbeb;
            border-left: 4px solid #f59e0b;
            padding: 12px 15px;
            font-size: 13px;
            color: #92400e;
            border-radius: 0 6px 6px 0;
            margin-bottom: 20px;
        }
        .footer {
            background-color: #f9fafb;
            text-align: center;
            padding: 20px;
            font-size: 12px;
            color: #9ca3af;
            border-top: 1px solid #e5e7eb;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>MBG (Makan Bergizi Gratis)</h1>
        </div>
        <div class="content">
            <p class="greeting">Halo,</p>
            @if ($type === 'reset_password')
                <p>Kami menerima permintaan untuk mengatur ulang kata sandi akun Anda. Gunakan kode verifikasi (OTP) berikut untuk melanjutkan proses reset kata sandi:</p>
            @else
                <p>Terima kasih telah melakukan pendaftaran di aplikasi MBG. Gunakan kode verifikasi (OTP) berikut untuk menyelesaikan proses registrasi akun Anda:</p>
            @endif

            <div class="otp-box">
                <div class="otp-code">{{ $otp }}</div>
                <div class="otp-label">Kode OTP Verifikasi</div>
            </div>

            <div class="notice">
                <strong>Perhatian:</strong> Kode ini berlaku selama <strong>{{ $expiresInMinutes }} menit</strong>. Jangan berikan kode ini kepada siapapun demi keamanan akun Anda.
            </div>

            <p style="font-size: 13px; color: #6b7280;">Jika Anda tidak merasa melakukan permintaan ini, silakan abaikan email ini.</p>
        </div>
        <div class="footer">
            &copy; {{ date('Y') }} MBG App. Hak Cipta Dilindungi.
        </div>
    </div>
</body>
</html>
