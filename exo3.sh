#!/bin/bash

Lat=$(grep  ^"$1	" OSMTowns.txt|head -n1|cut -d $'\t' -f 3)
Long=$(grep  ^"$1	" OSMTowns.txt|head -n1|cut -d $'\t' -f 2)
LatLyon=$(grep  ^Lyon OSMTowns.txt|head -n1|cut -d $'\t' -f 3)
LongLyon=$(grep  ^Lyon OSMTowns.txt|head -n1|cut -d $'\t' -f 2)


echo  $Lat $Long $LatLyon $LongLyon

python3 gps-dyst.py $Long $Lat $LongLyon $LatLyon
#echo "https://www/openstreetmap.org/#map=18/"$Lat"/"$Lat
