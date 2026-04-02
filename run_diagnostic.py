#!/usr/bin/env python3
"""Diagnostic et correction automatique pour Claw Code"""

import sys
import os
from pathlib import Path

print("=" * 70)
print("🔍 DIAGNOSTIC CLAW CODE")
print("=" * 70)
print()

# Vérification 1: Python
print("1️⃣ Vérification Python...")
print(f"   Version: {sys.version}")
print(f"   Chemin: {sys.executable}")
print("   ✅ OK\n")

# Vérification 2: Localisation du workspace
print("2️⃣ Vérification du workspace...")
workspace = Path(__file__).parent
print(f"   Workspace: {workspace}")
if (workspace / "src").exists():
    print("   ✅ Dossier 'src' trouvé")
else:
    print("   ❌ Dossier 'src' MANQUANT!")
    sys.exit(1)

# Vérification 3: Types archive
print()
print("3️⃣ Vérification des imports...")
if (workspace / "src" / "types_archive").exists():
    print("   ✅ types_archive trouvé (rename correctement fait)")
elif (workspace / "src" / "types").exists():
    print("   ⚠️ ATTENTION: types/ existe encore (créera un conflit)")
else:
    print("   ✅ Pas de conflit détecté")

# Vérification 4: Package installé
print()
print("4️⃣ Vérification du package installé...")
try:
    sys.path.insert(0, str(workspace))
    from src.main import main, build_parser
    print("   ✅ Package importable")
except Exception as e:
    print(f"   ❌ Erreur d'import: {e}")
    sys.exit(1)

# Vérification 5: Test basic
print()
print("5️⃣ Test basique...")
try:
    parser = build_parser()
    print("   ✅ Parser créé avec succès")
except Exception as e:
    print(f"   ❌ Erreur parser: {e}")
    sys.exit(1)

print()
print("=" * 70)
print("✅ TOUS LES DIAGNOSTICS RÉUSSIS!")
print("=" * 70)
print()
print("🚀 Lancement de 'claw summary'...\n")
print("-" * 70)
print()

# Maintenant run la commande
try:
    result = main(['summary'])
    sys.exit(result)
except Exception as e:
    print(f"❌ Erreur: {e}")
    import traceback
    traceback.print_exc()
    sys.exit(1)
