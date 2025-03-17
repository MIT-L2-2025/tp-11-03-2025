#!/bin/bash
echo -e "1.Compter le nombre de ville"
echo -e "2.Ville la plus à l'Ouest et la plus à l'Est de la France"
echo -e "3.Coordonnees GPS d'une ville"
echo -e "4.Renvoi lien"
echo -e "5.Ville contenant \"chien\""
echo -e "6.Ville contenant \"Chat\" ou \"chat\"\n"
echo -e ">> Votre choix: "; read choix;
fic="OSMTowns.txt"
case $choix in 
	1*)
		str=$(wc -l $fic)
		nombre_ville=$(echo "$str" | cut -d' ' -f1)
		echo -e "Il y a $nombre_ville villes\n"
		;;
	2*)
		echo "Le plus à l'Ouest est :";LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|head -n 1
		echo "Le plus à l'Est est :"; LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|tail -n 1
		;;
	3*)
		echo -e "Entrer le nom de la ville: "; read ville;		
		LATLONG=$(grep "^$ville	" OSMTowns.txt|head -n1)	
		LAT=$(echo "$LATLONG" | cut -d'	' -f3)
		LONG=$(echo "$LATLONG" | cut -d'	' -f2)
		echo "La ville $ville a pour latitude $LAT et longitude $LONG"
		;;
	4*)
		echo -e "Entrer le nom de la ville: "; read ville;		
		LATLONG=$(grep "^$ville	" OSMTowns.txt|head -n1)	
		LAT=$(echo "$LATLONG" | cut -d'	' -f3)
		LONG=$(echo "$LATLONG" | cut -d'	' -f2)
		echo "https:/www.openstreetmap.org/#map=18/$LAT/$LONG"
		;;
	5*)
		echo "L'ensemble des villes contenant \"chien\": "
		grep "chien" OSMTowns.txt | cut -d'	' -f1
		;;
	6*) 	echo "L'ensemble des villes contenant \"chat\" ou \"Chat\": "
		grep -i "chat" OSMTowns.txt | cut -d'	' -f1
		;;
	*)
		echo "Indispo"
		;;	
esac
