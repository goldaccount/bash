#!/bin/zsh
inputfile=$2
inputalgo=$1
if [[ -z $1 || -z $2 ]]; then
	echo "Syntax: checkhash <algorithm> <inputfile> (<hash string>)
	Algorithm = md5, sha1, ...
	Hash string from input, or assume content of <inputfile>.<algorithm>"
	exit
fi

if [[ -z $3 ]]; then
	inputhash=$(cat ${inputfile}.${inputalgo} | cut -d" " -f1)
else
	inputhash=`echo $3 | sed -E 's/\s.*//'`
fi

cstype=${inputalgo}sum
echo $cstype
echo `$cstype $inputfile` | sed -E 's/\s.*//'

if [[ $(${cstype} $inputfile | sed -E 's/\s.*//') == $inputhash ]]; then;
	echo Matched.
	return 0
	exit
else
	echo Mismatched.
	return 1
	exit
fi
