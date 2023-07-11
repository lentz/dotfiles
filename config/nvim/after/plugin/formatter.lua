local util = require('formatter.util')

local terraformFormat = function()
  return {
    exe = 'terraform',
    args = {
      'fmt',
      '-'
    },
    no_append = true,
    stdin = true,
  }
end

require('formatter').setup({
  filetype = {
    css = { require('formatter.filetypes.css').prettierd },
    hcl = terraformFormat,
    html = { require('formatter.filetypes.html').prettierd },
    javascript = { require('formatter.filetypes.typescript').prettierd },
    json = { require('formatter.filetypes.json').prettierd },
    markdown = { require('formatter.filetypes.markdown').prettierd },
    scss = { require('formatter.filetypes.css').prettierd },
    terraform = terraformFormat,
    ['terraform-vars'] = terraformFormat,
    typescript = { require('formatter.filetypes.typescript').prettierd },
    yaml = { require('formatter.filetypes.yaml').prettierd },
  },
})

local augroup = vim.api.nvim_create_augroup('FormatAutogroup', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'FormatWrite',
  group = augroup,
})
