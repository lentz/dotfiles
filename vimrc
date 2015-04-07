" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Leader
let mapleader = ","

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Save files on focus lost and allow hidden buffers
au FocusLost * :wa
set autowriteall
set autoread
set hidden

" Don't create backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Set hidden characters for list mode
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Don't wrap lines
set nowrap

" Show additional lines when on the last line
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set showcmd
set laststatus=2

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

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

set history=1000
set undolevels=1000

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set gdefault
set hlsearch
nmap <silent> <leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %

" Key mappings

" Prevent recording when trying to quit
map q <nop>
inoremap jk <Esc>
nnoremap ; :
set pastetoggle=<leader>p

" Strip trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Insert blank lines above/below
nnoremap <silent> ]<Space> :<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
nnoremap <silent> [<Space> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Don't skip over wrapped lines when moving
nnoremap j gj
nnoremap k gk

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set wildignore=*/log/*,*/tmp/*

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Powerline fonts for status bar icons
let g:airline_powerline_fonts = 1

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

