vim.g["test#preserve_screen"] = 0

vim.api.nvim_set_keymap('n', '<Leader>tn', ':TestNearest<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tf', ':TestFile<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>ta', ':TestSuite<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tl', ':TestLast<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<Leader>tg', ':TestVisit<CR>', {silent=true})
