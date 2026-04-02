# 🚀 START HERE - Déploiement Rapide

**Tu veux lancer l'application en 1 minute?** Voici comment:

## ⚡ Quick Start (3 commandes)

```bash
# 1. Clone le repo
git clone https://github.com/YOUR_USERNAME/claw-code.git
cd claw-code

# 2. Installe
pip install -e .

# 3. Lança!
python -m src.main summary
```

---

## 🌐 Ou via GitHub (recommandé)

### ✅ Étape 1: Fork / Clone ce repo
- Clique [Fork](https://github.com/instructkr/claw-code/fork)
- Ou clone: `git clone https://github.com/YOUR_USERNAME/claw-code.git`

### ✅ Étape 2: Pousse vers ton GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/claw-code.git
git push -u origin main
```

### ✅ Étape 3: Laisse les Workflows fonctionner
- Va dans **Actions** → Les tests vont tourner automatiquement
- Les builds Rust et Docker vont se déclencher
- Les releases seront créées avec les binaires

### ✅ Étape 4: Utilise le binaire final
- Télécharge depuis **Releases**
- Ou utilise Docker: `docker run ghcr.io/YOUR_USERNAME/claw-code:main-rust --help`

---

## 📚 Guides Détaillés

- **[QUICK_START.md](QUICK_START.md)** - Installation locale rapide
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - 6 options de déploiement
- **[GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md)** - Setup complet GitHub Actions

---

## 🐍 Python Local (Facile)

```bash
cd c:\Users\user\Desktop\claw-code-main
python -m src.main summary
python -m src.main commands --limit 10
python -m src.main tools
```

---

## 🦀 Rust (Production)

```bash
cd rust
cargo build --release -p claw-cli
./target/release/claw --help
```

---

## 🐳 Docker (Cloud-Ready)

```bash
# Build
docker build -f Dockerfile.rust -t claw-code:rust .

# Run
docker run --rm claw-code:rust --help
docker run --rm -it claw-code:rust  # Mode interactif
```

---

## 🎮 Commandes Principales

```bash
# Affichage
claw summary              # Résumé du workspace
claw manifest             # Manifeste détaillé
claw commands --limit 10  # 10 premières commandes
claw tools --limit 10     # 10 premiers outils

# Recherche
claw route "create a file"        # Router une requête
claw show-command "add-dir"       # Afficher une commande
claw show-tool "AgentTool"        # Afficher un outil

# Avancé
claw bootstrap "explain this"                 # Session bootstrap
claw turn-loop "help me" --max-turns 3       # Boucle interactive
```

---

## ✅ Vérifier que tout fonctionne

```bash
# Test Python
python -m src.main summary

# Test Rust (si build)
./rust/target/release/claw --help

# Test Docker (si Docker installé)
docker run --rm claw-code:python summary
```

---

## 📖 Documentation Complète

| Document | Contenu |
|----------|---------|
| [README.md](README.md) | Info du projet & backstory |
| [QUICK_START.md](QUICK_START.md) | Installation locale (30 sec) |
| [DEPLOYMENT.md](DEPLOYMENT.md) | 6 options de déploiement |
| [GITHUB_DEPLOYMENT.md](GITHUB_DEPLOYMENT.md) | Setup GitHub Actions |
| [rust/README.md](rust/README.md) | Documentation Rust |

---

## 🎯 Choix Rapide

| Profil | Recommandation |
|--------|---------------|
| **Je veux tester maintenant** | `python -m src.main summary` |
| **Je veux déployer localement** | Python install (QUICK_START.md) |
| **Je veux la meilleure perf** | Rust build |
| **Je veux du cloud** | Docker + GitHub Actions |
| **Je veux auto-magique** | Fork + `git push` (GitHub Actions) |

---

##  Liens Rapides

- 📌 **[Créer un repo GitHub](https://github.com/new)**
- 🔄 **[Se connecter à GitHub](https://github.com/login)**
- 🚀 **[GitHub Actions Docs](https://docs.github.com/actions)**
- 🐳 **[Docker Hub](https://hub.docker.com/)**

---

## 💬 Besoin d'aide?

1. Consulte [QUICK_START.md](QUICK_START.md)
2. Consulte [DEPLOYMENT.md](DEPLOYMENT.md)
3. Cherche le problème dans [Issues](../../issues)
4. Crée une [nouvelle issue](../../issues/new)

---

**🎉 Let's go!** Choisis l'option et démarre! 🚀
