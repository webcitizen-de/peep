#!/usr/bin/env bash

# configurable by the user
# ------------------------
  editor=vim
  opt='"+set nonumber"'
  path=~/.bash/custom/myman
# ------------------------

instdir=$(dirname $BASH_SOURCE)
script_name=$(basename $BASH_SOURCE)
script_path="$instdir/$script_name"
param="$1 $2"

clear

function create_file() {
    echo "That cheat sheet $1 doesn't exist, yet!"
    echo "Do you like to create it now? [y|n] "
    read answer
    if [[ "$answer" == "y" ]]; then
        echo
        eval $editor $opt "$path/cmds-$1"
    fi
}

# echo "\$1 ist: $1"
# echo "\$2 ist: $2"
# echo -e "Parameter ist: $param\n"

case "$param" in
    " ")
        cat "$path/cmds-default"
    ;;
    "code ")
        eval $editor "$script_path"
    ;;
    edit*)
        if [[ -f "$path/cmds-$2" ]]; then
            eval $editor $opt "$path/cmds-$2"
        elif [[ "$2" != "" ]]; then
            create_file "$2"
        elif [[ "$2" == "" ]]; then
            eval $editor $opt "$path/cmds-default"
        fi
    ;;
    "files ")
        echo "$path"
        ls -1 "$path"
    ;;
    *)
        if [[ -f "$path/cmds-$1" ]]; then
            cat "$path/cmds-$1"
        elif [[ "$2" == "" ]]; then
            echo "Syntax: cmd [edit|files|code] [COMMAND]"
            echo "To list all available cheat sheets: cmd files"
        fi
    ;;
esac
