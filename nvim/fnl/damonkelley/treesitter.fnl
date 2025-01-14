(local configs (require :nvim-treesitter.configs))

(configs.setup {:ensure_installed ["elixir"
                                    "html"
                                    "heex"
                                    "vimdoc"
                                    "json"
                                    "lua"
                                    "fennel"
                                    "clojure"
                                    "bash"
                                    "java"
                                    "kotlin"
                                    "markdown_inline"
                                    "pkl"
                                    "markdown"
                                    "sql"
                                    "ruby"
                                    "just"
                                    "python"
                                    "yaml"]
                 :highlight {:enable true}
                 :indent {:enable true}})
