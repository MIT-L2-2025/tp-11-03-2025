#! /bin/bash

echo "l'ensemble de ville qui a le nom chien : "
grep "chien" OSMTowns.txt
echo " "
echo "l'ensemble de ville qui a le nom chat ou Chat "
grep -i "chat" OSMTowns.txt


