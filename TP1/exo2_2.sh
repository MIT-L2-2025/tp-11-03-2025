#!/bin/bash

echo "Telechargement du fichier OSMTowns.txt..."
wget -q https://emoutot.perso.math.cnrs.fr/static/teach/2018-2019/asr2/OSMTowns.txt -O OSMTowns.txt

# Vérification du téléchargement
if [ ! -f OSMTowns.txt ]; then
    echo "Erreur : impossible de télécharger OSMTowns.txt."
    exit 1
fi

echo ""
echo "Nombre de villes : $(wc -l < OSMTowns.txt)"