vim.opt.inccommand = "split"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.exrc = true
vim.opt.autoread = true

vim.cmd.colorscheme("rose-pine")

vim.o.foldmethod = "expr"                   -- When foldmethod is expr, foldexpr is run
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()" -- this function is executed for every line in the buffer
vim.o.foldlevelstart = 99                   -- No folds closed to start
vim.opt.foldtext = ""                       -- Make the first line of the fold syntax highlighted

