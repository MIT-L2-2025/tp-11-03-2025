
#! /bin/bash

#Compter le nombre de ligne dans le fichier 
nb_ligne=$(wc -l < OSMTowns.txt)

#afficher le résultat
echo "Le nombre de ville est $nb_ligne"
