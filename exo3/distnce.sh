#!/bin/bash



lionLat=45.764043
lionLong=4.8356559

lat=$(cat 'OSMTowns.txt' | grep $1 | cut -f2)
long=$(cat 'OSMTowns.txt' | grep $1 | cut -f3)

distance=""

if [ -z "$lat" ] && [ -z "$long" ] ;
then
	echo "Nom de la ville introuvable"
	exit 1
fi


#Calcule de la distance a partir de Lion
distance=$(python3 gps-dist.py "$lionLat" "$lionLong" "$lat" "$long")

echo "Entre Lion et $1 il y a $distance"


exit 0
