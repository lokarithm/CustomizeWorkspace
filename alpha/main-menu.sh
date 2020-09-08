#!/bin/bash
# Author: Lok Cheung
# Open Main Menu
function openMainMenu() {
    options=("Command prompt" "Nothing")

    select_option "${options[@]}"
    # choice is the zero based index of the options array
    choice=$?

    case "$choice" in
    "0")
        echo "Configure terminal prompt to display a static text:"
        updateCommandPrompt
        ;;
    "1")
        echo "Bye~"
        ;;
    *)
        echo "Bye"
        ;;
    esac
}
