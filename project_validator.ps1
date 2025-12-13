# ========================================
#    KATALON PROJECT CLEANUP & VALIDATOR
# ========================================

$PROJECT_PATH = "c:\KULIAH\SEMESTER 5\SQA\TUBES KATALON\TUBES-KATALON"

function Clean-KatalonCache {
    Write-Host "========================================"
    Write-Host "   CLEANING KATALON CACHE & TEMP FILES" -ForegroundColor Yellow
    Write-Host "========================================"
    
    # Remove temp files and cache
    $tempPaths = @(
        "$PROJECT_PATH\bin",
        "$PROJECT_PATH\.cache",
        "$PROJECT_PATH\Libs\TempTestCase*.groovy",
        "$PROJECT_PATH\Libs\TempTestSuite*.groovy"
    )
    
    foreach($path in $tempPaths) {
        if (Test-Path $path) {
            Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "Cleaned: $path" -ForegroundColor Green
        }
    }
    
    Write-Host "Cache cleanup completed!" -ForegroundColor Green
}

function Validate-TestCases {
    Write-Host "========================================"
    Write-Host "   VALIDATING TEST CASE FILES" -ForegroundColor Cyan
    Write-Host "========================================"
    
    $testCases = @(
        "Test Cases\1_Authentication\TC_Login_Invalid.groovy",
        "Test Cases\1_Authentication\TC_Login_Valid.groovy", 
        "Test Cases\1_Authentication\TC_Smoke_Login_Admin.groovy",
        "Test Cases\2_Admin_Panel\TC_Create_Tournament.groovy",
        "Test Cases\2_Admin_Panel\TC_Generate_Draw.groovy",
        "Test Cases\3_Core_Tabulation\TC_Submit_Ballot_Success.groovy",
        "Test Cases\4_Public_View\TC_View_Articles.groovy",
        "Test Cases\_Common_Utilities\Login_As_Admin.groovy"
    )
    
    foreach($tc in $testCases) {
        $fullPath = Join-Path $PROJECT_PATH $tc
        if (Test-Path $fullPath) {
            $content = Get-Content $fullPath -Raw
            if ($content -match "findTestObject|G_URL_Web|return null" -and $content.Length -lt 200) {
                Write-Host "❌ PROBLEM: $tc (contains old code or too short)" -ForegroundColor Red
            } else {
                Write-Host "✅ VALID: $tc" -ForegroundColor Green  
            }
        } else {
            Write-Host "❌ MISSING: $tc" -ForegroundColor Red
        }
    }
}

function Show-Commands {
    Write-Host ""
    Write-Host "KATALON PROJECT MANAGEMENT COMMANDS:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Clean-KatalonCache        # Remove temp files & cache"
    Write-Host "Validate-TestCases        # Check test case files"  
    Write-Host "Run-SmokeTest            # Execute smoke tests"
    Write-Host "Run-FullRegression       # Execute all tests"
    Write-Host ""
}

# Display available commands
Show-Commands