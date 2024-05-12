#!/usr/bin/env bash

CONFIGURATION_FILE="$HOME/.config/tmux_sessionizer/config"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    configuration=()
    while IFS= read -r line; do
        configuration+=("$line")
    done < "$CONFIGURATION_FILE"

    selected=$(find "${configuration[@]}" -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected="$(realpath $selected)"

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    # TMUX isn't running, start it and create the selected session.
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    # No session with the selected name, create it.
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    # TMUX is running but we're not in a session, attach to the selected session.
    tmux attach-session -t $selected_name
else
    # We're in TMUX, but not in the selected session, switch to it.
    tmux switch-client -t $selected_name
fi

# Cleanup numeric sessions.
tmux list-sessions -F "#{session_name}" | grep -E '^[0-9]+$' | xargs -I {} tmux kill-session -t {}
