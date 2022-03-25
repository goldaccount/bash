#!/bin/bash
today=".config/backup"$(date +%Y%m%d)".log"
rsync -chiru --log-file=$today .config Ex/BackupLinux/. \
	--exclude=.config/BraveSoftware* \
	--exclude=.config/transmission* \
	--exclude=.config/Microsoft* \
	--exclude=*Analytics* \
	--exclude=*GIMP*
