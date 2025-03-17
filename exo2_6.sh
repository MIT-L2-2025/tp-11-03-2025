#!/bin/bash
echo "Affichage ville contenant chien dans leur nom:"
echo "-----------------------------------------------"
grep "chien" OSMTowns.txt
echo "-----------------------------------------------"
echo -e "\n"
echo "Affichage ville contenant "Chat" ou "chat" dans leur nom:"
echo "-----------------------------------------------"
grep -i "chat" OSMTowns.txt
echo "-----------------------------------------------"
