#!/bin/zsh
#
#Query multi monitor status, if exist, skip first line (total), write to /tmp/monitorlist
list=/tmp/monitorlist
touch $list
xrandr --listactivemonitors | sed -E 's/^.* //' | tail +2 > $list;

#total count of monitors
total=`wc -l < $list`

#create index var "i", monitor array
#read $list, assign entries to monitor array
#replace existing var in mon{i} with entries from monitorlist
i=1; monitor=();
for x in $(<$list); do
	monitor[${i}]="$x"
	sed -i -E "/monitor/s/=\s.*$/= ${x}/" .config/polybar/mon${i};
	i=`expr $i + 1`;
done

#Assign desktops to monitors 
case $total in
	1)
		bspc monitor $monitor[1] -d 1 2 3 4 5 6 7 8 9 0
		.config/polybar/init.sh
	;;
	2)
		bspc monitor ^2 -d 1 2 3 4 5
		bspc monitor ^1 -d 6 7 8 9 0
		.config/polybar/init.sh
		.config/polybar/initmon2.sh
	;;
	3)
		bspc monitor $monitor[1] -d 1 2 3 4
		bspc monitor $monitor[2] -d 5 6 7 
		bspc monitor $monitor[3] -d 8 9 0
		.config/polybar/init.sh
		.config/polybar/initmon2.sh
		.config/polybar/initmon3.sh
	;;
	4)
		bspc monitor $monitor[1] -d 1 2 3
		bspc monitor $monitor[2] -d 4 5 6
		bspc monitor $monitor[3] -d 6 7 8
		bspc monitor $monitor[4] -d 9 0
		.config/polybar/init.sh
		.config/polybar/initmon2.sh
		.config/polybar/initmon3.sh
		.config/polybar/initmon4.sh
	;;
esac
exit
