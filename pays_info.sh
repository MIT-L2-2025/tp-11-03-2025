#!/bin/bash

# Vérifier si une ville est passée en argument
if [ -z "$1" ]; then
    echo "Usage: $0 <Nom de la ville>"
    exit 1
fi

VILLE="$1"
FICHIER_COORDONNEES="../devoir2/OSMTowns.txt"  # Chemin relatif vers OSMTowns.txt
IMAGE_OUTPUT="image_${VILLE}.jpg"

# Vérifier si le fichier des coordonnées existe
if [ ! -f "$FICHIER_COORDONNEES" ]; then
    echo "Le fichier $FICHIER_COORDONNEES est introuvable."
    exit 1
fi

# Récupérer les coordonnées de la ville
COORDONNEES=$(grep -i "^${VILLE}\t" "$FICHIER_COORDONNEES" | head -n 1)
if [ -z "$COORDONNEES" ]; then
    echo "Ville non trouvée dans le fichier des coordonnées."
    exit 1
fi

LONG=$(echo "$COORDONNEES" | cut -f2)
LAT=$(echo "$COORDONNEES" | cut -f3)

# Coordonnées de Lyon
LONG_LYON=4.8357
LAT_LYON=45.7640

# Calculer la distance à Lyon en utilisant gps-dist.py
DISTANCE=$(python3 gps-dist.py "$LAT_LYON" "$LONG_LYON" "$LAT" "$LONG")
DISTANCE=$(printf "%.0f" "$DISTANCE")  # Arrondir à l'entier le plus proche

echo "La distance entre $VILLE et Lyon est de $DISTANCE km."

# Rechercher une image de la ville via l'API de Wikimedia Commons
IMAGE_URL=$(curl -s "https://commons.wikimedia.org/w/api.php?action=query&titles=File:${VILLE}.jpg&prop=imageinfo&iiprop=url&format=json" | jq -r '.query.pages[].imageinfo[0].url')

if [ -z "$IMAGE_URL" ] || [ "$IMAGE_URL" = "null" ]; then
    echo "Aucune image trouvée pour $VILLE."
    exit 1
fi

# Télécharger l'image
wget -O "$IMAGE_OUTPUT" "$IMAGE_URL"

# Vérifier si l'image a été téléchargée
if [ ! -f "$IMAGE_OUTPUT" ]; then
    echo "Le téléchargement de l'image a échoué."
    exit 1
fi

# Ajouter le texte sur l'image en utilisant ImageMagick
convert "$IMAGE_OUTPUT" -gravity south -pointsize 24 -fill white -annotate +0+10 "$VILLE - Distance à Lyon : ${DISTANCE} km" "$IMAGE_OUTPUT"

echo "L'image annotée a été sauvegardée sous le nom $IMAGE_OUTPUT."
