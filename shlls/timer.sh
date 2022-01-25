#!/bin/bash
basem=$(date +%m)
bases=$(date +%S)
echo $basem:$bases
basee=$(date +%s)
#read input
while true;
do
	#clear
	echo -ne $(expr $(date +%s) - $basee)\\r
	#echo -ne \\b\\b\\b\\b\\b\\b\\b $(date +%m):$(date +%S) 
#	read input
#	if [[ $input = "q" ]]; then
#		exit
#	fi
done


