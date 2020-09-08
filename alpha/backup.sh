#!/bin/bash
# Author: Lok Cheung
# create a backup file of ~/.bashrc as ~/.bashrc_yyyy-mm-dd_bak
# e.g. ~/.bashrc_2020-09-08_bak
function createBackupFile() {
    todaysDate=$(date +'%Y-%m-%d')
    backupFile="'~/.bashrc_${todaysDate}_bak'"

    if [ -f ~/.bashrc_${todaysDate}_bak ]; then
        echo "Backup file: $backupFile already existed"
    else
        eval "cp ~/.bashrc ~/.bashrc_bak${todaysDate}"
        echo "Backup file: $backupFile is created."
    fi
}
