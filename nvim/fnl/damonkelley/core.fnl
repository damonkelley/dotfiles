(module damonkelley.core
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(set nvim.o.inccommand :split)
(set nvim.o.colorcolumn 80)
(set nvim.o.tabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.softtabstop 4)
(set nvim.o.expandtab true)
(set nvim.o.ignorecase true)
(set nvim.o.smartcase true)
(set nvim.o.number true)
(set nvim.o.relativenumber true)
(set nvim.o.wrap false)
(set nvim.o.hidden true)
(set nvim.o.termguicolors true)

(vim.cmd.colorscheme "tokyonight")
