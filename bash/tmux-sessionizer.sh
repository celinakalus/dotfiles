#!/usr/bin/env bash

bind -x '"\C-f":tmux_sessionizer'

tmux_sessionizer() {
	if [[ $# -eq 1 ]]; then
		selected=$1
	else
		selected=$(find ~/develop -mindepth 1 -maxdepth 1 -type d | fzf)
	fi

	if [[ -z $selected ]]; then
		exit 0
	fi

	selected_name=$(basename "$selected" | tr . _)

	if [[ -z $TMUX ]]; then
		tmux new-session -As $selected_name -c $selected
	elif ! tmux has-session -t $selected_name 2> /dev/null; then
		tmux new-session -ds $selected_name -c $selected
		tmux switch-client -t $selected_name
	else
		tmux switch-client -t $selected_name
	fi
}
