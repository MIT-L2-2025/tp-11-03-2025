#!/bin/bash

Lat=$(grep  ^"$1	" OSMTowns.txt|head -n1|cut -d $'\t' -f 3)
Long=$(grep  ^"$1	" OSMTowns.txt|head -n1|cut -d $'\t' -f 2)

echo $Lat $Long
#echo "https://www/openstreetmap.org/#map=18/"$Lat"/"$Lat
