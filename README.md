# Configurateur Pergola - Cover Green

Dépôt d'hébergement du configurateur 3D. Le fichier servi est **index.html**.
Il est embarqué dans WordPress via le plugin "Configurateur Pergola" (iframe vers l'URL GitHub Pages).

## Créer le dépôt distant et pousser (une seule fois)

Avec GitHub CLI (`gh`) installé :

```bash
cd "pergola-repo"
gh repo create cover-green/configurateur-pergola --public --source=. --remote=origin --push
```

Sans `gh` : crée le dépôt vide sur github.com (ex. `configurateur-pergola`), puis :

```bash
cd "pergola-repo"
git remote add origin https://github.com/<TON_USER>/configurateur-pergola.git
git branch -M main
git push -u origin main
```

## Activer GitHub Pages

Repo → Settings → Pages → Source : **Deploy from a branch** → Branch : **main** / **/ (root)** → Save.
L'URL sera : `https://<TON_USER>.github.io/configurateur-pergola/`

Colle cette URL dans WordPress → Réglages → Configurateur Pergola.

## Mettre à jour

À chaque nouvelle version, le fichier `index.html` est régénéré. Ensuite :

```bash
cd "pergola-repo"
git add index.html && git commit -m "maj configurateur" && git push
```

Ou lance `./auto-push.command` (voir ci-dessous) pour pousser automatiquement à chaque modif du fichier.
