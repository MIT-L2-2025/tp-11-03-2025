#!/bin/bash
#OSMTowns Longitude Latitude
echo "Ville la plus à l'ouest de la France : " #La ville avec la longitude la plus petite
LAN=EN sort -t $'\t' -k2,2n OSMTowns.txt | head -n1 #La premiere ligne
echo "Ville la plus à l'est de la France : " #La ville avec la longitude la plus grande
LAN=EN sort -t $'\t' -k2,2n OSMTowns.txt | tail -n1 #La derniere ligne
