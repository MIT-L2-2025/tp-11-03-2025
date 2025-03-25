#!/bin/bash
#exercice2-1
#Téléchargement de OSMTowns.txt

wget "https://emoutot.perso.math.cnrs.fr/static/teach/2018-2019/asr2/OSMTowns.txt" >/dev/null
if [ $? -eq 0 ]; then
    echo "File successfully downloaded"
else
    echo "Failed to download file"
fi



#exercice2_2
#Le nombre des villes
if [ ! -e "OSMTowns.txt" ]; then
    echo "OSMTowns.txt introuvable"
    exit 1
fi
ville=$(wc -l "OSMTowns.txt" | awk {'print $1'})
echo "Le nombre de ville est de $ville"



#exercice2_3
#la ville la plus à l'Est et la plus à l'Ouest
if [ ! -e "OSMTowns.txt" ]; then
    echo "OSMTowns.txt introuvable"
    exit 1
fi
est=$(tr '\t' ';' <OSMTowns.txt | sort -k2 -n -t ';' | head -1 | awk -F';' {'print $1'})
ouest=$(tr '\t' ';' <OSMTowns.txt | sort -k2 -nr -t ';' | head -1 | awk -F';' {'print $1'})
echo "La ville, la plus à l'EST est $est,et à l'OUEST $ouest"



#exercice2_4
#Coordonnée d'une ville
if [ ! -e "OSMTowns.txt" ]; then
    echo "OSMTowns.txt introuvable"
    exit 1
fi
grep -i "$1" OSMTowns.txt >>/dev/null
if [ $? -ne 0 ]; then
    echo "Ville introuvable"
    exit 1
fi
LATLONG=$(grep -i "^$1" OSMTowns.txt | head -n1 | tr '\t' ';')
LAT=$(echo "$LATLONG" | cut -d";" -f3)
LONG=$(echo "$LATLONG" | cut -d ";" -f2)
VIL=$(echo "$LATLONG" | cut -d ";" -f1)
echo "La ville $VIL a pour latitude $LAT et longitude $LONG"



#exercice2_5
#Coordonnée d'une ville
if [ ! -e "OSMTowns.txt" ]; then
    echo "OSMTowns.txt introuvable"
    exit 1
fi

grep -i "$1" OSMTowns.txt >>/dev/null
if [ $? -ne 0 ]; then
    echo "Ville introuvable"
    exit 1
fi

LATLONG=$(grep -i "^$1" OSMTowns.txt | head -n1 | tr '\t' ';')
LAT=$(echo "$LATLONG" | cut -d";" -f3)
LONG=$(echo "$LATLONG" | cut -d ";" -f2)
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG"




#exercice2_6
#Coordonnée d'une ville
if [ ! -e "OSMTowns.txt" ]; then
    echo "OSMTowns.txt introuvable"
    exit 1
fi
grep "chien" OSMTowns.txt
grep "[cC]hat" OSMTowns.txt