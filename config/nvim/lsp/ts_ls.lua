return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'typescript' },
  root_markers = { 'tsconfig.json', 'package.json', '.git' },
}
