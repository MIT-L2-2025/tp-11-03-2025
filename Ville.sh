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
