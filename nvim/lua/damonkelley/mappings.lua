local _2afile_2a = "nvim/fnl/damonkelley/mappings.fnl"
local _2amodule_name_2a = "damonkelley.mappings"
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
local telescope = autoload("telescope.builtin")
do end (_2amodule_locals_2a)["telescope"] = telescope
vim.keymap.set("n", "<Space>f", ":Telescope fd<Enter>")
vim.keymap.set("n", "<Space>*", ":Telescope grep_string<CR>")
local function _1_()
  local function _2_(value)
    return telescope.grep_string({search = value})
  end
  return vim.ui.input({prompt = "Grep> "}, _2_)
end
vim.keymap.set("n", "<Space>/", _1_)
vim.keymap.set("n", "<Space>gs", ":LazyGit<CR>")
return _2amodule_2a