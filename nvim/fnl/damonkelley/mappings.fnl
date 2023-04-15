(module damonkelley.mappings
  {autoload {telescope telescope.builtin}})

(vim.keymap.set "n" "<Space>f" ":Telescope fd<Enter>")
(vim.keymap.set "n" "<Space>*" ":Telescope grep_string<CR>")
(vim.keymap.set "n" "<Space>/" (fn []
                                (vim.ui.input
                                  {:prompt "Grep> "}
                                  (fn [value] (telescope.grep_string {:search value})))))

(vim.keymap.set "n" "<Space>gs" ":LazyGit<CR>")
                                 
