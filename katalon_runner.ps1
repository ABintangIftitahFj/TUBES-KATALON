# ========================================
#    KATALON STUDIO POWERSHELL RUNNER
# ========================================

$KATALON_PATH = "C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
$PROJECT_PATH = "c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

function Run-SmokeTest {
    Write-Host "========================================"
    Write-Host "   RUNNING KATALON SMOKE TEST SUITE   " -ForegroundColor Green
    Write-Host "========================================"
    
    & $KATALON_PATH -noSplash -runMode=console -projectPath=$PROJECT_PATH -retry=0 -testSuitePath="Test Suites/TS_Smoke_Test" -executionProfile="default" -browserType="Chrome"
}

function Run-FullRegression {
    Write-Host "========================================="
    Write-Host "   RUNNING FULL REGRESSION TEST SUITE  " -ForegroundColor Green  
    Write-Host "========================================="
    
    & $KATALON_PATH -noSplash -runMode=console -projectPath=$PROJECT_PATH -retry=0 -testSuitePath="Test Suites/TS_Regression_Full" -executionProfile="default" -browserType="Chrome"
}

function Run-SingleTest {
    param([string]$TestCasePath)
    
    Write-Host "========================================"
    Write-Host "   RUNNING SINGLE TEST CASE: $TestCasePath" -ForegroundColor Yellow
    Write-Host "========================================"
    
    & $KATALON_PATH -noSplash -runMode=console -projectPath=$PROJECT_PATH -retry=0 -testCasePath=$TestCasePath -executionProfile="default" -browserType="Chrome"
}

# Display available commands
Write-Host ""
Write-Host "KATALON CLI RUNNER - Available Commands:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Run-SmokeTest        # Run smoke test suite (4 tests)"
Write-Host "2. Run-FullRegression   # Run full regression (7 tests)"
Write-Host "3. Run-SingleTest 'Test Cases/path/to/test'  # Run single test"
Write-Host ""
Write-Host "Examples:"
Write-Host "Run-SmokeTest"
Write-Host "Run-FullRegression"
Write-Host "Run-SingleTest 'Test Cases/1_Authentication/TC_Login_Invalid'"
Write-Host ""