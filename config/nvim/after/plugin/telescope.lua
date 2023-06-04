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

vim.keymap.set('n', '<C-p>',  '<cmd>Telescope git_files<cr>')
