; (local lsp (require :lsp-zero))
; (local lspconfig (require :lspconfig))
; (local mason-lspconfig (require :mason-lspconfig))
(local elixir (require :elixir))
; (local cmp (require :cmp))

; (mason-lspconfig.setup {:ensure_installed ["lua_ls" "fennel_language_server"]})

; (lsp.preset {:name :recommended})

; (lsp.on_attach
;   (lambda [_ buffer-number] (lsp.default_keymaps {:buffer buffer-number})))

; (lsp.format_on_save {:format_opts {:async false :timeout_ms 30000} :servers {"ElixirLS" ["elixir" "heex"]}})

; (lsp.set_sign_icons 
;   {:error  "✘"
;    :warn  "▲"
;    :hint  "⚑"
;    :info  "»"})

; (lspconfig.fennel_language_server.setup
;       {:settings
;           {:fennel
;               {:diagnostics
;                   {:globals ["vim"]}}}})

; (vim.keymap.set "n" "<M-Enter>" vim.lsp.buf.code_action)

; (lspconfig.lua_ls.setup (lsp.nvim_lua_ls))

; (lsp.setup)

(elixir.setup {:nextls {:enable  true
                        :init_options {:experimental {:completions {:enable true}}}}
               :credo  {:enable  false}
               :elixirls {:enable true
                          :tag "v0.18.1"
                          :settings (elixir.elixirls.settings
                                      {:enableTestLenses true
                                       :suggestSpecs true})}})
