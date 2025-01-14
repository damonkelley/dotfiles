(local fzf (require :fzf-lua))


(vim.keymap.set "n" "-" ":Oil<CR>")

(vim.keymap.set "n" "<Space>f" ":Fzf files<Enter>")
(vim.keymap.set "n" "<Space>b" ":Fzf buffers<Enter>")
(vim.keymap.set "n" "<Space>*" ":Fzf grep_cword<CR>")
(vim.keymap.set "v" "<Space>*" ":Fzf grep_visual<CR>")

(vim.keymap.set "n" "<Space>/" ":Fzf live_grep<CR>")
(vim.keymap.set "n" "<Space>h" ":Fzf helptags<CR>")

(vim.keymap.set "n" "<Space>gs" ":Neogit<CR>")
                                 
(vim.keymap.set "n" "<Space>tn" ":TestNearest<CR>")
(vim.keymap.set "n" "<Space>tf" ":TestFile<CR>")
(vim.keymap.set "n" "<Space>tl" ":TestLast<CR>")
(vim.keymap.set "n" "<Space>ta" ":TestSuite<CR>")

(vim.keymap.set "n" "<Space>w" ":w<CR>")
(vim.keymap.set "n" "<Space>ev" (fn [] 
                                  (fzf.files {:cwd (vim.fs.dirname (vim.fn.expand "$MYVIMRC"))})))

(vim.keymap.set "n" "<F5>" vim.lsp.codelens.run)
