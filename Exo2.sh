#!/bin/bash

#n°2:
echo "Nombre de ville = $(wc -l OSMTowns.txt)"

#######################################################################################
echo "Affichage de ville le plus à l'Est ou et le plus à l'Ouest"
ville_plus_Est=$(LANG=EN  sort -t $'\t' OSMTowns.txt -nr --key=2|head -n 1)
echo  $ville_plus_Est": la ville la plus à l'Est"
ville_plus_Ouest=$(LANG=EN sort -t $'\t' OSMTowns.txt -n  --key=2|head -n 1)
echo $ville_plus_Ouest":la ville la plus à l'ouest"

#######################################################################################
LATLONG=$(grep "^$1 " OSMTowns.txt|head -n1)
if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi
LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)
echo "La ville $1 a pour latitude $LAT et longitude $LONG\n"

#######################################################################################
LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
if [ -z "$LATLONG" ];
then
    echo "Nom de ville non trouvé"
    exit 1
fi
LAT=$(echo "$LATLONG" |cut -d$'\t' --fields=3)
LONG=$(echo "$LATLONG" |cut -d$'\t' --fields=2)
echo "https://www.openstreetmap.org/#map=18/$LAT/$LONG\n"

#######################################################################################
echo "//////////////////////////////////////////////////////"
echo "Affichage des villes qui a de mot 'chien' dans leur nom: \n"
grep "chien" OSMTowns.txt 
echo "//////////////////////////////////////////////////////"
echo "Affichage des villes qui a de mot 'chat/Chat' dans leur nom: \n"
grep "\(chat\|Chat\)" OSMTowns.txt 
#(ou grep -i "chat" OSMTowns.txt)




