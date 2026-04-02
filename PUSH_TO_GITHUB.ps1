# 🚀 PUSH A GITHUB EN 3 ETAPES

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "🚀 CLAW CODE - PUSH GITHUB AUTOMATISÉ" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Étape 1: Créer le repo
Write-Host "ÉTAPE 1️⃣: Crée ton repo GitHub" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Va sur: https://github.com/new" -ForegroundColor Cyan
Write-Host "2. Remplis: Repository name = 'claw-code'" -ForegroundColor Cyan
Write-Host "3. Sélectionne: 'Public'" -ForegroundColor Cyan
Write-Host "4. Clique: 'Create repository'" -ForegroundColor Cyan
Write-Host ""
Write-Host "5️⃣ Une fois créé, tu verras une URL:" -ForegroundColor Cyan
Write-Host "   https://github.com/YOUR_USERNAME/claw-code" -ForegroundColor White
Write-Host ""

# Étape 2: Demander l'URL
Write-Host "ÉTAPE 2️⃣: Copie l'URL du repo" -ForegroundColor Yellow
Write-Host "=================================" -ForegroundColor Yellow
Write-Host ""
$repoUrl = Read-Host "Colle l'URL HTTPS du repo GitHub"

# Validation
if (-not $repoUrl.StartsWith("https://github.com")) {
    Write-Host "❌ URL invalide! Elle doit commencer par https://github.com" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ URL acceptée: $repoUrl" -ForegroundColor Green
Write-Host ""

# Étape 3: Pousser
Write-Host "ÉTAPE 3️⃣: Pousse le code vers GitHub" -ForegroundColor Yellow
Write-Host "=====================================" -ForegroundColor Yellow
Write-Host ""

cd c:\Users\user\Desktop\claw-code-main

Write-Host "Étape 3a: Ajouter le remote..." -ForegroundColor Cyan
git remote add origin $repoUrl

Write-Host "Étape 3b: Renommer branche en 'main'..." -ForegroundColor Cyan
git branch -M main

Write-Host "Étape 3c: Pousser le code..." -ForegroundColor Cyan
Write-Host "(Cela peut prendre une minute...)" -ForegroundColor Gray
git push -u origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✅ SUCCÈS! Code poussé vers GitHub!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

Write-Host "🎉 Prochaines étapes:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Va voir ton repo:" -ForegroundColor Yellow
Write-Host "   $repoUrl" -ForegroundColor White
Write-Host ""
Write-Host "2. Clique sur l'onglet 'Actions':" -ForegroundColor Yellow
Write-Host "   Les workflows vont tourner auto!" -ForegroundColor White
Write-Host ""
Write-Host "3. Attends 5-10 minutes pour que:" -ForegroundColor Yellow
Write-Host "   ✅ Les tests Python finissent" -ForegroundColor White
Write-Host "   ✅ Le Rust build finisse" -ForegroundColor White
Write-Host "   ✅ Les Docker images soient créées" -ForegroundColor White
Write-Host ""
Write-Host "4. Ensuite télécharge depuis Releases!" -ForegroundColor Yellow
Write-Host ""

Write-Host "========================================" -ForegroundColor Green
Write-Host "C'EST FAIT! 🎉" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
