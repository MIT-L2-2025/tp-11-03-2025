#Cette script compte le nombre de ligne dans un fichier avec un format precis
#	Nom_de_la_ville'\t'latitude'\t'longitude


#!bin/bash


#solution de l'exercice
nbrVille=$(wc -l $ficName | cut -d' ' -f 1)


echo "Il y a $nbrVille ville"


exit 0
