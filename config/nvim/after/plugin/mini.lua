require('mini.basics').setup()

require('mini.icons').setup()

require('mini.statusline').setup()

require('mini.surround').setup()

require('mini.pairs').setup()

require('mini.bracketed').setup()

require('mini.comment').setup()

require('mini.files').setup()
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', { desc = 'File explorer' })

require('mini.extra').setup()

require('mini.pick').setup({
  mappings = {
    move_down  = '<C-j>',
    move_up    = '<C-k>',
  }
})
vim.keymap.set('n', '<C-p>', '<cmd>Pick git_files<cr>', { desc = 'Search tracked files' })
vim.keymap.set('n', '<leader>d', '<cmd>Pick diagnostic scope="current"<cr>', { desc = 'Search diagnostics' })

require('mini.diff').setup()

require('mini.git').setup()

require('mini.completion').setup()
