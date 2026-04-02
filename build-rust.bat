@echo off
REM Claw Code Rust Build Script for Windows
echo.
echo ========================================
echo  Claw Code - Rust Build Script 
echo ========================================
echo.

REM Check if cargo is available
where cargo >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: cargo not found in PATH
    echo Please install Rust from https://rustup.rs/
    exit /b 1
)

echo [✓] Cargo found
echo.

REM Navigate to rust directory
cd /d "%~dp0rust"
if errorlevel 1 (
    echo ERROR: Could not navigate to rust directory
    exit /b 1
)

echo [→] Building Claw Code (Rust)...
echo [→] This may take 3-5 minutes on first build...
echo.

REM Build release
cargo build --release -p claw-cli
if errorlevel 1 (
    echo.
    echo ERROR: Build failed
    exit /b 1
)

echo.
echo ========================================
echo  Build Complete!
echo ========================================
echo.

REM Find the binary
if exist "target\release\claw.exe" (
    echo [✓] Binary created: target\release\claw.exe
    echo.
    echo [→] Try running:
    echo     target\release\claw.exe --help
    echo     target\release\claw.exe prompt "what is this workspace?"
    echo.
) else (
    echo [!] Binary not found - check build output
    exit /b 1
)

pause
