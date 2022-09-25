vim.opt_local.shiftwidth = 2

vim.cmd([[
augroup localterrafor
  autocmd!
  au BufWritePre *.tf lua vim.lsp.buf.formatting_sync()
augroup end
]])

local current_buffer = 0

vim.keymap.set("i", "<C-x><C-o>", function()
	require("cmp").complete({ config = { sources = { { name = "nvim_lsp" } } } })
end, { buffer = current_buffer })

vim.api.nvim_buf_create_user_command(current_buffer, "Terraform", function(opts)
	vim.cmd([[botright vsplit | term terraform -chdir=%:h ]] .. opts.args)
	vim.cmd("startinsert")
end, { nargs = 1 })

vim.keymap.set("n", "<Enter>", "<Cmd>Terraform apply<CR>", { buffer = current_buffer })
