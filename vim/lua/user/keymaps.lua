vim.g.mapleader = " "
vim.g.maplocalleader = "\\\\"

vim.keymap.set("n", "<Leader>ev", function()
	require("telescope.builtin").find_files({ cwd = "~/.config/nvim" })
end, {})

vim.api.nvim_set_keymap("n", "<Leader>sv", ":so $MYVIMRC<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", {})
vim.api.nvim_set_keymap("n", "/", "/\\v", {})
vim.api.nvim_set_keymap("v", "/", "/\\v", {})
vim.api.nvim_set_keymap("n", "<Leader>\\", ":noh<CR>", {})

vim.api.nvim_set_keymap("n", "<Leader>gs", ":Neogit<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>gt", ":GitGutterLineHighlightsToggle<CR>", {})

vim.api.nvim_set_keymap("n", "<Leader>fa", ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>fr", ":Telescope git_files<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>mf", ":Telescope git_status<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", {})

vim.keymap.set("n", "<Leader>*", function()
	require("telescope.builtin").grep_string()
end, { silent = true })

vim.keymap.set("n", "<Leader>!", function()
	require("telescope.builtin").live_grep()
end, { silent = true })

vim.keymap.set("n", "<Leader>/", function()
	vim.ui.input({ prompt = "Grep> " }, function(value)
		require("telescope.builtin").grep_string({ search = value })
	end)
end)

local current_buffer = 0

vim.api.nvim_create_user_command("OnEnter", function(opts)
    vim.keymap.set("n", "<Enter>",
      function()
        vim.cmd([[botright split | term ]] .. opts.args)
        vim.cmd("startinsert")
      end,
      { buffer = current_buffer }
  )
end, { nargs = 1 })

vim.api.nvim_create_user_command("Todo", function(opts)
  git_root = vim.fn.system("git rev-parse --show-toplevel")

  local trimmed_git_root = string.gsub(git_root, '%s+', '')

  vim.cmd("botright vsplit " ..  trimmed_git_root .. "/.git/todo.md")
end, { nargs = 0 })
