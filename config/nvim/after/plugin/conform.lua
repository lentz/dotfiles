require('conform').setup({
  formatters_by_ft = {
    css = { 'prettier' },
    html = { 'prettier' },
    javascript = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
    scss = { 'prettier' },
    typescript = { 'prettier' },
    yaml = { 'prettier' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})
