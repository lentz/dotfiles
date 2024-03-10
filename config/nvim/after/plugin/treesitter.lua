require'nvim-treesitter.configs'.setup({
  ensure_installed = {
    'bash',
    'dockerfile',
    'hcl',
    'html',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'scss',
    'typescript',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
      },
    },
  },
})

vim.treesitter.language.register('hcl', 'terraform')
vim.treesitter.language.register('hcl', 'terraform-vars')
