#!/bin/bash

BOLD="\033[1m"
NORMAL="\033[0m"
WHITE="\033[37m"
RED="\033[31m"

if [ $# -eq 0 ]; then
    echo -e "${BOLD}Usage: ${NORMAL}$0 {ville}"
    exit 1
fi

API_URL="https://fr.wikipedia.org/w/api.php"
CITY="$1"
USER_AGENT="MonScriptWikipédia/1.0 (contact@exemple.fr)"

IMAGE_URL=$(curl -s -G -A "$USER_AGENT" "$API_URL" \
    --data-urlencode "titles=$CITY" \
    -d "action=query" \
    -d "prop=pageimages" \
    -d "pithumbsize=1200" \
    -d "format=json" \
    | jq -r '.query.pages[].pageimage // empty')

if [ -z "$IMAGE_URL" ]; then
    echo -e "Aucune image trouvée pour ${BOLD}'${CITY}'${NORMAL}" >&2
    exit 1
fi

IMG_LINK=https://commons.wikimedia.org/wiki/Special:FilePath/${IMAGE_URL// /_}
echo -e "${BOLD}Téléchargement en cours de ${IMAGE_URL}....${NORMAL}"
wget -q $IMG_LINK 2>/dev/null
if [ -f "$IMAGE_URL" ]; then
    echo -e "${BOLD}Téléchargement términé.${NORMAL}"
else
    echo -e "${RED}${BOLD}Erreur du téléchargement.${NORMAL}"
fi

echo -e "Lien vers ${BOLD}${CITY}${NORMAL} : ${BOLD}${IMG_LINK}${NORMAL}"