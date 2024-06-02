(local configs (require :nvim-treesitter.configs))

(configs.setup {:ensure_installed ["elixir"
                                    "html"
                                    "heex"
                                    "vimdoc"
                                    "lua"
                                    "fennel"
                                    "clojure"
                                    "bash"
                                    "java"
                                    "kotlin"
                                    "yaml"]
                 :highlight {:enable true}})
