local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
  'angularls',
  'cssls',
  'jsonls',
  'tsserver',
})

require'lspconfig'.angularls.setup({})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»',
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true })
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = true })
end)

lsp.setup()
