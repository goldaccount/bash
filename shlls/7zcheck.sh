#!/bin/zsh

f1() {
for x in *.7z
do
	del=$(7z l $x | grep Songs | cut -d '/' -f 2-10);
	echo $x"\t"$del
done
}

f2() {
	rmlist=$(7z l $1 | grep HLL | sed -E 's/^.*HLL/\"HLL/' | sed -E 's/$/\"/' | tr '\n' ' ') 
	echo 7z d $1 $rmlist | xclip -sel c
}

f3() {
#	7z l $1 | grep Songs | cut -d '/' -f 2-10 > /tmp/a
	rmlist=$(7z l $1 | grep -v Hololive | sed -E 's/^.*HLL/\"HLL/' | sed -E 's/$/\"/' | tr '\n' ' ') 
	echo 7z d $1 $rmlist | xclip -sel c
}
f2 $1;
