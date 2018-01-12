#!/usr/bin/env bash

# configurable by the user
# ------------------------
  editor=vim
  editor_opt='"+set nonumber"'
  path_cheatsheets=~/.bash/custom/myman
# ------------------------

instdir=$(dirname $BASH_SOURCE)
script_name=$(basename $BASH_SOURCE)
script_path_cheatsheets="$instdir/$script_name"
param="$1 $2"

clear

function create_file() {
    echo "That cheat sheet $1 doesn't exist, yet!"
    echo "Do you like to create it now? [y|n] "
    read answer
    if [[ "$answer" == "y" ]]; then
        echo
        eval $editor $editor_opt "$path_cheatsheets/cmds-$1"
    fi
}

# echo "\$1 ist: $1"
# echo "\$2 ist: $2"
# echo -e "Parameter ist: $param\n"

case "$param" in
    " ")
        cat "$path_cheatsheets/cmds-default"
    ;;
    "code ")
        eval $editor "$script_path_cheatsheets"
    ;;
    edit*)
        if [[ -f "$path_cheatsheets/cmds-$2" ]]; then
            eval $editor $editor_opt "$path_cheatsheets/cmds-$2"
        elif [[ "$2" != "" ]]; then
            create_file "$2"
        elif [[ "$2" == "" ]]; then
            eval $editor $editor_opt "$path_cheatsheets/cmds-default"
        fi
    ;;
    "files ")
        echo "$path_cheatsheets"
        ls -1 "$path_cheatsheets"
    ;;
    *)
        if [[ -f "$path_cheatsheets/cmds-$1" ]]; then
            cat "$path_cheatsheets/cmds-$1"
        elif [[ "$2" == "" ]]; then
            echo "Syntax: cmd [edit|files|code] [COMMAND]"
            echo "To list all available cheatsheets: cmd files"
            echo "To create a new cheatsheet or edit an existing: cmd edit NAME"
        fi
    ;;
esac
