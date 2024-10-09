#!/bin/bash

up_a=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
lw_a=($(echo "${up_a[@]}" | tr '[:upper:]' '[:lower:]'))
chain="$1"
c=0

if [ -z "${chain}" ]; then
	echo  -e "\tYou must provide a chain as a parameter. If it have blanks, put it inside quotes: \"..\"."
	exit 0
fi

for i in ${up_a[@]}; do 
	((c++))
	echo -n "ROT ${c}: "; echo "${chain}" | tr 'A-Za-z' "${up_a[$((c))]}-ZA-${up_a[$((c - 1))]}${lw_a[$((c))]}-za-${lw_a[$((c - 1))]}"
done
