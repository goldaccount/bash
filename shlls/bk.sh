#!/bin/zsh
#rsync files and folder list from sh/bklist starting from .config to input path (Must point to .config folder) e.g BackupLinux/.config
echo "Copying .config to $1"
today=".config/backup"$(date +%Y%m%d)".log"
rsync --no-motd -chiruz --log-file=$today -F --include-from=$HOME/sh/bklist --exclude="*" .config/* $1
echo "Finished copying .config to $1, log file =$today"
