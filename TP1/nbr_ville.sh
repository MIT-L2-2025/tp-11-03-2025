#!/bin/bash

# Vérification
if [ ! -f OSMTowns.txt ]; then
    echo "Erreur : le fichier OSMTowns.txt est introuvable ."
    exit 1
fi

echo "Nombre de villes : $(wc -l < OSMTowns.txt)"
