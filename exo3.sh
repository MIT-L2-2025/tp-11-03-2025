#!/bin/bash

#exo3-1)
ville=$(grep ^$1 OSMTowns.txt | head -n1)
Lyon=$(grep Lyon OSMTowns.txt | head -n1)

nom_ville=$(echo "$ville" | cut -d$'\t' -f1)
longitude_ville=$(echo "$ville" | cut -d$'\t' -f2)
latitude_ville=$(echo "$ville" | cut -d$'\t' -f3)

longitude_lyon=$(echo "$Lyon" | cut -d$'\t' -f2)
latitude_lyon=$(echo "$Lyon" | cut -d$'\t' -f3)
distance=$(python gps-dist.py $latitude_ville $longitude_ville $latitude_lyon $longitude_lyon)
echo "distance entre Lyon et $nom_ville est $distance"


#exo3-2)
if [ -z "$2" ]; then
    echo "Usage: $0 ville"
    exit 1
fi
VILLE="$2"
REPONSE=$(curl -s "https://fr.wikipedia.org/w/api.php?action=query&titles=$VILLE&prop=pageimages&pithumbsize=500&format=json")

LIEN_IMAGE=$(echo "$REPONSE" | grep -o '"source":"[^"]*' | sed 's/"source":"//' | head -n 1)

if [ -z "$LIEN_IMAGE" ]; then
    echo "Aucune image trouvée pour $VILLE sur Wikipédia."
    exit 1
fi

echo "$LIEN_IMAGE"