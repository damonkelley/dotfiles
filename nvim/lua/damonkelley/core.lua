local _2afile_2a = "nvim/fnl/damonkelley/core.fnl"
local _2amodule_name_2a = "damonkelley.core"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, nvim = autoload("aniseed.core"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
nvim.o.inccommand = "split"
nvim.o.colorcolumn = 80
nvim.o.tabstop = 4
nvim.o.shiftwidth = 4
nvim.o.softtabstop = 4
nvim.o.expandtab = true
nvim.o.ignorecase = true
nvim.o.smartcase = true
nvim.o.number = true
nvim.o.relativenumber = true
nvim.o.wrap = false
nvim.o.hidden = true
nvim.o.termguicolors = true
vim.cmd.colorscheme("tokyonight")
return _2amodule_2a