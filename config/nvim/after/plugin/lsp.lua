local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true })
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = true })
end)

lsp.ensure_installed({
  'angularls',
  'tsserver',
})

require'lspconfig'.angularls.setup({})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»',
})

lsp.setup()
