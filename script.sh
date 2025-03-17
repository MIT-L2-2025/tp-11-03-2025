#!/bin/bash

while true; do
	echo "[1]. Affichage ligne specifique d'un fichier"
	echo "[2]. Coordonnees d'une ville "
	echo "[3]. Cherche mot dans un fichier"
	echo "[4]. Kill un proc +70% (mem / cpu)"
	echo "[exit]. quitter"
	read choix

	[[ "$choix" == "exit" ]] && break

	#Affichage contenue d'un fichier
	if [[ "$choix" == "1" ]];then
		read -p "fichier : " fic 
		if [[ -f $fic ]]; then 
			read -p "nb ligne de depart : " depart
			read -p "nb ligne d'arret : " arret
			#s=$(wc -l $1 | awk {'print $1'})
			#-gt: greater than != -lt
			if [ $depart -gt $arret ]; then
 	 			 echo "Ligne de depart et d'arret invalid !"
				#   exit
			else
  	 			nb=$(($arret-$depart+1))
 	  			cat -n $fic | head -$arret | tail -$nb | tr ':' '\t'
			fi
		else 
			echo "$fic n'est pas un fichier"
		fi
	elif [[ "$choix" == "2" ]]; then
		bash coordonne.sh
	elif [[ "$choix" == "3" ]]; then
		read -p "mot a rechercher : " mot
		read -p "fichier : " fic
		if [[ -f $fic ]]; then
			s=$(grep -i "$mot" $fic)
			if [[ $s -eq 0 ]]; then
				echo "aucun $mot dans $fic"
			else 
				grep -i "$mot" $fic
			fi
		else echo "$fic n'est pas un fichier"
		fi
	elif [[ "$choix" == "4" ]]; then
		proc=$(top -b -n 1 | awk 'NR>7' | head -n 1)
		cpu=$(echo "$proc" | awk '{print $9}')
		mem=$(echo "$proc" | awk '{print $10}')

		if [[ $cpu -gt 70 || $mem -gt 70 ]]; then
			pid=$(echo "$proc" | awk '{print $1}')
			p_name=$(echo "$proc" | awk '{print $12}')
			sudo kill -9 $pid
			echo "killing $p_name..."
		else	echo "Aucun proc qui consomme +70%( mem / cpu )"
		fi
	fi
done
