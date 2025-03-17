#!/bin/bash

while true; do
    echo -e "\nMenu des options:"
    echo "2) Compter le nombre de villes"
    echo "3a) Ville la plus à l’Ouest de la France"
    echo "3b) Ville la plus à l’Est de la France"
    echo "6a) Villes contenant 'chien' dans leur nom"
    echo "6b) Villes contenant 'Chat' ou 'chat' dans leur nom"
    echo "q) Quitter"
    echo -n "Entrez votre choix (2, 3a, 3b, 6a, 6b ou q): "
    
    read choix
    
    echo -e "\n        ---------------------------         \n"
    
    case $choix in
        2)
            echo "2) Le nombre de villes est :"
            wc -l OSMTowns.txt
            ;;
        3a)
            echo "3)a- La ville la plus à l’Ouest de la France:"
            sort -k2 -n OSMTowns.txt | head -n 1
            ;;
        3b)
            echo "3)b- La ville la plus à l’Est de la France:"
            sort -k2 -n OSMTowns.txt | tail -n 1
            ;;
        6a)
            echo "6)a- Les villes contenant 'chien' dans leur nom sont :"
            grep "chien" OSMTowns.txt
            ;;
        6b)
            echo "6)b- Les villes contenant 'Chat' ou 'chat' dans leur nom sont :"
            grep -i "chat" OSMTowns.txt
            ;;
        q|Q)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide. Veuillez entrer 2, 3a, 3b, 6a, 6b ou q."
            ;;
    esac
    
    echo -e "\nAppuyez sur Entrée pour continuer..."
    read -r
done