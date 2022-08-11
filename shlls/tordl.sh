#!/bin/zsh
today=$(date +%Y%m%d_%H%M%S)
transmission-cli -ep -v -w $HOME/Ex/Torrent/ $1 &>$today.log &
tail -F $today.log
#!/bin/zsh
#today=$(date +%Y%m%d%_H%M%S)
#transmission-cli -m -w $HOME/Ex/Torrent $1 1>/tmp/$today &
#tail -F /tmp/$today
