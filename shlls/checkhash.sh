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
	inputhash=$(cat ${inputfile}.${inputalgo})
else
	inputhash=$3
fi
echo Hash"\t"$inputhash

echo $(sha256sum $inputfile)
if [[ $(${inputalgo}sum $inputfile | sed -E 's/\s.*//') == $inputhash ]]; then;
	echo Matched.
	return 0
	exit
else
	echo Mismatched.
	return 1
	exit
fi
