#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <nom_de_ville>"
    exit 1
fi

URL=$(./image.sh "$1")
distances=$(./distance.sh "$1" | tail -1)

if echo "$distances" | grep -q "non trouve"; then
    echo "$1 est non trouve dans OSMTowns.txt"
    exit 1
fi

if echo "$URL" | grep -q "non trouve"; then
    echo "Image non trouvee pour $1"
    exit 1
fi

echo "Telechargement de l'image..."
wget -q "$URL" -O "image/$1.jpg"

if [ ! -f "image/$1.jpg" ]; then
    echo "Erreur lors du telechargement de l'image."
    exit 1
fi

echo "Ajout de l'annotation..."
distances_entier=${distances%.*}
convert "image/$1.jpg" -fill black -pointsize 40 -gravity South -background yellow -splice 0x50 -gravity South -annotate +0+10 "$1 : $distances_entier km de Lyon" "image/$1-Distance.jpg"

echo "Fichier avec distance a Lyon : image/$1-Distance.jpg"
