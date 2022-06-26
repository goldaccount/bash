#!/bin/zsh
#
#Query multi monitor status, if exist, write to /tmp/monitorlist
xrandr --listactivemonitors | sed -E 's/^.* //' | tee /tmp/monitorlist;
#total=$(sed -n 1p /tmp/monitorlist);
index=1;
for x in $(</tmp/monitorlist); do
	mon[$index]=$x;
	index=`expr $index + 1`;
done
unset index;
total=$mon[1];

case $total in
	1)
		bspc monitor -d 1 2 3 4 5 6 7 8 9 0
	;;
	2)
		bspc monitor $mon[3] -d 1 2 3 4 5
		bspc monitor $mon[2] -d 6 7 8 9 0
	;;
	3)
		bspc monitor $mon[2] -d 1 2 3 4
		bspc monitor $mon[3] -d 5 6 7 
		bspc monitor $mon[4] -d 8 9 0
	;;
	4)
		bspc monitor $mon[2] -d 1 2
		bspc monitor $mon[3] -d 3 4 5
		bspc monitor $mon[4] -d 5 6 7
		bspc monitor $mon[5] -d 8 9 0
	;;
esac
exit
