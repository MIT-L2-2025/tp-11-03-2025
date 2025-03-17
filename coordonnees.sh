#!/bin/bash

#exo2-4)
latlong=$(grep ^$1 OSMTowns.txt | head -n1)
echo "$latlong"
name_ville=$(echo "$latlong" | cut -d$'\t' --field=1)
lat=$(echo "$latlong" | cut -d$'\t' --field=3)
long=$(echo "$latlong" | cut -d$'\t' --field=2)

echo "Coordonnées de $name_ville : latitude : $lat , longitude : $long"

#exo2-5)
echo "Lien de coordonnees : https://www.openstreetmap.org/#map=18/$lat/$long"

#exo2-6)
grep "chien" OSMTowns.txt
grep -i "chat" OSMTowns.txt

