#!/bin/bash
# Quick deployment script for Claw Code

set -e

echo "🚀 Claw Code Deployment Script"
echo "==============================="
echo ""

# Check what's available
check_python() {
    if command -v python3 &> /dev/null; then
        PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
        echo "✅ Python found: $PYTHON_VERSION"
        return 0
    else
        echo "❌ Python not found"
        return 1
    fi
}

check_rust() {
    if command -v cargo &> /dev/null; then
        RUST_VERSION=$(rustc --version)
        echo "✅ Rust found: $RUST_VERSION"
        return 0
    else
        echo "❌ Rust not found"
        return 1
    fi
}

check_docker() {
    if command -v docker &> /dev/null; then
        DOCKER_VERSION=$(docker --version)
        echo "✅ Docker found: $DOCKER_VERSION"
        return 0
    else
        echo "❌ Docker not found"
        return 1
    fi
}

echo "Checking prerequisites..."
HAS_PYTHON=0
HAS_RUST=0
HAS_DOCKER=0

check_python && HAS_PYTHON=1 || HAS_PYTHON=0
check_rust && HAS_RUST=1 || HAS_RUST=0
check_docker && HAS_DOCKER=1 || HAS_DOCKER=0

echo ""
echo "Deployment options available:"
echo ""

if [ $HAS_PYTHON -eq 1 ]; then
    echo "1️⃣  Install Python workspace locally"
fi

if [ $HAS_RUST -eq 1 ]; then
    echo "2️⃣  Build Rust CLI (production)"
fi

if [ $HAS_DOCKER -eq 1 ]; then
    echo "3️⃣  Build Docker images"
fi

if [ $HAS_PYTHON -eq 0 ] && [ $HAS_RUST -eq 0 ] && [ $HAS_DOCKER -eq 0 ]; then
    echo "❌ No deployment tools found!"
    echo ""
    echo "Please install one of:"
    echo "  - Python 3.11+"
    echo "  - Rust (https://rustup.rs/)"
    echo "  - Docker (https://docker.com/)"
    exit 1
fi

echo ""
echo "Select deployment method (1-3):"
read -p "Enter choice: " CHOICE

case $CHOICE in
    1)
        if [ $HAS_PYTHON -eq 0 ]; then
            echo "❌ Python not available!"
            exit 1
        fi
        echo ""
        echo "📦 Installing Python workspace..."
        cd "$(dirname "$0")"
        pip install -e .
        echo ""
        echo "✅ Installation complete!"
        echo ""
        echo "Try running:"
        echo "  claw-python summary"
        echo "  claw-python commands"
        echo "  claw-python tools"
        ;;
    2)
        if [ $HAS_RUST -eq 0 ]; then
            echo "❌ Rust not available!"
            exit 1
        fi
        echo ""
        echo "🦀 Building Rust CLI..."
        cd "$(dirname "$0")/rust"
        cargo build --release -p claw-cli
        echo ""
        echo "✅ Build complete!"
        echo ""
        BINARY="./target/release/claw"
        if [ -f "$BINARY" ]; then
            echo "Binary location: $BINARY"
            echo ""
            echo "Try running:"
            echo "  $BINARY --help"
            echo "  $BINARY prompt 'summarize this workspace'"
        fi
        ;;
    3)
        if [ $HAS_DOCKER -eq 0 ]; then
            echo "❌ Docker not available!"
            exit 1
        fi
        echo ""
        echo "🐳 Building Docker images..."
        cd "$(dirname "$0")"
        
        echo "Building Python image..."
        docker build -f Dockerfile.python -t claw-code:python .
        
        echo "Building Rust image..."
        docker build -f Dockerfile.rust -t claw-code:rust .
        
        echo ""
        echo "✅ Docker images built!"
        echo ""
        echo "Try running:"
        echo "  docker run --rm claw-code:python summary"
        echo "  docker run --rm claw-code:rust --help"
        echo "  docker-compose up claw-rust"
        ;;
    *)
        echo "❌ Invalid choice!"
        exit 1
        ;;
esac

echo ""
echo "For more details, see DEPLOYMENT.md"
