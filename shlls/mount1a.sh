#/bin/zsh
#sudo mount -t cifs -o rw,noatime,user,users,credentials=/home/nr2/.config/mount/nr2,uid=1000 //tn1/p1a mount/p1a
sudo mount -t nfs tn1:/mnt/p1/p1a mount/p1a -wv
