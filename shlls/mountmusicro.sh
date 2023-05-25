#!/bin/zsh
#sudo mount -t cifs -o ro,user,users,uid=1000,credentials=/home/nr2/.config/mount/smb1 //tn1/Music mount/Music
sudo mount -t nfs tn1:/mnt/p1/p1a/Music mount/Music -rv
