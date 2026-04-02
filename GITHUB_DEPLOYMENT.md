# 🚀 Déployer Claw Code via GitHub

Ce guide te montre comment:
1. **Créer un repository GitHub**
2. **Activer les workflows automatiques**
3. **Déployer automatiquement**
4. **Partager avec le monde**

---

## 📋 Étape 1: Créer un Repository GitHub

### Option A: Créer depuis zéro

1. Va sur https://github.com/new
2. Nomme ton repo: `claw-code` (ou un autre nom)
3. Sélectionne "Public" (pour pouvoir le partager)
4. Clique "Create repository"

### Option B: Fork d'un repository existant

1. Va sur un repo Claw Code existant
2. Clique "Fork" en haut à droite
3. C'est fait!

---

## 🔄 Étape 2: Pousser le code

```bash
# Initialiser le repo local
cd c:\Users\user\Desktop\claw-code-main

git init
git add .
git commit -m "Initial commit: Claw Code with Python workspace"

# Ajouter le remote GitHub
git remote add origin https://github.com/YOUR_USERNAME/claw-code.git

# Pousser le code
git branch -M main
git push -u origin main
```

---

## ⚙️ Étape 3: Les Workflows Automatiques S'Activent

Après avoir poussé le code, GitHub va automatiquement:

✅ **Python Tests** → Tester sur Linux, Windows, macOS avec Python 3.11 & 3.12  
✅ **Rust Build** → Builder le binaire pour toutes les plateformes  
✅ **Docker Build** → Créer les images Docker  

---

## 📊 Voir les Workflows

1. Va sur ton repo GitHub: `https://github.com/YOUR_USERNAME/claw-code`
2. Clique sur l'onglet **"Actions"**
3. Tu vois tous les workflows qui tournent

---

## 🎁 Étape 4: Créer une Release

Quand tu veux faire une release:

```bash
# Tag une version
git tag v0.1.0
git push origin v0.1.0
```

Automatiquement:
- GitHub Actions va builder tous les binaires
- Les artefacts seront dans "Releases"
- Les images Docker seront publiées

---

## 📦 Utiliser depuis GitHub

### **Option 1: Cloner et lancer**

```bash
git clone https://github.com/YOUR_USERNAME/claw-code.git
cd claw-code
python -m src.main summary
```

### **Option 2: Télécharger le binaire Rust**

1. Va dans ton repo → **Releases**
2. Télécharge le binaire pour ton OS
3. Exécute-le

### **Option 3: Docker depuis GitHub Container Registry**

```bash
docker run ghcr.io/YOUR_USERNAME/claw-code:main-python summary
docker run ghcr.io/YOUR_USERNAME/claw-code:main-rust --help
```

---

## 📝 Ajouter un Badge de Status

Pour montrer que tout fonctionne, ajoute ceci dans le **README.md**:

```markdown
# Claw Code

![Build Status](https://github.com/YOUR_USERNAME/claw-code/actions/workflows/python-tests.yml/badge.svg)
![Rust Build](https://github.com/YOUR_USERNAME/claw-code/actions/workflows/rust-build.yml/badge.svg)

Harness engineering in Python and Rust
```

---

## 🌐 Étape 5: GitHub Pages (Documentation)

Pour créer une page de documentation:

1. Crée un dossier `docs/`
2. Crée un fichier `docs/index.md`
3. Va dans Settings → Pages
4. Sélectionne Branch: `main`, Folder: `/docs`
5. Ta page est à `https://YOUR_USERNAME.github.io/claw-code/`

---

## 📂 Structure de fichier recommandée

```
claw-code/
├── src/                           # Python workspace
├── rust/                          # Rust CLI
├── .github/
│   └── workflows/
│       ├── python-tests.yml       # Tests Python ✅
│       ├── rust-build.yml         # Build Rust ✅
│       └── docker-build.yml       # Build Docker ✅
├── docs/                          # Documentation GitHub Pages
│   ├── index.md
│   └── deployment.md
├── setup.py                       # Python package config
└── README.md
```

---

## 🚀 Résumé des Étapes

| Étape | Action | Résultat |
|-------|--------|----------|
| 1 | Créer repo GitHub | Lien vers `github.com/YOU/claw-code` |
| 2 | `git push` | Code poussé |
| 3 | Workflows auto | Tests + Builds auto |
| 4 | Tag une version | Release avec binaires |
| 5 | GitHub Pages (optionnel) | Site de doc |

---

## 💡 Tips & Tricks

### Voir les logs d'un workflow échoué

1. Actions → Sélectionne le workflow
2. Clique sur le run qui a échoué
3. Clique sur le job pour voir les logs détaillés

### Déclencher un workflow manuellement

```bash
# N'importe quel push trigger les workflows
git push

# Ou utiliser GitHub UI → Actions → Select workflow → Run workflow
```

### Créer un fichier de config pour ton équipe

Crée `.github/CODEOWNERS`:

```
* @YOUR_USERNAME
src/commands.py @reviewer1
rust/ @rust-expert
```

---

## 📞 Liens utiles

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [GitHub Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
- [GitHub Pages](https://pages.github.com/)
- [Rust GitHub Actions](https://github.com/actions-rs/toolchain)

---

## ✅ Checklist

- [ ] Repo GitHub créé
- [ ] Code poussé avec `git push`
- [ ] Workflows activés (vérifie dans Actions)
- [ ] Release créée avec un tag
- [ ] Images Docker publiées dans GHCR
- [ ] (Optionnel) GitHub Pages configuré
- [ ] Badges ajoutés au README

---

**Tu es prêt?** 🚀 Crée ton repo GitHub et push le code!
