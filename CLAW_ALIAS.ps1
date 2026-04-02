# Ajoute cet alias à ton profil PowerShell:
# Pour éditer ton profil: notepad $PROFILE

# Alias pour lancer l'application
Set-Alias claw 'C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe'

# Ou créer une fonction
function claw {
    C:\Users\user\AppData\Local\Programs\Python\Python311\Scripts\claw-python.exe @args
}
