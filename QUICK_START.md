# 🚀 CLAW CODE - DÉPLOIEMENT PYTHON RÉUSSI!

## ✅ Installation Complète

Votre application **Claw Code** est maintenant installée et prête à l'emploi!

### 📍 Localisation du binaire

```
C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe
```

---

## 📖 Utilisation Rapide

### Option 1: Chemin complet (marche toujours)

```powershell
C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe summary
C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe commands --limit 10
C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe tools
```

### Option 2: Créer un alias (recommandé)

Édite ton profil PowerShell:

```powershell
notepad $PROFILE
```

Ajoute cette ligne:

```powershell
Set-Alias claw 'C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe'
```

Puis sauvegarde et redémare PowerShell.

Maintenant tu peux utiliser simplement:

```powershell
claw summary
claw commands --limit 20
claw tools --limit 15
claw route "create a new file"
```

### Option 3: Ajouter au PATH global (Windows)

1. Appuie sur `Win + X` → Paramètres
2. Système → Variables d'environnement avancées
3. Clique sur "Variables d'environnement"
4. Sélectionne "Path" → Modifier
5. Clique "Nouveau" et ajoute: `C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts`
6. Clique OK et redémare PowerShell

Après ça, tu peux utiliser directement:

```powershell
claw-python summary
```

---

## 🎮 Commandes Disponibles

### 📋 Affichage & Inspection

```powershell
claw summary              # Résumé Python du workspace
claw manifest             # Manifeste détaillé
claw subsystems --limit 10  # Lister les modules
claw parity-audit         # Comparaison Python vs TypeScript
claw setup-report         # Rapport de setup
```

### 📚 Commandes & Outils

```powershell
claw commands             # Lister les 207 commandes
claw tools               # Lister les 184 outils
claw commands --query "file"    # Rechercher des commandes
claw tools --query "agent"      # Rechercher des outils
```

### 🔍 Recherche & Routing

```powershell
claw route "create a file"      # Router une requête
claw show-command "add-dir"     # Afficher une commande
claw show-tool "AgentTool"      # Afficher un outil
```

### 🎯 Modes Avancés

```powershell
claw bootstrap "explain this"                    # Session bootstrap
claw turn-loop "help me debug" --max-turns 3    # Boucle interactive
claw flush-transcript "your prompt"             # Persister une session
claw load-session <session_id>                  # Charger une session
```

---

## 🐳 Distribution Alternative (Docker)

Si tu veux déployer en Docker:

```bash
# Build l'image
docker build -f Dockerfile.python -t claw-code:python .

# Lancer
docker run --rm claw-code:python summary
docker run --rm claw-code:python commands --limit 10
```

---

## 📦 Utilisation en tant que Library

Depuis n'importe quel projet Python:

```python
from src.main import build_parser, QueryEnginePort, build_port_manifest

# Obtenir le manifeste
manifest = build_port_manifest()

# Utiliser le query engine
engine = QueryEnginePort(manifest)
print(engine.render_summary())

# Accéder aux commandes
from src.commands import get_commands
commands = get_commands(limit=20)
for cmd in commands:
    print(f"{cmd.name}: {cmd.source_hint}")
```

---

## ⚙️ Configuration

### Variables d'environnement

```powershell
# Pour les APIs
$env:ANTHROPIC_API_KEY = "sk-ant-..."
$env:XAI_API_KEY = "..."

# Puis lance l'app
claw summary
```

### Fichiers de configuration

Crée une fichier `.claw/config.json` dans ton répertoire:

```json
{
  "model": "claude-3-5-sonnet",
  "temperature": 0.7,
  "max_tokens": 4096
}
```

---

## 🔧 Troubleshooting

### "claw-python not found"

Utilise le chemin complet:

```powershell
C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe summary
```

### Erreur "partially initialized module 're'"

Cela a été résolu! Le dossier `types/` a été renommé en `types_archive/`.

### Installation non trouvée

Réinstalle:

```powershell
cd c:\Users\user\Desktop\claw-code-main
python -m pip install -e .
```

---

## 📊 Architecture

```
claw-code-main/
├── src/                  # Python workspace (votre code)
│   ├── launcher.py      # Point d'entrée
│   ├── main.py          # CLI principal
│   ├── commands.py      # 207 commandes mirées
│   ├── tools.py         # 184 outils mirés
│   └── ...
├── rust/                # Rust CLI (pour production)
├── setup.py             # Configuration Python
├── requirements.txt     # Dépendances
└── DEPLOYMENT.md        # Guide déploiement complet
```

---

## 🎯 Prochaines étapes

1. ✅ Application déployée
2. 📝 Tester quelques commandes
3. 🔗 Intégrer avec ton IDE/Editor
4. 🚀 Considérer le Rust build pour production

---

## 📞 Support

- Voir `DEPLOYMENT.md` pour d'autres options
- Voir `README.md` pour le contexte du projet
- Voir `rust/README.md` pour la version Rust
