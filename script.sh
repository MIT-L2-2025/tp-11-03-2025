#!/bin/bash
function afficher_ligne() {
	cat -n "$nom_fichier" | column -t -s ':' | head -n $arg | tail -n 1
}


function traiter_lignes() {
	last_ligne=$(wc -l "$nom_fichier" | cut -d ' ' -f 1)
	for arg in $lignes; do
		afficher_ligne
	done
}

function afficher_fichier() {
	echo -e "Entrer le nom du fichier à afficher"
	read -p "> " nom_fichier
	if [ -f "$nom_fichier" ]; then
		cat -n "$nom_fichier" | column -t -s ':'
		read -p "Voulez-vous afficher des lignes spécfiques ? (Y/n): " rep
		if [[ $rep == 'Y' || $rep == 'y' ]]; then
			echo "Entrer les lignes à afficher"
			read -p "> " lignes
		       traiter_lignes lignes	
		fi
	else 
		echo "Fichier introuvable !"
	fi
}

function processus_gourmand() {
	echo "Consommation en:"
	echo -e "\t1 - CPU"
	echo -e "\t2 - Mémoire"
	read -p "> " choix
	case $choix in
		1)
        		echo "Processus le plus gourmand en CPU :"
        		top -b -n 1 | grep "^[ ]*[0-9]" | sort -nrk 9 | head -1
			;;
    		2)
       			echo "Processus le plus gourmand en Mémoire :"
        		top -b -n 1 | grep "^[ ]*[0-9]" | sort -nrk 10 | head -1
			;;
    		*)
        		echo "Choix invalide."
			;;
    	esac
}

while true; do
	echo -e "MENU\n\t1 - Afficher un fichier sous forme de tableau"
	echo -e "\t2 - Afficher les processus gourmands en ressources"
	echo -e "\t0 - Quitter"
       	read -p "Entrer votre choix: " choix
	
	case $choix in
		1)
			afficher_fichier
			;;
		2)
			processus_gourmand	
			;;
		0)
			break
			;;
		*)
			echo "Choix invalide"
			;;
	esac		

done
