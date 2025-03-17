#!/bin/bash

# Vérifier qu'un argument est fourni
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <nom_de_la_ville>"
    exit 1
fi

city="$1"

# 1. Récupérer l'image de la ville
image_url=$(bash 2-image.sh "$city")

if [ -z "$image_url" ]; then
    echo "Aucune image trouvée pour '$city'."
    exit 1
fi

# 2. Calculer la distance entre la ville et Lyon
distance=$(bash 1-distanceALyon.sh "$city")

if [ -z "$distance" ]; then
    echo "Erreur de calcul de la distance."
    exit 1
fi

# 3. Télécharger l'image
wget -O "${city}.jpg" "$image_url"

# 4. Ajouter le texte de la distance sur l'image avec ImageMagick
convert "${city}".jpg -gravity south -background black -fill white -pointsize 40 -splice 0x50 -annotate +0+10 "Distance à Lyon : ${distance} km" "${city}.jpg"

echo "Image créée : ${city}.jpg"
