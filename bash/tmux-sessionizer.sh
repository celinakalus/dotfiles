#!/usr/bin/env bash

bind -x '"\C-f":tmux_sessionizer'

tmux_sessionizer() {
	if [[ $# -eq 1 ]]; then
		selected=$1
	else
		selected=$(find ~/develop ~/contrib -mindepth 1 -maxdepth 1 -type d | fzf)
	fi

	if [[ -z $selected ]]; then
		return 0
	fi

	selected_name=$(basename "$selected" | tr . _)

	if [[ -z $TMUX ]]; then
		TMUX_CALL="tmux new-session -As $selected_name -c $selected"
	elif ! tmux has-session -t $selected_name 2> /dev/null; then
		TMUX_CALL="tmux new-session -ds $selected_name -c $selected; tmux switch-client -t $selected_name"
	else
		TMUX_CALL="tmux switch-client -t $selected_name"
	fi

	if which nix 2>/dev/null >/dev/null && ([ -f $selected/shell.nix ] || [ -f $selected/default.nix ]); then
		PWD_PRE_NIX_DEVELOP="$PWD"
		cd $selected
		nix develop -c bash -c "SHELL=$SHELL $TMUX_CALL"
		cd $PWD_PRE_NIX_DEVELOP
	else
		$TMUX_CALL
	fi
}
