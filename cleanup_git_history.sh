#!/bin/bash

# Nettoie l'historique des commits Git en transformant le commit actuel en le commit initial

BRANCH_NAME="main"

# Checkout vers une branche temporaire
git checkout --orphan latest_branch

# Ajoute tous les fichiers du projet pour le prochain commit
git add -A

# Fait le commit initial
git commit -am "Initial Commit"

# Supprime la branche $BRANCH_NAME
git branch -D $BRANCH_NAME

# Renomme la branche temporaire en $BRANCH_NAME
git branch -m $BRANCH_NAME

# Pousse les changements vers la branche $BRANCH_NAME
git push -f origin $BRANCH_NAME

# Supprime les anciens fichiers
git gc --aggressive --prune=all

echo "Nettoyage de l'historique des commits terminé avec succès !"
