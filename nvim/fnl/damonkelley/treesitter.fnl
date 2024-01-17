(local configs (require :nvim-treesitter.configs))

(configs.setup {:ensure_installed ["elixir"
                                    "html"
                                    "heex"
                                    "vimdoc"
                                    "lua"
                                    "fennel"
                                    "bash"
                                    "yaml"]
                                   
                 :highlight {:enable true}})
