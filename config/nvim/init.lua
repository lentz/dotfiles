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

-- Ensure Compose LSP attaches to Compose yaml files
vim.filetype.add({ filename = { ['compose.yaml'] = 'yaml.docker-compose' } })

-- Enable LSPs
vim.lsp.enable({ 'angularls', 'cssls', 'dockerls', 'docker_compose_language_service', 'jsonls', 'ts_ls' })

-- Customize diagnostic signs
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

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

-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { 'git', 'clone', '--filter=blob:none', '--branch', 'stable', 'https://github.com/echasnovski/mini.nvim', mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require('mini.deps').setup()

MiniDeps.add({ name = 'mini.nvim', checkout = 'stable' })

MiniDeps.add('ellisonleao/gruvbox.nvim')
vim.cmd.colorscheme('gruvbox')

MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter-textobjects',
  depends = { 'nvim-treesitter/nvim-treesitter' },
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})

MiniDeps.add('tpope/vim-fugitive')

MiniDeps.add('numToStr/Navigator.nvim')

MiniDeps.add('stevearc/conform.nvim')
