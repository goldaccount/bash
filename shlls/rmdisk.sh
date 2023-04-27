#!/bin/zsh
echo Unmounting $1
sudo umount ${1}*
#echo Idling $1
#sudo hdparm -y $1
#sleep 10
#echo Sleeping $1
#sudo hdparm -Y $1
#sleep 5
echo Powering off $1
sudo udisksctl power-off -b $1
