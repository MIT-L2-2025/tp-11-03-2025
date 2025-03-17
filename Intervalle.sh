#!/bin/bash

read -p "Name of file : " fic 
if [[ -f $fic ]]; then 
	read -p "Number of lines begin : " begin
	read -p "Number of lines end : " end
	if [ $begin -gt $end ]; then
		 echo "Number invalid !"
	else
		nb=$(($end-$begin+1))
		cat -n $fic | head -$end | tail -$nb | tr ':' '\t'
	fi
else 
	echo "$fic is not files"
fi
