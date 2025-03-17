#cette
#!bin/bash


ficName="../OSMTowns.txt"
villeOuest=''
villeEst=''

#ville le plus a l'OUEST
villeOuest=$(LANG=EN sort $ficName --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1)

#ville le plus a l'EST
villeEst=$(LANG=EN sort $ficName --field-separator=$'\t' --general-numeric-sort --key=2 | tail -n 1)


echo "La ville la plus a l'Ouest : $villeOuest'" 
echo "La ville la plus a l'Est : $villeEst"

