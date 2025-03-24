#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <nom_de_ville>"
    exit 1
fi

if [ ! -f "OSMTowns.txt" ]; then
    echo "Erreur : Le fichier OSMTowns.txt n'existe pas."
    exit 1
fi

LYON_INFO=$(grep -i "^lyon" OSMTowns.txt | head -n 1)

LyonLat=$(echo "$LYON_INFO" | awk '{print $2}')
LyonLog=$(echo "$LYON_INFO" | awk '{print $3}')

# Recuperer les coordonnees de la ville passee en argument
VILLE_INFO=$(grep -i "^$1" OSMTowns.txt | head -n 1)
nomville=$(echo "$VILLE_INFO" | awk '{print $1}')
villeLat=$(echo "$VILLE_INFO" | awk '{print $2}')
villeLog=$(echo "$VILLE_INFO" | awk '{print $3}')

# Verifier si les coordonnees ont ete trouvees
if [ -z "$villeLat" ] || [ -z "$villeLog" ]; then
    echo "Erreur : Ville '$1' non trouvee dans OSMTowns.txt."
    exit 1
fi

echo "La distance de lyon a $nomville est de : "
python3 gps-dist.py "$LyonLat" "$LyonLog" "$villeLat" "$villeLog"
