# ========================================
# Katalon Test Runner - PowerShell Version
# No GUI, No Stuck, Better Error Handling
# ========================================

$KATALON_PATH = "C:\Users\HP\.katalon\packages\KSE-10.4.2\katalonc.exe"
$PROJECT_PATH = "c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"
$TEST_SUITE = "Test Suites/TS_Full_Regression"

# Validasi Katalon executable
if (-not (Test-Path $KATALON_PATH)) {
    Write-Host "ERROR: Katalon tidak ditemukan!" -ForegroundColor Red
    Write-Host "Path: $KATALON_PATH" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Solusi:" -ForegroundColor Cyan
    Write-Host "1. Install Katalon Studio/Runtime Engine" -ForegroundColor White
    Write-Host "2. Atau update path di script ini sesuai versi Katalon Anda" -ForegroundColor White
    Read-Host "Press Enter to exit"
    exit 1
}

# Validasi project path
if (-not (Test-Path $PROJECT_PATH)) {
    Write-Host "ERROR: Project tidak ditemukan!" -ForegroundColor Red
    Write-Host "Path: $PROJECT_PATH" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Display info
Write-Host "==========================================" -ForegroundColor Green
Write-Host "   KATALON TEST EXECUTION" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Project    : " -NoNewline; Write-Host $PROJECT_PATH -ForegroundColor Cyan
Write-Host "Test Suite : " -NoNewline; Write-Host $TEST_SUITE -ForegroundColor Cyan
Write-Host "Browser    : " -NoNewline; Write-Host "Chrome" -ForegroundColor Cyan
Write-Host ""
Write-Host "Starting test execution..." -ForegroundColor Yellow
Write-Host ""

# Timestamp start
$startTime = Get-Date
Write-Host "Start Time: $($startTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
Write-Host ""

# Execute Katalon
try {
    & $KATALON_PATH `
        -noSplash `
        -runMode=console `
        -consoleLog `
        -projectPath="$PROJECT_PATH" `
        -testSuitePath="$TEST_SUITE" `
        -executionProfile="default" `
        -browserType="Chrome" `
        --config -webui.autoUpdateDrivers=true
    
    $exitCode = $LASTEXITCODE
    
    # Timestamp end
    $endTime = Get-Date
    $duration = $endTime - $startTime
    
    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "   TEST EXECUTION SUMMARY" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Green
    Write-Host "End Time  : $($endTime.ToString('yyyy-MM-dd HH:mm:ss'))" -ForegroundColor Gray
    Write-Host "Duration  : $($duration.ToString('hh\:mm\:ss'))" -ForegroundColor Gray
    
    if ($exitCode -eq 0) {
        Write-Host "Status    : " -NoNewline
        Write-Host "SUCCESS ✓" -ForegroundColor Green
    } else {
        Write-Host "Status    : " -NoNewline
        Write-Host "FAILED ✗" -ForegroundColor Red
        Write-Host "Exit Code : $exitCode" -ForegroundColor Yellow
    }
    
    Write-Host "==========================================" -ForegroundColor Green
    
} catch {
    Write-Host ""
    Write-Host "ERROR: Gagal menjalankan Katalon!" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to view report or close this window..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Try to open latest report
$reportsPath = Join-Path $PROJECT_PATH "Reports"
if (Test-Path $reportsPath) {
    $latestReport = Get-ChildItem $reportsPath -Directory | 
                    Sort-Object LastWriteTime -Descending | 
                    Select-Object -First 1
    
    if ($latestReport) {
        $reportFile = Join-Path $latestReport.FullName "report.html"
        if (Test-Path $reportFile) {
            Write-Host "Opening report..." -ForegroundColor Cyan
            Start-Process $reportFile
        }
    }
}
