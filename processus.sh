#!/bin/bash
function Menu()
{
	menu=("1-Arreter le processus qui consomme le plus de CPU et memoire"
		"2-Afficher de(s) ligne(s) d'un fichier"
		"3-Quitter")
	for menue in "${menu[@]}";do
	echo $menue
	done
}

function Menu1()
{
	menu1=("1-Ligne(s) specifique"
	"2-Ligne debut -> ligne fin")
	for menue in "${menu1[@]}";do
	echo $menue
	done
}

function process()
{
	process=$(top -b -n1 | grep -E '^\s*[1-9]' | head -n1) 
	pid=$(echo $process | awk '{print $1}') 
	cpu=$(echo $process | awk '{print $9}') 
	memoire=$(echo $process | awk '{print $10}')
	name=$(echo $process | awk '{print $12}') 
	if [[ $cpu -gt 50 && $memoire -gt 50 ]]; then
		sudo kill -9 $pid
		echo "La processus $name a été arreté"
	else
		echo "Il n'y a pas de processus à arreté"
	fi
}

function ligne_specifique()
{
	read -p "Nom du fichier :" nom
	read -p "Nombre de ligne que tu veux afficher :" nbre
	tab=()
	echo "Le(s) numero de ligne que tu veut afficher :"
	for ((i=0; i<$nbre; i++));do
		read tab[i]
	done
	for i in "${tab[@]}";do
		sudo cat $nom | head -n "$i" | tail -1
	done
}

function ligneDebut_fin()
{
	read -p "Nom du fichier :" nom
	read -p "Debut : " debut
	read -p "Fin : " fin
	let ligne=(fin-debut)+1
	sudo cat $nom | head -$fin | tail -$ligne
}

while true; do
	Menu
	read -p "=> Votre choix :" choix

	case $choix in 
		1)
			process
			;;
		2)
			Menu1
			read -p "Votre choix : " choix2
			case $choix2 in
			1)
				ligne_specifique
				;;
			2) 
				ligneDebut_fin
				;;
			esac
			;;
		3)
			break
			;;
	esac	
done			

