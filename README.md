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
#### Requirements
* [bash](https://www.gnu.org/software/bash/)

#### Features
* `ls` and `man` commands use colored highlighting
* interactive bash session prints a gay pride flag at the start
* colored bash prompt with git branch indicator

### VIM
#### Requirements
* [vim](https://www.vim.org/)
* [Vundle](https://github.com/VundleVim/Vundle.vim) (plugin manager)
* [NERDTree](https://github.com/preservim/nerdtree) (file explorer)
* [buftabline](https://github.com/ap/vim-buftabline) (buffers shown as tabs)

#### Features
* NERDTree opens on startup, closes when using `:q` or similar
* line numbering
* move single lines (or blocks of lines in visual mode) using [ALT]-[UP] and [ALT]-[DOWN]
* smart indentation, auto indentation, tab being two spaces
* in visual and normal mode, (un-)indent with [TAB] and [SHIFT]-[TAB], respectively
* normal mode: switch between buffers using [SHIFT]-[LEFT] and [SHIFT]-[RIGHT]
* normal mode: switch between windows using [CTRL]-[SHIFT]-[LEFT] and [CTRL]-[SHIFT]-[RIGHT]
* misc
