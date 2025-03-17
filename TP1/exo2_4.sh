#!/bin/bash

# Verification du nombre d'arguments
if [ -z "$1" ]; then
    echo "Usage: $0 <nom_de_ville>"
    exit 1
fi

# Recherche de la ville dans OSMTowns.txt
LATLONG=$(grep -i "^$1	" OSMTowns.txt | head -n1)

# Vérification si la ville a été trouvée
if [ -z "$LATLONG" ]; then
    echo "Erreur : Ville '$1' non trouvée dans OSMTowns.txt."
    exit 1
fi

# Extraction des coordonnees avec awk
LAT=$(echo "$LATLONG" | awk -F'\t' '{print $3}')
LONG=$(echo "$LATLONG" | awk -F'\t' '{print $2}')

echo "La ville $1 a pour latitude $LAT et longitude $LONG."
