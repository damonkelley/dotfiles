vim.g.mapleader = " "
vim.g.maplocalleader = "\\\\"

vim.api.nvim_set_keymap('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>sv', ':so $MYVIMRC<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', {})
vim.api.nvim_set_keymap('n', '/', "/\\v", {})
vim.api.nvim_set_keymap('v', '/', "/\\v", {})
vim.api.nvim_set_keymap('n', '<Leader>\\', ":noh<CR>", {})

vim.api.nvim_set_keymap('n', '<Leader>gs', ':Neogit<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gt', ':GitGutterLineHighlightsToggle<CR>', {})

vim.api.nvim_set_keymap('n', '<Leader>fa', ':Telescope find_files<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fr', ':Telescope git_files<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>mf', ':Telescope git_status<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', {})

vim.api.nvim_set_keymap('n', '<Leader>*', ':Telescope grep_string<CR>', { silent = true})
vim.api.nvim_set_keymap('n', '<Leader>/', ':Telescope live_grep prompt_prefix=🔍>  <CR>', { silent = true})
