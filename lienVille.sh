#! /bin/bash

townName=$1
fichier="OSMTowns.txt"
trouve=0

#verifier si l'utilisateur a bien donne un argument 
if [ "$#" -eq 0 ]; then
	echo "aucun argument n'a été passer"
	echo "Usage : $0 <NomDeVille>"
	exit 1
fi


# Verifier si le fichier existe
if [ ! -f "$fichier" ]; then
    echo "Erreur : le fichier '$fichier' n'existe pas."
    exit 1
fi

# lire ligne par ligne 
while IFS=$'\t' read -r ville longitude latitude; do
	#ignorer l'en-tête
	if [[ "$ville" == "NomVille" ]]; then
		continue
	fi

#verifier si la  ville correspond a la ville rechercher 
	if [[ "$ville" == "$townName" ]]; then
		echo "Coordonnées de $townName : https://www.openstreetmap.org/#map=18/$longitude/$latitude"
		trouve=1
		break
	fi

done < "$fichier"


# Verifier si la ville n'a pas ete trouvee
if [[ "$trouve" -eq 0 ]]; then
    echo "Erreur : la ville '$townName' n'a pas été trouvée dans le fichier."
    exit 1
fi
