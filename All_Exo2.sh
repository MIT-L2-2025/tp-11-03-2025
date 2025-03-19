#!/bin/bash

echo "2-Compter le nombre des villes "
echo "3-La ville le plus a l'ouest et le plus à l'est de france "
echo "4-Recherche coordonées d'une ville "
echo "5-Lien d'une ville "
echo "6-Recherche mot chien et chat "
read -p "entrez:" n

case $n in
    2)
        echo "-----------------------------------------------"
        echo "Compter le nombre de villes:"
        echo "commande:wc -l \"OSMTowns.txt\""
        echo  -n "resultat: " 
        wc -l "OSMTowns.txt"
    ;;
    3)
        echo "-----------------------------------------------"
        echo "La ville le plus à l'Est de France:"
        echo "commande:sort -k2 -nr \"OSMTowns.txt\""
        echo  -n "resultat: " 
        sort -k2 -nr "OSMTowns.txt" |head -n1
        echo -e "\n"
        echo "-La ville le plus à l'Ouest de France:"
        echo "commande:sort -k2 -n \"OSMTowns.txt\""
        echo  -n "resultat: " 
        sort -k2 -n "OSMTowns.txt" |head -n1

    ;;
    4)
        echo "-----------------------------------------------"
        read -p "entrez le nom du ville " ville
        echo "Coordoonées du ville $ville:"
        lat_long=$(grep "$ville" "OSMTowns.txt"|head -n1)
        long=$(echo "$lat_long" |cut  -f2)
        lat=$(echo "$lat_long" |cut  -f3)
        echo "La ville $ville a pour longitude $long et latitude $lat"

    ;;
    5)
        echo "-----------------------------------------------"
        read -p "entrez le nom du ville " ville
        lat_long=$(grep "$ville" "OSMTowns.txt"|head -n1)
        long=$(echo "$lat_long" |cut  -f2)
        lat=$(echo "$lat_long" |cut  -f3)
        echo "lien:"
        echo "https://www.openstreetmap.org/#map=18/$lat/$long"
    ;;
    6)
        echo "Affichage ville contenant chien dans leur nom:"
        echo "-----------------------------------------------"
        grep "chien" OSMTowns.txt
        echo "-----------------------------------------------"
        echo -e "\n"
        echo "Affichage ville contenant "Chat" ou "chat" dans leur nom:"
        echo "-----------------------------------------------"
        grep -i "chat" OSMTowns.txt
        echo "-----------------------------------------------"
    ;;
    *)
        echo "choix invalide"
    ;;
esac








