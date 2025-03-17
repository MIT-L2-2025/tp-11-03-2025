#!/bin/bash

# Pour savoir la ville la plus à l'est, on regarde la plus grande longitude
# Définit la commande pour trier le fichier OSM.txt par la deuxième colonne (séparée par des tabulations) en ordre décroissant
cmd_est="LANG=EN sort -t $'\t' -k2,2n OSMTowns.txt | tail -n 1"

# Pour savoir la ville la plus à l'ouest, on regarde la plus petite longitude
# Définit la commande pour trier le fichier OSM.txt par la deuxième colonne (séparée par des tabulations) en ordre croissant
cmd_ouest="LANG=EN sort -t $'\t' -k2,2n OSMTowns.txt | head -n 1"

# Exécute les commandes définies
ville_est=$(eval "$cmd_est")
ville_ouest=$(eval "$cmd_ouest")

# Affiche les résultats
echo "La ville la plus à l'est est : $ville_est"
echo "La ville la plus à l'ouest est : $ville_ouest"