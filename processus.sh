#!/bin/bash

echo "Processus utilisant le plus de RAM:"
ps aux --sort=-%mem | head -n 2


echo "Processus utilisant le plus de CPU:"
ps aux --sort=-%cpu | head -n 2


read -p "Entrez le PID du processus à arrêter: " pid
kill -9 $pid
echo "Processus $pid arrêté."


