vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'q', '<nop>') -- Prevent recording when trying to quit
vim.keymap.set('n', 'Q', '<nop>') -- Disable Ex-mode
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>') -- Hide search highlighting
vim.keymap.set('n', '<leader>d', ':bd<CR>') -- Close current buffer
vim.keymap.set('n', '<leader>g', "<cmd>Ggrep <cword><CR>" ) -- grep whole project for the word under cursor

-- Quicker window movement
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
