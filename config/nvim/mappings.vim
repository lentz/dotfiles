" Leader
let mapleader = ","

inoremap jk <Esc>
nnoremap ; :

" Key mappings
" Prevent recording when trying to quit
map q <nop>
" Disable Ex-mode
map Q <nop>

" Hide search highlighting
nmap <silent> <leader><space> :nohlsearch<CR>
nnoremap <tab> %
vnoremap <tab> %

" Close current buffer
nnoremap <leader>d :bd<CR>

" Strip trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Run Prettier on current buffer
nnoremap <leader>p :silent %!prettier --stdin-filepath %<CR>

" Ggrep whole project for the word under cursor
nnoremap <leader>g :Ggrep '<cword>'<CR>

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

" FZF
nnoremap <C-p> :GFiles<CR>
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
