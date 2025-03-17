#!/bin/bash 

echo "Ville contenant \"Chien\":"
grep "chien" OSMTowns.txt

echo "Ville contenant \"Chat ou chat\":"
grep -i "chat" OSMTowns.txt

