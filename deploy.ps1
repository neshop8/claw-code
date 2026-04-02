# Quick deployment script for Claw Code (Windows)

$ErrorActionPreference = "Stop"

Write-Host "🚀 Claw Code Deployment Script (Windows)" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host ""

# Check what's available
function Test-Python {
    try {
        $version = python --version 2>&1
        Write-Host "✅ Python found: $version" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ Python not found" -ForegroundColor Red
        return $false
    }
}

function Test-Rust {
    try {
        $version = rustc --version
        Write-Host "✅ Rust found: $version" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ Rust not found" -ForegroundColor Red
        return $false
    }
}

function Test-Docker {
    try {
        $version = docker --version
        Write-Host "✅ Docker found: $version" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ Docker not found" -ForegroundColor Red
        return $false
    }
}

Write-Host "Checking prerequisites..." -ForegroundColor Cyan
Write-Host ""

$HasPython = Test-Python
$HasRust = Test-Rust
$HasDocker = Test-Docker

Write-Host ""
Write-Host "Deployment options available:" -ForegroundColor Cyan
Write-Host ""

if ($HasPython) {
    Write-Host "1️⃣  Install Python workspace locally" -ForegroundColor Green
}

if ($HasRust) {
    Write-Host "2️⃣  Build Rust CLI (production)" -ForegroundColor Green
}

if ($HasDocker) {
    Write-Host "3️⃣  Build Docker images" -ForegroundColor Green
}

if (-not $HasPython -and -not $HasRust -and -not $HasDocker) {
    Write-Host "❌ No deployment tools found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install one of:" -ForegroundColor Yellow
    Write-Host "  - Python 3.11+ (https://python.org/)" -ForegroundColor Yellow
    Write-Host "  - Rust (https://rustup.rs/)" -ForegroundColor Yellow
    Write-Host "  - Docker Desktop (https://docker.com/)" -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "Select deployment method (1-3):" -ForegroundColor Cyan
$choice = Read-Host "Enter choice"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

switch ($choice) {
    "1" {
        if (-not $HasPython) {
            Write-Host "❌ Python not available!" -ForegroundColor Red
            exit 1
        }
        Write-Host ""
        Write-Host "📦 Installing Python workspace..." -ForegroundColor Cyan
        Set-Location $scriptDir
        pip install -e .
        Write-Host ""
        Write-Host "✅ Installation complete!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Try running:" -ForegroundColor Cyan
        Write-Host "  claw-python summary" -ForegroundColor White
        Write-Host "  claw-python commands" -ForegroundColor White
        Write-Host "  claw-python tools" -ForegroundColor White
    }
    "2" {
        if (-not $HasRust) {
            Write-Host "❌ Rust not available!" -ForegroundColor Red
            exit 1
        }
        Write-Host ""
        Write-Host "🦀 Building Rust CLI..." -ForegroundColor Cyan
        Set-Location "$scriptDir\rust"
        cargo build --release -p claw-cli
        Write-Host ""
        Write-Host "✅ Build complete!" -ForegroundColor Green
        Write-Host ""
        $binary = ".\target\release\claw.exe"
        if (Test-Path $binary) {
            Write-Host "Binary location: $binary" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Try running:" -ForegroundColor Cyan
            Write-Host "  $binary --help" -ForegroundColor White
            Write-Host "  $binary prompt 'summarize this workspace'" -ForegroundColor White
        }
    }
    "3" {
        if (-not $HasDocker) {
            Write-Host "❌ Docker not available!" -ForegroundColor Red
            exit 1
        }
        Write-Host ""
        Write-Host "🐳 Building Docker images..." -ForegroundColor Cyan
        Set-Location $scriptDir
        
        Write-Host "Building Python image..." -ForegroundColor Yellow
        docker build -f Dockerfile.python -t claw-code:python .
        
        Write-Host "Building Rust image..." -ForegroundColor Yellow
        docker build -f Dockerfile.rust -t claw-code:rust .
        
        Write-Host ""
        Write-Host "✅ Docker images built!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Try running:" -ForegroundColor Cyan
        Write-Host "  docker run --rm claw-code:python summary" -ForegroundColor White
        Write-Host "  docker run --rm claw-code:rust --help" -ForegroundColor White
        Write-Host "  docker-compose up claw-rust" -ForegroundColor White
    }
    default {
        Write-Host "❌ Invalid choice!" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "For more details, see DEPLOYMENT.md" -ForegroundColor Cyan
