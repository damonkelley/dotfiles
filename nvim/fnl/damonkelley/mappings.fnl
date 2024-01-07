(local telescope (require :telescope.builtin))

(vim.keymap.set "n" "<Space>f" ":Telescope fd<Enter>")
(vim.keymap.set "n" "<Space>b" ":Telescope buffers<Enter>")
(vim.keymap.set "n" "<Space>*" ":Telescope grep_string<CR>")
(vim.keymap.set "n" "<Space>/" (fn []
                                (vim.ui.input
                                  {:prompt "Grep> "}
                                  (fn [value] (telescope.grep_string {:search value})))))

(vim.keymap.set "n" "<Space>gs" ":LazyGit<CR>")
                                 
(vim.keymap.set "n" "<Space>tn" ":TestNearest<CR>")
(vim.keymap.set "n" "<Space>tf" ":TestFile<CR>")
(vim.keymap.set "n" "<Space>tl" ":TestLast<CR>")
(vim.keymap.set "n" "<Space>ta" ":TestSuite<CR>")

(vim.keymap.set "n" "<Space>w" ":w<CR>")
(vim.keymap.set "n" "<Space>ev"
    (fn []
      (vim.cmd.edit (vim.fs.dirname (vim.fn.expand "$MYVIMRC")))))

(vim.keymap.set "n" "<F5>" vim.lsp.codelens.run)
