" ===== VUNDLE =====
:set nocompatible
:filetype off

:set rtp+=~/.vim/bundle/Vundle.vim
:call vundle#begin()

:Plugin 'VundleVim/Vundle.vim'

" ===== PLUGINS =====

" NERDTree: tree view explorer
:Plugin 'preservim/nerdtree'

" buftabline: displays all buffers in the tabline
:Plugin 'ap/vim-buftabline'

" rust.vim: adds rust support to vim
:Plugin 'rust-lang/rust.vim'

:call vundle#end()

" required for rust.vim plugin
:syntax enable
:filetype plugin indent on

" ===== NERDTREE =====
" always open on startup
:autocmd vimenter * NERDTree
:autocmd vimenter * if argc() > 0 | wincmd p | endif
:autocmd FileReadPre * i

" always close NERDTree on q
:autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

:let NERDTreeAutoDeleteBuffer = 1
:let NERDTreeMinimalUI = 1
:let NERDTreeDirArrows = 1
:let NERDTreeShowHidden = 1

" ===== MISC =====
:set number
:set ruler

:set backspace=indent,eol,start

" moving lines with [ALT]-[UP] and [ALT]-[DOWN]
:nnoremap <A-UP> :m .-2<CR>
:nnoremap <A-DOWN> :m .+1<CR>
:inoremap <A-UP> <ESC>:m .-2<CR>gi
:inoremap <A-DOWN> <ESC>:m .+1<CR>gi
:vnoremap <A-UP> :m '<-2<CR>gv
:vnoremap <A-DOWN> :m '>+1<CR>gv

" ===== INDENTATION =====
:set autoindent
:set smartindent
:set smarttab
:set shiftwidth=2
:set softtabstop=2
:set tabstop=2
:set expandtab

" auto-indent pasted text
":nnoremap p p=`]<C-o>
":nnoremap P P=`]<C-o>

" (un-)indent with [TAB]
:vnoremap <TAB> > <ESC>gv
:vnoremap <S-TAB> < <ESC>gv
:nnoremap <TAB> >>
:nnoremap <S-TAB> <<

:set nowrap

" ===== BUFFERS =====
:set hidden

" switching between buffers like tabs
:nnoremap <C-RIGHT> :bnext<CR>
:nnoremap <C-LEFT> :bprevious<CR>
:inoremap <C-RIGHT> <ESC>:bnext<CR>gi
:inoremap <C-LEFT> <ESC>:bprevious<CR>gi

" closing buffers
:command Quit bn | bd #
:command Wq w|Q

" ===== WINDOWS =====
" switching between windows
:nnoremap <C-S-RIGHT> :wincmd l<CR>
:nnoremap <C-S-LEFT> :wincmd h<CR>
:nnoremap <C-S-UP> :wincmd k<CR>
:nnoremap <C-S-DOWN> :wincmd j<CR>

" ===== FOLDING =====
:set foldmethod=indent
:set foldnestmax=3
:set nofoldenable

" ===== SCROLLING =====
:set scrolloff=8
:set sidescrolloff=15
:set sidescroll=1

" ===== STATUSBAR =====
:set laststatus=2

