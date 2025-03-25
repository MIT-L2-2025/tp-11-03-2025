#!/bin/bash
VILLE=$1
#2.
NOMBRE_VILLE=$(wc -l < OSMTowns.txt)
echo "Il existe $NOMBRE_VILLE"

#3.
cut -f1,2 OSMTowns.txt > coordonne.txt
OUEST=$(sort -k2,2n coordonne.txt | head -1)
EST=$(sort -k2,2n coordonne.txt | tail -1)
echo "La ville la plus a l'ouest:$OUEST"
echo "La ville la plus a l'est:$EST"

#4.
LATITUDE=$(grep "$1" OSMTowns.txt | head -n1 | tr "\t" ";" | cut -f3 -d";")
LONGITUDE=$(grep "$1" OSMTowns.txt | head -n1 | tr "\t" ";" | cut -f2 -d";")

#5.
echo "La ville $1 a pour latitude $LATITUDE et longitude $LONGITUDE"
echo "https://www.openstreetmap.org/#map=18/$LATITUDE/$LONGITUDE"

#6.
grep "chien" OSMTowns.txt
grep -i "chat" OSMTowns.txt

#Exercice 3
LYON_LATITUDE=$(grep "Lyon" OSMTowns.txt | head -n1 | tr "\t" ";" | cut -f3 -d";")
LYON_LONGITUDE=$(grep "Lyon" OSMTowns.txt | head -n1 | tr "\t" ";" | cut -f2 -d";")

DISTANCE_LYON=$(python3 gps-dist.py $LYON_LATITUDE $LYON_LONGITUDE $LATITUDE $LONGITUDE)

echo "La distance $DISTANCE_LYON"

# Récupérer l'URL de l'image
IMAGE_URL=$(wget -qO- "https://fr.wikipedia.org/w/api.php?action=query&titles=$VILLE&prop=images&format=json" | \
            jq -r '.query.pages | to_entries | .[0].value.images[0].title' | \
            xargs -I {} wget -qO- "https://fr.wikipedia.org/w/api.php?action=query&titles={}&prop=imageinfo&iiprop=url&format=json" | \
            jq -r '.query.pages | to_entries | .[0].value.imageinfo[0].url')

# Télécharger l'image
wget -q "$IMAGE_URL" -O city_image.jpg

# Créer l'image avec le texte indiquant la distance
convert city_image.jpg -gravity south -pointsize 20 -annotate +0+10 "Distance à Lyon : $DISTANCE_LYON km" image.jpg

# Afficher le résultat
echo "L'image avec la distance a été créée sous le nom 'image.jpg'."