# 🧪 TUBES KATALON - Automated Testing Project

## 📁 Struktur Project

```
TUBES KATALON/
├── TUBES-KATALON/              # Project Katalon
│   ├── Test Cases/             # Semua test cases
│   ├── Test Suites/           # Test suite collections
│   ├── Profiles/              # Execution profiles (default, staging, etc)
│   ├── Object Repository/     # Web elements
│   └── Scripts/               # Groovy scripts
│
├── run_full_regression.bat    # Jalankan SEMUA test
├── run_smoke_test.bat         # Jalankan smoke test saja
├── run_single_test.bat        # Jalankan 1 test case
├── run_headless.bat           # Jalankan tanpa tampilan browser
├── test_menu.bat              # Menu interaktif ⭐ RECOMMENDED
└── KATALON_CLI_GUIDE.md       # Panduan lengkap CLI
```

---

## 🚀 Quick Start - Jalankan via Terminal

### ⭐ Cara Paling Mudah: Gunakan Menu Interaktif

```powershell
.\test_menu.bat
```

Menu akan muncul dengan opsi:
1. Run FULL Regression (All Tests)
2. Run SMOKE Test Only
3. Run Single Test Case
4. Run HEADLESS Mode (faster)
5. View Last Report

---

## 🎯 Cara Jalankan Test

### 1️⃣ Jalankan SEMUA Test Case Sekaligus

```powershell
.\run_full_regression.bat
```

Ini akan menjalankan:
- ✅ TC_Login_Invalid
- ✅ TC_Login_Valid
- ✅ TC_Smoke_Login_Admin
- ✅ TC_Create_Tournament
- ✅ TC_Generate_Draw
- ✅ TC_Submit_Ballot_Success
- ✅ TC_View_Articles

### 2️⃣ Jalankan Smoke Test Saja

```powershell
.\run_smoke_test.bat
```

### 3️⃣ Jalankan 1 Test Case Tertentu

```powershell
.\run_single_test.bat "1_Authentication/TC_Login_Invalid"
```

Contoh lain:
```powershell
.\run_single_test.bat "2_Admin_Panel/TC_Create_Tournament"
.\run_single_test.bat "3_Core_Tabulation/TC_Submit_Ballot_Success"
```

### 4️⃣ Jalankan Mode Headless (Lebih Cepat, Tanpa UI Browser)

```powershell
.\run_headless.bat
```

---

## 📊 Melihat Report

Setelah test selesai:

```powershell
cd "TUBES-KATALON\Reports"
```

Cari folder dengan timestamp terbaru, lalu buka:
```
report.html
```

Atau gunakan menu option 5 di `test_menu.bat` untuk otomatis buka report terakhir.

---

## 🔧 Konfigurasi

### Global Variables (Default Profile)

Edit: `TUBES-KATALON/Profiles/default.glbl`

- `G_URL_Web`: http://edsupi.my.id
- `G_Admin_Email`: admineds123@gmail.com
- `G_Admin_Pass`: edsupi123#%
- `G_Juri_Email`: juri_test@upi.edu
- `G_Timeout`: 10

### Ubah URL Testing Tanpa Edit Code

1. Buka: `TUBES-KATALON/Profiles/default.glbl`
2. Edit value `G_URL_Web`
3. Semua test akan pakai URL baru!

---

## 🐛 Troubleshooting

### ❌ Test ter-skip semua
**Penyebab:** File `.tc` tidak terisi dengan benar
**Solusi:** Sudah diperbaiki! File `.tc` sudah di-update

### ❌ Error saat pull di Katalon Studio
**Solusi:** Tidak perlu buka Katalon Studio! Langsung jalankan via batch file

### ❌ Browser tidak muncul
**Opsi 1:** Install/Update Chrome browser
**Opsi 2:** Pakai headless mode: `.\run_headless.bat`

### ❌ "katalonc.exe not found"
**Solusi:** Update path di batch file sesuai versi Katalon Anda:
```batch
set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
```

---

## 📝 Test Cases yang Tersedia

### 1️⃣ Authentication
- `TC_Login_Invalid` - Test login dengan credentials salah
- `TC_Login_Valid` - Test login dengan credentials benar
- `TC_Smoke_Login_Admin` - Smoke test untuk admin login

### 2️⃣ Admin Panel
- `TC_Create_Tournament` - Test pembuatan tournament
- `TC_Generate_Draw` - Test generate draw tournament

### 3️⃣ Core Tabulation
- `TC_Submit_Ballot_Success` - Test submit ballot berhasil

### 4️⃣ Public View
- `TC_View_Articles` - Test view artikel public

---

## ⚡ Advanced: Direct CLI Command

Jika ingin full control, gunakan command langsung:

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testSuitePath="Test Suites/TS_Full_Regression" `
  -executionProfile="default" `
  -browserType="Chrome"
```

Baca `KATALON_CLI_GUIDE.md` untuk parameter lengkap!

---

## 🎓 Tips & Best Practices

1. **Selalu jalankan via CLI** - Lebih stabil dan bisa otomatis
2. **Gunakan headless mode** untuk test cepat
3. **Check report** setelah test selesai
4. **Update Global Variables** jika environment berubah
5. **Commit report** ke Git untuk tracking

---

## 🤝 Kontributor

- A BINTANG
- Universitas Pendidikan Indonesia (UPI)
- Project: TUBES-KATALON
- Website: http://edsupi.my.id

---

## 📞 Bantuan

Jika ada masalah:
1. Cek `KATALON_CLI_GUIDE.md` untuk detail lengkap
2. Pastikan Chrome terinstall
3. Pastikan Katalon Runtime Engine terinstall
4. Cek path di batch file sesuai dengan environment Anda

---

**Happy Testing! 🚀**
