#!/bin/bash

API_URL="https://fr.wikipedia.org/w/api.php"
#curl -s "$API_URL?action=query&format=json&list=search&srsearch=gps-dist.py" | jq '.query.search[] | {title: .title, snippet: .snippet}'
#python3 -c 'import requests; r = requests.get("https://fr.wikipedia.org/w/api.php?action=query&format=json&titles=Python_(langage)&prop=extracts&exintro=1"); print(r.json())'


# 🔍 Étape 1 : Récupérer du contenu d'une page Wikipedia via MediaWiki API
PAGE_TITLE="$1"
echo "🔍 Récupération de la page Wikipedia : $PAGE_TITLE"
#WIKI_CONTENT=$(curl -s "$API_URL?action=query&format=json&titles=$PAGE_TITLE&prop=extracts&exintro=1" | jq -r '.query.pages[].extract')

IMAGE_URL=$(curl -s "$API_URL?action=query&format=json&titles=$PAGE_TITLE&prop=pageimages&pithumbsize=500" | jq -r '.query.pages[].thumbnail.source')

if [ "$IMAGE_URL" == "null" ]; then
    echo "❌ Aucune image trouvée pour cette page."
    exit 1
fi

echo "📸 URL de l'image trouvée : $IMAGE_URL"

# Télécharger l'image
echo "📥 Téléchargement de l'image..."
wget -O wikipedia_image.jpg "$IMAGE_URL"

echo "✅ Image téléchargée sous 'wikipedia_image.jpg'."
xdg-open wikipedia_image.jpg  # Ouvre avec la visionneuse d'images par défaut



# Afficher le contenu récupéré
#echo "📄 Contenu extrait :"
#echo "$WIKI_CONTENT"

# 🐍 Étape 2 : Exécuter un script Python
echo "🚀 Exécution du script Python..."
LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
#
#^ tabulation character
# We use a head as the output might contain multiple city
# named the same way.
ville_lat=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
ville_long=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville $1 a pour latitude $ville_lat et longitude $ville_long"

LATLONG=$(grep "Lyon" OSMTowns.txt|head -n1)
Lyon_lat=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
Lyon_long=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)
echo "La ville de Lyon a pour latitude $Lyon_lat et longitude $Lyon_long"
#python3 gps-dist.py $Lyon_lat $Lyon_long $ville_lat $ville_longn code Python
PYTHON_RESULT=$(python3 gps-dist.py $Lyon_lat $Lyon_long $ville_lat $ville_long)

# 🔄 Étape 3 : Utiliser le résultat Python pour MediaWiki API
#echo "🔄 Résultat Python : $PYTHON_RESULT"
#echo "📤 Envoi du résultat à MediaWiki (exemple d'upload)..."

# Ici, tu peux ajouter une requête API pour modifier une page avec le résultat de Python
# Exemple : Ajouter le résultat dans une page utilisateur (nécessite un token et authentification)

