require('conform').setup({
  formatters_by_ft = {
    css = { 'biome' },
    html = { 'biome' },
    javascript = { 'biome' },
    json = { 'biome' },
    -- markdown = { 'prettier' },
    scss = { 'biome' },
    typescript = { 'biome' },
    -- yaml = { 'prettier' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})
