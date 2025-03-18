#!/bin/bash

BOLD="\033[1m"
NORMAL="\033[0m"
WHITE="\033[37m"
RED="\033[31m"

command -v convert >/dev/null 2>&1 || { echo >&2 "Erreur: ImageMagick doit être installé."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "Erreur: jq doit être installé."; exit 1; }
[ -f "OSMTowns.txt" ] || { echo >&2 "Erreur: Fichier OSMTowns.txt manquant."; exit 1; }
[ -f "gps-dist.py" ] || { echo >&2 "Erreur: Fichier gps-dist.py manquant."; exit 1; }

API_URL="https://fr.wikipedia.org/w/api.php"
USER_AGENT="MonScriptWikipédia/1.0 (contact@exemple.fr)"
LYON="Lyon"
CITY="$1"
FINAL_IMAGE="${CITY// /_}.jpg"

IMAGE_URL=$(curl -s -G -A "$USER_AGENT" "$API_URL" --data-urlencode "titles=$CITY" -d "action=query" -d "prop=pageimages" -d "pithumbsize=1200" -d "format=json" | jq -r '.query.pages[].pageimage // empty')

[ -z "$IMAGE_URL" ] && { echo "Aucune image trouvée pour '$CITY'"; exit 1; }

IMG_LINK="https://commons.wikimedia.org/wiki/Special:FilePath/${IMAGE_URL// /_}"
echo -e "${BOLD}Téléchargement en cours....${NORMAL}"
wget --no-verbose --show-progress "$IMG_LINK" -O "$FINAL_IMAGE"

if [ ! -f "$FINAL_IMAGE" ]; then
    echo -e "${RED}${BOLD}Erreur du téléchargement.${NORMAL}"
    exit 1
fi

LYON_DATA=$(grep -iP "^${LYON}\t" OSMTowns.txt | head -n1)
CITY_DATA=$(grep -iP "^${CITY}\t" OSMTowns.txt | head -n1)

[ -z "$CITY_DATA" ] && { echo "Coordonnées non trouvées pour '$CITY'"; exit 1; }

LAT=$(echo "$CITY_DATA" | cut -d$'\t' -f3)
LON=$(echo "$CITY_DATA" | cut -d$'\t' -f2)
LYON_LAT=$(echo "$LYON_DATA" | cut -d$'\t' -f3)
LYON_LON=$(echo "$LYON_DATA" | cut -d$'\t' -f2)

DISTANCE=$(python3 gps-dist.py "$LAT" "$LON" "$LYON_LAT" "$LYON_LON")

convert "$FINAL_IMAGE" -resize 800x600\> -bordercolor white -border 20x20 -gravity south -splice 0x40 --font "DejaVu-Sans" -pointsize 24 -fill black -annotate +0+20 "$CITY : Distance à $LYON : $DISTANCE km" "$FINAL_IMAGE"

echo -e "${BOLD}Téléchargement terminé.${NORMAL}"
echo "Image générée : $FINAL_IMAGE"
