#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 \"nom_de_la_ville\""
    exit 1
fi

ville="$1"

API_URL="https://fr.wikipedia.org/w/api.php"

PARAMS="action=query&titles=${ville}&prop=pageimages&pithumbsize=600&format=json&formatversion=2"

PARAMS=$(echo -n "$PARAMS" | sed 's/ /%20/g')

response=$(curl -s "${API_URL}?${PARAMS}")

if echo "$response" | grep -q "missing"; then
    echo "Erreur : La page pour '$ville' n'existe pas sur Wikipédia en français."
    exit 1
fi

image_url=$(echo "$response" | jq -r '.query.pages[0].thumbnail.source // "Aucune image trouvée"')

if [ "$image_url" = "Aucune image trouvée" ]; then
    echo "Aucune image associée à '$ville' n'a été trouvée."
else
    echo "Lien de la première image pour '$ville' : $image_url"
fi