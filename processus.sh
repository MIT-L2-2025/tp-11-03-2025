#!/bin/bash  
process=$(top -b -n1 | grep -E '^\s*[1-9]' | head -n1) 
pid=$(echo $process | awk '{print $1}') 
cpu=$(echo $process | awk '{print $9}') 
memoire=$(echo $process | awk '{print $10}')
name=$(echo $process | awk '{print $12}') 
if [[ $cpu -gt 70 && $memoire -gt 70 ]]; then
   sudo kill -9 $pid
   echo "La processus $name a été arreté"
else
   echo "Il n'y a pas de processus à arreté"
fi
