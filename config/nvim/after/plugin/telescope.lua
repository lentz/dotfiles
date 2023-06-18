local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close, -- don't go into normal mode, just close
        ["<C-u>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
})

vim.opt.autochdir = true
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
