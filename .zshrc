#!/usr/bin/zsh
#
# ~/.zshrc
#


# colors in commands
alias ls='ls --color=auto'

man() {
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  command man "$@"
}


# prompt
source $HOME/.local/bin/git-prompt.sh
setopt PROMPT_SUBST
PS1='%F{11}%n%f@%F{12}%m%f %F{10}%c%f%F{9}$(__git_ps1)%f %# '


alias squeue='squeue -u qz421804'
#alias ssh='ssh -t "cd $PWD; zsh --login"'


# needed for dotfile repository
# reference: https://git.rwth-aachen.de/celina.kalus/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
