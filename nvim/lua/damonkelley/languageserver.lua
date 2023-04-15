local _2afile_2a = "nvim/fnl/damonkelley/languageserver.fnl"
local _2amodule_name_2a = "damonkelley.languageserver"
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
local lsp, lspconfig, mason_null_ls, nvim = autoload("lsp-zero"), autoload("lspconfig"), autoload("mason-null-ls"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["lsp"] = lsp
_2amodule_locals_2a["lspconfig"] = lspconfig
_2amodule_locals_2a["mason-null-ls"] = mason_null_ls
_2amodule_locals_2a["nvim"] = nvim
lsp.preset({name = "recommended"})
local function _1_(_, buffer_number)
  _G.assert((nil ~= buffer_number), "Missing argument buffer-number on /Users/damonkelley/dotfiles/nvim/fnl/damonkelley/languageserver.fnl:11")
  return lsp.default_keymaps({buffer = buffer_number})
end
lsp.on_attach(_1_)
lsp.set_sign_icons({error = "\226\156\152", warn = "\226\150\178", hint = "\226\154\145", info = "\194\187"})
vim.keymap.set("n", "<M-Enter>", vim.lsp.buf.code_action)
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
mason_null_ls.setup({automatic_setup = true})
return _2amodule_2a