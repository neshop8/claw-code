# 🚀 Setup Claw Code pour GitHub - Script PowerShell

Write-Host "==========================================" -ForegroundColor Green
Write-Host "Claw Code - GitHub Setup" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

# Vérifier git
try {
    $gitVersion = git --version
    Write-Host "✅ Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git not found. Please install Git first." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Initialiser le repo
Write-Host "Initializing Git repository..." -ForegroundColor Cyan
git init
git add .
git commit -m "Initial commit: Claw Code with Python & Rust workspaces"

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "📍 NEXT STEPS:" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""

Write-Host "1. Create a repo on GitHub:" -ForegroundColor Yellow
Write-Host "   https://github.com/new" -ForegroundColor White
Write-Host ""

Write-Host "2. Copy the repo URL (HTTPS or SSH)" -ForegroundColor Yellow
Write-Host ""

Write-Host "3. Run these commands:" -ForegroundColor Yellow
Write-Host ""
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/claw-code.git" -ForegroundColor White
Write-Host "   git branch -M main" -ForegroundColor White
Write-Host "   git push -u origin main" -ForegroundColor White
Write-Host ""

Write-Host "4. Check GitHub Actions:" -ForegroundColor Yellow
Write-Host "   https://github.com/YOUR_USERNAME/claw-code/actions" -ForegroundColor White
Write-Host ""

Write-Host "5. Download releases or use Docker!" -ForegroundColor Yellow
Write-Host ""

Write-Host "==========================================" -ForegroundColor Green
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
