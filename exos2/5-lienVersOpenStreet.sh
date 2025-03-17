#!/bin/bash

# Recherche la ligne correspondant au premier argument dans le fichier OSM.txt
# Utilise grep pour trouver la ligne et head pour prendre la première correspondance
LATLONG=$(grep -P "^$1\s" OSM.txt | head -n 1)

# Vérifie si aucune donnée n'a été trouvée
if [ -z "$LATLONG" ]; then
  echo "Aucune donnée trouvée pour $1"
  exit 1
fi

# Extrait la latitude et la longitude de la ligne trouvée
LAT=$(echo "$LATLONG" | cut -d$'\t' -f3)
LON=$(echo "$LATLONG" | cut -d$'\t' -f2)

# Affiche les coordonnées trouvées
echo "https://www.openstreetmap.org/#map=18/$LAT/$LON"