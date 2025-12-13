# 🔧 Katalon Troubleshooting Guide

## ❌ Problem: Test Stuck di "Start checking license task"

### 🎯 Penyebab:
1. **Project path salah** - Path harus mengarah ke folder project Katalon (yang ada file `.project`), bukan folder root
2. **License validation timeout** - Katalon mencoba kontak server untuk validasi license
3. **Network issues** - Koneksi internet lambat atau terblokir firewall

### ✅ Solusi:

#### 1️⃣ Pastikan Project Path Benar

**❌ SALAH:**
```batch
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON"
```

**✅ BENAR:**
```batch
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"
```

Folder yang benar adalah yang **BERISI FILE `.project`**!

#### 2️⃣ Gunakan Batch File yang Sudah Diperbaiki

Gunakan file ini yang sudah fix:
```powershell
.\run_test_quick.bat
```

Atau PowerShell version:
```powershell
.\run_katalon.ps1
```

#### 3️⃣ Tambahkan Parameter Anti-Stuck

Jika buat command sendiri, pastikan ada parameter ini:
```batch
-consoleLog --config -webui.autoUpdateDrivers=true
```

#### 4️⃣ Kalau Masih Stuck, Gunakan Timeout

Buat batch file dengan timeout:
```batch
@echo off
set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

start /B "" %KATALON_PATH% -noSplash -runMode=console -consoleLog -projectPath=%PROJECT_PATH% -testSuitePath="Test Suites/TS_Full_Regression" -executionProfile="default" -browserType="Chrome"

timeout /t 30 /nobreak
echo.
echo Jika masih stuck, tekan Ctrl+C untuk stop
pause
```

---

## ❌ Problem: "Cannot find project"

### ✅ Solusi:

1. **Cek file `.project` ada di folder:**
   ```powershell
   dir "c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON\.project"
   ```

2. **Pastikan path menggunakan quotes karena ada spasi:**
   ```batch
   -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"
   ```

---

## ❌ Problem: "Test Suite not found"

### ✅ Solusi:

1. **Cek nama test suite case-sensitive:**
   ```batch
   -testSuitePath="Test Suites/TS_Full_Regression"
   ```
   Bukan: `TS_Regression_Full` atau `ts_full_regression`

2. **Cek file ada:**
   ```powershell
   dir "c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON\Test Suites\TS_Full_Regression.ts"
   ```

---

## ❌ Problem: Chrome driver error

### ✅ Solusi:

1. **Update Chrome ke versi terbaru**

2. **Atau gunakan Headless mode:**
   ```batch
   -browserType="Chrome (headless)"
   ```

3. **Atau gunakan Firefox:**
   ```batch
   -browserType="Firefox"
   ```

---

## ❌ Problem: Test di-skip semua

### ✅ Solusi:

Sudah diperbaiki! File `.tc` sudah di-update dengan struktur yang benar.

Jika masih skip:
1. Cek file `.groovy` ada di folder `Scripts/`
2. Cek file `.tc` tidak kosong
3. Re-open project di Katalon Studio dan refresh

---

## ❌ Problem: Katalon executable not found

### ✅ Solusi:

1. **Cek versi Katalon yang terinstall:**
   ```powershell
   dir "C:\Users\HP\.katalon\packages\"
   ```

2. **Update KATALON_PATH sesuai versi:**
   ```batch
   set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
   ```
   
   Ganti `10.4.2` dengan versi yang ada di sistem Anda

---

## ❌ Problem: Permission denied / Access denied

### ✅ Solusi:

1. **Run sebagai Administrator:**
   - Right-click batch file
   - Pilih "Run as Administrator"

2. **Atau set execution policy di PowerShell:**
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

---

## ⚡ Quick Fixes Checklist

Sebelum jalankan test, pastikan:

- [ ] Project path benar (ada file `.project`)
- [ ] Test suite name benar (case-sensitive)
- [ ] Chrome terinstall dan updated
- [ ] Internet connection aktif
- [ ] Katalon executable ada dan version match
- [ ] No Katalon Studio GUI yang terbuka
- [ ] Disk space cukup untuk report

---

## 🆘 Emergency Solution

Kalau semua gagal, gunakan ini:

### Option 1: Direct Command (Copy-paste ke PowerShell)

```powershell
& "C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" -noSplash -runMode=console -consoleLog -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" -testSuitePath="Test Suites/TS_Full_Regression" -executionProfile="default" -browserType="Chrome (headless)"
```

### Option 2: Test 1 Case Dulu

Test dengan 1 test case dulu untuk validasi setup:

```powershell
& "C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe" -noSplash -runMode=console -consoleLog -projectPath="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON" -testCasePath="Test Cases/1_Authentication/TC_Login_Invalid" -executionProfile="default" -browserType="Chrome (headless)"
```

Jika 1 test case berhasil, berarti setup sudah OK!

---

## 📞 Masih Bermasalah?

1. Check log file di:
   ```
   TUBES-KATALON\.metadata\.log
   ```

2. Check console output dengan teliti - biasanya ada error message yang jelas

3. Coba run di Katalon Studio GUI dulu untuk validasi project structure

---

## ✅ Recommended Workflow

1. **Pertama kali:** Test dengan PowerShell script
   ```powershell
   .\run_katalon.ps1
   ```

2. **Untuk production:** Gunakan headless mode
   ```powershell
   .\run_headless.bat
   ```

3. **Untuk debugging:** Gunakan browser visible mode
   ```powershell
   .\run_test_quick.bat
   ```

---

**Updated:** 2025-12-14  
**All batch files have been fixed with correct project path!**
