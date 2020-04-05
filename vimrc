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
set list

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

set history=1000
set undolevels=1000

" Enable spell check and completion for prose and commit messages
autocmd FileType gitcommit,md,markdown,text setlocal spell
set complete+=kspell
set spelllang=en_us

" Searching
set ignorecase
set smartcase
set incsearch
set gdefault
set hlsearch
nmap <silent> <leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %

" Netrw
let g:netrw_banner=0 " Hide banner
let g:netrw_liststyle=3 " Tree browsing

" Key mappings
" Prevent recording when trying to quit
map q <nop>
" Disable Ex-mode
map Q <nop>
inoremap jk <Esc>
nnoremap ; :

" Close current buffer
nnoremap <leader>d :bd<CR>

" Strip trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Run rubocop on current buffer
nnoremap <leader>r :!clear && bundle exec rubocop -a %<CR>

" Run Prettier on current buffer
nnoremap <leader>p :silent %!prettier --stdin-filepath %<CR>

" Ggrep whole project for the word under cursor
nnoremap <leader>g :Ggrep '<cword>'<CR>

" RSpec.vim mappings
autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" Javascript linting and testing
autocmd FileType javascript nnoremap <leader>l :!clear && eslint %<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Don't skip over wrapped lines when moving
nnoremap j gj
nnoremap k gk

" Fugitive shortcuts
nnoremap <leader>gls :Git ls<CR>

set wildignore+=*/log/*,*/tmp/*,*/.bundle/*,*/node_modules/*,*/coverage/*,*/dist/*
let g:ctrlp_show_hidden = 1

" Set HTML syntax for handlebars templates
autocmd BufNewFile,BufRead *.handlebars set syntax=html

" Color scheme
syntax enable
set background=dark
colorscheme solarized

set colorcolumn=110

" Powerline fonts for status bar icons
let g:airline_powerline_fonts = 1

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

