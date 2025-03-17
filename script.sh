#!/bin/bash

while true; do
	echo "1 - Display of lines"
	echo "2 - Coordinates of a city "
	echo "3 - Search word in file"
	echo "exit - Quit"
	read -p "Enter your choose : " choix

	[[ "$choix" == "exit" ]] && break

	#Affichage contenue d'un fichier
	if [[ "$choix" == "1" ]];then
		bash Intervalle.sh
	elif [[ "$choix" == "2" ]]; then
		bash coordonne.sh
	elif [[ "$choix" == "3" ]]; then
		bash WordSearch.sh
	fi
done
