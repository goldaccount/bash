#!/bin/zsh
#sudo mount -t cifs -o noatime,user,users,rw,uid=1000,credentials=/home/nr2/.config/mount/nr2 //tn1/Music mount/Music
sudo mount -t nfs tn1:/mnt/p1/p1a/Music mount/Music -rv
