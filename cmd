#!/usr/bin/env bash
# SYNOPSIS  peep is a super simple note management tool for the Bash command line
# AUTHOR    Christopher Engelmann

# configurable by the user
# ------------------------
  editor=vim
  editor_opt='"+set nonumber"'
  path_cheatsheets=~/.bash/custom/peep
# ------------------------
# TODO separate this into a gitignored file & make it editable by the cmd

instdir=$(dirname $BASH_SOURCE)
script_name=$(basename $BASH_SOURCE)
script_path="$instdir/$script_name"
param="$1 $2"

clear

function create_file() {
    echo "That cheatsheet $1 doesn't exist, yet!"
    echo "Do you like to create it now? [y|n] "
    read answer
    if [[ "$answer" == "y" ]]; then
        echo
        eval $editor $editor_opt "$path_cheatsheets/cmds-$1"
    fi
}

case "$param" in
    " ")
        cat "$path_cheatsheets/cmds-default"
    ;;
    "code ")
        eval $editor "$script_path"
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
            echo "Syntax: peep [edit [filename]]|files|code] [COMMAND]"
            echo "To list all available cheatsheets: peep files"
            echo "To create a new cheatsheet or edit an existing: peep edit NAME"
        fi
    ;;
esac
