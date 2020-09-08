#!/bin/bash
# Author: Lok Cheung

source backup.sh
source command-prompt-update.sh
source option-controls.sh
source main-menu.sh


# back up .bashrc file
createBackupFile

# Main
echo "Welcome to CW! What do you want to customize?"
echo "[Press Ctrl+C at anytime to quit.]"

openMainMenu