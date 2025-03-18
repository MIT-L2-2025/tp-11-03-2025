#!/bin/bash
echo "Nombre de ville dans le fichier"
c=$(wc -l OSMTowns.txt)
echo "Il y a: $c villes"
echo "Ville contenant le mot chien"
grep -i "chien" OSMTowns.txt|cut -f1
echo "Ville contenant le mot chat"
grep -i "chat" OSMTowns.txt|cut -f1
