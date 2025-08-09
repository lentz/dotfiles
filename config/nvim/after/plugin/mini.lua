require('mini.basics').setup()

require('mini.icons').setup()

require('mini.statusline').setup({
  content = {
    active = function ()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local git           = ' ' .. vim.fn.system('git branch --show-current 2>/dev/null'):gsub('\n', '')
      local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
      local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75, signs = { ERROR = '✘', WARN = '▲', INFO = '»', HINT = '⚑' } })
      local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location      = MiniStatusline.section_location({ trunc_width = 75 })
      local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl,                  strings = { mode } },
        { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl,                  strings = { search, location } },
      })
    end,
  }
})

require('mini.surround').setup()

require('mini.pairs').setup()

require('mini.bracketed').setup()

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

require('mini.completion').setup()
