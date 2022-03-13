vim.api.nvim_set_keymap('t', "<C-\\>", "<C-\\><C-n>", {})

vim.cmd([[
  augroup myterminal
    au TermOpen * setlocal nonumber norelativenumber
  augroup END
]])
