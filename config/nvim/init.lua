require('settings')
require('mappings')
pcall(require, 'local') -- lua/local.lua if it exists

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
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      inactive_sections = {
        lualine_c = { { 'filename', path = 2 } },
      },
      sections = {
        lualine_c = { { 'filename', path = 2 } },
        lualine_x = { 'filetype' },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
  },
  'tpope/vim-fugitive',
  'tpope/vim-unimpaired',
  'tpope/vim-surround',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
  },
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
      {'jose-elias-alvarez/null-ls.nvim'},
    }
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require('nvim-tree').setup()
    end,
  },
  { 'numToStr/Comment.nvim', config = true },
})
