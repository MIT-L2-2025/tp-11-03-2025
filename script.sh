#Exercice 2.
	#1-Téléchargement du fichier OSMTowns.txt
		#$ wget "https://emoutot.perso.math.cnrs.fr/static/teach/2018-2019/asr2/OSMTowns.txt"
		#$ curl "https://emoutot.perso.math.cnrs.fr/static/teach/2018-2019/asr2/OSMTowns.txt" > OSMTowns.txt
		
	#2-Pour savoir le nombre de villes
		#$ wc -l OSMTowns.txt
	
	#3-La ville la plus à l’Ouest de la France et la ville la plus à l’Est de la France
		#!/bin/bash
		data="OSMTowns.txt"
		w=`LANG=EN sort $data --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1`
		e=`LANG=EN sort $data --field-separator=$'\t' --general-numeric-sort --key=2 | tail -n 1`
		echo "La ville la plus à l'Ouest est : "$w
		echo "La ville la plus à l'Est est : "$e
		
		
	#4-Script shell coordoonees qui prend en argument le nom d’une ville et qui renvoie ses coordoonees GPS
		read -p "Entrer une ville de France :" v
		long=`grep $v $data | head -n 1 | cut -d"	" -f2`
		lat=`grep $v $data | head -n 1| cut -d"	" -f3`
		echo "La ville $v a pour longitude $long et latitude $lat"
		
	#5-Script shell qui prend en argument le nom d’une ville et renvoie un lien du type https://www.openstreetmap.org/#map=18/45.72980/4.82712 (en remplaçant 45.72980 par la latitude de la ville et 4.82712 par sa longitude)
		read -p "Entrer une ville de France :" v
		long=`grep $v $data | head -n 1 | cut -d"	" -f2`
		lat=`grep $v $data | head -n 1| cut -d"	" -f3`
		echo "https://www.openstreetmap.org/#map=18/$lat/$long"
		
	#6-Utilisation de la commande grep pour afficher l’ensemble des villes contenant "chien" dans leur nom. En une seule utilisation de grep, trouver l’ensemble des villes contenant "Chat" ou "chat"
		grep "chien" $data
		grep -E "chat|Chat" $data
