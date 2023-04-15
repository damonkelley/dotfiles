(module damonkelley.languageserver
  { autoload {lsp lsp-zero
              : lspconfig
              : mason-null-ls
              nvim aniseed.nvim}})

(lsp.preset {:name :recommended})

(lsp.on_attach
  (lambda [_ buffer-number] (lsp.default_keymaps {:buffer buffer-number})))

(lsp.set_sign_icons 
  {:error  "✘"
   :warn  "▲"
   :hint  "⚑"
   :info  "»"})

(vim.keymap.set "n" "<M-Enter>" vim.lsp.buf.code_action)

(lspconfig.lua_ls.setup (lsp.nvim_lua_ls))

(lsp.setup)

(mason-null-ls.setup {:automatic_setup true})
