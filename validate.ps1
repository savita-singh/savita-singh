$passed = 0
$failed = 0

function Check {
    param($file, $text, $name)
    if (Test-Path $file) {
        if ((Get-Content $file -Raw) -match $text) {
            Write-Host "[OK] $name" -ForegroundColor Green
            $script:passed++
        } else {
            Write-Host "[NO] $name" -ForegroundColor Red
            $script:failed++
        }
    } else {
        Write-Host "[NO] $name (missing file)" -ForegroundColor Red
        $script:failed++
    }
}

Write-Host "`n=== HOMEPAGE ===" -ForegroundColor Cyan
Check "index.html" "Building products" "Main heading"
Check "index.html" "10\+ years" "Stats section"
Check "index.html" "savita-headshot" "Profile image"
Check "index.html" "HOW I THINK" "How I Think"
Check "index.html" "FEATURED WORK" "Case studies"
Check "index.html" "ARGMAC" "Argmac"
Check "index.html" "PROCESS" "Process"
Check "index.html" "COMPANIES" "Companies"
Check "index.html" "CURRENTLY" "Currently"

Write-Host "`n=== ABOUT ===" -ForegroundColor Cyan
Check "about.html" "Education" "Education"
Check "about.html" "Kind words" "Testimonials"
Check "about.html" "MBA" "MBA info"

Write-Host "`n=== EXPERIENCE ===" -ForegroundColor Cyan
Check "experience.html" "data-filter" "Filters"
Check "experience.html" "Product & Brand" "Jobs"
Check "experience.html" "filterBtns" "JS"

Write-Host "`n=== SKILLS ===" -ForegroundColor Cyan
Check "skills.html" "skill-bar" "Skill bars"
Check "skills.html" "TOOLS I WORK" "Tools"

Write-Host "`n=== CONTACT ===" -ForegroundColor Cyan
Check "contact.html" "contact-form" "Form"
Check "contact.html" 'id="name"' "Fields"

Write-Host "`n=== COLORS ===" -ForegroundColor Cyan
Check "styles.css" "#005035" "Green"
Check "styles.css" "#A49665" "Gold"

Write-Host "`n=== FILES ===" -ForegroundColor Cyan
if (Test-Path "assets/savita-headshot.png") {
    Write-Host "[OK] Profile image file" -ForegroundColor Green
    $passed++
} else {
    Write-Host "[NO] Profile image file" -ForegroundColor Red
    $failed++
}

$total = $passed + $failed
$pct = [math]::Round(($passed / $total) * 100, 1)
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Total: $total | Passed: $passed | Failed: $failed"
Write-Host "Success: $pct%" -ForegroundColor $(if ($pct -ge 95) {"Green"} else {"Yellow"})
Write-Host "========================================`n" -ForegroundColor Cyan
