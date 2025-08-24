# Dotfiles — Distributions

Ce dossier contient les scripts d'installation et de configuration pour plusieurs distributions Linux (Actuellement : Arch Linux et Fedora). L'objectif est d'automatiser l'installation d'applications, polices, outils de développement et configurations utilisateur.

## Prérequis

- Accès sudo sur la machine.
- Connexion Internet.

## Utilisation

1. Depuis le répertoire `distributions`, exécuter :

```bash
./setup.sh
```

Ce script détecte la distribution (pacman → Arch, dnf → Fedora) et lance la procédure correspondante.

## Structure principale

- `setup.sh` : script d'entrée qui charge le bootstrap commun et choisit la distribution.
- `archlinux/` : scripts et sous-dossiers pour Arch Linux.
- `fedora/` : scripts et sous-dossiers pour Fedora.
- `common/` : scripts partagés (ex : installation de webapps, bootstrap de config).
- Chaque distribution contient un dossier `install/` avec :
  - `apps/` : installation d'applications CLI et outils.
  - `desktop/` : applications et polices pour environnement de bureau.
  - `hyprland/`, `config/`, etc. selon la distribution.

## Personnalisation

- Ajouter/éditer des scripts dans `install/apps/` ou `install/desktop/` pour étendre la configuration.
- Les fichiers de configuration utilisateur sont copiés depuis `../config/` par le bootstrap — modifier ces sources pour changer les configs déployées.
- Les binaires/scripts fournis sont copiés dans `~/.local/bin` via `common/install/bootstrap.sh`.

## Contribution

- Ajouter un script dans le dossier correspondant à la distribution.
- Ouvrir une pull request avec une description claire de ce que le script installe et pourquoi.
