return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "elixir",
                    "html",
                    "heex",
                    "vimdoc",
                    "json",
                    "lua",
                    "fennel",
                    "clojure",
                    "bash",
                    "java",
                    "kotlin",
                    "markdown_inline",
                    "markdown",
                    "sql",
                    "ruby",
                    "just",
                    "python",
                    "yaml",
                    "typescript",
                    "tsx",
                    "javascript",
                },
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
}
