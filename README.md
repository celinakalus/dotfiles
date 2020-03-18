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

### zsh
#### Requirements
* [zsh](https://www.zsh.org/)

#### Features
* `ls` and `man` commands use colored highlighting
* colored zsh prompt with git branch indicator

### Xorg
#### Requirements
* [Xorg](https://www.x.org/wiki/)
* [Xbindkeys](https://www.nongnu.org/xbindkeys/)

#### Features
* Notifications for Volume Up/Down
* Notifications for Brightness Up/Down
* Play/Pause/Next/Previous work

### i3
#### Requirements
* [i3](https://i3wm.org/)
* [i3blocks](https://github.com/vivien/i3blocks)
* [rofi](https://github.com/davatorium/rofi)
* [gnome-terminal](https://directory.fsf.org/wiki/Gnome-terminal)

#### Features
* status bar showing memory usage, network connection, volume, display brightness, power status, date and time
* clicking on date and time opens up a rofi-based calender

#### Keybinds
* `[SUPER]+[D]`: Open up dmenu to start applications
* `[SUPER]+[ENTER]`: Open up a (gnome) terminal
* `[SUPER]+[SHIFT]+[Q]`: Close focused window
* `[SUPER]+[ARROW]`: Move focus between windows
* `[SUPER]+[SHIFT]+[ARROW]`: Move focused window around
* `[SUPER]+[SPACE]`: Change focus between floating/tiling windows
* `[SUPER]+[SHIFT]+[SPACE]`: Toggle floating/tiling for focused window
* `[SUPER]+[H/V]`: Split windows horizontally/vertically
* `[SUPER]+[F]`: Toggle fullscreen for focused window
* `[SUPER]+[S/W/E]`: Change container layout (stacked, tabbed, toggle split)
* `[SUPER]+[PAGE_UP/PAGE_DOWN]`: Change focus to parent/child
* `[SUPER]+[NUM]`: Switch to workspace with the number `NUM`
* `[SUPER]+[SHIFT]+[NUM]`: Move focused window to workspace with the number `NUM`
* `[SUPER]+[R]`: Enter resize mode where you can use arrow keys to resize the window
* `[SUPER]+[SHIFT]+[C/R]`: Reload config/Restart i3 inplace
* `[SUPER]+[SHIFT]+[X]`: Open shutdown menu
* `[SUPER]+[PRINT]`: Take a screenshot (saved to `$HOME`)

### VIM
#### Requirements
* [vim](https://www.vim.org/)
* [Vundle](https://github.com/VundleVim/Vundle.vim) (plugin manager)
* [NERDTree](https://github.com/preservim/nerdtree) (file explorer)
* [buftabline](https://github.com/ap/vim-buftabline) (buffers shown as tabs)

#### Features
* NERDTree opens on startup, closes when using `:q` or similar
* buffers shown as tabs at the very top of the window
* line numbering
* smart indentation, auto indentation, tab being two spaces
* misc

#### Keybinds
* `[TAB]`/`[SHIFT]+[TAB]`: (Un-)Indent in visual and normal mode
* `[SHIFT]+[LEFT/RIGHT]`: Switch between buffers in normal mode
* `[CTRL]+[SHIFT]+[LEFT/RIGHT]`: Switch between windows in normal mode
* `[ALT]+[UP/DOWN]`: Move single lines (normal mode) or blocks of lines (visual mode) up or down

### Dunst
#### Requirements
* [dunst](https://dunst-project.org/)

#### Features
* grey/black color scheme
