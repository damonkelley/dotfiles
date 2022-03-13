---@diagnostic disable-next-line: unused-local
local function on_complete(id, code, event)
  vim.cmd([[echohl DiffAdd | echo "Tagging complete" | echohl None]])
end

M = {}

M.retag = function()
  local cmd = "ctags --tag-relative=yes -Rf" .. M.location
  local opts = {on_exit = on_complete}

  vim.fn.jobstart(cmd, opts)
end
M.setup = function(options)
  M.location = options.location

  vim.opt.tags:append(M.location)
  vim.api.nvim_set_keymap("n", "<Leader>rt", [[:lua require('tags').retag()<CR>]], {})
end

return M
