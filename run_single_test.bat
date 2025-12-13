@echo off
REM ========================================
REM   Run Single Test Case via CLI
REM ========================================

if "%~1"=="" (
    echo ERROR: Test case path tidak diberikan!
    echo.
    echo Cara pakai:
    echo   run_single_test.bat "1_Authentication/TC_Login_Invalid"
    echo   run_single_test.bat "2_Admin_Panel/TC_Create_Tournament"
    echo.
    pause
    exit /b 1
)

set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"
set TEST_CASE=%~1

echo ========================================
echo    RUNNING SINGLE TEST CASE
echo ========================================
echo Test Case: %TEST_CASE%
echo.

%KATALON_PATH% -noSplash -runMode=console -projectPath=%PROJECT_PATH% -testCasePath="Test Cases/%TEST_CASE%" -executionProfile="default" -browserType="Chrome"

echo.
echo ========================================
echo Test execution completed!
echo ========================================
pause
