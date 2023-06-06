require('settings')
require('mappings')

-- Use Lazy to manage plugins
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
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  'nvim-tree/nvim-web-devicons',
  { 'nvim-lualine/lualine.nvim', opts = { theme = 'gruvbox' } },
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-fugitive',
  'tpope/vim-unimpaired',
  'tpope/vim-surround',
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'numToStr/Navigator.nvim', config = true },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
    }
  },
})
