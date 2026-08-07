return {
  cmd = { 'tsc', '--lsp', '--stdio' },
  filetypes = { 'javascript', 'typescript' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
}
