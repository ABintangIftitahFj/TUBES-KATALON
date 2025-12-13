@echo off
REM ========================================
REM   KATALON QUICK TEST - NO STUCK!
REM   Version with proper error handling
REM ========================================

set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

REM Check if Katalon exists
if not exist %KATALON_PATH% (
    echo ERROR: Katalon tidak ditemukan di %KATALON_PATH%
    echo.
    echo Solusi:
    echo 1. Cek apakah Katalon terinstall
    echo 2. Update KATALON_PATH di batch file ini
    pause
    exit /b 1
)

REM Check if project exists
if not exist %PROJECT_PATH% (
    echo ERROR: Project tidak ditemukan di %PROJECT_PATH%
    pause
    exit /b 1
)

echo ==========================================
echo    KATALON QUICK TEST RUNNER
echo ==========================================
echo.
echo Project: %PROJECT_PATH%
echo Browser: Chrome
echo Mode: Console (No GUI)
echo.
echo Starting test execution...
echo.

REM Run dengan parameter yang tidak stuck
%KATALON_PATH% ^
  -noSplash ^
  -runMode=console ^
  -consoleLog ^
  -projectPath=%PROJECT_PATH% ^
  -testSuitePath="Test Suites/TS_Full_Regression" ^
  -executionProfile="default" ^
  -browserType="Chrome" ^
  --config -webui.autoUpdateDrivers=true

echo.
echo ==========================================
if %ERRORLEVEL% EQU 0 (
    echo STATUS: Test completed successfully!
) else (
    echo STATUS: Test completed with errors. Check logs above.
)
echo ==========================================
echo.
pause
