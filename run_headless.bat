@echo off
REM ========================================
REM   Run Full Regression - HEADLESS MODE
REM   (Browser tidak terlihat, lebih cepat)
REM ========================================

set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

echo ========================================
echo    KATALON HEADLESS MODE
echo ========================================
echo Running Full Regression Test Suite...
echo Browser: Chrome (Headless - Tanpa UI)
echo.

%KATALON_PATH% -noSplash -runMode=console -projectPath=%PROJECT_PATH% -testSuitePath="Test Suites/TS_Full_Regression" -executionProfile="default" -browserType="Chrome (headless)"

echo.
echo ========================================
echo Test execution completed!
echo Check report in: TUBES-KATALON/Reports/
echo ========================================
pause
