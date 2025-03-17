#!/bin/bash

#exo2-1)
wget "http://perso.ens-lyon.fr/etienne.moutot/static/teach/2018-2019/asr2/OSMTowns.txt"

#exo2-2)
wc -l OSMTowns.txt

#exo2-3)
echo "La ville la plus a l'Ouest de France : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|head -n 1
echo "La ville la plus a l'Est de France  : "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|tail -n 1
