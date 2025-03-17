#!/bin/bash

echo "Affichage des villes contenant chien dans leur nom"
grep "chien" OSMTowns.txt 

echo "Affichage des villes contenant chat/Chat dans leur nom"
(ou grep -i "chat" OSMTowns.txt)
