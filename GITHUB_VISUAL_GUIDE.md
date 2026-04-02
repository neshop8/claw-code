# 🚀 GUIDE GITHUB - CLIQUE EXACTEMENT ICI (5 minutes)

## ÉTAPE 1️⃣: Créer un repo (vai le site GitHub)

```
🔗 Va sur: https://github.com/new
```

Tu verras cet écran:

```
┌─────────────────────────────────────────┐
│  CREATE A NEW REPOSITORY                │
├─────────────────────────────────────────┤
│                                         │
│  Repository name:  [claw-code       ]   │ ← TAPE: claw-code
│                                         │
│  Description:      [optional        ]   │ ← (Optionnel)
│                                         │
│  ☑ Public                              │ ← SÉLECTIONNE: Public
│  ☐ Private                             │
│                                         │
│  [ ] Add a README file                 │
│  [ ] Add .gitignore                    │ ← DÉJÀ FAIT par moi
│  [ ] Add a license                     │
│                                         │
│           [Create Repository]          │ ← CLIQUE ICI
│                                         │
└─────────────────────────────────────────┘
```

## ÉTAPE 2️⃣: Tu verras cette page (après création)

```
┌─────────────────────────────────────────┐
│  Quick setup — if you've done this      │
│  kind of thing before                   │
├─────────────────────────────────────────┤
│                                         │
│  HTTP  SSH                              │
│                                         │
│  https://github.com/YOUR_USERNAME/     │
│  claw-code.git                          │ ← 📋 COPIE CETTE URL
│                                         │
│  ( ) My code already has a git repo    │
│      (✓) Help me use existing repo    │ ← SÉLECTIONNE CELUI-CI
│                                         │
└─────────────────────────────────────────┘
```

## ÉTAPE 3️⃣: Copie l'URL et Exécute ceci dans PowerShell

Dans PowerShell (remplace l'URL par la tienne):

```powershell
cd c:\Users\user\Desktop\claw-code-main

git remote add origin https://github.com/YOUR_USERNAME/claw-code.git
git branch -M main
git push -u origin main
```

## 🎯 EXEMPLE CONCRET:

Si ton GitHub username est `john`, ça ressemble à:

```powershell
git remote add origin https://github.com/john/claw-code.git
git branch -M main
git push -u origin main
```

---

## ✅ QUAND C'EST FINITO:

Va vérifier sur GitHub:
- `https://github.com/YOUR_USERNAME/claw-code`
- Clique "Actions"
- Les workflows tournent! 🎉

---

## 📖 RÉSUMÉ VISUEL

```
1️⃣ https://github.com/new
   ↓
2️⃣ Name: claw-code → Select: Public → Create
   ↓
3️⃣ Copie URL
   ↓
4️⃣ PowerShell: git remote add origin https://...
   ↓
5️⃣ PowerShell: git branch -M main
   ↓
6️⃣ PowerShell: git push -u origin main
   ↓
7️⃣ ✅ DONE! Regarde https://github.com/YOUR_USERNAME/claw-code/actions
```

---

## 💡 SI TU BLOQUES:

**Dis-moi:**
- Ton GitHub username (ex: johnsmith)
- Ou le lien du repo que tu as créé

Et je pousserai le code pour toi! 🚀
