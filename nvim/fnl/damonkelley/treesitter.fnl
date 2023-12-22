(module damonkelley.treesitter
  {autoload {configs nvim-treesitter.configs}})

(configs.setup {:ensure_installed ["elixir"
                                   "html"
                                   "heex"
                                   "lua"]
                                   
                :highlight {:enable true}})
