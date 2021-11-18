#!/bin/bash
today=".config/backup"$(date +%Y%m%d)".log"
rsync -chiru --log-file=$today .config Ex/BackupLinux/.

