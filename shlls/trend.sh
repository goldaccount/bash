#!/bin/bash

ACTIVATIONURL='dsm://DS1.sgn1.ams.vn:4120/'
url='https://ds1.sgn1.ams.vn:4119/software/agent/Ubuntu_22.04/x86_64/agent.deb'

fx_resolv() {
	ipx=$1
	for x in $(<$ipx); do
		sshpass -f f ssh fids@${x} "cp /etc/resolv.conf resolv.conf; echo nameserver -e 172.18.252.3\n172.18.252.4 >> resolv.conf && echo 123456 | sudo -S cp resolv.conf /etc/."
	done
}

fx_trend() {
	ipx=$1
	sshpass -f f ssh fids@${ipx} wget --no-check-certificate $url
	sshpass -f f ssh fids@${ipx} "echo 123456 | sudo -S dpkg -i agent.deb"
	sshpass -f f ssh fids@${ipx} "echo 123456 | sudo -S /opt/ds_agent/dsa_control -r"
	sshpass -f f ssh fids@${ipx} "echo 123456 | sudo -S /opt/ds_agent/dsa_control -a $ACTIVATIONURL policyid:10 groupid:4"
}

fx_exec() {
	for x in $(<$1); do
	    pingstatus=`ping $x -c 1 -W 3 1>/dev/null; echo $?`
	    if [[ pingstatus -eq 0 ]]; then
	        sshstatus=`sshpass -f f ssh fids@$x -oConnectionAttempts=1 -oConnectTimeout=2 echo a 1>/dev/null; echo $?`
        	if [[ sshstatus -eq 0 ]]; then
    	        name=`sshpass -f f ssh fids@$x hostname`
				fx_trend $x
				echo $name >> trend-done
        	else
        	    echo $x "no-ssh" >> nossh
       		fi
		else
			echo $x no ping
    	fi
	done
}
fx_resolv $1
fx_exec $1 
