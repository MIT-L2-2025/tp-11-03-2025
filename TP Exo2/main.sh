#!/bin/bash


bash ville.sh
bash coordonne.sh $1
bash openStreetMap.sh $1
echo "Ensemble de vill e contenant le mot chat/Chat et chien:"
bash search.sh

