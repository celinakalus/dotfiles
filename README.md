# dotfiles
Dotfile repository for all my configurations

Based on: [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## Installation
```Bash
git clone --bare https://git.rwth-aachen.de/celina.kalus/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

## Features
### Bash
* `ls` and `man` commands use colored highlighting
* interactive bash session prints a gay pride flag at the start
* colored bash prompt with git branch indicator
