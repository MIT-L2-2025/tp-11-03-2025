#!/bin/bash

# Récupère le nom du fichier à partir du dernier argument passé
file="${!#}"

# Structure de contrôle pour gérer différents cas en fonction du nombre d'arguments
case "$#" in
    3)  
        # Si exactement 3 arguments sont passés
        start=$1  # Premier argument : ligne de départ
        end=$2    # Deuxième argument : ligne de fin
        # Calculer le nombre de lignes à afficher
        lines_to_display=$((end - start + 1))
        # Utiliser tail et head pour afficher les lignes de start à end
        tail -n +"$start" "$file" | head -n "$lines_to_display"
        ;;
    *)  
        # Si un nombre d'arguments différent de 3 est passé
        # Pour chaque argument (sauf le dernier qui est le fichier)
        for i in "${@:1:$#-1}"; do
            # Utiliser tail et head pour afficher la ligne spécifique
            tail -n +"$i" "$file" | head -n 1
        done
        ;;  
esac



