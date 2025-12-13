@echo off
echo ==========================================
echo    RUNNING KATALON FULL REGRESSION SUITE
echo ==========================================

set KATALON_PATH="C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
set PROJECT_PATH="c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON"

echo Starting Full Regression Test Suite...
%KATALON_PATH% -noSplash -runMode=console -projectPath=%PROJECT_PATH% -retry=0 -testSuitePath="Test Suites/TS_Regression_Full" -executionProfile="default" -browserType="Chrome"

echo.
echo Test execution completed!
pause