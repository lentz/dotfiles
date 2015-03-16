" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Leader
let mapleader = " "

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

set nobackup
set nowritebackup
set noswapfile

set showcmd
set laststatus=2
set autowrite

" Set hidden characters for list mode
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Show additional lines when on the last line
set scrolloff=1
set sidescrolloff=5
set display+=lastline

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Use 2 spaces for all indentation
set tabstop=2
set shiftwidth=2
set expandtab
set number

set ignorecase
set smartcase
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

map q <nop>
inoremap jk <Esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
