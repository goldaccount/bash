#!/bin/zsh
IFS2=$IFS
IFS=

fx_etitle() {
	#Strip _o# from line, leave only first part
	private var_etitle=$(echo $1 | sed -e 's/_o#.*$//' )
	echo $var_etitle
}

fx_jtitle() {
	#Get all after _o#, remove .zip
	private var_jtitle=$(echo $1 | sed -e 's/^.*o#//;s/.zip//' )
	echo $var_jtitle
}

fx_process() {
#Get passed $1 as input file, get passed $2 as output path
	while read -r x; do
		etitle=$(fx_etitle $x)
		jtitle=$(fx_jtitle $x)
		filename=$(echo $x | sed -e 's/^.*o#//')
		7z x ${filename} -o${2}/${etitle}
		echo \'${jtitle}\' >> ${2}/${etitle}/title.jpg
	done < $1
}

if [[ -z $1 || -z $2 ]]; then
	echo "Syntax: extract.sh <input file path> <output path>"
	exit
fi

fx_process $1 $2
