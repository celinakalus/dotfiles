#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# colors in commands
alias ls='ls --color=auto'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


# prompt
PS1='\[\e[90m\][\u@\h \W]\[\e[m\]\$ '


# needed for dotfile repository
# reference: https://git.rwth-aachen.de/celina.kalus/dotfiles.git
alias config='/usr/bin/git --git-dir=/home/celina/.cfg/ --work-tree=/home/celina'
