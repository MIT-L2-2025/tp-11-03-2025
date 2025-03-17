#!/bin/bash

LATLONG=$(grep "^$1" OSMTowns.txt|head -n1)
LAT=$(echo "$LATLONG" |cut --delimiter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "	" --fields=2)

LyonLATLONG=$(grep "^Lyon" OSMTowns.txt|head -n1)
LyonLAT=$(echo "$LyonLATLONG" |cut --delimiter "	" --fields=3)
LyonLONG=$(echo "$LyonLATLONG" |cut --delimiter "	" --fields=2)


python gps-dist.py $LAT $LONG  $LyonLAT $LyonLONG 
