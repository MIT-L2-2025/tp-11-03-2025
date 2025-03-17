#!/bin/bash
echo "Nombre de villes dans le fichier OSMTowns.txt: "
c=$(wc -l OSMTowns.txt)
echo "Il y a: $c villes"
echo "Ville chien-"
grep -i "chien" OSMTowns.txt|cut -f1
echo "Ville chat-"
grep -i "chat" OSMTowns.txt |cut -f1
