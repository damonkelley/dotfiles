local opt = vim.opt

opt.colorcolumn = "80"
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.number=true
opt.relativenumber = true

opt.wrap=false

opt.exrc = true

opt.listchars={
  eol = '↲',
  tab = '▶▹',
  nbsp = '␣',
  extends = '…',
  trail = '•',
  lead = '•',
}

opt.inccommand  = "split"

opt.hidden = true

opt.termguicolors = true

vim.g.python3_host_prog='/usr/local/bin/python3'
vim.python_host_prog='/usr/local/bin/python'

vim.g.vimsyn_embed = 'l' -- Syntax highlighing for embedded vimscript

opt.wildignore:append({"*.o", "*~", "*.pyc", "*pycache*" })
