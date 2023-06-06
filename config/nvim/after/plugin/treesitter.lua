require'nvim-treesitter.configs'.setup({
  ensure_installed = {
    'bash',
    'css',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
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
})
