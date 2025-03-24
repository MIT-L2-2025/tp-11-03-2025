#!/bin/bash

#1
wget "http://perso.ens-lyon.fr/etienne.moutot/static/teach/2018-2019/asr2/OSMTowns.txt"

#2
nb_ligne=$(wc -l < OSMTowns.txt)
echo "Le nombre de villes est $nb_ligne"

#3
echo "La ville la plus a l'Ouest de France : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1
echo "La ville la plus a l'Est de France  : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 --reverse | head -n 1

#4
LATLONG=$(grep "^$1$(printf '\t')" OSMTowns.txt | head -n1)

LAT=$(echo "$LATLONG" | cut -d"$(printf '\t')" -f3)
LONG=$(echo "$LATLONG" | cut -d"$(printf '\t')" -f2)

echo "La ville $1 a pour latitude $LAT et longitude $LONG"

#5
echo "Lien de coordonnees : https://www.openstreetmap.org/#map=18/$lat/$long"

#6
grep "chien" OSMTowns.txt
grep -i "chat" OSMTowns.txt