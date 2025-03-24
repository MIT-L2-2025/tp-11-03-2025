#!/bin/bash

#exo2-1)
wget "http://perso.ens-lyon.fr/etienne.moutot/static/teach/2018-2019/asr2/OSMTowns.txt"

#exo2-2)
wc -l OSMTowns.txt

#exo2-3)
echo "La ville la plus a l'Ouest de France : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|head -n 1
echo "La ville la plus a l'Est de France  : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|tail -n 1

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
