" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Save files on focus lost and allow hidden buffers
au FocusLost * :wa
set autowriteall
set autoread

" Don't create backup files
set nobackup
set nowritebackup

" Set hidden characters for list mode
set list

" Don't wrap lines
set nowrap

" Show additional lines when on the last line
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set laststatus=2

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

" Enable spell check and completion for prose and commit messages
autocmd FileType gitcommit,md,markdown,text setlocal spell
set complete+=kspell
set spelllang=en_us

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Netrw tree browsing
let g:netrw_liststyle=3

set wildignore+=*/log/*,*/tmp/*,*/node_modules/*,*/coverage/*,*/dist/*,*/vendor/bundle/*

" Default to vertical diffs
set diffopt=vertical

syntax enable
set colorcolumn=110

let g:loaded_perl_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0

" Vim Plug plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Source external config
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/gruvbox.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/vim-airline.vim
