
vim.opt.foldmethod="expr"
vim.opt.foldexpr=vim.fn["nvim_treesitter#foldexpr"]()

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",

  context_commentstring = {
    enable = true
  },

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },
}
