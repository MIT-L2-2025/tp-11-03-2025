#!/bin/bash
echo -e "Nombre de ville de France"

cat -n OMTowns.txt >OMTownsbis.txt	#Numerotation de tous les villes et redirection vers un fichier temporaire
cut -f1 OMTownsbis.txt>nbVille	#Le dernier correspond au nombre de ville donc rediriger ce nombre dans un fichier temporaire
nb=$(cat nbVille)		#Après création de la variable nb qui correspond au nombre de ville 
echo -e "Il existe $nb villes\n"


cut -f1,2 OMTowns.txt > Longitude.txt

echo -e "La ville la plus à l'Ouest:\n"
sort -k2,2n Longitude.txt |head -1

echo -e "La ville la plus à L'Est:\n"
sort -k2,2n Longitude.txt|tail -1

echo -e "Filtrage et Recherche de ville\n"
result=$(grep "$1" OMTowns.txt)
if [ -n "$result" ]; then 

	echo "$result"
	long=$(echo  $result|cut -f2)
	lat=$(echo -f3  $result|cut -f2)
	echo -e "#https://www.openstreetmap.org/#map=18/$long/$lat\n"
fi

echo -e "Recherge des villes au nom de chien chat et autre\n"
grep "chat" OMTowns.txt
grep -i "chat"	OMTowns.txt




# Vérifier si un argument (nom de ville) est fourni
if [ $# -ne 1 ]; then
    echo "Usage: $0 <nom_de_ville>"
    exit 1
fi

VILLE="$1"

# Récupérer les coordonnées GPS avec le script coordonnees
COORD=$(./coordonnees "$VILLE")
if [ -z "$COORD" ]; then
    echo "Coordonnées non trouvées pour $VILLE"
    exit 1
fi

# Extraire latitude et longitude
LAT=$(echo "$COORD" | cut -f2)
LON=$(echo "$COORD" | cut -f3)

# Coordonnées de Lyon (approximatives)
LYON_LAT=45.75
LYON_LON=4.85

# Calculer la distance (approximation simple en km)
# Formule simplifiée : distance = sqrt((lat2-lat1)² + (lon2-lon1)²) * 111
DISTANCE=$(echo "sqrt(($LAT - $LYON_LAT)^2 + ($LON - $LYON_LON)^2) * 111" | bc -l)
DISTANCE=$(printf "%.0f" "$DISTANCE")  # Arrondir à l'entier

# Récupérer l'URL de l'image avec le script image
IMAGE_URL=$(./image "$VILLE")
if [ -z "$IMAGE_URL" ]; then
    echo "Image non trouvée pour $VILLE"
    exit 1
fi

# Télécharger l'image temporairement
wget -q "$IMAGE_URL" -O temp.jpg

# Créer le texte à ajouter
TEXT="Distance depuis Lyon : ${DISTANCE} km"

# Utiliser convert (ImageMagick) pour ajouter le texte sous l'image
convert temp.jpg -gravity South -pointsize 20 -annotate +0+10 "$TEXT" image.jpg

# Nettoyer le fichier temporaire
rm temp.jpg

echo "Image générée : image.jpg"

