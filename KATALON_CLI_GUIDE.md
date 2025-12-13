# 🚀 Katalon CLI - Panduan Running via Terminal

## 📌 Lokasi Katalon Command Line

```powershell
C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe
```

---

## 🎯 Command Dasar

### 1️⃣ Jalankan FULL Test Suite (SEMUA Test Case)

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testSuitePath="Test Suites/TS_Full_Regression" `
  -executionProfile="default" `
  -browserType="Chrome"
```

### 2️⃣ Jalankan 1 Test Case Saja

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testCasePath="Test Cases/1_Authentication/TC_Login_Invalid" `
  -executionProfile="default" `
  -browserType="Chrome"
```

### 3️⃣ Jalankan dengan Headless Browser (Tanpa Tampilan)

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testSuitePath="Test Suites/TS_Full_Regression" `
  -executionProfile="default" `
  -browserType="Chrome (headless)"
```

### 4️⃣ Generate Report ke Folder Tertentu

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testSuitePath="Test Suites/TS_Full_Regression" `
  -executionProfile="default" `
  -browserType="Chrome" `
  -reportFolder="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\Reports" `
  -reportFileName="TestReport_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
```

---

## 🔧 Parameter Lengkap

| Parameter | Deskripsi | Contoh |
|-----------|-----------|--------|
| `-noSplash` | Tidak tampilkan splash screen | - |
| `-runMode=console` | Mode console (tanpa GUI) | - |
| `-projectPath` | Path ke project Katalon | `"c:\path\to\project"` |
| `-testSuitePath` | Path ke test suite | `"Test Suites/TS_Full_Regression"` |
| `-testCasePath` | Path ke 1 test case | `"Test Cases/TC_Login"` |
| `-executionProfile` | Profile yang digunakan | `"default"` atau `"staging"` |
| `-browserType` | Jenis browser | `"Chrome"`, `"Firefox"`, `"Chrome (headless)"` |
| `-reportFolder` | Folder output report | `"c:\Reports"` |
| `-reportFileName` | Nama file report | `"MyReport"` |
| `-retry` | Berapa kali retry jika gagal | `0`, `1`, `2` |
| `-retryFailedTestCases` | Retry hanya test yang gagal | `true` atau `false` |

---

## 📦 Browser Options

- `Chrome`
- `Firefox`
- `Edge Chromium`
- `Chrome (headless)` - Tanpa tampilan UI
- `Firefox (headless)` - Tanpa tampilan UI

---

## 🎨 Contoh Batch Files yang Bisa Dibuat

### `run_single_test.bat`
```batch
@echo off
set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

echo Running Single Test Case: %1

%KATALON_PATH% -noSplash -runMode=console -projectPath=%PROJECT_PATH% -testCasePath="Test Cases/%1" -executionProfile="default" -browserType="Chrome"

pause
```

**Cara pakai:**
```powershell
.\run_single_test.bat "1_Authentication/TC_Login_Invalid"
```

### `run_headless.bat`
```batch
@echo off
set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

echo Running Full Regression (Headless Mode)...

%KATALON_PATH% -noSplash -runMode=console -projectPath=%PROJECT_PATH% -testSuitePath="Test Suites/TS_Full_Regression" -executionProfile="default" -browserType="Chrome (headless)"

pause
```

---

## 🐛 Troubleshooting

### Error: "Cannot find project"
**Solusi:** Pastikan path menggunakan quotes jika ada spasi
```powershell
-projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"
```

### Error: "Browser tidak bisa dibuka"
**Solusi:** Install Chrome Driver atau coba headless mode
```powershell
-browserType="Chrome (headless)"
```

### Error: "Test Suite not found"
**Solusi:** Cek nama test suite case-sensitive
```powershell
-testSuitePath="Test Suites/TS_Full_Regression"
```

---

## 📊 Melihat Report

Setelah test selesai, report tersimpan di:
```
TUBES-KATALON/Reports/
```

Buka file `report.html` di browser untuk melihat hasilnya.

---

## ⚡ Tips Cepat

1. **Jalankan tanpa buka Katalon Studio:**
   - Langsung jalankan batch file `.bat`
   - Atau langsung via PowerShell/CMD

2. **Parallel execution:** Bisa jalankan multiple test suite bersamaan

3. **CI/CD Integration:** Command ini bisa dipake di Jenkins, GitLab CI, GitHub Actions

4. **Schedule via Task Scheduler:** Bisa jadwalkan test otomatis tiap hari

---

## 📝 Update Global Variables dari CLI

Jika ingin override global variable saat runtime:

```powershell
"C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" `
  -noSplash `
  -runMode=console `
  -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" `
  -testSuitePath="Test Suites/TS_Full_Regression" `
  -executionProfile="default" `
  -browserType="Chrome" `
  -g_URL_Web="http://edsupi.my.id" `
  -g_Admin_Email="test@example.com"
```

---

## ✅ Checklist Sebelum Run

- [ ] Katalon installed di `C:\Users\HP\.katalon\packages\KSE-10.4.2\`
- [ ] Chrome browser terinstall
- [ ] Project path benar
- [ ] Test Suite/Test Case name benar (case-sensitive)
- [ ] Global variables sudah di-set

---

**🎯 KESIMPULAN:**
Anda TIDAK PERLU buka Katalon Studio GUI sama sekali! Cukup jalankan via batch file atau PowerShell command di atas! 🚀
