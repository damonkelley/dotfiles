return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
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
            })
        end
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
}
