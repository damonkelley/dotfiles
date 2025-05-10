local fzf = require("fzf-lua")

vim.keymap.set("n", "<Space>w", ":w<CR>")

vim.keymap.set("n", "<Space>ev", function()
    fzf.files { cwd = vim.fs.dirname(vim.fn.expand("$MYVIMRC")) }
end)
