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

vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
  'https://github.com/ellisonleao/gruvbox.nvim',
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/numToStr/Navigator.nvim',
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
})

vim.cmd.colorscheme('gruvbox')
