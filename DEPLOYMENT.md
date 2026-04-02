# Guide de Déploiement - Claw Code

Ce guide vous montre comment déployer Claw Code selon votre contexte.

## 🚀 Déploiement Option 1: Installation locale Python

### Méthode 1A: Installation avec pip

```bash
# Depuis le répertoire racine du projet
pip install -e .

# Lancer l'application
claw-python summary
claw-python commands --limit 10
claw-python tools --limit 10
```

### Méthode 1B: Installation manuelle

```bash
# Ajouter à votre PATH
export PYTHONPATH=$PYTHONPATH:/path/to/claw-code-main

# Ou créer un alias
alias claw-python="python3 /path/to/claw-code-main/src/launcher.py"

# Lancer
claw-python summary
```

---

## 🐳 Déploiement Option 2: Docker (Python)

### Build l'image

```bash
docker build -f Dockerfile.python -t claw-code:python .
```

### Exécuter les commandes

```bash
# Afficher le résumé
docker run --rm claw-code:python summary

# Lister les commandes
docker run --rm claw-code:python commands --limit 20

# Lister les outils
docker run --rm claw-code:python tools --limit 20
```

### Utiliser en mode interactif

```bash
docker run --rm -it claw-code:python /bin/bash
```

---

## 🦀 Déploiement Option 3: Build Rust (Recommandé pour production)

### Prérequis

```bash
# Installer Rust (si pas déjà installé)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### Build de la version Release

```bash
cd rust
cargo build --release -p claw-cli
```

### Le binaire compilé se trouve à:

```bash
./rust/target/release/claw
```

### Utilisation Rust

```bash
# Copier dans un répertoire accessible
cp rust/target/release/claw /usr/local/bin/

# Utiliser directement
claw --help
claw prompt "explain this workspace"
```

---

## 🐳 Déploiement Option 4: Docker (Rust - Production)

### Build l'image

```bash
docker build -f Dockerfile.rust -t claw-code:rust .
```

### Exécuter

```bash
# Afficher l'aide
docker run --rm claw-code:rust --help

# Lancer une session interactive
docker run --rm -it claw-code:rust

# Exécuter une commande one-shot
docker run --rm -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY claw-code:rust \
  prompt "summarize this workspace"
```

---

## ☁️ Déploiement Option 5: Cloud (Exemple AWS)

### Publier sur ECR (Elastic Container Registry)

```bash
# Créer le repository ECR
aws ecr create-repository --repository-name claw-code

# Récupérer l'URI
REGISTRY=$(aws ecr describe-repositories --repository-names claw-code \
  --query 'repositories[0].repositoryUri' --output text)

# Tagger l'image
docker tag claw-code:rust $REGISTRY:latest

# Publier sur ECR
aws ecr get-login-password --region us-east-1 | \
  docker login --username AWS --password-stdin $REGISTRY

docker push $REGISTRY:latest
```

### Déployer sur ECS ou Lambda

```bash
# Option 1: ECS Task
aws ecs register-task-definition --cli-input-json file://task-definition.json

# Option 2: Exécution avec boto3 (Python)
import boto3
ecs = boto3.client('ecs')
ecs.run_task(
    cluster='default',
    taskDefinition='claw-code:1',
    launchType='FARGATE'
)
```

---

## 📦 Déploiement Option 6: Distribution en Package

### Créer un wheel Python

```bash
pip install build
python -m build

# Généré dans dist/
ls dist/
# claw-code-0.1.0-py3-none-any.whl
```

### Publier sur PyPI (optionnel)

```bash
pip install twine

# Tester d'abord
twine upload --repository testpypi dist/*

# Production
twine upload dist/*
```

---

## 🔧 Configuration des variables d'environnement

### Pour API Anthropic

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
export ANTHROPIC_BASE_URL="https://api.anthropic.com"  # optionnel
```

### Pour Grok/X.AI

```bash
export XAI_API_KEY="..."
export XAI_BASE_URL="https://api.x.ai"  # optionnel
```

### Avec Docker

```bash
docker run --rm \
  -e ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY \
  claw-code:rust prompt "your prompt"
```

---

## 🛠️ Troubleshooting

### Python: Module types en conflit

Si vous voyez l'erreur `AttributeError: partially initialized module 're'`:

```bash
# Renommer le dossier types (déjà fait)
mv src/types src/types_archive
```

### Rust: Problèmes de build

```bash
# Mettre à jour Rust
rustup update

# Nettoyer et rebuilder
cd rust
cargo clean
cargo build --release
```

### Docker: Permissions

```bash
# Si vous avez des problèmes de permission
docker run --rm -u root claw-code:rust bash
```

---

## ✅ Checklist de déploiement

- [ ] Tester localement (`src.launcher.py summary`)
- [ ] Valider les dépendances Python ou Rust
- [ ] Configurer les variables d'environnement d'API
- [ ] Tester une commande simple (`commands`, `tools`)
- [ ] Construire l'image Docker
- [ ] Tester dans le conteneur
- [ ] Déployer à l'emplacement cible (cloud, serveur, etc.)
- [ ] Valider que les API credentials fonctionnent
- [ ] Monitorer les logs de déploiement

---

## 📊 Comparaison des options

| Option | Facilité | Performance | Flexibilité | Recommandé pour |
|--------|---------|-------------|-------------|-----------------|
| Installation locale Python | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ | Développement |
| Docker Python | ⭐⭐ | ⭐⭐ | ⭐⭐ | Testing |
| Build Rust local | ⭐ | ⭐⭐⭐ | ⭐⭐⭐ | Production |
| Docker Rust | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐ | Production cloud |
| Cloud (AWS/GCP) | ⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ | Scalabilité |
| PyPI package | ⭐⭐ | ⭐⭐ | ⭐ | Distribution large |

---

## 📞 Support

Pour les problèmes de déploiement:

1. Consultez les logs détaillés
2. Vérifiez les credentials d'API
3. Validez la configuration dans `CLAW.md` ou `.claw/config.json`
4. Consultez le repository GitHub pour les issues connues
