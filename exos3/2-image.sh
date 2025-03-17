#!/bin/bash

# Vérifier qu'un argument est fourni
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <nom_de_la_ville>"
    exit 1
fi

city="$1"

# Remplacer les espaces par des underscores pour correspondre au format des titres Wikipedia
city_url=$(echo "$city" | sed 's/ /_/g')

# URL de l'API MediaWiki (ici sur fr.wikipedia.org) pour récupérer la propriété "pageimages" avec l'image originale
api_url="https://fr.wikipedia.org/w/api.php?action=query&titles=${city_url}&prop=pageimages&piprop=original&format=xml"

# Utiliser curl pour récupérer le XML et extraire le lien de l'image à partir de l'attribut source
image_url=$(curl -s "$api_url" | grep -o 'source="[^"]*"' | head -n 1 | sed 's/source="//; s/"//')

if [ -z "$image_url" ]; then
    echo "Aucune image trouvée pour '$city'."
    exit 1
fi

echo "$image_url"
