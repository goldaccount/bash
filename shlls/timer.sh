#!/bin/bash
basem=$(date +%m)
bases=$(date +%S)
echo $basem:$bases
basee=$(date +%s)
while true;
do
	#clear
	echo -ne $(expr $(date +%s) - $basee)\\r
	#echo -ne \\b\\b\\b\\b\\b\\b\\b $(date +%m):$(date +%S) 
done


