#!/usr/bin/zsh
#
# ~/.zshrc
#


# colors in commands
alias ls='ls --color=auto'


# prompt
setopt PROMPT_SUBST
#PS1="%* %F{8}[%n@%m:%~]%f%# "
PS1='%F{11}%n%f@%F{12}%m%f %F{10}%c%f%F{9}$(__git_ps1)%f %# '
#TMOUT=1

#TRAPALRM() {
#  zle reset-prompt
#}

alias squeue='squeue -u qz421804'
#alias ssh='ssh -t "cd $PWD; zsh --login"'


# needed for dotfile repository
# reference: https://git.rwth-aachen.de/celina.kalus/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

