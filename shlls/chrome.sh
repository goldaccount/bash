#!/bin/bash

fx_resolv() {
	iplist=$1
	for x in $(<$iplist); do
		sshpass -f f ssh fids@${x} "cp /etc/resolv.conf resolv.conf; echo nameserver -e 172.18.252.3\n172.18.252.4 >> resolv.conf && echo 123456 | sudo -S cp resolv.conf /etc/."
	done
}

fx_chrome() {
	ipx=$1
	sshpass -f f scp chrome.deb fids@${ipx}:Downloads/.
	sshpass -f f scp libu2f.deb fids@${ipx}:Downloads/.	
	sshpass -f f scp libu2f.deb fids@${ipx}:.local/google-chrome/	
	sshpass -f f ssh fids@${ipx} "echo 123456 | sudo -S dpkg -i Downloads/*.deb"
}

fx_copychrome() {
	ipx=$1	
	sshpass -f f ssh fids@${ipx} mkdir .config/google-chrome
	sshpass -f f scp Local\ State fids@${ipx}:.config/google-chrome/.
}

fx_exec() {
	for x in $(<$1); do
	    pingstatus=`ping $x -c 1 -W 3 1>/dev/null; echo $?`
	    if [[ pingstatus -eq 0 ]]; then
	        sshstatus=`sshpass -f f ssh fids@$x -oConnectionAttempts=1 -oConnectTimeout=2 echo a 1>/dev/null; echo $?`
        	if [[ sshstatus -eq 0 ]]; then
    	        name=`sshpass -f f ssh fids@$x hostname`
				fx_copychrome $x
				echo $name >> chrome-done
        	else
        	    echo $x "no-ssh" >> nossh
       		fi
		else
			echo $x no ping
    	fi
	done
}
#fx_resolv $1
fx_exec $1 
