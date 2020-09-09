#!/bin/bash
# Author: Lok Cheung
# update command prompt by user input

function updateCommandPrompt() {
    echo "what do you want to display? e.g. 😆> "

    while true; do
        printf ">"
        read promptText
        if [ -z "$promptText" ]; then
            echo "Don't leave the input blank, try again:"
        else
            break
        fi
    done

    invalidCharacters="\!\#\^\[\]\`\'\"\*\%\;\=\&"
    # sanitize input
    promptText=${promptText//[$invalidCharacters]/''}

    printf "Is it okay to change command prompt to: $promptText?[y/n]"

    read confirm

    if [ $confirm = "y" ];then
        # find the line if export PS1 is set
        oldPromptLineNumber="$(awk '/export PS1/{ print NR; exit }' ~/.bashrc)"

        appendComment="'# hide full path from terminal prompt' >> ~/.bashrc"
        newPrompt="\"export PS1='${promptText}'\" >> ~/.bashrc"

        # oldPromptLineNumber is null, prompt was not set before
        if [ -z "$oldPromptLineNumber" ]; 
            then
            eval "echo $appendComment"
            #newPrompt="\"export PS1='${promptText}'\" >> ~/.bashrc"
            #export "PS1='${promptText} '" >> ~/.bashrc
            eval "echo $newPrompt"
            
        else
            # remove previous setting
            commentLineNumber="$(awk '/# hide full path from terminal prompt/{ print NR; exit }' ~/.bashrc)"
            if [ -z "$commentLineNumber" ]; 
                then
                eval "sed -i ${oldPromptLineNumber}d ~/.bashrc"
            else
                eval "sed -i ${commentLineNumber},${oldPromptLineNumber}d ~/.bashrc"
            fi
            eval "echo $appendComment"
            eval "echo $newPrompt"
            echo "Your command prompt is successfully changed to $promptText"
            echo "Open a new instance of terminal to see the effect! :D"
        fi
    else
        updateCommandPrompt
    fi
}

