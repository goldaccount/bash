#!/bin/zsh
for x in *$1
do
	echo youtube ${x/.*} | sed -E 's/.{8}_//' | sed -E 's/\..*$//' | tee -a archive 
done
