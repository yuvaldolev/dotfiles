#!/usr/bin/env bash

set -e

LANGUAGES_CONFIGURATION_FILE="$HOME/.config/tmux_cht/languages"
COMMANDS_CONFIGURATION_FILE="$HOME/.config/tmux_cht/commands"

selected=`cat $LANGUAGES_CONFIGURATION_FILE $COMMANDS_CONFIGURATION_FILE | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" $LANGUAGES_CONFIGURATION_FILE; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl cht.sh/$selected/$query | bat"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | bat"
fi

