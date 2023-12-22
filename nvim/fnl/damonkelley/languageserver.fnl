(module damonkelley.languageserver
  { autoload {lsp lsp-zero
              : lspconfig
              : mason-null-ls
              : elixir
              nvim aniseed.nvim}})

(lsp.preset {:name :recommended})

(lsp.on_attach
  (lambda [_ buffer-number] (lsp.default_keymaps {:buffer buffer-number})))

(lsp.format_on_save {:format_opts {:async false :timeout_ms 30000} :servers {"ElixirLS" ["elixir" "heex"]}})

(lsp.set_sign_icons 
  {:error  "✘"
   :warn  "▲"
   :hint  "⚑"
   :info  "»"})

(vim.keymap.set "n" "<M-Enter>" vim.lsp.buf.code_action)

(lspconfig.lua_ls.setup (lsp.nvim_lua_ls))

; Skip the default elixirls server and perfer elixir-tools
(lsp.skip_server_setup ["elixirls"])

(lsp.setup)

(mason-null-ls.setup {:automatic_setup true})
  
(elixir.setup {:nextls {:enable  true}
               :credo  {:enable  true}
               :elixirls {:enable true
                          :settings (elixir.elixirls.settings
                                      {:enableTestLenses true
                                       :suggestSpecs true})}})
