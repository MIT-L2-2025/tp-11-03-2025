#!/bin/bash

BOLD="\033[1m"
NORMAL="\033[0m"

WHITE="\033[37m"
RED="\033[31m"


if [ ! -f "OSMTowns.txt" ]; then
    echo -e "${BOLD}Erreur : ${RED}Le fichier OSMTowns.txt est introuvable.${NORMAL}"
    exit 1
fi

if [ "$#" -eq 0 ]; then
    echo -e "${BOLD}Usage : ${NORMAL} $0 {-w | -e | -c {ville} | -l | -s {mot}}"
    exit 1
fi

case "$1" in
    -w)
        west=$(LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1)
        NAME=$(echo "$west" | cut --delimiter=$'\t' --fields=1)
        LONG=$(echo "$west" | cut --delimiter=$'\t' --fields=2)
        LAT=$(echo "$west" | cut --delimiter=$'\t' --fields=3)
        echo -e "La ville la plus à l'ouest est ${BOLD}${NAME}${NORMAL}" qui a pour latitude ${BOLD}${LAT}${NORMAL}" et longitude ${BOLD}${LONG}${NORMAL}."
        ;;
    -e)
        east=$(LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=3 | tail -n 1)
        NAME=$(echo "$east" | cut --delimiter=$'\t' --fields=1)
        LONG=$(echo "$east" | cut --delimiter=$'\t' --fields=2)
        LAT=$(echo "$east" | cut --delimiter=$'\t' --fields=3)
        echo -e "La ville la plus à l'est est ${BOLD}${NAME}${NORMAL}" qui a pour latitude ${BOLD}${LAT}${NORMAL}" et longitude ${BOLD}${LONG}${NORMAL}."
        ;;
    -c)
        if [ "$#" -lt 2 ]; then
            echo -e "${BOLD}Usage : ${NORMAL} $0 -c {ville}."
            exit 1
        fi
        city="$2"
        LATLONG=$(grep -i "^$city"$'\t' OSMTowns.txt | head -n 1)
        if [ -n "$LATLONG" ]; then
            LAT=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=3)
            LONG=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=2)
            echo -e "La ville ${BOLD}${city}${NORMAL}" a pour latitude ${BOLD}${LAT}${NORMAL}" et longitude ${BOLD}${LONG}${NORMAL}."
        else
            echo -e "${BOLD}${RED}Ville ${WHITE}${city} ${RED}non trouvée.${NORMAL}"
        fi
        ;;
    -l)
        count=$(wc -l < OSMTowns.txt)
        echo -e "${BOLD}Nombre total de villes : ${NORMAL} ${count}."
        ;;
    -s)
        if [ "$#" -lt 2 ]; then
            echo -e "${BOLD}Usage : ${NORMAL} $0 -s {mot}"
            exit 1
        fi
        keyword="$2"
        echo -e "Villes contenant ${BOLD}'$keyword'${NORMAL} dans leur nom :"
        grep -i "$keyword" OSMTowns.txt
        ;;
    -m)
        if [ "$#" -lt 2 ]; then
            echo -e "${BOLD}Usage : ${NORMAL} $0 -m {ville}"
            exit 1
        fi
        city="$2"
        LATLONG=$(grep -i "^$city"$'\t' OSMTowns.txt | head -n 1)
        if [ -n "$LATLONG" ]; then
            LAT=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=3)
            LONG=$(echo "$LATLONG" | cut --delimiter=$'\t' --fields=2)
            echo -e "Lien OpenStreetMap pour ${BOLD}${city} : https://www.openstreetmap.org/#map=18/${LAT}/${LONG}${NORMAL} ."
        else
            echo -e "${BOLD}${RED}Ville ${WHITE}${city} ${RED}non trouvée.${NORMAL}"
        fi
        ;;
    *)
        echo -e "${BOLD}Option inconnue : ${NORMAL} $1"
        echo -e "${BOLD}Usage : ${NORMAL} $0 {-w | -e | -c {ville} | -l | -s {mot} | -m {ville}}"
        exit 1
        ;;
esac
