-- General Settings
-- ----------------

-- Save files on focus lost and allow hidden buffer
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'wa'
})
vim.opt.autowriteall = true
vim.opt.autoread = true

vim.opt.clipboard = 'unnamedplus' -- Sync clipboard with system
vim.opt.signcolumn = 'number' -- Show errors in line number column instead of a new column
vim.opt.diffopt = 'vertical,linematch:60' -- Default to vertical diffs and improve diff output
vim.opt.updatetime = 300 -- Avoid delay of default 4s update time

-- Show additional lines when on the last line
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
table.insert(vim.opt.display, 'lastline')
vim.opt.laststatus = 2

-- Enable spell check and completion for prose and commit messages
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'md', 'markdown', 'text' },
  command = 'setlocal spell'
})
table.insert(vim.opt.complete, 'kspell')

-- Disable unused Neovim providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Mappings
-- --------

vim.g.mapleader = ','

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', 'q', '<nop>') -- Prevent recording when trying to quit
vim.keymap.set('n', 'Q', '<nop>') -- Disable Ex-mode
vim.keymap.set('n', '<leader><space>', ':nohlsearch<CR>') -- Hide search highlighting

-- Plugins
-- -------

-- Install Lazy if necessary to manage plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { 'echasnovski/mini.nvim', version = false },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
  },
  'tpope/vim-fugitive',
  { 'numToStr/Navigator.nvim', config = true },
  'neovim/nvim-lspconfig',
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup()
    end,
  },
  'stevearc/conform.nvim'
})
