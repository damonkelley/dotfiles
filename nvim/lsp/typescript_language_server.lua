-- TypeScript Language Server
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server"

return {
  cmd = { mason_bin, '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = {
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git',
  },
  init_options = {
    hostInfo = 'neovim',
  },
}
