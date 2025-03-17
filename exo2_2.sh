#!/bin/bash
echo "2)Compter le nombre de villes:"
echo "commande:wc -l \"OSMTowns.txt\""
echo  -n "resultat: " 
wc -l "OSMTowns.txt"
echo -e "\n"
echo "3)-La ville le plus à l'Est de France:"
echo "commande:sort -k2 -nr \"OSMTowns.txt\""
echo  -n "resultat: " 
sort -k2 -nr "OSMTowns.txt" |head -n1
echo -e "\n"
echo "-La ville le plus à l'Ouest de France:"
echo "commande:sort -k2 -n \"OSMTowns.txt\""
echo  -n "resultat: " 
sort -k2 -n "OSMTowns.txt" |head -n1

