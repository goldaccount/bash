#/bin/zsh
cd ../$1 && ../trimm.sh query && cat links | nl | tail -1
