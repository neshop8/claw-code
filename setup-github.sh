#!/bin/bash
# 🚀 Setup Claw Code pour GitHub - Script automatisé

echo "=========================================="
echo "Claw Code - GitHub Setup"
echo "=========================================="
echo ""

# Vérifier git
if ! command -v git &> /dev/null; then
    echo "❌ Git not found. Please install Git first."
    exit 1
fi

echo "✅ Git found"
echo ""

# Initialiser le repo
echo "Initializing Git repository..."
git init
git add .
git commit -m "Initial commit: Claw Code with Python & Rust workspaces"

echo ""
echo "=========================================="
echo "📍 NEXT STEPS:"
echo "=========================================="
echo ""
echo "1. Create a repo on GitHub:"
echo "   https://github.com/new"
echo ""
echo "2. Copy the repo URL (HTTPS or SSH)"
echo ""
echo "3. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/claw-code.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4. Check GitHub Actions:"
echo "   https://github.com/YOUR_USERNAME/claw-code/actions"
echo ""
echo "5. Download releases or use Docker!"
echo ""
echo "=========================================="
