#!/bin/bash

# Vérification du téléchargement
if [ ! -f OSMTowns.txt ]; then
    echo "Erreur : le fichier OSMTowns.txt n'existe pas."
    exit 1
fi

echo "La ville la plus a l'ouest est :"
LANG=EN sort -t$'\t' -n -k2 OSMTowns.txt | head -n 1
