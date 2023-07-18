-- Save files on focus lost and allow hidden buffer
vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'wa'
})
vim.opt.autowriteall = true
vim.opt.autoread = true

-- Don't create backup files
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.clipboard = 'unnamedplus' -- Sync clipboard with system
vim.opt.cursorline = true -- Highlight current line
vim.opt.list = true -- Set hidden characters for list mode
vim.opt.wrap = false -- Don't wrap lines
vim.opt.backspace = 'indent,eol,start' -- Make backspace behave in a sane manner
vim.opt.signcolumn = 'number' -- Show errors in line number column instead of a new column
vim.opt.colorcolumn = '110' -- Show vertical line for wrapping guide
vim.opt.diffopt = 'vertical,linematch:60' -- Default to vertical diffs and improve diff output
vim.opt.wildmode = { 'list:longest', 'list:full' } -- complete files like a shell
vim.opt.updatetime = 300 -- Avoid delay of default 4s update time
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.number = true

-- Show additional lines when on the last line
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
table.insert(vim.opt.display, 'lastline')
vim.opt.laststatus = 2

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable unused Neovim providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Manual filetype detection
vim.filetype.add({
  extension = {
    tfbackend = 'terraform',
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
  },
})

-- Enable spell check and completion for prose and commit messages
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'gitcommit', 'md', 'markdown', 'text' },
  command = 'setlocal spell'
})
table.insert(vim.opt.complete, 'kspell')
