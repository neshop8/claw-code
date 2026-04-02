# Claw Code

**Agent Harness Platform for Python & Rust**

## 📍 Quick Links

- 🌐 **Live Page:** https://neshop8.github.io/claw-code/
- 📦 **GitHub Repo:** https://github.com/neshop8/claw-code
- ⚙️ **GitHub Actions:** https://github.com/neshop8/claw-code/actions
- 📥 **Releases:** https://github.com/neshop8/claw-code/releases

## 🚀 Features

### 📊 Statistics
- **67** Python files
- **207** Commands
- **184** Tools
- **2** Implementations (Python & Rust)

### 🐍 Python Workspace
- Clean-room implementation
- Modular architecture
- Agent orchestration framework

### 🦀 Rust CLI
- High-performance runtime
- Memory-safe execution
- Production-ready

### 🐳 Docker Support
- Containerized deployment
- Cloud-native ready
- GitHub Container Registry

## 🎯 Getting Started

### Python (Local)
```bash
git clone https://github.com/neshop8/claw-code.git
cd claw-code
python -m src.main summary
python -m src.main commands --limit 10
python -m src.main tools --limit 10
```

### Rust (Performance)
```bash
cd rust
cargo build --release -p claw-cli
./target/release/claw --help
```

### Docker (Cloud)
```bash
docker build -f Dockerfile.rust -t claw-code:latest .
docker run --rm claw-code:latest --help
```

## 📚 Documentation

- [QUICK_START.md](../QUICK_START.md) - Quick setup guide
- [DEPLOYMENT.md](../DEPLOYMENT.md) - Deployment options
- [GITHUB_DEPLOYMENT.md](../GITHUB_DEPLOYMENT.md) - GitHub Actions setup

## 🔗 Resources

- [GitHub Repository](https://github.com/neshop8/claw-code)
- [Releases & Binaries](https://github.com/neshop8/claw-code/releases)
- [GitHub Actions Workflows](https://github.com/neshop8/claw-code/actions)
- [Discussions](https://github.com/neshop8/claw-code/discussions)

## 🛠️ Available Commands

### Summary & Info
```bash
python -m src.main summary      # Workspace summary
python -m src.main manifest     # Detailed manifest
python -m src.main subsystems   # List modules
```

### Commands & Tools
```bash
python -m src.main commands              # List all 207 commands
python -m src.main tools                 # List all 184 tools
python -m src.main commands --query "file"  # Search commands
python -m src.main tools --query "agent"    # Search tools
```

### Advanced
```bash
python -m src.main route "create a file"    # Route a query
python -m src.main bootstrap "explain this" # Bootstrap session
python -m src.main turn-loop "help me" --max-turns 3  # Interactive loop
```

## 🎉 Status

- ✅ Code on GitHub
- ✅ GitHub Actions configured
- ✅ Automated tests & builds
- ✅ Docker images built
- ✅ Releases available
- ✅ GitHub Pages deployed

## 📊 GitHub Actions Workflows

| Workflow | Status | Purpose |
|----------|--------|---------|
| Python Tests | ✅ | Test Python on Windows, Mac, Linux |
| Rust Build | ✅ | Build binaries for all platforms |
| Docker Build | ✅ | Create container images |

## 📖 License

MIT - See LICENSE file for details

---

**Built with Python, Rust, Docker & GitHub Actions** 🚀
