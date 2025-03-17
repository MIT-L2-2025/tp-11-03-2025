#!/bin/bash

if test -e OSMTowns.txt
then
    true
else
    echo "Le fichier n'existe pas."
    exit
fi

while true
do
    echo "1. Comptez le nombre de ville"
    echo "2. Affichez la ville la plus à l'Ouest"
    echo "3. Affichez la ville la plus à l'Est"
    echo "4. Affichez les coordonnées d'une ville"
    echo "5. Obtenez le lien des coordonnées d'une ville"
    echo "6. Affichez les villes contenant chien ou Chat ou chat"
    echo "0. Sortir de ce programme"

    read -p "Votre choix :" choice

    case $choice in
        0)
            exit
            ;;
        1)
            number_town=$(wc -l < OSMTowns.txt)
            echo "Il y a $number_town villes dans cette liste."
            ;;
        2)
            west=$(sort -k2,2n OSMTowns.txt | head -n 1)
            echo "La ville la plus à l'Ouest de la France est : $west."
            ;;
        3)
            east=$(sort -k2,2n OSMTowns.txt | tail -n 1)
            echo "La ville la plus à l'Est de la France est : $east."
            ;;
        4)
            read -p "Entrez le nom de la ville :" name_town
            LATLONG=$(grep "^$name_town" OSMTowns.txt | head -n 1)
            LAT=$(echo "$LATLONG" | awk '{print $3}')
            LONG=$(echo "$LATLONG" | awk '{print $2}')
            echo "La ville $name_town a pour latitude $LAT et longitude $LONG."
            ;;
        5)
            read -p "Entrez le nom de la ville :" name_town
            LATLONG=$(grep "^$name_town" OSMTowns.txt | head -n 1)
            LAT=$(echo "$LATLONG" | awk '{print $3}')
            LONG=$(echo "$LATLONG" | awk '{print $2}')
            echo "Le lien des coordonnées de $name_town est : https://www.openstreetmap.org/#map=18/$LAT/$LONG"
            ;;
        6)
            name_chien=$(grep -i "chien" OSMTowns.txt)
            echo "Les villes contenant 'chien' sont :"
            echo "$name_chien"

            name_chat=$(grep -i "\(chat\|Chat\)" OSMTowns.txt)
            echo "Les villes contenant 'chat' ou 'Chat' sont :"
            echo "$name_chat"
            ;;
    esac
done
