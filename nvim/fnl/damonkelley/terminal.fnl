(local terminal (require :toggleterm.terminal))

(local shell (terminal.Terminal:new {:direction "float"
                                     :float_opts {:border "double"}
                                     :on_open (fn [term]
                                                (do
                                                  (vim.cmd "startinsert!")
                                                  (vim.keymap.set "n" "q" "<cmd>close<CR>" {:noremap true :silent true :buffer term.bufnr})
                                                  (vim.keymap.set "t" "<Esc>" "<C-\\><C-n>" {:noremap true :silent true :buffer term.bufnr})
                                                  (vim.keymap.set "n" "<Esc>" "<cmd>close<CR>" {:noremap true :silent true :buffer term.bufnr})))
                                     :on_close (fn [_term] (vim.cmd "startinsert!"))}))

(vim.keymap.set "n" "<Space>tt" #(shell:toggle) {:noremap true :silent true})
