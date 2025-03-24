#!/bin/bash

if [ $# -lt 1  ]; then
  exit
fi

bash ville.sh
bash coordonne.sh $1
bash openStreetMap.sh $1
echo "Ensemble de ville contenant le mot chat/Chat et chien:"
bash search.sh

