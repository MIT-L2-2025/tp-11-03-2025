
#!/bin/bash
		
echo "Nombre de ville dans OSMTowns.txt"
wc -l OSMTowns.txt
echo "La ville la plus Ouest de la france: "
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2 | head -n 1
echo "La ville la plus Est de la Frane :"
LANG=EN sort OSMTowns.txt --field-separator=$'\t' --general-numeric-sort --key=2|tail -n 1
LATLONG=$(grep "^$1 " OSMTowns.txt | head -n1)
LAT= $(echo "$LATLONG" |cut --delimeter "	" --fields=3)
LONG=$(echo "$LATLONG" |cut --delimiter "       "  --fields=2)
echo "$LATLONG"  
echo "LA ville $1 a pour latitude $LAT et longitude $LONG"
grep -i "chat" OSMTowns.txt

