@echo off
REM ========================================
REM   Quick Test Menu
REM ========================================

:MENU
cls
echo ========================================
echo    KATALON TEST RUNNER MENU
echo ========================================
echo.
echo [1] Run FULL Regression (All Tests)
echo [2] Run SMOKE Test Only  
echo [3] Run Single Test Case (input manual)
echo [4] Run HEADLESS Mode (faster, no UI)
echo [5] View Last Report
echo [0] Exit
echo.
echo ========================================
set /p choice="Pilih opsi (0-5): "

if "%choice%"=="1" goto FULL_REGRESSION
if "%choice%"=="2" goto SMOKE_TEST
if "%choice%"=="3" goto SINGLE_TEST
if "%choice%"=="4" goto HEADLESS
if "%choice%"=="5" goto VIEW_REPORT
if "%choice%"=="0" goto END
goto MENU

:FULL_REGRESSION
cls
echo Running Full Regression Test Suite...
call run_full_regression.bat
goto MENU

:SMOKE_TEST
cls
echo Running Smoke Test Suite...
call run_smoke_test.bat
goto MENU

:SINGLE_TEST
cls
echo.
echo Contoh input:
echo   1_Authentication/TC_Login_Invalid
echo   2_Admin_Panel/TC_Create_Tournament
echo.
set /p testcase="Masukkan path test case: "
call run_single_test.bat "%testcase%"
goto MENU

:HEADLESS
cls
echo Running in Headless Mode...
call run_headless.bat
goto MENU

:VIEW_REPORT
cls
echo Opening latest report...
cd "TUBES-KATALON\Reports"
for /f "delims=" %%i in ('dir /b /od /ad') do set LATEST=%%i
start "" "%LATEST%\report.html"
cd ..\..
pause
goto MENU

:END
echo.
echo Terima kasih! Sampai jumpa.
timeout /t 2
exit
