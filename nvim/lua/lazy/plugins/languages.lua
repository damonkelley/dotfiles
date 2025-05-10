return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
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
                "pkl",
                "markdown",
                "sql",
                "ruby",
                "just",
                "python",
                "yaml"
            },
            highlight = { enable = true },
            indent = { enable = true }
        }
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
}
