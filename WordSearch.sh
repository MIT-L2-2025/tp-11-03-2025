#!/bin/bash

read -p "Word to search : " mot
read -p "Name of file : " fic
if [[ -f $fic ]]; then
	s=$(grep -i "$mot" $fic)
	if [[ $s -eq 0 ]]; then
		echo "no $mot in $fic"
	else 
		grep -i "$mot" $fic
	fi
else echo "$fic is not files"
fi
