#/bin/zsh
cat $1 | grep id | grep -v UC | sed -E 's/    "id": "/https:\/\/youtu.be\//g' | sed -E 's/",//g' | sed -E 's/.*topic.*//g' > links
