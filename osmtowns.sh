#!/bin/bash
# Script unique pour manipuler le fichier OSMTowns.txt

FILE="OSMTowns.txt"

#######################################
# 1. Télécharger le fichier si nécessaire
#######################################
if [ ! -f "$FILE" ]; then
    echo "Téléchargement du fichier $FILE..."
    wget "http://perso.ens-lyon.fr/etienne.moutot/static/teach/2018-2019/asr2/OSMTowns.txt"
fi

#######################################
# 2. Compter le nombre de villes
#######################################
NB_VILLES=$(wc -l < "$FILE")
echo "Nombre de villes : $NB_VILLES"

#######################################
# 3. Trouver la ville la plus à l’Ouest et la ville la plus à l’Est
#######################################
# On trie selon la 2ème colonne (longitude) en anglais pour utiliser le point décimal
echo "Ville la plus à l'Ouest (longitude minimale) :"
LANG=EN sort "$FILE" --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1

echo "Ville la plus à l'Est (longitude maximale) :"
LANG=EN sort "$FILE" --field-separator=$'\t' --general-numeric-sort --key=2 | tail -n 1

#######################################
# 4. Fonction pour afficher les coordonnées GPS d'une ville
#######################################
get_coords() {
    # Recherche la première occurrence d'une ville commençant par le nom exact (suivi d'une tabulation)
    local city="$1"
    local line
    line=$(grep "^$city"$'\t' "$FILE" | head -n 1)
    if [ -z "$line" ]; then
        echo "Ville '$city' non trouvée."
        return 1
    fi
    # On suppose que le fichier est structuré ainsi : Nom<TAB>Longitude<TAB>Latitude
    local long=$(echo "$line" | cut --delimiter=$'\t' --fields=2)
    local lat=$(echo "$line" | cut --delimiter=$'\t' --fields=3)
    echo "La ville $city a pour latitude $lat et longitude $long"
}

#######################################
# 5. Fonction pour générer un lien OpenStreetMap pour une ville
#######################################
get_osm_link() {
    local city="$1"
    local line
    line=$(grep "^$city"$'\t' "$FILE" | head -n 1)
    if [ -z "$line" ]; then
        echo "Ville '$city' non trouvée."
        return 1
    fi
    local long=$(echo "$line" | cut --delimiter=$'\t' --fields=2)
    local lat=$(echo "$line" | cut --delimiter=$'\t' --fields=3)
    echo "https://www.openstreetmap.org/#map=18/$lat/$long"
}

#######################################
# 6. Recherche de villes contenant "chien" et "chat" dans leur nom
#######################################
echo "Liste des villes contenant 'chien' :"
grep -i "chien" "$FILE"

echo "Liste des villes contenant 'chat' (majuscule ou minuscule) :"
grep -i "chat" "$FILE"

#######################################
# Utilisation du script selon les arguments passés :
# - Si le premier argument est "coords", le script affiche les coordonnées de la ville (deuxième argument)
# - Si le premier argument est "osm", le script affiche le lien OSM de la ville (deuxième argument)
#######################################
if [ "$1" = "coords" ] && [ -n "$2" ]; then
    get_coords "$2"
elif [ "$1" = "osm" ] && [ -n "$2" ]; then
    get_osm_link "$2"
fi
